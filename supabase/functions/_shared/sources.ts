// =============================================================================
// _shared/sources.ts — Source registry for the Feed pipeline.
//
// Curated allow-list. Adding a source means adding it here AND verifying the
// URL fetches a valid document (RSS 2.0 / Atom for kind="rss", a JSON results
// envelope for kind="json"). `verified: false` sources are skipped at runtime —
// explicit gating prevents typos / hallucinated URLs from running in production.
//
// License audit per docs/CONTENT_SOURCING.md — every source listed here is
// public-domain US government output OR Creative Commons attribution-only, so
// authoring original cited summaries from a commercial app is fine. The
// `license` field is persisted into the ingest payload and enforced at runtime
// (feed-ingest refuses any license not in ALLOWED_LICENSES) — defense in depth
// so a non-commercial (NC/ND) source can never silently ship.
// =============================================================================

export type Authority =
    | "fda"              // US Food and Drug Administration
    | "cdc"              // US Centers for Disease Control and Prevention
    | "ismp"             // Institute for Safe Medication Practices (paid Tier B — see Notes)
    | "mmwr"             // CDC Morbidity and Mortality Weekly Report
    | "va_pbm"           // VA Pharmacy Benefits Management
    | "nih"              // National Institutes of Health
    | "osha"             // US Occupational Safety and Health Administration
    | "federal_register" // US Office of the Federal Register
    | "plos"             // Public Library of Science (CC BY open-access journals)

export type SourceCategory =
    | "drug_safety"
    | "clinical_guideline"
    | "public_health"
    | "medication_safety"
    | "licensure"
    | "research"

// Only these licenses may be ingested. US-gov public domain, openFDA's explicit
// CC0 dedication, and Creative Commons Attribution 4.0 (commercial-use OK with
// attribution). Anything NC/ND/SA is out — see docs/CONTENT_SOURCING.md §2.
export type SourceLicense = "public_domain" | "cc0" | "cc_by_4"
export const ALLOWED_LICENSES: readonly SourceLicense[] = ["public_domain", "cc0", "cc_by_4"]

export type IngestSource = {
    /** Stable identifier written to feed_items.source */
    id: string
    /** Human-readable label for the admin review queue */
    label: string
    /** Feed URL — RSS/Atom XML for kind="rss", a JSON results envelope for kind="json" */
    rssUrl: string
    authority: Authority
    category: SourceCategory
    /** Default category written to feed_items if classifier doesn't override */
    license: SourceLicense
    /** Document shape. Defaults to "rss" when omitted. */
    kind?: "rss" | "json"
    /** Tier 1 sources are verified; new sources land as false until manually
     *  tested. Unverified sources are skipped at runtime. */
    verified: boolean
    /** Soft limit on items to process per ingest run. Tier 1 sources rarely
     *  produce >5 items/day; a higher number indicates we're recovering from
     *  downtime and want to backfill. */
    maxItemsPerRun: number
    /** Skip the per-item article-body fetch. Set true when the feed already
     *  carries a full abstract (PLOS Atom <content>) or when there is no
     *  article page to fetch (JSON sources). JSON sources skip implicitly. */
    skipArticleFetch?: boolean
    /** Pre-LLM relevance gate: if set, an item is kept only when its title or
     *  excerpt contains at least one of these (case-insensitive) keywords.
     *  Drops noise BEFORE it costs an authoring call. */
    relevanceKeywords?: string[]
    /** Pre-LLM drop gate: an item is dropped if its title matches any of these
     *  (case-insensitive substring) patterns. */
    dropPatterns?: string[]
}

// -----------------------------------------------------------------------------
// Verified sources
// -----------------------------------------------------------------------------

