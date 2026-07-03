import SwiftUI

/// Published threshold bands for a calculator result. Bands are contiguous
/// and ascending; each band carries the same interpretation level the
/// calculator's prose logic uses, so the bar and the sentence never disagree.
public struct ResultScale: Sendable {
    public struct Band: Sendable {
        let upperBound: Double
        let level: CalculatorInterpretationLevel

        public init(upTo upperBound: Double, _ level: CalculatorInterpretationLevel) {
            self.upperBound = upperBound
            self.level = level
        }
    }

    let lowerBound: Double
    let bands: [Band]

    public init(from lowerBound: Double, bands: [Band]) {
        self.lowerBound = lowerBound
        self.bands = bands
    }

    var upperBound: Double { bands.last?.upperBound ?? lowerBound }

    /// Internal band boundaries — the clinically meaningful thresholds.
    /// Scale ends are display bounds, not thresholds, so they get no label.
    var thresholds: [Double] { bands.dropLast().map(\.upperBound) }

    func fraction(of value: Double) -> Double {
        guard upperBound > lowerBound else { return 0 }
        return min(max((value - lowerBound) / (upperBound - lowerBound), 0), 1)
    }
}

/// Hairline scale bar under the hero result number: quiet band segments with
/// the published thresholds ticked in mono, and a single marker showing where
/// this value falls. No gradients, no gauge chrome — the thresholds do the
/// talking.
struct ResultScaleBar: View {
    let scale: ResultScale
    let value: Double

    private static let trackHeight: CGFloat = 3
    private static let bandGap: CGFloat = 3

    private struct Segment: Identifiable {
        let id: Int
        let x: CGFloat
        let width: CGFloat
        let color: Color
    }

    private func segments(in totalWidth: CGFloat) -> [Segment] {
        var out: [Segment] = []
        var start = scale.lowerBound
        for (idx, band) in scale.bands.enumerated() {
            let x0 = scale.fraction(of: start) * totalWidth
            let x1 = scale.fraction(of: band.upperBound) * totalWidth
            out.append(Segment(
                id: idx,
                x: x0 + Self.bandGap / 2,
                width: max(x1 - x0 - Self.bandGap, 2),
                color: bandColor(band.level)
            ))
            start = band.upperBound
        }
        return out
    }

    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            ZStack(alignment: .topLeading) {
                ForEach(segments(in: w)) { seg in
                    Capsule()
                        .fill(seg.color)
                        .frame(width: seg.width, height: Self.trackHeight)
                        .offset(x: seg.x, y: 6)
                }
                RoundedRectangle(cornerRadius: 1)
                    .fill(NMColor.textPrimary)
                    .frame(width: 2, height: 15)
                    .offset(x: scale.fraction(of: value) * w - 1, y: 0)
                ForEach(scale.thresholds, id: \.self) { threshold in
                    Text(Self.format(threshold))
                        .font(NMFont.monoSM)
                        .foregroundStyle(NMColor.textTertiary)
                        .fixedSize()
                        .position(x: scale.fraction(of: threshold) * w, y: 24)
                }
            }
        }
        .frame(height: 32)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Scale from \(Self.format(scale.lowerBound)) to \(Self.format(scale.upperBound)), thresholds at \(scale.thresholds.map(Self.format).joined(separator: ", "))")
    }

    private func bandColor(_ level: CalculatorInterpretationLevel) -> Color {
        switch level {
        case .neutral: return NMColor.border
        case .caution: return NMColor.textQuaternary
        case .alert:   return NMColor.alertHigh
        }
    }

    private static func format(_ v: Double) -> String {
        v == v.rounded() ? String(format: "%.0f", v) : String(format: "%.1f", v)
    }
}
