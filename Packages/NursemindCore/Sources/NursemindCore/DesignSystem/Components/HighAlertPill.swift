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

/// Subordinate to `HighAlertPill` by construction: outline only, no fill, and
/// the neutral text tone rather than terracotta. A drug that is dangerous but
/// not ISMP-listed should read as a caution, not as the same warning — if both
/// looked alike, the ISMP signal would be worth less.
public struct HighRiskPill: View {
    public init() {}

    public var body: some View {
        Text("HIGH-RISK")
            .font(NMFont.labelSM)
            .tracking(1.5)
            .foregroundStyle(NMColor.textSecondary)
            .padding(.horizontal, 11)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(NMColor.border, lineWidth: 1)
            )
    }
}

#Preview {
    VStack(alignment: .leading, spacing: NMSpace.md) {
        HighAlertPill()
        HighRiskPill()
    }
    .padding(NMSpace.lg)
    .background(NMColor.bgPrimary)
}
