import Foundation

/// Validates a Claude-generated answer before it streams to the user.
/// Pass = answer is acceptable; fail = ask the model to regenerate with stronger
/// citation enforcement, or fall through to the low-confidence refusal.
public struct ResponseValidator: Sendable {

    public struct ValidationResult: Sendable {
        public let isValid: Bool
        public let issues: [Issue]

        public enum Issue: Sendable, CustomStringConvertible {
            case unsupportedClaim(claim: String)
            case hallucinatedCitation(id: String)
            case overLength(words: Int)
            case suspectedDirective(snippet: String)

            public var description: String {
                switch self {
                case .unsupportedClaim(let c):       return "Unsupported clinical claim (no nearby citation): \(c)"
                case .hallucinatedCitation(let id):  return "Citation ID not in retrieved context: \(id)"
                case .overLength(let w):             return "Response too long (\(w) words; max 600)"
                case .suspectedDirective(let s):     return "Suspected directive language: \(s)"
                }
            }
        }
    }

    public init() {}

    public func validate(_ response: String, validCitationIDs: Set<String>) -> ValidationResult {
        var issues: [ValidationResult.Issue] = []

        // 1. Citation enforcement — every numerical clinical claim needs [cXXX] within 100 chars
        for pattern in Self.numericalClaimPatterns {
            guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else { continue }
            let range = NSRange(response.startIndex..., in: response)
            let matches = regex.matches(in: response, options: [], range: range)
            for match in matches {
                let claimRange = match.range
                let windowStart = max(0, claimRange.location - 100)
                let windowEnd = min((response as NSString).length, claimRange.location + claimRange.length + 100)
                let windowRange = NSRange(location: windowStart, length: windowEnd - windowStart)
                let window = (response as NSString).substring(with: windowRange)
                if !window.contains("[c") {
                    let claimText = (response as NSString).substring(with: claimRange)
                    issues.append(.unsupportedClaim(claim: claimText))
                }
            }
        }

        // 2. Hallucinated citation IDs
        if let citationRegex = try? NSRegularExpression(pattern: #"\[c\d{1,4}\]"#) {
            let range = NSRange(response.startIndex..., in: response)
            let matches = citationRegex.matches(in: response, options: [], range: range)
            for m in matches {
                let raw = (response as NSString).substring(with: m.range)
                let id = String(raw.dropFirst().dropLast())   // strip [ ]
                if !validCitationIDs.contains(id) {
                    issues.append(.hallucinatedCitation(id: id))
                }
            }
        }

        // 3. Length
        let words = response.split(separator: " ").count
        if words > 600 {
            issues.append(.overLength(words: words))
        }

        // 4. Soft check: directive phrasing
        let lowered = response.lowercased()
        for phrase in Self.directivePhrases {
            if lowered.contains(phrase) {
                issues.append(.suspectedDirective(snippet: phrase))
                break
            }
        }

        return ValidationResult(isValid: issues.isEmpty, issues: issues)
    }

    // MARK: - Computed-dose output guard (Apple 1.4.2)

    /// Hard gate run against the accumulating generation. Returns true when the
    /// text contains what reads as a COMPUTED patient-specific dose, rate, or
    /// volume — arithmetic on patient parameters producing an amount — as
    /// opposed to a quoted published value ("labeling lists 15 mg/kg [c001]").
    /// A hit kills the stream and swaps in the prescribing refusal.
    public static func containsComputedDose(_ text: String) -> Bool {
        for pattern in computedDosePatterns {
            if text.range(of: pattern, options: [.regularExpression, .caseInsensitive]) != nil {
                return true
            }
        }
        return false
    }

    private static let computedDosePatterns: [String] = [
        // "= 1200 mg", "≈ 60 mL/hr", "→ 40 mL/hr" — an equation resolving to an
        // amount. Lookahead excludes lab concentrations ("= 140 mEq/L", "= 3.5 g/dL").
        #"[=≈→]\s*~?\d[\d,.]*\s*(mg|mcg|g|meq|units?|m?l)(?!\s*/\s*d?l)\s*(/\s*(hr|h|min|day))?\b"#,
        // "works out to 2,000 mg", "comes to about 60 mL/hr", "that's 700 mL/hr"
        #"\b(works? out to|comes? (out )?to|equals?|that('|’)s( about| roughly)?|so you('|’)d (give|run|set))\s*~?(about )?\d[\d,.]*\s*(mg|mcg|g|meq|units?|m?l)(?!\s*/\s*d?l)\b"#,
        // explicit arithmetic on body weight: "× 70 kg", "x 20kg", "* 80 kg"
        #"[×x*]\s*\d+(\.\d+)?\s*kg\b"#,
        #"\d+(\.\d+)?\s*(mg|mcg|units?)\s*/\s*kg\s*[×x*]\s*\d"#,
        // "for your 70 kg patient, ... mg" — personalized amount sentence
        #"for (a|your|this) \d+(\.\d+)?\s*kg\b[^.?!]{0,60}\d[\d,.]*\s*(mg|mcg|g|meq|units?|m?l)\b"#,
        // "20 kg child → maintenance runs at 60 mL/hr" — weight paired with a
        // derived rate in the same sentence
        #"\d+(\.\d+)?\s*kg\b[^.?!]{0,60}(→|runs? at|infuses? at|rate of)\s*~?\d[\d,.]*\s*m?l\s*/\s*hr\b"#
    ]

    // MARK: - Patterns

    /// Regex patterns for clinical claims that MUST be cited.
    /// Order: dose with units, lab values with units, threshold expressions.
    private static let numericalClaimPatterns: [String] = [
        // Doses: "30 mg", "0.1 mcg/kg/min", "500 mL"
        #"\b\d+(?:\.\d+)?\s*(?:mg|mcg|mL|ml|kg|lb|cc|units|U|mEq|gtt)(?:/(?:kg|min|hr|day|h|kg/min))?"#,
        // Lab thresholds: "2.0 mmol/L", "MAP > 65"
        #"\b\d+(?:\.\d+)?\s*(?:mmol/L|mEq/L|mg/dL|mmHg|g/dL|ng/mL|ng/L|U/L|μL|mcg/mL|mcg/L|pg/mL)"#,
        // Thresholds: "MAP > 65", "K+ < 3.5"
        #"\b(?:MAP|HR|SBP|DBP|K\+|Na\+|Hgb|Plt)\s*[><]=?\s*\d+(?:\.\d+)?"#,
    ]

    /// Phrases that look like directives (which the model is told not to use).
    /// These are advisory only — the LLM may legitimately use phrases like "you'd typically administer."
    /// We flag for review, not auto-reject.
    private static let directivePhrases: [String] = [
        "you should give",
        "you must give",
        "administer 1 mg",
        "give the patient",
        "i recommend you administer"
    ]
}
