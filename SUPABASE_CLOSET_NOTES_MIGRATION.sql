-- CLUELESS closet notes migration
-- Run this in the Supabase SQL editor for your project.

alter table public.closet_items
    add column if not exists ai_note text default '',
    add column if not exists user_note text default '';

comment on column public.closet_items.ai_note is
    'AI-generated styling note shown on the closet card.';

comment on column public.closet_items.user_note is
    'User-edited wardrobe note saved from the closet card.';
