-- ===========================================================================
-- v1.1 — Feed
-- ===========================================================================
-- Slice: server-backed news feed for the iOS Feed tab (between Ask and
-- Library). Three new tables, all idempotent. Apply with:
--   - supabase db push  (preferred, tracks migrations server-side)
--   - or POST /v1/projects/{ref}/database/query via Management API
--
-- Schema overview:
--   public.feed_items           : canonical published items (one row per news story)
--   public.feed_user_state      : per-user read/save state (RLS-scoped to self)
--   public.feed_engagement_daily: aggregate engagement counters (no PII)
--
-- All policies and indexes use `if not exists` / `drop if exists` patterns
-- so partial re-runs are safe.
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 1. feed_items
-- ---------------------------------------------------------------------------

create table if not exists public.feed_items (
    id                    uuid primary key default gen_random_uuid(),

    -- Source provenance
    source                text        not null,
    source_url            text        not null,
    source_published_at   timestamptz,
    ingested_at           timestamptz not null default now(),

    -- Generated editorial content (the user-facing surface)
    -- Length checks match the visual spec in docs/v1_1_FEED_SCOPE.md §2.
    -- Body cap is defensive: ~3 paragraphs × ~90 words × ~6 chars ≈ 1,600 chars
    -- in practice; 5,000 leaves room for occasional longer items.
    headline              text        not null check (length(headline) between 10 and 100),
    why_nurses_care       text        not null check (length(why_nurses_care) between 20 and 180),
    body                  text        not null check (length(body) between 100 and 5000),

    -- Pre-built question for the "Ask NurseMind about this" button.
    -- Generated server-side during authoring so each card has a contextual
    -- prefill specific to the user's specialty + the item's topic.
    ask_followup_prompt   text        not null,

    -- Classification (set by feed-classify edge function)
    category              text        not null check (category in (
        'drug_safety',
        'clinical_guideline',
        'public_health',
        'medication_safety',
        'licensure',
        'research'
    )),
    specialties           text[]      not null default '{}',
    nclex_areas           text[]      not null default '{}',
    priority              text        not null default 'standard'
                          check (priority in ('urgent', 'standard')),

    -- Quality-pipeline metadata. Set by feed-author + feed-verify so the
    -- review queue can show what passed which check at a glance.
    citations             jsonb       not null,
    author_passes         int         not null default 1,  -- 1 = single-pass, 2 = author+critic, 3 = author+critic+revise
    faithfulness_passed   boolean     not null default false,
    safety_regex_passed   boolean     not null default false,

    -- Review state. Mostly automated:
    --   'pending_review' — DEFAULT. Item is not visible to clients until promoted.
    --                       The ingest step inserts at this state; feed-publish
    --                       promotes to 'auto_published' once all quality layers
    --                       pass. Defaulting to pending_review prevents partial-
    --                       ingestion rows (empty headline/body) from going live
    --                       if any pipeline stage crashes mid-flight.
    --   'auto_published' — all quality layers passed, live to users
    --   'approved'       — pending_review item manually approved
    --   'rejected'       — pending_review item manually rejected (excluded from feed)
    --   'archived'       — was live, now retracted via flag_reports
    review_state          text        not null default 'pending_review'
                          check (review_state in (
                              'auto_published', 'pending_review',
                              'approved', 'rejected', 'archived'
                          )),
    reviewed_by           text,
    reviewed_at           timestamptz,
    rejection_reason      text,

    -- Lifecycle
    published_at          timestamptz not null default now(),
    archived_at           timestamptz,

    -- Full-text search vector (headline weighted highest, then why_nurses_care, then body)
    search_vector tsvector generated always as (
        setweight(to_tsvector('english', coalesce(headline, '')),       'A') ||
        setweight(to_tsvector('english', coalesce(why_nurses_care, '')),'B') ||
        setweight(to_tsvector('english', coalesce(body, '')),           'C')
    ) stored
);

comment on table public.feed_items is
    'Canonical published Feed news items. Curated daily by the edge-function pipeline '
    '(ingest → author → verify → classify → publish). RLS-gated to authenticated users; '
    'service_role writes via the pipeline.';

