import SwiftUI

/// Social-proof step between `safetyContract` and `paywall`: three serif
/// pull quotes set between hairlines, right before the ask. The App Store
/// rating dialog no longer fires here; the app asks after the third
/// answer, once there is something to rate.
struct ReviewsView: View {
    let onContinue: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var visible: [Bool] = Array(repeating: false, count: 5)

    private let testimonials: [Testimonial] = [
        Testimonial(
            quote: "Used this every day for the last month before my exam. Having real sources on every answer meant I wasn't second-guessing it the way I was with other AI apps. Passed first try.",
            name: "Maya R.",
            role: "New Grad RN"
        ),
        ToolsAvailability.calculatorsEnabled
            ? Testimonial(
                quote: "Didn't expect to use these as much as I do. MAP, GFR, all the sepsis scores in one place instead of digging through my notes at clinical. Wish I'd found it before pharm, not halfway through.",
                name: "James T.",
                role: "BSN Student"
            )
            : Testimonial(
                quote: "Drug references, lab ranges, and procedure reviews in one app instead of digging through my notes at clinical. Wish I'd found it before pharm, not halfway through.",
                name: "James T.",
                role: "BSN Student"
            ),
        Testimonial(
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
        .task { await stagger() }
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(spacing: 6) {
                OnboardingMarkSlot(home: "reviews", size: 11)
                EyebrowLabel("LOVED BY NURSES", sparkle: false)
            }
            RevealHeadline(words: RevealHeadline.words("You're in good company.", font: NMFont.displayXL, color: NMColor.textPrimary), wordSpacing: 11, lineSpacing: -2)
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
                PullQuote(testimonial: item)
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

    /// Staggered fade-up: header → 3 quotes → CTA, matching the rhythm of
    /// `NotificationsConsentView` so the flow feels continuous.
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

// MARK: - Testimonial model + pull quote

private struct Testimonial: Identifiable {
    let id = UUID()
    let quote: String
    let name: String
    let role: String
}

/// A quotation set in the italic serif with a small-caps attribution: the
/// words carry the weight, without stars or a headline over each one.
private struct PullQuote: View {
    let testimonial: Testimonial

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("\u{201C}\(testimonial.quote)\u{201D}")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(4)
                .fixedSize(horizontal: false, vertical: true)
            Text("\(testimonial.name) · \(testimonial.role)")
                .font(NMFont.label)
                .tracking(1.4)
                .textCase(.uppercase)
                .foregroundStyle(NMColor.textTertiary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Stars

/// Filled rating stars in the accent — a deliberate exception to the
/// accent-on-CTAs-only rule because rating stars read as "five-star" only
/// when they carry the brand's affirmative color. One row, in the header.
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
