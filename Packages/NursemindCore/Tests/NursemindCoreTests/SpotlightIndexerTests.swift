import CoreSpotlight
import Foundation
import Testing
@testable import NursemindCore

// The identifier written into the index and the identifier parsed on the way
// back out are the same string authored in two places. If they drift, every
// Spotlight result silently opens nothing — and the failure only shows up on a
// device, after an index has been built. These pin the round trip.

@Suite("Spotlight routing")
@MainActor
struct SpotlightIndexerTests {

    private func spotlightActivity(_ identifier: String) -> NSUserActivity {
        let activity = NSUserActivity(activityType: CSSearchableItemActionType)
        activity.userInfo = [CSSearchableItemActivityIdentifier: identifier]
        return activity
    }

    @Test("A library entry identifier opens that entry in the Library tab")
    func routesLibraryEntry() {
        let router = AppRouter.shared
        router.selectedTab = AppRouter.askTab

        // The identifier is the prefix plus LibraryEntry.id, which is itself
        // namespaced ("drug:vancomycin") — so the payload contains two colons
        // and only the first is a separator.
        let handled = SpotlightIndexer.handle(
            activity: spotlightActivity("entry:drug:vancomycin"), router: router)

        #expect(handled)
        #expect(router.selectedTab == AppRouter.libraryTab)
        #expect(router.librarySection == .reference)
    }

    @Test("A calculator identifier opens the Tools section")
    func routesCalculator() {
        let router = AppRouter.shared
        router.selectedTab = AppRouter.askTab

        let handled = SpotlightIndexer.handle(
            activity: spotlightActivity("calculator:map"), router: router)

        #expect(handled)
        #expect(router.selectedTab == AppRouter.libraryTab)
        #expect(router.librarySection == .tools, "calculators live under Tools, not reference")
    }

    @Test("An identifier that no longer resolves is declined, not opened blank")
    func declinesUnknownIdentifier() {
        let router = AppRouter.shared
        router.selectedTab = AppRouter.askTab

        // A stale index entry for content removed from the corpus.
        #expect(!SpotlightIndexer.handle(
            activity: spotlightActivity("entry:drug:no-such-drug"), router: router))
        #expect(!SpotlightIndexer.handle(
            activity: spotlightActivity("calculator:no-such-calculator"), router: router))
        // An unprefixed identifier from some other source.
        #expect(!SpotlightIndexer.handle(
            activity: spotlightActivity("vancomycin"), router: router))

        #expect(router.selectedTab == AppRouter.askTab, "a declined activity must not navigate")
    }

    @Test("A non-Spotlight activity is ignored")
    func ignoresOtherActivities() {
        let router = AppRouter.shared
        router.selectedTab = AppRouter.askTab
        let activity = NSUserActivity(activityType: "app.nursemind.something-else")
        activity.userInfo = [CSSearchableItemActivityIdentifier: "entry:drug:vancomycin"]

        #expect(!SpotlightIndexer.handle(activity: activity, router: router))
        #expect(router.selectedTab == AppRouter.askTab)
    }

    @Test("Every indexed entry id round-trips through the router")
    func everyEntryResolves() {
        // Guards the encoding against a future entry id containing a character
        // that breaks the prefix split — the kind of thing that would take out
        // one category's results and nothing else.
        let registry = ContentRegistry.shared
        var unresolved: [String] = []
        for entry in registry.all {
            let identifier = "entry:" + entry.id
            let payload = String(identifier.dropFirst("entry:".count))
            if registry.entry(byID: payload) == nil { unresolved.append(entry.id) }
        }
        #expect(unresolved.isEmpty, "\(unresolved.count) ids do not survive the round trip")
    }
}
