import SwiftUI

// MARK: - Timing vocabulary

/// One vocabulary for every onboarding movement, so ten screens move like
/// one product: three durations, one spring, one rise.
enum OnboardingMotion {
    static let quick: Double = 0.32
    static let base: Double = 0.45
    static let slow: Double = 0.6
    static let rise: CGFloat = 8
    static let spring = Animation.spring(response: 0.55, dampingFraction: 0.82)
    static let settle = Animation.spring(response: 0.42, dampingFraction: 0.7)
    /// Delay between elements in a screen's stagger, in nanoseconds.
    static let elementStagger: UInt64 = 110_000_000
    /// Delay between words in a headline reveal.
    static let wordStagger: Double = 0.045

    /// Content lifts in over the fixed cream ground: a short rise, a fade,
    /// and a touch of blur that resolves as it lands. Leaving is a plain
    /// fade with a smaller lift, so the eye follows what arrives.
    static func lift(reduceMotion: Bool) -> AnyTransition {
        guard !reduceMotion else { return .opacity }
        return .asymmetric(
            insertion: .modifier(active: LiftModifier(progress: 1, rise: rise, blur: 6),
                                 identity: LiftModifier(progress: 0, rise: rise, blur: 6)),
            removal: .modifier(active: LiftModifier(progress: 1, rise: -4, blur: 4),
                               identity: LiftModifier(progress: 0, rise: -4, blur: 4))
        )
    }

    /// The splash stays whole underneath while Welcome fades in over it,
    /// so two dark screens hand off without the cream ground flashing
    /// through the middle of the crossfade.
    static func hold() -> AnyTransition {
        .asymmetric(
            insertion: .identity,
            removal: .modifier(active: HoldModifier(progress: 1), identity: HoldModifier(progress: 0))
        )
    }

}

struct LiftModifier: ViewModifier, Animatable {
    var progress: Double
    let rise: CGFloat
    let blur: CGFloat

    nonisolated var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        content
            .opacity(1 - progress)
            .offset(y: rise * progress)
            .blur(radius: blur * progress)
    }
}

/// Keeps the departing view on screen, whole, for almost the length of the
/// transition and lets it go only at the very end, once the arriving view
/// has covered it. The body must read `progress`, or SwiftUI treats the
/// removal as instant.
struct HoldModifier: ViewModifier, Animatable {
    var progress: Double

    nonisolated var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        content.opacity(1 - progress * progress * progress * progress)
    }
}

/// The hand-off the app target can see: the main app rises into place
/// beneath the departing Success screen, so the product is already moving
/// when the nurse arrives.
public enum OnboardingArrival {
    public static let duration: Double = OnboardingMotion.slow

    public static func transition(reduceMotion: Bool) -> AnyTransition {
        guard !reduceMotion else { return .opacity }
        return .asymmetric(
            insertion: .modifier(active: LiftModifier(progress: 1, rise: 28, blur: 0),
                                 identity: LiftModifier(progress: 0, rise: 28, blur: 0)),
            removal: .opacity
        )
    }
}

// MARK: - The living mark

/// Where the sparkle should be on the current screen. Each step places one
/// `OnboardingMarkSlot` where the mark belongs; the flow draws a single
/// mark above every step and springs it between homes, so the same object
/// is born on the splash, sits in every eyebrow, and lands on Success.
struct OnboardingMarkTarget: Equatable {
    enum Tint: Equatable { case accent, white, splash }
    let home: String
    let frame: CGRect
    let size: CGFloat
    let tint: Tint
}

struct OnboardingMarkKey: PreferenceKey {
    static let defaultValue: [OnboardingMarkTarget] = []
    static func reduce(value: inout [OnboardingMarkTarget], nextValue: () -> [OnboardingMarkTarget]) {
        value.append(contentsOf: nextValue())
    }
}

/// Slots report in global coordinates because a named space does not
/// survive the hosting boundary inside a paged TabView; the flow subtracts
/// its own global origin before drawing.
struct OnboardingMarkSlot: View {
    let home: String
    var size: CGFloat = 11
    var tint: OnboardingMarkTarget.Tint = .accent
    /// A slot inside a paged or transient view reports only while active.
    var active: Bool = true

    var body: some View {
        Color.clear
            .frame(width: size, height: size)
            .background(
                GeometryReader { geo in
                    Color.clear.preference(
                        key: OnboardingMarkKey.self,
                        value: active ? [OnboardingMarkTarget(home: home, frame: geo.frame(in: .global), size: geo.frame(in: .global).width, tint: tint)] : []
                    )
                }
            )
            .accessibilityHidden(true)
    }
}

