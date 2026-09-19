import SwiftUI

/// Single source of truth for cross-tab navigation. Owns the selected tab and
/// the navigation paths for each tab so any view can request a deep-link to
/// another tab without touching local state.
///
/// Critical UX rule: when a cross-link fires, only the *destination* tab's
/// path is replaced — the source tab's path stays intact so the user can
/// switch back to where they were.
@MainActor
@Observable
public final class AppRouter {
    public static let shared = AppRouter()

    private static let selectedTabKey = "nm.router.selectedTab"

    /// Persists across launches so backgrounding returns the user to the tab
    /// they last had open. Clamped to the valid range on read so a stale
    /// value from a previous build (when the tab order was different) can't
    /// land the user on a tab that no longer exists.
    public var selectedTab: Int = {
        let stored = UserDefaults.standard.integer(forKey: AppRouter.selectedTabKey)
        let validRange = 0...AppRouter.profileTab
        return validRange.contains(stored) ? stored : AppRouter.askTab
    }() {
        didSet {
            UserDefaults.standard.set(selectedTab, forKey: AppRouter.selectedTabKey)
            guard selectedTab != oldValue else { return }
            AnalyticsService.shared.capture(
                "tab_switched",
                properties: [
                    "from": AppRouter.tabName(for: oldValue),
                    "to": AppRouter.tabName(for: selectedTab)
                ]
            )
        }
    }

    /// Analytics name of the selected tab (`ask`, `feed`, `library`, `profile`).
    public var selectedTabName: String { Self.tabName(for: selectedTab) }

    private static func tabName(for index: Int) -> String {
        switch index {
        case askTab:     return "ask"
        case feedTab:    return "feed"
        case libraryTab: return "library"
        case profileTab: return "profile"
        default:         return "unknown"
        }
    }

    public var libraryPath: NavigationPath = NavigationPath()

    /// Feed tab navigation stack, router-owned so a notification or URL can
    /// push a story from anywhere (including a cold launch).
    public var feedPath: NavigationPath = NavigationPath()

    /// Filter the Feed list should adopt on its next appearance; consumed by
    /// FeedListView. Set by `openFeedWatchlist()`.
    var pendingFeedFilter: FeedFilter?

    /// Which section of the Library tab is showing — reference content or
    /// tools/calculators. Lives on the router (not local LibraryHomeView state)
    /// so cross-link entry points like `openCalculator()` can land the user on
    /// the correct sub-section after pop.
    public var librarySection: LibrarySection = .reference

    /// Whether the global search sheet is currently presented. Owned by the
    /// router so any tab's nav-bar icon can trigger it and any result row can
    /// dismiss it without lifting state up to RootView.
    public var isSearchPresented: Bool = false

    /// Pending query for the Ask tab. Set by `switchToAskAndPrefill(_:)`;
    /// AskHomeView observes this and sets `viewModel.inputText` then clears it.
    public var pendingAskQuery: String?

    /// When true alongside `pendingAskQuery`, AskHomeView auto-sends the query
    /// after prefilling. Used by the entry-AI quick actions ("Quick summary",
    /// "Nursing priorities", etc.) where the question is fully formed and the
    /// user expects an answer immediately, not a chance to edit.
    public var pendingAskAutoSend: Bool = false

    private init() {}

    /// Sub-section of the Library tab. Library = reference content (entries,
    /// saved answers, NCLEX). Tools = calculators. Toggled via the segment
    /// control at the top of LibraryHomeView.
    public enum LibrarySection: String, CaseIterable, Hashable {
        case reference = "Library"
        case tools = "Tools"
    }

    // MARK: - Tab indices (mirrors RootView ordering)
    // Ask is the landing tab — the AI co-pilot is the front door of the product.
    // Feed sits between Ask and Library, gated by UserPreferences.feedTabEnabled.

    public static let askTab     = 0
    public static let feedTab    = 1
    public static let libraryTab = 2
    public static let profileTab = 3

    // MARK: - Cross-link entry points

