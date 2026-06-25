-- ===========================================================================
-- v1.1 — Feed weekly freshness (Slice 2)
-- ===========================================================================
-- Makes the feed visibly move day-to-day and week-to-week without changing the
-- ingest pipeline. Two additive, idempotent pieces:
--
--   1. feed_items_ranked — a view that scores each visible item by recency
--      (freshness-decay) plus 7-day engagement, so the client can order by a
--      single rank_score. On cold start (zero engagement) the score collapses
--      to pure recency — identical to the prior sort, no regression.
--
--   2. feed_engagement_bump(item_id, event) — a SECURITY DEFINER RPC the iOS
--      client calls (with its user JWT) to increment the aggregate
--      feed_engagement_daily counters. No new edge function, no service-role
--      key on the client: the function is the privileged boundary.
--
-- Apply with `supabase db push` or the Management API query endpoint.
-- ===========================================================================

-- ---------------------------------------------------------------------------
-- 1. Ranked view
-- ---------------------------------------------------------------------------
-- rank_score = freshness + engagement, where:
--   freshness  = 0.5 ^ (age_hours / 60)   → 1.0 at publish, 0.5 at 60h, → 0
--   engagement = ln(1 + weighted 7-day events)  (views + reads·2 + saves·3 + asks·3)
-- Freshness dominates for fresh items; engagement gently lifts items that are
-- resonating. security_invoker defers RLS to the caller (same as the base view).

drop view if exists public.feed_items_ranked;
create view public.feed_items_ranked
with (security_invoker = true)
as
select
    v.*,
    power(
        0.5,
        greatest(
            0,
            extract(epoch from (now() - coalesce(v.source_published_at, v.published_at))) / 3600.0
        ) / 60.0
    )
    + ln(1 + coalesce(e.engagement_7d, 0)) as rank_score
from public.feed_items_visible v
left join (
    select
        item_id,
        sum(views + reads * 2 + saves * 3 + asks * 3) as engagement_7d
    from public.feed_engagement_daily
    where bucket_date >= (current_date - 7)
    group by item_id
) e on e.item_id = v.id;

comment on view public.feed_items_ranked is
    'feed_items_visible plus a rank_score (freshness-decay, 60h half-life, + '
    'log-scaled 7-day engagement). Client orders by rank_score desc for a feed '
    'that fluctuates daily/weekly. RLS inherits via security_invoker.';

grant select on public.feed_items_ranked to authenticated;

-- ---------------------------------------------------------------------------
-- 2. Engagement bump RPC
-- ---------------------------------------------------------------------------
-- Called by the iOS client via PostgREST RPC with the user's JWT. RLS on
-- feed_engagement_daily blocks direct client writes (writes are service-role
-- only), so this SECURITY DEFINER function is the controlled write path. It
-- validates the event type and does an atomic upsert (+1 on the right counter).
--
-- No user_id is stored — the table is intentionally aggregate-only (no PII).
-- A bad item_id raises an FK violation; the client calls fire-and-forget so a
-- failure is silently dropped.

create or replace function public.feed_engagement_bump(p_item_id uuid, p_event text)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin
    if p_event not in ('view', 'read', 'save', 'ask') then
        raise exception 'invalid engagement event: %', p_event;
    end if;

    insert into public.feed_engagement_daily as e (item_id, bucket_date, views, reads, saves, asks)
    values (
        p_item_id,
        current_date,
        case when p_event = 'view' then 1 else 0 end,
        case when p_event = 'read' then 1 else 0 end,
        case when p_event = 'save' then 1 else 0 end,
        case when p_event = 'ask'  then 1 else 0 end
    )
    on conflict (item_id, bucket_date) do update set
        views = e.views + (case when p_event = 'view' then 1 else 0 end),
        reads = e.reads + (case when p_event = 'read' then 1 else 0 end),
        saves = e.saves + (case when p_event = 'save' then 1 else 0 end),
        asks  = e.asks  + (case when p_event = 'ask'  then 1 else 0 end);
end;
$$;

comment on function public.feed_engagement_bump(uuid, text) is
    'Increment the per-item per-day engagement counter for a Feed item. Called '
    'by the iOS client (user JWT) via RPC; SECURITY DEFINER so it can write past '
    'the service-role-only RLS on feed_engagement_daily. Aggregate only, no PII.';

-- Lock the function to authenticated callers only.
revoke all on function public.feed_engagement_bump(uuid, text) from public;
grant execute on function public.feed_engagement_bump(uuid, text) to authenticated;
