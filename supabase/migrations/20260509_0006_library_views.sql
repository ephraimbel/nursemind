-- ===========================================================================
-- Slice #6: library_views — pre-staged behavioral log for v1.5 dynamic feed
-- ===========================================================================
-- Append-only log of "user X opened library entry Y at time T". Pre-staged in
-- v1 so historical view data accrues from day one, even though the v1.5
-- dynamic-feed feature (BUILD_SPEC §15) doesn't ship until Month 3-4. Adding
-- this table later would mean a cold-start period where no users have history;
-- pre-staging avoids that.
--
-- Reads (when §15 ships) are by-user, most-recent-first — supports surfaces
-- like "Pick up where you left off", embedding-similarity recommendations
-- ("Related to your recent reading"), and spaced-repetition surfaces.
--
-- Population-level reads ("Trending in your unit") will come from a
-- materialized view added in the v1.5 migration. That view is intentionally
-- NOT created here because:
--   1. BUILD_SPEC §15.5 referenced `users.units[1]` (array) but the actual
--      schema uses `profiles.unit` (singular text) — the view query needs to
--      be rewritten against the real schema before it lands.
--   2. The view is only useful once feed-serving traffic exists; building it
--      with no consumer adds maintenance burden for no gain.
--   3. Without aggregated reads, this v1 migration stays simple enough to
--      review + ship without §15 design dependencies.
--
-- Run via Supabase Dashboard → SQL Editor or `supabase db push`. Idempotent.
-- ===========================================================================

create table if not exists public.library_views (
    -- bigserial (not uuid) because this is high-frequency append-only logging.
    -- A 15K-Pro-user steady state writes ~40M rows/year; bigint scales for
    -- decades. uuid generation client-side would add overhead with no benefit
    -- since the id is never referenced from another table.
    id                  bigserial    primary key,

    user_id             uuid         not null references auth.users(id) on delete cascade,

    -- Slug of the bundled library entry, matches LibraryEntry.id from Swift
    -- (e.g., "norepinephrine", "sepsis-bundle"). Not foreign-keyed because
    -- library entries live in the bundled app, not the database.
    entry_slug          text         not null,

    -- Optional duration in seconds the entry was on screen. Client populates
    -- on view-disappear; null when the client crashes / backgrounds before
    -- recording. Used by spaced-repetition + engagement KPIs.
    duration_sec        integer,

    viewed_at           timestamptz  not null default now()
);

-- Lightweight constraint: duration must be positive when present. Catches
-- client-side bugs (negative timestamps, corrupted state) at the boundary
-- rather than letting them poison aggregations.
do $$ begin
    alter table public.library_views
        add constraint library_views_duration_chk
        check (duration_sec is null or duration_sec > 0);
exception when duplicate_object then null; end $$;

-- The hot path: "show me this user's most recent N views". Composite index
-- on (user_id, viewed_at desc) means the most-recent-views query is an index
-- scan, not a sort. Same pattern as saved_answers_user_id_saved_at_idx.
create index if not exists library_views_user_recent_idx
    on public.library_views (user_id, viewed_at desc);

-- Secondary index for population-level aggregation queries (M+3 of v1.5,
-- once the materialized view + trending surface ship). Cheap to add now,
-- expensive to add later when the table is large.
create index if not exists library_views_entry_recent_idx
    on public.library_views (entry_slug, viewed_at desc);

-- ===========================================================================
-- Row Level Security
-- ===========================================================================
-- A user can read + insert their OWN view rows. No update (timestamps are
-- immutable history, not editable state). No delete (history is append-only;
-- account deletion cascades from auth.users.id). Server-side INSERT enforces
-- user_id = auth.uid() so a malicious client can't log views as another
-- user (which would poison their personalization).
-- ===========================================================================

alter table public.library_views enable row level security;

drop policy if exists "library_views_select_own" on public.library_views;
create policy "library_views_select_own"
    on public.library_views
    for select
    using (auth.uid() = user_id);

drop policy if exists "library_views_insert_own" on public.library_views;
create policy "library_views_insert_own"
    on public.library_views
    for insert
    with check (auth.uid() = user_id);

-- ===========================================================================
-- Future work documented (not implemented here):
-- ---------------------------------------------------------------------------
-- v1.5 migration (Month 3-4) will add:
--
--   1. Materialized view `trending_by_unit_7d`, refreshed nightly via pg_cron,
--      grouped by `profiles.unit` (singular — NOT `users.units[1]` as written
--      in spec §15.5). The spec needs to be reconciled against actual schema
--      before that migration is written.
--
--   2. RPC function `get_recent_views(uid uuid, n int)` invoked by the
--      `suggested-feed` edge function — keeps SQL out of the function body,
--      and lets PostgREST cache the prepared statement.
--
--   3. Retention policy — partition by month + drop after 12 months. At
--      v1.5 scale this is unnecessary; revisit when the table crosses
--      ~50M rows or query latency degrades.
-- ===========================================================================
