import Foundation

/// The clinical setting a nurse practices in. Used as a soft retrieval signal —
/// when an answer is being generated, library entries tagged with the active
/// specialty get a multiplicative score boost so the most relevant content
/// surfaces first. Specialty NEVER hides content (no penalty for non-matching);
/// pediatric values must not bleed into adult answers and vice versa, and the
/// system prompt enforces that explicitly.
public enum NursingSpecialty: String, Codable, CaseIterable, Sendable, Hashable {
    case icu
    case ed
    case ob
    case peds
    case nicu
    case medSurg = "med-surg"

    public var displayName: String {
        switch self {
        case .icu:     return "ICU"
        case .ed:      return "ED"
        case .ob:      return "OB"
        case .peds:    return "Peds"
        case .nicu:    return "NICU"
        case .medSurg: return "Med-Surg"
        }
    }

    /// Used in system-prompt USER CONTEXT and Ask toolbar pill.
    public var promptDescription: String {
        switch self {
        case .icu:     return "intensive care / critical care (adult)"
        case .ed:      return "emergency department"
        case .ob:      return "labor & delivery / postpartum / women's health"
        case .peds:    return "pediatrics — infants, children, adolescents (1 month–18 years). Always weight-based dosing"
        case .nicu:    return "neonatal intensive care — neonates and premature infants (≤28 days, often gestational-age-adjusted). Different physiology, different drug doses, different vital sign norms than older peds"
        case .medSurg: return "medical-surgical / general inpatient ward"
        }
    }
}

