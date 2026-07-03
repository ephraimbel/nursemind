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

    public init() {}

    public var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    header

                    if supabase.isAnonymous && SignInWithAppleRow.isEnabled {
                        // Kept prominent (not buried in Account) — this is the
                        // primary save-your-data conversion prompt for anonymous
                        // users. Bracketed by hairlines so it reads as its own
                        // deliberate row between identity and subscription.
                        Hairline().padding(.top, NMSpace.xxl)
                        SignInWithAppleRow()
                        Hairline()
                    }

                    subscriptionCard
                        .padding(.top, NMSpace.xxl)

                    preferencesSection
                        .padding(.top, NMSpace.xxl)

                    resourcesSection
                        .padding(.top, NMSpace.xxl)

                    accountSection
                        .padding(.top, NMSpace.xxl)

                    versionFooter
                        .padding(.top, NMSpace.xxxl)
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

    // MARK: - Header (identity)

    /// Identity block: serif monogram avatar + name + role/unit line, then a
    /// full-width Edit profile affordance. The avatar anchors the page with a
    /// premium personal mark; appearance moved out of the header into a proper
    /// labeled control in Preferences (below), so the header stays purely about
    /// who the user is.
    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.base) {
            EyebrowLabel("YOUR PROFILE")
            HStack(alignment: .center, spacing: NMSpace.base) {
                MonogramAvatar(initials: monogramInitials)
                VStack(alignment: .leading, spacing: 3) {
                    Text(prefs.displayName.isEmpty ? "Set your name" : prefs.displayName)
                        .displayLG()
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    Text(profileSubtitle)
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                }
            }
            .padding(.top, NMSpace.xs)
            // Full-width, content-shaped hit target. The glyph-only version
            // (text + arrow, no contentShape) left most of the row as a dead
            // zone, so a tap that landed a few points off registered as
            // nothing (App Review, Guideline 2.1, iPad, 2026-06-26). Keeping
            // the whole row tappable matches the ProfileLinkRow behavior below.
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

    /// Up to two initials from the display name; empty when unset so the avatar
    /// falls back to a neutral glyph.
    private var monogramInitials: String {
        let name = prefs.displayName.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !name.isEmpty else { return "" }
        let letters = name.split(separator: " ").prefix(2).compactMap { $0.first }
        return String(letters).uppercased()
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

    // MARK: - Preferences

    private var preferencesSection: some View {
        ProfileSection("PREFERENCES") {
            ProfileLinkRow(
                label: "Notifications",
                value: prefs.notificationsEnabled ? "On" : "Off",
                destination: .notifications
            )
            Hairline(color: NMColor.borderSubtle)
            AppearanceRow(selection: appearanceBinding)
        }
    }

    private var appearanceBinding: Binding<AppearanceTheme> {
        Binding(
            get: { prefs.preferredAppearance },
            set: { prefs.preferredAppearance = $0 }
        )
    }

    // MARK: - Resources

    private var resourcesSection: some View {
        ProfileSection("RESOURCES") {
            ProfileLinkRow(label: "Editorial standards", value: nil, destination: .editorialStandards)
            Hairline(color: NMColor.borderSubtle)
            ProfileLinkRow(label: "About", value: nil, destination: .about)
            Hairline(color: NMColor.borderSubtle)
            ProfileLinkRow(label: "Terms of Use", value: nil, destination: .termsOfUse)
            Hairline(color: NMColor.borderSubtle)
            ProfileLinkRow(label: "Privacy Policy", value: nil, destination: .privacyPolicy)
        }
    }

    // MARK: - Account (delete)

    /// Apple Guideline 5.1.1(v) requires an in-app account-deletion path.
    /// Two-step confirmation: a labeled button opens an alert with explicit
    /// "this can't be undone" language and a destructive-styled Delete action.
    /// Cleared local + server state returns the user to onboarding.
    private var accountSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("ACCOUNT", sparkle: false)
            Text("Delete your account and all data — your profile, saved answers, conversation history, and subscription record. This can't be undone.")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
                .lineSpacing(3)
            Button(role: .destructive) {
                showDeleteConfirm = true
            } label: {
                HStack(spacing: NMSpace.sm) {
                    if isDeletingAccount {
                        ProgressView()
                            .controlSize(.small)
                    } else {
                        Image(systemName: "trash")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(NMColor.alertHigh)
                    }
                    Text(isDeletingAccount ? "Deleting…" : "Delete account")
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
                // which flips hasCompletedOnboarding → false. RootView observes
                // this and swaps back to OnboardingFlow automatically.
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

// MARK: - Monogram avatar

/// Serif initials in a hairline-bordered circle — a calm, personal identity
/// mark. No photo upload (no PHI surface, no storage cost); the monogram is
/// the premium-but-safe stand-in. Falls back to a neutral person glyph before
/// the user sets a name.
private struct MonogramAvatar: View {
    let initials: String

    var body: some View {
        ZStack {
            Circle().fill(NMColor.bgElevated)
            Circle().strokeBorder(NMColor.border, lineWidth: 1)
            if initials.isEmpty {
                Image(systemName: "person.fill")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            } else {
                Text(initials)
                    .font(NMFont.displayMD)
                    .foregroundStyle(NMColor.textPrimary)
            }
        }
        .frame(width: 54, height: 54)
        .accessibilityHidden(true)
    }
}

// MARK: - Section container

/// Labeled group of hairline-separated rows. Sections are separated from each
/// other by whitespace + their eyebrow header rather than cards — structure
/// without chrome, matching the Library's BROWSE grammar.
private struct ProfileSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    init(_ title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel(title, sparkle: false)
            VStack(spacing: 0) { content }
        }
    }
}

// MARK: - Appearance control

/// Inline row: "Appearance" label + a three-way System / Light / Dark segmented
/// control. Replaces the old hidden header moon toggle — appearance now lives
/// where users expect a setting, and exposes the System option the toggle
/// couldn't. Icon segments keep it compact; the selected pill slides on accent.
private struct AppearanceRow: View {
    @Binding var selection: AppearanceTheme

    var body: some View {
        HStack {
            Text("Appearance")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
            Spacer()
            AppearanceSegmentedControl(selection: $selection)
        }
        .padding(.vertical, NMSpace.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}

private struct AppearanceSegmentedControl: View {
    @Binding var selection: AppearanceTheme
    @Namespace private var pill

    var body: some View {
        HStack(spacing: 2) {
            ForEach(AppearanceTheme.allCases, id: \.self) { theme in
                segment(theme)
            }
        }
        .padding(3)
        .background(Capsule().fill(NMColor.bgSecondary))
    }

    private func segment(_ theme: AppearanceTheme) -> some View {
        let selected = selection == theme
        return Button {
            guard !selected else { return }
            Haptic.selection()
            withAnimation(.snappy(duration: 0.25)) { selection = theme }
        } label: {
            Image(systemName: icon(theme))
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(selected ? NMColor.onAccent : NMColor.textTertiary)
                .frame(width: 42, height: 28)
                .background {
                    if selected {
                        Capsule()
                            .fill(NMColor.accent)
                            .matchedGeometryEffect(id: "appearancePill", in: pill)
                    }
                }
                .contentShape(Capsule())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(theme.displayName)
        .accessibilityAddTraits(selected ? [.isSelected] : [])
    }

    private func icon(_ theme: AppearanceTheme) -> String {
        switch theme {
        case .system: return "circle.lefthalf.filled"
        case .light:  return "sun.max"
        case .dark:   return "moon"
        }
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
