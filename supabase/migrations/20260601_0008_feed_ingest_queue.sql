-- ===========================================================================
-- v1.1 — Feed: ingest staging queue
-- ===========================================================================
-- The feed_items table (migration 0007) requires headline / body / category /
-- citations as NOT NULL — those fields are produced by the feed-author edge
-- function, not by ingest. This table holds raw RSS items between ingest and
-- author so the two stages can be retried, monitored, and rate-limited
-- independently.
--
-- Lifecycle:
--   feed-ingest  : INSERT row with state='queued' for each new RSS item
--   feed-author  : SELECT WHERE state='queued', UPDATE state='authoring',
--                  run Sonnet author/critic/revise, INSERT feed_items,
--                  UPDATE feed_ingest_queue SET state='authored',
--                       feed_item_id = <new id>
--   On error     : state='failed', last_error populated, attempts incremented
--   Permanently  : state='skipped' (e.g. low-relevance items rejected by
--   skip          early classification)
-- ===========================================================================

create table if not exists public.feed_ingest_queue (
    id                   uuid primary key default gen_random_uuid(),

    -- Source provenance (mirrors feed_items columns)
    source               text        not null,
    source_url           text        not null,
    source_title         text        not null,
    source_excerpt       text,
    source_published_at  timestamptz,

    -- Full RSS item payload (title, link, description, pubDate, guid, etc.)
    -- Stored as jsonb so feed-author can pass the full context to the author
    -- prompt without ingest needing to know which fields the author wants.
    raw_payload          jsonb       not null,

    ingested_at          timestamptz not null default now(),

    -- Pipeline state machine. 'queued' → 'authoring' → 'authored' is the happy
    -- path. 'failed' is retryable up to N attempts (feed-author decides).
    -- 'skipped' is terminal — items judged out-of-scope by early classification.
    state                text        not null default 'queued'
                         check (state in ('queued', 'authoring', 'authored', 'failed', 'skipped')),

    attempts             int         not null default 0,
    last_error           text,

    -- Backreference to the published feed_items row, if authoring succeeded.
    feed_item_id         uuid        references public.feed_items(id) on delete set null,

    -- Dedupe key: ingesting the same source URL twice is a no-op
    unique (source, source_url)
);

comment on table public.feed_ingest_queue is
    'Staging queue between feed-ingest (RSS fetch) and feed-author (Sonnet '
    'author/critic/revise). Decouples the two stages so each can be retried '
    'independently. Service-role only; not exposed to clients.';

-- Hot-path index: feed-author scans queued items oldest-first
create index if not exists feed_ingest_queue_state_idx
    on public.feed_ingest_queue (state, ingested_at)
    where state in ('queued', 'failed');

-- Operational: "what failed today" review queries
create index if not exists feed_ingest_queue_failed_idx
    on public.feed_ingest_queue (ingested_at desc)
    where state = 'failed';

alter table public.feed_ingest_queue enable row level security;

-- No client-side policies. service_role only.
-- (RLS is enabled with no policies so any unprivileged role gets denied by
-- default — including authenticated. Edge functions use service_role.)