export const SOURCES: IngestSource[] = [
    // --- FDA (public domain / openFDA CC0) -----------------------------------
    {
        id: "fda-drugs",
        label: "FDA Drugs Newsroom",
        rssUrl: "https://www.fda.gov/about-fda/contact-fda/stay-informed/rss-feeds/drugs/rss.xml",
        authority: "fda",
        category: "drug_safety",
        license: "public_domain",
        verified: true,
        maxItemsPerRun: 20,  // Each RSS holds ~20 items spanning the last 2-3 months.
    },
    {
        id: "fda-medwatch",
        label: "FDA MedWatch Safety Alerts",
        rssUrl: "https://www.fda.gov/about-fda/contact-fda/stay-informed/rss-feeds/medwatch/rss.xml",
        authority: "fda",
        category: "drug_safety",
        license: "public_domain",
        verified: true,  // confirmed 2026-05-13: HTTP 200, 20 items, well-formed RSS 2.0
        maxItemsPerRun: 20,
    },
    {
        // openFDA Drug Enforcement (recalls). JSON, no per-item article page —
        // we build the excerpt from structured fields and cite the openFDA
        // record (the authoritative public-domain source) by recall_number.
        id: "fda-enforcement",
        label: "FDA Drug Recalls (openFDA Enforcement)",
        rssUrl: "https://api.fda.gov/drug/enforcement.json?sort=report_date:desc&limit=20",
        authority: "fda",
        category: "drug_safety",
        license: "cc0",
        kind: "json",
        verified: true,  // confirmed 2026-06-24: 200, rich fields (product/reason/classification)
        maxItemsPerRun: 15,
    },
    {
        // openFDA Drug Shortages. JSON; the shortages database is the most
        // operationally relevant drug-supply signal for nurses.
        id: "fda-shortages",
        label: "FDA Drug Shortages (openFDA)",
        rssUrl: "https://api.fda.gov/drug/shortages.json?sort=update_date:desc&limit=20",
        authority: "fda",
        category: "medication_safety",
        license: "cc0",
        kind: "json",
        verified: true,  // confirmed 2026-06-24: 200, rich fields (generic_name/status/reason)
        maxItemsPerRun: 15,
    },

    // --- CDC (public domain) -------------------------------------------------
    {
        id: "cdc-newsroom",
        label: "CDC Online Newsroom",
        rssUrl: "https://tools.cdc.gov/api/v2/resources/media/132608.rss",
        authority: "cdc",
        category: "public_health",
        license: "public_domain",
        verified: true,  // confirmed 2026-05-13: HTTP 200, well-formed RSS, 2-3 month depth
        maxItemsPerRun: 20,
    },
    {
        // CDC Emerging Infectious Diseases journal — early-release feed. Links
        // point to real article HTML on wwwnc.cdc.gov; the RSS excerpt carries
        // the abstract as a fallback. Outbreak / ID content is highly relevant.
        id: "cdc-eid",
        label: "CDC Emerging Infectious Diseases",
        rssUrl: "https://wwwnc.cdc.gov/eid/rss/ahead-of-print.xml",
        authority: "cdc",
        category: "research",
        license: "public_domain",
        verified: true,  // confirmed 2026-06-24: 200, 31 items, links to /eid/article/ HTML
        maxItemsPerRun: 10,
    },

    // --- PLOS (CC BY 4.0 — attribution required) -----------------------------
    {
        // PLOS Medicine, peer-reviewed open access. The Atom <content> already
        // carries a structured Background/Methods/Findings abstract, so we skip
        // the (JS-heavy) article fetch and author from the feed content. CC BY
        // attribution is carried by the citation source name.
        id: "plos-medicine",
        label: "PLOS Medicine",
        rssUrl: "https://journals.plos.org/plosmedicine/feed/atom",
        authority: "plos",
        category: "research",
        license: "cc_by_4",
        skipArticleFetch: true,
        verified: true,  // confirmed 2026-06-24: valid Atom, 25 entries, content abstracts
        maxItemsPerRun: 8,
    },

    // --- Federal Register (public domain) ------------------------------------
    {
        // Federal Register documents mentioning "registered nurse". JSON; the
        // abstract is solid ground truth. Relevance gate requires a nurse
        // mention since the term search is loose.
        id: "fedreg-rn",
        label: "Federal Register — Nursing",
        rssUrl: "https://www.federalregister.gov/api/v1/documents.json?per_page=20&order=newest&conditions%5Bterm%5D=registered+nurse",
        authority: "federal_register",
        category: "licensure",
        license: "public_domain",
        kind: "json",
        verified: true,  // confirmed 2026-06-24: 200, fields title/abstract/html_url/agencies
        maxItemsPerRun: 8,
        relevanceKeywords: ["nurse", "nursing"],
    },
    {
        // Federal Register CMS rulemaking. High volume, much of it tangential —
        // a tight relevance gate keeps only items touching nursing / staffing /
        // long-term & skilled-nursing care / patient safety.
        id: "fedreg-cms",
        label: "Federal Register — CMS",
        rssUrl: "https://www.federalregister.gov/api/v1/documents.json?per_page=20&order=newest&conditions%5Bagencies%5D%5B%5D=centers-for-medicare-medicaid-services",
        authority: "federal_register",
        category: "licensure",
        license: "public_domain",
        kind: "json",
        verified: true,  // confirmed 2026-06-24: 200, CMS docs with abstracts
        maxItemsPerRun: 6,
        relevanceKeywords: [
            "nurse", "nursing", "staffing", "skilled nursing", "long-term care",
            "nursing home", "patient safety", "hospital conditions of participation",
        ],
    },

    // -------------------------------------------------------------------------
    // Deferred (verified: false) — audited, not active. Documented so future-us
    // doesn't re-investigate.
    // -------------------------------------------------------------------------
    {
        // CDC retired the HAN RSS feed; emergency.cdc.gov/han/rss.asp
        // 301-redirects to a static index page. A working HAN ingestion would
        // require scraping https://emergency.cdc.gov/han/ (no RSS) — defer.
        id: "cdc-han",
        label: "CDC Health Alert Network",
        rssUrl: "https://emergency.cdc.gov/han/rss.asp",
        authority: "cdc",
        category: "public_health",
        license: "public_domain",
        verified: false,
        maxItemsPerRun: 5,
    },
    {
        // NOTE 2026-06-24: confirmed the item <link>s point to PDF downloads
        // (tools.cdc.gov/api/embed/downloader/download.asp), not article HTML.
        // Article-body fetch + the user-facing "read full" link + citations all
        // break on PDF URLs. Defer until an article-oriented MMWR endpoint exists.
        id: "cdc-mmwr",
        label: "CDC MMWR Weekly",
        rssUrl: "https://tools.cdc.gov/api/v2/resources/media/342778.rss",
        authority: "mmwr",
        category: "research",
        license: "public_domain",
        verified: false,
        maxItemsPerRun: 8,
    },
    {
        // NOTE 2026-06-24: same issue as MMWR — item <link>s are download.asp
        // PDF endpoints, not article HTML. Good content, wrong link shape.
        id: "cdc-outbreaks",
        label: "CDC Current Outbreaks (US)",
        rssUrl: "https://tools.cdc.gov/api/v2/resources/media/285676.rss",
        authority: "cdc",
        category: "public_health",
        license: "public_domain",
        verified: false,
        maxItemsPerRun: 8,
    },
    {
        // NOTE 2026-06-24: OSHA news works (valid RSS, article HTML links) but
        // most items are employer-citation / training announcements with low
        // nurse relevance. The relevance gate below is tuned for healthcare;
        // flip verified:true once we want the (low) volume of HC-safety items.
        id: "osha-news",
        label: "OSHA News Releases",
        rssUrl: "https://www.osha.gov/news/newsreleases.xml",
        authority: "osha",
        category: "public_health",
        license: "public_domain",
        verified: false,
        maxItemsPerRun: 5,
        relevanceKeywords: [
            "hospital", "health care", "healthcare", "nursing", "nurse",
            "workplace violence", "bloodborne", "needlestick", "patient",
        ],
        dropPatterns: ["training", "webinar", "to host", "to hold"],
    },
    {
        // PLOS Global Public Health — same CC BY Atom infrastructure as PLOS
        // Medicine. Not independently fetched yet; verify the feed returns
        // entries before flipping true (codebase rule: verify, don't assume).
        id: "plos-gph",
        label: "PLOS Global Public Health",
        rssUrl: "https://journals.plos.org/globalpublichealth/feed/atom",
        authority: "plos",
        category: "public_health",
        license: "cc_by_4",
        skipArticleFetch: true,
        verified: false,
        maxItemsPerRun: 6,
    },
]

export function getVerifiedSources(): IngestSource[] {
    return SOURCES.filter((s) => s.verified)
}

export function findSource(id: string): IngestSource | undefined {
    return SOURCES.find((s) => s.id === id)
}
