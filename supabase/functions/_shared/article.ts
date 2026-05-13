// =============================================================================
// _shared/article.ts — Fetch + extract article body text from a source URL.
//
// Why: RSS descriptions on Tier 1 sources are ~1-2 sentences — far too thin
// for feed-author to write a cited 100-5000 char body. Fetching the linked
// page and extracting the article body gives Sonnet 3-8 KB of ground truth
// to write against, which lifts the publishable-item rate from ~30% to ~80%.
//
// Extraction strategy (no library — Tier 1 pages are well-structured government
// HTML; a focused regex pipeline beats pulling in a 300KB readability lib):
//
//   1. Strip <script>, <style>, <noscript>, <nav>, <footer>, <header>, <aside>
//      blocks entirely — none of those carry article text.
//   2. Locate the article body by preferring, in order: <main>, <article>,
//      then the entire <body>. Site-specific selectors handled by HOSTS map.
//   3. Convert remaining tags to whitespace, decode entities, collapse runs.
//   4. Truncate to MAX_CHARS — Sonnet doesn't benefit from >8 KB of source.
//
// Politeness: User-Agent identifies NurseMind and points to editorial-standards.
// One-second pacing per host is enforced by the caller (feed-ingest).
// =============================================================================

const USER_AGENT = "NurseMind-Feed/1.1 (+https://nursemind.app/editorial-standards)"
const FETCH_TIMEOUT_MS = 20_000
const MAX_CHARS = 8_000

// Host-specific extraction overrides. When the generic <main>/<article>
// extraction fails on a site, add a focused regex here that captures just the
// article body. Each entry returns either matched text or null to fall back
// to the generic extractor.
const HOSTS: Record<string, (html: string) => string | null> = {
    "www.fda.gov": extractFDA,
    "emergency.cdc.gov": extractCDC,
    "www.cdc.gov": extractCDC,
}

export type ArticleResult = {
    /** Full plain-text article body, normalized whitespace, truncated. */
    text: string
    /** Bytes of the source HTML. Useful for logging/debugging. */
    htmlBytes: number
    /** Whether host-specific extraction was used (vs generic). */
    extractor: "host" | "main" | "article" | "body" | "raw"
}

/**
 * Fetch the URL and extract its article body. Throws on fetch failure or
 * if no text could be extracted (after extractor fallback). Caller catches
 * and falls back to the RSS description.
 */
export async function fetchArticle(url: string): Promise<ArticleResult> {
    const controller = new AbortController()
    const id = setTimeout(() => controller.abort(), FETCH_TIMEOUT_MS)

    let html: string
    try {
        const res = await fetch(url, {
            headers: {
                "user-agent": USER_AGENT,
                "accept": "text/html, application/xhtml+xml;q=0.9, */*;q=0.5",
                "accept-language": "en-US,en;q=0.9",
            },
            signal: controller.signal,
            redirect: "follow",
        })
        if (!res.ok) {
            throw new Error(`HTTP ${res.status} ${res.statusText}`)
        }
        html = await res.text()
    } finally {
        clearTimeout(id)
    }

    const htmlBytes = html.length

    // 1. Strip non-content blocks first — every subsequent extractor reads cleaner.
    const cleaned = stripNonContent(html)

    // 2. Host-specific extractor wins if the URL host matches.
    const host = safeHost(url)
    if (host && HOSTS[host]) {
        const hostResult = HOSTS[host](cleaned)
        if (hostResult) {
            return finalize(hostResult, htmlBytes, "host")
        }
    }

    // 3. Generic fallback: <main> > <article> > <body>.
    for (const [tag, label] of [["main", "main"], ["article", "article"], ["body", "body"]] as const) {
        const block = extractTag(cleaned, tag)
        if (block) {
            const txt = htmlToText(block)
            if (txt.length >= 100) return finalize(txt, htmlBytes, label)
        }
    }

    // 4. Last resort: whole cleaned doc as text.
    const raw = htmlToText(cleaned)
    if (raw.length >= 100) return finalize(raw, htmlBytes, "raw")

    throw new Error("Article extraction produced too little text")
}

// -----------------------------------------------------------------------------
// Helpers
// -----------------------------------------------------------------------------

function finalize(text: string, htmlBytes: number, extractor: ArticleResult["extractor"]): ArticleResult {
    const trimmed = text.length > MAX_CHARS ? text.slice(0, MAX_CHARS) : text
    return { text: trimmed, htmlBytes, extractor }
}

