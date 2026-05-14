import SwiftUI

/// Pre-streaming loading indicator for the Ask flow. Shows a calm,
/// editorial "model is thinking" affordance instead of a bare blinking
/// cursor in the moment between the user tapping send and the first
/// `.delta` event arriving from the AI service.
///
/// Visual rhythm:
///   • A single accent dot that breathes (opacity 0.35 ↔ 1.0, 1.3s loop)
///   • One status line in italic display type that cycles through three
///     phases on a fixed interval — "Thinking…" → "Researching the
///     library…" → "Drafting your answer…"
///
/// The cycling phases mirror the actual server-side pipeline (intent
/// classification → RAG retrieve → generation) without coupling to it —
/// the timeline is purely time-based so a fast or slow response is
/// handled identically. If the first `.delta` arrives mid-"Thinking",
/// the indicator fades out cleanly and the streamed content takes over.
struct ThinkingIndicator: View {
    @State private var phaseIndex: Int = 0
    @State private var dotVisible: Bool = false

    /// Cadence between status lines. 1.4s reads as "deliberate" — short
    /// enough that the user sees motion, long enough to read each phrase.
    private let phaseInterval: TimeInterval = 1.4

    private let phases: [String] = [
        "Thinking…",
        "Researching the library…",
        "Drafting your answer…"
    ]

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.sm) {
            // Breathing accent dot. Reuses NMColor.accent so it lives in
            // the same visual vocabulary as the brand wordmark and CTAs.
            Circle()
                .fill(NMColor.accent)
                .frame(width: 8, height: 8)
                .opacity(dotVisible ? 1.0 : 0.35)
                .animation(
                    .easeInOut(duration: 0.65).repeatForever(autoreverses: true),
                    value: dotVisible
                )

            // Italic status line. Cross-fades when the phase advances.
            Text(phases[phaseIndex])
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
                .id(phaseIndex)
                .transition(
                    .asymmetric(
                        insertion: .opacity.animation(.easeOut(duration: 0.35)),
                        removal: .opacity.animation(.easeIn(duration: 0.18))
                    )
                )
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear {
            dotVisible = true
            startPhaseLoop()
        }
        .accessibilityLabel(phases[phaseIndex])
    }

    /// Advance the phase index every `phaseInterval` seconds. We don't
    /// cancel the task on disappear — the view's lifecycle is short
    /// (replaced by the streamed answer the moment the first delta lands),
    /// and SwiftUI tears down the task automatically when the view goes
    /// away. Looping back to the last phase keeps the indicator stable if
    /// the server takes longer than 3 × phaseInterval to first-byte.
    private func startPhaseLoop() {
        Task { @MainActor in
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(phaseInterval))
                guard !Task.isCancelled else { return }
                let next = min(phaseIndex + 1, phases.count - 1)
                guard next != phaseIndex else { return }
                withAnimation { phaseIndex = next }
            }
        }
    }
}

#Preview {
    ThinkingIndicator()
        .padding()
        .background(NMColor.bgPrimary)
}
