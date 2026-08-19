import Foundation

/// One rendered target row inside a related-entries group.
public struct RelatedEntryTarget: Hashable, Sendable {
    public let entryID: String
    public let note: String?
}

/// One eyebrow-labeled group of related entries on an entry page.
public struct RelatedEntryGroup: Hashable, Sendable {
    public let label: String
    public let targets: [RelatedEntryTarget]
}

/// Single source of truth for library↔library cross-links. Edges are authored
/// once in `Content/Links/`; both directions are derived here. Backed by
/// in-memory Swift literals for v1, same as ContentRegistry — the flat
/// `EntryLink` shape maps 1:1 to a Supabase `entry_links` table for v1.1.
///
/// Editing rules (test-enforced, see EntryLinkRegistryTests):
///   1. Both endpoints must resolve in ContentRegistry — no dead links.
///   2. Relation endpoints must match the relation's allowed categories.
///   3. Links must be clinically meaningful; cap ~5 outbound per relation
///      per entry so no page turns into a link farm.
public final class EntryLinkRegistry: @unchecked Sendable {
    public static let shared = EntryLinkRegistry()

    public let allLinks: [EntryLink]
    private let outbound: [String: [EntryLink]]
    private let inbound: [String: [EntryLink]]

    public init(links: [EntryLink] = EntryLinkRegistry.bundledLinks()) {
        self.allLinks = links

        var out: [String: [EntryLink]] = [:]
        var inb: [String: [EntryLink]] = [:]
        var seen: Set<EntryLink> = []
        for link in links {
            // Same discipline as ContentRegistry's duplicate-id trap: a
            // duplicate or self-referential edge can't ship unnoticed.
            assert(link.from != link.to, "Self-link on \(link.from)")
            assert(seen.insert(link).inserted, "Duplicate link \(link.from) → \(link.to) (\(link.relation.rawValue))")
            out[link.from, default: []].append(link)
            inb[link.to, default: []].append(link)
        }
        self.outbound = out
        self.inbound = inb
    }

    /// Eyebrow-labeled groups for one entry page, ordered by relation
    /// priority. Outbound edges render under the relation's forward label,
    /// inbound under its inverse label; symmetric relations merge both
    /// directions into one group.
    public func groups(for entryID: String) -> [RelatedEntryGroup] {
        struct Bucket {
            let priority: Int
            let order: Int   // outbound before inbound at equal priority
            var targets: [RelatedEntryTarget] = []
        }
        var buckets: [String: Bucket] = [:]
        var seenPerLabel: [String: Set<String>] = [:]

        func add(label: String, priority: Int, order: Int, targetID: String, note: String?) {
            guard seenPerLabel[label, default: []].insert(targetID).inserted else { return }
            var bucket = buckets[label] ?? Bucket(priority: priority, order: order)
            bucket.targets.append(RelatedEntryTarget(entryID: targetID, note: note))
            buckets[label] = bucket
        }

        for link in outbound[entryID] ?? [] {
            add(label: link.relation.forwardLabel,
                priority: link.relation.displayPriority,
                order: 0,
                targetID: link.to,
                note: link.note)
        }
        for link in inbound[entryID] ?? [] {
            add(label: link.relation.inverseLabel,
                priority: link.relation.displayPriority,
                order: link.relation.isSymmetric ? 0 : 1,
                targetID: link.from,
                note: link.relation.isSymmetric ? link.note : nil)
        }

        return buckets
            .sorted { lhs, rhs in
                if lhs.value.priority != rhs.value.priority { return lhs.value.priority < rhs.value.priority }
                if lhs.value.order != rhs.value.order { return lhs.value.order < rhs.value.order }
                return lhs.key < rhs.key
            }
            .map { RelatedEntryGroup(label: $0.key, targets: $0.value.targets) }
    }

    /// All bundled edge files, concatenated. New files added here, mirroring
    /// ContentRegistry.bundledEntries().
    public static func bundledLinks() -> [EntryLink] {
        var links: [EntryLink] = []
        links.append(contentsOf: highAlertLinks())
        links.append(contentsOf: diagnosisLinks())
        links.append(contentsOf: labPairLinks())
        links.append(contentsOf: procedureScenarioLinks())
        links.append(contentsOf: familyLinks())
        links.append(contentsOf: curatedLinks01())
        return links
    }
}