/// The mark itself. Springs between slot frames, pulses once when a new
/// home is reached, and breathes slowly while the splash holds it.
struct OnboardingMark: View {
    let target: OnboardingMarkTarget?
    /// Global origin of the view the mark is drawn in.
    var origin: CGPoint = .zero
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var pulse: CGFloat = 1
    @State private var shownHome: String = ""

    var body: some View {
        if let target {
            Group {
                if target.home == "splash", !reduceMotion {
                    TimelineView(.animation(minimumInterval: 1.0 / 30.0)) { context in
                        let t = context.date.timeIntervalSinceReferenceDate
                        glyph(target, scale: 1 + 0.05 * sin(t * 2.2))
                    }
                } else {
                    glyph(target, scale: pulse)
                }
            }
            .position(x: target.frame.midX - origin.x, y: target.frame.midY - origin.y)
            .animation(reduceMotion ? nil : OnboardingMotion.spring, value: target.frame)
            .animation(reduceMotion ? nil : OnboardingMotion.spring, value: target.size)
            .animation(.easeInOut(duration: OnboardingMotion.quick), value: target.tint)
            .allowsHitTesting(false)
            .accessibilityHidden(true)
            .onChange(of: target.home) { _, home in landed(at: home) }
            .onAppear { shownHome = target.home }
        }
    }

    private func glyph(_ target: OnboardingMarkTarget, scale: CGFloat) -> some View {
        Image(systemName: "sparkle")
            .modifier(MarkGlyphSize(size: target.size))
            .foregroundStyle(color(for: target.tint))
            .scaleEffect(scale)
            .shadow(color: target.tint == .white ? .black.opacity(0.45) : .clear, radius: 10, y: 2)
    }

    private func color(for tint: OnboardingMarkTarget.Tint) -> Color {
        switch tint {
        case .accent: return NMColor.accent
        case .white: return .white
        case .splash: return Color(red: 0x48 / 255, green: 0xCB / 255, blue: 0x7B / 255)
        }
    }

    /// One soft pulse as the mark settles into a new home, the same weight
    /// as the step haptic, never a bounce.
    private func landed(at home: String) {
        guard home != shownHome else { return }
        shownHome = home
        guard !reduceMotion else { return }
        Task { @MainActor in
            try? await Task.sleep(for: .milliseconds(320))
            withAnimation(OnboardingMotion.settle) { pulse = 1.22 }
            try? await Task.sleep(for: .milliseconds(180))
            withAnimation(OnboardingMotion.spring) { pulse = 1 }
        }
    }
}

/// Sets the glyph's point size through animatable data, so the mark grows
/// and shrinks along its flight instead of snapping between homes, and is
/// re-rendered crisp at every intermediate size.
struct MarkGlyphSize: ViewModifier, Animatable {
    var size: CGFloat

    nonisolated var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size * 0.92, weight: .regular))
            .frame(width: size, height: size)
    }
}

// MARK: - Progress rule

/// A step with pages or questions reports how far through them it is, so
/// the one rule at the top advances inside the step too. Tagged with the
/// step so a departing view's last value is ignored.
struct OnboardingSubprogress: Equatable {
    let step: String
    let fraction: Double
}

struct OnboardingSubprogressKey: PreferenceKey {
    static let defaultValue: [OnboardingSubprogress] = []
    static func reduce(value: inout [OnboardingSubprogress], nextValue: () -> [OnboardingSubprogress]) {
        value.append(contentsOf: nextValue())
    }
}

/// A one-point rule at the top of the flow that fills with the accent as
/// the nurse advances: structure, not chrome, and the only accent on the
/// page apart from the primary button.
struct OnboardingProgressRule: View {
    let fraction: Double
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle().fill(NMColor.borderSubtle)
                Rectangle()
                    .fill(NMColor.accent)
                    .frame(width: max(0, geo.size.width * fraction))
            }
        }
        .frame(height: 1)
        .animation(reduceMotion ? nil : OnboardingMotion.spring, value: fraction)
        .accessibilityElement()
        .accessibilityLabel("Setup progress")
        .accessibilityValue("\(Int((fraction * 100).rounded())) percent")
    }
}

// MARK: - Headline reveal

/// A headline that lands word by word: each word rises a few points and
/// fades in, a beat after the one before, with the italic accent word
/// settling last because it comes last. Words are grouped into segments so
/// "trust." can keep its italic accent and its regular period together.
struct RevealHeadline: View {
    struct Segment {
        let text: String
        var font: Font
        var color: Color
    }

    struct Word {
        let segments: [Segment]
        var breakBefore: Bool = false

