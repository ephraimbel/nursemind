import SwiftUI

/// Makes a fixed full-height layout fill the screen when there's room and
/// scroll when there isn't.
///
/// Our onboarding pages and the paywall are built as `VStack(header → Spacer
/// → content → Spacer → CTA)` columns sized to the screen. That's correct on
/// a tall iPhone, but on a short logical canvas — an iPhone-only app running
/// in iPad compatibility mode, the software keyboard raised, or large Dynamic
/// Type — the column overflows and silently clips its top text and bottom
/// button. (Apple review, Guideline 4, 2026-06-26: onboarding headers + the
/// Continue button, and the paywall's Restore / Terms / Privacy, were not
/// visible on iPad Air.)
///
/// Wrapping the column here keeps the original Spacer-distributed look when it
/// fits — the content is given a `minHeight` equal to the viewport, so the
/// Spacers expand exactly as before — and lets it scroll into reach the moment
/// it doesn't. `scrollBounceBehavior(.basedOnSize)` suppresses rubber-banding
/// when nothing actually scrolls, so the fits-on-screen case is visually
/// indistinguishable from a plain VStack.
struct FitOrScrollLayout<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                content
                    .frame(minHeight: geo.size.height, alignment: .top)
            }
            .scrollBounceBehavior(.basedOnSize)
            .scrollIndicators(.hidden)
        }
    }
}
