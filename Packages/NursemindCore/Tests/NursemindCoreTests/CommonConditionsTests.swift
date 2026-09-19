import Foundation
import Testing
@testable import NursemindCore

@Suite("Common conditions review batch")
struct CommonConditionsTests {
    static let identities = [
        "diagnosis:type-2-diabetes", "diagnosis:hypertension", "diagnosis:obesity",
        "reference:diabetes-sick-day-safety", "reference:hypertension-medication-follow-up",
        "reference:obesity-long-term-care", "diagnosis:dyslipidemia", "diagnosis:chronic-constipation",
        "reference:ibs-symptom-follow-up", "reference:insomnia-cbt-i-follow-up",
        "reference:smoking-cessation-treatment-support", "reference:masld-fibrosis-follow-up",
        "reference:migraine-prevention-follow-up",
        "reference:gerd-treatment-reassessment",
        "reference:iron-deficiency-treatment-follow-up",
        "reference:osteoarthritis-treatment-follow-up",
        "reference:osteoporosis-treatment-continuity",
        "reference:recurrent-uti-prevention-follow-up"
    ]

    @Test("Drafts are absent from ordinary builds and discovery indexes")
    func publicationBoundary() {
#if DEBUG && COMMON_CONDITIONS_REVIEW
        #expect(Set(CommonConditionsDrafts.entries.map(\.id)) == Set(Self.identities))
        #expect(EntryLinkRegistry.commonConditionsDraftLinks().count == 59)
#else
        #expect(CommonConditionsDrafts.entries.isEmpty)
        #expect(EntryLinkRegistry.commonConditionsDraftLinks().isEmpty)
        for id in Self.identities {
            #expect(ContentRegistry.shared.entry(byID: id) == nil)
            #expect(!LibraryTopic.all.contains { $0.entryIDs.contains(id) })
            #expect(EntryLinkRegistry.shared.groups(for: id).isEmpty)
        }
#endif
    }

#if DEBUG && COMMON_CONDITIONS_REVIEW
    @Test("Review entries resolve through search, collections and related links", arguments: identities)
    func navigation(id: String) throws {
        let registry = ContentRegistry.shared
        let entry = try #require(registry.entry(byID: id))
        #expect(registry.search(entry.title).contains { $0.id == id })
        #expect(LibraryTopic.all.contains { $0.entryIDs.contains(id) })
        let targets = EntryLinkRegistry.shared.groups(for: id).flatMap(\.targets)
        #expect(!targets.isEmpty)
        for target in targets { #expect(registry.entry(byID: target.entryID) != nil) }
    }

    @Test("Every clinical block resolves to a specific evidence source", arguments: identities)
    func evidenceIntegrity(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: id))
        let record = ContentDepthRecord(entry)
        #expect(record.words >= 350)
        #expect(record.uncitedBlocks.isEmpty)
        #expect(record.unresolvedCitationIDs.isEmpty)
        #expect(record.sourceLocatorIssues.isEmpty)
        #expect(record.sourceReview == "2026-09-19")
        let sources: [CitationSource]
        switch entry {
        case .diagnosis(let e):
            sources = e.citations
            #expect(e.pathophysiology != nil)
            #expect(!(e.diagnosticCriteria ?? []).isEmpty)
            #expect(!(e.priorityAssessments ?? []).isEmpty)
            #expect(!(e.commonInterventions ?? []).isEmpty)
            #expect(!(e.watchFor ?? []).isEmpty)
        case .reference(let e): sources = e.citations
        default:
            Issue.record("Unexpected category")
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

    @Test("Export compiled drafts for editorial comparison")
    func exportCompiledDrafts() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        let data = try encoder.encode(CommonConditionsDrafts.entries)
        print("NM-COMMON-EVIDENCE:" + String(decoding: data, as: UTF8.self))
        let records = ContentRegistry.shared.all.map(ContentDepthRecord.init)
        print("NM-COMMON-AUDIT:" + String(decoding: try encoder.encode(records), as: UTF8.self))
    }

    @Test("Common-condition questions retrieve their supporting sources")
    func evidenceRetrieval() {
        let retriever = RAGRetriever()
        for (query, sourceID) in [
            ("Type 2 diabetes mellitus diagnostic criteria confirmation", "common_conditions_ada_diagnosis"),
            ("Hypertension medication follow-up kidney monitoring", "common_conditions_kdigo"),
            ("Obesity long-term treatment support maintenance", "common_conditions_surmount4"),
            ("Dyslipidemia in adults cardiovascular risk", "common_conditions_lipids_2026"),
            ("Chronic constipation in adults refractory evaluation", "common_conditions_constipation_aga2026"),
            ("IBS treatment response follow-up dietary trial CARIBS", "common_conditions_ibs_caribs"),
            ("Insomnia CBT-I treatment follow-up", "common_conditions_insomnia_va2025"),
            ("Smoking cessation treatment follow-up withdrawal", "common_conditions_cessation_withdrawal"),
            ("MASLD fibrosis assessment follow-up ESSENCE", "common_conditions_masld_essence"),
            ("Migraine prevention follow-up 2026 guideline", "common_conditions_migraine_2026"),
            ("GERD treatment response reassessment vonoprazan", "common_conditions_gerd_vonoprazan"),
            ("Iron deficiency treatment follow-up PHOSPHARE", "common_conditions_iron_phosphare"),
            ("Osteoarthritis pain treatment follow-up STEP 9", "common_conditions_oa_step9"),
            ("Osteoporosis treatment continuity denosumab", "common_conditions_bone_endocrine"),
            ("Recurrent UTI prevention follow-up D-mannose", "common_conditions_uti_dmannose")
        ] {
            let result = retriever.retrieve(for: query)
            #expect(!result.confidenceFloor, "No local evidence for \(query)")
            #expect(result.citations.contains { $0.id == sourceID }, "Missing source for \(query)")
        }
    }
#endif
}
