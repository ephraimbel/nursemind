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

import { getVerifiedSources, IngestSource, ALLOWED_LICENSES } from "../_shared/sources.ts"
import { parseRss, parsePubDate } from "../_shared/rss.ts"
import { insertIngestRows, IngestRow, IngestInsertResult } from "../_shared/supabase.ts"
import { fetchArticle } from "../_shared/article.ts"

// Normalized item shape produced by both the RSS path and the JSON adapters,
// so the per-item ingest loop (relevance gate → article fetch → row build) is
// shared regardless of source shape.
type NormalizedItem = {
    title: string
    link: string
    /** Best-effort summary. For JSON sources this is built from structured
     *  fields and is the author's ground truth (no article fetch). */
    excerpt: string
    /** ISO 8601 publish timestamp, or null. */
    pubDateISO: string | null
    /** Stable id for logging / secondary dedupe (DB dedupe is by source_url). */
    guid: string
}

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

    // License guard — defense in depth. The TS type already constrains this,
    // but a runtime gate guarantees a non-commercial (NC/ND/SA) source can
    // never reach the queue even if the registry is edited carelessly.
    if (!ALLOWED_LICENSES.includes(source.license)) {
        const message = `disallowed license: ${source.license}`
        console.error("source license rejected", { source: source.id, message })
        return { ...base, error: message }
    }

    let raw: string
    try {
        raw = await fetchWithTimeout(source.rssUrl, FETCH_TIMEOUT_MS)
        base.fetched = true
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        console.error("source fetch failed", { source: source.id, message })
        return { ...base, error: `fetch: ${message}` }
    }

    let loaded: { feedTitle: string; items: NormalizedItem[] }
    try {
        loaded = source.kind === "json" ? loadJson(source, raw) : loadRss(raw)
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        console.error("source parse failed", { source: source.id, message })
        return { ...base, error: `parse: ${message}` }
    }

    // Drop blank items, then apply the pre-LLM relevance gate, THEN cap to
    // maxItemsPerRun — so the cap counts only relevant items, not noise we
    // were going to discard anyway. Gating before article-fetch/insert means a
    // noisy item never costs an article fetch or a downstream authoring call.
    const relevant = loaded.items
        .filter((item) => item.title && item.link)
        .filter((item) => passesRelevance(source, item))
    const items = relevant.slice(0, source.maxItemsPerRun)
    base.parsed = items.length

    const skipArticle = source.kind === "json" || source.skipArticleFetch === true

    const rows: IngestRow[] = []
    for (const item of items) {
        // Article fetch: pull the full page body so feed-author has 3-8 KB of
        // ground truth instead of just the RSS description. Skipped for JSON
        // sources (no article page) and for feeds that already carry a full
        // abstract (skipArticleFetch). On failure we fall back to the excerpt.
        let articleText: string | null = null
        let articleExtractor: string | null = null
        let articleError: string | null = null
        if (!skipArticle) {
            try {
                const article = await fetchArticle(item.link)
                articleText = article.text
                articleExtractor = article.extractor
                // Pace ourselves at ~1 req/sec per source so we don't hammer
                // government sites.
                await new Promise((r) => setTimeout(r, 1_000))
            } catch (e) {
                articleError = e instanceof Error ? e.message : String(e)
                console.warn("article fetch failed; falling back to excerpt", {
                    source: source.id,
                    url: item.link,
                    error: articleError,
                })
            }
        }

        // Prefer the fetched article body over the thin excerpt.
        const excerpt = articleText ?? item.excerpt ?? null

        rows.push({
            source: source.id,
            source_url: item.link,
            source_title: item.title,
            source_excerpt: excerpt,
            source_published_at: item.pubDateISO,
            raw_payload: {
                feed_title: loaded.feedTitle,
                authority: source.authority,
                default_category: source.category,
                license: source.license,
                rss: {
                    title: item.title,
                    link: item.link,
                    excerpt: item.excerpt,
                    pubDate: item.pubDateISO,
                    guid: item.guid,
                },
                article: skipArticle
                    ? { skipped: true }
                    : (articleText
                        ? { chars: articleText.length, extractor: articleExtractor }
                        : { error: articleError }),
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
// Source loaders — RSS and JSON both normalize to NormalizedItem[]
// -----------------------------------------------------------------------------

function loadRss(xml: string): { feedTitle: string; items: NormalizedItem[] } {
    const parsed = parseRss(xml)
    const items: NormalizedItem[] = parsed.items.map((it) => ({
        title: it.title,
        link: it.link,
        excerpt: it.excerpt ?? "",
        pubDateISO: parsePubDate(it.pubDate)?.toISOString() ?? null,
        guid: it.guid || it.link,
    }))
    return { feedTitle: parsed.feedTitle, items }
}

function loadJson(source: IngestSource, body: string): { feedTitle: string; items: NormalizedItem[] } {
    const json = JSON.parse(body) as { results?: unknown[] }
    const results = Array.isArray(json.results) ? json.results : []
    let items: NormalizedItem[]
    switch (source.id) {
        case "fda-enforcement":
            items = results.map((r) => mapFdaEnforcement(r as Record<string, unknown>))
            break
        case "fda-shortages":
            items = results.map((r) => mapFdaShortage(r as Record<string, unknown>))
            break
        case "fedreg-rn":
        case "fedreg-cms":
            items = results.map((r) => mapFederalRegister(r as Record<string, unknown>))
            break
        default:
            throw new Error(`no JSON mapper for source ${source.id}`)
    }
    return { feedTitle: source.label, items: items.filter((i) => i.title && i.link) }
}

// -----------------------------------------------------------------------------
// JSON field mappers
// -----------------------------------------------------------------------------

function mapFdaEnforcement(r: Record<string, unknown>): NormalizedItem {
    const product = str(r.product_description)
    const firm = str(r.recalling_firm)
    const reason = str(r.reason_for_recall)
    const klass = str(r.classification)
    const status = str(r.status)
    const distribution = str(r.distribution_pattern)
    const recallNumber = str(r.recall_number)
    const title = `Recall: ${truncate(product || firm || "FDA drug recall", 90)}`
    const excerpt = [
        klass ? `${klass}.` : "",
        firm ? `${firm} is recalling ${product || "a product"}.` : (product ? `Recall of ${product}.` : ""),
        reason ? `Reason: ${reason}.` : "",
        distribution ? `Distribution: ${distribution}.` : "",
        status ? `Status: ${status}.` : "",
    ].filter(Boolean).join(" ")
    return {
        title,
        // No per-recall FDA web page exists; cite the authoritative openFDA
        // record by recall_number. Stable + unique → safe dedupe key + citation.
        link: `https://api.fda.gov/drug/enforcement.json?search=recall_number.exact:%22${encodeURIComponent(recallNumber)}%22`,
        excerpt,
        pubDateISO: parseCompactDate(str(r.report_date)),
        guid: recallNumber || product,
    }
}

function mapFdaShortage(r: Record<string, unknown>): NormalizedItem {
    const generic = str(r.generic_name)
    const status = str(r.status)
    const reason = str(r.shortage_reason)
    const form = str(r.dosage_form)
    const availability = str(r.availability)
    const ndc = str(r.package_ndc)
    const title = `Drug shortage: ${truncate(generic || "FDA-tracked drug", 88)}`
    const excerpt = [
        generic ? `${generic}${form ? ` (${form})` : ""}.` : "",
        status ? `Status: ${status}.` : "",
        reason ? `Reason: ${reason}.` : "",
        availability ? `Availability: ${availability}.` : "",
    ].filter(Boolean).join(" ")
    // Cite the openFDA shortages record. Prefer NDC (unique); fall back to a
    // generic-name search. Stable per-drug → re-ingesting an updated shortage
    // dedupes against the same URL rather than spawning a near-duplicate.
    const search = ndc
        ? `package_ndc:%22${encodeURIComponent(ndc)}%22`
        : `generic_name:%22${encodeURIComponent(generic)}%22`
    return {
        title,
        link: `https://api.fda.gov/drug/shortages.json?search=${search}`,
        excerpt,
        pubDateISO: parseSlashDate(str(r.update_date)),
        guid: ndc || generic,
    }
}

function mapFederalRegister(r: Record<string, unknown>): NormalizedItem {
    const title = str(r.title)
    const abstract = str(r.abstract)
    const htmlUrl = str(r.html_url)
    const agencies = Array.isArray(r.agencies)
        ? (r.agencies as Array<Record<string, unknown>>).map((a) => str(a.name)).filter(Boolean)
        : []
    const excerpt = [
        agencies.length ? `${agencies.join(", ")}.` : "",
        abstract,
    ].filter(Boolean).join(" ")
    return {
        title: truncate(title, 95),
        link: htmlUrl,
        excerpt,
        pubDateISO: parseIsoDate(str(r.publication_date)),
        guid: str(r.document_number) || htmlUrl,
    }
}

// -----------------------------------------------------------------------------
// Relevance gate + small field helpers
// -----------------------------------------------------------------------------

function passesRelevance(source: IngestSource, item: NormalizedItem): boolean {
    const hay = `${item.title} ${item.excerpt}`.toLowerCase()
    if (source.dropPatterns?.some((p) => item.title.toLowerCase().includes(p.toLowerCase()))) {
        return false
    }
    if (source.relevanceKeywords && source.relevanceKeywords.length > 0) {
        return source.relevanceKeywords.some((k) => hay.includes(k.toLowerCase()))
    }
    return true
}

function str(v: unknown): string {
    return typeof v === "string" ? v.trim() : ""
}

function truncate(s: string, max: number): string {
    return s.length > max ? `${s.slice(0, max - 1).trimEnd()}…` : s
}

/** "20260617" → ISO, or null. */
function parseCompactDate(s: string): string | null {
    const m = s.match(/^(\d{4})(\d{2})(\d{2})$/)
    if (!m) return parseIsoDate(s)
    const d = new Date(Date.UTC(Number(m[1]), Number(m[2]) - 1, Number(m[3])))
    return Number.isNaN(d.getTime()) ? null : d.toISOString()
}

/** "06/24/2026" (MM/DD/YYYY) → ISO, or null. */
function parseSlashDate(s: string): string | null {
    const m = s.match(/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/)
    if (!m) return parseIsoDate(s)
    const d = new Date(Date.UTC(Number(m[3]), Number(m[1]) - 1, Number(m[2])))
    return Number.isNaN(d.getTime()) ? null : d.toISOString()
}

/** "2026-06-16" or any Date-parseable string → ISO, or null. */
function parseIsoDate(s: string): string | null {
    if (!s) return null
    const t = Date.parse(s)
    return Number.isFinite(t) ? new Date(t).toISOString() : null
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
