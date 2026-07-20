-- Fix: el código funciona aunque se escriba en minúsculas / con espacios.
create or replace function public.web_token_user(p_token text)
returns uuid
language sql
security definer
set search_path = public
stable
as $$
    select user_id from public.web_tokens
    where upper(token) = upper(trim(p_token))
      and (expires_at is null or expires_at > now())
    limit 1;
$$;
