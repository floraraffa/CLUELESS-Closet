# Closet Club — Web Inventario

Web personal para ver el closet escaneado con los Spectacles (lente **Closet FINAl DGNS**): prendas con filtros, outfits guardados con su porcentaje de match, y favoritos.

## Modelo de datos: el lente es efímero, la web es el catálogo

Los Spectacles tienen poca capacidad, así que el flujo es:

1. **Guardar en el lente → sube a la web.** Cada prenda guardada se sincroniza a `closet_items` con su categoría y metadata.
2. **La imagen del catálogo es siempre la generada** (el cutout de IA), nunca la foto cruda del escaneo. Si la generación tarda, la imagen se sube sola cuando termina.
3. **Borrar en el lente NO borra en la web.** El usuario puede liberar espacio en los Specs y su catálogo web queda intacto (y el lente recuerda los seriales borrados para no re-importarlos).
4. **Eliminar del catálogo solo se hace desde la web** (botón "Eliminar" en cada prenda/outfit, borra también la imagen del Storage).
5. **Cada outfit calificado con "Rate Look" queda guardado** en `outfits` con su porcentaje de match.

## Correr en local

```bash
npm install
npm run dev
```

Sin configurar nada, la app corre en **modo demo** con datos de ejemplo.

## Conectar a Supabase (Snap Cloud)

1. Crear/vincular el proyecto Supabase desde Lens Studio → panel **Snap Cloud** (requiere tu cuenta de desarrollador Snap).
2. En el SQL Editor del proyecto, ejecutar completo [`supabase/schema.sql`](supabase/schema.sql) (crea `user_profiles`, `closet_items`, `outfits`, el bucket `closet-images` y las políticas RLS).
3. En Lens Studio, abrir el asset `SupabaseProject DGNS Vehicle Scanner.supabaseProject` y completar **ProjectUrl** y **PublicToken**.
4. Copiar `.env.example` a `.env` y completar `VITE_SUPABASE_URL` y `VITE_SUPABASE_ANON_KEY` (mismos valores).
5. `npm run dev` → login con enlace mágico por email.

## Pendiente / decisiones abiertas

- **Vinculación de cuentas**: el lente se autentica con Snapchat y la web con email → son usuarios distintos en `auth.users`. Para que la web muestre lo escaneado por el lente hay que vincularlos (opciones: código de vinculación mostrado en el lente, o una edge function que asocie ambos user_id). Definir cuando haya proyecto Supabase propio.
- `ai_feedback` del outfit: hoy se guarda el match % al tocar "Rate Look"; el texto de la IA llega después y aún no se persiste.
- Deploy: `npm run build` → subir `dist/` a Vercel/Netlify.

## Estructura

- `supabase/schema.sql` — esquema completo de base de datos (Fase 1)
- `src/App.jsx` — pestañas Mi Closet / Mis Outfits, filtros, favoritos
- `src/supabaseClient.js` — cliente; sin `.env` activa el modo demo
- `src/mockData.js` — datos del modo demo
