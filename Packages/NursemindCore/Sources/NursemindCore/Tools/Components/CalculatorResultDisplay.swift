import SwiftUI

public enum CalculatorInterpretationLevel: Sendable {
    case neutral
    case caution
    case alert

    var color: Color {
        switch self {
        case .neutral: return NMColor.textSecondary
        case .caution: return NMColor.textPrimary
        case .alert:   return NMColor.alertHigh
        }
    }

    /// Severity glyph rendered beside the interpretation line. Neutral results
    /// stay bare — the glyph appears only when the number warrants attention,
    /// so it reads as signal, not decoration.
    var glyph: String? {
        switch self {
        case .neutral: return nil
        case .caution: return "exclamationmark.triangle"
        case .alert:   return "exclamationmark.octagon"
        }
    }
}

/// Hero result block — large mono number, unit, optional categorical interpretation.
/// Empty state prompts the user to fill the inputs above.
public struct CalculatorResultDisplay: View {
    private let label: String
    private let value: String?
    private let unit: String?
    private let interpretation: String?
    private let level: CalculatorInterpretationLevel
    private let scale: ResultScale?
    private let scaleValue: Double?

    public init(
        label: String = "Result",
        value: String?,
        unit: String? = nil,
        interpretation: String? = nil,
        level: CalculatorInterpretationLevel = .neutral,
        scale: ResultScale? = nil,
        scaleValue: Double? = nil
    ) {
        self.label = label
        self.value = value
        self.unit = unit
        self.interpretation = interpretation
        self.level = level
        self.scale = scale
        self.scaleValue = scaleValue
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Hairline().padding(.bottom, NMSpace.xl)
            EyebrowLabel(label.uppercased(), sparkle: true)
                .padding(.bottom, NMSpace.md)
            if let value {
                HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                    Text(value)
                        .font(NMFont.heroNumber)
                        .foregroundStyle(NMColor.textPrimary)
                    if let unit {
                        Text(unit)
                            .font(NMFont.displayItalicMD)
                            .foregroundStyle(NMColor.textTertiary)
                    }
                }
                if let scale, let scaleValue {
                    ResultScaleBar(scale: scale, value: scaleValue)
                        .padding(.top, NMSpace.lg)
                }
                if let interpretation {
                    HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                        if let glyph = level.glyph {
                            Image(systemName: glyph)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundStyle(level == .alert ? NMColor.alertHigh : NMColor.textPrimary)
                                .accessibilityLabel(level == .alert ? "Critical" : "Caution")
                        }
                        Text(interpretation)
                            .font(NMFont.body)
                            .foregroundStyle(level.color)
                            .lineSpacing(3)
                    }
                    .padding(.top, NMSpace.md)
                }
            } else {
                Text("Enter values above")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textTertiary)
                    .padding(.vertical, NMSpace.md)
            }
        }
        .padding(.top, NMSpace.lg)
    }
}
