-- ===========================================================================
-- Slice #4: server-backed saved AI answers
-- ===========================================================================
-- One row per user-saved AI response. Mirrors the SwiftData @Model
-- `SavedAnswer` so the same UUID identifies the same record across devices.
-- Survives reinstall (anchored to auth.users.id, not local Keychain).
--
-- citations_data is jsonb because CitationSource is a flexible struct that
-- evolves with the AI pipeline; jsonb lets us add fields server-side without
-- a migration. Indexed only by (user_id, saved_at desc) for the typical
-- "latest first" Library list query.
--
-- Run via Supabase Dashboard → SQL Editor or `supabase db push`.
-- Idempotent.
-- ===========================================================================

create table if not exists public.saved_answers (
    id                  uuid primary key,
    user_id             uuid         not null references auth.users(id) on delete cascade,
    question            text         not null,
    answer_markdown     text         not null,
    custom_title        text,
    citations_data      jsonb        not null default '[]'::jsonb,
    source_message_id   uuid         not null,
    saved_at            timestamptz  not null,
    created_at          timestamptz  not null default now(),
    updated_at          timestamptz  not null default now()
);

create index if not exists saved_answers_user_id_saved_at_idx
    on public.saved_answers (user_id, saved_at desc);

-- Reuse the trigger defined in 20260507_0001_profiles.sql
drop trigger if exists saved_answers_set_updated_at on public.saved_answers;
create trigger saved_answers_set_updated_at
    before update on public.saved_answers
    for each row execute function public.set_updated_at();

-- =============================================================================
-- Row Level Security
-- =============================================================================
-- Users see and mutate only their own rows. DELETE is allowed because the
-- iOS app supports deleting saved answers (swipe + dedicated trash button).
-- Server-side INSERT requires the row's user_id matches the JWT's auth.uid()
-- so a malicious client can't write rows under another user's id.
-- =============================================================================

alter table public.saved_answers enable row level security;

drop policy if exists "saved_answers_select_own" on public.saved_answers;
create policy "saved_answers_select_own"
    on public.saved_answers
    for select
    using (auth.uid() = user_id);

drop policy if exists "saved_answers_insert_own" on public.saved_answers;
create policy "saved_answers_insert_own"
    on public.saved_answers
    for insert
    with check (auth.uid() = user_id);

drop policy if exists "saved_answers_update_own" on public.saved_answers;
create policy "saved_answers_update_own"
    on public.saved_answers
    for update
    using (auth.uid() = user_id)
    with check (auth.uid() = user_id);

drop policy if exists "saved_answers_delete_own" on public.saved_answers;
create policy "saved_answers_delete_own"
    on public.saved_answers
    for delete
    using (auth.uid() = user_id);
