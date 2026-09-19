import SwiftUI
import UserNotifications

public struct NotificationsSettingsView: View {
    @State private var prefs = UserPreferences.shared
    @State private var permissionDeniedAlertShown: Bool = false

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel("NOTIFICATIONS", sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text("What you'll get")
                    .displayXL()
                    .padding(.top, NMSpace.md)
                Text("NurseMind sends a small number of useful notifications. You can turn them off entirely or pick what you want.")
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.sm)
                    .lineSpacing(3)

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(spacing: 0) {
                    Toggle(isOn: Binding(
                        get: { prefs.notificationsEnabled },
                        set: { newValue in
                            if newValue {
                                // User-initiated opt-in. Request OS authorization
                                // before flipping the stored bool — if the user
                                // denies in the system sheet, the toggle stays off.
                                Task {
                                    let granted = await requestNotificationAuth()
                                    await MainActor.run {
                                        if granted {
                                            prefs.notificationsEnabled = true
                                            if !prefs.pushDigestEnabled && !prefs.pushUrgentEnabled && !prefs.weeklyTipEnabled {
                                                prefs.pushDigestEnabled = true
                                            }
                                            PushRegistrationService.shared.registerIfOptedIn()
                                        } else {
                                            prefs.notificationsEnabled = false
                                            permissionDeniedAlertShown = true
                                        }
                                    }
                                }
                            } else {
                                prefs.notificationsEnabled = false
                                // Drive the child toggles to false too so we
                                // don't have a stale "on" with no master
                                // delivery. The token row is removed by
                                // PushRegistrationService on this change.
                                prefs.weeklyTipEnabled = false
                                prefs.pushDigestEnabled = false
                                prefs.pushUrgentEnabled = false
                                logSettingsChange()
                            }
                        }
                    )) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Allow notifications")
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Text("Master switch for all NurseMind notifications.")
                                .font(NMFont.bodySM)
                                .foregroundStyle(NMColor.textTertiary)
                                .lineSpacing(2)
                        }
                    }
                    .toggleStyle(.switch)
                    .tint(NMColor.accent)
                    .padding(.vertical, NMSpace.base)

                    Hairline(color: NMColor.borderSubtle)

                    Toggle(isOn: Binding(
                        get: { prefs.pushDigestEnabled },
                        set: { prefs.pushDigestEnabled = $0; logSettingsChange() }
                    )) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Shift-start digest")
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Text("One note when your shift begins, only on days something affects your unit or is new this week. Counts only, never headlines.")
                                .font(NMFont.bodySM)
                                .foregroundStyle(NMColor.textTertiary)
                                .lineSpacing(2)
                        }
                    }
                    .toggleStyle(.switch)
                    .tint(NMColor.accent)
                    .disabled(!prefs.notificationsEnabled)
                    .opacity(prefs.notificationsEnabled ? 1.0 : 0.4)
                    .padding(.vertical, NMSpace.base)

                    if prefs.notificationsEnabled && prefs.pushDigestEnabled {
                        HStack {
                            Text("Shift starts at")
                                .font(NMFont.body)
                                .foregroundStyle(NMColor.textSecondary)
                            Spacer()
                            DatePicker(
                                "Shift starts at",
                                selection: Binding(
                                    get: { Self.date(fromMinutes: prefs.shiftStartMinutes) },
                                    set: { prefs.shiftStartMinutes = Self.minutes(from: $0); logSettingsChange() }
                                ),
                                displayedComponents: .hourAndMinute
                            )
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            .tint(NMColor.accent)
                        }
                        .padding(.bottom, NMSpace.base)
                    }

                    Hairline(color: NMColor.borderSubtle)

                    Toggle(isOn: Binding(
                        get: { prefs.pushUrgentEnabled },
                        set: { prefs.pushUrgentEnabled = $0; logSettingsChange() }
                    )) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Urgent alerts for my unit")
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Text(prefs.pinnedIDs.isEmpty
                                 ? "Save the drugs and drips you give in the Library first. Urgent safety alerts reach you only when one touches a saved entry."
                                 : "An urgent safety alert that touches one of your \(prefs.pinnedIDs.count) saved entries, the day it publishes. Never for anything else.")
                                .font(NMFont.bodySM)
                                .foregroundStyle(NMColor.textTertiary)
                                .lineSpacing(2)
                        }
                    }
                    .toggleStyle(.switch)
                    .tint(NMColor.accent)
                    .disabled(!prefs.notificationsEnabled || prefs.pinnedIDs.isEmpty)
                    .opacity(prefs.notificationsEnabled && !prefs.pinnedIDs.isEmpty ? 1.0 : 0.4)
                    .padding(.vertical, NMSpace.base)

                    Hairline(color: NMColor.borderSubtle)

                    Toggle(isOn: $prefs.weeklyTipEnabled) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Weekly tip")
                                .font(NMFont.bodyLG)
                                .foregroundStyle(NMColor.textPrimary)
                            Text("One short, cited clinical reminder each week. Sent Sunday evening.")
                                .font(NMFont.bodySM)
                                .foregroundStyle(NMColor.textTertiary)
                                .lineSpacing(2)
                        }
                    }
                    .toggleStyle(.switch)
                    .tint(NMColor.accent)
                    .disabled(!prefs.notificationsEnabled)
                    .opacity(prefs.notificationsEnabled ? 1.0 : 0.4)
                    .padding(.vertical, NMSpace.base)
                }

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("WHAT WE DON'T SEND", sparkle: false)
                    Text("No marketing pushes. No engagement-bait reminders. No 'come back to the app' nudges. We send useful clinical content or nothing.")
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineSpacing(3)
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
        .alert("Notifications turned off", isPresented: $permissionDeniedAlertShown) {
            Button("OK", role: .cancel) {}
            Button("Open Settings") {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
        } message: {
            Text("To allow NurseMind to send notifications, enable them in iOS Settings → Notifications → NurseMind.")
        }
    }

    private static func date(fromMinutes minutes: Int) -> Date {
        Calendar.current.date(bySettingHour: minutes / 60, minute: minutes % 60, second: 0, of: Date()) ?? Date()
    }

    private static func minutes(from date: Date) -> Int {
        let parts = Calendar.current.dateComponents([.hour, .minute], from: date)
        return (parts.hour ?? 6) * 60 + (parts.minute ?? 45)
    }

    private func logSettingsChange() {
        AnalyticsSinks.postHog("push_settings_changed", [
            "enabled": prefs.notificationsEnabled,
            "digest": prefs.pushDigestEnabled,
            "urgent": prefs.pushUrgentEnabled,
            "shift_start": prefs.shiftStartLocal,
        ])
    }

    /// Request OS-level notification authorization. Returns `true` only if
    /// the user explicitly granted; `false` for both denials and any prior
    /// "denied" state (the system sheet does not re-prompt once a user has
    /// said no — they must enable from Settings).
    private func requestNotificationAuth() async -> Bool {
        let center = UNUserNotificationCenter.current()
        do {
            return try await center.requestAuthorization(options: [.alert, .badge, .sound])
        } catch {
            return false
        }
    }
}
