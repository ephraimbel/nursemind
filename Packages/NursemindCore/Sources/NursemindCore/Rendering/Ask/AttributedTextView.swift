import SwiftUI
import UIKit

/// SwiftUI's `Text(AttributedString)` silently drops `NSTextAttachment` runs,
/// so inline citation pills rendered as image attachments don't show up. This
/// `UITextView` wrapper preserves them and forwards link taps to a closure so
/// the citation popover still works.
struct AttributedTextView: UIViewRepresentable {
    let attributed: NSAttributedString
    let onLinkTap: (URL) -> Void

    func makeUIView(context: Context) -> WrappingTextView {
        let view = WrappingTextView()
        view.delegate = context.coordinator
        view.isScrollEnabled = false
        view.isEditable = false
        view.isSelectable = true
        view.dataDetectorTypes = []
        view.backgroundColor = .clear
        view.textContainerInset = .zero
        view.textContainer.lineFragmentPadding = 0
        view.adjustsFontForContentSizeCategory = true
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        view.setContentHuggingPriority(.required, for: .vertical)
        return view
    }

    func updateUIView(_ uiView: WrappingTextView, context: Context) {
        if uiView.attributedText != attributed {
            uiView.attributedText = attributed
            uiView.invalidateIntrinsicContentSize()
        }
        context.coordinator.onLinkTap = onLinkTap
    }

    func sizeThatFits(_ proposal: ProposedViewSize, uiView: WrappingTextView, context: Context) -> CGSize? {
        let width = proposal.width ?? UIView.layoutFittingCompressedSize.width
        let target = CGSize(width: width, height: .greatestFiniteMagnitude)
        let fitted = uiView.sizeThatFits(target)
        return CGSize(width: width, height: ceil(fitted.height))
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(onLinkTap: onLinkTap)
    }

    final class Coordinator: NSObject, UITextViewDelegate {
        var onLinkTap: (URL) -> Void
        init(onLinkTap: @escaping (URL) -> Void) { self.onLinkTap = onLinkTap }

        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            onLinkTap(URL)
            return false
        }
    }
}

/// UITextView subclass that reports its content size as `intrinsicContentSize`
/// so it lays out cleanly inside SwiftUI stacks without scrolling.
final class WrappingTextView: UITextView {
    override var intrinsicContentSize: CGSize {
        let width = bounds.width > 0 ? bounds.width : UIView.noIntrinsicMetric
        guard width > 0 else { return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric) }
        let fitted = sizeThatFits(CGSize(width: width, height: .greatestFiniteMagnitude))
        return CGSize(width: UIView.noIntrinsicMetric, height: ceil(fitted.height))
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        invalidateIntrinsicContentSize()
    }
}
