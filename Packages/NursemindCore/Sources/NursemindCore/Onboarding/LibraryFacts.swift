import SwiftUI

/// The two numbers the flow is allowed to state: how many entries the
/// bundled library holds and how many distinct sources stand behind them.
/// Counted once, off the main thread, and shared by Auth and Success, so
/// the onboarding never shows a figure the product cannot back.
actor LibraryFacts {
    struct Counts: Equatable, Sendable {
        let entries: Int
        let sources: Int
        static let none = Counts(entries: 0, sources: 0)
    }

    static let shared = LibraryFacts()
    private var cached: Counts?

    func counts(registry: ContentRegistry = .shared) -> Counts {
        if let cached { return cached }
        let entries = registry.all
        let sources = Set(entries.flatMap { $0.citationSources.map(\.id) })
        let counts = Counts(entries: entries.count, sources: sources.count)
        cached = counts
        return counts
    }
}

extension LibraryEntry {
    /// Every source the entry cites, whatever its type.
    var citationSources: [CitationSource] {
        switch self {
        case .drug(let e), .drip(let e):
            return e.citations
        case .lab(let e):
            return e.citations
        case .procedure(let e):
            return e.citations
        case .diagnosis(let e):
            return e.citations
        case .scenario(let e), .communication(let e), .reference(let e):
            return e.citations
        }
    }
}

// MARK: - Rolling figure

/// A figure that counts up to its value in mono, the way a meter settles.
/// The final width is reserved from the start so the words beside it never
/// shift while the digits run.
struct RollingNumber: View {
    let value: Int
    var font: Font = NMFont.monoXL
    var color: Color = NMColor.textPrimary
    var duration: Double = 1.1
    var delay: Double = 0

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var shown: Double = 0

    var body: some View {
        ZStack(alignment: .trailing) {
            Text(RollingDigits.formatted(value))
                .font(font)
                .monospacedDigit()
                .hidden()
            Color.clear
                .modifier(RollingDigits(value: shown, font: font, color: color))
        }
        .fixedSize()
        .accessibilityLabel(RollingDigits.formatted(value))
        .onAppear { roll(to: value) }
        .onChange(of: value) { _, next in roll(to: next) }
    }

    private func roll(to target: Int) {
        guard !reduceMotion else {
            shown = Double(target)
            return
        }
        withAnimation(.easeOut(duration: duration).delay(delay)) { shown = Double(target) }
    }
}

struct RollingDigits: ViewModifier, Animatable {
    var value: Double
    let font: Font
    let color: Color

    nonisolated var animatableData: Double {
        get { value }
        set { value = newValue }
    }

    func body(content: Content) -> some View {
        Text(Self.formatted(Int(value.rounded())))
            .font(font)
            .monospacedDigit()
            .foregroundStyle(color)
    }

    nonisolated static func formatted(_ figure: Int) -> String {
        figure.formatted(.number.grouping(.automatic))
    }
}

/// "2,147 entries · 674 sources": mono figures, serif words.
struct LibraryCountsLine: View {
    let counts: LibraryFacts.Counts
    var delay: Double = 0

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
            RollingNumber(value: counts.entries, delay: delay)
            word("entries")
            Text("·")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textTertiary)
            RollingNumber(value: counts.sources, delay: delay + 0.15)
            word("sources")
        }
        // Nothing to say until the registry has been counted.
        .opacity(counts == .none ? 0 : 1)
        .animation(.easeOut(duration: OnboardingMotion.quick), value: counts == .none)
        .accessibilityElement(children: .combine)
    }

    private func word(_ text: String) -> some View {
        Text(text)
            .font(NMFont.displayItalicMD)
            .foregroundStyle(NMColor.textSecondary)
    }
}
