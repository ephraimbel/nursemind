import SwiftUI

/// Display metadata for citation rendering — pill labels, publisher logos, source type tags.
/// Derived from publisher / id heuristics so existing CitationSource literals don't need to change.
public extension CitationSource {

    enum SourceType: String, Sendable {
        case practiceGuideline   // SCCM, AHA, ADA, AHA, GOLD, etc.
        case fdaLabel            // openFDA / DailyMed
        case journal             // PMC OA, NEJM, JAMA, Annals, Crit Care Med
        case textbook            // Open RN, OpenStax
        case ismp                // Institute for Safe Medication Practices
        case agency              // CDC, CMS, AHRQ, NIH, HHS
        case professionalSociety // INS, AACN, ANA, Joint Commission
        case other
    }

    /// Inferred source type for visual treatment.
    var sourceType: SourceType {
        let pub = (publisher ?? "").lowercased()
        let id = id.lowercased()
        let name = shortName.lowercased()

        if id.contains("openfda") || id.contains("dailymed") || pub.contains("openfda") || pub.contains("fda") {
            return .fdaLabel
        }
        if id.contains("ismp") || pub.contains("institute for safe medication") {
            return .ismp
        }
        if id.contains("openrn") || id.contains("openstax") || pub.contains("open resources") || pub.contains("openstax") {
            return .textbook
        }
        if pub.contains("cdc") || pub.contains("centers for disease") ||
           pub.contains("cms") || pub.contains("centers for medicare") ||
           pub.contains("ahrq") || pub.contains("agency for healthcare") ||
           pub.contains("nih") || pub.contains("hhs") {
            return .agency
        }
        if pub.contains("american heart") || pub.contains("aha") ||
           pub.contains("society of critical care") || pub.contains("sccm") ||
           pub.contains("american diabetes") || pub.contains("ada") ||
           pub.contains("surviving sepsis") {
            return .practiceGuideline
        }
        if pub.contains("ins") || pub.contains("aacn") || pub.contains("ana") ||
           pub.contains("joint commission") || pub.contains("infusion nurses") ||
           pub.contains("oncology nursing") || pub.contains("emergency nurses") {
            return .professionalSociety
        }
        if name.contains("pmc") || name.contains("annals") || name.contains("nejm") ||
           name.contains("jama") || name.contains("crit care") || name.contains("circulation") ||
           name.contains("lancet") || name.contains("bmj") || pub.contains("rice university") {
            return .journal
        }
        return .other
    }

    /// Compact label for inline citation pills. Real publishers > journal short forms.
    var pillTitle: String {
        switch sourceType {
        case .fdaLabel:           return "FDA"
        case .ismp:               return "ISMP"
        case .practiceGuideline:
            if shortName.contains("Surviving Sepsis") { return "Surv Sepsis" }
            if shortName.contains("AHA")              { return "AHA" }
            if shortName.contains("ADA")              { return "ADA" }
            if shortName.contains("ACLS")             { return "AHA ACLS" }
            return shortenForPill(shortName)
        case .agency:
            let pub = (publisher ?? "").lowercased()
            if pub.contains("cdc") { return "CDC" }
            if pub.contains("cms") { return "CMS" }
            if pub.contains("ahrq") { return "AHRQ" }
            if pub.contains("nih") { return "NIH" }
            return shortenForPill(shortName)
        case .professionalSociety:
            let pub = (publisher ?? "")
            if pub.contains("Joint Commission") { return "TJC" }
            if pub.contains("Infusion Nurses") { return "INS" }
            return shortenForPill(shortName)
        case .textbook:
            if shortName.contains("Open RN") { return "Open RN" }
            if shortName.contains("OpenStax") { return "OpenStax" }
            return shortenForPill(shortName)
        case .journal:
            if shortName.contains("Surviving Sepsis") { return "Crit Care Med" }
            if shortName.contains("Annals of Emergency") { return "Annals of Emer." }
            if shortName.contains("PMC") { return "PMC" }
            return shortenForPill(shortName)
        case .other:
            return shortenForPill(shortName)
        }
    }

    private func shortenForPill(_ name: String) -> String {
        // Strip "FDA SPL — " prefix etc., truncate to ~14 chars
        let trimmed = name
            .replacingOccurrences(of: "FDA SPL — ", with: "")
            .replacingOccurrences(of: "FDA Structured Product Labeling — ", with: "FDA Label: ")
            .replacingOccurrences(of: "Open RN Nursing Pharmacology — ", with: "Open RN: ")
        if trimmed.count <= 16 { return trimmed }
        return String(trimmed.prefix(14)) + "…"
    }

    /// Source-type tone — see `NMColor.source*` for the editorial palette.
    var pillIconColor: Color {
        switch sourceType {
        case .fdaLabel:            return NMColor.sourceFDA
        case .practiceGuideline:   return NMColor.sourceGuideline
        case .journal:             return NMColor.sourceJournal
        case .ismp:                return NMColor.alertHigh
        case .agency:              return NMColor.sourceAgency
        case .professionalSociety: return NMColor.sourceSociety
        case .textbook:            return NMColor.sourceTextbook
        case .other:               return NMColor.textTertiary
        }
    }

    /// SF Symbol for the pill icon (we use small filled circle with tint as the visual mark).
    var pillIconSymbol: String {
        switch sourceType {
        case .fdaLabel:            return "f.circle.fill"
        case .practiceGuideline:   return "doc.text.fill"
        case .journal:             return "globe"
        case .ismp:                return "exclamationmark.shield.fill"
        case .agency:              return "building.columns.fill"
        case .professionalSociety: return "person.3.fill"
        case .textbook:            return "book.fill"
        case .other:               return "doc.fill"
        }
    }

    /// Human-readable type label for the References list.
    var typeBadgeLabel: String? {
        switch sourceType {
        case .practiceGuideline:   return "Guideline"
        case .fdaLabel:            return "FDA Label"
        case .ismp:                return "Safety List"
        case .agency:              return "Public Health"
        case .professionalSociety: return "Standards"
        case .textbook:            return "OER Textbook"
        case .journal, .other:     return nil
        }
    }

    /// Used in References list — the formatted "Journal. Year. Authors." line.
    var referenceFormattedLine: String? {
        var parts: [String] = []
        if let pub = publisher, !pub.isEmpty { parts.append(pub) }
        if let detail, !detail.isEmpty {
            parts.append(detail)
        }
        return parts.isEmpty ? nil : parts.joined(separator: ". ")
    }
}
