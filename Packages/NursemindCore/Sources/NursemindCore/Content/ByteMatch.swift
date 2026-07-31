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
    static func contains(_ haystack: [UInt8], _ needle: [UInt8]) -> Bool {
        let needleCount = needle.count
        let haystackCount = haystack.count
        guard needleCount > 0, needleCount <= haystackCount else { return false }

        return haystack.withUnsafeBufferPointer { hay in
            needle.withUnsafeBufferPointer { need -> Bool in
                let first = need[0]
                let last = needleCount - 1
                var start = 0
                let limit = haystackCount - needleCount

                while start <= limit {
                    // Skip to the next possible starting byte.
                    while start <= limit, hay[start] != first { start += 1 }
                    guard start <= limit else { return false }

                    // Compare the final byte before the body — cheap rejection
                    // for the common case of a shared first character.
                    if hay[start + last] == need[last] {
                        var offset = 1
                        while offset < last, hay[start + offset] == need[offset] { offset += 1 }
                        if offset >= last { return true }
                    }
                    start += 1
                }
                return false
            }
        }
    }

    /// True when `haystack` begins with `prefix`.
    static func hasPrefix(_ haystack: [UInt8], _ prefix: [UInt8]) -> Bool {
        guard prefix.count <= haystack.count else { return false }
        for index in 0..<prefix.count where haystack[index] != prefix[index] {
            return false
        }
        return true
    }
}
