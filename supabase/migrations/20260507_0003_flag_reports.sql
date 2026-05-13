-- ===========================================================================
-- Slice #3-of-three: user-submitted flag reports for AI answers.
-- ===========================================================================
-- Captures every "this answer is wrong / unsafe" report submitted from the
-- iOS client. Used for the human-review queue (Tier B sampled review +
-- Tier C user reporting from CONTENT_SOURCING.md).
--
-- Question + answer text are stored verbatim at flag time so review isn't
-- racing against library updates that might change what the user actually saw.
--
-- Read access is admin-only (service role). iOS users can INSERT but never
-- SELECT — nobody should browse other users' flagged content, and the user's
-- own report has nothing useful to re-display in the app once submitted.
-- ===========================================================================

create table if not exists public.flag_reports (
    id                  uuid         primary key default gen_random_uuid(),
    user_id             uuid         references auth.users(id) on delete set null,

    -- Snapshot of the flagged content at the moment of report
    question            text         not null,
    answer_markdown     text         not null,
    citations_data      jsonb        not null default '[]'::jsonb,
    source_message_id   uuid         not null,

    -- User-provided context (optional)
    reason              text,

    -- Server-side review state
    status              text         not null default 'open',
    reviewed_at         timestamptz,
    review_notes        text,

    created_at          timestamptz  not null default now()
);

do $$ begin
    alter table public.flag_reports
        add constraint flag_reports_status_chk
        check (status in ('open', 'triaged', 'resolved', 'dismissed'));
exception when duplicate_object then null; end $$;

create index if not exists flag_reports_status_created_at_idx
    on public.flag_reports (status, created_at desc)
    where status = 'open';

-- =============================================================================
-- Row Level Security
-- =============================================================================
-- Users can submit reports tied to their own user_id. They cannot read any
-- reports (their own or others') — review surface is admin-only via service
-- role. Anonymous users can also submit (auth.uid() returns the anon UUID).
-- =============================================================================

alter table public.flag_reports enable row level security;

drop policy if exists "flag_reports_insert_own" on public.flag_reports;
create policy "flag_reports_insert_own"
    on public.flag_reports
    for insert
    with check (auth.uid() = user_id);

-- Intentionally no SELECT/UPDATE/DELETE policies for the `authenticated` role.
-- Service role bypasses RLS — admin tooling reads via that role.
