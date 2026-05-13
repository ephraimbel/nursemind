import Foundation

// Profile data types persisted by UserPreferences and used by the Profile tab
// and (eventually) onboarding. Keep these tiny, Codable, and stable — they
// migrate into Supabase in v1.1.

public enum UserRole: String, Codable, CaseIterable, Sendable, Hashable {
    case student
    case rn
    case lpn
    case cna
    case other

    public var displayName: String {
        switch self {
        case .student: return "Student"
        case .rn:      return "Registered Nurse"
        case .lpn:     return "Licensed Practical Nurse"
        case .cna:     return "Certified Nursing Assistant"
        case .other:   return "Other"
        }
    }

    public var shortName: String {
        switch self {
        case .student: return "Student"
        case .rn:      return "RN"
        case .lpn:     return "LPN"
        case .cna:     return "CNA"
        case .other:   return "Other"
        }
    }
}

public enum NursingUnit: String, Codable, CaseIterable, Sendable, Hashable {
    case medSurg
    case icu
    case er
    case stepDown
    case lAndD
    case pediatrics
    case nicu
    case oncology
    case orthopedics
    case operatingRoom
    case psychMentalHealth
    case homeHealth
    case longTermCare
    case clinic
    case school
    case other

    public var displayName: String {
        switch self {
        case .medSurg:           return "Med-Surg"
        case .icu:               return "ICU"
        case .er:                return "Emergency"
        case .stepDown:          return "Step-Down / PCU"
        case .lAndD:             return "Labor & Delivery"
        case .pediatrics:        return "Pediatrics"
        case .nicu:              return "NICU"
        case .oncology:          return "Oncology"
        case .orthopedics:       return "Orthopedics"
        case .operatingRoom:     return "Operating Room"
        case .psychMentalHealth: return "Psych / Mental Health"
        case .homeHealth:        return "Home Health"
        case .longTermCare:      return "Long-Term Care"
        case .clinic:            return "Clinic / Outpatient"
        case .school:            return "School Nursing"
        case .other:             return "Other"
        }
    }
}

/// ICU sub-specialty. Only meaningful when `NursingUnit == .icu`. Drives the
/// AI system prompt's clinical-context hint so answers default to the nurse's
/// actual ICU type — Neuro ICU and CVICU have meaningfully different drips,
/// targets, and watch-fors. Stored in UserPreferences and auto-cleared when
/// the user changes their primary unit away from ICU.
public enum ICUSubspecialty: String, Codable, CaseIterable, Sendable, Hashable {
    case mixed
    case medical
    case surgical
    case cardiac
    case cardiothoracic
    case neuro
    case trauma
    case burn

    public var displayName: String {
        switch self {
        case .mixed:          return "Mixed / General ICU"
        case .medical:        return "Medical ICU (MICU)"
        case .surgical:       return "Surgical ICU (SICU)"
        case .cardiac:        return "Cardiac ICU (CCU / CVICU)"
        case .cardiothoracic: return "Cardiothoracic ICU (CTICU)"
        case .neuro:          return "Neuro ICU"
        case .trauma:         return "Trauma ICU"
        case .burn:           return "Burn ICU"
        }
    }

    /// Compact label for the profile-header subtitle and other tight slots
    /// where the full `displayName` would crowd out role + years.
    public var shortLabel: String {
        switch self {
        case .mixed:          return "Mixed"
        case .medical:        return "MICU"
        case .surgical:       return "SICU"
        case .cardiac:        return "CCU"
        case .cardiothoracic: return "CTICU"
        case .neuro:          return "Neuro"
        case .trauma:         return "Trauma"
        case .burn:           return "Burn"
        }
    }

    /// Folded into the system prompt's USER CONTEXT block so the model defaults
    /// to the nurse's ICU sub-population (e.g., "Neuro ICU patients" → favors
    /// nimodipine, ICP, EVD, hyperosmolar therapy framings without the nurse
    /// having to spell that out every message).
    public var promptDescription: String {
        switch self {
        case .mixed:          return "mixed / general adult ICU"
        case .medical:        return "medical ICU (MICU) — sepsis, ARDS, GI bleed, DKA, liver failure"
        case .surgical:       return "surgical ICU (SICU) — post-op critical care, abdominal/vascular surgery recovery"
        case .cardiac:        return "cardiac ICU (CCU / CVICU) — ACS, cardiogenic shock, post-PCI, heart failure exacerbations, antiarrhythmics"
        case .cardiothoracic: return "cardiothoracic ICU (CTICU) — post-CABG, valve surgery, LVAD, ECMO, chest tubes, mediastinal bleeding"
        case .neuro:          return "neuro ICU — TBI, ICH/SAH, ischemic stroke, ICP/EVD, status epilepticus, hyperosmolar therapy, nimodipine"
        case .trauma:         return "trauma ICU — multi-system trauma, hemorrhagic shock, massive transfusion, damage control"
        case .burn:           return "burn ICU — major burn resuscitation (Parkland), inhalation injury, escharotomy, wound care"
        }
    }
}

public enum AppearanceTheme: String, Codable, CaseIterable, Sendable, Hashable {
    case system
    case light
    case dark

    public var displayName: String {
        switch self {
        case .system: return "System"
        case .light:  return "Light"
        case .dark:   return "Dark"
        }
    }
}

public enum SubscriptionTier: String, Codable, CaseIterable, Sendable, Hashable {
    case free
    case proMonthly
    case proYearly

    public var displayName: String {
        switch self {
        case .free:       return "Free"
        case .proMonthly: return "Pro Monthly"
        case .proYearly:  return "Pro Yearly"
        }
    }

    public var isPro: Bool {
        self != .free
    }

    /// Maximum AI questions per local-day. Free tier is intentionally tight to
    /// gate the AI cost on freeloading. Pro is set at 50 — comfortably above
    /// the realistic clinical-reference + heavy-NCLEX-study ceiling (~4
    /// questions/hour over a 12-hour shift), while halving worst-case abuse
    /// exposure vs an unlimited cap. Worst case at 50/day × ~$0.016/query
    /// (cached Sonnet pricing) is ~$24/mo per maxed user. Easier to raise
    /// the cap later as a delight than to lower it as a take-back, so this
    /// starts conservative.
    public var askDailyLimit: Int {
        switch self {
        case .free:                   return 3   // tight free funnel: three questions, then paywall
        case .proMonthly, .proYearly: return 50
        }
    }
}

public extension NursingUnit {
    /// Maps the user's primary unit to the AI's `NursingSpecialty` retrieval/
    /// prompt hint. Units outside the AI's explicit specialty taxonomy (e.g.,
    /// oncology, OR, home health) return nil → the model runs in cross-setting
    /// "general" mode for that nurse. The taxonomy can grow without changing
    /// callers because this returns Optional.
    var specialty: NursingSpecialty? {
        switch self {
        case .icu:               return .icu
        case .er:                return .ed
        case .lAndD:             return .ob
        case .pediatrics:        return .peds
        case .nicu:              return .nicu
        case .medSurg:           return .medSurg
        case .stepDown,
             .oncology,
             .orthopedics,
             .operatingRoom,
             .psychMentalHealth,
             .homeHealth,
             .longTermCare,
             .clinic,
             .school,
             .other:
            return nil
        }
    }
}
