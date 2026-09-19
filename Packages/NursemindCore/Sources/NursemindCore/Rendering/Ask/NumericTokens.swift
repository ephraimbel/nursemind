import Foundation
import UIKit

/// Numbers in mono, language in sans: finds numeric tokens (a value, a
/// range, a ratio, a percentage, with any unit that follows) inside answer
/// text and sets them in SF Mono so lab values, vitals and timings read at a
/// glance. Pure ranges are exposed for tests.
enum NumericTokens {
    /// A number (with decimals, thousands separators, ranges and ratios such
    /// as 3.5–5.0 or 120/80), optionally followed by a unit token.
    static let pattern = #"(?<![A-Za-z0-9\[])\d+(?:[.,]\d+)?(?:\s?[–\-/]\s?\d+(?:[.,]\d+)?)*(?:\s?(?:%|°[CF]|mmHg|mEq/L|mmol/L|mg/dL|g/dL|ng/mL|mcg/dL|µg/dL|mcg/kg/min|mcg/min|mg/kg|mg/dl|mL/hr|mL/h|mL/kg|mL|L/min|cmH2O|kPa|beats/min|breaths/min|bpm|kg|lb|cm|mm|hours?|hrs?|hr|minutes?|mins?|min|seconds?|secs?|sec|days?|weeks?|months?|years?|units?|IU|mcg|mg|g|kcal|x))?(?![A-Za-z0-9])"#

    private static let regex = try? NSRegularExpression(pattern: pattern)

    static func ranges(in text: String) -> [NSRange] {
        guard let regex else { return [] }
        return regex.matches(in: text, range: NSRange(location: 0, length: (text as NSString).length)).map(\.range)
    }

    /// Applies a mono font one point under the body size, keeping weight
    /// steady so a value inside a bold clause stays legible.
    static func applyMono(to attributed: NSMutableAttributedString, bodyFont: UIFont, pointSize: CGFloat? = nil) {
        let mono = UIFont.monospacedSystemFont(ofSize: pointSize ?? max(11, bodyFont.pointSize - 1.5), weight: .regular)
        // Last range first so earlier offsets survive the joiner insertions.
        for range in ranges(in: attributed.string).reversed() {
            attributed.addAttribute(.font, value: mono, range: range)
            let token = (attributed.string as NSString).substring(with: range)
            attributed.replaceCharacters(in: range, with: NSAttributedString(string: unbreakable(token), attributes: attributed.attributes(at: range.location, effectiveRange: nil)))
        }
    }

    /// A figure and its unit are one word to the eye, so they never split
    /// across lines: spaces become no-break spaces and a word joiner follows
    /// each slash or dash ("2.5 mEq/L", "3.5–5.0", "1.73 m²").
    static func unbreakable(_ token: String) -> String {
        token.replacingOccurrences(of: " ", with: "\u{00A0}")
            .replacingOccurrences(of: "/", with: "/\u{2060}")
            .replacingOccurrences(of: "–", with: "\u{2060}–\u{2060}")
            .replacingOccurrences(of: "-", with: "\u{2060}-\u{2060}")
    }

    /// A table cell that is a figure (">1.30", "3.5 – 5.0 mEq/L", "< 2.5 mEq/L")
    /// is set wholly in mono; a cell that is a phrase keeps the body face and
    /// only its numbers go mono, so a wrapped interpretation never reads as code.
    static func isNumericCell(_ text: String) -> Bool {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmed.count <= 28 else { return false }
        return trimmed.range(of: #"^[<>≤≥~≈±]?\s*\d"#, options: .regularExpression) != nil
    }
}
