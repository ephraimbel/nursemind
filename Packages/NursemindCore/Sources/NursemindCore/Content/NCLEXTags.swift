import Foundation

/// 2026 NCLEX-RN Test Plan tagging. Drives retrieval weighting and "you're light on
/// Reduction of Risk" personalization features. See docs/CONTENT_SOURCING.md §4.
public struct NCLEXTags: Codable, Hashable, Sendable {
    public let category: TestPlanCategory
    public let subcategory: TestPlanSubcategory?
    public let priorityConcept: PriorityConcept?

    public init(
        category: TestPlanCategory,
        subcategory: TestPlanSubcategory? = nil,
        priorityConcept: PriorityConcept? = nil
    ) {
        self.category = category
        self.subcategory = subcategory
        self.priorityConcept = priorityConcept
    }
}

public enum TestPlanCategory: String, Codable, Sendable {
    case safeAndEffectiveCare       // 18 + 13 = 31%
    case healthPromotion            // 9%
    case psychosocialIntegrity      // 9%
    case physiologicalIntegrity     // 9 + 16 + 12 + 14 = 51%
}

public enum TestPlanSubcategory: String, Codable, Sendable {
    case managementOfCare
    case safetyAndInfectionControl
    case healthPromotion
    case psychosocialIntegrity
    case basicCareAndComfort
    case pharmacologicalAndParenteralTherapies
    case reductionOfRiskPotential
    case physiologicalAdaptation
}

public enum PriorityConcept: String, Codable, Sendable {
    case perfusion
    case gasExchange
    case acidBase
    case fluidElectrolytes
    case glucoseRegulation
    case infection
    case safety
    case mobility
    case painComfort
    case nutrition
    case elimination
    case neurologicalRegulation
    case cellularRegulation     // cancer, hematology
    case clottingHemostasis
    case sensoryPerception
    case mood
    case cognition
}

// MARK: - Display

public extension TestPlanCategory {
    var displayName: String {
        switch self {
        case .safeAndEffectiveCare:    return "Safe & Effective Care"
        case .healthPromotion:         return "Health Promotion"
        case .psychosocialIntegrity:   return "Psychosocial Integrity"
        case .physiologicalIntegrity:  return "Physiological Integrity"
        }
    }
}

public extension TestPlanSubcategory {
    var displayName: String {
        switch self {
        case .managementOfCare:                      return "Management of Care"
        case .safetyAndInfectionControl:             return "Safety & Infection Control"
        case .healthPromotion:                       return "Health Promotion & Maintenance"
        case .psychosocialIntegrity:                 return "Psychosocial Integrity"
        case .basicCareAndComfort:                   return "Basic Care & Comfort"
        case .pharmacologicalAndParenteralTherapies: return "Pharmacological & Parenteral"
        case .reductionOfRiskPotential:              return "Reduction of Risk Potential"
        case .physiologicalAdaptation:               return "Physiological Adaptation"
        }
    }

    /// Mid-point of the score-distribution band from the 2026 NCLEX-RN Test Plan.
    var percentLabel: String {
        switch self {
        case .managementOfCare:                      return "18%"
        case .safetyAndInfectionControl:             return "13%"
        case .healthPromotion:                       return "9%"
        case .psychosocialIntegrity:                 return "9%"
        case .basicCareAndComfort:                   return "9%"
        case .pharmacologicalAndParenteralTherapies: return "16%"
        case .reductionOfRiskPotential:              return "12%"
        case .physiologicalAdaptation:               return "14%"
        }
    }

    var parentCategory: TestPlanCategory {
        switch self {
        case .managementOfCare,
             .safetyAndInfectionControl:
            return .safeAndEffectiveCare
        case .healthPromotion:
            return .healthPromotion
        case .psychosocialIntegrity:
            return .psychosocialIntegrity
        case .basicCareAndComfort,
             .pharmacologicalAndParenteralTherapies,
             .reductionOfRiskPotential,
             .physiologicalAdaptation:
            return .physiologicalIntegrity
        }
    }

    /// NCSBN 2026 RN Test Plan order — canonical structure of the exam blueprint.
    static var inCanonicalOrder: [TestPlanSubcategory] {
        [
            .managementOfCare,
            .safetyAndInfectionControl,
            .healthPromotion,
            .psychosocialIntegrity,
            .basicCareAndComfort,
            .pharmacologicalAndParenteralTherapies,
            .reductionOfRiskPotential,
            .physiologicalAdaptation
        ]
    }
}
