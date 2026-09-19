import Foundation
import Testing
@testable import NursemindCore

@Suite("Feed watchlist (MY UNIT)")
struct FeedWatchlistTests {
    static let now = Date(timeIntervalSince1970: 1_800_000_000)

    static func item(
        _ tag: String,
        specialties: [String] = [],
        related: [String] = [],
        ageDays: Double = 0
    ) -> FeedItem {
        FeedItem(
            id: UUID(),
            source: "fda-drugs",
            sourceURL: "https://example.test/\(tag)",
            sourcePublishedAt: now.addingTimeInterval(-ageDays * 86_400),
            headline: "Story \(tag)",
            whyNursesCare: "Because.",
            body: "Body.",
            askFollowupPrompt: "?",
            category: .drugSafety,
            specialties: specialties,
            nclexAreas: [],
            priority: .standard,
            citations: [],
            publishedAt: now,
            relatedEntryIDs: related
        )
    }

    @Test func everyUnitMapsToClassifierTags() {
        let valid: Set<String> = ["icu", "ed", "peds", "med_surg", "ob", "mental_health", "oncology", "perioperative", "geriatric", "home_health"]
        for unit in NursingUnit.allCases {
            #expect(FeedWatchlist.specialties(for: unit).isSubset(of: valid), "\(unit)")
        }
        #expect(FeedWatchlist.specialties(for: .er) == ["ed"])
        #expect(FeedWatchlist.specialties(for: .clinic).isEmpty)
    }

    @Test func availabilityNeedsSavedEntriesOrAUnitTag() {
        #expect(!FeedWatchlist.isAvailable(pinned: [], unitSpecialties: []))
        #expect(FeedWatchlist.isAvailable(pinned: ["drug:heparin"], unitSpecialties: []))
        #expect(FeedWatchlist.isAvailable(pinned: [], unitSpecialties: ["icu"]))
    }

    @Test func matchedIDsFollowTheSavedOrder() {
        let ids = FeedWatchlist.matchedPinnedIDs(
            related: ["drug:insulin", "drug:heparin", "lab:aptt"],
            pinned: ["drug:heparin", "drug:vancomycin", "drug:insulin"]
        )
        #expect(ids == ["drug:heparin", "drug:insulin"])
        #expect(FeedWatchlist.matchedPinnedIDs(related: [], pinned: ["drug:heparin"]).isEmpty)
    }

    @Test func partitionPutsSavedMatchesFirstNewestFirstThenUnitInServedOrder() {
        let olderMatch = Self.item("a", specialties: ["icu"], related: ["drug:heparin"], ageDays: 5)
        let newerMatch = Self.item("b", related: ["drip:heparin"], ageDays: 1)
        let unitOnly1 = Self.item("c", specialties: ["icu"], ageDays: 9)
        let unitOnly2 = Self.item("d", specialties: ["icu", "ed"], ageDays: 2)
        let neither = Self.item("e", specialties: ["peds"], related: ["drug:amoxicillin"])

        let p = FeedWatchlist.partition(
            items: [olderMatch, unitOnly1, neither, newerMatch, unitOnly2],
            related: { $0.relatedEntryIDs },
            pinned: ["drug:heparin", "drip:heparin"],
            unitSpecialties: ["icu"]
        )
        #expect(p.matched.map(\.headline) == ["Story b", "Story a"])
        #expect(p.unit.map(\.headline) == ["Story c", "Story d"])
        #expect(!p.isEmpty)
    }

    @Test func relatedResolverIsHonoredForUnlinkedRows() {
        let unlinked = Self.item("x")
        let p = FeedWatchlist.partition(
            items: [unlinked],
            related: { _ in ["drug:heparin"] },
            pinned: ["drug:heparin"],
            unitSpecialties: []
        )
        #expect(p.matched.count == 1)
    }

    @Test func feedItemDecodesWithAndWithoutRelatedEntryIDs() throws {
        func json(_ extra: String) -> Data {
            Data("""
            {"id":"9F0C2B4E-1B3A-4C2D-9E8F-000000000001","source":"fda-drugs","source_url":"https://x","source_published_at":null,
             "headline":"Heparin lot recalled for potency","why_nurses_care":"Check your lots before the next dose.",
             "body":"Body text long enough to satisfy nothing in particular but present for the decoder to read here.",
             "ask_followup_prompt":"?","category":"drug_safety","specialties":["icu"],"nclex_areas":[],"priority":"urgent",
             "citations":[],"published_at":"2026-09-18T00:00:00Z"\(extra)}
            """.utf8)
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let legacy = try decoder.decode(FeedItem.self, from: json(""))
        #expect(legacy.relatedEntryIDs.isEmpty)
        let linked = try decoder.decode(FeedItem.self, from: json(",\"related_entry_ids\":[\"drug:heparin\",\"lab:aptt\"]"))
        #expect(linked.relatedEntryIDs == ["drug:heparin", "lab:aptt"])
    }

    @Test func onDeviceMatcherAgreesWithTheServerAlgorithmOnAKnownStory() {
        let story = Self.item("h").withText(
            headline: "FDA alerts clinicians to a heparin sodium lot recall",
            why: "Check lots before the next dose and review aPTT monitoring."
        )
        let ids = FeedLibraryMatcher.relatedEntryIDs(for: story)
        #expect(ids.contains { $0.hasPrefix("drug:heparin") }, "\(ids)")
        #expect(ids.count <= FeedLibraryMatcher.maxRelatedIDs)
    }
}

private extension FeedItem {
    func withText(headline: String, why: String) -> FeedItem {
        FeedItem(
            id: id, source: source, sourceURL: sourceURL, sourcePublishedAt: sourcePublishedAt,
            headline: headline, whyNursesCare: why, body: body, askFollowupPrompt: askFollowupPrompt,
            category: category, specialties: specialties, nclexAreas: nclexAreas, priority: priority,
            citations: citations, publishedAt: publishedAt, relatedEntryIDs: relatedEntryIDs
        )
    }
}
