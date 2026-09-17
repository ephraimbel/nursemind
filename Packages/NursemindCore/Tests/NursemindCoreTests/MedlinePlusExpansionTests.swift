import Foundation
import Testing
@testable import NursemindCore

@Suite("MedlinePlus specialty expansion")
struct MedlinePlusExpansionTests {
    static let entries = ContentRegistry.bundledMedlinePlusReferences()

    @Test("Every imported reference is cited and attributed", arguments: entries.map(\.id))
    func sourceIntegrity(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: id))
        let audit = ContentDepthRecord(entry)
        #expect(audit.absentSections.isEmpty)
        #expect(audit.uncitedBlocks.isEmpty)
        #expect(audit.unresolvedCitationIDs.isEmpty)
        #expect(audit.sourceLocatorIssues.isEmpty)
        guard case .reference(let reference) = entry else {
            Issue.record("Unexpected category: \(id)")
            return
        }
        #expect(reference.sections.count >= 3)
        #expect(reference.citations.count == 1)
        for source in reference.citations {
            #expect(source.license == .publicDomain)
            #expect(URL(string: source.url)?.host == "medlineplus.gov")
            #expect(source.url.contains("/lab-tests/") || source.url.contains("/genetics/condition/"))
            #expect(source.detail?.contains("Source: MedlinePlus, National Library of Medicine.") == true)
            #expect(source.detail?.contains("not independent clinical review") == true)
        }
    }

    @Test("Every new reference has a topic home and is searchable", arguments: entries.map(\.id))
    func discovery(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: id))
        #expect(LibraryTopic.all.contains { $0.entryIDs.contains(id) })
        #expect(ContentRegistry.shared.search(entry.title).contains { $0.id == id })
    }

    @Test("Source qualifiers and nested structure survive the import")
    func preservedClinicalContext() throws {
        let balance = try #require(ContentRegistry.shared.entry(byID: "reference:test-guide-balance-tests"))
        guard case .reference(let guide) = balance else { return }
        let text = guide.sections.compactMap { section -> String? in
            if case .prose(_, let body) = section { return body.text }
            return nil
        }.joined(separator: "\n")
        #expect(text.contains("don't stop taking any medicine without talking with your provider first"))
        #expect(text.contains("  • For an ENG"))
        #expect(text.contains("Are there any risks") == false)
        #expect(guide.sections.contains { section in
            if case .prose(let title, _) = section { return title == "Are there any risks to balance tests?" }
            return false
        })
        #expect(!text.contains("Citation on PubMed"))
        #expect(!text.contains("Available from:"))
        let vng = try #require(ContentRegistry.shared.entry(byID: "reference:test-guide-videonystagmography-vng"))
        guard case .reference(let vngGuide) = vng else { return }
        #expect(vngGuide.sections.contains { section in
            if case .prose(_, let body) = section {
                return body.text.contains("Your ears will be tested one at a time.")
                    && body.text.contains("You'll then be tested again with warm water or air in the same ear.")
            }
            return false
        })
    }

    @Test("Catalog crosses 2000 without duplicate new IDs")
    func catalogCoverage() {
        #expect(Self.entries.count == 215)
        #expect(Set(Self.entries.map(\.id)).count == Self.entries.count)
        #expect(ContentRegistry.shared.all.count > 2000)
        #expect(LibraryTopic.medlinePlusCollections.count == 14)
    }
}
