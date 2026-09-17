import Foundation
import Testing
@testable import NursemindCore

@Suite("Cross-category clinical depth")
struct CrossCategoryDepthTests {
    static let entryIDs = [
        "drug:cefiderocol", "drug:ceftazidime-avibactam",
        "drip:angiotensin-ii-drip", "drip:cangrelor-drip",
        "lab:cystatin-c", "lab:urine-osmolality", "lab:urine-protein-creatinine",
        "procedure:24-hour-urine-collection", "procedure:peak-flow-measurement",
        "diagnosis:alpha-1-antitrypsin-deficiency", "diagnosis:central-sleep-apnea",
        "scenario:checkback-falling-blood-pressure", "scenario:cus-labor-delivery-escalation",
        "communication:interpreter-safety-escalation",
        "reference:home-oxygen-and-oximetry", "reference:pulmonary-rehabilitation-support"
    ]

    @Test("Expanded entries resolve in search, topics and related navigation", arguments: entryIDs)
    func discoverability(id: String) throws {
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

    @Test("All content types retain complete claim citations", arguments: entryIDs)
    func citations(id: String) throws {
        let entry = try #require(ContentRegistry.shared.entry(byID: id))
        let audit = ContentDepthRecord(entry)
        #expect(audit.uncitedBlocks.isEmpty, "Uncited blocks in \(id): \(audit.uncitedBlocks)")
        #expect(audit.unresolvedCitationIDs.isEmpty)
        #expect(audit.sourceLocatorIssues.isEmpty)
        #expect(!audit.sourceURLs.isEmpty)
        for url in audit.sourceURLs {
            #expect(URL(string: url)?.scheme == "https")
        }
        if case .lab(let lab) = entry {
            #expect(lab.nursingActions?.contains {
                $0.text.contains("Always verify against your facility's reported reference range")
            } == true)
        }
        if case .procedure(let procedure) = entry {
            #expect(procedure.steps.map(\.number) == Array(1...procedure.steps.count))
        }
    }
}
