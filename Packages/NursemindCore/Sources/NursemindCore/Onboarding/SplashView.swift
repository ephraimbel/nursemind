import SwiftUI

/// The brand moment that opens the flow. The mark is born in the centre of
/// the deep green field and breathes there; the wordmark settles in beneath
/// it a beat later. Holds, then the mark carries on into Welcome while the
/// field dissolves into the photograph. Auto-advances; no tap required.
struct SplashView: View {
    let onComplete: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var wordmarkOpacity: Double = 0

    /// Mirrors the app-icon contrast: deep forest green field with the
    /// brighter icon green on top. Hardcoded so the brand moment never
    /// shifts with light or dark mode.
    private static let splashBackground = Color(red: 0x0E / 255, green: 0x2E / 255, blue: 0x1B / 255)
    private static let splashForeground = Color(red: 0x48 / 255, green: 0xCB / 255, blue: 0x7B / 255)

    var body: some View {
        ZStack {
            Self.splashBackground.ignoresSafeArea()
            VStack(spacing: NMSpace.lg) {
                OnboardingMarkSlot(home: "splash", size: 36, tint: .splash)
                NursemindLogo(size: 40, color: Self.splashForeground)
                    .opacity(wordmarkOpacity)
                    .offset(y: reduceMotion ? 0 : (wordmarkOpacity == 1 ? 0 : 6))
            }
        }
        .task { await run() }
    }

    private func run() async {
        if reduceMotion {
            wordmarkOpacity = 1
            try? await Task.sleep(for: .seconds(1.2))
            onComplete()
            return
        }
        try? await Task.sleep(for: .milliseconds(420))
        withAnimation(.easeOut(duration: OnboardingMotion.slow)) { wordmarkOpacity = 1 }
        try? await Task.sleep(for: .seconds(1.5))
        onComplete()
    }
}

#Preview {
    SplashView(onComplete: {})
}