-- Hot-path index for the feed list (recent published items, not archived)
create index if not exists feed_items_published_idx
    on public.feed_items (published_at desc)
    where archived_at is null
      and review_state in ('auto_published', 'approved');

-- Specialty filtering (GIN on text[] for @> containment)
create index if not exists feed_items_specialty_idx
    on public.feed_items using gin (specialties);

-- Full-text search
create index if not exists feed_items_search_idx
    on public.feed_items using gin (search_vector);

-- Dedupe on ingest (source + canonical URL)
create index if not exists feed_items_source_url_idx
    on public.feed_items (source, source_url);

-- Review-queue lookup (urgent items + pending review items, surfaced first)
create index if not exists feed_items_review_state_idx
    on public.feed_items (review_state, published_at desc)
    where review_state in ('pending_review', 'rejected');

alter table public.feed_items enable row level security;

-- RLS: authenticated users can read live items only
drop policy if exists "feed_items_select_published" on public.feed_items;
create policy "feed_items_select_published" on public.feed_items
    for select
    using (
        review_state in ('auto_published', 'approved')
        and archived_at is null
    );

-- No client-side INSERT / UPDATE / DELETE policies — service_role only,
-- writes happen exclusively from the edge function pipeline.


-- ---------------------------------------------------------------------------
-- 2. feed_user_state
-- ---------------------------------------------------------------------------

create table if not exists public.feed_user_state (
    user_id     uuid not null references auth.users(id) on delete cascade,
    item_id     uuid not null references public.feed_items(id) on delete cascade,
    read_at     timestamptz,
    saved_at    timestamptz,
    primary key (user_id, item_id)
);

comment on table public.feed_user_state is
    'Per-user read and save state for Feed items. RLS-scoped to self.';

-- Hot-path: saved items list for a user, newest first
create index if not exists feed_user_state_user_saved_idx
    on public.feed_user_state (user_id, saved_at desc nulls last)
    where saved_at is not null;

-- Recently read for "where I left off" surfaces and unread-count math
create index if not exists feed_user_state_user_read_idx
    on public.feed_user_state (user_id, read_at desc nulls last)
    where read_at is not null;

alter table public.feed_user_state enable row level security;

drop policy if exists "feed_user_state_select_own"  on public.feed_user_state;
drop policy if exists "feed_user_state_insert_own"  on public.feed_user_state;
drop policy if exists "feed_user_state_update_own"  on public.feed_user_state;
drop policy if exists "feed_user_state_delete_own"  on public.feed_user_state;

create policy "feed_user_state_select_own" on public.feed_user_state
    for select using (auth.uid() = user_id);

create policy "feed_user_state_insert_own" on public.feed_user_state
    for insert with check (auth.uid() = user_id);

create policy "feed_user_state_update_own" on public.feed_user_state
    for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

create policy "feed_user_state_delete_own" on public.feed_user_state
    for delete using (auth.uid() = user_id);


-- ---------------------------------------------------------------------------
-- 3. feed_engagement_daily
-- ---------------------------------------------------------------------------

create table if not exists public.feed_engagement_daily (
    item_id      uuid not null references public.feed_items(id) on delete cascade,
    bucket_date  date not null,
    views        int  not null default 0,
    reads        int  not null default 0,
    saves        int  not null default 0,
    asks         int  not null default 0,
    primary key (item_id, bucket_date)
);

comment on table public.feed_engagement_daily is
    'Aggregate (per item, per day) engagement counters. No PII, no user_id. '
    'Used for trending sort + post-launch success metrics in docs/v1_1_FEED_SCOPE.md §12.';

create index if not exists feed_engagement_daily_date_idx
    on public.feed_engagement_daily (bucket_date desc);

alter table public.feed_engagement_daily enable row level security;

-- Read-only for any authenticated user. Useful if you ever want to expose
-- a "trending today" sort on the feed without leaking who engaged.
drop policy if exists "feed_engagement_select" on public.feed_engagement_daily;
create policy "feed_engagement_select" on public.feed_engagement_daily
    for select using (auth.role() = 'authenticated');

-- Writes are service_role only (the edge functions increment counters).


