-- =====================================================================
-- Closet Club — Módulo de acceso web SIN login por email
-- =====================================================================
-- La web se vincula al usuario del lente (Snapchat) mediante un token.
-- Las funciones corren con SECURITY DEFINER: validan el token y operan
-- sobre los datos del usuario dueño de ese token, sin sesión de email.
-- Ejecutar completo en el SQL Editor (después de schema.sql).
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. TABLA DE TOKENS DE VINCULACIÓN
-- ---------------------------------------------------------------------
create table if not exists public.web_tokens (
    token      text primary key,
    user_id    uuid not null references auth.users (id) on delete cascade,
    label      text not null default '',
    created_at timestamptz not null default now(),
    expires_at timestamptz
);

-- Sin políticas: nadie accede directo (solo las funciones de abajo).
alter table public.web_tokens enable row level security;

-- ---------------------------------------------------------------------
-- 2. FUNCIÓN INTERNA — resuelve token → user_id
-- ---------------------------------------------------------------------
create or replace function public.web_token_user(p_token text)
returns uuid
language sql
security definer
set search_path = public
stable
as $$
    select user_id from public.web_tokens
    where token = p_token
      and (expires_at is null or expires_at > now())
    limit 1;
$$;

-- ---------------------------------------------------------------------
-- 3. LECTURA — prendas y outfits del dueño del token
-- ---------------------------------------------------------------------
create or replace function public.web_get_items(p_token text)
returns setof public.closet_items
language sql
security definer
set search_path = public
stable
as $$
    select * from public.closet_items
    where user_id = public.web_token_user(p_token)
    order by saved_at desc;
$$;

create or replace function public.web_get_outfits(p_token text)
returns setof public.outfits
language sql
security definer
set search_path = public
stable
as $$
    select * from public.outfits
    where user_id = public.web_token_user(p_token)
    order by match_percent desc;
$$;

-- ---------------------------------------------------------------------
-- 4. ESCRITURA — favoritos y eliminación (solo desde la web)
-- ---------------------------------------------------------------------
create or replace function public.web_set_item_favorite(p_token text, p_id bigint, p_favorite boolean)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare v_user uuid;
begin
    v_user := public.web_token_user(p_token);
    if v_user is null then return false; end if;
    update public.closet_items set favorite = p_favorite
    where id = p_id and user_id = v_user;
    return found;
end;
$$;

create or replace function public.web_set_outfit_favorite(p_token text, p_id bigint, p_favorite boolean)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare v_user uuid;
begin
    v_user := public.web_token_user(p_token);
    if v_user is null then return false; end if;
    update public.outfits set favorite = p_favorite
    where id = p_id and user_id = v_user;
    return found;
end;
$$;

create or replace function public.web_delete_item(p_token text, p_id bigint)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare v_user uuid;
declare v_serial text;
begin
    v_user := public.web_token_user(p_token);
    if v_user is null then return false; end if;

    select serial into v_serial from public.closet_items
    where id = p_id and user_id = v_user;
    if v_serial is null then return false; end if;

    delete from public.closet_items where id = p_id and user_id = v_user;

    -- Limpieza best-effort de la imagen de la card en Storage
    delete from storage.objects
    where bucket_id = 'closet-images'
      and name = v_user::text || '/' || v_serial || '.jpg';

    return true;
end;
$$;

create or replace function public.web_delete_outfit(p_token text, p_id bigint)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare v_user uuid;
begin
    v_user := public.web_token_user(p_token);
    if v_user is null then return false; end if;
    delete from public.outfits where id = p_id and user_id = v_user;
    return found;
end;
$$;

-- ---------------------------------------------------------------------
-- 5. PERMISOS — la web (anon) solo puede llamar estas funciones
-- ---------------------------------------------------------------------
grant execute on function public.web_token_user(text) to anon;
grant execute on function public.web_get_items(text) to anon;
grant execute on function public.web_get_outfits(text) to anon;
grant execute on function public.web_set_item_favorite(text, bigint, boolean) to anon;
grant execute on function public.web_set_outfit_favorite(text, bigint, boolean) to anon;
grant execute on function public.web_delete_item(text, bigint) to anon;
grant execute on function public.web_delete_outfit(text, bigint) to anon;

-- ---------------------------------------------------------------------
-- 6. TOKEN DE FLORENCIA — vincula la web con el usuario del lente
--    (el único usuario existente: el que ya sincronizó su perfil)
-- ---------------------------------------------------------------------
insert into public.web_tokens (token, user_id, label)
select '606b2c4eed567d328ab483b6fa2526402d17e42140225a38', user_id, 'web personal Florencia'
from public.user_profiles
limit 1
on conflict (token) do nothing;
