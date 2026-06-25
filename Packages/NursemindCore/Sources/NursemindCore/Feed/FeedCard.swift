import SwiftUI

/// One row in the Feed list. Two visual modes:
/// - **Lead** (`isLead = true`): displayLG headline + displayItalicLG dek +
///   generous padding. Used for the day's headlining item (first urgent if
///   any exist, otherwise the most recent). One per list.
/// - **Standard** (`isLead = false`): displayMD headline + displayItalicSM
///   dek + compact padding. Every other item.
///
/// Both modes share the same eyebrow, urgent rail, and saved indicator.
struct FeedCard: View {
    let item: FeedItem
    let isSaved: Bool
    let isLead: Bool

    init(item: FeedItem, isSaved: Bool, isLead: Bool = false) {
        self.item = item
        self.isSaved = isSaved
        self.isLead = isLead
    }

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(spacing: NMSpace.xs) {
                if item.priority == .urgent {
                    Rectangle()
                        .fill(NMColor.accent)
                        .frame(width: isLead ? 4 : 3)
                        .frame(maxHeight: .infinity)
                        .padding(.trailing, NMSpace.xs)
                }
                VStack(alignment: .leading, spacing: isLead ? NMSpace.lg : NMSpace.md) {
                    eyebrow
                    Text(item.headline)
                        .font(isLead ? NMFont.displayLG : NMFont.displayMD)
                        .tracking(isLead ? -1.2 : -0.6)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineLimit(isLead ? 4 : 3)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(item.whyNursesCare)
                        .font(isLead ? NMFont.displayItalicLG : NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineLimit(isLead ? 4 : 3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(isLead ? 4 : 2)
                        .fixedSize(horizontal: false, vertical: true)
                    if isSaved {
                        HStack(spacing: 4) {
                            Image(systemName: "bookmark.fill")
                                .font(.system(size: 11))
                                .foregroundStyle(NMColor.accent)
                            Text("Saved")
                                .font(NMFont.labelSM)
                                .tracking(1.2)
                                .textCase(.uppercase)
                                .foregroundStyle(NMColor.accent)
                        }
                        .padding(.top, NMSpace.xs)
                    }
                }
            }
        }
        .padding(.vertical, isLead ? NMSpace.xxl : NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onAppear { FeedStore.shared.bumpEngagement(item.id, .view) }
    }

    private var eyebrow: some View {
        HStack(spacing: NMSpace.xs) {
            // URGENT first on lead cards only — standard urgent cards rely on
            // the accent rail alone so their eyebrow stays tight. Lead cards
            // have the room and benefit from explicit labeling since they're
            // the day's headlining story.
            if isLead && item.priority == .urgent {
                Text("URGENT")
                    .font(NMFont.label)
                    .tracking(1.6)
                    .foregroundStyle(NMColor.accent)
                dot
            }
            Text(item.authorityLabel)
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(item.authorityColor)
            dot
            Text(item.category.label.uppercased())
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(NMColor.textTertiary)
                .lineLimit(1)
            dot
            Text(formattedAge(item.displayDate))
                .font(NMFont.label)
                .tracking(1.2)
                .foregroundStyle(NMColor.textTertiary)
                .lineLimit(1)
            dot
            Text("\(item.readMinutes) MIN")
                .font(NMFont.label)
                .tracking(1.2)
                .foregroundStyle(NMColor.textTertiary)
                .lineLimit(1)
        }
    }

    private var dot: some View {
        Text("·")
            .font(NMFont.label)
            .foregroundStyle(NMColor.textQuaternary)
    }

    private func formattedAge(_ date: Date) -> String {
        // Compact forms ("3H" not "3H AGO", "2D" not "2D AGO") so the eyebrow
        // fits on a single line in iPad iPhone-compatibility mode where the
        // window pt-width is narrower than the smallest iPhone (iPhone 16e).
        let interval = Date().timeIntervalSince(date)
        let minutes = Int(interval / 60)
        let hours = minutes / 60
        let days = hours / 24
        switch (days, hours, minutes) {
        case (0, 0, 0..<2):           return "NEW"
        case (0, 0, let m):           return "\(m)M"
        case (0, let h, _):           return "\(h)H"
        case (1, _, _):               return "1D"
        case (2...6, _, _):           return "\(days)D"
        default:
            let fmt = DateFormatter()
            fmt.dateFormat = "MMM d"
            return fmt.string(from: date).uppercased()
        }
    }
}
