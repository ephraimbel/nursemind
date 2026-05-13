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
}

/// Hero result block — large mono number, unit, optional categorical interpretation.
/// Empty state prompts the user to fill the inputs above.
public struct CalculatorResultDisplay: View {
    private let label: String
    private let value: String?
    private let unit: String?
    private let interpretation: String?
    private let level: CalculatorInterpretationLevel

    public init(
        label: String = "Result",
        value: String?,
        unit: String? = nil,
        interpretation: String? = nil,
        level: CalculatorInterpretationLevel = .neutral
    ) {
        self.label = label
        self.value = value
        self.unit = unit
        self.interpretation = interpretation
        self.level = level
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
                if let interpretation {
                    Text(interpretation)
                        .font(NMFont.body)
                        .foregroundStyle(level.color)
                        .padding(.top, NMSpace.md)
                        .lineSpacing(3)
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
