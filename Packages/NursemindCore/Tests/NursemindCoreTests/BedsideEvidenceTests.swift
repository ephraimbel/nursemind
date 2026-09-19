import Foundation
import Testing
@testable import NursemindCore

@Suite("Bedside study evidence", .serialized)
struct BedsideEvidenceTests {
    static let newIDs = [
        "delirium-prevention-ward-care", "inpatient-falls-prevention-evidence",
        "pressure-injury-repositioning-evidence", "dysphagia-hydration-evidence",
        "discharge-communication-evidence", "teach-back-and-show-me-evidence",
        "medication-reconciliation-transition-evidence", "post-discharge-follow-up-evidence"
    ]
    static let expandedIDs = [
        "hospital-oral-care", "hospital-sleep-support",
        "bedside-mobility-assessment", "bedside-nutrition-assessment"
    ]

    @Test func newReferencesAreReachableAndHaveValidTaxonomy() throws {
        for slug in Self.newIDs {
            let id = "reference:" + slug
            let item = try #require(ContentRegistry.shared.entry(byID: id))
            guard case .reference(let entry) = item else {
                Issue.record("Expected reference: \(id)")
                continue
            }
            #expect(ContentRegistry.shared.search(entry.title, limit: 10).contains { $0.id == id })
            #expect(LibraryTopic.all.contains { $0.entryIDs.contains(id) })
            #expect(!EntryLinkRegistry.shared.groups(for: id).isEmpty)
            let tags = try #require(entry.nclexTags)
            #expect(tags.subcategory?.parentCategory == tags.category)
        }
    }

    @Test func everyExpandedBlockHasSpecificResolvableSources() throws {
        for slug in Self.newIDs + Self.expandedIDs {
            let item = try #require(ContentRegistry.shared.entry(byID: "reference:" + slug))
            let record = ContentDepthRecord(item)
            #expect(record.uncitedBlocks.isEmpty)
            #expect(record.unresolvedCitationIDs.isEmpty)
            #expect(record.sourceLocatorIssues.isEmpty)
            guard case .reference(let entry) = item else { continue }
            #expect(Set(entry.citations.map(\.id)).count == entry.citations.count)
            #expect(entry.citations.contains { $0.id.hasPrefix("bedside_evidence_") })
            for source in entry.citations {
                #expect(source.license != .ccBy4WithAIRestriction)
                #expect(!(source.detail ?? "").isEmpty)
                #expect(!(source.publisher ?? "").isEmpty)
                #expect(URL(string: source.url)?.scheme == "https")
            }
        }
    }

    @Test func studyQuestionsRetrieveTheirActualEvidence() {
        let retriever = RAGRetriever()
        for (query, sourceID) in [
            ("delirium prevention adult wards Cochrane multicomponent incidence", "bedside_evidence_delirium"),
            ("pressure injury repositioning TEAM-UP trial foam mattresses", "bedside_evidence_turning"),
            ("medication reconciliation MARQUIS2 discrepancies", "bedside_evidence_marquis"),
            ("post-discharge calls VA evidence readmission", "bedside_evidence_contacts"),
            ("hospital oral care toothbrushing pneumonia meta-analysis", "bedside_evidence_brushing")
        ] {
            let result = retriever.retrieve(for: query)
            #expect(!result.confidenceFloor, "No evidence for \(query)")
            #expect(result.citations.contains { $0.id == sourceID }, "Missing study for \(query)")
            #expect(!result.formattedContext.isEmpty)
        }
    }

    @Test func exportCompiledBatchForManifestComparison() throws {
        struct Block: Encodable {
            let text: String
            let citationIDs: [String]
        }
        struct Section: Encodable {
            let title: String
            let blocks: [Block]
        }
        struct Record: Encodable {
            let id: String
            let sections: [Section]
            let citations: [CitationSource]
        }
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        for slug in Self.newIDs + Self.expandedIDs {
            let item = try #require(ContentRegistry.shared.entry(byID: "reference:" + slug))
            guard case .reference(let entry) = item else { continue }
            let sections = entry.sections.compactMap { section -> Section? in
                guard case .bullets(let title, let bullets) = section else { return nil }
                return Section(title: title, blocks: bullets.map { Block(text: $0.text, citationIDs: $0.citationIDs) })
            }
            let data = try encoder.encode(Record(id: slug, sections: sections, citations: entry.citations))
            print("NM-BEDSIDE-EVIDENCE " + String(decoding: data, as: UTF8.self))
        }
    }
}
