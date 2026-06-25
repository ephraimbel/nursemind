import SwiftUI
import SwiftData

/// Lists the user's saved AI answers — newest first. Each row shows the
/// question (serif, 2-line truncated) and the relative saved date in mono.
/// Hairline-separated, no cards. Tap navigates to the detail view.
public struct SavedAnswersListView: View {
    @Query(sort: \SavedAnswer.savedAt, order: .reverse)
    private var savedAnswers: [SavedAnswer]
    @State private var searchText: String = ""

    public init() {}

    private var filteredAnswers: [SavedAnswer] {
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty else { return savedAnswers }
        return savedAnswers.filter { answer in
            if answer.question.lowercased().contains(q) { return true }
            if answer.answerMarkdown.lowercased().contains(q) { return true }
            if let title = answer.customTitle, title.lowercased().contains(q) { return true }
            return false
        }
    }

    private var isSearching: Bool {
        !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                header
                Hairline().padding(.vertical, NMSpace.xxl)
                if savedAnswers.isEmpty {
                    emptyState
                } else if filteredAnswers.isEmpty {
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
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: savedAnswers.count > 5 ? .always : .automatic), prompt: "Search saved")
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            EyebrowLabel("YOUR LIBRARY")
            Text("Saved").displayXL()
            Text(subtitle)
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
        }
    }

    private var subtitle: String {
        switch savedAnswers.count {
        case 0:  return "Nothing saved yet"
        case 1:  return "1 answer"
        default: return "\(savedAnswers.count) answers"
        }
    }

    private var emptyState: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("Saved answers will appear here.")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            Text("Tap the bookmark on any AI answer to save it.")
                .font(NMFont.body)
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.top, NMSpace.lg)
    }

    private var list: some View {
        VStack(spacing: 0) {
            ForEach(Array(filteredAnswers.enumerated()), id: \.element.id) { idx, answer in
                NavigationLink(value: LibraryDestination.savedEntry(answer.id)) {
                    SavedAnswerRow(answer: answer)
                }
                .buttonStyle(.plain)
                if idx < filteredAnswers.count - 1 {
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
    }

    private var noResultsState: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("No matches for “\(searchText)”")
                .font(NMFont.displayItalicMD)
                .foregroundStyle(NMColor.textSecondary)
            Text("Try a different keyword from the question or answer.")
                .font(NMFont.body)
                .foregroundStyle(NMColor.textTertiary)
        }
        .padding(.top, NMSpace.lg)
    }
}

private struct SavedAnswerRow: View {
    let answer: SavedAnswer

    var body: some View {
        HStack(alignment: .center, spacing: NMSpace.base) {
            VStack(alignment: .leading, spacing: 4) {
                Text(answer.displayTitle)
                    .font(NMFont.displaySM)
                    .foregroundStyle(NMColor.textPrimary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text(relativeDate)
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
        .contentShape(Rectangle())
    }

    private var relativeDate: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: answer.savedAt, relativeTo: Date())
    }
}
