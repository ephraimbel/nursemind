import Foundation

/// Pulls common clinical values out of a free-text question so the calculator
/// handoff can pre-fill fields the user already typed. Conservative — only
/// extracts when the pattern is unambiguous (e.g., "BP 110/60", not just "110").
///
/// The dictionary keys are stable identifiers each calculator view reads:
///   - "sbp", "dbp"             — systolic / diastolic blood pressure (mmHg)
///   - "weight_kg"               — weight in kg (converts lb → kg)
///   - "height_cm"               — height in cm (converts in → cm)
///   - "age"                     — years
///   - "creatinine"              — mg/dL
///   - "sodium", "potassium",
///     "chloride", "bicarbonate" — mEq/L
///   - "glucose"                 — mg/dL
///   - "albumin"                 — g/dL
///   - "calcium"                 — mg/dL
public enum ClinicalValueExtractor {

    public static func extract(from text: String) -> [String: Double] {
        var values: [String: Double] = [:]
        let lower = text.lowercased()

        // Blood pressure: "BP 110/60", "blood pressure 110/60", "110/60 mmHg"
        if let m = capture(in: lower, pattern: #"(?:bp|blood pressure)\s*(\d{2,3})\s*/\s*(\d{2,3})"#, groups: 2)
            ?? capture(in: lower, pattern: #"(\d{2,3})\s*/\s*(\d{2,3})\s*mm\s*hg"#, groups: 2),
           let sbp = Double(m[0]), let dbp = Double(m[1]),
           sbp >= 50, sbp <= 300, dbp >= 20, dbp <= 200, sbp > dbp {
            values["sbp"] = sbp
            values["dbp"] = dbp
        }

        // Weight: "70 kg", "70kg"
        if let m = capture(in: lower, pattern: #"(\d{2,3}(?:\.\d{1,2})?)\s*kg\b"#, groups: 1),
           let kg = Double(m[0]), kg >= 1, kg <= 300 {
            values["weight_kg"] = kg
        } else if let m = capture(in: lower, pattern: #"(\d{2,3}(?:\.\d{1,2})?)\s*(?:lb|lbs|pounds)\b"#, groups: 1),
                  let lbs = Double(m[0]), lbs >= 2, lbs <= 660 {
            values["weight_kg"] = round(lbs * 0.453592 * 10) / 10
        }

        // Height: "178 cm" or "5'10""
        if let m = capture(in: lower, pattern: #"(\d{2,3}(?:\.\d)?)\s*cm\b"#, groups: 1),
           let cm = Double(m[0]), cm >= 30, cm <= 250 {
            values["height_cm"] = cm
        } else if let m = capture(in: lower, pattern: #"(\d)['′]\s*(\d{1,2})"#, groups: 2),
                  let ft = Double(m[0]), let inches = Double(m[1]) {
            values["height_cm"] = round((ft * 30.48 + inches * 2.54) * 10) / 10
        }

        // Age: "65 years old", "65 y/o", "65yo", "age 65"
        if let m = capture(in: lower, pattern: #"(?:age\s+)?(\d{1,3})\s*(?:years?\s*old|y\s*/\s*o|yo)\b"#, groups: 1),
           let age = Double(m[0]), age >= 0, age <= 120 {
            values["age"] = age
        }

        // Creatinine: "creatinine 1.2", "Cr 1.2"
        if let m = capture(in: lower, pattern: #"(?:creatinine|\bcr)\s*(?:of\s+|=\s*|is\s+)?(\d{1,2}(?:\.\d{1,2})?)"#, groups: 1),
           let cr = Double(m[0]), cr >= 0.1, cr <= 20 {
            values["creatinine"] = cr
        }

        // Sodium: "Na 142", "sodium 142", "Na+ 135"
        if let m = capture(in: lower, pattern: #"(?:sodium|\bna\+?)\s*(?:of\s+|=\s*|is\s+)?(\d{2,3}(?:\.\d)?)"#, groups: 1),
           let na = Double(m[0]), na >= 100, na <= 200 {
            values["sodium"] = na
        }

        // Potassium: "K 5.5", "potassium 5.5", "K+ 6.5"
        if let m = capture(in: lower, pattern: #"(?:potassium|\bk\+?)\s*(?:of\s+|=\s*|is\s+)?(\d(?:\.\d{1,2})?)"#, groups: 1),
           let k = Double(m[0]), k >= 0.5, k <= 10 {
            values["potassium"] = k
        }

        // Chloride: "Cl 102"
        if let m = capture(in: lower, pattern: #"(?:chloride|\bcl-?)\s*(?:of\s+|=\s*|is\s+)?(\d{2,3}(?:\.\d)?)"#, groups: 1),
           let cl = Double(m[0]), cl >= 70, cl <= 130 {
            values["chloride"] = cl
        }

        // Bicarbonate: "HCO3 22", "bicarb 22"
        if let m = capture(in: lower, pattern: #"(?:bicarbonate|bicarb|hco3-?)\s*(?:of\s+|=\s*|is\s+)?(\d{1,2}(?:\.\d)?)"#, groups: 1),
           let bicarb = Double(m[0]), bicarb >= 4, bicarb <= 50 {
            values["bicarbonate"] = bicarb
        }

        // Glucose: "glucose 250", "BG 250"
        if let m = capture(in: lower, pattern: #"(?:glucose|blood sugar|\bbg\b|\bbs\b)\s*(?:of\s+|=\s*|is\s+)?(\d{2,4}(?:\.\d)?)"#, groups: 1),
           let g = Double(m[0]), g >= 20, g <= 1500 {
            values["glucose"] = g
        }

        // Albumin: "albumin 3.2"
        if let m = capture(in: lower, pattern: #"(?:albumin|\balb\b)\s*(?:of\s+|=\s*|is\s+)?(\d(?:\.\d{1,2})?)"#, groups: 1),
           let alb = Double(m[0]), alb >= 0.5, alb <= 7 {
            values["albumin"] = alb
        }

        // Calcium: "Ca 8.5", "calcium 8.5"
        if let m = capture(in: lower, pattern: #"(?:calcium|\bca\+?)\s*(?:of\s+|=\s*|is\s+)?(\d{1,2}(?:\.\d{1,2})?)"#, groups: 1),
           let cal = Double(m[0]), cal >= 4, cal <= 16 {
            values["calcium"] = cal
        }

        return values
    }

    /// Returns the captured groups (1-indexed in regex, 0-indexed in result) of the
    /// first match for `pattern` in `text`, or nil if no match.
    private static func capture(in text: String, pattern: String, groups: Int) -> [String]? {
        guard let regex = try? NSRegularExpression(pattern: pattern) else { return nil }
        let ns = text as NSString
        let range = NSRange(location: 0, length: ns.length)
        guard let match = regex.firstMatch(in: text, range: range) else { return nil }
        var captured: [String] = []
        for i in 1...groups {
            if i < match.numberOfRanges, match.range(at: i).location != NSNotFound {
                captured.append(ns.substring(with: match.range(at: i)))
            } else {
                return nil
            }
        }
        return captured
    }
}
