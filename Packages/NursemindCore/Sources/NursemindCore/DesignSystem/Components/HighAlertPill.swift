import SwiftUI

public struct HighAlertPill: View {
    public init() {}

    public var body: some View {
        Text("HIGH-ALERT MEDICATION")
            .font(NMFont.labelSM)
            .tracking(1.5)
            .foregroundStyle(NMColor.alertHigh)
            .padding(.horizontal, 11)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(NMColor.alertHighBg)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(NMColor.alertHighBorder, lineWidth: 1)
                    )
            )
    }
}

#Preview {
    HighAlertPill()
        .padding(NMSpace.lg)
        .background(NMColor.bgPrimary)
}
