import Foundation
import SwiftUI

public extension Notification.Name {
    /// Fires whenever the user mutates a profile or library-state field that
    /// the sync service should push. Suppressed while ProfileSyncService is
    /// applying values pulled from the server, to avoid push-echo loops.
    static let nmUserPreferencesDidChange = Notification.Name("nm.userPreferences.didChange")
}

/// Persists pinned and recently-viewed entry IDs plus the user's profile
/// (role, unit, appearance theme, notifications, subscription tier, safety
/// contract acknowledgement) in UserDefaults. Replaces the spec's hardcoded
/// placeholders. v1.1 will sync to Supabase.
@MainActor
@Observable
public final class UserPreferences {
    public static let shared = UserPreferences()

    private let defaults: UserDefaults

    // MARK: Storage keys

    private let pinnedKey                = "nm.pinned"
    private let recentsKey               = "nm.recents"
    private let pinnedCalcKey            = "nm.calc.pinned"
    private let recentsCalcKey           = "nm.calc.recents"
    private let displayNameKey           = "nm.profile.displayName"
    private let roleKey                  = "nm.profile.role"
    private let unitKey                  = "nm.profile.unit"
    private let icuSubspecialtyKey       = "nm.profile.icuSubspecialty"
    private let yearsKey                 = "nm.profile.years"
    private let notificationsEnabledKey  = "nm.prefs.notificationsEnabled"
    private let weeklyTipEnabledKey      = "nm.prefs.weeklyTipEnabled"
    private let appearanceKey            = "nm.prefs.appearance"
    private let subscriptionKey          = "nm.subscription.tier"
    private let safetyContractDateKey    = "nm.safety.contractAgreedAt"
    private let askQuotaDateKey          = "nm.ask.quotaDate"
    private let askQuotaCountKey         = "nm.ask.quotaCount"
    private let askLifetimeUsedKey       = "nm.ask.lifetimeUsed"
    private let feedTabEnabledKey        = "nm.flags.feedTabEnabled"
    private let hasRequestedReviewKey    = "nm.review.hasRequested"

    private let maxPinned = 12
    private let maxRecents = 10

    // MARK: Library state

    public private(set) var pinnedIDs: [String]
    public private(set) var recentIDs: [String]
    public private(set) var pinnedCalculatorIDs: [String]
    public private(set) var recentCalculatorIDs: [String]

    // MARK: Profile state

    public var displayName: String {
        didSet {
            defaults.set(displayName, forKey: displayNameKey)
            postChange()
        }
    }
    public var role: UserRole {
        didSet {
            defaults.set(role.rawValue, forKey: roleKey)
            postChange()
        }
    }
    public var unit: NursingUnit {
        didSet {
            defaults.set(unit.rawValue, forKey: unitKey)
            // Sub-specialty only applies to ICU. Clear it on transition out so
            // a stale "Neuro ICU" tag doesn't follow a nurse who moves to ED.
            if unit != .icu, icuSubspecialty != nil {
                icuSubspecialty = nil
            }
            postChange()
        }
    }
    public var icuSubspecialty: ICUSubspecialty? {
        didSet {
            if let v = icuSubspecialty { defaults.set(v.rawValue, forKey: icuSubspecialtyKey) }
            else { defaults.removeObject(forKey: icuSubspecialtyKey) }
            postChange()
        }
    }
    public var yearsOfExperience: Int? {
        didSet {
            if let v = yearsOfExperience { defaults.set(v, forKey: yearsKey) }
            else { defaults.removeObject(forKey: yearsKey) }
            postChange()
        }
    }
    public var notificationsEnabled: Bool {
        didSet {
            defaults.set(notificationsEnabled, forKey: notificationsEnabledKey)
            postChange()
        }
    }
    public var weeklyTipEnabled: Bool {
        didSet {
            defaults.set(weeklyTipEnabled, forKey: weeklyTipEnabledKey)
            postChange()
        }
    }
    public var preferredAppearance: AppearanceTheme {
        didSet {
            defaults.set(preferredAppearance.rawValue, forKey: appearanceKey)
            postChange()
        }
    }
    public var subscriptionTier: SubscriptionTier {
        // Not synced — RevenueCat owns subscription state per device.
        didSet { defaults.set(subscriptionTier.rawValue, forKey: subscriptionKey) }
    }
    /// v1.1 Feed tab gate. Defaults to true — Feed is part of the shipped IA.
    /// Kept as a flag so an emergency disable is one toggle away if the
    /// backend pipeline misbehaves; future build can default it false.
    public var feedTabEnabled: Bool {
        didSet {
            defaults.set(feedTabEnabled, forKey: feedTabEnabledKey)
            postChange()
        }
    }
    /// One-shot gate for the App Store review prompt. Flipped to `true` the
    /// first time we successfully call `RequestReviewAction` after a
    /// completed (non-refusal) AI answer. Apple's framework also rate-limits
    /// to 3 prompts / 365 days, but this client-side flag keeps the request
    /// to a single ask per user lifetime — re-asks happen only if the user
    /// deletes their account (wipe clears this) or a new device install.
    /// Not synced to the server: it's a per-install UX flag, not profile state.
    public var hasRequestedReview: Bool {
        didSet { defaults.set(hasRequestedReview, forKey: hasRequestedReviewKey) }
    }
    public var safetyContractAgreedAt: Date? {
        didSet {
            if let d = safetyContractAgreedAt { defaults.set(d, forKey: safetyContractDateKey) }
            else { defaults.removeObject(forKey: safetyContractDateKey) }
            postChange()
        }
    }

