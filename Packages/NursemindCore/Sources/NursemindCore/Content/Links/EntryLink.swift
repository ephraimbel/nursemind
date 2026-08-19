import Foundation

/// The clinical meaning of a link between two Library entries. Typed so the
/// UI can group links under editorial eyebrows and so tests can enforce that
/// each relation connects the right categories (a `monitorsWith` edge must go
/// drug/drip → lab, never lab → lab).
public enum EntryRelation: String, Codable, CaseIterable, Sendable {
    case monitorsWith    // drug/drip → lab
    case reversedBy      // drug/drip → drug/drip
    case usedFor         // drug/drip → diagnosis
    case assessedBy      // diagnosis → lab/procedure
    case performedFor    // procedure → diagnosis
    case interpretWith   // lab ↔ lab (symmetric)
    case seeAlso         // any ↔ any (symmetric) — the escape hatch, used sparingly

    /// Symmetric relations render under the same eyebrow from both sides and
    /// need no inverse label.
    public var isSymmetric: Bool {
        self == .interpretWith || self == .seeAlso
    }

    /// Eyebrow shown on the `from` entry, above its outbound targets.
    public var forwardLabel: String {
        switch self {
        case .monitorsWith:  return "MONITORING LABS"
        case .reversedBy:    return "REVERSAL & ANTIDOTE"
        case .usedFor:       return "USED FOR"
        case .assessedBy:    return "WORKUP"
        case .performedFor:  return "PERFORMED FOR"
        case .interpretWith: return "INTERPRET WITH"
        case .seeAlso:       return "SEE ALSO"
        }
    }

    /// Eyebrow shown on the `to` entry, above the entries that link to it.
    public var inverseLabel: String {
        switch self {
        case .monitorsWith:  return "MONITORED MEDICATIONS"
        case .reversedBy:    return "REVERSES"
        case .usedFor:       return "COMMON MEDICATIONS"
        case .assessedBy:    return "SEEN IN"
        case .performedFor:  return "RELATED PROCEDURES"
        case .interpretWith, .seeAlso: return forwardLabel
        }
    }

    /// Display order on an entry page. Safety-critical relations first,
    /// generic cross-references last.
    public var displayPriority: Int {
        switch self {
        case .reversedBy:    return 0
        case .monitorsWith:  return 1
        case .usedFor:       return 2
        case .assessedBy:    return 3
        case .performedFor:  return 4
        case .interpretWith: return 5
        case .seeAlso:       return 6
        }
    }

    /// Categories a link's `from` side may belong to. `nil` = unrestricted.
    public var allowedFromCategories: Set<EntryCategory>? {
        switch self {
        case .monitorsWith, .reversedBy, .usedFor: return [.drug, .drip]
        case .assessedBy:                          return [.diagnosis]
        case .performedFor:                        return [.procedure]
        case .interpretWith:                       return [.lab]
        case .seeAlso:                             return nil
        }
    }

    /// Categories a link's `to` side may belong to. `nil` = unrestricted.
    public var allowedToCategories: Set<EntryCategory>? {
        switch self {
        case .monitorsWith:  return [.lab]
        case .reversedBy:    return [.drug, .drip]
        case .usedFor:       return [.diagnosis]
        case .assessedBy:    return [.lab, .procedure]
        case .performedFor:  return [.diagnosis]
        case .interpretWith: return [.lab]
        case .seeAlso:       return nil
        }
    }
}

/// One curated edge between two Library entries. Authored once; the registry
/// derives both directions, so vancomycin's MONITORING LABS row and the
/// trough entry's MONITORED MEDICATIONS row come from the same edge.
///
/// `from`/`to` are full `LibraryEntry.id` values ("drug:vancomycin",
/// "lab:vancomycin-trough") — the same keys `ContentRegistry.entry(byID:)`
/// resolves.
public struct EntryLink: Hashable, Codable, Sendable {
    public let from: String
    public let to: String
    public let relation: EntryRelation
    /// Optional editorial row subtitle. Must stay navigational — a note that
    /// makes a clinical claim belongs in the entry body, cited, not here.
    public let note: String?

    public init(from: String, to: String, relation: EntryRelation, note: String? = nil) {
        self.from = from
        self.to = to
        self.relation = relation
        self.note = note
    }
}
