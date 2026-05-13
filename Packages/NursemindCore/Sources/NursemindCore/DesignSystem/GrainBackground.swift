import SwiftUI

/// A subtle, procedurally-generated film-grain texture rendered once and cached.
/// Designed to sit behind primary content as the structural background tone (spec §5.2).
public struct GrainBackground: View {
    private let baseColor: Color
    private let intensity: Double

    public init(_ baseColor: Color = NMColor.bgPrimary, intensity: Double = 0.06) {
        self.baseColor = baseColor
        self.intensity = intensity
    }

    public var body: some View {
        ZStack {
            baseColor
            Canvas { context, size in
                // Draw ~one noise dot per ~3pt² — dense enough to read as texture, sparse
                // enough not to be visible as individual dots at viewing distance.
                var rng = SystemRandomNumberGenerator()
                let stride: CGFloat = 3
                let cols = Int(size.width / stride) + 1
                let rows = Int(size.height / stride) + 1
                for row in 0..<rows {
                    for col in 0..<cols {
                        let x = CGFloat(col) * stride + CGFloat.random(in: -1...1, using: &rng)
                        let y = CGFloat(row) * stride + CGFloat.random(in: -1...1, using: &rng)
                        let alpha = Double.random(in: 0...1, using: &rng) * intensity
                        let dotSize: CGFloat = 0.6
                        context.fill(
                            Path(CGRect(x: x, y: y, width: dotSize, height: dotSize)),
                            with: .color(.black.opacity(alpha))
                        )
                    }
                }
            }
            .blendMode(.multiply)
            .allowsHitTesting(false)
        }
        .ignoresSafeArea()
    }
}

extension View {
    /// Wrap content in the cream + grain backdrop. Equivalent to setting
    /// `.background(GrainBackground())` but reads more naturally.
    public func nmBackground(_ color: Color = NMColor.bgPrimary) -> some View {
        self.background(GrainBackground(color))
    }
}