    /// True while ProfileSyncService is applying values it pulled from the
    /// server. While true, `postChange()` is a no-op so the same values don't
    /// bounce right back to the server as a redundant push.
    private var applyingFromSync: Bool = false

    /// Run a block of mutations without firing change notifications. Used by
    /// ProfileSyncService when hydrating from a server pull.
    public func applyFromSync(_ block: () -> Void) {
        let prev = applyingFromSync
        applyingFromSync = true
        block()
        applyingFromSync = prev
    }

    private func postChange() {
        guard !applyingFromSync else { return }
        NotificationCenter.default.post(name: .nmUserPreferencesDidChange, object: self)
    }

    public var hasCompletedOnboarding: Bool {
        safetyContractAgreedAt != nil
    }

    // MARK: Ask daily quota

    /// Number of AI questions submitted today (Pro tier — day-bucketed so the
    /// counter auto-rolls at local midnight without a separate cron). Free
    /// tier doesn't use this path; see `askLifetimeUsed` below.
    public var askQuotaToday: Int {
        guard let stored = defaults.object(forKey: askQuotaDateKey) as? Date,
              Calendar.current.isDateInToday(stored)
        else { return 0 }
        return defaults.integer(forKey: askQuotaCountKey)
    }

    /// Total AI questions a free-tier user has ever submitted. Never resets
    /// except on account deletion (`wipe()`). This is the lifetime trial
    /// counter — free users get exactly N questions across the entire app
    /// lifetime, where N is `SubscriptionTier.free.askDailyLimit` (3).
    /// Once exhausted, the only path forward is Pro.
    public var askLifetimeUsed: Int {
        defaults.integer(forKey: askLifetimeUsedKey)
    }

    /// Dual-semantics: for Free this is the LIFETIME trial cap (3 forever);
    /// for Pro it's the DAILY cap (50/day). The remaining/exceeded
    /// computations below route to the right counter based on tier — callers
    /// only need to know "is the user out of questions" via `askQuotaExceeded`.
    public var askDailyLimit: Int {
        subscriptionTier.askDailyLimit
    }

    public var askQuotaRemaining: Int {
        if subscriptionTier.isPro {
            return max(0, askDailyLimit - askQuotaToday)
        } else {
            return max(0, askDailyLimit - askLifetimeUsed)
        }
    }

    public var askQuotaExceeded: Bool {
        if subscriptionTier.isPro {
            return askQuotaToday >= askDailyLimit
        } else {
            return askLifetimeUsed >= askDailyLimit
        }
    }

    /// Bumps the relevant counter by one. Pro: today's bucket (rolls at
    /// midnight). Free: lifetime counter (never rolls). Call once per
    /// accepted question (after the quota gate, before streaming starts).
    public func incrementAskQuota() {
        if !subscriptionTier.isPro {
            // Free user — lifetime trial counter.
            let next = defaults.integer(forKey: askLifetimeUsedKey) + 1
            defaults.set(next, forKey: askLifetimeUsedKey)
            return
        }
        let today = Calendar.current.startOfDay(for: Date())
        let stored = defaults.object(forKey: askQuotaDateKey) as? Date
        if let s = stored, Calendar.current.isDate(s, inSameDayAs: today) {
            let next = defaults.integer(forKey: askQuotaCountKey) + 1
            defaults.set(next, forKey: askQuotaCountKey)
        } else {
            defaults.set(today, forKey: askQuotaDateKey)
            defaults.set(1, forKey: askQuotaCountKey)
        }
    }

