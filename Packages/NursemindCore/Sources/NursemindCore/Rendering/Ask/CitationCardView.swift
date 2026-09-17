import SwiftUI

public struct CitationCardView: View {
    let citations: [CitationSource]
    @State private var selectedNumber: Int?
    @Environment(\.dismiss) private var dismiss

    public init(number: Int, citations: [CitationSource]) {
        self.citations = citations
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
    }

    private func sourceDetail(_ source: CitationSource, number: Int) -> some View {
        VStack(alignment: .leading, spacing: NMSpace.md) {
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
            if let url = URL(string: source.url) {
                Link(destination: url) {
                    Label("Open original source", systemImage: "arrow.up.right")
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.link)
                }
            }
            if let evidence = source.answerEvidence, !evidence.passages.isEmpty {
                Hairline()
                Text(evidence.origin == .retrievedSource ? "Retrieved source passages" : "Library passages used")
                    .font(NMFont.title)
                if evidence.origin == .librarySummary {
                    Text("NurseMind summaries attributed to this source. Open the original to check the full context.")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textSecondary)
                } else {
                    Text("Passages supplied for this answer. Open the original for the full context.")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textSecondary)
                }
                ForEach(Array(evidence.passages.enumerated()), id: \.offset) { index, passage in
                    if index > 0 { Hairline() }
                    Text(passage)
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textPrimary)
                        .textSelection(.enabled)
                }
            }
            Hairline()
            Text(source.licenseDisplayName)
                .font(NMFont.bodySM)
                .foregroundStyle(NMColor.textTertiary)
        }
    }
}
