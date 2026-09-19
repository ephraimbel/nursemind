import Foundation

/// UTF-8 byte matching for the search hot loop.
///
/// `String.contains` is Unicode-correct — it normalizes and walks graphemes —
/// and search runs it across every indexed entry's full body text on each
/// keystroke. At ~3.5 MB of corpus text per query that dominates the latency
/// budget. Matching on raw UTF-8 bytes is the same answer for our inputs
/// (the corpus and the query are both lowercased, and UTF-8 is
/// self-synchronizing, so a valid needle can never match mid-character) at a
/// fraction of the cost.
enum ByteMatch {

    /// True when `needle` appears anywhere in `haystack`.
    ///
    /// `memmem` is the platform's vectorized substring search; the answer is
    /// identical to a byte-by-byte scan, and it runs an order of magnitude
    /// faster over the ~4 MB of corpus text a keystroke has to cover.
    static func contains(_ haystack: [UInt8], _ needle: [UInt8]) -> Bool {
        let needleCount = needle.count
        let haystackCount = haystack.count
        guard needleCount > 0, needleCount <= haystackCount else { return false }
        return haystack.withUnsafeBufferPointer { hay in
            needle.withUnsafeBufferPointer { need in
                memmem(hay.baseAddress, haystackCount, need.baseAddress, needleCount) != nil
            }
        }
    }

    /// True when `haystack` begins with `prefix`.
    static func hasPrefix(_ haystack: [UInt8], _ prefix: [UInt8]) -> Bool {
        guard prefix.count <= haystack.count else { return false }
        guard !prefix.isEmpty else { return true }
        return haystack.withUnsafeBufferPointer { hay in
            prefix.withUnsafeBufferPointer { pre in
                memcmp(hay.baseAddress, pre.baseAddress, prefix.count) == 0
            }
        }
    }
}
