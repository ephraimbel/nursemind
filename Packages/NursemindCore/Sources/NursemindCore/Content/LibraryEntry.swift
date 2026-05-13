import Foundation

/// Polymorphic wrapper over the typed entry structs. Used by lists, search,
/// pinning, recents — anywhere we need to deal with entries generically.
public enum LibraryEntry: Identifiable, Codable, Sendable {
    case drug(DrugEntry)
    case drip(DrugEntry)
    case lab(LabEntry)
    case procedure(ProcedureEntry)
    case diagnosis(DiagnosisEntry)
    case scenario(ReferenceEntry)
    case communication(ReferenceEntry)
    case reference(ReferenceEntry)

    public var id: String {
        switch self {
        case .drug(let e):           return "drug:\(e.id)"
        case .drip(let e):           return "drip:\(e.id)"
        case .lab(let e):            return "lab:\(e.id)"
        case .procedure(let e):      return "procedure:\(e.id)"
        case .diagnosis(let e):      return "diagnosis:\(e.id)"
        case .scenario(let e):       return "scenario:\(e.id)"
        case .communication(let e):  return "communication:\(e.id)"
        case .reference(let e):      return "reference:\(e.id)"
        }
    }

    public var slug: String {
        switch self {
        case .drug(let e):           return e.id
        case .drip(let e):           return e.id
        case .lab(let e):            return e.id
        case .procedure(let e):      return e.id
        case .diagnosis(let e):      return e.id
        case .scenario(let e):       return e.id
        case .communication(let e):  return e.id
        case .reference(let e):      return e.id
        }
    }

    public var title: String {
        switch self {
        case .drug(let e):           return e.title
        case .drip(let e):           return e.title
        case .lab(let e):            return e.title
        case .procedure(let e):      return e.title
        case .diagnosis(let e):      return e.title
        case .scenario(let e):       return e.title
        case .communication(let e):  return e.title
        case .reference(let e):      return e.title
        }
    }

    public var subtitle: String? {
        switch self {
        case .drug(let e):           return e.subtitle
        case .drip(let e):           return e.subtitle
        case .lab(let e):            return e.subtitle
        case .procedure(let e):      return e.subtitle
        case .diagnosis(let e):      return e.subtitle
        case .scenario(let e):       return e.subtitle
        case .communication(let e):  return e.subtitle
        case .reference(let e):      return e.subtitle
        }
    }

    public var category: EntryCategory {
        switch self {
        case .drug:           return .drug
        case .drip:           return .drip
        case .lab:            return .lab
        case .procedure:      return .procedure
        case .diagnosis:      return .diagnosis
        case .scenario:       return .scenario
        case .communication:  return .communication
        case .reference:      return .reference
        }
    }

    public var isHighAlert: Bool {
        switch self {
        case .drug(let e):  return e.isHighAlert
        case .drip(let e):  return e.isHighAlert
        default:            return false
        }
    }

    public var nclexTags: NCLEXTags? {
        switch self {
        case .drug, .drip:           return nil   // drugs/drips primarily map to Pharm/Parenteral
        case .lab(let e):            return e.nclexTags
        case .procedure(let e):      return e.nclexTags
        case .diagnosis(let e):      return e.nclexTags
        case .scenario(let e):       return e.nclexTags
        case .communication(let e):  return e.nclexTags
        case .reference(let e):      return e.nclexTags
        }
    }

    public var searchText: String {
        var parts = [title]
        if let s = subtitle { parts.append(s) }
        switch self {
        case .drug(let e), .drip(let e):
            parts.append(e.category)
            parts.append(e.indications.text)
            parts.append(e.adverseReactions.text)
            // Sample some nursing-implication keywords
            if let nursing = e.nursingImplications {
                for bullet in nursing.prefix(3) { parts.append(bullet.text) }
            }
        case .lab(let e):
            parts.append(e.specimen)
            // Include interpretation tier labels and summaries — covers things like
            // "hyperkalemia", "peaked T waves", "lactic acidosis" that users search for.
            for tier in e.interpretationTiers {
                parts.append(tier.label)
                parts.append(tier.summary)
            }
            for cause in e.commonCauses {
                parts.append(cause.title)
                parts.append(cause.causes.joined(separator: " "))
            }
        case .procedure(let e):
            parts.append(e.indications.text)
        case .diagnosis(let e):
            parts.append(e.definition.text)
            for sign in e.presentation.prefix(4) { parts.append(sign.text) }
        case .scenario(let e), .communication(let e), .reference(let e):
            parts.append(e.eyebrow)
            // Include section titles AND body content (prose, bullets, table rows,
            // step labels) so searches for "heart rate", "toddler", "isolation" —
            // terms that often live inside the body, not the title — match.
            for section in e.sections {
                switch section {
                case .prose(let title, let prose):
                    parts.append(title)
                    parts.append(prose.text)
                case .bullets(let title, let bullets):
                    parts.append(title)
                    for bullet in bullets.prefix(12) {
                        parts.append(bullet.text)
                    }
                case .keyValueTable(let title, let rows):
                    parts.append(title)
                    for row in rows.prefix(12) {
                        parts.append(row.key)
                        parts.append(row.value)
                    }
                case .numberedSteps(let title, let steps, _):
                    parts.append(title)
                    for step in steps.prefix(10) {
                        parts.append(step)
                    }
                }
            }
        }
        return parts.joined(separator: " ").lowercased()
    }

    /// Inferred clinical settings this entry primarily applies to. Used as a
    /// soft retrieval signal when a specialty focus is active. Empty array
    /// means broadly applicable.
    public var specialties: [NursingSpecialty] {
        SpecialtyHeuristic.infer(title: title, searchText: searchText, category: category)
    }

    public var lastReviewed: String {
        switch self {
        case .drug(let e):           return e.lastSourceFidelityReview
        case .drip(let e):           return e.lastSourceFidelityReview
        case .lab(let e):            return e.lastSourceFidelityReview
        case .procedure(let e):      return e.lastSourceFidelityReview
        case .diagnosis(let e):      return e.lastSourceFidelityReview
        case .scenario(let e):       return e.lastSourceFidelityReview
        case .communication(let e):  return e.lastSourceFidelityReview
        case .reference(let e):      return e.lastSourceFidelityReview
        }
    }
}
