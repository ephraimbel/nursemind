import Foundation
import Testing
@testable import NursemindCore

@Suite("ICU evidence review batch")
struct ICUEvidenceTests {
    static let identities = [
        "reference:icu-preoxygenation-evidence",
        "reference:icu-intubation-first-pass-evidence",
        "reference:high-risk-extubation-support",
        "reference:ards-treatment-evidence",
        "reference:sepsis-fluid-strategy-evidence",
        "reference:septic-shock-corticosteroid-evidence",
        "reference:aki-kidney-support-timing",
        "reference:icu-stress-ulcer-prophylaxis",
        "reference:icu-sedation-drug-evidence",
        "reference:remimazolam-procedural-sedation-evidence",
        "diagnosis:hepatorenal-syndrome-aki",
        "drug:terlipressin",
        "drug:remimazolam",
        "drug:sulbactam-durlobactam",
        "diagnosis:carbapenem-resistant-acinetobacter-infection",
        "reference:attack-trial-crab-treatment"
    ]

    @Test("Pending Tier A content is discoverable only in review builds")
    func publicationBoundary() throws {
#if DEBUG && ICU_EVIDENCE_REVIEW
        #expect(Set(ICUEvidenceDrafts.entries.map(\.id)) == Set(Self.identities))
        #expect(LibraryTopic.icuEvidenceDraftCollections.count == 3)
        #expect(!EntryLinkRegistry.icuEvidenceDraftLinks().isEmpty)
#else
        #expect(ICUEvidenceDrafts.entries.isEmpty)
        #expect(LibraryTopic.icuEvidenceDraftCollections.isEmpty)
        #expect(EntryLinkRegistry.icuEvidenceDraftLinks().isEmpty)
        for id in Self.identities {
            #expect(ContentRegistry.shared.entry(byID: id) == nil)
            #expect(!LibraryTopic.all.contains { $0.entryIDs.contains(id) })
            #expect(EntryLinkRegistry.shared.groups(for: id).isEmpty)
        }
#endif
    }

#if DEBUG && ICU_EVIDENCE_REVIEW
    @Test("New entries resolve through search, collections and related navigation", arguments: identities)
    func navigation(id: String) throws {
        let registry = ContentRegistry.shared
        let entry = try #require(registry.entry(byID: id))
        #expect(registry.search(entry.title).contains { $0.id == id })
        #expect(LibraryTopic.all.contains { $0.entryIDs.contains(id) })
        let targets = EntryLinkRegistry.shared.groups(for: id).flatMap(\.targets)
        #expect(!targets.isEmpty)
        for target in targets {
            #expect(registry.entry(byID: target.entryID) != nil)
        }
    }

    @Test("All authored claims have source locators and declared citations", arguments: identities)
    func evidenceIntegrity(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: id))
        let record = ContentDepthRecord(entry)
        #expect(record.words >= 240)
        #expect(record.uncitedBlocks.isEmpty)
        #expect(record.unresolvedCitationIDs.isEmpty)
        #expect(record.sourceLocatorIssues.isEmpty)
        #expect(record.sourceReview == "2026-09-19")
        let sources: [CitationSource]
        switch entry {
        case .reference(let e): sources = e.citations
        case .diagnosis(let e): sources = e.citations
        case .drug(let e):
            sources = e.citations
            #expect(e.dosing.isEmpty)
            #expect(e.nursingImplications == nil)
            if e.id == "terlipressin" || e.id == "remimazolam" {
                #expect(e.warnings.contains { $0.text.hasPrefix("WARNING:") })
            }
        default:
            Issue.record("Unexpected ICU entry category")
            return
        }
        #expect(Set(sources.map(\.id)).count == sources.count)
        for source in sources {
            #expect(source.url.hasPrefix("https://"))
            #expect(!(source.detail ?? "").isEmpty)
            #expect(!(source.publisher ?? "").isEmpty)
            #expect(source.lastRetrieved == "2026-09-19")
            #expect(source.license == .publicDomain || source.license == .factCitationOnly)
        }
    }
#endif
}