-- ---------------------------------------------------------------------------
-- 4. Touch trigger on feed_items.published_at when review_state moves to
--    'approved'. Keeps the published-feed ordering correct for items that
--    were held in 'pending_review' and later approved.
-- ---------------------------------------------------------------------------

-- Re-stamps published_at when an item transitions from pending_review to
-- ANY user-visible state ('auto_published' OR 'approved'). The visible-state
-- transition is when the item first reaches users, so the feed-list ordering
-- should reflect that moment, not the original ingest time.
--
-- Only fires when published_at wasn't already mutated by the caller — lets
-- the pipeline override the timestamp when needed (e.g., back-dating a
-- corrected item to its original publish time).
create or replace function public.feed_items_set_published_at_on_approval()
returns trigger
language plpgsql
as $$
begin
    if tg_op = 'UPDATE'
       and old.review_state = 'pending_review'
       and new.review_state in ('auto_published', 'approved')
       and new.published_at = old.published_at
    then
        new.published_at := now();
    end if;
    return new;
end;
$$;

drop trigger if exists feed_items_set_published_at on public.feed_items;
create trigger feed_items_set_published_at
    before update on public.feed_items
    for each row
    execute function public.feed_items_set_published_at_on_approval();


-- ---------------------------------------------------------------------------
-- 5. Convenience view: feed_items_visible
--    A view of items currently visible to clients, so the iOS query layer
--    doesn't have to repeat the same review_state + archived_at filter
--    everywhere. PostgREST auto-exposes views with the inherited RLS.
-- ---------------------------------------------------------------------------

drop view if exists public.feed_items_visible;
create view public.feed_items_visible
with (security_invoker = true)  -- defer to caller's RLS, not view-owner's
as
select
    id,
    source,
    source_url,
    source_published_at,
    headline,
    why_nurses_care,
    body,
    ask_followup_prompt,
    category,
    specialties,
    nclex_areas,
    priority,
    citations,
    published_at
from public.feed_items
where review_state in ('auto_published', 'approved')
  and archived_at is null;

comment on view public.feed_items_visible is
    'Subset of feed_items currently visible to clients (auto_published or approved, '
    'not archived). RLS inherits from the base table via security_invoker.';


-- ---------------------------------------------------------------------------
-- 6. GRANTs to authenticated role
-- ---------------------------------------------------------------------------
-- RLS policies are filters applied AFTER the GRANT permission gate, so both
-- are needed. Some Supabase projects auto-grant via default privileges;
-- making it explicit here so the migration is portable across project setups.
-- service_role bypasses RLS entirely and doesn't need GRANTs.

grant select on public.feed_items                  to authenticated;
grant select on public.feed_items_visible          to authenticated;
grant select, insert, update, delete
                on public.feed_user_state          to authenticated;
grant select on public.feed_engagement_daily       to authenticated;

-- Sequence grants — feed_items uses gen_random_uuid() for the PK so no
-- sequence to grant. feed_user_state and feed_engagement_daily use composite
-- PKs (no sequences). Nothing else needs sequence access.


-- ---------------------------------------------------------------------------
-- 7. Notes for follow-on migrations (not in this file)
-- ---------------------------------------------------------------------------
-- flag_reports.target_type: needs to be extended to accept 'feed_item' for
--   Tier C user-reported errors on Feed items. Deliberately not bundled here
--   because the existing flag_reports CHECK constraint name varies across
--   environments and a dynamic ALTER block is fragile. Verify the schema
--   first, then write a focused migration 20260602_0008_flag_reports_feed.sql
--   that does `alter table public.flag_reports drop constraint <known_name>;
--   alter table ... add constraint ... check (target_type in (..., 'feed_item'));`
--
-- profiles.quiet_hours_start / profiles.quiet_hours_end: needed so the
--   feed-notify edge function can suppress urgent push notifications during
--   the user's sleep window. Add in 20260603_0009_profile_quiet_hours.sql.
--
-- feed_engagement_daily writes: iOS clients can only SELECT on this table
--   (RLS). Counter increments happen via a service_role-authenticated edge
--   function (`feed-engagement-bump`) that the iOS app calls with the
--   item_id + event_type. The function does an upsert with `+1` per counter.
