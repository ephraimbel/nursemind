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
                case .overLength(let w):             return "Response too long (\(w) words; max 500)"
                case .suspectedDirective(let s):     return "Suspected directive language: \(s)"
                }
            }
        }
    }

    public init() {}

    public func validate(_ response: String, validCitationIDs: Set<String>, retrievedContext: String? = nil) -> ValidationResult {
        var issues: [ValidationResult.Issue] = []
        let markers = Self.citationIDs(in: response)
        for id in markers.subtracting(validCitationIDs).sorted() {
            issues.append(.hallucinatedCitation(id: id))
        }
        if response.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || markers.isEmpty {
            issues.append(.unsupportedClaim(claim: "No cited answer"))
        }
        let withoutMarkers = response.replacingOccurrences(of: #"\[c[0-9]{3}\]"#, with: "", options: .regularExpression)
        if withoutMarkers.range(of: #"\[c[0-9]|\[c\]"#, options: .regularExpression) != nil {
            issues.append(.hallucinatedCitation(id: "malformed"))
        }
        // A citation in another bullet or sentence cannot support this claim.
        let statements = Self.normalizedStatements(response)
            .replacingOccurrences(of: #"(?<=[.!?])\s+(?=[A-Z*])"#, with: "\n", options: .regularExpression)
        for line in statements.components(separatedBy: .newlines) {
            let statement = line.trimmingCharacters(in: .whitespacesAndNewlines)
            let undecorated = statement.trimmingCharacters(in: CharacterSet(charactersIn: "*_"))
            guard !statement.isEmpty, undecorated != SystemPrompt.referenceFooter,
                  statement.range(of: #"^[-*_]{3,}$"#, options: .regularExpression) == nil else { continue }
            let hasNumber = statement.rangeOfCharacter(from: .decimalDigits) != nil
            if !hasNumber && statement.hasPrefix("#") && statement.split(whereSeparator: \.isWhitespace).count <= 8 { continue }
            if !hasNumber && statement.hasSuffix(":") && statement.split(whereSeparator: \.isWhitespace).count <= 8 { continue }
            if !hasNumber && statement.hasPrefix("I don't have a high-confidence source for") { continue }
            guard !Self.citationIDs(in: statement).intersection(validCitationIDs).isEmpty else {
                issues.append(.unsupportedClaim(claim: "Uncited statement"))
                continue
            }
            if let retrievedContext {
                let cited = Self.citationIDs(in: statement)
                let supporting = retrievedContext.components(separatedBy: .newlines)
                    .filter { !Self.citationIDs(in: $0).intersection(cited).isEmpty }.joined(separator: "\n")
                if !Self.numbers(in: statement).isSubset(of: Self.numbers(in: supporting)) ||
                    !Self.quantities(in: statement).isSubset(of: Self.quantities(in: supporting)) {
                    issues.append(.unsupportedClaim(claim: "Value or unit absent from cited passages"))
                }
            }
        }
        let words = response.split(whereSeparator: \.isWhitespace).count
        if words > 500 { issues.append(.overLength(words: words)) }
        if Self.containsComputedDose(response) {
            issues.append(.suspectedDirective(snippet: "Computed patient-specific amount"))
        }
        if response.range(of: #"\b(give|administer|inject|push|infuse|start|increase to|titrate to)\s+(?:the patient\s+)?\d+(?:\.\d+)?\s*(?:mg|mcg|g|mL|units?)\b"#,
                          options: [.regularExpression, .caseInsensitive]) != nil {
            issues.append(.suspectedDirective(snippet: "Directive medication amount"))
        }
        if PHIScrubber.scrub(response).redacted {
            issues.append(.unsupportedClaim(claim: "Potential identifier in answer"))
        }
        return ValidationResult(isValid: issues.isEmpty, issues: issues)
    }

    public static func citationIDs(in text: String) -> Set<String> {
        guard let expression = try? NSRegularExpression(pattern: #"\[(c[0-9]{3})\]"#) else { return [] }
        let ns = text as NSString
        return Set(expression.matches(in: text, range: NSRange(location: 0, length: ns.length))
            .map { ns.substring(with: $0.range(at: 1)) })
    }

    private static func normalizedStatements(_ text: String) -> String {
        text.components(separatedBy: .newlines).map { line in
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed.hasPrefix("**"), trimmed.hasSuffix("**"), trimmed.count > 4 {
                let title = String(trimmed.dropFirst(2).dropLast(2))
                if title.range(of: #"\d|[.!?]"#, options: .regularExpression) == nil,
                   title.split(whereSeparator: \.isWhitespace).count <= 8 { return "## " + title }
            }
            return line
        }.joined(separator: "\n")
            .replacingOccurrences(of: #"\*\*|__"#, with: "", options: .regularExpression)
            .replacingOccurrences(of: #"(?m)^(\s*(?:#{1,6}\s+)?)(?:\d+[.)]|Step\s+\d+:)\s+"#, with: "$1", options: .regularExpression)
    }

    private static func numbers(in text: String) -> Set<String> {
        let withoutMarkers = text.replacingOccurrences(of: #"\[c[0-9]{3}\]"#, with: "", options: .regularExpression)
        return matches(#"(?<![\w.])\d+(?:[.,]\d+)*"#, in: withoutMarkers)
            .reduce(into: Set<String>()) { result, value in
                result.insert(NSDecimalNumber(string: value.replacingOccurrences(of: ",", with: "")).stringValue)
            }
    }

    private static func quantities(in text: String) -> Set<String> {
        let pattern = #"(?<![\w.])(\d+(?:[.,]\d+)*)(?:\s*(?:[-–—]|to)\s*(\d+(?:[.,]\d+)*))?\s*((?:mcg|µg|μg|mg|g|mL|mEq|mmol|units?|U|mm\s*Hg|bpm|%)(?:\s*/\s*(?:kg|min|hr|h|day|dL|L|mL|m2|m²|dose))*)(?![A-Za-z])"#
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else { return [] }
        let ns = text as NSString
        var values: Set<String> = []
        for match in regex.matches(in: text, range: NSRange(location: 0, length: ns.length)) {
            let unit = ns.substring(with: match.range(at: 3)).lowercased().filter { !$0.isWhitespace }
                .replacingOccurrences(of: "µg", with: "mcg").replacingOccurrences(of: "μg", with: "mcg")
            for index in 1...2 where match.range(at: index).location != NSNotFound {
                let number = ns.substring(with: match.range(at: index)).replacingOccurrences(of: ",", with: "")
                values.insert(NSDecimalNumber(string: number).stringValue + unit)
            }
        }
        return values
    }

    private static func matches(_ pattern: String, in text: String) -> [String] {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else { return [] }
        let ns = text as NSString
        return regex.matches(in: text, range: NSRange(location: 0, length: ns.length)).map { ns.substring(with: $0.range) }
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

}
