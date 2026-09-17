import Foundation
import Testing
@testable import NursemindCore

@Suite("Specialty daily nursing support")
struct SpecialtyDailySupportTests {
    static let referenceIDs = [
        "hemodialysis-nursing-support", "peritoneal-dialysis-daily-care",
        "dialysis-nutrition-and-fluids", "conservative-kidney-care",
        "cpap-daily-support", "home-oxygen-and-oximetry", "pulmonary-rehabilitation-support",
        "urinary-continence-support", "urostomy-daily-care", "bowel-ostomy-daily-support",
        "dysphagia-mealtime-support", "stroke-recovery-daily-support"
    ]

    @Test("New readers have attributed content and direct sources", arguments: referenceIDs)
    func attributedSections(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: "reference:" + id))
        let record = ContentDepthRecord(entry)
        #expect(record.absentSections.isEmpty)
        #expect(record.uncitedBlocks.isEmpty)
        #expect(record.unresolvedCitationIDs.isEmpty)
        #expect(record.sourceLocatorIssues.isEmpty)
        #expect(record.sourceURLs.allSatisfy { URL(string: $0)?.scheme == "https" })
    }

    @Test("New readers are reachable by search, topic and related navigation", arguments: referenceIDs)
    func discoverability(id: String) throws {
        let fullID = "reference:" + id
        let entry = try #require(ContentRegistry.shared.entry(byID: fullID))
        #expect(ContentRegistry.shared.search(entry.title).contains { $0.id == fullID })
        #expect(LibraryTopic.all.contains { $0.entryIDs.contains(fullID) })
        let groups = EntryLinkRegistry.shared.groups(for: fullID)
        #expect(!groups.isEmpty)
        for target in groups.flatMap(\.targets) {
            #expect(ContentRegistry.shared.entry(byID: target.entryID) != nil)
            #expect(EntryLinkRegistry.shared.groups(for: target.entryID)
                .flatMap(\.targets).contains { $0.entryID == fullID })
        }
    }
}
