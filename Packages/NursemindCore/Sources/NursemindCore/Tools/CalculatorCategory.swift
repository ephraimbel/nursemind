import Foundation

public enum CalculatorCategory: String, Codable, CaseIterable, Sendable, Hashable {
    case cardiovascular
    case respiratory
    case renalMetabolic
    case hepatic
    case hematology
    case burns
    case riskScores
    case anthropometry
    case conversions

    public var displayName: String {
        switch self {
        case .cardiovascular:  return "Cardiovascular"
        case .respiratory:     return "Respiratory"
        case .renalMetabolic:  return "Renal · Metabolic"
        case .hepatic:         return "Hepatic"
        case .hematology:      return "Hematology"
        case .burns:           return "Burns"
        case .riskScores:      return "Risk Scores"
        case .anthropometry:   return "Anthropometry"
        case .conversions:     return "Conversions"
        }
    }

    public var browseOrder: Int {
        switch self {
        case .cardiovascular:  return 0
        case .respiratory:     return 1
        case .renalMetabolic:  return 2
        case .hepatic:         return 3
        case .hematology:      return 4
        case .burns:           return 5
        case .riskScores:      return 6
        case .anthropometry:   return 7
        case .conversions:     return 8
        }
    }

    public var eyebrowName: String {
        switch self {
        case .cardiovascular:  return "TOOL · CARDIOVASCULAR"
        case .respiratory:     return "TOOL · RESPIRATORY"
        case .renalMetabolic:  return "TOOL · RENAL & METABOLIC"
        case .hepatic:         return "TOOL · HEPATIC"
        case .hematology:      return "TOOL · HEMATOLOGY"
        case .burns:           return "TOOL · BURNS"
        case .riskScores:      return "TOOL · RISK SCORE"
        case .anthropometry:   return "TOOL · ANTHROPOMETRY"
        case .conversions:     return "TOOL · CONVERSION"
        }
    }
}
