import Foundation
import Testing
@testable import NursemindCore

/// Pins the R1 event contract (PLAN.md, Daily-return roadmap): exact event
/// names, property keys, derived values, and the rule that no property can
/// carry user-facing text.
@Suite("Feed and session analytics")
@MainActor
struct FeedAnalyticsTests {
    @MainActor
    final class Recorder {
        var events: [(name: String, properties: [String: Any])] = []
        var sink: AnalyticsSink { { [self] name, props in self.events.append((name, props)) } }
        func keys(_ i: Int) -> Set<String> { Set(events[i].properties.keys) }
    }

    static let now = Date(timeIntervalSince1970: 1_800_000_000)

    static func item(
        id: UUID = UUID(),
        category: FeedItem.Category = .drugSafety,
        priority: FeedItem.Priority = .urgent,
        sourcePublishedAt: Date? = now.addingTimeInterval(-3.5 * 86_400),
        publishedAt: Date = now.addingTimeInterval(-1 * 86_400)
    ) -> FeedItem {
        FeedItem(
            id: id,
            source: "FDA MedWatch",
            sourceURL: "https://www.fda.gov/safety",
            sourcePublishedAt: sourcePublishedAt,
            headline: "Heparin sodium lot recalled for potency variance",
            whyNursesCare: "Check lots on your unit before the next dose.",
            body: "Body text that must never reach analytics.",
            askFollowupPrompt: "What should I check?",
            category: category,
            specialties: ["icu"],
            nclexAreas: ["pharm"],
            priority: priority,
            citations: [],
            publishedAt: publishedAt
        )
    }

    static let forbiddenKeys: Set<String> = ["headline", "body", "why_nurses_care", "text", "query", "question", "ask_followup_prompt"]

    static func feed(_ r: Recorder) -> FeedAnalytics {
        FeedAnalytics(sink: r.sink, now: { now })
    }

    // MARK: feed funnel

    @Test func openedCarriesCountsAndLoadState() {
        let r = Recorder()
        Self.feed(r).opened(itemCount: 19, unreadThisWeek: 4, loadState: FeedStore.LoadState.loaded.analyticsName)
        #expect(r.events.count == 1)
        #expect(r.events[0].name == "feed_opened")
        #expect(r.keys(0) == ["item_count", "unread_this_week", "load_state"])
        #expect(r.events[0].properties["load_state"] as? String == "loaded")
        #expect(FeedStore.LoadState.failed("offline").analyticsName == "failed")
    }

    @Test func filterChangedUsesStableNames() {
        let r = Recorder()
        Self.feed(r).filterChanged(from: .thisWeek, to: .category(.medicationSafety))
        #expect(r.events[0].name == "feed_filter_changed")
        #expect(r.events[0].properties["from"] as? String == "this_week")
        #expect(r.events[0].properties["to"] as? String == "category:medication_safety")
        #expect(FeedFilter.saved.analyticsName == "saved")
        #expect(FeedFilter.all.analyticsName == "all")
    }

    @Test func itemOpenedCarriesIdentityPositionAndAge() {
        let r = Recorder()
        let id = UUID()
        Self.feed(r).itemOpened(Self.item(id: id), filter: .all, position: 3, isLead: false)
        let e = r.events[0]
        #expect(e.name == "feed_item_opened")
        #expect(r.keys(0) == ["item_id", "category", "priority", "source", "age_days", "filter", "position", "is_lead"])
        #expect(e.properties["item_id"] as? String == id.uuidString.lowercased())
        #expect(e.properties["category"] as? String == "drug_safety")
        #expect(e.properties["priority"] as? String == "urgent")
        #expect(e.properties["age_days"] as? Int == 3)
        #expect(e.properties["position"] as? Int == 3)
        #expect(e.properties["is_lead"] as? Bool == false)
    }

    @Test func ageUsesSourceDateThenPublishDateAndNeverGoesNegative() {
        #expect(FeedAnalytics.ageDays(of: Self.item(sourcePublishedAt: nil), now: Self.now) == 1)
        let future = Self.item(sourcePublishedAt: Self.now.addingTimeInterval(3_600))
        #expect(FeedAnalytics.ageDays(of: future, now: Self.now) == 0)
    }

