// =============================================================================
// _shared/rss.ts — Minimal RSS 2.0 / Atom parser.
//
// We deliberately avoid pulling a heavy XML library into the edge runtime
// because (a) every Tier 1 source is a well-formed government feed with
// predictable structure, and (b) Deno cold-start time scales with the
// dependency tree, so a 50-line regex parser beats a 200KB XML lib here.
//
// If we ever ingest a source that fights the parser (CDATA-heavy, namespaces,
// nonstandard encoding), swap to https://deno.land/x/xml — but verify the
// cold-start cost stays under 200ms.
// =============================================================================

export type RssItem = {
    title: string
    link: string
    /** Free-form summary / description. Already HTML-stripped. */
    excerpt: string
    /** Optional publish timestamp (RFC 822 or ISO 8601 — caller normalizes). */
    pubDate: string | null
    /** Best-effort stable id (guid > link). Used as a secondary dedupe signal. */
    guid: string
}

export type RssParseResult = {
    feedTitle: string
    items: RssItem[]
}

// -----------------------------------------------------------------------------
// Public API
// -----------------------------------------------------------------------------

export function parseRss(xml: string): RssParseResult {
    const isAtom = /<feed\b[^>]*xmlns=["']http:\/\/www\.w3\.org\/2005\/Atom["']/i.test(xml)
    return isAtom ? parseAtom(xml) : parseRss2(xml)
}

// -----------------------------------------------------------------------------
// RSS 2.0
// -----------------------------------------------------------------------------

function parseRss2(xml: string): RssParseResult {
    const feedTitle = extractFirst(xml, /<channel\b[^>]*>[\s\S]*?<title>([\s\S]*?)<\/title>/i) ?? ""

    const items: RssItem[] = []
    // Greedy match of each <item>...</item> block. RSS 2.0 disallows nested
    // <item> so a non-greedy match is safe.
    const itemRe = /<item\b[^>]*>([\s\S]*?)<\/item>/gi
    let match: RegExpExecArray | null
    while ((match = itemRe.exec(xml)) !== null) {
        const block = match[1]
        items.push({
            title:   decode(extractFirst(block, /<title>([\s\S]*?)<\/title>/i) ?? ""),
            link:    decode(extractFirst(block, /<link>([\s\S]*?)<\/link>/i) ?? ""),
            excerpt: stripHtml(decode(extractFirst(block, /<description>([\s\S]*?)<\/description>/i) ?? "")),
            pubDate: extractFirst(block, /<pubDate>([\s\S]*?)<\/pubDate>/i),
            guid:    decode(extractFirst(block, /<guid[^>]*>([\s\S]*?)<\/guid>/i) ?? "")
                     || decode(extractFirst(block, /<link>([\s\S]*?)<\/link>/i) ?? ""),
        })
    }

    return { feedTitle: stripHtml(decode(feedTitle)), items }
}

// -----------------------------------------------------------------------------
// Atom (CDC/MMWR uses Atom for some feeds)
// -----------------------------------------------------------------------------

function parseAtom(xml: string): RssParseResult {
    // <feed>'s direct child <title> — not entry titles.
    const feedTitle = extractFirst(xml, /<feed\b[^>]*>[\s\S]*?<title[^>]*>([\s\S]*?)<\/title>/i) ?? ""

    const items: RssItem[] = []
    const entryRe = /<entry\b[^>]*>([\s\S]*?)<\/entry>/gi
    let match: RegExpExecArray | null
    while ((match = entryRe.exec(xml)) !== null) {
        const block = match[1]

        // Atom <link href="..." rel="alternate"/> — prefer rel=alternate, fall
        // back to first link.
        const alternateLink =
            extractFirst(block, /<link[^>]*\brel=["']alternate["'][^>]*\bhref=["']([^"']+)["']/i) ??
            extractFirst(block, /<link[^>]*\bhref=["']([^"']+)["'][^>]*\brel=["']alternate["']/i) ??
            extractFirst(block, /<link[^>]*\bhref=["']([^"']+)["']/i) ??
            ""

        items.push({
            title:   decode(stripHtml(extractFirst(block, /<title[^>]*>([\s\S]*?)<\/title>/i) ?? "")),
            link:    decode(alternateLink),
            excerpt: stripHtml(decode(
                extractFirst(block, /<summary[^>]*>([\s\S]*?)<\/summary>/i) ??
                extractFirst(block, /<content[^>]*>([\s\S]*?)<\/content>/i) ??
                ""
            )),
            pubDate: extractFirst(block, /<published[^>]*>([\s\S]*?)<\/published>/i)
                  ?? extractFirst(block, /<updated[^>]*>([\s\S]*?)<\/updated>/i),
            guid:    decode(extractFirst(block, /<id[^>]*>([\s\S]*?)<\/id>/i) ?? "") || decode(alternateLink),
        })
    }

    return { feedTitle: stripHtml(decode(feedTitle)), items }
}

// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

function extractFirst(haystack: string, pattern: RegExp): string | null {
    const m = haystack.match(pattern)
    if (!m) return null
    return unwrapCData(m[1].trim())
}

function unwrapCData(s: string): string {
    const cdata = s.match(/^\s*<!\[CDATA\[([\s\S]*?)\]\]>\s*$/)
    return cdata ? cdata[1].trim() : s
}

function stripHtml(s: string): string {
    return s
        .replace(/<[^>]+>/g, " ")
        .replace(/\s+/g, " ")
        .trim()
}

function decode(s: string): string {
    return s
        .replace(/&amp;/g, "&")
        .replace(/&lt;/g, "<")
        .replace(/&gt;/g, ">")
        .replace(/&quot;/g, "\"")
        .replace(/&apos;/g, "'")
        .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(parseInt(n, 10)))
        .replace(/&#x([0-9a-fA-F]+);/g, (_, n) => String.fromCharCode(parseInt(n, 16)))
}

/** Convert an RFC 822 or ISO 8601 timestamp to a Date, or null if unparseable. */
export function parsePubDate(raw: string | null): Date | null {
    if (!raw) return null
    const t = Date.parse(raw)
    return Number.isFinite(t) ? new Date(t) : null
}
