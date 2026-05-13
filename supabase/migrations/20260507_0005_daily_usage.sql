-- ===========================================================================
-- Slice #2-of-three: server-side daily AI quota
-- ===========================================================================
-- One row per (user, calendar day). The `ai-chat` Edge Function calls
-- `consume_ask_quota(user_id, limit)` which atomically checks-and-increments
-- the count under a row lock — concurrent requests can't race past the cap.
-- Returns -1 when the limit is exhausted; otherwise the remaining count.
--
-- Days are bucketed by Postgres `current_date` (UTC). Acceptable v1
-- approximation — small skew on midnight rollover for users in non-UTC
-- timezones doesn't materially affect the quota guarantee.
-- ===========================================================================

create table if not exists public.daily_usage (
    user_id     uuid        not null references auth.users(id) on delete cascade,
    usage_date  date        not null default current_date,
    count       int         not null default 0,
    primary key (user_id, usage_date)
);

create index if not exists daily_usage_user_id_usage_date_idx
    on public.daily_usage (user_id, usage_date desc);

-- =============================================================================
-- consume_ask_quota
-- =============================================================================
-- Atomic check-and-increment. Returns the remaining count after consuming
-- one request, or -1 if the limit was already reached (no increment performed).
--
-- Uses SECURITY DEFINER so authenticated users (including anonymous) can call
-- it without needing direct write permission to `daily_usage`. The
-- `FOR UPDATE` row lock serializes concurrent calls so the limit is honored
-- even under burst-traffic from a single user.
-- =============================================================================

create or replace function public.consume_ask_quota(p_user_id uuid, p_limit int)
returns int
language plpgsql
security definer
set search_path = public
as $$
declare
    v_count int;
begin
    -- Get-or-create the today row, then lock it.
    insert into public.daily_usage (user_id, usage_date, count)
    values (p_user_id, current_date, 0)
    on conflict (user_id, usage_date) do nothing;

    select count into v_count
    from public.daily_usage
    where user_id = p_user_id and usage_date = current_date
    for update;

    if v_count >= p_limit then
        return -1;
    end if;

    update public.daily_usage
    set count = count + 1
    where user_id = p_user_id and usage_date = current_date;

    return p_limit - (v_count + 1);
end;
$$;

-- Allow authenticated users (including anonymous Supabase sessions) to invoke
-- the function. Service role can call it too (it always can).
grant execute on function public.consume_ask_quota(uuid, int) to authenticated;

-- RLS — the table itself is admin-read-only. Users invoke via the function;
-- they never SELECT or INSERT directly.
alter table public.daily_usage enable row level security;
-- (No policies → no rows visible/writable to non-service-role callers.)
