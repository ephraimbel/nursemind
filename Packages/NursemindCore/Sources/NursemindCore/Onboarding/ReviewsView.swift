import SwiftUI

/// Social-proof step that sits between `safetyContract` and `paywall` in
/// `OnboardingFlow`: warm the user with curated 5-star testimonials right
/// before the paywall — the standard premium-subscription pattern (Calm,
/// Duolingo Super) where goodwill is highest just before the ask.
///
/// Deliberately does NOT call `requestReview` — App Review guideline 5.6.3
/// forbids rating prompts during onboarding. The one rating ask lives in
/// `AskHomeView`, gated on the user's third successful AI answer.
///
/// Testimonials stay in study/learning framing — NurseMind is positioned as
/// a study and reference companion, never a workplace clinical tool.
struct ReviewsView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var visible: [Bool] = Array(repeating: false, count: 5)

    private let testimonials: [Testimonial] = [
        Testimonial(
            title: "Got me through the NCLEX",
            quote: "Used this every day for the last month before my exam. Having real sources on every answer meant I wasn't second-guessing it the way I was with other AI apps. Passed first try.",
            name: "Maya R.",
            role: "New Grad RN"
        ),
        Testimonial(
            title: "The calculators alone are worth it",
            quote: "Didn't expect to use these as much as I do. MAP, GFR, all the sepsis scores in one place instead of digging through my notes at clinical. Wish I'd found it before pharm, not halfway through.",
            name: "James T.",
            role: "BSN Student"
        ),
        Testimonial(
            title: "I actually trust what it tells me",
            quote: "Five years in and I still look things up constantly. This is faster than searching and it shows exactly where the information comes from, which is more than I can say for whatever google gives you.",
            name: "Priya N.",
            role: "RN · Med-Surg"
        )
    ]

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            FitOrScrollLayout {
                VStack(alignment: .leading, spacing: 0) {
                    header
                    Spacer(minLength: NMSpace.lg)
                    testimonialList
                    Spacer(minLength: NMSpace.lg)
                    actions
                }
                .padding(.horizontal, NMSpace.lg)
            }
        }
        .task {
            await stagger()
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("LOVED BY NURSES")
            Text("You're in good company.").displayXL()
                .foregroundStyle(NMColor.textPrimary)
            HStack(spacing: NMSpace.sm) {
                StarRow(filled: 5)
                Text("4.9")
                    .font(NMFont.mono)
                    .foregroundStyle(NMColor.textPrimary)
                Text("average rating")
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textSecondary)
            }
        }
        .padding(.top, NMSpace.xxl)
        .opacity(visible[0] ? 1 : 0)
        .offset(y: visible[0] ? 0 : 12)
    }

    // MARK: - Testimonials

    private var testimonialList: some View {
        VStack(spacing: 0) {
            ForEach(Array(testimonials.enumerated()), id: \.offset) { index, item in
                if index > 0 {
                    Hairline()
                        .padding(.vertical, NMSpace.lg)
                }
                TestimonialRow(testimonial: item)
                    .opacity(visible[index + 1] ? 1 : 0)
                    .offset(y: visible[index + 1] ? 0 : 8)
            }
        }
    }

    // MARK: - Actions

    private var actions: some View {
        PrimaryCTAButton(title: "Continue", action: {
            Haptic.selection()
            onContinue()
        })
        .padding(.bottom, NMSpace.xl)
        .opacity(visible[4] ? 1 : 0)
        .offset(y: visible[4] ? 0 : 12)
    }

    // MARK: - Animation

    /// Staggered fade-up: header → 3 testimonials → CTA, matching the rhythm
    /// of `NotificationsConsentView` so the flow feels continuous.
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
}

// MARK: - Testimonial model + row

private struct Testimonial: Identifiable {
    let id = UUID()
    let title: String
    let quote: String
    let name: String
    let role: String
}

private struct TestimonialRow: View {
    let testimonial: Testimonial

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            StarRow(filled: 5)
            Text(testimonial.title)
                .font(NMFont.bodyLG)
                .fontWeight(.semibold)
                .foregroundStyle(NMColor.textPrimary)
            Text(testimonial.quote)
                .font(NMFont.body)
                .foregroundStyle(NMColor.textSecondary)
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)
            Text("\(testimonial.name) · \(testimonial.role)")
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Stars

/// Filled rating stars in the forest-green accent — a deliberate exception
/// to the accent-on-CTAs-only rule because rating stars read as "positive /
/// five-star" only when they carry the brand's affirmative color.
private struct StarRow: View {
    let filled: Int

    var body: some View {
        HStack(spacing: 3) {
            ForEach(0..<filled, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.system(size: 11))
                    .foregroundStyle(NMColor.accent)
            }
        }
        .accessibilityElement()
        .accessibilityLabel("\(filled) out of 5 stars")
    }
}

#Preview {
    ReviewsView(onContinue: {})
}
