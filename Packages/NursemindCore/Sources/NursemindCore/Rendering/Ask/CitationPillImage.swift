import SwiftUI
import UIKit

/// Renders a CitationSource into an inline pill image (rounded tan background,
/// publisher logo dot, source name). Used as an `NSTextAttachment` so the pill
/// flows naturally with surrounding text and wraps cleanly at line breaks.
enum CitationPillImage {

    static func render(for source: CitationSource, extras: Int = 0, scale: CGFloat = 3) -> UIImage {
        let label = source.pillTitle
        let extrasLabel = extras > 0 ? " +\(extras)" : ""

        let textFont = UIFont.systemFont(ofSize: 11, weight: .semibold)
        let labelText = label + extrasLabel
        let textSize = (labelText as NSString).size(withAttributes: [.font: textFont])

        let dotDiameter: CGFloat = 12
        let leftPad: CGFloat = 6
        let rightPad: CGFloat = 8
        let dotToText: CGFloat = 5
        let verticalPad: CGFloat = 4

        let contentHeight = max(dotDiameter, textSize.height)
        let height = contentHeight + verticalPad * 2
        let width = leftPad + dotDiameter + dotToText + textSize.width + rightPad

        let format = UIGraphicsImageRendererFormat.default()
        format.scale = scale
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: format)

        return renderer.image { _ in
            let bgRect = CGRect(x: 0.5, y: 0.5, width: width - 1, height: height - 1)
            let bgPath = UIBezierPath(roundedRect: bgRect, cornerRadius: height / 2)

            // Pale sage-green tint fill (matches NMColor.linkBg light value 0xE8F0E5).
            UIColor(red: 0.910, green: 0.941, blue: 0.898, alpha: 1).setFill()
            bgPath.fill()

            // Deep emerald stroke (matches NMColor.link light value 0x1F6B3D).
            UIColor(red: 0.122, green: 0.420, blue: 0.239, alpha: 1).setStroke()
            bgPath.lineWidth = 1.0
            bgPath.stroke()

            // Logo dot
            let dotRect = CGRect(
                x: leftPad,
                y: (height - dotDiameter) / 2,
                width: dotDiameter,
                height: dotDiameter
            )
            uiColor(for: source).setFill()
            UIBezierPath(ovalIn: dotRect).fill()

            // Logo glyph (single letter or symbol) inside dot
            if let glyph = logoGlyph(for: source) {
                let glyphFont = UIFont.systemFont(ofSize: 7.5, weight: .heavy)
                let glyphAttrs: [NSAttributedString.Key: Any] = [
                    .font: glyphFont,
                    .foregroundColor: UIColor.white
                ]
                let glyphSize = (glyph as NSString).size(withAttributes: glyphAttrs)
                let glyphPoint = CGPoint(
                    x: dotRect.midX - glyphSize.width / 2,
                    y: dotRect.midY - glyphSize.height / 2
                )
                (glyph as NSString).draw(at: glyphPoint, withAttributes: glyphAttrs)
            }

            // Pill label — link color (matches NMColor.link light value 0x1F6B3D).
            let textAttrs: [NSAttributedString.Key: Any] = [
                .font: textFont,
                .foregroundColor: UIColor(red: 0.122, green: 0.420, blue: 0.239, alpha: 1)
            ]
            let textPoint = CGPoint(
                x: leftPad + dotDiameter + dotToText,
                y: (height - textSize.height) / 2
            )
            (labelText as NSString).draw(at: textPoint, withAttributes: textAttrs)
        }
    }

    /// Source-type tone for the dot inside the pill. Values mirror the
    /// `NMColor.source*` light-mode hex tokens so this static-image renderer
    /// stays in sync with the SwiftUI design system. ISMP reuses alertHigh,
    /// "other" falls back to neutral gray.
    private static func uiColor(for source: CitationSource) -> UIColor {
        switch source.sourceType {
        case .fdaLabel:            return UIColor(red: 0.184, green: 0.302, blue: 0.420, alpha: 1)  // sourceFDA #2F4D6B
        case .agency:              return UIColor(red: 0.361, green: 0.420, blue: 0.486, alpha: 1)  // sourceAgency #5C6B7C
        case .practiceGuideline:   return UIColor(red: 0.310, green: 0.365, blue: 0.447, alpha: 1)  // sourceGuideline #4F5D72
        case .journal:             return UIColor(red: 0.420, green: 0.271, blue: 0.333, alpha: 1)  // sourceJournal #6B4555
        case .professionalSociety: return UIColor(red: 0.361, green: 0.322, blue: 0.471, alpha: 1)  // sourceSociety #5C5278
        case .textbook:            return UIColor(red: 0.478, green: 0.353, blue: 0.251, alpha: 1)  // sourceTextbook #7A5A40
        case .ismp:                return UIColor(red: 0.545, green: 0.196, blue: 0.125, alpha: 1)  // alertHigh #8B3220
        case .other:               return UIColor.systemGray
        }
    }

    /// One-letter glyph rendered inside the colored dot. Keeps the pill compact
    /// while still hinting at the source type (F for FDA, ! for ISMP, etc.).
    private static func logoGlyph(for source: CitationSource) -> String? {
        switch source.sourceType {
        case .fdaLabel:            return "F"
        case .ismp:                return "!"
        case .agency:              return "+"
        case .practiceGuideline:   return "G"
        case .journal:             return "J"
        case .professionalSociety: return "S"
        case .textbook:            return "📖" == nil ? "B" : "B"
        case .other:               return nil
        }
    }
}
