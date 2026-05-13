import SwiftUI

/// One row in the Feed list. Editorial layout: eyebrow (category + source +
/// time) → headline (serif display) → why-nurses-care (italic subtitle).
/// Tap target is the whole row; trailing chevron is implicit via NavigationLink.
struct FeedCard: View {
    let item: FeedItem
    let isSaved: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack(spacing: NMSpace.xs) {
                if item.priority == .urgent {
                    Rectangle()
                        .fill(NMColor.accent)
                        .frame(width: 3)
                        .frame(maxHeight: .infinity)
                        .padding(.trailing, NMSpace.xs)
                }
                VStack(alignment: .leading, spacing: NMSpace.md) {
                    eyebrow
                    Text(item.headline)
                        .font(NMFont.displayMD)
                        .tracking(-0.6)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                    Text(item.whyNursesCare)
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(2)
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
        .padding(.vertical, NMSpace.lg)
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }

    private var eyebrow: some View {
        HStack(spacing: NMSpace.xs) {
            Text(item.authorityLabel)
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(NMColor.sourceFDA)
            Text("·")
                .font(NMFont.label)
                .foregroundStyle(NMColor.textQuaternary)
            Text(item.category.label.uppercased())
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(NMColor.textTertiary)
            Text("·")
                .font(NMFont.label)
                .foregroundStyle(NMColor.textQuaternary)
            Text(formattedAge(item.publishedAt))
                .font(NMFont.label)
                .tracking(1.2)
                .foregroundStyle(NMColor.textTertiary)
        }
    }

    private func formattedAge(_ date: Date) -> String {
        let interval = Date().timeIntervalSince(date)
        let minutes = Int(interval / 60)
        let hours = minutes / 60
        let days = hours / 24
        switch (days, hours, minutes) {
        case (0, 0, 0..<2):           return "JUST NOW"
        case (0, 0, let m):           return "\(m)M AGO"
        case (0, let h, _):           return "\(h)H AGO"
        case (1, _, _):               return "YESTERDAY"
        case (2...6, _, _):           return "\(days)D AGO"
        default:
            let fmt = DateFormatter()
            fmt.dateFormat = "MMM d"
            return fmt.string(from: date).uppercased()
        }
    }
}
