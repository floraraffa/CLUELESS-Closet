-- =====================================================================
-- FIX: eliminar desde la web no funcionaba
-- =====================================================================
-- La limpieza de la imagen en Storage fallaba por permisos y hacía
-- rollback del borrado completo. Ahora es "best-effort": si falla,
-- la prenda se borra igual.
-- =====================================================================

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

    -- Limpieza de la imagen: best-effort, NUNCA deshace el borrado
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