function safeHost(url: string): string | null {
    try { return new URL(url).host } catch { return null }
}

function stripNonContent(html: string): string {
    return html
        .replace(/<script\b[^>]*>[\s\S]*?<\/script\s*>/gi, " ")
        .replace(/<style\b[^>]*>[\s\S]*?<\/style\s*>/gi, " ")
        .replace(/<noscript\b[^>]*>[\s\S]*?<\/noscript\s*>/gi, " ")
        .replace(/<nav\b[^>]*>[\s\S]*?<\/nav\s*>/gi, " ")
        .replace(/<header\b[^>]*>[\s\S]*?<\/header\s*>/gi, " ")
        .replace(/<footer\b[^>]*>[\s\S]*?<\/footer\s*>/gi, " ")
        .replace(/<aside\b[^>]*>[\s\S]*?<\/aside\s*>/gi, " ")
        .replace(/<form\b[^>]*>[\s\S]*?<\/form\s*>/gi, " ")
        .replace(/<!--[\s\S]*?-->/g, " ")
}

function extractTag(html: string, tag: string): string | null {
    const re = new RegExp(`<${tag}\\b[^>]*>([\\s\\S]*?)<\\/${tag}\\s*>`, "i")
    const m = html.match(re)
    return m ? m[1] : null
}

function htmlToText(html: string): string {
    // Convert block-level tags to newlines BEFORE stripping all tags, so paragraphs
    // don't collapse into one wall of text.
    const blocky = html
        .replace(/<\/(p|div|li|h[1-6]|tr|br)\s*>/gi, "\n")
        .replace(/<br\b[^>]*\/?>/gi, "\n")
    return decodeEntities(blocky.replace(/<[^>]+>/g, " "))
        .replace(/[ \t]+/g, " ")
        .replace(/\n{3,}/g, "\n\n")
        .split("\n")
        .map((line) => line.trim())
        .filter(Boolean)
        .join("\n")
}

function decodeEntities(s: string): string {
    return s
        .replace(/&nbsp;/g, " ")
        .replace(/&amp;/g, "&")
        .replace(/&lt;/g, "<")
        .replace(/&gt;/g, ">")
        .replace(/&quot;/g, '"')
        .replace(/&apos;/g, "'")
        .replace(/&#(\d+);/g, (_, n) => String.fromCharCode(parseInt(n, 10)))
        .replace(/&#x([0-9a-fA-F]+);/g, (_, n) => String.fromCharCode(parseInt(n, 16)))
}

// -----------------------------------------------------------------------------
// Host-specific extractors
// -----------------------------------------------------------------------------

/**
 * FDA pages put article content inside a div with role="main" or inside
 * `<div class="block-system-main-block">`. Either signal works; we try main
 * first, then the block class.
 */
function extractFDA(html: string): string | null {
    // Try role="main" container (Drupal pattern on www.fda.gov)
    const roleMain = html.match(/<div\b[^>]*\brole=["']main["'][^>]*>([\s\S]*?)<\/div\s*>(?=\s*<(?:footer|aside|div\s+class=["']region))/i)
    if (roleMain) {
        const txt = htmlToText(roleMain[1])
        if (txt.length >= 200) return txt
    }

    // Fallback: `block-system-main-block` class
    const blockMain = html.match(/<div\b[^>]*\bclass=["'][^"']*\bblock-system-main-block\b[^"']*["'][^>]*>([\s\S]*?)<\/div\s*>/i)
    if (blockMain) {
        const txt = htmlToText(blockMain[1])
        if (txt.length >= 200) return txt
    }

    return null
}

/**
 * CDC HAN advisories and MMWR articles use a few different layouts; the
 * `syndicate` class wrapping the article body is the most consistent signal.
 */
function extractCDC(html: string): string | null {
    const syndicate = html.match(/<div\b[^>]*\bclass=["'][^"']*\bsyndicate\b[^"']*["'][^>]*>([\s\S]*?)<\/div\s*>(?=\s*<(?:footer|aside|nav|div\s+class=["']page-footer))/i)
    if (syndicate) {
        const txt = htmlToText(syndicate[1])
        if (txt.length >= 200) return txt
    }

    const contentArea = html.match(/<div\b[^>]*\bid=["']content["'][^>]*>([\s\S]*?)<\/div\s*>/i)
    if (contentArea) {
        const txt = htmlToText(contentArea[1])
        if (txt.length >= 200) return txt
    }

    return null
}
