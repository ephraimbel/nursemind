// =============================================================================
// feed-ingest — Pull Tier 1 RSS sources into feed_ingest_queue.
//
// The first stage of the v1.1 Feed pipeline. Runs daily at 04:00 UTC via
// pg_cron → net.http_post (see ./README.md). Idempotent: dedupe is enforced
// by the unique (source, source_url) constraint on feed_ingest_queue, so
// re-running the function within the same day is a no-op for already-seen
// items.
//
// Pipeline position:
//   [THIS]  feed-ingest      → writes raw items to feed_ingest_queue (state='queued')
//           feed-author      → reads queued, runs Sonnet author/critic/revise,
//                              inserts to feed_items (review_state='pending_review')
//           feed-verify      → Haiku faithfulness check + clinical-safety regex
//           feed-classify    → Haiku classifies category / specialties / NCLEX
//           feed-publish     → promotes pending_review → auto_published
//           feed-notify      → APNs push for urgent items
//
// Invocation:
//   POST /functions/v1/feed-ingest
//   Headers: Authorization: Bearer <service_role_key>
//   Body:    {}  (no body required — function uses the source registry)
//
// Response (200):
//   {
//     "ok":          true,
//     "sources":     [{ id, label, fetched, parsed, inserted, duplicates, errors }],
//     "totalInserted": <number>,
//     "elapsedMs":   <number>
//   }
//
// Safety: this function NEVER touches feed_items directly. It only writes to
// feed_ingest_queue. That separation means a misconfigured Tier 1 source can
// at worst pollute the queue; it can never publish a half-formed item to
// users (which would require feed-author + feed-verify + feed-publish to all
// succeed).
// =============================================================================

import { getVerifiedSources, IngestSource } from "../_shared/sources.ts"
import { parseRss, parsePubDate } from "../_shared/rss.ts"
import { insertIngestRows, IngestRow, IngestInsertResult } from "../_shared/supabase.ts"
import { fetchArticle } from "../_shared/article.ts"

type SourceResult = {
    id: string
    label: string
    fetched: boolean
    parsed: number
    inserted: number
    duplicates: number
    errors: number
    error?: string
}

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

// User-agent strings show up in source-side analytics. Identifying ourselves
// is polite and helps operators of the upstream RSS feeds know who's polling
// them — important for staying off any unintentional rate-limit lists.
const USER_AGENT = "NurseMind-Feed/1.1 (+https://nursemind.app/editorial-standards)"

const FETCH_TIMEOUT_MS = 20_000

Deno.serve(async (req: Request): Promise<Response> => {
    const startedAt = Date.now()

    if (req.method === "OPTIONS") {
        return new Response(null, { status: 204, headers: CORS_HEADERS })
    }

    if (req.method !== "POST") {
        return jsonError(405, "Method Not Allowed")
    }

    // Hard auth gate. This function is service-role-only — it should be
    // triggered by pg_cron (which has access to vault.secrets) or by an
    // operator running a manual ingest from a CI environment. No user JWTs.
    if (!isAuthorized(req)) {
        return jsonError(401, "Unauthorized — service_role required")
    }

    const sources = getVerifiedSources()
    if (sources.length === 0) {
        // Defensive: if every source is unverified, return a clear signal
        // rather than 200/empty (silent failure is worse than loud failure).
        return jsonResponse(500, {
            ok: false,
            error: "No verified sources configured. Update _shared/sources.ts to flip a source to verified=true.",
        })
    }

    const results: SourceResult[] = []
    let totalInserted = 0

    for (const source of sources) {
        const result = await ingestSource(source)
        results.push(result)
        totalInserted += result.inserted
    }

    return jsonResponse(200, {
        ok: true,
        sources: results,
        totalInserted,
        elapsedMs: Date.now() - startedAt,
    })
})

// -----------------------------------------------------------------------------
// Per-source work
// -----------------------------------------------------------------------------

