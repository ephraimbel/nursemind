import SwiftUI
import UserNotifications

/// Onboarding step that asks the user to opt in to notifications BEFORE we
/// request the OS-level permission. Per Apple Guideline 4.5.4, the in-app
/// toggle must default OFF and consent must be explicit — this page is the
/// explicit consent moment.
///
/// Sits between `personalization` and `safetyContract` in `OnboardingFlow`.
/// The user has just finished telling us about their role/unit; they're
/// invested, they understand what NurseMind is, and they haven't been
/// blocked yet. Best timing for a permission prompt that respects user
/// attention and Apple's "ask in context" guidance.
///
/// Whichever path the user takes (Allow / Not now), we advance to the next
/// step. The settings can be changed later in Profile → Notifications.
struct NotificationsConsentView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var prefs = UserPreferences.shared
    @State private var visible: [Bool] = Array(repeating: false, count: 5)
    @State private var isRequesting: Bool = false

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            FitOrScrollLayout {
                VStack(alignment: .leading, spacing: 0) {
                    header
                    Spacer(minLength: NMSpace.xl)
                    bullets
                    Spacer(minLength: NMSpace.xl)
                    actions
                }
                .padding(.horizontal, NMSpace.lg)
            }
        }
        .task { await stagger() }
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("ONE LAST THING")
            Text("Notifications, on your terms.").displayXL()
                .foregroundStyle(NMColor.textPrimary)
            Text("We send one notification a week, max. No marketing, no nudges.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.top, NMSpace.xxl)
        .opacity(visible[0] ? 1 : 0)
        .offset(y: visible[0] ? 0 : 12)
    }

    // MARK: - Bullets

    private var bullets: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            NotificationBullet(
                title: "Weekly clinical tip",
                detail: "One short, cited reminder. Sunday evenings, that's it."
            )
            .opacity(visible[1] ? 1 : 0)
            .offset(y: visible[1] ? 0 : 8)

            NotificationBullet(
                title: "New library content",
                detail: "When new drugs, drips, labs, or procedures land."
            )
            .opacity(visible[2] ? 1 : 0)
            .offset(y: visible[2] ? 0 : 8)

            NotificationBullet(
                title: "Nothing else, ever",
                detail: "No engagement bait. No re-engagement nags. No marketing pushes."
            )
            .opacity(visible[3] ? 1 : 0)
            .offset(y: visible[3] ? 0 : 8)
        }
    }

    // MARK: - Actions

    private var actions: some View {
        VStack(spacing: NMSpace.md) {
            PrimaryCTAButton(
                title: isRequesting ? "Requesting…" : "Allow notifications",
                action: requestAllow,
                isEnabled: !isRequesting
            )

            Button(action: skip) {
                Text("Not now")
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.vertical, NMSpace.sm)
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .disabled(isRequesting)
        }
        .padding(.bottom, NMSpace.xl)
        .opacity(visible[4] ? 1 : 0)
        .offset(y: visible[4] ? 0 : 12)
    }

    // MARK: - Animation

    /// Staggered fade-up: header → 3 bullets → actions, 90ms apart.
    /// Matches the rhythm of `SafetyContractView` to feel like the same flow.
    /// Reduce Motion: skip animation entirely.
    private func stagger() async {
        guard !reduceMotion else {
            visible = Array(repeating: true, count: visible.count)
            return
        }
        for i in 0..<visible.count {
            withAnimation(.easeOut(duration: 0.45)) {
                visible[i] = true
            }
            try? await Task.sleep(nanoseconds: 90_000_000)
        }
    }

    // MARK: - Actions

    /// Request OS-level notification authorization. If granted, flip both
    /// the master switch and the weekly-tip child to true. If denied, leave
    /// both at their default-off values — the user can still enable later in
    /// Profile → Notifications via the same flow.
    private func requestAllow() {
        Haptic.selection()
        isRequesting = true
        Task {
            let granted: Bool
            do {
                granted = try await UNUserNotificationCenter.current()
                    .requestAuthorization(options: [.alert, .badge, .sound])
            } catch {
                granted = false
            }
            await MainActor.run {
                if granted {
                    prefs.notificationsEnabled = true
                    prefs.weeklyTipEnabled = true
                }
                AnalyticsService.shared.capture(
                    granted ? "notification_permission_granted" : "notification_permission_denied"
                )
                isRequesting = false
                onContinue()
            }
        }
    }

    private func skip() {
        Haptic.selection()
        // Leave both flags at false — defaults set on first launch in
        // UserPreferences init. User can enable later in Profile.
        AnalyticsService.shared.capture("notification_permission_skipped")
        onContinue()
    }
}

// MARK: - Bullet component

private struct NotificationBullet: View {
    let title: String
    let detail: String

    var body: some View {
        HStack(alignment: .top, spacing: NMSpace.base) {
            Image(systemName: "bell")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(NMColor.accent)
                .frame(width: 22, alignment: .center)
                .padding(.top, 4)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(NMFont.bodyLG)
                    .fontWeight(.semibold)
                    .foregroundStyle(NMColor.textPrimary)
                Text(detail)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textSecondary)
                    .lineSpacing(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    NotificationsConsentView(onContinue: {})
}
