-- =====================================================================
-- Closet Club (DGNS) — Esquema Supabase / Snap Cloud
-- =====================================================================
-- Pegar completo en el SQL Editor del proyecto Supabase y ejecutar.
-- Las columnas de user_profiles y closet_items coinciden 1:1 con lo que
-- envía CloudManager.ts del lente. La tabla outfits guarda las
-- combinaciones con su porcentaje de match.
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. PERFIL DE USUARIO
-- ---------------------------------------------------------------------
create table if not exists public.user_profiles (
    user_id            uuid primary key references auth.users (id) on delete cascade,
    display_name       text not null default '',
    level              integer not null default 1,
    total_xp           integer not null default 0,
    prestige           integer not null default 0,
    streak_days        integer not null default 0,
    total_scans        integer not null default 0,
    total_trades       integer not null default 0,
    trust_score        integer not null default 80,
    consecutive_cheats integer not null default 0,
    total_cheats       integer not null default 0,
    cards_given        integer not null default 0,
    cards_received     integer not null default 0,
    last_login         timestamptz,
    created_at         timestamptz not null default now(),
    updated_at         timestamptz not null default now()
);

-- ---------------------------------------------------------------------
-- 2. PRENDAS ESCANEADAS (closet_items)
-- ---------------------------------------------------------------------
create table if not exists public.closet_items (
    id                 bigint generated always as identity primary key,
    user_id            uuid not null references auth.users (id) on delete cascade,
    serial             text not null unique,
    brand              text not null default '',
    brand_model        text not null default '',
    mode               text not null default 'single_item',
    item_name          text not null default '',
    type               text not null default '',
    category           text not null default '',
    subcategory        text not null default '',
    year               text not null default '',
    collection         text not null default '',
    collection_year    text not null default '',
    quality            text not null default '',
    scan_context       text not null default 'unknown',
    color              text not null default '',
    material           text not null default '',
    pattern            text not null default '',
    fit                text not null default '',
    condition          text not null default '',
    confidence         numeric,
    style_tags         text[] not null default '{}',
    occasion_tags      text[] not null default '{}',
    season_tags        text[] not null default '{}',
    items              jsonb not null default '[]',
    look_summary       text not null default '',
    suggested_pairings text[] not null default '{}',
    pairing_note       text not null default '',
    feedback           text not null default '',
    ai_note            text not null default '',
    user_note          text not null default '',
    rarity             integer not null default 2,
    rarity_label       text not null default 'Everyday',
    top_speed          integer not null default 1,   -- Condition (1-5)
    acceleration       integer not null default 1,   -- Versatility (1-5)
    braking            integer not null default 1,   -- Matchability (1-5)
    traction           integer not null default 1,   -- Uniqueness (1-5)
    comfort            integer not null default 1,   -- Trend score (1-5)
    scene              text not null default '',
    city_scanned       text not null default '',
    date_scanned       text not null default '',
    image_url          text not null default '',
    saved_at           bigint not null default 0,
    -- Campos editables desde la web-inventario (el lente los ignora):
    favorite           boolean not null default false,
    custom_tags        text[] not null default '{}',
    created_at         timestamptz not null default now()
);

create index if not exists closet_items_user_idx     on public.closet_items (user_id, saved_at desc);
create index if not exists closet_items_category_idx on public.closet_items (user_id, category);

-- ---------------------------------------------------------------------
-- 3. OUTFITS GUARDADOS (combinaciones con porcentaje de match)
-- ---------------------------------------------------------------------
create table if not exists public.outfits (
    id            bigint generated always as identity primary key,
    user_id       uuid not null references auth.users (id) on delete cascade,
    serial_key    text not null,           -- seriales ordenados unidos con '+'
    name          text not null default '',
    item_serials  text[] not null default '{}',
    item_names    text[] not null default '{}',
    match_percent integer not null default 0,
    ai_feedback   text not null default '',
    occasion      text not null default '',
    season        text not null default '',
    favorite      boolean not null default false,
    created_at    timestamptz not null default now(),
    updated_at    timestamptz not null default now(),
    unique (user_id, serial_key)
);

create index if not exists outfits_user_match_idx on public.outfits (user_id, match_percent desc);

-- ---------------------------------------------------------------------
-- 4. ROW LEVEL SECURITY — cada usuario solo ve y edita lo suyo
-- ---------------------------------------------------------------------
alter table public.user_profiles enable row level security;
alter table public.closet_items  enable row level security;
alter table public.outfits       enable row level security;

drop policy if exists "own profile select" on public.user_profiles;
drop policy if exists "own profile insert" on public.user_profiles;
drop policy if exists "own profile update" on public.user_profiles;
drop policy if exists "own profile delete" on public.user_profiles;
create policy "own profile select" on public.user_profiles for select using (auth.uid() = user_id);
create policy "own profile insert" on public.user_profiles for insert with check (auth.uid() = user_id);
create policy "own profile update" on public.user_profiles for update using (auth.uid() = user_id);
create policy "own profile delete" on public.user_profiles for delete using (auth.uid() = user_id);

drop policy if exists "own items select" on public.closet_items;
drop policy if exists "own items insert" on public.closet_items;
drop policy if exists "own items update" on public.closet_items;
drop policy if exists "own items delete" on public.closet_items;
create policy "own items select" on public.closet_items for select using (auth.uid() = user_id);
create policy "own items insert" on public.closet_items for insert with check (auth.uid() = user_id);
create policy "own items update" on public.closet_items for update using (auth.uid() = user_id);
create policy "own items delete" on public.closet_items for delete using (auth.uid() = user_id);

drop policy if exists "own outfits select" on public.outfits;
drop policy if exists "own outfits insert" on public.outfits;
drop policy if exists "own outfits update" on public.outfits;
drop policy if exists "own outfits delete" on public.outfits;
create policy "own outfits select" on public.outfits for select using (auth.uid() = user_id);
create policy "own outfits insert" on public.outfits for insert with check (auth.uid() = user_id);
create policy "own outfits update" on public.outfits for update using (auth.uid() = user_id);
create policy "own outfits delete" on public.outfits for delete using (auth.uid() = user_id);

-- ---------------------------------------------------------------------
-- 5. STORAGE — bucket público de imágenes de cards
--    (el lente sube a  <user_id>/<serial>.jpg  y usa getPublicUrl)
-- ---------------------------------------------------------------------
insert into storage.buckets (id, name, public)
values ('closet-images', 'closet-images', true)
on conflict (id) do nothing;

drop policy if exists "closet images public read"  on storage.objects;
drop policy if exists "closet images own insert"   on storage.objects;
drop policy if exists "closet images own update"   on storage.objects;
drop policy if exists "closet images own delete"   on storage.objects;

create policy "closet images public read" on storage.objects
    for select using (bucket_id = 'closet-images');

create policy "closet images own insert" on storage.objects
    for insert with check (
        bucket_id = 'closet-images'
        and auth.uid()::text = (storage.foldername(name))[1]
    );

create policy "closet images own update" on storage.objects
    for update using (
        bucket_id = 'closet-images'
        and auth.uid()::text = (storage.foldername(name))[1]
    );

create policy "closet images own delete" on storage.objects
    for delete using (
        bucket_id = 'closet-images'
        and auth.uid()::text = (storage.foldername(name))[1]
    );
