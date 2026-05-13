import SwiftUI

/// The Nursemind wordmark — rendered from the master PNG bundled in the
/// Core package's asset catalog as a template (white-on-clear) image, then
/// tinted with the accent color so it adapts to light/dark mode and any
/// brand-color refresh without re-exporting artwork.
///
/// `size` matches the *visible text cap-height* (the height of the "n" /
/// "u" / "r" letterforms). The total rendered image box is taller than
/// this because the master artwork includes the floating sparkle above
/// the wordmark plus baseline padding below.
public struct NursemindLogo: View {
    public var size: CGFloat
    public var color: Color

    /// Master artwork aspect ratio (width / height): 1983 × 793 ≈ 2.50.
    private static let aspectRatio: CGFloat = 1983.0 / 793.0

    /// Fraction of the master artwork's vertical span occupied by the
    /// visible "n" cap-height. The remainder is the floating sparkle and
    /// baseline padding. Measured from the source PNG.
    private static let textBandRatio: CGFloat = 0.52

    public init(
        size: CGFloat = 32,
        color: Color = NMColor.accent
    ) {
        self.size = size
        self.color = color
    }

    public var body: some View {
        let imageHeight = size / Self.textBandRatio
        let imageWidth = imageHeight * Self.aspectRatio
        return Image("NursemindWordmark", bundle: .module)
            .renderable
            .resizable()
            .scaledToFit()
            .frame(width: imageWidth, height: imageHeight)
            .foregroundStyle(color)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Nursemind")
    }
}

private extension Image {
    /// Compatibility shim: `renderingMode(.template)` returns `Image`, but
    /// chaining `.resizable()` after it requires it to stay an `Image`.
    var renderable: Image { self.renderingMode(.template) }
}

#Preview("Light · 80pt") {
    NursemindLogo(size: 80)
        .padding(NMSpace.xxl)
        .background(NMColor.bgPrimary)
}

#Preview("Light · 48pt") {
    NursemindLogo(size: 48)
        .padding(NMSpace.xxl)
        .background(NMColor.bgPrimary)
}

#Preview("Dark · 80pt") {
    NursemindLogo(size: 80)
        .padding(NMSpace.xxl)
        .background(NMColor.bgPrimary)
        .preferredColorScheme(.dark)
}