async function ingestSource(source: IngestSource): Promise<SourceResult> {
    const base: SourceResult = {
        id: source.id,
        label: source.label,
        fetched: false,
        parsed: 0,
        inserted: 0,
        duplicates: 0,
        errors: 0,
    }

    let xml: string
    try {
        xml = await fetchWithTimeout(source.rssUrl, FETCH_TIMEOUT_MS)
        base.fetched = true
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        console.error("source fetch failed", { source: source.id, message })
        return { ...base, error: `fetch: ${message}` }
    }

    let parsed
    try {
        parsed = parseRss(xml)
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        console.error("source parse failed", { source: source.id, message })
        return { ...base, error: `parse: ${message}` }
    }

    // Cap to maxItemsPerRun to bound the queue depth per run. Items beyond
    // the cap are dropped, not failed — they'll appear in the next run if
    // they're still in the source feed.
    const items = parsed.items.slice(0, source.maxItemsPerRun)
    base.parsed = items.length

    const rows: IngestRow[] = []
    for (const item of items) {
        // Sources occasionally publish blank items during feed regenerations.
        // Skip any item missing the two fields we absolutely need.
        if (!item.title || !item.link) continue

        const pub = parsePubDate(item.pubDate)

        // Article fetch: pull the full page body so feed-author has 3-8 KB of
        // ground truth instead of just the RSS description. On failure we
        // fall back to the RSS excerpt — better thin than no item.
        let articleText: string | null = null
        let articleExtractor: string | null = null
        let articleError: string | null = null
        try {
            const article = await fetchArticle(item.link)
            articleText = article.text
            articleExtractor = article.extractor
            // Pace ourselves at ~1 req/sec per source so we don't hammer
            // government sites. Adds N seconds per run for N items; with the
            // 10-item cap that's at most 10s — fine.
            await new Promise((r) => setTimeout(r, 1_000))
        } catch (e) {
            articleError = e instanceof Error ? e.message : String(e)
            console.warn("article fetch failed; falling back to RSS excerpt", {
                source: source.id,
                url: item.link,
                error: articleError,
            })
        }

        // Prefer the fetched article body over the thin RSS excerpt. Both
        // are bounded by the article extractor (8 KB) or the RSS source
        // itself (usually well under 1 KB).
        const excerpt = articleText ?? item.excerpt ?? null

        rows.push({
            source: source.id,
            source_url: item.link,
            source_title: item.title,
            source_excerpt: excerpt,
            source_published_at: pub ? pub.toISOString() : null,
            raw_payload: {
                feed_title: parsed.feedTitle,
                authority: source.authority,
                default_category: source.category,
                rss: {
                    title: item.title,
                    link: item.link,
                    excerpt: item.excerpt,
                    pubDate: item.pubDate,
                    guid: item.guid,
                },
                article: articleText ? {
                    chars: articleText.length,
                    extractor: articleExtractor,
                } : { error: articleError },
            },
        })
    }

    const insertResult: IngestInsertResult = await insertIngestRows(rows)
    return {
        ...base,
        inserted: insertResult.inserted,
        duplicates: insertResult.duplicates,
        errors: insertResult.errors,
    }
}

// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

function isAuthorized(req: Request): boolean {
    // Supabase auto-injects SERVICE_ROLE_KEY into the function environment.
    // Match the bearer token against it directly — anything else is rejected.
    // (We don't accept anon JWTs here; feed-ingest must never be triggered
    // from a client.)
    const expected = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
    const header = req.headers.get("authorization") ?? ""
    if (!expected) return false
    if (!header.toLowerCase().startsWith("bearer ")) return false
    const token = header.slice("bearer ".length).trim()
    return constantTimeEqual(token, expected)
}

function constantTimeEqual(a: string, b: string): boolean {
    if (a.length !== b.length) return false
    let diff = 0
    for (let i = 0; i < a.length; i++) diff |= a.charCodeAt(i) ^ b.charCodeAt(i)
    return diff === 0
}

async function fetchWithTimeout(url: string, ms: number): Promise<string> {
    const controller = new AbortController()
    const id = setTimeout(() => controller.abort(), ms)
    try {
        const res = await fetch(url, {
            headers: { "user-agent": USER_AGENT, "accept": "application/rss+xml, application/atom+xml, application/xml, text/xml;q=0.9, */*;q=0.5" },
            signal: controller.signal,
        })
        if (!res.ok) {
            throw new Error(`HTTP ${res.status} ${res.statusText}`)
        }
        return await res.text()
    } finally {
        clearTimeout(id)
    }
}

function jsonResponse(status: number, body: unknown): Response {
    return new Response(JSON.stringify(body), {
        status,
        headers: { ...CORS_HEADERS, "content-type": "application/json" },
    })
}

function jsonError(status: number, message: string): Response {
    return jsonResponse(status, { ok: false, error: message })
}
