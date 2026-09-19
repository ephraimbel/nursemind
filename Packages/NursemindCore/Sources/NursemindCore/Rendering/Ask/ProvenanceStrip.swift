import SwiftUI

/// One quiet line under the NurseMind eyebrow that says what the answer
/// stands on: "2 library entries · 4 sources · retrieved May 2026".
/// Tapping opens the references card.
struct ProvenanceStrip: View {
    let message: AskMessage
    @State private var presented = false

    var body: some View {
        Button {
            Haptic.light()
            presented = true
        } label: {
            // One flowing line of text, so a long summary wraps like prose
            // instead of splitting into columns.
            HStack(alignment: .firstTextBaseline, spacing: NMSpace.xs) {
                line
                    .lineSpacing(2)
                    .multilineTextAlignment(.leading)
                Image(systemName: "chevron.right")
                    .font(.system(size: 9, weight: .semibold))
            }
            .foregroundStyle(NMColor.textTertiary)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Grounded in \(Self.summary(for: message).replacingOccurrences(of: " · ", with: " and ")). \(Self.retrievedText(for: message.citations) ?? "")")
        .accessibilityHint("Shows the references")
        .sheet(isPresented: $presented) {
            CitationCardView(number: 0, citations: message.citations, libraryEntryIDs: message.libraryEntryIDs)
        }
    }

    private var line: Text {
        var text = Text(Self.summary(for: message)).font(NMFont.bodySM)
        if let retrieved = Self.retrievedText(for: message.citations) {
            text = text + Text(" · ").font(NMFont.bodySM) + Text(retrieved).font(NMFont.displayItalicSM)
        }
        return text
    }

    /// "3 library entries · 4 sources", or "2 retrieved sources".
    nonisolated static func summary(for message: AskMessage) -> String {
        let sources = message.citations.count
        let sourceWord = sources == 1 ? "source" : "sources"
        if message.citations.first?.answerEvidence?.origin == .retrievedSource {
            return "\(sources) retrieved \(sourceWord)"
        }
        let entries = message.libraryEntryIDs.count
        guard entries > 0 else { return "\(sources) \(sourceWord)" }
        return "\(entries) library \(entries == 1 ? "entry" : "entries") · \(sources) \(sourceWord)"
    }

    /// "retrieved May 2026" from the newest source date, or nil when none parse.
    nonisolated static func retrievedText(for citations: [CitationSource]) -> String? {
        let parser = DateFormatter()
        parser.locale = Locale(identifier: "en_US_POSIX")
        parser.dateFormat = "yyyy-MM-dd"
        guard let newest = citations.compactMap({ parser.date(from: String($0.lastRetrieved.prefix(10))) }).max() else { return nil }
        let printer = DateFormatter()
        printer.locale = Locale(identifier: "en_US")
        printer.dateFormat = "MMMM yyyy"
        return "retrieved \(printer.string(from: newest))"
    }
}
