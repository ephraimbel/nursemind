-- ===========================================================================
-- Ask quota v2: single-round-trip consume + refund
-- ===========================================================================
-- The ai-chat edge function used to make two serial DB calls before every
-- generation request (profiles tier read, then consume_ask_quota). That's
-- dead time on the time-to-first-token critical path. v2 folds the tier
-- lookup into the consume function so the quota gate is one round trip.
--
-- refund_ask_quota returns a consumed unit when the upstream Anthropic call
-- fails — a question that produced no answer must not burn the user's
-- allowance.
-- ===========================================================================

-- Tier → daily cap. Keep aligned with QUOTA_BY_TIER in
-- supabase/functions/ai-chat/index.ts and SubscriptionTier.askDailyLimit in
-- the iOS app.
create or replace function public.consume_ask_quota_v2(p_user_id uuid)
returns table (remaining int, tier text, cap int)
language plpgsql
security definer
set search_path = public
as $$
declare
    v_tier  text;
    v_limit int;
begin
    select p.subscription_tier into v_tier
    from public.profiles p
    where p.id = p_user_id;

    v_tier  := coalesce(v_tier, 'free');
    v_limit := case
        when v_tier in ('proMonthly', 'proYearly') then 50
        else 3
    end;

    return query
    select public.consume_ask_quota(p_user_id, v_limit), v_tier, v_limit;
end;
$$;

grant execute on function public.consume_ask_quota_v2(uuid) to authenticated;

-- Refund one unit for today. GREATEST guard means a stray double-refund can
-- never go negative.
create or replace function public.refund_ask_quota(p_user_id uuid)
returns void
language sql
security definer
set search_path = public
as $$
    update public.daily_usage
    set count = greatest(count - 1, 0)
    where user_id = p_user_id and usage_date = current_date;
$$;

grant execute on function public.refund_ask_quota(uuid) to authenticated;
