import SwiftUI
import AuthenticationServices

/// Modern mobile sign-up screen. Logo at top, brief title + subtitle,
/// prominent full-width auth buttons (Apple, Continue without). Tiny
/// terms/privacy footer at the very bottom.
///
/// Apple Sign-In failures (cancel, network, identity conflict) surface
/// inline so the user knows why nothing happened — they aren't silently
/// progressed to the next step. "Continue without an account" stays as
/// a deliberate guest path for users who don't want to sync.
struct AuthView: View {
    let onComplete: () -> Void

    @State private var errorMessage: String?
    @State private var legalSheet: LegalSheet?

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                Spacer().frame(height: NMSpace.xxxl)
                logo
                Spacer().frame(height: NMSpace.xxl)
                hero
                Spacer().frame(height: NMSpace.xxl)
                benefits
                Spacer(minLength: NMSpace.xl)
                buttons
                Spacer().frame(height: NMSpace.xl)
                footer
            }
            .padding(.horizontal, NMSpace.lg)
        }
        .sheet(item: $legalSheet) { sheet in
            LegalSheetView(kind: sheet)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Logo

    private var logo: some View {
        NursemindLogo(size: 48)
    }

    // MARK: - Hero

    /// Smaller, modern hero. `displayMD` instead of `displayXL` shifts
    /// visual weight onto the buttons below — the page is about action,
    /// not editorial framing. Italic on the back half of the subtitle is
    /// the deliberate editorial accent (per CLAUDE.md: "italic is
    /// deliberate") and pulls the eye to the value prop.
    private var hero: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            Text("Sign in")
                .font(NMFont.displayLG)
                .foregroundStyle(NMColor.textPrimary)
            (
                Text("Library, saved answers, and Pro — ")
                + Text("across every signed-in device.").italic()
            )
            .font(NMFont.bodyLG)
            .foregroundStyle(NMColor.textSecondary)
            .lineSpacing(2)
            .fixedSize(horizontal: false, vertical: true)
        }
    }

    // MARK: - Benefits

    /// Three concrete proof points presented as a hairline-divided list,
    /// filling the otherwise-empty middle of the screen. ✦ glyph (one of
    /// two allowed glyphs per CLAUDE.md) acts as the bullet, tinted with
    /// the accent color. Title in body weight, italic subtitle in tertiary.
    private var benefits: some View {
        VStack(spacing: 0) {
            BenefitRow(
                title: "Library and bookmarks",
                subtitle: "Pinned entries, recents, and your specialty"
            )
            Hairline(color: NMColor.borderSubtle)
            BenefitRow(
                title: "AI conversation history",
                subtitle: "Saved answers and your daily quota"
            )
            Hairline(color: NMColor.borderSubtle)
            BenefitRow(
                title: "Subscription portability",
                subtitle: "Pro follows your account, not your device"
            )
        }
    }

    // MARK: - Buttons

    private var buttons: some View {
        VStack(spacing: NMSpace.md) {
            SignInWithAppleButton(
                .continue,
                onRequest: { request in
                    request.requestedScopes = [.fullName, .email]
                },
                onCompletion: handleAppleCompletion
            )
            .signInWithAppleButtonStyle(.black)
            .frame(height: 56)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            if let errorMessage {
                Text(errorMessage)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.alertHigh)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 2)
                    .transition(.opacity)
            }

            Button {
                Haptic.light()
                onComplete()
            } label: {
                Text("Continue as guest")
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textTertiary)
                    .padding(.vertical, NMSpace.sm)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(PressableButtonStyle())
        }
    }

    /// Apple Sign-In callback. Success → clear any prior error, fire
    /// success haptic, advance. Failure → surface the system error inline
    /// (or a friendly mapping for `.canceled`) and stay on screen so the
    /// user can retry or fall back to guest entry.
    private func handleAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success:
            withAnimation(.easeOut(duration: 0.18)) { errorMessage = nil }
            Haptic.success()
            onComplete()
        case .failure(let err):
            let asError = err as? ASAuthorizationError
            // User-cancel is the expected non-completion path on the Apple
            // sheet — we silently clear without an error message because
            // the user just hit "Cancel" deliberately.
            if asError?.code == .canceled {
                withAnimation(.easeOut(duration: 0.18)) { errorMessage = nil }
                return
            }
            withAnimation(.easeOut(duration: 0.18)) {
                errorMessage = friendly(asError, fallback: err)
            }
        }
    }

    private func friendly(_ asError: ASAuthorizationError?, fallback: Error) -> String {
        guard let code = asError?.code else { return fallback.localizedDescription }
        switch code {
        case .invalidResponse, .failed:
            return "Sign-in didn't complete. Please try again."
        case .notHandled:
            return "Sign-in couldn't be completed on this device. Try again later."
        case .notInteractive:
            return "Sign-in needs an interactive session. Try again."
        case .unknown:
            return "Something went wrong with Apple sign-in. Try again."
        default:
            return fallback.localizedDescription
        }
    }

    // MARK: - Footer

    /// Compact legal footer at the bottom. Underlined, textTertiary, tiny.
    /// Each label is a real button that opens a sheet with the corresponding
    /// document — App Store review requires Terms + Privacy to be reachable
    /// before purchase, and Editorial Standards is our content-credibility
    /// disclosure (CLAUDE.md).
    private var footer: some View {
        HStack(spacing: NMSpace.xs) {
            footerLink("Terms",     opens: .terms)
            Text("·").foregroundStyle(NMColor.textTertiary)
            footerLink("Privacy",   opens: .privacy)
            Text("·").foregroundStyle(NMColor.textTertiary)
            footerLink("Editorial Standards", opens: .editorial)
            Spacer()
        }
        .font(NMFont.bodySM)
        .padding(.bottom, NMSpace.lg)
    }

    private func footerLink(_ label: String, opens sheet: LegalSheet) -> some View {
        Button {
            Haptic.light()
            legalSheet = sheet
        } label: {
            Text(label)
                .underline()
                .foregroundStyle(NMColor.textTertiary)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Benefit row

/// Single row in the AuthView "What you get when you sign in" list. ✦ glyph
/// (allowed per CLAUDE.md) tinted with the brand accent, body title, italic
/// tertiary subtitle. Vertical padding sized to give the three-row list real
/// presence in the middle of the screen without crowding the buttons below.
private struct BenefitRow: View {
    let title: String
    let subtitle: String

    var body: some View {
        HStack(alignment: .top, spacing: NMSpace.base) {
            Text("✦")
                .font(NMFont.body)
                .foregroundStyle(NMColor.accent)
                .padding(.top, 3)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textPrimary)
                Text(subtitle)
                    .font(NMFont.bodySM)
                    .italic()
                    .foregroundStyle(NMColor.textTertiary)
                    .lineSpacing(1)
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, NMSpace.md)
    }
}

// MARK: - Legal sheet

private enum LegalSheet: String, Identifiable {
    case terms
    case privacy
    case editorial

    var id: String { rawValue }

    var title: String {
        switch self {
        case .terms:     return "Terms of Service"
        case .privacy:   return "Privacy Policy"
        case .editorial: return "Editorial Standards"
        }
    }

    var body: String {
        switch self {
        case .terms:
            return """
            NurseMind is a clinical reference application for licensed and student nurses in the United States.

            By using NurseMind, you agree:

            • NurseMind is a curated, cited reference. It is not a substitute for clinical judgment, supervision, or your facility's protocols.
            • NurseMind does not diagnose, prescribe, or direct patient-specific treatment. Every clinical decision remains yours and your team's.
            • You will not enter Protected Health Information (PHI) into NurseMind. The AI co-pilot is architecturally prevented from accepting PHI.
            • Subscriptions auto-renew unless cancelled at least 24 hours before the end of the current period. Manage in iOS Settings → Apple ID → Subscriptions.

            Full terms at nursemind.app/terms.
            """
        case .privacy:
            return """
            NurseMind is built so that handling Protected Health Information is structurally impossible — there is no patient field, no chart upload, and the AI is scoped to refuse PHI.

            What we collect:
            • Your email and display name (only if you sign in with Apple).
            • Your nursing unit + specialty preference (used to scope library and AI suggestions).
            • Your saved answers and pinned entries (synced to your account if signed in).
            • Your AI question text and answers (associated only with your account, never with patient identifiers).

            What we don't collect:
            • Patient names, MRNs, dates of birth, room numbers, or any other PHI.
            • Your location, contacts, or photo library.
            • Any analytics that includes the body of your AI questions.

            Data is stored in Supabase (US region). Subscription identity is managed by RevenueCat. Full policy at nursemind.app/privacy.
            """
        case .editorial:
            return """
            Every clinical claim in NurseMind is sourced and cited.

            Foundation tier (commercial-use OK with attribution):
            • openFDA Drug Label
            • DailyMed
            • RxNorm
            • Open RN textbooks
            • OpenStax Nursing
            • VA PBM
            • CDC, NIH treatment guidelines
            • PubMed Open-Access (CC BY / CC0)

            What's deliberately NOT used:
            • StatPearls (NC-ND license)
            • Davis's, Mosby's, Lexicomp, UpToDate, Nursing Central
            • ATI, Saunders, Lippincott, Kaplan, UWorld
            • NCLEX item banks

            All entries pass a tiered review process: Tier A (paid RN review pre-publication for high-risk content), Tier B (10% sampled), Tier C (in-app reporting loop). The AI is grounded in this same library — every answer is fact-checked against cited sources, and responses making numerical claims without citations are rejected and regenerated.

            Read the full sourcing playbook at nursemind.app/editorial-standards.
            """
        }
    }
}

private struct LegalSheetView: View {
    let kind: LegalSheet
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: NMSpace.lg) {
                    Text(kind.title)
                        .font(NMFont.displayLG)
                        .foregroundStyle(NMColor.textPrimary)
                        .padding(.top, NMSpace.xl)
                    Text(kind.body)
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.horizontal, NMSpace.lg)
                .padding(.bottom, NMSpace.huge)
            }
        }
    }
}

#Preview {
    AuthView(onComplete: {})
}
