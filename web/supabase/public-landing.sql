-- =====================================================================
-- Closet Club — GALERÍA PÚBLICA de closets
-- =====================================================================
-- Landing abierta: lista de usuarios con su Bitmoji y "Closet de X".
-- Cualquiera puede VER los closets; editar sigue requiriendo el código
-- personal del dueño. Ejecutar en el SQL Editor.
-- =====================================================================

-- 1. Lista pública de usuarios (para la landing)
create or replace function public.web_list_users()
returns table (user_id uuid, display_name text, item_count bigint, outfit_count bigint)
language sql
security definer
set search_path = public
stable
as $$
    select p.user_id,
           p.display_name,
           (select count(*) from public.closet_items c where c.user_id = p.user_id),
           (select count(*) from public.outfits o where o.user_id = p.user_id)
    from public.user_profiles p
    order by p.updated_at desc;
$$;

-- 2. Closet de un usuario, por id (solo lectura pública)
create or replace function public.web_user_items(p_user uuid)
returns setof public.closet_items
language sql
security definer
set search_path = public
stable
as $$
    select * from public.closet_items
    where user_id = p_user
    order by saved_at desc;
$$;

create or replace function public.web_user_outfits(p_user uuid)
returns setof public.outfits
language sql
security definer
set search_path = public
stable
as $$
    select * from public.outfits
    where user_id = p_user
    order by match_percent desc;
$$;

grant execute on function public.web_list_users() to anon;
grant execute on function public.web_user_items(uuid) to anon;
grant execute on function public.web_user_outfits(uuid) to anon;

-- 4. Corrige tu nombre visible: decía "Preview 1" porque el editor de
--    Lens Studio sincronizó su usuario simulado (el lente ya fue
--    parcheado para no volver a pisarlo). Cambiá el nombre si preferís otro:
update public.user_profiles set display_name = 'Florencia Raffa'
where user_id = 'b559ec80-1242-424b-8eeb-f20ff104fd7b';
