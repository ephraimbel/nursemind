import SwiftUI

public struct EyebrowLabel: View {
    private let text: String
    private let showSparkle: Bool
    private let animated: Bool

    @State private var sparkleVisible: Bool = false

    /// `animated`: when true, the sparkle does a one-shot fade-up + scale on
    /// first appearance. Used by the assistant-message eyebrow ("NURSEMIND")
    /// to give a fresh answer a subtle "the AI just took the floor" signal.
    /// Every other call site (Profile, AuthView, EditorialStandards, etc.)
    /// uses the default `false` and renders the sparkle statically.
    public init(_ text: String, sparkle: Bool = true, animated: Bool = false) {
        self.text = text
        self.showSparkle = sparkle
        self.animated = animated
    }

    public var body: some View {
        HStack(spacing: 6) {
            if showSparkle {
                Text("✦")
                    .font(NMFont.label)
                    .foregroundStyle(NMColor.textTertiary)
                    .opacity(animated ? (sparkleVisible ? 1 : 0) : 1)
                    .scaleEffect(animated ? (sparkleVisible ? 1 : 0.6) : 1)
                    .onAppear {
                        guard animated else { return }
                        // dampingFraction 0.82 gives a barely-perceptible
                        // overshoot — visible "settling in" without the
                        // playful bounce of a lower value. Matches the
                        // Mercury/Linear-coded calm restraint CLAUDE.md
                        // asks for; a clinical reference doesn't want
                        // Duolingo-style spring on micro-interactions.
                        withAnimation(.spring(response: 0.55, dampingFraction: 0.82)) {
                            sparkleVisible = true
                        }
                    }
            }
            Text(text.uppercased())
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(NMColor.textTertiary)
        }
    }
}

#Preview {
    EyebrowLabel("DRUG · VASOPRESSOR")
        .padding(NMSpace.lg)
        .background(NMColor.bgPrimary)
}
