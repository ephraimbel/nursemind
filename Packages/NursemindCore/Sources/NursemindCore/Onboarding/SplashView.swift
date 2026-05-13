import SwiftUI

/// The brand moment that opens the onboarding flow. Logo fades in (0.5s),
/// holds for ~1s, fades out (0.4s) — total ~1.9s. Auto-advances; no tap
/// required. Respects Reduce Motion (instant transitions if enabled).
struct SplashView: View {
    let onComplete: () -> Void

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var opacity: Double = 0

    /// Mirrors the app-icon contrast: deep forest green field with a brighter
    /// green wordmark on top. Hardcoded — splash is the brand moment, so we
    /// don't want it shifting with light/dark mode the way `NMColor.accent`
    /// does. Background hex matches `NMColor.onAccent` (light variant);
    /// foreground hex matches the app-icon tile color.
    private static let splashBackground = Color(red: 0x0E / 255, green: 0x2E / 255, blue: 0x1B / 255)
    private static let splashForeground = Color(red: 0x48 / 255, green: 0xCB / 255, blue: 0x7B / 255)

    var body: some View {
        ZStack {
            Self.splashBackground.ignoresSafeArea()
            NursemindLogo(size: 72, color: Self.splashForeground)
                .opacity(opacity)
        }
        .task {
            await runAnimation()
        }
    }

    private func runAnimation() async {
        if reduceMotion {
            opacity = 1
            try? await Task.sleep(for: .seconds(1.2))
            opacity = 0
            try? await Task.sleep(for: .seconds(0.1))
            onComplete()
            return
        }

        withAnimation(.easeOut(duration: 0.5)) { opacity = 1 }
        try? await Task.sleep(for: .seconds(1.4))
        withAnimation(.easeIn(duration: 0.4)) { opacity = 0 }
        try? await Task.sleep(for: .seconds(0.4))
        onComplete()
    }
}

#Preview {
    SplashView(onComplete: {})
}
