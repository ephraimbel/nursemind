import Foundation
import Testing
@testable import NursemindCore

@Suite("Critical-care depth expansion")
struct CriticalCareDepthTests {
    static let entryIDs: [String] = [
        "reference:oxygen-device-bedside-checks",
        "reference:oxygenation-versus-ventilation",
        "reference:high-flow-nasal-cannula-monitoring",
        "reference:noninvasive-ventilation-bedside-assessment",
        "reference:ventilator-bedside-assessment",
        "reference:ventilator-waveform-observation",
        "reference:patient-ventilator-asynchrony-recognition",
        "reference:auto-peep-and-ineffective-triggering",
        "reference:artificial-airway-secretion-assessment",
        "reference:tracheostomy-bedside-safety-checks",
        "reference:ventilator-liberation-observation",
        "reference:post-extubation-observation",
        "reference:telemetry-signal-quality",
        "reference:ecg-rate-and-interval-review",
        "reference:rhythm-change-bedside-assessment",
        "reference:qt-interval-monitoring-context",
        "reference:adult-cpr-quality-review",
        "reference:resuscitation-airway-capnography",
        "reference:post-arrest-assessment-priorities",
        "reference:cardiac-arrest-recovery-support"
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
}
