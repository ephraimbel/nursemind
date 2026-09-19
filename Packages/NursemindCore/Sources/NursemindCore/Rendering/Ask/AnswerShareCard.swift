import SwiftUI
import UIKit

/// Share-sheet button on a completed answer. Renders the answer, its
/// sources and the wordmark into one image; answers carry no patient data
/// by design, and the question is scrubbed again before it is drawn.
struct ShareAnswerButton: View {
    let message: AskMessage
    let question: String
    @State private var shared: SharedImage?

    struct SharedImage: Identifiable {
        let id = UUID()
        let image: UIImage
    }

    var body: some View {
        Button {
            render()
        } label: {
            Image(systemName: "square.and.arrow.up")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Share as image")
        .sheet(item: $shared) { shared in
            ActivityView(items: [shared.image])
                .presentationDetents([.medium, .large])
        }
    }

    @MainActor
    private func render() {
        let card = AnswerShareCard(question: PHIScrubber.scrub(question).scrubbed, message: message)
            .frame(width: AnswerShareCard.width)
            .environment(\.colorScheme, .light)
        let renderer = ImageRenderer(content: card)
        renderer.scale = 3
        renderer.proposedSize = ProposedViewSize(width: AnswerShareCard.width, height: nil)
        guard let image = renderer.uiImage else { return }
        #if DEBUG
        // `SIMCTL_CHILD_NM_SHARE_DUMP=1`: also write the PNG to Documents so
        // the rendered card can be inspected from a simulator run.
        if ProcessInfo.processInfo.environment["NM_SHARE_DUMP"] == "1",
           let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("nursemind-share-card.png") {
            try? image.pngData()?.write(to: url)
        }
        #endif
        Haptic.light()
        AnalyticsService.shared.capture("answer_shared", properties: ["citation_count": message.citations.count])
        shared = SharedImage(image: image)
    }
}

/// The image itself: wordmark, question, answer blocks with superscript
/// source numbers, the sources, and the reference-only footer.
struct AnswerShareCard: View {
    static let width: CGFloat = 390
    let question: String
    let message: AskMessage

