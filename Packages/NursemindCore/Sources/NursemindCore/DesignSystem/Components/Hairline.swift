import SwiftUI

public struct Hairline: View {
    private let color: Color

    public init(color: Color = NMColor.border) {
        self.color = color
    }

    public var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: 1)
    }
}

#Preview {
    VStack(spacing: NMSpace.lg) {
        Text("Above").bodyText()
        Hairline()
        Text("Below").bodyText()
    }
    .padding(NMSpace.lg)
    .background(NMColor.bgPrimary)
}
