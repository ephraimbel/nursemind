# feed-ingest

First stage of the v1.1 Feed pipeline. Pulls Tier 1 RSS sources (FDA, CDC, MMWR — see `../_shared/sources.ts`) and writes raw items into `public.feed_ingest_queue` for downstream processing by `feed-author`.

## Pipeline position

```
[THIS] feed-ingest  →  feed-author  →  feed-verify  →  feed-classify  →  feed-publish  →  feed-notify
```

Each stage is a separate edge function so any single stage can be retried independently. Feed-ingest **never writes to `feed_items` directly** — only `feed_ingest_queue`. Items published to users must pass through every downstream stage.

## Migrations

Both must be applied before this function runs:

- `supabase/migrations/20260601_0007_feed.sql` — `feed_items`, `feed_user_state`, `feed_engagement_daily`
- `supabase/migrations/20260601_0008_feed_ingest_queue.sql` — `feed_ingest_queue` (staging)

Apply with `supabase db push` or via the Management API.

## Deploy

```bash
supabase functions deploy feed-ingest --project-ref rxyzlzcovhfxjmfgeila
```

No additional secrets required. The function uses the auto-injected `SUPABASE_URL` and `SUPABASE_SERVICE_ROLE_KEY`.

## Manual invocation (verify before scheduling)

```bash
curl -X POST \
  "https://rxyzlzcovhfxjmfgeila.supabase.co/functions/v1/feed-ingest" \
  -H "Authorization: Bearer ${SUPABASE_SERVICE_ROLE_KEY}" \
  -H "Content-Type: application/json" \
  -d '{}'
```

Successful response shape:

```json
{
  "ok": true,
  "sources": [
    { "id": "fda-drugs", "label": "FDA Drugs Newsroom", "fetched": true, "parsed": 4, "inserted": 4, "duplicates": 0, "errors": 0 }
  ],
  "totalInserted": 4,
  "elapsedMs": 842
}
```

Re-running the same command within the same day should show `inserted: 0, duplicates: 4` — the unique constraint on `(source, source_url)` enforces idempotency.

## Daily schedule (pg_cron)

Run once per day at **04:00 UTC** (≈ 12:00 AM ET / 11:00 PM CT — well before US-shift morning use). Schedule via the Supabase SQL editor:

```sql
-- Enable extensions if not already on
create extension if not exists pg_cron;
create extension if not exists pg_net;

-- Schedule daily ingest
select cron.schedule(
    'feed-daily-ingest',
    '0 4 * * *',
    $$
    select net.http_post(
        url := 'https://rxyzlzcovhfxjmfgeila.supabase.co/functions/v1/feed-ingest',
        headers := jsonb_build_object(
            'Authorization', 'Bearer ' || current_setting('app.settings.service_role_key'),
            'Content-Type', 'application/json'
        ),
        body := '{}'::jsonb
    );
    $$
);
```

Set `app.settings.service_role_key` once via the SQL editor:

```sql
alter database postgres set app.settings.service_role_key = '<service_role_key>';
```

## Adding a new source

1. Add an entry to `SOURCES` in `../_shared/sources.ts` with `verified: false`.
2. Test manually: `curl <rssUrl>` and confirm the XML parses (run feed-ingest with that source temporarily flipped to `verified: true` in a branch).
3. When parsing produces ≥1 item on three consecutive runs, flip `verified: true` and merge.

Unverified sources are skipped at runtime — no risk of a typo-ed URL polluting the queue.

## Observability

Every source result is in the JSON response. For long-term metrics, query `feed_ingest_queue`:

```sql
-- Items ingested per day per source
select source, ingested_at::date as day, count(*) as items
from feed_ingest_queue
group by source, day
order by day desc, source;

-- Pipeline backlog
select state, count(*) from feed_ingest_queue group by state;

-- Failed authoring (after feed-author runs)
select source, source_title, last_error
from feed_ingest_queue
where state = 'failed'
order by ingested_at desc
limit 50;
```

## Failure modes

| Symptom | Likely cause | Fix |
|---|---|---|
| `fetched: false, error: "fetch: HTTP 404"` | Source URL stale | Verify URL on source-of-truth page; update `sources.ts` |
| `parsed: 0` despite `fetched: true` | XML structure isn't RSS 2.0 or Atom | Inspect XML; consider switching parser per `rss.ts` note |
| All `inserted: 0`, `duplicates: N` | Re-running same day — normal | None |
| `errors > 0` repeatedly for one source | Schema mismatch (e.g. missing columns) | Check `feed_ingest_queue` columns; confirm migration ran |
| 401 from `curl` test | Wrong bearer token | Use the **service_role** key (not anon) |
