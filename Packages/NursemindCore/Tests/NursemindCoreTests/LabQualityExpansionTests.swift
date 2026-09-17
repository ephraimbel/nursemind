import Foundation
import Testing
@testable import NursemindCore

@Suite("Lab quality and bedside workflow references")
struct LabQualityExpansionTests {
    static let labIDs = ["bun", "albumin", "bnp", "lipase", "procalcitonin", "platelets", "inr", "pt", "ck-mb", "prealbumin"]
    static let referenceIDs = ["reading-lab-results", "laboratory-test-preparation", "nursing-care-plan-evaluation"]

    @Test("Reviewed lab sections are present and citations resolve", arguments: labIDs)
    func labSections(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: "lab:" + id))
        let record = ContentDepthRecord(entry)
        #expect(record.absentSections.isEmpty)
        #expect(record.uncitedBlocks.isEmpty)
        #expect(record.unresolvedCitationIDs.isEmpty)
        #expect(record.sourceLocatorIssues.isEmpty)
    }

    @Test("Workflow references are reachable with fully attributed content", arguments: referenceIDs)
    func workflowReferences(id: String) throws {
        let fullID = "reference:" + id
        let entry = try #require(ContentRegistry.shared.entry(byID: fullID))
        let record = ContentDepthRecord(entry)
        #expect(record.uncitedBlocks.isEmpty)
        #expect(record.unresolvedCitationIDs.isEmpty)
        #expect(record.sourceLocatorIssues.isEmpty)
        #expect(!record.topicIDs.isEmpty)
        #expect(!EntryLinkRegistry.shared.groups(for: fullID).isEmpty)
        #expect(ContentRegistry.shared.search(entry.title).contains { $0.id == fullID })
    }

    @Test("Coagulation references do not embed automatic reversal prescriptions")
    func coagulationPrescriptions() {
        for lab in [INRSample.entry, PTSample.entry, PlateletsSample.entry] {
            let text = (lab.interpretationTiers.flatMap { [$0.summary] + $0.nursingActions }
                + (lab.watchFor ?? []).map(\.text)
                + lab.referenceRanges.map(\.label)).joined(separator: " ").lowercased()
            #expect(!text.contains("hold warfarin"))
            #expect(!text.contains("critical — transfuse"))
            #expect(!text.contains("do not give platelet"))
            #expect(text.range(of: #"vitamin k\s+\d"#, options: .regularExpression) == nil)
        }
        #expect(PlateletsSample.entry.watchFor?.contains {
            $0.citationIDs.contains("lab_ash_hit") && $0.text.contains("active bleeding")
        } == true)
    }

    @Test("Nutrition and cardiac-marker corrections retain their specific evidence")
    func interpretationCorrections() {
        #expect(AlbuminSample.entry.nursingActions?.contains {
            $0.citationIDs.contains("lab_aspen_proteins") && $0.text.contains("Neither albumin nor prealbumin")
        } == true)
        #expect(CKMBSample.entry.interpretationTiers.contains {
            $0.citationIDs.contains("lab_ck") && $0.summary.contains("not specific")
        })
        #expect(PrealbuminSample.entry.nursingActions?.contains {
            $0.citationIDs.contains("review_prealbumin_aspen") && $0.text.contains("Neither prealbumin nor albumin")
        } == true)
    }
}
