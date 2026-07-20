-- =====================================================================
-- Closet Club — MULTI-USUARIO: cada persona ve su propio closet
-- =====================================================================
-- El lente genera un código personal por usuario (solo él lo ve en sus
-- Specs). Con ese código, la web muestra SU closet, su Bitmoji y su
-- nombre de Snapchat. Ejecutar en el SQL Editor.
-- =====================================================================

-- 1. Cada usuario del lente puede crear y leer SU propio código
drop policy if exists "own tokens select" on public.web_tokens;
drop policy if exists "own tokens insert" on public.web_tokens;
create policy "own tokens select" on public.web_tokens
    for select using (auth.uid() = user_id);
create policy "own tokens insert" on public.web_tokens
    for insert with check (auth.uid() = user_id);

-- 2. Perfil por código: nombre de Snapchat + user_id (para el Bitmoji)
create or replace function public.web_get_profile(p_token text)
returns table (user_id uuid, display_name text, level integer, total_scans integer)
language sql
security definer
set search_path = public
stable
as $$
    select p.user_id, p.display_name, p.level, p.total_scans
    from public.user_profiles p
    where p.user_id = public.web_token_user(p_token);
$$;

grant execute on function public.web_get_profile(text) to anon;

-- 3. Se retira la vitrina de usuario único (ahora cada uno ve el suyo)
drop function if exists public.web_public_items();
drop function if exists public.web_public_outfits();
