import Foundation
import Testing
@testable import NursemindCore

@Suite("Bedside library expansion")
struct BedsideLibraryExpansionTests {
    static let entryIDs: [String] = [
        "reference:adult-head-to-toe-assessment",
        "reference:adult-health-history",
        "reference:focused-respiratory-assessment",
        "reference:focused-cardiovascular-assessment",
        "reference:focused-abdominal-assessment",
        "reference:musculoskeletal-assessment",
        "reference:skin-assessment-beyond-wounds",
        "reference:fluid-balance-monitoring",
        "reference:bedside-nutrition-assessment",
        "reference:hospital-sleep-support",
        "reference:bedside-mobility-assessment",
        "reference:hospital-oral-care",
        "reference:nursing-documentation-principles",
        "reference:hearing-loss-communication",
        "reference:low-vision-bedside-support",
        "reference:aphasia-communication-support",
        "reference:cultural-preferences-assessment",
        "reference:spiritual-support-in-hospital",
        "reference:stool-sample-collection",
        "reference:sterile-field-principles",
        "reference:post-icu-recovery",
        "reference:alarm-fatigue-and-safety",
        "reference:communication-when-speech-is-limited"
    ]

    @Test("New references resolve in search, topics and related navigation", arguments: entryIDs)
    func discoverability(id: String) throws {
        let registry = ContentRegistry.shared
        let entry = try #require(registry.entry(byID: id))
        #expect(registry.search(entry.title).contains { $0.id == id })
        #expect(LibraryTopic.all.contains { $0.entryIDs.contains(id) })
        let groups = EntryLinkRegistry.shared.groups(for: id)
        #expect(!groups.isEmpty)
        for target in groups.flatMap(\.targets) {
            #expect(registry.entry(byID: target.entryID) != nil)
        }
    }

    @Test("Every new content block has resolvable citations", arguments: entryIDs)
    func claimCitations(id: String) throws {
        let item = try #require(ContentRegistry.shared.entry(byID: id))
        guard case .reference(let entry) = item else {
            Issue.record("Expected a reference: \(id)")
            return
        }
        let declared = Set(entry.citations.map(\.id))
        #expect(declared.count == entry.citations.count)
        #expect(entry.nclexTags != nil)
        #expect(!entry.sections.isEmpty)
        for source in entry.citations {
            #expect(URL(string: source.url)?.scheme == "https")
            #expect(!(source.detail ?? "").isEmpty)
            #expect(!(source.publisher ?? "").isEmpty)
        }
        func check(_ text: String, _ ids: [String]) {
            #expect(!text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            #expect(!ids.isEmpty, "Uncited content in \(id)")
            #expect(Set(ids).isSubset(of: declared), "Unresolved source in \(id)")
        }
        for section in entry.sections {
            switch section {
            case .prose(_, let prose): check(prose.text, prose.citationIDs)
            case .bullets(_, let bullets):
                #expect(!bullets.isEmpty)
                for bullet in bullets { check(bullet.text, bullet.citationIDs) }
            case .numberedSteps(_, let steps, let citationIDs):
                #expect(!steps.isEmpty)
                for step in steps { check(step, citationIDs) }
            case .keyValueTable:
                Issue.record("Unattributed table in bedside reference \(id)")
            }
        }
    }

    @Test("Adult oral-care correction retains its primary source")
    func oralCareSources() {
        let entries = [MechanicalVentilationSample.entry, HospitalOralCareSample.entry]
        for entry in entries {
            let oralBullets = entry.sections.flatMap { section -> [AttributedBullet] in
                if case .bullets(_, let bullets) = section { return bullets }
                return []
            }.filter { $0.text.localizedCaseInsensitiveContains("chlorhexidine") }
            #expect(!oralBullets.isEmpty)
            #expect(oralBullets.allSatisfy { $0.citationIDs.contains("bedside_shea_2022") })
            #expect(entry.citations.contains { $0.id == "bedside_shea_2022" })
        }
        for entry in [PneumoniaSample.entry, VAPSample.entry] {
            let oralBullets = (entry.commonInterventions ?? []).filter { $0.text.localizedCaseInsensitiveContains("chlorhexidine") }
            #expect(!oralBullets.isEmpty)
            #expect(oralBullets.allSatisfy { $0.citationIDs.contains("bedside_shea_2022") })
            #expect(entry.citations.contains { $0.id == "bedside_shea_2022" })
        }
    }
}
