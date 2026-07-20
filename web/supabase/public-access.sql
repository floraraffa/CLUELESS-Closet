-- =====================================================================
-- Closet Club — Modo vitrina PÚBLICO (solo lectura)
-- =====================================================================
-- Cualquiera con el link ve el catálogo; editar (favoritos/eliminar)
-- sigue requiriendo el código de vinculación de la dueña.
-- Ejecutar en el SQL Editor (después de schema.sql y web-access.sql).
-- =====================================================================

create or replace function public.web_public_items()
returns setof public.closet_items
language sql
security definer
set search_path = public
stable
as $$
    select * from public.closet_items
    where user_id = (select user_id from public.user_profiles limit 1)
    order by saved_at desc;
$$;

create or replace function public.web_public_outfits()
returns setof public.outfits
language sql
security definer
set search_path = public
stable
as $$
    select * from public.outfits
    where user_id = (select user_id from public.user_profiles limit 1)
    order by match_percent desc;
$$;

grant execute on function public.web_public_items() to anon;
grant execute on function public.web_public_outfits() to anon;
