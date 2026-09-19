// =============================================================================
// entry-links — match a Feed story against the library title manifest.
//
// Port of the iOS `FeedLibraryMatcher` (Feed/FeedLibraryMatcher.swift). Both
// sides must agree: an entry matches when its normalized title (text before
// any parenthetical, lowercased, at least four characters) appears as a
// whole word in headline + dek + body. Longest titles rank first; one entry
// per (category, key). The result is stored on feed_items.related_entry_ids.
// =============================================================================

import manifest from "./entry-titles.json" with { type: "json" }

export type EntryTitle = { id: string; title: string; category: string }

export const MAX_RELATED_ENTRIES = 12
const MIN_KEY_LENGTH = 4

type Prepared = { entry: EntryTitle; key: string }

let prepared: Prepared[] | null = null

/// "Heparin (unfractionated)" → "heparin"
export function matchKey(title: string): string {
    return title.split(" (")[0].toLowerCase().trim()
}

/// Whole-word containment: "pain" matches "chest pain relief" but not
/// "painting". Letters on either side of the hit disqualify it.
export function containsWord(haystack: string, needle: string): boolean {
    let from = 0
    while (true) {
        const at = haystack.indexOf(needle, from)
        if (at < 0) return false
        const beforeOK = at === 0 || !isLetter(haystack[at - 1])
        const after = at + needle.length
        const afterOK = after === haystack.length || !isLetter(haystack[after])
        if (beforeOK && afterOK) return true
        from = at + needle.length
    }
}

function isLetter(ch: string): boolean {
    return /\p{L}/u.test(ch)
}

function preparedEntries(entries: EntryTitle[]): Prepared[] {
    return entries
        .map((entry) => ({ entry, key: matchKey(entry.title) }))
        .filter((p) => p.key.length >= MIN_KEY_LENGTH)
        .sort((a, b) => b.key.length - a.key.length)
}

export function relatedEntryIDs(
    story: { headline: string; why_nurses_care: string; body: string },
    entries: EntryTitle[] = manifest as EntryTitle[],
    limit = MAX_RELATED_ENTRIES,
): string[] {
    const haystack = `${story.headline} ${story.why_nurses_care} ${story.body}`.toLowerCase()
    const candidates = entries === manifest
        ? (prepared ??= preparedEntries(entries))
        : preparedEntries(entries)

    const seen = new Set<string>()
    const result: string[] = []
    for (const { entry, key } of candidates) {
        if (!containsWord(haystack, key)) continue
        const dedupe = `${entry.category}|${key}`
        if (seen.has(dedupe)) continue
        seen.add(dedupe)
        result.push(entry.id)
        if (result.length === limit) break
    }
    return result
}
