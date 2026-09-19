import SwiftUI

/// Terms, Privacy and Editorial Standards, reachable before anything is
/// bought: a compact underlined row that opens each document in a sheet.
/// Lives on the safety contract, the step where the nurse signs.
struct LegalLinksFooter: View {
    @State private var sheet: LegalSheet?

    var body: some View {
        HStack(spacing: NMSpace.xs) {
            link("Terms", opens: .terms)
            dot
            link("Privacy", opens: .privacy)
            dot
            link("Editorial Standards", opens: .editorial)
            Spacer()
        }
        .font(NMFont.bodySM)
        .sheet(item: $sheet) { kind in
            LegalSheetView(kind: kind)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }

    private var dot: some View {
        Text("·").foregroundStyle(NMColor.textTertiary)
    }

    private func link(_ label: String, opens kind: LegalSheet) -> some View {
        Button {
            Haptic.light()
            sheet = kind
        } label: {
            Text(label)
                .underline()
                .foregroundStyle(NMColor.textTertiary)
        }
        .buttonStyle(.plain)
    }
}

enum LegalSheet: String, Identifiable {
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

struct LegalSheetView: View {
    let kind: LegalSheet

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
