import Foundation

/// Feed funnel events for the Daily-return dashboard (PLAN.md R1):
/// opened → item opened → read end → save / ask / library link.
///
/// Every property is an id, an enum raw value, a count or a duration.
/// Headlines, deks and bodies never leave the device through this path.
@MainActor
struct FeedAnalytics {
    static var shared = FeedAnalytics(sink: AnalyticsSinks.postHog, now: { Date() })

    /// Dwell is capped so a reading view left open overnight cannot
    /// distort the median.
    static let maxDwellSeconds = 1_800

    private let sink: AnalyticsSink
    private let now: () -> Date

    init(sink: @escaping AnalyticsSink, now: @escaping () -> Date) {
        self.sink = sink
        self.now = now
    }

    // MARK: - Events

    /// The Feed tab surfaced. `load_state` is included because the first
    /// open of a launch fires before the list has hydrated.
    func opened(itemCount: Int, unreadThisWeek: Int, loadState: String) {
        sink("feed_opened", [
            "item_count": itemCount,
            "unread_this_week": unreadThisWeek,
            "load_state": loadState,
        ])
    }

    func filterChanged(from: FeedFilter, to: FeedFilter) {
        sink("feed_filter_changed", [
            "from": from.analyticsName,
            "to": to.analyticsName,
        ])
    }

    /// A card was tapped. `position` is the zero-based index within the
    /// visible list under `filter`; the lead card is position 0.
    func itemOpened(_ item: FeedItem, filter: FeedFilter, position: Int, isLead: Bool) {
        sink("feed_item_opened", Self.itemProperties(item, now: now()).merging([
            "filter": filter.analyticsName,
            "position": position,
            "is_lead": isLead,
        ]) { _, new in new })
    }

    /// Reading view dismissed. `dwell_s` is whole seconds since it appeared,
    /// capped at `maxDwellSeconds`.
    func readEnded(_ item: FeedItem, appearedAt: Date) {
        sink("feed_item_read_end", Self.itemProperties(item, now: now()).merging([
            "dwell_s": Self.dwellSeconds(from: appearedAt, to: now()),
        ]) { _, new in new })
    }

    func saved(_ item: FeedItem) {
        sink("feed_item_saved", Self.itemProperties(item, now: now()))
    }

    func unsaved(_ item: FeedItem) {
        sink("feed_item_unsaved", Self.itemProperties(item, now: now()))
    }

    /// One of the Ask quick actions was chosen from a story.
    func askHandoff(_ item: FeedItem, action: AskAction) {
        sink("feed_ask_handoff", Self.itemProperties(item, now: now()).merging([
            "action": action.rawValue,
        ]) { _, new in new })
    }

    /// An "In your library" row was tapped. `entry_id` is the prefixed
    /// registry id (for example `drug:heparin`).
    func libraryLinkOpened(_ item: FeedItem, entryID: String, position: Int) {
        sink("feed_library_link_opened", Self.itemProperties(item, now: now()).merging([
            "entry_id": entryID,
            "position": position,
        ]) { _, new in new })
    }

    enum AskAction: String {
        case quickSummary = "quick_summary"
        case nursingTakeaways = "nursing_takeaways"
        case suggestedQuestion = "suggested_question"
        case askYourOwn = "ask_your_own"
    }

    // MARK: - Property builders (pure, tested)

    static func itemProperties(_ item: FeedItem, now: Date) -> [String: Any] {
        [
            "item_id": item.id.uuidString.lowercased(),
            "category": item.category.rawValue,
            "priority": item.priority.rawValue,
            "source": item.source,
            "age_days": ageDays(of: item, now: now),
        ]
    }

    static func ageDays(of item: FeedItem, now: Date) -> Int {
        max(0, Int(now.timeIntervalSince(item.displayDate) / 86_400))
    }

    static func dwellSeconds(from start: Date, to end: Date) -> Int {
        min(maxDwellSeconds, max(0, Int(end.timeIntervalSince(start))))
    }
}

extension FeedFilter {
    /// Stable snake_case names for analytics; category filters carry the
    /// category raw value so a new category needs no analytics change.
    var analyticsName: String {
        switch self {
        case .thisWeek:          return "this_week"
        case .all:               return "all"
        case .saved:             return "saved"
        case .category(let cat): return "category:\(cat.rawValue)"
        }
    }
}

extension FeedStore.LoadState {
    var analyticsName: String {
        switch self {
        case .idle:    return "idle"
        case .loading: return "loading"
        case .loaded:  return "loaded"
        case .failed:  return "failed"
        }
    }
}
