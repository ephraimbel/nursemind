-- ===========================================================================
-- R2 — Feed → library entry links
-- ===========================================================================
-- feed_items.related_entry_ids: prefixed library entry ids (e.g. 'drug:heparin')
-- whose normalized title appears as a whole word in the story text. Filled by
-- feed-classify from supabase/functions/_shared/entry-titles.json, and by the
-- same function's backfill mode for rows published before this column existed.
-- The iOS watchlist intersects this array with profiles.pinned_entry_ids on
-- device; the server never reads a user's pins for this feature.
--
-- Apply via the dashboard SQL editor or `supabase db push` with the NurseMind
-- PAT. Idempotent.
-- ===========================================================================

alter table public.feed_items
    add column if not exists related_entry_ids text[] not null default '{}';

comment on column public.feed_items.related_entry_ids is
    'Prefixed library entry ids matched from the story text (feed-classify). '
    'Empty until classified or backfilled.';

create index if not exists feed_items_related_entry_ids_idx
    on public.feed_items using gin (related_entry_ids);

-- Views select explicit columns, so both must be recreated to expose the
-- new one. feed_items_ranked depends on feed_items_visible: drop in
-- dependency order, recreate visible first.

drop view if exists public.feed_items_ranked;
drop view if exists public.feed_items_visible;

create view public.feed_items_visible
with (security_invoker = true)
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
    published_at,
    related_entry_ids
from public.feed_items
where review_state in ('auto_published', 'approved')
  and archived_at is null;

comment on view public.feed_items_visible is
    'Subset of feed_items currently visible to clients (auto_published or approved, '
    'not archived). RLS inherits from the base table via security_invoker.';

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

grant select on public.feed_items_visible to authenticated;
grant select on public.feed_items_ranked  to authenticated;
