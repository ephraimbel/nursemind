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
            // A duplicate id silently shadows one entry — the earlier insert is
            // lost, so `entry(byID:)` (and every cross-reference / free-tier /
            // navigation link that resolves by id) can return the wrong entry.
            // Trap it in debug/test builds so a collision can't ship unnoticed.
            assert(byID[entry.id] == nil, "Duplicate library entry id: \(entry.id)")
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

    // MARK: - Search index

    /// One entry's precomputed retrieval fields. `LibraryEntry.searchText` walks
    /// and joins every section of an entry on each access, and `specialties`
    /// walks it a second time — recomputing both for 1,700+ entries on every
    /// keystroke was the whole search latency budget. Built once, reused.
    private struct IndexedEntry {
        let entry: LibraryEntry
        let title: [UInt8]
        let text: [UInt8]
        let specialties: Set<NursingSpecialty>
    }

    private struct SearchIndex {
        let entries: [IndexedEntry]
        /// Distinct title tokens, the correction target for misspelled queries.
        /// Titles only: they are the high-precision names of things, so a
        /// correction lands on "vancomycin" rather than some incidental word in
        /// a body paragraph.
        let titleVocabulary: [String]
        let titleVocabularyBytes: [[UInt8]]
    }

    private let indexLock = NSLock()
    private var cachedIndex: SearchIndex?

    /// Builds the search index off the hot path. Callers that know a search is
    /// imminent (the Search sheet appearing, the Ask surface loading) can pay
    /// the one-time cost in the background instead of on the first keystroke.
    public func prewarmIndex() {
        _ = searchIndex()
    }

    private func searchIndex() -> SearchIndex {
        indexLock.lock()
        defer { indexLock.unlock() }
        if let cachedIndex { return cachedIndex }

        var indexed: [IndexedEntry] = []
        indexed.reserveCapacity(allEntries.count)
        var vocabulary: Set<String> = []

        for entry in allEntries {
            let title = entry.title.lowercased()
            // `searchText` walks and joins every section of the entry, and it
            // already leads with the title — so compute it once here and derive
            // both the match corpus and the specialty tags from that one pass.
            // Reading `entry.specialties` instead would walk the entry a second
            // time for the same bytes.
            let textBytes = Array(entry.searchText.utf8)
            indexed.append(IndexedEntry(
                entry: entry,
                title: Array(title.utf8),
                text: textBytes,
                specialties: Set(SpecialtyHeuristic.infer(haystack: textBytes))
            ))
            for token in ContentRegistry.tokenize(title) where token.count >= 4 {
                vocabulary.insert(token)
            }
        }

        let vocabularyList = vocabulary.sorted()
        let built = SearchIndex(
            entries: indexed,
            titleVocabulary: vocabularyList,
            titleVocabularyBytes: vocabularyList.map { Array($0.utf8) }
        )
        cachedIndex = built
        return built
    }

    /// Strips punctuation and splits on whitespace. Hyphens survive as separators
    /// so "chest-tube" tokenizes the same way "chest tube" does.
    private static func tokenize(_ input: String) -> [String] {
        var current = ""
        var tokens: [String] = []
        for scalar in input.unicodeScalars {
            if CharacterSet.alphanumerics.contains(scalar) {
                current.unicodeScalars.append(scalar)
            } else if !current.isEmpty {
                tokens.append(current)
                current = ""
            }
        }
        if !current.isEmpty { tokens.append(current) }
        return tokens
    }

    // MARK: - Search

    /// A fuzzy-corrected token never outranks a term the user actually typed.
    private static let fuzzyDamping = 0.6

    /// Token-weighted search. Title matches dominate; longer keyword tokens dominate
    /// short connectives. Filters common English/clinical stop words so questions
    /// score on their topic, not their grammar.
    ///
    /// Typo tolerance is a second pass, not a first-class signal: tokens that
    /// matched nothing anywhere in the corpus — and only those — get corrected
    /// to their nearest title term and re-scored at a damped weight. A correctly
    /// spelled query therefore takes exactly the path it took before, and an
    /// exact match always outranks a corrected one.
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
        let keywordTokens = ContentRegistry.tokenize(expanded)
            .filter { $0.count >= 3 && !ContentRegistry.stopWords.contains($0) }

        let index = searchIndex()
        var scores = [Double](repeating: 0, count: index.entries.count)
        var tokenMatched = [Bool](repeating: false, count: keywordTokens.count)

        let queryBytes = Array(q.utf8)
        let tokenBytes = keywordTokens.map { Array($0.utf8) }

        for (position, indexed) in index.entries.enumerated() {
            var score: Double = 0

            // Big wins: full-query match in title.
            if indexed.title == queryBytes                          { score += 5000 }
            if ByteMatch.hasPrefix(indexed.title, queryBytes)       { score += 2000 }
            if ByteMatch.hasPrefix(indexed.text, queryBytes)        { score += 1000 }

            // Per-keyword matching: longer tokens count more, title beats body.
            for (tokenIndex, token) in tokenBytes.enumerated() {
                let weight = Double(keywordTokens[tokenIndex].count)  // "vancomycin" = 10
                if indexed.title == token {
                    score += weight * 50
                    tokenMatched[tokenIndex] = true
                } else if ByteMatch.contains(indexed.title, token) {
                    score += weight * 20
                    tokenMatched[tokenIndex] = true
                } else if ByteMatch.contains(indexed.text, token) {
                    score += weight * 5
                    tokenMatched[tokenIndex] = true
                }
            }

            // Conservative whole-query contains (not enough on its own).
            if score == 0, ByteMatch.contains(indexed.text, queryBytes) { score += 50 }

            scores[position] = score
        }

        // Typo pass. A token that matched nothing anywhere is either a
        // misspelling or a word we don't cover; correcting it can only add
        // recall, because there was no signal to dilute.
        let corrections = corrections(for: keywordTokens, matched: tokenMatched, index: index)
        if !corrections.isEmpty {
            let correctionBytes = corrections.map { (Array($0.utf8), Double($0.count) * ContentRegistry.fuzzyDamping) }
            for (position, indexed) in index.entries.enumerated() {
                var bonus: Double = 0
                for (token, weight) in correctionBytes {
                    if indexed.title == token                          { bonus += weight * 50 }
                    else if ByteMatch.contains(indexed.title, token)   { bonus += weight * 20 }
                    else if ByteMatch.contains(indexed.text, token)    { bonus += weight * 5 }
                }
                scores[position] += bonus
            }
        }

        var scored: [(entry: LibraryEntry, score: Double)] = []
        for (position, indexed) in index.entries.enumerated() {
            var score = scores[position]
            guard score > 0 else { continue }
            // Specialty boost — multiplicative, never penalizing.
            if let specialty, indexed.specialties.contains(specialty) {
                score *= 1.4
            }
            scored.append((indexed.entry, score))
        }

        return scored
            .sorted { $0.score > $1.score }
            .prefix(limit)
            .map(\.entry)
    }

    /// Nearest title term for every token that scored nothing. Deduplicated so a
    /// query repeating the same misspelling doesn't double-weight the fix.
    private func corrections(
        for tokens: [String],
        matched: [Bool],
        index: SearchIndex
    ) -> [String] {
        var out: [String] = []
        var seen: Set<String> = []
        for (position, token) in tokens.enumerated() where !matched[position] {
            guard let vocabularyIndex = FuzzyMatch.bestCorrection(
                for: token,
                in: index.titleVocabularyBytes
            ) else { continue }
            let correction = index.titleVocabulary[vocabularyIndex]
            if seen.insert(correction).inserted {
                out.append(correction)
            }
        }
        return out
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
