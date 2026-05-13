// =============================================================================
// _shared/sources.ts — Tier 1 RSS source registry for the Feed pipeline.
//
// Curated allow-list. Adding a source means adding it here AND verifying the
// URL fetches a valid RSS 2.0 / Atom document. `verified: false` sources are
// skipped at runtime — explicit gating prevents typos / hallucinated URLs
// from running in production.
//
// License audit per docs/CONTENT_SOURCING.md — every source listed here is
// public-domain US government output OR Creative Commons attribution-only,
// so quoting + linking from a commercial app is fine.
// =============================================================================

export type Authority =
    | "fda"          // US Food and Drug Administration
    | "cdc"          // US Centers for Disease Control and Prevention
    | "ismp"         // Institute for Safe Medication Practices (paid Tier B — see Notes)
    | "mmwr"         // CDC Morbidity and Mortality Weekly Report
    | "va_pbm"       // VA Pharmacy Benefits Management
    | "nih"          // National Institutes of Health

export type SourceCategory =
    | "drug_safety"
    | "clinical_guideline"
    | "public_health"
    | "medication_safety"
    | "research"

export type IngestSource = {
    /** Stable identifier written to feed_items.source */
    id: string
    /** Human-readable label for the admin review queue */
    label: string
    /** RSS feed URL — must produce RSS 2.0 or Atom XML */
    rssUrl: string
    authority: Authority
    category: SourceCategory
    /** Default category written to feed_items if classifier doesn't override */
    /** Tier 1 sources are verified; new sources land as false until manually
     *  tested. Unverified sources are skipped at runtime. */
    verified: boolean
    /** Soft limit on items to process per ingest run. Tier 1 sources rarely
     *  produce >5 items/day; a higher number indicates we're recovering from
     *  downtime and want to backfill. */
    maxItemsPerRun: number
}

// -----------------------------------------------------------------------------
// Tier 1 — public-domain US government output
// (see docs/CONTENT_SOURCING.md §2 "Foundation tier")
// -----------------------------------------------------------------------------

export const SOURCES: IngestSource[] = [
    {
        id: "fda-drugs",
        label: "FDA Drugs Newsroom",
        rssUrl: "https://www.fda.gov/about-fda/contact-fda/stay-informed/rss-feeds/drugs/rss.xml",
        authority: "fda",
        category: "drug_safety",
        verified: true,
        maxItemsPerRun: 10,
    },
    {
        id: "fda-medwatch",
        label: "FDA MedWatch Safety Alerts",
        rssUrl: "https://www.fda.gov/about-fda/contact-fda/stay-informed/rss-feeds/medwatch/rss.xml",
        authority: "fda",
        category: "drug_safety",
        verified: true,  // confirmed 2026-05-13: HTTP 200, 20 items, well-formed RSS 2.0
        maxItemsPerRun: 10,
    },
    {
        // NOTE 2026-05-13: CDC retired the HAN RSS feed; emergency.cdc.gov/han/rss.asp
        // 301-redirects to a static index page. Keep this entry as a placeholder so
        // future-us knows we audited it. A working HAN ingestion would require
        // scraping https://emergency.cdc.gov/han/ (no RSS available) — defer to v1.2.
        id: "cdc-han",
        label: "CDC Health Alert Network",
        rssUrl: "https://emergency.cdc.gov/han/rss.asp",
        authority: "cdc",
        category: "public_health",
        verified: false,
        maxItemsPerRun: 5,
    },
    {
        // NOTE 2026-05-13: The redirected URL at tools.cdc.gov returns a podcast feed
        // (audio + PDF download links), not article HTML. Article-body fetch would
        // fail on those URLs. Defer until we find an article-oriented MMWR endpoint.
        id: "cdc-mmwr",
        label: "CDC MMWR Weekly",
        rssUrl: "https://tools.cdc.gov/api/v2/resources/media/342778.rss",
        authority: "mmwr",
        category: "research",
        verified: false,
        maxItemsPerRun: 8,
    },
]

export function getVerifiedSources(): IngestSource[] {
    return SOURCES.filter((s) => s.verified)
}

export function findSource(id: string): IngestSource | undefined {
    return SOURCES.find((s) => s.id === id)
}
