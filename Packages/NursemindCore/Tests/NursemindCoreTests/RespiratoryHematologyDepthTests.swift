import Foundation
import Testing
@testable import NursemindCore

@Suite("Respiratory, vascular and hematology reference depth")
struct RespiratoryHematologyDepthTests {
    static let entryIDs: [String] = [
        "reference:bronchoscopy-preparation-recovery",
        "reference:thoracentesis-assessment-recovery",
        "reference:pulmonary-function-testing-support",
        "reference:pleural-effusion-follow-up",
        "reference:vte-recovery-follow-up",
        "reference:peripheral-artery-disease-foot-care",
        "reference:immune-thrombocytopenia-follow-up",
        "reference:aplastic-anemia-nursing-support",
        "reference:hemolytic-anemia-follow-up",
        "reference:vitamin-b12-deficiency-follow-up"
    ]

    @Test("Expanded references resolve in search, topics and related navigation", arguments: entryIDs)
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

    @Test("Every expanded content block has resolvable citations", arguments: entryIDs)
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
                Issue.record("Unattributed table in expanded reference \(id)")
            }
        }
    }
}
