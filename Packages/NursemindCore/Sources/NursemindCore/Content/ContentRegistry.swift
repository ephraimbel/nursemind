import Foundation

/// Single source of truth for all library entries in v1.
/// Backed by in-memory Swift literals for v1; replaced by Supabase-backed cache in v1.1.
public final class ContentRegistry: @unchecked Sendable {
    public static let shared = ContentRegistry()

    private let entriesByID: [String: LibraryEntry]
    private let entriesByCategory: [EntryCategory: [LibraryEntry]]
    private let allEntries: [LibraryEntry]

    public init(entries: [LibraryEntry] = ContentRegistry.bundledEntries()) {
        let sorted = entries.sorted { $0.title.localizedCaseInsensitiveCompare($1.title) == .orderedAscending }
        self.allEntries = sorted

        var byID: [String: LibraryEntry] = [:]
        var byCategory: [EntryCategory: [LibraryEntry]] = [:]
        for entry in sorted {
            byID[entry.id] = entry
            byCategory[entry.category, default: []].append(entry)
        }
        self.entriesByID = byID
        self.entriesByCategory = byCategory
    }

    // MARK: - Lookup

    public func entry(byID id: String) -> LibraryEntry? {
        entriesByID[id]
    }

    public func entry(category: EntryCategory, slug: String) -> LibraryEntry? {
        entriesByID["\(category.rawValue):\(slug)"]
    }

    public func entries(in category: EntryCategory) -> [LibraryEntry] {
        entriesByCategory[category] ?? []
    }

    public func count(in category: EntryCategory) -> Int {
        entriesByCategory[category]?.count ?? 0
    }

    public var all: [LibraryEntry] { allEntries }

    public var allCategories: [EntryCategory] {
        EntryCategory.allCases.sorted { $0.browseOrder < $1.browseOrder }
    }

    // MARK: - Search

    /// Token-weighted search. Title matches dominate; longer keyword tokens dominate
    /// short connectives. Filters common English/clinical stop words so questions
    /// score on their topic, not their grammar.
    ///
    /// Optional `specialty` boost: entries tagged with the active specialty get
    /// a 1.4× score multiplier. This re-ranks but never excludes — we never
    /// hide content, even when the user has a specialty selected.
    public func search(_ query: String, limit: Int = 20, specialty: NursingSpecialty? = nil) -> [LibraryEntry] {
        let q = query.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return [] }

        // Expand clinical abbreviations and synonyms before tokenizing so that
        // "MI" and "myocardial infarction" produce the same retrieval.
        let expanded = ClinicalSynonyms.expand(query: q)

        // Strip punctuation, split, drop stop words and tokens shorter than 3 chars.
        let stripped = expanded.unicodeScalars
            .filter { CharacterSet.alphanumerics.contains($0) || $0 == " " || $0 == "-" }
            .map(Character.init)
        let cleaned = String(stripped)
        let rawTokens = cleaned.split(separator: " ").map(String.init)
        let keywordTokens = rawTokens.filter { $0.count >= 3 && !ContentRegistry.stopWords.contains($0) }

        var scored: [(entry: LibraryEntry, score: Double)] = []
        for entry in allEntries {
            let text = entry.searchText
            let title = entry.title.lowercased()
            var score: Double = 0

            // Big wins: full-query match in title.
            if title == q                       { score += 5000 }
            if title.hasPrefix(q)               { score += 2000 }
            if text.hasPrefix(q)                { score += 1000 }

            // Per-keyword matching: longer tokens count more, title matches outweigh body.
            for token in keywordTokens {
                let weight = Double(token.count)   // 3-letter token = 3, "vancomycin" = 10
                if title == token              { score += weight * 50 }
                else if title.contains(token)  { score += weight * 20 }
                else if text.contains(token)   { score += weight * 5 }
            }

            // Conservative whole-query contains (not enough on its own).
            if score == 0 && text.contains(q)   { score += 50 }

            // Specialty boost — multiplicative, never penalizing.
            if let specialty, score > 0, entry.specialties.contains(specialty) {
                score *= 1.4
            }

            if score > 0 { scored.append((entry, score)) }
        }
        return scored
            .sorted { $0.score > $1.score }
            .prefix(limit)
            .map(\.entry)
    }

    private static let stopWords: Set<String> = [
        "the", "and", "for", "with", "what", "how", "when", "why", "who", "which",
        "are", "you", "your", "this", "that", "these", "those", "have", "has", "had",
        "can", "should", "would", "will", "must", "may", "might", "give", "tell", "show",
        "patient", "patients", "drug", "drugs", "dose", "dosing", "iv", "po", "im", "sc",
        "nurse", "nursing", "implications", "considerations", "monitor", "monitoring",
        "about", "from", "into", "onto", "than", "then", "into", "after", "before"
    ]

    /// Heuristic for whether the search query reads like a question — used to decide
    /// when to surface the "Ask NurseMind" AI fallback (spec §4.8).
    public static func looksLikeQuestion(_ query: String) -> Bool {
        let q = query.lowercased()
        if q.contains("?") { return true }
        for stem in ["how", "when", "why", "what", "which", "should", "is it", "can i", "do i"] {
            if q.hasPrefix(stem + " ") { return true }
        }
        return false
    }
}
