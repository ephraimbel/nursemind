import Foundation

/// The MY UNIT filter (PLAN.md R2): stories that touch an entry the nurse
/// has saved, then stories classified for their unit. Pure functions over
/// the served feed; the server never sees a user's saved entries.
enum FeedWatchlist {
    struct Partition: Equatable {
        /// Stories whose related entries intersect the saved entries, newest first.
        var matched: [FeedItem] = []
        /// Remaining stories classified for the unit, in served (ranked) order.
        var unit: [FeedItem] = []
        var isEmpty: Bool { matched.isEmpty && unit.isEmpty }
    }

    /// Classifier specialty tags (feed-classify VALID_SPECIALTIES) that a
    /// nursing unit reads as "mine".
    static func specialties(for unit: NursingUnit) -> Set<String> {
        switch unit {
        case .medSurg:           return ["med_surg"]
        case .icu:               return ["icu"]
        case .er:                return ["ed"]
        case .stepDown:          return ["icu", "med_surg"]
        case .lAndD:             return ["ob"]
        case .pediatrics:        return ["peds"]
        case .nicu:              return ["peds"]
        case .oncology:          return ["oncology"]
        case .orthopedics:       return ["perioperative", "med_surg"]
        case .operatingRoom:     return ["perioperative"]
        case .psychMentalHealth: return ["mental_health"]
        case .homeHealth:        return ["home_health"]
        case .longTermCare:      return ["geriatric"]
        case .school:            return ["peds"]
        case .clinic, .other:    return []
        }
    }

    /// The chip only appears when it can ever show something.
    static func isAvailable(pinned: [String], unitSpecialties: Set<String>) -> Bool {
        !pinned.isEmpty || !unitSpecialties.isEmpty
    }

    /// Saved entry ids the story touches, in the user's saved order so the
    /// first one is the most recently saved.
    static func matchedPinnedIDs(related: [String], pinned: [String]) -> [String] {
        guard !related.isEmpty, !pinned.isEmpty else { return [] }
        let relatedSet = Set(related)
        return pinned.filter { relatedSet.contains($0) }
    }

    static func partition(
        items: [FeedItem],
        related: (FeedItem) -> [String],
        pinned: [String],
        unitSpecialties: Set<String>
    ) -> Partition {
        var result = Partition()
        for item in items {
            if !matchedPinnedIDs(related: related(item), pinned: pinned).isEmpty {
                result.matched.append(item)
            } else if !unitSpecialties.isDisjoint(with: item.specialties) {
                result.unit.append(item)
            }
        }
        result.matched.sort { $0.displayDate > $1.displayDate }
        return result
    }
}
