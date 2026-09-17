import Foundation
import Testing
@testable import NursemindCore

@Suite("Pathogen-specific infection prevention")
struct InfectionPreventionDepthTests {
    static let entryIDs: [String] = [
        "reference:c-diff-bedside-infection-prevention",
        "reference:candida-auris-bedside-prevention",
        "reference:norovirus-healthcare-outbreak-care",
        "reference:measles-healthcare-exposure-prevention",
        "reference:shingles-healthcare-precautions",
        "reference:influenza-healthcare-prevention"
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
                Issue.record("Unattributed table in expanded reference \(id)")
            }
        }
    }

    @Test("Focused collections connect new and existing care guides")
    func focusedCollections() throws {
        let focused = try #require(LibraryTopic.topic(id: "pathogen-specific-precautions"))
        let broad = try #require(LibraryTopic.topic(id: "infection-prevention"))
        #expect(Set(Self.entryIDs).isSubset(of: Set(focused.entryIDs)))
        #expect(Set(Self.entryIDs).isSubset(of: Set(broad.entryIDs)))
        #expect(focused.entryIDs.contains("lab:c-diff-toxin"))
        #expect(focused.entryIDs.contains("reference:test-guide-flu-influenza-test"))
        let all = ContentRegistry.shared.all
        print("NM-CATALOG entries=\(all.count) references=\(all.filter { $0.category == .reference }.count) topics=\(LibraryTopic.all.count) memberships=\(LibraryTopic.all.flatMap(\.entryIDs).count) distinct=\(Set(LibraryTopic.all.flatMap(\.entryIDs)).count)")
    }
}