    @Test func dwellIsWholeSecondsClampedToThirtyMinutes() {
        let r = Recorder()
        Self.feed(r).readEnded(Self.item(), appearedAt: Self.now.addingTimeInterval(-47.9))
        #expect(r.events[0].name == "feed_item_read_end")
        #expect(r.events[0].properties["dwell_s"] as? Int == 47)
        #expect(FeedAnalytics.dwellSeconds(from: Self.now.addingTimeInterval(-9_000), to: Self.now) == 1_800)
        #expect(FeedAnalytics.dwellSeconds(from: Self.now.addingTimeInterval(60), to: Self.now) == 0)
    }

    @Test func saveUnsaveAskAndLibraryLinkEvents() {
        let r = Recorder()
        let f = Self.feed(r)
        let item = Self.item(category: .clinicalGuideline, priority: .standard)
        f.saved(item)
        f.unsaved(item)
        f.askHandoff(item, action: .suggestedQuestion)
        f.libraryLinkOpened(item, entryID: "drug:heparin", position: 1)
        #expect(r.events.map(\.name) == ["feed_item_saved", "feed_item_unsaved", "feed_ask_handoff", "feed_library_link_opened"])
        #expect(r.events[2].properties["action"] as? String == "suggested_question")
        #expect(r.events[3].properties["entry_id"] as? String == "drug:heparin")
        #expect(r.events[3].properties["position"] as? Int == 1)
        #expect(r.events[0].properties["category"] as? String == "clinical_guideline")
    }

    @Test func noEventCarriesStoryText() {
        let r = Recorder()
        let f = Self.feed(r)
        let item = Self.item()
        f.opened(itemCount: 1, unreadThisWeek: 1, loadState: "loaded")
        f.itemOpened(item, filter: .thisWeek, position: 0, isLead: true)
        f.readEnded(item, appearedAt: Self.now)
        f.saved(item)
        f.askHandoff(item, action: .askYourOwn)
        f.libraryLinkOpened(item, entryID: "drug:heparin", position: 0)
        for e in r.events {
            #expect(Set(e.properties.keys).isDisjoint(with: Self.forbiddenKeys), "\(e.name) leaks a text key")
            for value in e.properties.values {
                if let s = value as? String {
                    #expect(!s.contains(item.headline))
                    #expect(!s.contains(item.body))
                }
            }
        }
    }

    // MARK: session boundaries

    @Test func sessionStartsOnColdLaunchAndAfterBackgroundOnly() {
        let r = Recorder()
        var tab = "ask"
        let s = SessionAnalytics(sink: r.sink, originTab: { tab })
        s.applicationDidBecomeActive()
        s.applicationDidBecomeActive()          // inactive → active, same session
        #expect(r.events.count == 1)
        #expect(r.events[0].name == "session_started")
        #expect(r.keys(0) == ["origin_tab", "cold_launch", "from_notification"])
        #expect(r.events[0].properties["cold_launch"] as? Bool == true)
        #expect(r.events[0].properties["origin_tab"] as? String == "ask")

        s.applicationDidEnterBackground()
        tab = "feed"
        s.applicationDidBecomeActive()
        #expect(r.events.count == 2)
        #expect(r.events[1].properties["cold_launch"] as? Bool == false)
        #expect(r.events[1].properties["origin_tab"] as? String == "feed")
        #expect(r.events[1].properties["from_notification"] as? Bool == false)
    }

    @Test func pendingNotificationKindIsConsumedByTheNextSession() {
        let r = Recorder()
        let s = SessionAnalytics(sink: r.sink, originTab: { "feed" })
        s.pendingNotificationKind = "digest"
        s.applicationDidBecomeActive()
        #expect(r.events[0].properties["from_notification"] as? Bool == true)
        #expect(r.events[0].properties["notification_kind"] as? String == "digest")
        #expect(s.pendingNotificationKind == nil)

        s.applicationDidEnterBackground()
        s.applicationDidBecomeActive()
        #expect(r.events[1].properties["from_notification"] as? Bool == false)
        #expect(r.events[1].properties["notification_kind"] == nil)
    }
}
