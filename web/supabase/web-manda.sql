-- =====================================================================
-- "LA WEB MANDA" — borrar en la web es definitivo
-- =====================================================================
-- 1) Arregla el borrado (la limpieza de imagen ya no lo deshace).
-- 2) Cada borrado web deja una "lápida"; el lente las consulta al
--    conectarse: no re-sube esas prendas y las elimina de los Specs.
-- (Incluye y reemplaza el fix-delete.sql anterior.)
-- =====================================================================

-- Lápidas de borrados hechos en la web
create table if not exists public.deleted_serials (
    user_id    uuid not null references auth.users (id) on delete cascade,
    serial     text not null,
    deleted_at timestamptz not null default now(),
    primary key (user_id, serial)
);
alter table public.deleted_serials enable row level security;

-- El lente (usuario autenticado) puede leer SUS lápidas
drop policy if exists "own tombstones select" on public.deleted_serials;
create policy "own tombstones select" on public.deleted_serials
    for select using (auth.uid() = user_id);

-- Borrado definitivo: elimina + registra lápida + limpia imagen (best-effort)
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

    insert into public.deleted_serials (user_id, serial)
    values (v_user, v_serial)
    on conflict do nothing;

    begin
        delete from storage.objects
        where bucket_id = 'closet-images'
          and name = v_user::text || '/' || v_serial || '.jpg';
    exception when others then
        null;
    end;

    return true;
end;
$$;
