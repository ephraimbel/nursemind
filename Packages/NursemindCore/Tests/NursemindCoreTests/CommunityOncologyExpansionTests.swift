import Foundation
import Testing
@testable import NursemindCore

@Suite("Community, oncology and nursing workplace expansion")
struct CommunityOncologyExpansionTests {
    static let entryIDs: [String] = [
        "reference:cancer-related-fatigue",
        "reference:cancer-treatment-neuropathy",
        "reference:cancer-treatment-cognitive-changes",
        "reference:cancer-mouth-throat-care",
        "reference:cancer-treatment-diarrhea-support",
        "reference:cancer-treatment-constipation-support",
        "reference:cancer-related-lymphedema",
        "reference:cancer-fertility-counseling",
        "reference:cancer-sexual-health-support",
        "reference:cancer-body-image-support",
        "reference:cancer-survivorship-care-plan",
        "reference:cancer-financial-barriers",
        "reference:food-safety-weakened-immunity",
        "reference:tick-removal-and-follow-up",
        "reference:mosquito-bite-prevention",
        "reference:heat-health-planning",
        "reference:wildfire-smoke-protection",
        "reference:home-carbon-monoxide-prevention",
        "reference:drinking-water-advisories",
        "reference:home-cleaning-and-disinfection",
        "reference:home-medical-device-preparedness",
        "reference:nursing-shift-work-fatigue",
        "reference:respirator-fit-and-seal-check",
        "reference:nursing-workplace-violence",
        "reference:workplace-cleaning-chemical-safety",
        "reference:nursing-mental-health-support"
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

    @Test("Neutropenia food guidance retains specific primary sources")
    func foodSafetySources() {
        let entry = NeutropenicPrecautionsSample.entry
        let foodBullets = entry.sections.flatMap { section -> [AttributedBullet] in
            if case .bullets(_, let bullets) = section { return bullets }
            return []
        }.filter { $0.text.localizedCaseInsensitiveContains("produce") }
        #expect(!foodBullets.isEmpty)
        #expect(foodBullets.allSatisfy { $0.citationIDs.contains("neutropenia_food_nci") })
        #expect(entry.citations.contains { $0.id == "neutropenia_food_nci" })
        #expect(entry.citations.contains { $0.id == "neutropenia_food_cdc" })
    }
}
