import Foundation

public enum EntryCategory: String, Codable, CaseIterable, Sendable {
    case drug
    case drip
    case lab
    case procedure
    case diagnosis
    case scenario
    case communication
    case reference

    public var displayName: String {
        switch self {
        case .drug:          return "Drugs"
        case .drip:          return "Drips"
        case .lab:           return "Labs"
        case .procedure:     return "Procedures"
        case .diagnosis:     return "Diagnoses"
        case .scenario:      return "Scenarios"
        case .communication: return "Communication"
        case .reference:     return "Reference"
        }
    }

    public var singularName: String {
        switch self {
        case .drug:          return "Drug"
        case .drip:          return "Drip"
        case .lab:           return "Lab"
        case .procedure:     return "Procedure"
        case .diagnosis:     return "Diagnosis"
        case .scenario:      return "Scenario"
        case .communication: return "Communication"
        case .reference:     return "Reference"
        }
    }

    /// Order in the Library home BROWSE list (matches spec §4.2)
    public var browseOrder: Int {
        switch self {
        case .drug:          return 0
        case .drip:          return 1
        case .lab:           return 2
        case .procedure:     return 3
        case .diagnosis:     return 4
        case .scenario:      return 5
        case .communication: return 6
        case .reference:     return 7
        }
    }
}
