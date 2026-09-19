import Foundation
import Testing
@testable import NursemindCore

@Suite("Recent evidence review batch")
struct RecentEvidenceTests {
    static let identities = [
        "drug:suzetrigine", "drug:gepotidacin", "drug:brensocatib",
        "drug:nerandomilast", "drug:donanemab", "drug:zuranolone",
        "lab:plasma-p-tau217-amyloid-ratio", "lab:self-collected-vaginal-hpv-testing",
        "reference:lenacapavir-hiv-prevention-evidence", "reference:rsv-adult-vaccination-evidence",
        "reference:obesity-medication-comparison-evidence", "reference:diabetic-kidney-combination-evidence",
        "reference:oral-semaglutide-cardiovascular-evidence", "reference:blood-pressure-diabetes-evidence"
    ]

    @Test("Drafts cannot enter ordinary builds or their discovery indexes")
    func publicationBoundary() throws {
#if DEBUG && RECENT_EVIDENCE_REVIEW
        #expect(Set(RecentEvidenceDrafts.entries.map(\.id)) == Set(Self.identities))
        #expect(EntryLinkRegistry.recentEvidenceDraftLinks().count == 33)
#else
        #expect(RecentEvidenceDrafts.entries.isEmpty)
        #expect(EntryLinkRegistry.recentEvidenceDraftLinks().isEmpty)
        for id in Self.identities {
            #expect(ContentRegistry.shared.entry(byID: id) == nil)
            #expect(!LibraryTopic.all.contains { $0.entryIDs.contains(id) })
            #expect(EntryLinkRegistry.shared.groups(for: id).isEmpty)
        }
#endif
    }

#if DEBUG && RECENT_EVIDENCE_REVIEW
    @Test("Review entries resolve through search, topics and related links", arguments: identities)
    func navigation(id: String) throws {
        let registry = ContentRegistry.shared
        let entry = try #require(registry.entry(byID: id))
        #expect(registry.search(entry.title).contains { $0.id == id })
        #expect(LibraryTopic.all.contains { $0.entryIDs.contains(id) })
        let targets = EntryLinkRegistry.shared.groups(for: id).flatMap(\.targets)
        #expect(!targets.isEmpty)
        for target in targets { #expect(registry.entry(byID: target.entryID) != nil) }
    }

    @Test("Clinical blocks carry resolvable source-specific citations", arguments: identities)
    func evidenceIntegrity(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: id))
        let record = ContentDepthRecord(entry)
        #expect(record.words >= 200)
        #expect(record.uncitedBlocks.isEmpty)
        #expect(record.unresolvedCitationIDs.isEmpty)
        #expect(record.sourceLocatorIssues.isEmpty)
        #expect(record.sourceReview == "2026-09-19")
        let sources: [CitationSource]
        switch entry {
        case .drug(let e):
            sources = e.citations
            #expect(e.dosing.isEmpty)
            #expect(e.quickReference.isEmpty)
            #expect(e.nursingImplications == nil)
            if e.id == "donanemab" || e.id == "zuranolone" {
                #expect(e.warnings.contains { $0.text.hasPrefix("BOXED WARNING:") })
            }
        case .lab(let e):
            sources = e.citations
            #expect(e.referenceRanges.isEmpty)
            #expect(e.interpretationTiers.isEmpty)
            #expect(!e.commonCauses.isEmpty)
        case .reference(let e): sources = e.citations
        default:
            Issue.record("Unexpected evidence category")
            return
        }
        #expect(Set(sources.map(\.id)).count == sources.count)
        for source in sources {
            #expect(source.url.hasPrefix("https://"))
            #expect(!(source.detail ?? "").isEmpty)
            #expect(!(source.publisher ?? "").isEmpty)
            #expect(source.lastRetrieved == "2026-09-19")
        }
    }

    @Test("Export compiled drafts for exact editorial-manifest comparison")
    func exportCompiledDrafts() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        let data = try encoder.encode(RecentEvidenceDrafts.entries)
        print("NM-RECENT-EVIDENCE:" + String(decoding: data, as: UTF8.self))
        let records = ContentRegistry.shared.all.map(ContentDepthRecord.init)
        print("NM-RECENT-AUDIT:" + String(decoding: try encoder.encode(records), as: UTF8.self))
    }

    @Test("Study questions retrieve the cited evidence in review builds")
    func evidenceRetrieval() {
        let retriever = RAGRetriever()
        for (query, sourceID) in [
            ("Suzetrigine Journavx acute pain phase 3", "recent_evidence_suzetrigine_trial"),
            ("Plasma p-tau217 amyloid ratio Alzheimer blood test", "recent_evidence_ptau_fda"),
            ("Adult RSV vaccination DAN-RSV two season evidence", "recent_evidence_dan_rsv"),
            ("Oral semaglutide cardiovascular evidence SOUL", "recent_evidence_soul")
        ] {
            let result = retriever.retrieve(for: query)
            #expect(!result.confidenceFloor, "No local evidence for \(query)")
            #expect(result.citations.contains { $0.id == sourceID }, "Missing source for \(query)")
        }
    }
#endif
}
