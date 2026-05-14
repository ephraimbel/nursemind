import SwiftUI

/// "Get started" surface — the final framing screen before personalization
/// kicks off. Anonymous Supabase auth has already happened invisibly at app
/// launch, so this screen is editorial framing + an obligatory pause to let
/// the user see Terms, Privacy, and Editorial Standards before continuing.
///
/// We deliberately don't surface a sign-in button here — Apple Sign In is
/// gated behind backend configuration that isn't live yet (see
/// `SignInWithAppleRow.isEnabled`). When the dashboard side is wired up, the
/// upgrade affordance lives on the Profile tab where it can act on the
/// already-authenticated anonymous user without re-routing onboarding.
struct AuthView: View {
    let onComplete: () -> Void

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
                button
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

    /// Smaller, modern hero. `displayLG` keeps visual weight on the benefit
    /// list and CTA below — the page is about confirming what they're about
    /// to use, not selling them on it (Welcome did that). Italic on the back
    /// half of the subtitle is the deliberate editorial accent per CLAUDE.md.
    private var hero: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            Text("You're set.")
                .font(NMFont.displayLG)
                .foregroundStyle(NMColor.textPrimary)
            (
                Text("A reference and study companion — ")
                + Text("ready when you are.").italic()
            )
            .font(NMFont.bodyLG)
            .foregroundStyle(NMColor.textSecondary)
            .lineSpacing(2)
            .fixedSize(horizontal: false, vertical: true)
        }
    }

    // MARK: - Benefits

    /// Three concrete value proofs presented as a hairline-divided list,
    /// filling the otherwise-empty middle of the screen. ✦ glyph (one of the
    /// two allowed glyphs per CLAUDE.md) acts as the bullet, tinted accent.
    /// Copy describes capabilities that don't require sign-in — every promise
    /// here works for an anonymous user on day one.
    private var benefits: some View {
        VStack(spacing: 0) {
            BenefitRow(
                title: "Cited at every claim",
                subtitle: "openFDA, Open RN, CDC, NIH — sourced and visible"
            )
            Hairline(color: NMColor.borderSubtle)
            BenefitRow(
                title: "AI co-pilot, scoped to your role",
                subtitle: "Grounded in our library, refuses without citations"
            )
            Hairline(color: NMColor.borderSubtle)
            BenefitRow(
                title: "Calculators for every unit",
                subtitle: "Drips, doses, scores, conversions — fast and offline"
            )
        }
    }

    // MARK: - Button

    /// Single full-width primary CTA. Matches the accent-green style used on
    /// Welcome and every other primary action in onboarding — one visual
    /// language across the whole flow.
    private var button: some View {
        PrimaryCTAButton(title: "Continue", action: onComplete)
    }

    // MARK: - Footer

    /// Compact legal footer at the bottom. Underlined, textTertiary, tiny.
    /// Each label is a real button that opens a sheet with the corresponding
    /// document — App Store review expects Terms + Privacy to be reachable
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

/// Single row in the AuthView value-prop list. ✦ glyph (allowed per
/// CLAUDE.md) tinted with the brand accent, body title, italic tertiary
/// subtitle. Vertical padding sized to give the three-row list real presence
/// in the middle of the screen without crowding the button below.
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
            • Your nursing role and unit (used to scope library and AI suggestions).
            • Your saved answers and pinned entries (synced to your anonymous account).
            • Your AI question text and answers (associated only with your anonymous account, never with patient identifiers).

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
