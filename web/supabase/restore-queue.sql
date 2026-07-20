-- =====================================================================
-- "ENVIAR AL LENTE" — recuperar prendas de la web hacia los Specs
-- =====================================================================
-- El dueño toca "Enviar al lente" en la web; queda un pedido en la cola.
-- La próxima vez que el lente se conecta, restaura la prenda (con su
-- imagen) al closet del dispositivo y limpia el pedido.
-- =====================================================================

create table if not exists public.restore_requests (
    user_id      uuid not null references auth.users (id) on delete cascade,
    serial       text not null,
    requested_at timestamptz not null default now(),
    primary key (user_id, serial)
);
alter table public.restore_requests enable row level security;

-- El lente (usuario autenticado) lee y limpia SUS pedidos
drop policy if exists "own restores select" on public.restore_requests;
drop policy if exists "own restores delete" on public.restore_requests;
create policy "own restores select" on public.restore_requests
    for select using (auth.uid() = user_id);
create policy "own restores delete" on public.restore_requests
    for delete using (auth.uid() = user_id);

-- La web (con el código del dueño) deja el pedido
create or replace function public.web_request_restore(p_token text, p_serial text)
returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare v_user uuid;
begin
    v_user := public.web_token_user(p_token);
    if v_user is null then return false; end if;

    -- solo prendas que existen en el catálogo del dueño
    if not exists (
        select 1 from public.closet_items
        where user_id = v_user and serial = p_serial
    ) then
        return false;
    end if;

    insert into public.restore_requests (user_id, serial)
    values (v_user, p_serial)
    on conflict do nothing;
    return true;
end;
$$;

grant execute on function public.web_request_restore(text, text) to anon;