    // MARK: Init

    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        self.pinnedIDs = defaults.stringArray(forKey: pinnedKey) ?? []
        self.recentIDs = defaults.stringArray(forKey: recentsKey) ?? []
        self.pinnedCalculatorIDs = defaults.stringArray(forKey: pinnedCalcKey) ?? []
        self.recentCalculatorIDs = defaults.stringArray(forKey: recentsCalcKey) ?? []

        self.displayName = defaults.string(forKey: displayNameKey) ?? ""
        self.role = (defaults.string(forKey: roleKey).flatMap { UserRole(rawValue: $0) }) ?? .rn
        self.unit = (defaults.string(forKey: unitKey).flatMap { NursingUnit(rawValue: $0) }) ?? .medSurg
        self.icuSubspecialty = defaults.string(forKey: icuSubspecialtyKey).flatMap { ICUSubspecialty(rawValue: $0) }
        let storedYears = defaults.integer(forKey: yearsKey)
        self.yearsOfExperience = defaults.object(forKey: yearsKey) == nil ? nil : storedYears

        // Notifications + weekly tip default ON for clean first-launch experience;
        // user can disable in Profile.
        // Notifications default to OFF — Apple Guideline 4.5.4 requires
        // explicit opt-in for any push delivery. Toggling the in-app switch
        // is the user's opt-in moment; we then request OS-level permission.
        self.notificationsEnabled = defaults.object(forKey: notificationsEnabledKey) as? Bool ?? false
        self.weeklyTipEnabled     = defaults.object(forKey: weeklyTipEnabledKey)     as? Bool ?? false

