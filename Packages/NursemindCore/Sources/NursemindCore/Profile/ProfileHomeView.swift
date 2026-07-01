import SwiftUI

public enum ProfileDestination: Hashable {
    case editProfile
    case notifications
    case manageSubscription
    case editorialStandards
    case about
    case termsOfUse
    case privacyPolicy
}

public struct ProfileHomeView: View {
    @State private var path = NavigationPath()
    @State private var prefs = UserPreferences.shared
    @State private var supabase = SupabaseService.shared
    @State private var showDeleteConfirm: Bool = false
    @State private var isDeletingAccount: Bool = false
    @State private var deletionErrorMessage: String?
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) private var systemColorScheme

    public init() {}

    private var isDarkMode: Bool {
        switch prefs.preferredAppearance {
        case .light:  return false
        case .dark:   return true
        case .system: return systemColorScheme == .dark
        }
    }

    public var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    header
                        .padding(.bottom, NMSpace.xxxl)

                    Hairline()
                        .padding(.bottom, NMSpace.xxxl)

                    // Gated until the Supabase dashboard's Apple provider is
                    // configured (Auth → Providers → Apple). With the provider
                    // off, `linkIdentityWithIdToken` fails after the user has
                    // already authenticated through Apple's native sheet — a
                    // Guideline 2.1 review risk. Flip `SignInWithAppleRow.isEnabled`
                    // to true once the dashboard side is wired.
                    if supabase.isAnonymous && SignInWithAppleRow.isEnabled {
                        SignInWithAppleRow()
                            .padding(.bottom, NMSpace.xxxl)
                        Hairline()
                            .padding(.bottom, NMSpace.xxxl)
                    }

                    subscriptionCard
                        .padding(.bottom, NMSpace.xxxl)

                    Hairline()
                        .padding(.bottom, NMSpace.xxxl)

                    settingsList

                    Hairline()
                        .padding(.vertical, NMSpace.xxxl)

                    deleteAccountSection

                    Spacer(minLength: NMSpace.xxxl)

                    versionFooter
                }
                .padding(.horizontal, NMSpace.lg)
                .padding(.top, NMSpace.sm)
                .padding(.bottom, NMSpace.huge)
                .frame(maxWidth: 460)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .background(GrainBackground())
            .navigationDestination(for: ProfileDestination.self) { dest in
                switch dest {
                case .editProfile:        EditProfileView()
                case .notifications:      NotificationsSettingsView()
                case .manageSubscription: ManageSubscriptionView()
                case .editorialStandards: EditorialStandardsView()
                case .about:              AboutView()
                case .termsOfUse:         LegalDocumentView(.termsOfUse)
                case .privacyPolicy:      LegalDocumentView(.privacyPolicy)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // MARK: - Appearance toggle

    /// Inline sun/moon switch, top-right of the header row (no nav-bar toolbar,
    /// so the Profile header stays aligned with Feed and Library). Shows the icon
    /// for the mode you'd switch *to*: a sun while dark, a moon while light.
    private var appearanceToggle: some View {
        Button {
            Haptic.selection()
            withAnimation(.snappy(duration: 0.25)) {
                prefs.preferredAppearance = isDarkMode ? .light : .dark
            }
        } label: {
            Image(systemName: isDarkMode ? "sun.max" : "moon")
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(NMColor.textPrimary)
                .contentTransition(.symbolEffect(.replace))
        }
        .accessibilityLabel(isDarkMode ? "Switch to light mode" : "Switch to dark mode")
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(alignment: .center) {
                EyebrowLabel("YOUR PROFILE")
                Spacer()
                appearanceToggle
            }
            Text(prefs.displayName.isEmpty ? "Set your name" : prefs.displayName)
                .displayXL()
                .lineLimit(2)
                .minimumScaleFactor(0.7)
            Text(profileSubtitle)
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            // Full-width, content-shaped hit target. The glyph-only version
            // (text + arrow, no contentShape) left most of the row as a dead
            // zone, so a tap that landed a few points off registered as
            // nothing — which is exactly how App Review saw it ("tapped Edit
            // profile, unresponsive" on iPad, Guideline 2.1, 2026-06-26). The
            // settings rows below never had this problem because they use
            // ProfileLinkRow, which is full-width and content-shaped; this
            // matches that behavior.
            NavigationLink(value: ProfileDestination.editProfile) {
                HStack(spacing: NMSpace.xs) {
                    Text("Edit profile")
                        .font(NMFont.title)
                        .foregroundStyle(NMColor.accent)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(NMColor.accent)
                    Spacer(minLength: 0)
                }
                .padding(.top, NMSpace.sm)
                .padding(.vertical, NMSpace.xs)
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
    }

    private var profileSubtitle: String {
        var parts: [String] = [prefs.role.displayName, prefs.unit.displayName]
        if prefs.unit == .icu, let sub = prefs.icuSubspecialty {
            parts.append(sub.shortLabel)
        }
        if let yrs = prefs.yearsOfExperience, yrs > 0 {
            parts.append("\(yrs) yr\(yrs == 1 ? "" : "s")")
        }
        return parts.joined(separator: " · ")
    }

    // MARK: - Subscription card

    private var subscriptionCard: some View {
        NavigationLink(value: ProfileDestination.manageSubscription) {
            SubscriptionCard(tier: prefs.subscriptionTier)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Settings

    private var settingsList: some View {
        VStack(spacing: 0) {
            ProfileLinkRow(
                label: "Notifications",
                value: prefs.notificationsEnabled ? "On" : "Off",
                destination: .notifications
            )
            Hairline(color: NMColor.borderSubtle)
            ProfileLinkRow(
                label: "Editorial standards",
                value: nil,
                destination: .editorialStandards
            )
            Hairline(color: NMColor.borderSubtle)
            ProfileLinkRow(
                label: "Terms of Use",
                value: nil,
                destination: .termsOfUse
            )
            Hairline(color: NMColor.borderSubtle)
            ProfileLinkRow(
                label: "Privacy Policy",
                value: nil,
                destination: .privacyPolicy
            )
            Hairline(color: NMColor.borderSubtle)
            ProfileLinkRow(
                label: "About",
                value: nil,
                destination: .about
            )
        }
    }

    // MARK: - Delete account

    /// Destructive section at the bottom of Profile. Apple Guideline
    /// 5.1.1(v) requires an in-app account-deletion path. Two-step
    /// confirmation: a labeled button opens an alert with explicit "this
    /// can't be undone" language and a destructive-styled Delete action.
    /// Cleared local + server state returns the user to onboarding.
    private var deleteAccountSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            EyebrowLabel("ACCOUNT", sparkle: false)
            Text("Delete your account and all data — your profile, saved answers, conversation history, and subscription record. This can't be undone.")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
                .lineSpacing(3)
                .padding(.bottom, NMSpace.sm)
            Button(role: .destructive) {
                showDeleteConfirm = true
            } label: {
                HStack {
                    if isDeletingAccount {
                        ProgressView()
                            .controlSize(.small)
                            .padding(.trailing, NMSpace.xs)
                    }
                    Text(isDeletingAccount ? "Deleting…" : "Delete Account")
                        .font(NMFont.bodyLG.weight(.medium))
                        .foregroundStyle(NMColor.alertHigh)
                    Spacer()
                }
                .padding(.vertical, NMSpace.base)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .disabled(isDeletingAccount)
        }
        .alert("Delete Account?", isPresented: $showDeleteConfirm) {
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive) { performDeletion() }
        } message: {
            Text("This permanently deletes your NurseMind account, including your profile, saved answers, conversation history, and subscription record. The app will return to onboarding. This action can't be undone.")
        }
        .alert("Deletion failed", isPresented: deletionErrorBinding) {
            Button("OK", role: .cancel) { deletionErrorMessage = nil }
        } message: {
            Text(deletionErrorMessage ?? "")
        }
    }

    private var deletionErrorBinding: Binding<Bool> {
        Binding(
            get: { deletionErrorMessage != nil },
            set: { if !$0 { deletionErrorMessage = nil } }
        )
    }

    private func performDeletion() {
        guard !isDeletingAccount else { return }
        isDeletingAccount = true
        Task {
            do {
                let container = modelContext.container
                try await AccountDeletionService.shared.deleteAccount(modelContainer: container)
                // Success: prefs.safetyContractAgreedAt was cleared by wipe(),
                // which flips hasCompletedOnboarding → false. RootView
                // observes this and swaps back to OnboardingFlow
                // automatically — no manual navigation needed.
                isDeletingAccount = false
            } catch {
                isDeletingAccount = false
                deletionErrorMessage = error.localizedDescription
            }
        }
    }

    // MARK: - Footer

    private var versionFooter: some View {
        HStack(spacing: 6) {
            Text("NurseMind")
                .font(NMFont.bodySM)
                .italic()
                .foregroundStyle(NMColor.textTertiary)
            Text(appVersionString)
                .font(NMFont.monoSM)
                .foregroundStyle(NMColor.textTertiary)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top, NMSpace.xl)
    }

    private var appVersionString: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
        return "\(version) (\(build))"
    }
}

// MARK: - Subscription card

private struct SubscriptionCard: View {
    let tier: SubscriptionTier

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(alignment: .firstTextBaseline) {
                Text("NurseMind ")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                +
                Text(tier.isPro ? tier.displayName : "Free")
                    .font(NMFont.displayMD)
                    .foregroundStyle(NMColor.textPrimary)
                Spacer()
            }
            Text(tier.isPro
                 ? "50 Ask questions a day, offline mode, no reference limits, priority new content."
                 : "Upgrade for 50 Ask questions a day, offline mode, and unlimited daily reference access.")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(3)
            HStack(spacing: NMSpace.xs) {
                Text(tier.isPro ? "Manage subscription" : "Upgrade to Pro")
                    .font(NMFont.title)
                    .foregroundStyle(NMColor.accent)
                Image(systemName: "arrow.right")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(NMColor.accent)
            }
        }
        .padding(NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(NMColor.bgElevated)
                .shadow(color: glowColor, radius: isUpgrade ? 22 : 0, x: 0, y: isUpgrade ? 8 : 0)
                .shadow(color: glowColor.opacity(0.6), radius: isUpgrade ? 7 : 0, x: 0, y: isUpgrade ? 2 : 0)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(borderStyle, lineWidth: isUpgrade ? 1.5 : 1)
        )
    }

    private var isUpgrade: Bool { !tier.isPro }

    /// Soft forest-green halo behind the upgrade card; none for the Pro state.
    private var glowColor: Color {
        isUpgrade ? NMColor.accent.opacity(0.45) : .clear
    }

    /// Glowing green gradient border for upgrade; a calm hairline once subscribed.
    private var borderStyle: AnyShapeStyle {
        guard isUpgrade else { return AnyShapeStyle(NMColor.borderSubtle) }
        return AnyShapeStyle(
            LinearGradient(
                colors: [
                    NMColor.accentHover,
                    NMColor.accent,
                    NMColor.accent.opacity(0.5),
                    NMColor.accentHover,
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}

// MARK: - Row component

private struct ProfileLinkRow: View {
    let label: String
    let value: String?
    let destination: ProfileDestination

    var body: some View {
        NavigationLink(value: destination) {
            HStack {
                Text(label)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                Spacer()
                if let value {
                    Text(value)
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textTertiary)
                }
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
                    .padding(.leading, NMSpace.sm)
            }
            .padding(.vertical, NMSpace.lg)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}
