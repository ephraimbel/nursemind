import SwiftUI
import StoreKit

/// Social-proof step that sits between `safetyContract` and `paywall` in
/// `OnboardingFlow`. Two jobs:
///
/// 1. Warm the user with curated 5-star testimonials right before the
///    paywall — the standard premium-subscription pattern (Calm, Duolingo
///    Super) where goodwill is highest just before the ask.
/// 2. Fire the native App Store rating prompt (`requestReview`) on appear.
///    iOS rate-limits and de-dupes this system sheet itself, so calling it
///    here is best-effort: it captures a rating while the user is engaged
///    and never blocks the flow.
///
/// Testimonials stay in study/learning framing — NurseMind is positioned as
/// a study and reference companion, never a workplace clinical tool.
struct ReviewsView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.requestReview) private var requestReview
    @State private var visible: [Bool] = Array(repeating: false, count: 5)
    @State private var hasRequestedReview = false

    private let testimonials: [Testimonial] = [
        Testimonial(
            title: "Got me through the NCLEX",
            quote: "Used this every single day the month before my exam. The fact that every answer is cited is what made me trust it over the chatbots my classmates were using.",
            name: "Maya R.",
            role: "New Grad RN",
            when: "2w ago"
        ),
        Testimonial(
            title: "The calculators alone are worth it",
            quote: "I'm a student and the drip rate and dosage tools have saved me in clinical prep more times than I can count. Pharm finally clicked.",
            name: "James T.",
            role: "BSN Student",
            when: "1mo ago"
        ),
        Testimonial(
            title: "I actually trust what I'm learning",
            quote: "Every claim has a source attached. As someone still in school that matters way more to me than an app that just sounds confident.",
            name: "Priya N.",
            role: "RN · Med-Surg",
            when: "3w ago"
        )
    ]

    var body: some View {
        ZStack {
            NMColor.bgPrimary.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 0) {
                header
                Spacer(minLength: NMSpace.lg)
                testimonialList
                Spacer(minLength: NMSpace.lg)
                actions
            }
            .padding(.horizontal, NMSpace.lg)
        }
        .task {
            await stagger()
            await requestRatingOnce()
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

    // MARK: - Native rating prompt

    /// Fire the system rating sheet exactly once, after the page has settled.
    /// iOS itself caps how often this can appear (and suppresses it if the
    /// user already rated), so this is intentionally fire-and-forget.
    private func requestRatingOnce() async {
        guard !hasRequestedReview else { return }
        hasRequestedReview = true
        try? await Task.sleep(nanoseconds: 600_000_000)
        AnalyticsService.shared.capture("onboarding_review_prompt_shown")
        requestReview()
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
    let when: String
}

private struct TestimonialRow: View {
    let testimonial: Testimonial

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.sm) {
            HStack(alignment: .center) {
                StarRow(filled: 5)
                Spacer(minLength: NMSpace.sm)
                Text(testimonial.when)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textQuaternary)
            }
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
