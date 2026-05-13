import SwiftUI

public struct EyebrowLabel: View {
    private let text: String
    private let showSparkle: Bool

    public init(_ text: String, sparkle: Bool = true) {
        self.text = text
        self.showSparkle = sparkle
    }

    public var body: some View {
        HStack(spacing: 6) {
            if showSparkle {
                Text("✦")
                    .font(NMFont.label)
                    .foregroundStyle(NMColor.textTertiary)
            }
            Text(text.uppercased())
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(NMColor.textTertiary)
        }
    }
}

#Preview {
    EyebrowLabel("DRUG · VASOPRESSOR")
        .padding(NMSpace.lg)
        .background(NMColor.bgPrimary)
}
