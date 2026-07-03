import SwiftUI

/// The app's category icon vocabulary — one SF Symbol + one quiet editorial
/// tint per content category. Tints come from the source palette: they carry
/// information, never action, so they don't compete with the single accent.
/// Every surface that renders a category glyph (Library rows, browse lists,
/// AI handoff rows) reads from here so the grammar never drifts.
public extension EntryCategory {
    var glyph: String {
        switch self {
        case .drug:          return "pills"
        case .drip:          return "ivfluid.bag"
        case .lab:           return "drop"
        case .procedure:     return "list.bullet.clipboard"
        case .diagnosis:     return "stethoscope"
        case .scenario:      return "person.2"
        case .communication: return "bubble.left.and.bubble.right"
        case .reference:     return "book"
        }
    }

    var glyphTint: Color {
        switch self {
        case .drug, .drip:   return NMColor.sourceFDA
        case .lab:           return NMColor.sourceJournal
        case .procedure:     return NMColor.sourceTextbook
        case .diagnosis:     return NMColor.sourceGuideline
        case .scenario:      return NMColor.sourceSociety
        case .communication: return NMColor.sourceAgency
        case .reference:     return NMColor.textSecondary
        }
    }
}

/// Tools categories use the same glyph treatment but stay monochrome —
/// calculators are instruments, not sources, so they take no source tone.
public extension CalculatorCategory {
    var glyph: String {
        switch self {
        case .cardiovascular: return "waveform.path.ecg"
        case .respiratory:    return "lungs"
        case .renalMetabolic: return "drop.halffull"
        case .hepatic:        return "flask"
        case .hematology:     return "syringe"
        case .burns:          return "flame"
        case .riskScores:     return "checklist"
        case .anthropometry:  return "ruler"
        case .conversions:    return "arrow.left.arrow.right"
        }
    }
}

/// Shared leading glyph cell for list rows — fixed width keeps text columns
/// aligned across mixed-category lists.
struct CategoryGlyphCell: View {
    let symbol: String
    let tint: Color
    var size: CGFloat = 15

    var body: some View {
        Image(systemName: symbol)
            .font(.system(size: size, weight: .regular))
            .foregroundStyle(tint)
            .frame(width: 22, alignment: .center)
            .accessibilityHidden(true)
    }
}
