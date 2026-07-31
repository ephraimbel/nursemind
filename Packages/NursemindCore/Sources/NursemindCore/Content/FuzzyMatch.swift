import Foundation

/// Bounded edit-distance matching for typo correction in library search.
///
/// Nurses type drug names from memory, one-handed, at 3 AM. "norepinepherine",
/// "metropolol", "acetominophen" are the norm, not the exception — and a pure
/// substring index returns nothing at all for them. This closes that gap by
/// mapping an unrecognized query token onto the nearest term the corpus
/// actually contains.
///
/// Optimal string alignment (Damerau-Levenshtein restricted to adjacent
/// transpositions) rather than plain Levenshtein: transposition is the single
/// most common typing error, and it costs 1 here instead of 2.
enum FuzzyMatch {

    /// How far a token of a given length is allowed to be from its correction.
    ///
    /// Short tokens get no slack — at 3 characters, distance 1 makes every
    /// clinical abbreviation a neighbour of every other one ("map"/"cap",
    /// "abg"/"abd"). Long tokens get 2, which covers the double-fault typos
    /// ("metropolol" → "metoprolol" is two adjacent transpositions).
    static func maxDistance(forTokenLength length: Int) -> Int {
        switch length {
        case ..<4:  return 0      // never fuzzy-match abbreviations
        case 4...7: return 1
        default:    return 2
        }
    }

    /// Optimal string alignment distance, or `nil` if it exceeds `limit`.
    /// Returning `nil` early is the point — callers scan a whole vocabulary and
    /// only care about near neighbours.
    static func distance(_ a: [UInt8], _ b: [UInt8], limit: Int) -> Int? {
        let n = a.count
        let m = b.count
        if abs(n - m) > limit { return nil }
        if n == 0 { return m <= limit ? m : nil }
        if m == 0 { return n <= limit ? n : nil }

        var beforePrevious = [Int](repeating: 0, count: m + 1)
        var previous = [Int](repeating: 0, count: m + 1)
        var current = [Int](repeating: 0, count: m + 1)
        for j in 0...m { previous[j] = j }

        for i in 1...n {
            current[0] = i
            var rowMin = i
            for j in 1...m {
                let cost = a[i - 1] == b[j - 1] ? 0 : 1
                var value = min(
                    previous[j] + 1,          // deletion
                    current[j - 1] + 1,       // insertion
                    previous[j - 1] + cost    // substitution
                )
                // Adjacent transposition ("ci" typed as "ic").
                if i > 1, j > 1, a[i - 1] == b[j - 2], a[i - 2] == b[j - 1] {
                    value = min(value, beforePrevious[j - 2] + 1)
                }
                current[j] = value
                rowMin = min(rowMin, value)
            }
            // Every alignment through this row already costs more than allowed.
            if rowMin > limit { return nil }
            swap(&beforePrevious, &previous)
            swap(&previous, &current)
        }

        let result = previous[m]
        return result <= limit ? result : nil
    }

    /// The closest vocabulary term to `token`, or `nil` when nothing is near
    /// enough. Ties break toward the shorter term — corrections should land on
    /// the base word ("heparin") rather than a longer compound that happens to
    /// sit the same distance away.
    ///
    /// `vocabulary` is expected to be pre-lowercased ASCII.
    static func bestCorrection(for token: String, in vocabulary: [[UInt8]]) -> Int? {
        let limit = maxDistance(forTokenLength: token.count)
        guard limit > 0 else { return nil }

        let needle = Array(token.utf8)
        // Multi-byte input would make byte distance meaningless; clinical
        // vocabulary is ASCII, so skip rather than mis-correct.
        guard needle.count == token.count else { return nil }

        var bestIndex: Int?
        var bestDistance = limit + 1
        var bestLength = Int.max

        for (index, candidate) in vocabulary.enumerated() {
            guard abs(candidate.count - needle.count) <= limit else { continue }
            guard let d = distance(needle, candidate, limit: min(limit, bestDistance)) else { continue }
            if d < bestDistance || (d == bestDistance && candidate.count < bestLength) {
                bestDistance = d
                bestLength = candidate.count
                bestIndex = index
                if d == 0 { break }
            }
        }
        return bestIndex
    }
}
