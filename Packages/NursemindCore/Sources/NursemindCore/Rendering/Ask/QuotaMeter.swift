import SwiftUI

/// Tiny visual indicator of "questions left today" on the Ask home empty
/// state. Replaces the prior plain text line for the free tier — three
/// small accent dots that fade to borderSubtle as questions are spent.
///
/// Pro tier (50 questions/day) is handled with the legacy text rendering
/// because a 50-dot strip is illegible and looks like spam. The threshold
/// at which we switch to text is configurable; the call-site decides.
///
/// At zero remaining the dots stay rendered in the muted color so the
/// shape is visible at-a-glance — the call-site is responsible for
/// surfacing the upgrade affordance (the existing `quotaLine` already
/// does this with an inline "Upgrade" button).
struct QuotaMeter: View {
    let remaining: Int
    let total: Int
    /// Suffix label after the dots. "today" for Pro daily quota, "free"
    /// for the free lifetime trial. Default kept as "today" so the Pro
    /// fallback path doesn't break, but free callers pass "free" to
    /// reflect lifetime semantics.
    let suffix: String

    init(remaining: Int, total: Int, suffix: String = "today") {
        self.remaining = remaining
        self.total = total
        self.suffix = suffix
    }

    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<total, id: \.self) { i in
                Circle()
                    .fill(i < remaining ? NMColor.accent : NMColor.borderSubtle)
                    .frame(width: 6, height: 6)
                    .accessibilityHidden(true)
            }
            Text(suffix)
                .font(NMFont.displayItalicSM)
                .foregroundStyle(NMColor.textTertiary)
                .padding(.leading, 2)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityLabel)
    }

    private var accessibilityLabel: String {
        let context = suffix == "free" ? "free questions" : "questions \(suffix)"
        if remaining == 0 { return "No \(context) left" }
        if remaining == 1 { return "1 of \(total) \(context) left" }
        return "\(remaining) of \(total) \(context) left"
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 16) {
        QuotaMeter(remaining: 3, total: 3)
        QuotaMeter(remaining: 2, total: 3)
        QuotaMeter(remaining: 1, total: 3)
        QuotaMeter(remaining: 0, total: 3)
    }
    .padding()
    .background(NMColor.bgPrimary)
}
