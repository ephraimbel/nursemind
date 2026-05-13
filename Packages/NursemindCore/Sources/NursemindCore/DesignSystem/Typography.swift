import SwiftUI

// Bundled fonts (registered by NursemindFonts.register() at app launch):
//   • Instrument Serif Regular + Italic — display
//   • Inter Variable — body (weight controlled via .weight() modifier)
//   • SF Mono — system, used for numerics

private let serifName        = "InstrumentSerif-Regular"
private let serifItalicName  = "InstrumentSerif-Italic"
private let interName        = "Inter"  // variable font; weight applied via Font.weight()

public enum NMFont {
    // Display serif — scales with Dynamic Type via relativeTo
    public static let displayHero  = Font.custom(serifName, size: 96, relativeTo: .largeTitle)
    public static let displayXL    = Font.custom(serifName, size: 56, relativeTo: .largeTitle)
    public static let displayEntry = Font.custom(serifName, size: 52, relativeTo: .largeTitle)
    public static let displayLG    = Font.custom(serifName, size: 44, relativeTo: .title)
    public static let displayMD    = Font.custom(serifName, size: 28, relativeTo: .title2)
    public static let displaySM    = Font.custom(serifName, size: 22, relativeTo: .title3)
    public static let displayXS    = Font.custom(serifName, size: 19, relativeTo: .headline)

    // Display italic
    public static let displayItalicLG = Font.custom(serifItalicName, size: 24, relativeTo: .title3)
    public static let displayItalicMD = Font.custom(serifItalicName, size: 20, relativeTo: .headline)
    public static let displayItalicSM = Font.custom(serifItalicName, size: 16, relativeTo: .body)

    // Body sans (Inter)
    public static let bodyLG = Font.custom(interName, size: 17, relativeTo: .body)
    public static let body   = Font.custom(interName, size: 15, relativeTo: .callout)
    public static let bodySM = Font.custom(interName, size: 13, relativeTo: .footnote)
    public static let title  = Font.custom(interName, size: 17, relativeTo: .headline).weight(.semibold)

    // Labels (uppercase eyebrows)
    public static let label   = Font.custom(interName, size: 11, relativeTo: .caption).weight(.medium)
    public static let labelSM = Font.custom(interName, size: 10, relativeTo: .caption2).weight(.medium)

    // Numerics
    public static let monoDisplay = Font.system(.largeTitle, design: .monospaced)
    public static let monoXL      = Font.system(.body, design: .monospaced)
    public static let mono        = Font.system(.callout, design: .monospaced)
    public static let monoSM      = Font.system(.footnote, design: .monospaced)

    public static let heroNumber  = Font.custom(serifName, size: 72, relativeTo: .largeTitle)
}

public extension Text {
    func eyebrow() -> some View {
        self
            .font(NMFont.label)
            .tracking(1.6)
            .textCase(.uppercase)
            .foregroundStyle(NMColor.textTertiary)
    }

    func displayXL() -> some View {
        self.font(NMFont.displayXL).tracking(-1.6).foregroundStyle(NMColor.textPrimary)
    }

    func displayLG() -> some View {
        self.font(NMFont.displayLG).tracking(-1.2).foregroundStyle(NMColor.textPrimary)
    }

    func displayMD() -> some View {
        self.font(NMFont.displayMD).tracking(-0.6).foregroundStyle(NMColor.textPrimary)
    }

    func displaySM() -> some View {
        self.font(NMFont.displaySM).tracking(-0.4).foregroundStyle(NMColor.textPrimary)
    }

    /// Entry title — 52pt serif with -1.5 tracking and graceful scale-down for long generic names.
    func displayEntry() -> some View {
        self
            .font(NMFont.displayEntry)
            .tracking(-1.5)
            .foregroundStyle(NMColor.textPrimary)
            .lineLimit(2)
            .minimumScaleFactor(0.6)
    }

    func bodyText() -> some View {
        self.font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineSpacing(4)
    }

    func captionText() -> some View {
        self.font(NMFont.bodySM).foregroundStyle(NMColor.textTertiary)
    }
}
