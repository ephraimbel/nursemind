-- ===========================================================================
-- Slice #1-of-three: server-authoritative subscription_tier on profiles
-- ===========================================================================
-- Adds a `subscription_tier` column written exclusively by the
-- `revenuecat-events` Edge Function (which uses the service role key, so RLS
-- doesn't gate it). Clients read this column on the initial profile pull and
-- treat it as truth — they do NOT push it back. The existing
-- `profiles_update_own` RLS policy still allows clients to UPDATE rows, but a
-- BEFORE UPDATE trigger restores `subscription_tier` to its previous value
-- whenever the caller isn't the service role. That makes the column
-- effectively client-readable / server-writable.
--
-- Tier values match the iOS `SubscriptionTier` enum raw values exactly:
--   free, proMonthly, proYearly, proLifetime
-- ===========================================================================

alter table public.profiles
    add column if not exists subscription_tier text not null default 'free';

do $$ begin
    alter table public.profiles
        add constraint profiles_subscription_tier_chk
        check (subscription_tier in ('free', 'proMonthly', 'proYearly'));
exception when duplicate_object then null; end $$;

-- =============================================================================
-- Trigger: prevent clients from changing subscription_tier
-- =============================================================================
-- Service role bypasses RLS but ALSO bypasses this trigger if we use the
-- standard `current_user` check, because Supabase service role connects as
-- the `postgres` user. We check `auth.role()` instead — it returns
-- `'service_role'` only for service-key-authenticated requests.
-- =============================================================================

create or replace function public.guard_subscription_tier()
returns trigger
language plpgsql
as $$
begin
    -- Service role (RevenueCat webhook) is allowed to set any tier.
    if coalesce(auth.role(), '') = 'service_role' then
        return new;
    end if;

    -- Non-service-role callers can only INSERT or UPDATE with tier = 'free'.
    -- On UPDATE: if the new value differs from old, revert to old.
    -- On INSERT: if the new value isn't 'free', force it to 'free'.
    if tg_op = 'INSERT' then
        if new.subscription_tier is distinct from 'free' then
            new.subscription_tier := 'free';
        end if;
    elsif tg_op = 'UPDATE' then
        if new.subscription_tier is distinct from old.subscription_tier then
            new.subscription_tier := old.subscription_tier;
        end if;
    end if;
    return new;
end;
$$;

drop trigger if exists profiles_guard_subscription_tier_update on public.profiles;
drop trigger if exists profiles_guard_subscription_tier on public.profiles;
create trigger profiles_guard_subscription_tier
    before insert or update on public.profiles
    for each row execute function public.guard_subscription_tier();