    /// Switch to Library and open the given entry. Library path is replaced
    /// so the user lands directly on the entry, not deep inside whatever
    /// stack was there before.
    public func openLibraryEntry(_ id: String) {
        var newPath = NavigationPath()
        newPath.append(LibraryDestination.entry(id))
        libraryPath = newPath
        librarySection = .reference
        selectedTab = AppRouter.libraryTab
    }

    /// Switch to Library and open a saved AI answer detail directly.
    public func openSavedAnswer(_ id: UUID) {
        var newPath = NavigationPath()
        newPath.append(LibraryDestination.savedEntry(id))
        libraryPath = newPath
        librarySection = .reference
        selectedTab = AppRouter.libraryTab
    }

    /// Switch to Library and open the saved-answers list.
    public func openSavedList() {
        var newPath = NavigationPath()
        newPath.append(LibraryDestination.savedList)
        libraryPath = newPath
        librarySection = .reference
        selectedTab = AppRouter.libraryTab
    }

    /// Switch to Library and open the given calculator. Calculators now live
    /// inside the Library tab — the dedicated Tools tab was retired in favor
    /// of a unified IA where Library contains both reference content and tools.
    public func openCalculator(_ id: String) {
        guard ToolsAvailability.calculatorsEnabled else { return }
        var newPath = NavigationPath()
        newPath.append(LibraryDestination.calculator(id))
        libraryPath = newPath
        librarySection = .tools
        selectedTab = AppRouter.libraryTab
    }

    /// Switch to Library, set section to Tools, and clear the path so the user
    /// lands on the Tools home view (BROWSE calculator categories visible).
    public func openToolsHome() {
        guard ToolsAvailability.calculatorsEnabled else { return }
        libraryPath = NavigationPath()
        librarySection = .tools
        selectedTab = AppRouter.libraryTab
    }

    /// Switch to Library and open the given NCLEX Test Plan subcategory's
    /// entries list. Replaces libraryPath so the user lands directly on it.
    public func openNCLEXSubcategory(_ subcategory: TestPlanSubcategory) {
        var newPath = NavigationPath()
        newPath.append(LibraryDestination.nclexSubcategory(subcategory))
        libraryPath = newPath
        librarySection = .reference
        selectedTab = AppRouter.libraryTab
    }

    /// Switch to the Ask tab and prefill the input field with the given query.
    /// Used by the global-search "Ask NurseMind about X" CTA so the user lands
    /// on Ask with their query already typed — they only need to hit send.
    /// Pass `autoSend: true` for fully-formed questions where the user expects
    /// an immediate answer (e.g., entry-AI quick actions).
    public func switchToAskAndPrefill(_ query: String, autoSend: Bool = false) {
        pendingAskQuery = query
        pendingAskAutoSend = autoSend
        selectedTab = AppRouter.askTab
    }

    // MARK: - Feed deep links (push + nursemind:// URLs)

    /// Feed tab on the MY UNIT filter (THIS WEEK when it is unavailable;
    /// FeedListView reconciles).
    public func openFeedWatchlist() {
        feedPath = NavigationPath()
        pendingFeedFilter = .watchlist
        selectedTab = AppRouter.feedTab
    }

    /// Feed tab with the story pushed. The destination view loads the feed
    /// if it has not hydrated yet.
    public func openFeedItem(_ id: UUID) {
        var newPath = NavigationPath()
        newPath.append(FeedDestination.item(id))
        feedPath = newPath
        selectedTab = AppRouter.feedTab
    }

    /// Feed tab, default filter.
    public func openFeed() {
        feedPath = NavigationPath()
        pendingFeedFilter = .thisWeek
        selectedTab = AppRouter.feedTab
    }

    // MARK: - Global search sheet

    public func presentSearch() {
        isSearchPresented = true
    }

    public func dismissSearch() {
        isSearchPresented = false
    }

    // MARK: - Shortcut for routing arbitrary CrossLinkDestination

    public func open(_ destination: CrossLinkDestination) {
        switch destination {
        case .libraryEntry(let id, _):
            openLibraryEntry(id)
        case .calculator(let id):
            openCalculator(id)
        }
    }
}
