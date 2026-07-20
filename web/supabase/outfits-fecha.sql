-- Outfits ordenados por fecha: los más recientes primero.
create or replace function public.web_user_outfits(p_user uuid)
returns setof public.outfits
language sql security definer set search_path = public stable
as $$
    select * from public.outfits
    where user_id = p_user
    order by updated_at desc;
$$;

create or replace function public.web_get_outfits(p_token text)
returns setof public.outfits
language sql security definer set search_path = public stable
as $$
    select * from public.outfits
    where user_id = public.web_token_user(p_token)
    order by updated_at desc;
$$;
