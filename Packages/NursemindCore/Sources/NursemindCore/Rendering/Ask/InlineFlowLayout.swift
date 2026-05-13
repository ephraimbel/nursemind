import SwiftUI

/// SwiftUI Layout that flows children left-to-right and wraps when running out of width.
/// Used for paragraphs that mix text segments with inline citation pills.
///
/// Implementation note: each subview is measured against the REMAINING width on the
/// current row. If the result fits, place it on the same row. If not, wrap to a new
/// row and re-measure with full width. This is critical for multi-line Text — without
/// re-measuring on wrap, text can overflow into adjacent items.
public struct InlineFlowLayout: Layout {
    public var horizontalSpacing: CGFloat = 4
    public var verticalSpacing: CGFloat = 6

    public init(horizontalSpacing: CGFloat = 4, verticalSpacing: CGFloat = 6) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }

    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var totalHeight: CGFloat = 0
        var rowHeight: CGFloat = 0
        var rowWidth: CGFloat = 0

        for subview in subviews {
            let isFirstOnRow = rowWidth == 0
            let proposeWidth: CGFloat = isFirstOnRow ? maxWidth : max(0, maxWidth - rowWidth - horizontalSpacing)
            let trial = subview.sizeThatFits(ProposedViewSize(width: proposeWidth, height: nil))

            let nextWidth = rowWidth + (isFirstOnRow ? 0 : horizontalSpacing) + trial.width
            if nextWidth > maxWidth + 0.5 && !isFirstOnRow {
                // Wrap to next row.
                totalHeight += rowHeight + verticalSpacing
                let fresh = subview.sizeThatFits(ProposedViewSize(width: maxWidth, height: nil))
                rowHeight = fresh.height
                rowWidth = fresh.width
            } else {
                rowWidth = nextWidth
                rowHeight = max(rowHeight, trial.height)
            }
        }
        totalHeight += rowHeight
        return CGSize(width: maxWidth, height: totalHeight)
    }

    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let maxWidth = bounds.width
        var x: CGFloat = bounds.minX
        var y: CGFloat = bounds.minY
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let isFirstOnRow = (x == bounds.minX)
            let proposeWidth: CGFloat = isFirstOnRow ? maxWidth : max(0, bounds.maxX - x - horizontalSpacing)
            var size = subview.sizeThatFits(ProposedViewSize(width: proposeWidth, height: nil))

            let placeX = isFirstOnRow ? x : x + horizontalSpacing
            let endX = placeX + size.width
            if endX > bounds.maxX + 0.5 && !isFirstOnRow {
                // Wrap.
                x = bounds.minX
                y += rowHeight + verticalSpacing
                rowHeight = 0
                size = subview.sizeThatFits(ProposedViewSize(width: maxWidth, height: nil))
                subview.place(
                    at: CGPoint(x: x, y: y),
                    anchor: .topLeading,
                    proposal: ProposedViewSize(width: size.width, height: size.height)
                )
                x += size.width
            } else {
                subview.place(
                    at: CGPoint(x: placeX, y: y),
                    anchor: .topLeading,
                    proposal: ProposedViewSize(width: size.width, height: size.height)
                )
                x = endX
            }
            rowHeight = max(rowHeight, size.height)
        }
    }
}
