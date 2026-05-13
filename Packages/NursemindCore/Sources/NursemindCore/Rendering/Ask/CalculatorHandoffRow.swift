import SwiftUI

/// Pinned at the top of an AI answer when the user's question maps to a
/// bundled calculator. Tap presents the calculator as a sheet — bundles the
/// AI surface with the tools surface in a single tap.
///
/// Visually distinct from the rest of the answer chrome: subtle accent-green
/// `f(x)` glyph (the only place outside primary CTAs that uses accent — earned
/// because it represents an action, not just information), hairline-bounded
/// row with italic helper underneath.
struct CalculatorHandoffRow: View {
    let calculatorID: String
    let preset: [String: Double]
    @State private var presented = false

    init(calculatorID: String, preset: [String: Double] = [:]) {
        self.calculatorID = calculatorID
        self.preset = preset
    }

    private var entry: CalculatorEntry? { CalculatorRegistry.entry(byID: calculatorID) }
    private var hasPreset: Bool { !preset.isEmpty }

    var body: some View {
        Button {
            presented = true
        } label: {
            HStack(alignment: .center, spacing: NMSpace.base) {
                glyph
                VStack(alignment: .leading, spacing: 2) {
                    Text(primaryLabel)
                        .font(NMFont.title)
                        .foregroundStyle(NMColor.textPrimary)
                    Text(secondaryLabel)
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textSecondary)
                }
                Spacer(minLength: 0)
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            }
            .padding(.vertical, NMSpace.base)
            .padding(.horizontal, NMSpace.base)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(NMColor.borderSubtle, lineWidth: 1)
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $presented) {
            NavigationStack {
                CalculatorDetailRouter(calculatorID: calculatorID, preset: preset)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Done") { presented = false }
                                .foregroundStyle(NMColor.accent)
                        }
                    }
            }
        }
    }

    private var glyph: some View {
        ZStack {
            Circle()
                .fill(NMColor.accent.opacity(0.10))
                .frame(width: 32, height: 32)
            Text("ƒ")
                .font(.system(size: 17, weight: .semibold, design: .serif))
                .italic()
                .foregroundStyle(NMColor.accent)
        }
    }

    private var primaryLabel: String {
        guard let entry else { return "Open calculator" }
        return "Calculate \(entry.title)"
    }

    private var secondaryLabel: String {
        guard let entry else { return "Tap to open" }
        if hasPreset {
            return "Values pre-filled from your question"
        }
        return "\(entry.subtitle) · \(entry.category.displayName)"
    }
}
