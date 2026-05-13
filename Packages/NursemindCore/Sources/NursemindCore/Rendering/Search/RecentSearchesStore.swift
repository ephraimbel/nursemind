import Foundation
import SwiftUI

/// Persists the user's recent global-search queries in UserDefaults. Capped
/// at 10 entries, newest-first, dedup'd case-insensitively. No PHI risk —
/// queries are reference-style strings (drug names, lab names, etc.).
@MainActor
@Observable
public final class RecentSearchesStore {
    public static let shared = RecentSearchesStore()

    private let key = "nm.search.recents"
    private let maxCount = 10
    private let defaults: UserDefaults

    public private(set) var queries: [String]

    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        self.queries = defaults.stringArray(forKey: key) ?? []
    }

    /// Records a query as the most-recent. Trims whitespace, ignores empty,
    /// dedups case-insensitively, caps to maxCount.
    public func record(_ raw: String) {
        let q = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return }
        var updated = queries.filter { $0.localizedCaseInsensitiveCompare(q) != .orderedSame }
        updated.insert(q, at: 0)
        if updated.count > maxCount { updated = Array(updated.prefix(maxCount)) }
        queries = updated
        defaults.set(updated, forKey: key)
    }

    public func clear() {
        queries = []
        defaults.removeObject(forKey: key)
    }
}
