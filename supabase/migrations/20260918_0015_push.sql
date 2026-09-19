-- ===========================================================================
-- R3 — Push notifications (opt-in, shift-start digest + urgent watchlist)
-- ===========================================================================
-- device_tokens          : APNs tokens per user/device, self-scoped RLS
-- profiles               : shift_start_local, tz, push_digest_enabled,
--                          push_urgent_enabled (weekly_tip_enabled untouched)
-- feed_notification_log  : one row per send; the client stamps opened_at
--
-- Apply via the dashboard SQL editor or `supabase db push`. Idempotent.
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 1. device_tokens
-- ---------------------------------------------------------------------------
create table if not exists public.device_tokens (
    user_id       uuid        not null references auth.users(id) on delete cascade,
    token         text        not null,
    env           text        not null check (env in ('sandbox', 'production')),
    last_seen_at  timestamptz not null default now(),
    created_at    timestamptz not null default now(),
    primary key (token)
);

comment on table public.device_tokens is
    'APNs device tokens. One row per device; re-upserted on every launch so '
    'last_seen_at ages out dead devices. Deleted when the user turns '
    'notifications off, on account deletion (cascade), or when APNs reports '
    'the token unregistered.';

create index if not exists device_tokens_user_idx
    on public.device_tokens (user_id, last_seen_at desc);

alter table public.device_tokens enable row level security;

drop policy if exists "device_tokens_select_own" on public.device_tokens;
drop policy if exists "device_tokens_insert_own" on public.device_tokens;
drop policy if exists "device_tokens_update_own" on public.device_tokens;
drop policy if exists "device_tokens_delete_own" on public.device_tokens;

create policy "device_tokens_select_own" on public.device_tokens
    for select using (auth.uid() = user_id);
create policy "device_tokens_insert_own" on public.device_tokens
    for insert with check (auth.uid() = user_id);
create policy "device_tokens_update_own" on public.device_tokens
    for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "device_tokens_delete_own" on public.device_tokens
    for delete using (auth.uid() = user_id);

grant select, insert, update, delete on public.device_tokens to authenticated;

-- ---------------------------------------------------------------------------
-- 2. profiles: shift start + push preferences
-- ---------------------------------------------------------------------------
alter table public.profiles
    add column if not exists shift_start_local   time    not null default '06:45',
    add column if not exists tz                  text    not null default 'America/Chicago',
    add column if not exists push_digest_enabled boolean not null default false,
    add column if not exists push_urgent_enabled boolean not null default false;

comment on column public.profiles.shift_start_local is
    'Local wall-clock time the user wants the one daily digest (interpreted in tz).';
comment on column public.profiles.tz is
    'IANA zone the client last reported (e.g. America/Chicago).';

create index if not exists profiles_push_digest_idx
    on public.profiles (push_digest_enabled) where push_digest_enabled;
create index if not exists profiles_push_urgent_idx
    on public.profiles (push_urgent_enabled) where push_urgent_enabled;

-- ---------------------------------------------------------------------------
-- 3. feed_notification_log
-- ---------------------------------------------------------------------------
create table if not exists public.feed_notification_log (
    id            uuid        primary key default gen_random_uuid(),
    user_id       uuid        not null references auth.users(id) on delete cascade,
    feed_item_id  uuid        references public.feed_items(id) on delete cascade,
    kind          text        not null check (kind in ('digest', 'urgent')),
    sent_on       date        not null default current_date,
    sent_at       timestamptz not null default now(),
    opened_at     timestamptz,
    watchlist_hits int        not null default 0,
    unread_count   int        not null default 0
);

comment on table public.feed_notification_log is
    'One row per push sent. Dedupes sends (one digest per user per day, one '
    'urgent per user per item per day) and records opens for the open rate.';

-- One digest per user per day; one urgent per user per item per day.
create unique index if not exists feed_notification_log_dedupe_idx
    on public.feed_notification_log (user_id, kind, sent_on, feed_item_id)
    nulls not distinct;

create index if not exists feed_notification_log_sent_idx
    on public.feed_notification_log (sent_at desc);

alter table public.feed_notification_log enable row level security;

drop policy if exists "feed_notification_log_select_own" on public.feed_notification_log;
drop policy if exists "feed_notification_log_open_own"   on public.feed_notification_log;

create policy "feed_notification_log_select_own" on public.feed_notification_log
    for select using (auth.uid() = user_id);
-- The client may only stamp opened_at on its own rows; inserts are service_role.
create policy "feed_notification_log_open_own" on public.feed_notification_log
    for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

grant select, update (opened_at) on public.feed_notification_log to authenticated;

-- ---------------------------------------------------------------------------
-- 4. Hourly schedule (run once in the SQL editor; mirrors feed-ingest's job)
-- ---------------------------------------------------------------------------
-- select cron.schedule(
--     'feed-notify-hourly',
--     '5 * * * *',
--     $$
--     select net.http_post(
--         url := 'https://rxyzlzcovhfxjmfgeila.supabase.co/functions/v1/feed-notify',
--         headers := jsonb_build_object(
--             'Authorization', 'Bearer ' || current_setting('app.settings.service_role_key'),
--             'Content-Type', 'application/json'
--         ),
--         body := '{}'::jsonb
--     );
--     $$
-- );
