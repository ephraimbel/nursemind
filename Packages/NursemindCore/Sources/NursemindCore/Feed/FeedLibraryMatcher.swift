import Foundation

/// Client-side match of a feed story against the bundled library, powering
/// the "In your library" section on the reading view. Pure function over the
/// in-memory registry — no network, no new schema.
///
/// Matching contract: an entry is related when its title (normalized: text
/// before any parenthetical, lowercased) appears as a whole word in the
/// story's headline + dek + body. Longest titles win the ranking — a match
/// on "semaglutide" outranks a match on "pain".
enum FeedLibraryMatcher {
    static func relatedEntries(
        for item: FeedItem,
        registry: ContentRegistry = .shared,
        limit: Int = 3
    ) -> [LibraryEntry] {
        let haystack = "\(item.headline) \(item.whyNursesCare) \(item.body)".lowercased()
        var matches: [(entry: LibraryEntry, key: String)] = []

        for entry in registry.all {
            let key = matchKey(for: entry.title)
            guard key.count >= 4 else { continue }
            if containsWord(haystack, key) {
                matches.append((entry, key))
            }
        }

        matches.sort { $0.key.count > $1.key.count }

        // One entry per matched concept — a story matching both the drug and
        // the drip form of "heparin" should link each once, but two entries
        // matching on the same key would be redundant slots.
        var seenKeys = Set<String>()
        var result: [LibraryEntry] = []
        for match in matches where !seenKeys.contains("\(match.entry.category)|\(match.key)") {
            seenKeys.insert("\(match.entry.category)|\(match.key)")
            result.append(match.entry)
            if result.count == limit { break }
        }
        return result
    }

    /// "Heparin (unfractionated)" → "heparin"
    private static func matchKey(for title: String) -> String {
        (title.components(separatedBy: " (").first ?? title)
            .lowercased()
            .trimmingCharacters(in: .whitespaces)
    }

    /// Whole-word containment: "pain" matches "chest pain relief" but not
    /// "painting". Letters on either side of the hit disqualify it.
    private static func containsWord(_ haystack: String, _ needle: String) -> Bool {
        var searchRange = haystack.startIndex..<haystack.endIndex
        while let r = haystack.range(of: needle, range: searchRange) {
            let beforeOK = r.lowerBound == haystack.startIndex
                || !haystack[haystack.index(before: r.lowerBound)].isLetter
            let afterOK = r.upperBound == haystack.endIndex
                || !haystack[r.upperBound].isLetter
            if beforeOK && afterOK { return true }
            searchRange = r.upperBound..<haystack.endIndex
        }
        return false
    }
}
