import Foundation
import Testing
@testable import NursemindCore

@Suite("Push deep links and shift-start preferences")
@MainActor
struct PushDeepLinkTests {
    @Test func parsesTheThreeFeedLinks() throws {
        let id = UUID()
        #expect(PushDeepLink.parse(URL(string: "nursemind://feed")!) == .feed)
        #expect(PushDeepLink.parse(URL(string: "nursemind://feed?filter=watchlist")!) == .feedWatchlist)
        #expect(PushDeepLink.parse(URL(string: "nursemind://feed?item=\(id.uuidString)")!) == .feedItem(id))
        #expect(PushDeepLink.parse(URL(string: "nursemind://feed?item=\(id.uuidString.lowercased())")!) == .feedItem(id))
    }

    @Test func rejectsOtherSchemesHostsAndBadIDs() {
        #expect(PushDeepLink.parse(URL(string: "https://nursemind.app/feed")!) == nil)
        #expect(PushDeepLink.parse(URL(string: "nursemind://library")!) == nil)
        #expect(PushDeepLink.parse(URL(string: "nursemind://feed?item=not-a-uuid")!) == .feed)
    }

    @Test func readsThePushPayloadFields() {
        let id = UUID()
        let parsed = PushDeepLink.parse(userInfo: [
            "aps": ["alert": ["title": "NurseMind", "body": "1 alert for your unit"]],
            "deep_link": "nursemind://feed?item=\(id.uuidString)",
            "kind": "urgent",
            "log_id": "abc",
        ])
        #expect(parsed?.link == .feedItem(id))
        #expect(parsed?.kind == "urgent")
        #expect(parsed?.logID == "abc")
        #expect(PushDeepLink.parse(userInfo: ["aps": [:]]) == nil)
    }

    @Test func shiftStartRoundTripsThroughTheProfileColumn() {
        #expect(UserPreferences.minutes(fromShiftStart: "06:45") == 405)
        #expect(UserPreferences.minutes(fromShiftStart: "18:45:00") == 1125)
        #expect(UserPreferences.minutes(fromShiftStart: "24:00") == nil)
        #expect(UserPreferences.minutes(fromShiftStart: "junk") == nil)
        #expect(UserPreferences.defaultShiftStartMinutes == 405)
    }
}