        init(_ text: String, font: Font, color: Color, breakBefore: Bool = false) {
            segments = [Segment(text: text, font: font, color: color)]
            self.breakBefore = breakBefore
        }

        init(segments: [Segment], breakBefore: Bool = false) {
            self.segments = segments
            self.breakBefore = breakBefore
        }
    }

    let words: [Word]
    var alignment: HorizontalAlignment = .leading
    /// Width of the gap between words; roughly a quarter em of the headline.
    var wordSpacing: CGFloat = 10
    var lineSpacing: CGFloat = 0
    var delay: Double = 0

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var shown = false

    /// Splits a plain headline on spaces with one font and colour. A newline
    /// in the text is an authored line break and is honoured as one.
    nonisolated static func words(_ text: String, font: Font, color: Color) -> [Word] {
        text.split(separator: "\n", omittingEmptySubsequences: true).enumerated().flatMap { lineIndex, line in
            line.split(separator: " ").enumerated().map { wordIndex, word in
                Word(String(word), font: font, color: color, breakBefore: lineIndex > 0 && wordIndex == 0)
            }
        }
    }

    var body: some View {
        WordFlowLayout(alignment: alignment, wordSpacing: wordSpacing, lineSpacing: lineSpacing) {
            ForEach(Array(words.enumerated()), id: \.offset) { index, word in
                if word.breakBefore { WordFlowBreak() }
                wordText(word)
                    .opacity(shown ? 1 : 0)
                    .offset(y: shown ? 0 : OnboardingMotion.rise)
                    .animation(reduceMotion ? nil : .easeOut(duration: OnboardingMotion.base).delay(delay + Double(index) * OnboardingMotion.wordStagger), value: shown)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(words.map { $0.segments.map(\.text).joined() }.joined(separator: " "))
        .accessibilityAddTraits(.isHeader)
        .onAppear { shown = true }
    }

    private func wordText(_ word: Word) -> Text {
        word.segments.reduce(Text("")) { partial, segment in
            partial + Text(segment.text).font(segment.font).foregroundColor(segment.color)
        }
    }
}

/// A zero-size marker that forces the next word onto a new line.
struct WordFlowBreak: View {
    var body: some View { Color.clear.frame(width: 0, height: 0) }
}

/// Flows words left to right, wraps at the width, and aligns each row.
/// A zero-width child is a forced line break.
struct WordFlowLayout: Layout {
    var alignment: HorizontalAlignment = .leading
    var wordSpacing: CGFloat = 10
    var lineSpacing: CGFloat = 0

    private struct Row {
        var indices: [Int] = []
        var width: CGFloat = 0
        var height: CGFloat = 0
    }

    private func rows(for subviews: Subviews, maxWidth: CGFloat) -> [Row] {
        var rows: [Row] = [Row()]
        for (index, subview) in subviews.enumerated() {
            let size = subview.sizeThatFits(.unspecified)
            if size.width == 0 && size.height == 0 {
                if !rows[rows.count - 1].indices.isEmpty { rows.append(Row()) }
                continue
            }
            var row = rows[rows.count - 1]
            let needed = row.indices.isEmpty ? size.width : row.width + wordSpacing + size.width
            if needed > maxWidth + 0.5, !row.indices.isEmpty {
                rows.append(Row(indices: [index], width: size.width, height: size.height))
            } else {
                row.indices.append(index)
                row.width = needed
                row.height = max(row.height, size.height)
                rows[rows.count - 1] = row
            }
        }
        return rows.filter { !$0.indices.isEmpty }
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        let rows = rows(for: subviews, maxWidth: maxWidth)
        let height = rows.map(\.height).reduce(0, +) + CGFloat(max(0, rows.count - 1)) * lineSpacing
        let width = proposal.width ?? (rows.map(\.width).max() ?? 0)
        return CGSize(width: width, height: height)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var y = bounds.minY
        for row in rows(for: subviews, maxWidth: bounds.width) {
            var x: CGFloat
            switch alignment {
            case .center: x = bounds.minX + (bounds.width - row.width) / 2
            case .trailing: x = bounds.maxX - row.width
            default: x = bounds.minX
            }
            for index in row.indices {
                let size = subviews[index].sizeThatFits(.unspecified)
                subviews[index].place(at: CGPoint(x: x, y: y + (row.height - size.height) / 2), proposal: .unspecified)
                x += size.width + wordSpacing
            }
            y += row.height + lineSpacing
        }
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if size.width == 0 && size.height == 0 {
                subview.place(at: bounds.origin, proposal: .unspecified)
            }
        }
    }
}
