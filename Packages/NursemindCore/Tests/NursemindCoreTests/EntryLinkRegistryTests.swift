import Foundation
import Testing
@testable import NursemindCore

// Invariants for the library↔library cross-link graph. Same discipline as the
// calculator CrossReferenceRegistry editing rules, but machine-enforced: no
// dead links, no self/duplicate edges, relation endpoints category-correct,
// and no entry turning into a link farm.

@Suite("Entry link registry")
struct EntryLinkRegistryTests {

    /// Cap on outbound links per relation per entry (CrossReferenceRegistry's
    /// "~4, avoid noise" rule with one slot of slack).
    static let outboundCapPerRelation = 5

    @Test func everyLinkEndpointResolves() {
        let registry = ContentRegistry.shared
        for link in EntryLinkRegistry.bundledLinks() {
            #expect(registry.entry(byID: link.from) != nil, "Dead link source: \(link.from)")
            #expect(registry.entry(byID: link.to) != nil, "Dead link target: \(link.to)")
        }
    }

    @Test func noSelfOrDuplicateLinks() {
        var seen: Set<EntryLink> = []
        var seenPairs: Set<String> = []
        for link in EntryLinkRegistry.bundledLinks() {
            #expect(link.from != link.to, "Self-link on \(link.from)")
            #expect(seen.insert(link).inserted, "Duplicate link \(link.from) → \(link.to)")
            // Same pair twice under different relations is almost always an
            // authoring mistake; the symmetric reverse counts as the same pair.
            let pair = [link.from, link.to].sorted().joined(separator: "↔")
            #expect(seenPairs.insert(pair).inserted, "Pair linked twice: \(pair)")
        }
    }

    @Test func relationEndpointsAreCategoryCorrect() {
        let registry = ContentRegistry.shared
        for link in EntryLinkRegistry.bundledLinks() {
            guard let from = registry.entry(byID: link.from),
                  let to = registry.entry(byID: link.to) else { continue }
            if let allowed = link.relation.allowedFromCategories {
                #expect(allowed.contains(from.category),
                        "\(link.relation.rawValue) from \(link.from): category \(from.category.rawValue) not allowed")
            }
            if let allowed = link.relation.allowedToCategories {
                #expect(allowed.contains(to.category),
                        "\(link.relation.rawValue) to \(link.to): category \(to.category.rawValue) not allowed")
            }
        }
    }

    @Test func outboundLinksStayUnderCap() {
        var counts: [String: Int] = [:]
        for link in EntryLinkRegistry.bundledLinks() {
            counts["\(link.from)|\(link.relation.rawValue)", default: 0] += 1
        }
        for (key, count) in counts {
            #expect(count <= Self.outboundCapPerRelation,
                    "\(key) has \(count) outbound links — cap is \(Self.outboundCapPerRelation)")
        }
    }

    /// Notes are navigational subtitles, not content. Anything long enough to
    /// carry a clinical claim belongs in the entry body, cited.
    @Test func notesStayNavigational() {
        for link in EntryLinkRegistry.bundledLinks() {
            if let note = link.note {
                #expect(note.count <= 60, "Note too long on \(link.from) → \(link.to)")
            }
        }
    }

    @Test func groupsDeriveBothDirections() {
        let links = [
            EntryLink(from: "drug:heparin", to: "lab:aptt", relation: .monitorsWith),
            EntryLink(from: "drug:heparin", to: "drug:protamine-sulfate", relation: .reversedBy),
        ]
        let registry = EntryLinkRegistry(links: links)

        let heparin = registry.groups(for: "drug:heparin")
        #expect(heparin.map(\.label) == ["REVERSAL & ANTIDOTE", "MONITORING LABS"])
        #expect(heparin[1].targets.map(\.entryID) == ["lab:aptt"])

        let aptt = registry.groups(for: "lab:aptt")
        #expect(aptt.map(\.label) == ["MONITORED MEDICATIONS"])
        #expect(aptt[0].targets.map(\.entryID) == ["drug:heparin"])

        let protamine = registry.groups(for: "drug:protamine-sulfate")
        #expect(protamine.map(\.label) == ["REVERSES"])

        #expect(registry.groups(for: "drug:unlinked").isEmpty)
    }

    @Test func symmetricRelationsMergeIntoOneGroup() {
        let registry = EntryLinkRegistry(links: [
            EntryLink(from: "lab:calcium", to: "lab:albumin", relation: .interpretWith)
        ])
        #expect(registry.groups(for: "lab:calcium").map(\.label) == ["INTERPRET WITH"])
        #expect(registry.groups(for: "lab:albumin").map(\.label) == ["INTERPRET WITH"])
        #expect(registry.groups(for: "lab:albumin")[0].targets.map(\.entryID) == ["lab:calcium"])
    }

    /// The seed batch is the high-alert hub — spot-check its keystone edges
    /// render on both sides through the shared registry.
    @Test func highAlertSeedIsWired() {
        let shared = EntryLinkRegistry.shared
        #expect(!shared.groups(for: "drug:vancomycin").isEmpty)
        #expect(!shared.groups(for: "lab:vancomycin-trough").isEmpty)
        #expect(!shared.groups(for: "drug:naloxone").isEmpty)
        #expect(!shared.groups(for: "drip:insulin-drip").isEmpty)
    }

    /// Batch 2 spot-checks: diagnosis hubs derive COMMON MEDICATIONS and
    /// WORKUP, and lab pairs render INTERPRET WITH from both sides.
    @Test func diagnosisAndLabPairSeedsAreWired() {
        let shared = EntryLinkRegistry.shared

        let sepsis = shared.groups(for: "diagnosis:sepsis")
        #expect(sepsis.contains { $0.label == "WORKUP" })
        #expect(sepsis.contains { $0.label == "COMMON MEDICATIONS" })

        let ceftriaxone = shared.groups(for: "drug:ceftriaxone")
        #expect(ceftriaxone.contains { $0.label == "USED FOR" })

        let calcium = shared.groups(for: "lab:calcium")
        #expect(calcium.contains { $0.label == "INTERPRET WITH" })
        let albumin = shared.groups(for: "lab:albumin")
        #expect(albumin.contains { group in
            group.label == "INTERPRET WITH" &&
            group.targets.contains { $0.entryID == "lab:calcium" }
        })
    }

    /// Batch 3 spot-checks: procedure hubs and scenario/communication
    /// seeAlso links render from both sides.
    @Test func procedureAndScenarioSeedsAreWired() {
        let shared = EntryLinkRegistry.shared

        let chestTube = shared.groups(for: "procedure:chest-tube-insertion")
        #expect(chestTube.contains { $0.label == "PERFORMED FOR" })
        let pneumothorax = shared.groups(for: "diagnosis:pneumothorax")
        #expect(pneumothorax.contains { $0.label == "RELATED PROCEDURES" })

        let sepsisScenario = shared.groups(for: "scenario:sepsis-recognition-scenario")
        #expect(sepsisScenario.contains { group in
            group.label == "SEE ALSO" &&
            group.targets.contains { $0.entryID == "diagnosis:sepsis" }
        })
        let sepsis = shared.groups(for: "diagnosis:sepsis")
        #expect(sepsis.contains { group in
            group.label == "SEE ALSO" &&
            group.targets.contains { $0.entryID == "scenario:sepsis-recognition-scenario" }
        })

        let sbar = shared.groups(for: "communication:sbar")
        #expect(sbar.contains { $0.label == "SEE ALSO" })
    }
}