    var body: some View {
        // The card carries its own footer, so the answer's footer line is left out.
        let blocks = ContentBlockParser.parse(content: message.content, citations: message.citations).filter { block in
            if case .paragraph(let spans) = block, spans.count == 1, case .text(let text)? = spans.first {
                return text.trimmingCharacters(in: .whitespacesAndNewlines) != SystemPrompt.referenceFooter
            }
            return true
        }
        let firstParagraph = blocks.firstIndex { if case .paragraph = $0 { return true } else { return false } }
        VStack(alignment: .leading, spacing: NMSpace.base) {
            HStack(alignment: .center) {
                NursemindLogo(size: 18)
                Spacer()
                Text("nursemind.app")
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textTertiary)
            }
            Hairline()
            EyebrowLabel("Question", sparkle: false)
            Text(question)
                .font(NMFont.displayMD)
                .foregroundStyle(NMColor.textPrimary)
                .lineSpacing(3)
                .fixedSize(horizontal: false, vertical: true)
            Hairline().padding(.top, NMSpace.xs)
            EyebrowLabel("NurseMind")
            ForEach(Array(blocks.enumerated()), id: \.offset) { index, block in
                render(block, lede: index == firstParagraph)
            }
            if !message.citations.isEmpty {
                Hairline().padding(.top, NMSpace.xs)
                EyebrowLabel("Sources", sparkle: false)
                VStack(alignment: .leading, spacing: NMSpace.xs) {
                    ForEach(Array(message.citations.enumerated()), id: \.offset) { index, source in
                        HStack(alignment: .top, spacing: NMSpace.xs) {
                            Text("\(index + 1).")
                                .font(NMFont.monoSM)
                                .foregroundStyle(NMColor.textTertiary)
                                .frame(width: 18, alignment: .trailing)
                            Text(source.shortName)
                                .font(NMFont.bodySM)
                                .foregroundStyle(NMColor.textSecondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
            }
            Hairline().padding(.top, NMSpace.xs)
            HStack(spacing: NMSpace.xs) {
                Text("Reference only · Verify with provider ·")
                    .font(NMFont.bodySM)
                Text("No PHI")
                    .font(NMFont.displayItalicSM)
            }
            .foregroundStyle(NMColor.textTertiary)
        }
        .padding(NMSpace.xl)
        .frame(width: Self.width, alignment: .leading)
        .background(NMColor.bgPrimary)
    }

    @ViewBuilder
    private func render(_ block: ContentBlock, lede: Bool) -> some View {
        switch block {
        case .header(let text):
            Text(text).font(NMFont.title).foregroundStyle(NMColor.textPrimary).padding(.top, NMSpace.xs)
        case .paragraph(let spans):
            if lede {
                VStack(alignment: .leading, spacing: NMSpace.md) {
                    text(spans, font: Font.custom("InstrumentSerif-Regular", size: 22))
                        .lineSpacing(5)
                    Hairline()
                }
            } else {
                text(spans, font: NMFont.body).lineSpacing(3)
            }
        case .table(let rows):
            VStack(alignment: .leading, spacing: 0) {
                Hairline()
                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                    HStack(alignment: .firstTextBaseline, spacing: NMSpace.md) {
                        Text(row.key)
                            .font(NumericTokens.isNumericCell(row.key) ? NMFont.monoSM : NMFont.bodySM)
                            .foregroundStyle(NMColor.textSecondary)
                            .frame(width: 96, alignment: .leading)
                        text(row.value, font: NumericTokens.isNumericCell(row.valueText) ? NMFont.mono : NMFont.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, NMSpace.sm)
                    if index < rows.count - 1 { Hairline(color: NMColor.borderSubtle) }
                }
                Hairline()
            }
        case .bedside(let rows):
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                EyebrowLabel("At the bedside", sparkle: false)
                VStack(alignment: .leading, spacing: 0) {
                    Hairline()
                    ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                        HStack(alignment: .firstTextBaseline, spacing: NMSpace.md) {
                            Text(row.key.uppercased())
                                .font(NMFont.label).tracking(1.2)
                                .foregroundStyle(NMColor.textTertiary)
                                .frame(width: 112, alignment: .leading)
                            text(row.value, font: NMFont.body)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.vertical, NMSpace.sm)
                        if index < rows.count - 1 { Hairline(color: NMColor.borderSubtle) }
                    }
                    Hairline()
                }
            }
        case .bulletList(let items):
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                    HStack(alignment: .top, spacing: NMSpace.sm) {
                        Text("•").font(NMFont.body).foregroundStyle(NMColor.textTertiary)
                        text(item, font: NMFont.body).lineSpacing(3)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        case .numberedList(let items, let start):
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    HStack(alignment: .top, spacing: NMSpace.sm) {
                        Text("\(start + index).").font(NMFont.monoSM).foregroundStyle(NMColor.textTertiary)
                        text(item, font: NMFont.body).lineSpacing(3)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }

    /// Spans as one Text: markdown for emphasis, sources as superscript
    /// numbers in the link color, since image rendering has no tappable pills.
    private func text(_ spans: [ContentSpan], font: Font) -> Text {
        spans.reduce(Text("")) { partial, span in
            switch span {
            case .text(let raw):
                let cleaned = raw.replacingOccurrences(of: #"\s+$"#, with: " ", options: .regularExpression)
                let attributed = (try? AttributedString(markdown: cleaned, options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace))) ?? AttributedString(cleaned)
                return partial + Text(attributed).font(font).foregroundColor(NMColor.textPrimary)
            case .citation(let source, let extras):
                let index = (message.citations.firstIndex(where: { $0.id == source.id }) ?? 0) + 1
                let label = extras > 0 ? "\(index)+\(extras)" : "\(index)"
                return partial + Text(" \(label)")
                    .font(.system(size: 10, weight: .semibold))
                    .baselineOffset(6)
                    .foregroundColor(NMColor.link)
            }
        }
    }
}

/// The system share sheet.
struct ActivityView: UIViewControllerRepresentable {
    let items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