        self.preferredAppearance = (defaults.string(forKey: appearanceKey)
            .flatMap { AppearanceTheme(rawValue: $0) }) ?? .system
        self.subscriptionTier = (defaults.string(forKey: subscriptionKey)
            .flatMap { SubscriptionTier(rawValue: $0) }) ?? .free
        self.safetyContractAgreedAt = defaults.object(forKey: safetyContractDateKey) as? Date
        self.feedTabEnabled = defaults.object(forKey: feedTabEnabledKey) as? Bool ?? true
        self.hasRequestedReview = defaults.bool(forKey: hasRequestedReviewKey)
    }

    // MARK: Library actions

    public func isPinned(_ id: String) -> Bool {
        pinnedIDs.contains(id)
    }

    public func togglePin(_ id: String) {
        if let idx = pinnedIDs.firstIndex(of: id) {
            pinnedIDs.remove(at: idx)
        } else if pinnedIDs.count < maxPinned {
            pinnedIDs.insert(id, at: 0)
        }
        defaults.set(pinnedIDs, forKey: pinnedKey)
        postChange()
    }

    public func recordView(_ id: String) {
        recentIDs.removeAll { $0 == id }
        recentIDs.insert(id, at: 0)
        if recentIDs.count > maxRecents {
            recentIDs = Array(recentIDs.prefix(maxRecents))
        }
        defaults.set(recentIDs, forKey: recentsKey)
        postChange()
    }

    public func resolvedPinned(in registry: ContentRegistry) -> [LibraryEntry] {
        pinnedIDs.compactMap { registry.entry(byID: $0) }
    }

    public func resolvedRecents(in registry: ContentRegistry) -> [LibraryEntry] {
        recentIDs.compactMap { registry.entry(byID: $0) }
    }

    // MARK: Calculator pin/recent

    public func isPinnedCalculator(_ id: String) -> Bool {
        pinnedCalculatorIDs.contains(id)
    }

    public func togglePinCalculator(_ id: String) {
        if let idx = pinnedCalculatorIDs.firstIndex(of: id) {
            pinnedCalculatorIDs.remove(at: idx)
        } else if pinnedCalculatorIDs.count < maxPinned {
            pinnedCalculatorIDs.insert(id, at: 0)
        }
        defaults.set(pinnedCalculatorIDs, forKey: pinnedCalcKey)
        postChange()
    }

    public func recordCalculatorView(_ id: String) {
        recentCalculatorIDs.removeAll { $0 == id }
        recentCalculatorIDs.insert(id, at: 0)
        if recentCalculatorIDs.count > maxRecents {
            recentCalculatorIDs = Array(recentCalculatorIDs.prefix(maxRecents))
        }
        defaults.set(recentCalculatorIDs, forKey: recentsCalcKey)
        postChange()
    }

    /// Bulk-replace all four library-state arrays in one shot. Used by the
    /// sync service when applying a server pull — the toggle/dedupe logic in
    /// `togglePin` etc. would corrupt server-authoritative ordering. Caller
    /// (ProfileSyncService) wraps this in `applyFromSync` so the writes don't
    /// trigger an immediate re-push of the same data.
    public func replaceLibraryState(
        pinnedEntryIDs: [String],
        recentEntryIDs: [String],
        pinnedCalculatorIDs: [String],
        recentCalculatorIDs: [String]
    ) {
        self.pinnedIDs = Array(pinnedEntryIDs.prefix(maxPinned))
        self.recentIDs = Array(recentEntryIDs.prefix(maxRecents))
        self.pinnedCalculatorIDs = Array(pinnedCalculatorIDs.prefix(maxPinned))
        self.recentCalculatorIDs = Array(recentCalculatorIDs.prefix(maxRecents))
        defaults.set(self.pinnedIDs, forKey: pinnedKey)
        defaults.set(self.recentIDs, forKey: recentsKey)
        defaults.set(self.pinnedCalculatorIDs, forKey: pinnedCalcKey)
        defaults.set(self.recentCalculatorIDs, forKey: recentsCalcKey)
        postChange()
    }

    public func resolvedPinnedCalculators() -> [CalculatorEntry] {
        pinnedCalculatorIDs.compactMap { CalculatorRegistry.entry(byID: $0) }
    }

    public func resolvedRecentCalculators() -> [CalculatorEntry] {
        recentCalculatorIDs.compactMap { CalculatorRegistry.entry(byID: $0) }
    }

    // MARK: Safety contract

    public func acknowledgeSafetyContract() {
        safetyContractAgreedAt = Date()
    }

    // MARK: Account deletion

    /// Wipe every persisted key and reset in-memory state to defaults. Used
    /// by `AccountDeletionService` after a successful server-side deletion.
    /// Suppresses change notifications during the wipe so the sync services
    /// don't try to push the cleared state back to a now-deleted server row.
    public func wipe() {
        applyFromSync {
            // Library state
            self.pinnedIDs = []
            self.recentIDs = []
            self.pinnedCalculatorIDs = []
            self.recentCalculatorIDs = []
            defaults.removeObject(forKey: pinnedKey)
            defaults.removeObject(forKey: recentsKey)
            defaults.removeObject(forKey: pinnedCalcKey)
            defaults.removeObject(forKey: recentsCalcKey)

            // Profile
            self.displayName = ""
            self.role = .rn
            self.unit = .medSurg
            self.icuSubspecialty = nil
            self.yearsOfExperience = nil
            self.preferredAppearance = .system
            self.notificationsEnabled = false
            self.weeklyTipEnabled = false
            self.safetyContractAgreedAt = nil   // also flips hasCompletedOnboarding → false
            self.subscriptionTier = .free
            self.feedTabEnabled = false
            defaults.removeObject(forKey: displayNameKey)
            defaults.removeObject(forKey: roleKey)
            defaults.removeObject(forKey: unitKey)
            defaults.removeObject(forKey: icuSubspecialtyKey)
            defaults.removeObject(forKey: yearsKey)
            defaults.removeObject(forKey: notificationsEnabledKey)
            defaults.removeObject(forKey: weeklyTipEnabledKey)
            defaults.removeObject(forKey: appearanceKey)
            defaults.removeObject(forKey: subscriptionKey)
            defaults.removeObject(forKey: safetyContractDateKey)
            defaults.removeObject(forKey: feedTabEnabledKey)

            // Quota
            defaults.removeObject(forKey: askQuotaDateKey)
            defaults.removeObject(forKey: askQuotaCountKey)
            defaults.removeObject(forKey: askLifetimeUsedKey)

            // One-shot UX flags
            self.hasRequestedReview = false
            defaults.removeObject(forKey: hasRequestedReviewKey)
        }
        // Sync-service high-water marks live in standard UserDefaults under
        // their own keys; clear those too so the next user's initial sync
        // doesn't compare against the old user's timestamps.
        UserDefaults.standard.removeObject(forKey: "nm.sync.profile.lastPushedAt")
    }
}
