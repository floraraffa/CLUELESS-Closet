-- =====================================================================
-- Closet Club — CLOSET PÚBLICO O PRIVADO
-- =====================================================================
-- El dueño decide desde la web si su closet es público (aparece en la
-- galería y cualquiera puede verlo) o privado (solo él lo ve, entrando
-- con su código). Ejecutar completo en el SQL Editor.
-- =====================================================================

-- 1. Columna de visibilidad (público por defecto, como hasta ahora)
alter table public.user_profiles
    add column if not exists is_public boolean not null default true;

-- 2. La galería solo lista closets públicos
create or replace function public.web_list_users()
returns table (user_id uuid, display_name text, item_count bigint, outfit_count bigint)
language sql security definer set search_path = public stable
as $$
    select p.user_id, p.display_name,
           (select count(*) from public.closet_items c where c.user_id = p.user_id),
           (select count(*) from public.outfits o where o.user_id = p.user_id)
    from public.user_profiles p
    where coalesce(p.is_public, true)
    order by p.updated_at desc;
$$;

-- 3. Lectura de un closet: si es privado, solo el dueño (con su código)
drop function if exists public.web_user_items(uuid);
create or replace function public.web_user_items(p_user uuid, p_token text default null)
returns setof public.closet_items
language sql security definer set search_path = public stable
as $$
    select c.* from public.closet_items c
    where c.user_id = p_user
      and ( coalesce((select pr.is_public from public.user_profiles pr where pr.user_id = p_user), true)
            or public.web_token_user(p_token) = p_user )
    order by c.saved_at desc;
$$;

drop function if exists public.web_user_outfits(uuid);
create or replace function public.web_user_outfits(p_user uuid, p_token text default null)
returns setof public.outfits
language sql security definer set search_path = public stable
as $$
    select o.* from public.outfits o
    where o.user_id = p_user
      and ( coalesce((select pr.is_public from public.user_profiles pr where pr.user_id = p_user), true)
            or public.web_token_user(p_token) = p_user )
    order by o.updated_at desc;
$$;

-- 4. El perfil del dueño ahora incluye la visibilidad
drop function if exists public.web_get_profile(text);
create or replace function public.web_get_profile(p_token text)
returns table (user_id uuid, display_name text, level integer, total_scans integer, is_public boolean)
language sql security definer set search_path = public stable
as $$
    select p.user_id, p.display_name, p.level, p.total_scans, coalesce(p.is_public, true)
    from public.user_profiles p
    where p.user_id = public.web_token_user(p_token);
$$;

-- 5. Cambiar la visibilidad (solo el dueño, con su código)
create or replace function public.web_set_visibility(p_token text, p_public boolean)
returns boolean
language plpgsql security definer set search_path = public
as $$
declare v_user uuid;
begin
    v_user := public.web_token_user(p_token);
    if v_user is null then return false; end if;
    update public.user_profiles set is_public = p_public where user_id = v_user;
    return found;
end;
$$;

grant execute on function public.web_list_users() to anon;
grant execute on function public.web_user_items(uuid, text) to anon;
grant execute on function public.web_user_outfits(uuid, text) to anon;
grant execute on function public.web_get_profile(text) to anon;
grant execute on function public.web_set_visibility(text, boolean) to anon;
