import Foundation

/// Client-side first-defense PHI redaction. Mirrors the server-side scrubber so the
/// app never transmits obvious PHI even on the slow path. Patterns are spec §2.2.
///
/// This is the FIRST line of defense, not the only one — the server-side scrubber
/// runs again before the AI request and is canonical. False negatives here are
/// possible in either layer; pattern matching is not a guarantee of de-identification.
public enum PHIScrubber {

    public struct Result: Sendable {
        public let scrubbed: String
        public let redacted: Bool
    }

    /// Returns the input with PHI-shaped tokens replaced by placeholders.
    public static func scrub(_ input: String) -> Result {
        var output = input
        var redacted = false

        for (pattern, replacement) in patterns {
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { continue }
            let range = NSRange(output.startIndex..., in: output)
            let matchCount = regex.numberOfMatches(in: output, options: [], range: range)
            if matchCount > 0 {
                redacted = true
                output = regex.stringByReplacingMatches(in: output, options: [], range: range, withTemplate: replacement)
            }
        }

        return Result(scrubbed: output, redacted: redacted)
    }

    // Pattern, replacement.
    // Order matters: more specific patterns first so they aren't pre-empted.
    private static let patterns: [(String, String)] = [
        (#"(?i)\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b"#, "[email]"),
        (#"(?i)\b(?:DOB|date of birth)\s*:?\s*(?:\d{4}-\d{1,2}-\d{1,2}|\d{1,2}[/-]\d{1,2}[/-]\d{2,4}|[A-Z]+\s+\d{1,2},?\s+\d{4})\b"#, "[date of birth]"),
        (#"\b(?:19|20)\d{2}-\d{2}-\d{2}\b"#, "[date]"),
        // Name with title (Mr/Mrs/Ms/Dr/Mx)
        (#"\b(Mr|Mrs|Ms|Dr|Mx)\.?\s+[A-Z][a-z]+(?:\s+[A-Z][a-z]+)?\b"#, "[name]"),
        // Two capitalized words followed by a clinical verb
        (#"\b[A-Z][a-z]+\s+[A-Z][a-z]+(?=\s+(?:is|was|came in|presented|admitted|complained|reports))"#, "[name]"),
        // MRN labeled
        (#"(?i)\bMRN\s*:?\s*\d{4,}\b"#, "[mrn]"),
        // SSN
        (#"\b\d{3}-\d{2}-\d{4}\b"#, "[ssn]"),
        // Phone numbers (xxx-xxx-xxxx or (xxx) xxx-xxxx)
        (#"(?<!\w)(?:\+1[ .-]?)?(?:\(\d{3}\)[ .-]*|\d{3}[ .-])\d{3}[ .-]\d{4}\b"#, "[phone]"),
        // Date m/d/y or m-d-y
        (#"\b(?:0?[1-9]|1[0-2])[/-](?:0?[1-9]|[12]\d|3[01])[/-](?:\d{2}|\d{4})\b"#, "[date]"),
        // Long numeric IDs (excluding obvious doses ending in dose units)
        (#"\b\d{6,12}\b(?!\s*(?:mg|mcg|mL|ml|kg|lb|cc|units|U|gtt))"#, "[id]"),
        // Room / bed / bay
        (#"(?i)\b(?:Room|Bed|Bay)\s*\d+[A-Z]?\b"#, "[room]"),
    ]
}
