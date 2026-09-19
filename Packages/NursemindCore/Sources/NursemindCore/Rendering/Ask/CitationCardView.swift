import SwiftUI

public struct CitationCardView: View {
    let citations: [CitationSource]
    /// The line the nurse tapped from, so the card can point at the passage
    /// that supports it instead of the whole answer.
    let claim: String?
    let libraryEntryIDs: [String]
    @State private var selectedNumber: Int?
    @State private var presentedEntry: LibraryEntry?
    @Environment(\.dismiss) private var dismiss

    public init(number: Int, citations: [CitationSource], claim: String? = nil, libraryEntryIDs: [String] = []) {
        self.citations = citations
        self.claim = claim
        self.libraryEntryIDs = libraryEntryIDs
        _selectedNumber = State(initialValue: citations.indices.contains(number - 1) ? number : nil)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
            HStack {
                Text(selectedNumber == nil ? "References" : "Reference")
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textSecondary)
                Spacer()
                if selectedNumber != nil, citations.count > 1 {
                    Button("See All (\(citations.count))") {
                        withAnimation { selectedNumber = nil }
                    }
                    .foregroundStyle(NMColor.link)
                }
                Button("Done") { dismiss() }
                    .foregroundStyle(NMColor.textSecondary)
            }
            .font(NMFont.bodySM)
            ScrollView {
                VStack(alignment: .leading, spacing: NMSpace.lg) {
                    if let number = selectedNumber, citations.indices.contains(number - 1) {
                        sourceDetail(citations[number - 1], number: number)
                    } else {
                        ForEach(Array(citations.enumerated()), id: \.offset) { index, source in
                            if index > 0 { Hairline() }
                            Button {
                                selectedNumber = index + 1
                            } label: {
                                HStack(alignment: .top, spacing: NMSpace.sm) {
                                    Text("\(index + 1).")
                                    Text(source.shortName).multilineTextAlignment(.leading)
                                    Spacer(minLength: 0)
                                    Image(systemName: "chevron.right")
                                }
                                .font(NMFont.body)
                                .foregroundStyle(NMColor.link)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .contentShape(Rectangle())
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .id(selectedNumber)
        }
        .padding(NMSpace.lg)
        .background(NMColor.bgElevated)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
        .presentationBackground(NMColor.bgElevated)
        .sheet(item: $presentedEntry) { entry in
            NavigationStack {
                LibraryEntryView(entry)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Done") { presentedEntry = nil }
                                .foregroundStyle(NMColor.accent)
                        }
                    }
            }
        }
    }

    private func sourceDetail(_ source: CitationSource, number: Int) -> some View {
        let evidence = source.answerEvidence
        let ranked = Self.rankedPassages(evidence?.passages ?? [], for: claim)
        let highlighted = claim == nil ? nil : ranked.first(where: { $0.score > 0 })
        return VStack(alignment: .leading, spacing: NMSpace.md) {
            Text("\(number). \(source.shortName)")
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
            if let line = source.referenceFormattedLine {
                Text(line).font(NMFont.bodySM).foregroundStyle(NMColor.textSecondary)
            }
            if !source.lastRetrieved.isEmpty {
                Text("Retrieved \(source.lastRetrieved)")
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textSecondary)
            }
            if let claim, !claim.isEmpty {
                VStack(alignment: .leading, spacing: NMSpace.xs) {
                    EyebrowLabel("For this line", sparkle: false)
                    Text(claim)
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineSpacing(3)
                }
                .padding(.top, NMSpace.xs)
            }
            if let highlighted {
                VStack(alignment: .leading, spacing: NMSpace.xs) {
                    EyebrowLabel("Supporting passage", sparkle: false)
                    Text(highlighted.text)
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textPrimary)
                        .lineSpacing(3)
                        .textSelection(.enabled)
                        .padding(.leading, NMSpace.md)
                        .overlay(alignment: .leading) {
                            Rectangle().fill(NMColor.link).frame(width: 2)
                        }
                }
            }
            HStack(spacing: NMSpace.lg) {
                if let entry = libraryEntry(for: source) {
                    Button {
                        Haptic.light()
                        presentedEntry = entry
                    } label: {
                        Label("Open in Library", systemImage: "books.vertical")
                            .font(NMFont.body)
                            .foregroundStyle(NMColor.link)
                    }
                    .buttonStyle(.plain)
                }
                if let url = URL(string: source.url) {
                    Link(destination: url) {
                        Label("Open original source", systemImage: "arrow.up.right")
                            .font(NMFont.body)
                            .foregroundStyle(NMColor.link)
                    }
                }
            }
            if let evidence, !evidence.passages.isEmpty {
                let others = ranked.filter { $0.text != highlighted?.text }
                if !others.isEmpty {
                    Hairline()
                    Text(highlighted == nil
                         ? (evidence.origin == .retrievedSource ? "Retrieved source passages" : "Library passages used")
                         : "Other passages from this source")
                        .font(NMFont.title)
                    if highlighted == nil {
                        Text(evidence.origin == .librarySummary
                             ? "NurseMind summaries attributed to this source. Open the original to check the full context."
                             : "Passages supplied for this answer. Open the original for the full context.")
                            .font(NMFont.bodySM)
                            .foregroundStyle(NMColor.textSecondary)
                    }
                    ForEach(Array(others.enumerated()), id: \.offset) { index, passage in
                        if index > 0 { Hairline() }
                        Text(passage.text)
                            .font(NMFont.body)
                            .foregroundStyle(highlighted == nil ? NMColor.textPrimary : NMColor.textSecondary)
                            .textSelection(.enabled)
                    }
                }
            }
            Hairline()
            Text(source.licenseDisplayName)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
        }
    }

    /// The grounded entry this source belongs to, matched by the title the
    /// retrieval context carried, so the card can open it in one tap.
    private func libraryEntry(for source: CitationSource) -> LibraryEntry? {
        guard let titles = source.answerEvidence?.entryTitles, !titles.isEmpty else { return nil }
        let entries = libraryEntryIDs.compactMap { ContentRegistry.shared.entry(byID: $0) }
        return entries.first { titles.contains($0.title) }
    }

    struct RankedPassage: Equatable { let text: String; let score: Int }

    /// Passages ordered by how much of the claim they share: whole numbers
    /// and units count three times a word, so "3.5 mEq/L" finds its row.
    nonisolated static func rankedPassages(_ passages: [String], for claim: String?) -> [RankedPassage] {
        guard let claim, !claim.isEmpty else { return passages.map { .init(text: $0, score: 0) } }
        let claimWords = Set(words(in: claim))
        let claimNumbers = Set(numbers(in: claim))
        let scored = passages.map { passage -> RankedPassage in
            let overlap = Set(words(in: passage)).intersection(claimWords).count
            let numeric = Set(numbers(in: passage)).intersection(claimNumbers).count
            return .init(text: passage, score: overlap + 3 * numeric)
        }
        return scored.enumerated().sorted { a, b in
            a.element.score == b.element.score ? a.offset < b.offset : a.element.score > b.element.score
        }.map(\.element)
    }

    nonisolated private static let stopWords: Set<String> = ["the", "and", "for", "with", "that", "this", "from", "are", "was", "were", "has", "have", "not", "but", "its", "into", "than", "when", "which", "their", "your", "you", "can", "may", "per", "after", "before"]

    nonisolated private static func words(in text: String) -> [String] {
        text.lowercased().split { !$0.isLetter }.map(String.init).filter { $0.count >= 3 && !stopWords.contains($0) }
    }

    nonisolated private static func numbers(in text: String) -> [String] {
        let ns = text as NSString
        guard let regex = try? NSRegularExpression(pattern: #"\d+(?:[.,]\d+)?"#) else { return [] }
        return regex.matches(in: text, range: NSRange(location: 0, length: ns.length)).map { ns.substring(with: $0.range) }
    }
}
