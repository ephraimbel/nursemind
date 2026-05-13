import SwiftUI

public struct SectionHeader: View {
    private let title: String

    public init(_ title: String) {
        self.title = title
    }

    public var body: some View {
        Text(title)
            .displayMD()
            .padding(.top, NMSpace.xxl)
            .padding(.bottom, NMSpace.lg - 2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 0) {
        SectionHeader("Quick reference")
        Text("Body text goes here, set in 17pt Inter with generous line-height.")
            .bodyText()
        SectionHeader("Dosing")
        Text("More body text.").bodyText()
    }
    .padding(NMSpace.lg)
    .background(NMColor.bgPrimary)
}
