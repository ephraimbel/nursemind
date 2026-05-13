import SwiftUI
import SwiftData

/// Sheet-presented list of past Ask conversations. Newest first, search
/// across the title (which is the user's first question, truncated).
/// Tap a row to resume the conversation in AskHomeView. Long-press to
/// delete (deferred — for v1, sliding deletion via `.swipeActions` is
/// sufficient).
public struct ConversationHistoryView: View {
    let onResume: (AskConversation) -> Void

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @Query(sort: \StoredConversation.lastUpdatedAt, order: .reverse)
    private var conversations: [StoredConversation]

    @State private var searchText: String = ""

    public init(onResume: @escaping (AskConversation) -> Void) {
        self.onResume = onResume
    }

    private var filtered: [StoredConversation] {
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty else { return conversations }
        return conversations.filter { $0.title.lowercased().contains(q) }
    }

    public var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    header
                    Hairline().padding(.vertical, NMSpace.xxl)
                    if conversations.isEmpty {
                        emptyState
                    } else if filtered.isEmpty {
                        noResultsState
                    } else {
                        list
                    }
                }
                .padding(.horizontal, NMSpace.lg)
                .padding(.top, NMSpace.xxl)
                .padding(.bottom, NMSpace.huge)
            }
            .background(GrainBackground())
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: conversations.count > 5 ? .always : .automatic),
                prompt: "Search conversations"
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        Haptic.light()
                        dismiss()
                    }
                    .foregroundStyle(NMColor.textPrimary)
                }
            }
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("YOUR HISTORY", sparkle: false)
            Text("Conversations").displayXL()
            Text(subtitle)
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
    }

    private var subtitle: String {
        switch conversations.count {
        case 0:  return "Nothing here yet"
        case 1:  return "1 conversation"
        default: return "\(conversations.count) conversations"
        }
    }

    // MARK: - Empty / no-results

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("Past conversations will appear here.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            Text("Ask NurseMind anything — your threads will be saved automatically.")
                .font(NMFont.body)
                .foregroundStyle(NMColor.textTertiary)
                .lineSpacing(2)
        }
        .padding(.top, NMSpace.lg)
    }

    private var noResultsState: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("No matches for \u{201C}\(searchText)\u{201D}")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            Text("Try a different keyword from your past questions.")
                .font(NMFont.body)
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.top, NMSpace.lg)
    }

    // MARK: - List

    private var list: some View {
        VStack(spacing: 0) {
            ForEach(Array(filtered.enumerated()), id: \.element.id) { idx, stored in
                Button {
                    handleResume(stored)
                } label: {
                    ConversationHistoryRow(stored: stored)
                }
                .buttonStyle(PressableButtonStyle())
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(role: .destructive) {
                        delete(stored)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                if idx < filtered.count - 1 {
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
    }

    // MARK: - Actions

    private func handleResume(_ stored: StoredConversation) {
        guard let conversation = stored.toAskConversation() else { return }
        Haptic.light()
        onResume(conversation)
        dismiss()
    }

    private func delete(_ stored: StoredConversation) {
        Haptic.medium()
        modelContext.delete(stored)
        try? modelContext.save()
    }
}

// MARK: - Row

private struct ConversationHistoryRow: View {
    let stored: StoredConversation

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 4) {
                Text(stored.title)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                HStack(spacing: NMSpace.xs) {
                    Text(relativeDate)
                    Text("·")
                    Text("\(stored.messageCount) \(stored.messageCount == 1 ? "message" : "messages")")
                }
                .font(NMFont.monoSM)
                .foregroundStyle(NMColor.textTertiary)
            }
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(NMColor.accent)
        }
        .padding(.vertical, NMSpace.base)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var relativeDate: String {
        let f = RelativeDateTimeFormatter()
        f.unitsStyle = .abbreviated
        return f.localizedString(for: stored.lastUpdatedAt, relativeTo: Date())
    }
}
