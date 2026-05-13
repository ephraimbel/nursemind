import SwiftUI
import UIKit

/// Full-screen reading view for one Feed item. Lays out: eyebrow (category +
/// time + source) → headline → italic dek → body → references → "Ask
/// NurseMind about this" CTA.
///
/// On appear we fire `markRead` to update `feed_user_state.read_at`, used
/// downstream for unread-count badges and trending sort.
struct FeedReadingView: View {
    let item: FeedItem
    @Environment(\.openURL) private var openURL
    @State private var store = FeedStore.shared
    @State private var router = AppRouter.shared
    @State private var hasMarkedRead = false
    @State private var askSheetPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                eyebrow
                    .padding(.top, NMSpace.xxl)
                    .padding(.bottom, NMSpace.lg)

                Text(item.headline)
                    .font(NMFont.displayXL)
                    .tracking(-1.6)
                    .foregroundStyle(NMColor.textPrimary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, NMSpace.lg)

                Text(item.whyNursesCare)
                    .font(NMFont.displayItalicLG)
                    .foregroundStyle(NMColor.textSecondary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(3)
                    .padding(.bottom, NMSpace.xxl)

                Hairline()
                    .padding(.bottom, NMSpace.xxl)

                bodyView
                    .padding(.bottom, NMSpace.xxxl)

                Hairline()
                    .padding(.bottom, NMSpace.xxl)

                askCTA
                    .padding(.bottom, NMSpace.xxl)

                Hairline()
                    .padding(.bottom, NMSpace.xxl)

                citationsSection
                    .padding(.bottom, NMSpace.huge)
            }
            .padding(.horizontal, NMSpace.lg)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: toggleSave) {
                    Image(systemName: store.isSaved(item.id) ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(store.isSaved(item.id) ? NMColor.accent : NMColor.textSecondary)
                }
                .accessibilityLabel(store.isSaved(item.id) ? "Remove from saved" : "Save to library")
            }
        }
        .sheet(isPresented: $askSheetPresented) {
            FeedAIActionSheet(item: item)
        }
        .task {
            // Mark as read once per appearance so unread-count math stays clean.
            // Guard prevents re-firing if SwiftUI re-runs the task.
            guard !hasMarkedRead else { return }
            hasMarkedRead = true
            await store.markRead(item.id)
        }
    }

    // MARK: - Subviews

    private var eyebrow: some View {
        HStack(spacing: NMSpace.xs) {
            if item.priority == .urgent {
                Text("URGENT")
                    .font(NMFont.label)
                    .tracking(1.6)
                    .foregroundStyle(NMColor.accent)
                Text("·").foregroundStyle(NMColor.textTertiary)
            }
            Text(item.category.label.uppercased())
                .font(NMFont.label)
                .tracking(1.6)
                .foregroundStyle(NMColor.textTertiary)
            Text("·").foregroundStyle(NMColor.textTertiary)
            Text(absoluteDate(item.publishedAt).uppercased())
                .font(NMFont.label)
                .tracking(1.2)
                .foregroundStyle(NMColor.textTertiary)
        }
    }

    private var bodyView: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            ForEach(paragraphs, id: \.self) { para in
                Text(para)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineSpacing(6)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }

    private var askCTA: some View {
        Button {
            askSheetPresented = true
        } label: {
            HStack(spacing: NMSpace.sm) {
                Text("✦")
                    .font(.system(size: 15))
                    .foregroundStyle(NMColor.onAccent)
                Text("Ask NurseMind about this")
                    .font(NMFont.title)
                    .foregroundStyle(NMColor.onAccent)
                Spacer()
                Image(systemName: "arrow.right")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(NMColor.onAccent)
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.vertical, NMSpace.base)
            .frame(maxWidth: .infinity)
            .background(NMColor.accent)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
    }

    private var citationsSection: some View {
        VStack(alignment: .leading, spacing: NMSpace.lg) {
            EyebrowLabel("REFERENCES", sparkle: false)
            VStack(alignment: .leading, spacing: NMSpace.md) {
                ForEach(item.citations) { citation in
                    Button {
                        if let url = URL(string: citation.url) {
                            openURL(url)
                        }
                    } label: {
                        citationRow(citation)
                    }
                    .buttonStyle(.plain)
                    if citation.n != item.citations.last?.n {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
            }
        }
    }

    private func citationRow(_ c: FeedCitation) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.xs) {
            HStack(alignment: .firstTextBaseline, spacing: NMSpace.sm) {
                Text("[\(c.n)]")
                    .font(NMFont.mono)
                    .foregroundStyle(NMColor.link)
                VStack(alignment: .leading, spacing: NMSpace.xs) {
                    Text(c.source)
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textPrimary)
                    if !c.quote.isEmpty {
                        Text("\u{201C}\(c.quote)\u{201D}")
                            .font(NMFont.bodySM)
                            .italic()
                            .foregroundStyle(NMColor.textSecondary)
                            .lineSpacing(2)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 11))
                        Text(displayHost(for: c.url))
                            .font(NMFont.bodySM)
                    }
                    .foregroundStyle(NMColor.link)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, NMSpace.sm)
        .contentShape(Rectangle())
    }

    // MARK: - Helpers

    private var paragraphs: [String] {
        item.body
            .components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
    }

    private func displayHost(for urlString: String) -> String {
        URL(string: urlString)?.host ?? urlString
    }

    private func absoluteDate(_ date: Date) -> String {
        let fmt = DateFormatter()
        fmt.dateFormat = "MMM d, yyyy"
        return fmt.string(from: date)
    }

    private func toggleSave() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
        Task { await store.toggleSave(item.id) }
    }
}
