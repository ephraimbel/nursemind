import SwiftUI
import UIKit

/// Renders an AI response with OpenEvidence-style formatting:
///   - Markdown bold for key clinical terms
///   - Section headers (## Title) when used
///   - Bullet lists with bolded leading labels
///   - Inline citation pills (rendered as image attachments) at sentence ends, tappable
public struct MessageBodyView: View {
    let content: String
    let citations: [CitationSource]
    @State private var presentedCitationIndex: Int?

    public init(content: String, citations: [CitationSource]) {
        self.content = content
        self.citations = citations
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.base) {
            ForEach(Array(blocks.enumerated()), id: \.offset) { _, block in
                renderBlock(block)
            }
        }
        .sheet(
            isPresented: Binding(
                get: { presentedCitationIndex != nil },
                set: { if !$0 { presentedCitationIndex = nil } }
            )
        ) {
            if let idx = presentedCitationIndex {
                CitationCardView(
                    number: idx,
                    source: citations[idx - 1],
                    totalCount: citations.count
                )
            }
        }
    }

    private var blocks: [ContentBlock] {
        ContentBlockParser.parse(content: content, citations: citations)
    }

    @ViewBuilder
    private func renderBlock(_ block: ContentBlock) -> some View {
        switch block {
        case .header(let text):
            Text(text)
                .font(NMFont.title)
                .foregroundStyle(NMColor.textPrimary)
                .padding(.top, NMSpace.sm)

        case .paragraph(let spans):
            AttributedTextView(
                attributed: buildAttributed(spans, font: bodyFont, textColor: bodyColor),
                onLinkTap: handleLinkTap
            )

        case .bulletList(let items):
            VStack(alignment: .leading, spacing: NMSpace.sm + 2) {
                ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                    HStack(alignment: .top, spacing: NMSpace.sm + 2) {
                        Text("•")
                            .font(NMFont.bodyLG)
                            .foregroundStyle(NMColor.textTertiary)
                            .padding(.top, 1)
                        AttributedTextView(
                            attributed: buildAttributed(item, font: bodyFont, textColor: bodyColor),
                            onLinkTap: handleLinkTap
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }

    private var bodyFont: UIFont {
        UIFont(name: "Inter", size: 17) ?? UIFont.systemFont(ofSize: 17)
    }

    private var bodyColor: UIColor {
        UIColor(NMColor.textPrimary)
    }

    private func handleLinkTap(_ url: URL) {
        if url.scheme == "nm-citation",
           let host = url.host,
           let idx = Int(host),
           idx >= 1, idx <= citations.count {
            presentedCitationIndex = idx
        }
    }

    /// Build an NSAttributedString that interleaves markdown text segments with
    /// inline citation pill image attachments. The result is rendered by a
    /// UITextView wrapper so attachments display correctly (SwiftUI Text drops them).
    private func buildAttributed(_ spans: [ContentSpan], font: UIFont, textColor: UIColor) -> NSAttributedString {
        let result = NSMutableAttributedString()
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 4

        for span in spans {
            switch span {
            case .text(let s):
                let parsed = parseMarkdownToNSAttributed(s, font: font, textColor: textColor)
                result.append(parsed)
            case .citation(let source, let extras):
                let citationIndex = (citations.firstIndex(where: { $0.id == source.id }) ?? 0) + 1
                let chip = citationChip(source, index: citationIndex, extras: extras)
                result.append(chip)
            }
        }
        result.addAttributes(
            [.paragraphStyle: paragraph, .foregroundColor: textColor],
            range: NSRange(location: 0, length: result.length)
        )
        return result
    }

    /// Parses a markdown segment via SwiftUI's AttributedString (for bold/italic),
    /// then converts to NSAttributedString and applies our base font/color so
    /// styles compose with our design system.
    private func parseMarkdownToNSAttributed(_ text: String, font: UIFont, textColor: UIColor) -> NSAttributedString {
        guard let attr = try? AttributedString(
            markdown: text,
            options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        ) else {
            return NSAttributedString(string: text, attributes: [.font: font, .foregroundColor: textColor])
        }
        let ns = NSMutableAttributedString(attr)
        let full = NSRange(location: 0, length: ns.length)
        ns.enumerateAttribute(.font, in: full) { value, range, _ in
            let isBold = (value as? UIFont)?.fontDescriptor.symbolicTraits.contains(.traitBold) ?? false
            let isItalic = (value as? UIFont)?.fontDescriptor.symbolicTraits.contains(.traitItalic) ?? false
            var traits: UIFontDescriptor.SymbolicTraits = []
            if isBold { traits.insert(.traitBold) }
            if isItalic { traits.insert(.traitItalic) }
            let descriptor = font.fontDescriptor.withSymbolicTraits(traits) ?? font.fontDescriptor
            let resolved = UIFont(descriptor: descriptor, size: font.pointSize)
            ns.addAttribute(.font, value: resolved, range: range)
        }
        ns.addAttribute(.foregroundColor, value: textColor, range: full)
        return ns
    }

    /// Inline citation pill rendered as a UIImage text attachment. The pill is
    /// linked via `nm-citation://<index>` so the AttributedTextView coordinator
    /// can intercept taps and present the in-app CitationCardView popover.
    private func citationChip(_ source: CitationSource, index: Int, extras: Int) -> NSAttributedString {
        let image = CitationPillImage.render(for: source, extras: extras)

        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(
            x: 0,
            y: -3,
            width: image.size.width,
            height: image.size.height
        )

        let combined = NSMutableAttributedString()
        combined.append(NSAttributedString(string: " "))
        combined.append(NSAttributedString(attachment: attachment))
        combined.append(NSAttributedString(string: " "))
        if let url = URL(string: "nm-citation://\(index)") {
            combined.addAttribute(.link, value: url, range: NSRange(location: 0, length: combined.length))
        }
        return combined
    }
}

// MARK: - Block / span model

public enum ContentBlock {
    case header(String)
    case paragraph([ContentSpan])
    case bulletList([[ContentSpan]])
}

public enum ContentSpan {
    case text(String)
    case citation(CitationSource, extras: Int)
}

// MARK: - Parser

enum ContentBlockParser {

    static func parse(content: String, citations: [CitationSource]) -> [ContentBlock] {
        let lines = content.components(separatedBy: "\n")
        var blocks: [ContentBlock] = []
        var currentParagraph: [String] = []
        var currentBullets: [String] = []

        func flushParagraph() {
            if !currentParagraph.isEmpty {
                let combined = currentParagraph.joined(separator: " ")
                blocks.append(.paragraph(parseSpans(in: combined, citations: citations)))
                currentParagraph.removeAll()
            }
        }
        func flushBullets() {
            if !currentBullets.isEmpty {
                let items = currentBullets.map { parseSpans(in: $0, citations: citations) }
                blocks.append(.bulletList(items))
                currentBullets.removeAll()
            }
        }

        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed.isEmpty {
                flushParagraph(); flushBullets()
                continue
            }
            if let bulletText = parseBulletLine(trimmed) {
                flushParagraph()
                currentBullets.append(bulletText)
            } else if let headerText = parseHeaderLine(trimmed) {
                flushParagraph(); flushBullets()
                blocks.append(.header(headerText))
            } else {
                flushBullets()
                currentParagraph.append(trimmed)
            }
        }
        flushParagraph(); flushBullets()
        return blocks
    }

    private static func parseHeaderLine(_ line: String) -> String? {
        if line.hasPrefix("# ")   { return String(line.dropFirst(2)) }
        if line.hasPrefix("## ")  { return String(line.dropFirst(3)) }
        if line.hasPrefix("### ") { return String(line.dropFirst(4)) }
        if line.hasPrefix("#### "){ return String(line.dropFirst(5)) }
        if line.hasPrefix("**") && line.hasSuffix("**") && line.count > 4 {
            let inner = String(line.dropFirst(2).dropLast(2))
            if inner.count <= 60 && !inner.contains("[c") {
                return inner
            }
        }
        return nil
    }

    private static func parseBulletLine(_ line: String) -> String? {
        if line.hasPrefix("- ") { return String(line.dropFirst(2)) }
        if line.hasPrefix("* ") { return String(line.dropFirst(2)) }
        if line.hasPrefix("• ") { return String(line.dropFirst(2)) }
        return nil
    }

    private static func parseSpans(in text: String, citations: [CitationSource]) -> [ContentSpan] {
        // Match a citation marker that may contain ONE or MULTIPLE comma-separated IDs:
        //   [c001]            — single
        //   [c001, c006]      — multiple
        //   [c001,c003,c007]  — multiple, no spaces
        guard let regex = try? NSRegularExpression(pattern: #"\[\s*c\d{1,4}(?:\s*,\s*c\d{1,4})*\s*\]"#) else {
            return [.text(text)]
        }
        let nsText = text as NSString
        let matches = regex.matches(in: text, options: [], range: NSRange(location: 0, length: nsText.length))
        if matches.isEmpty {
            return [.text(text)]
        }

        func resolve(idNumber: Int) -> CitationSource? {
            let zeroBased = idNumber - 1
            if zeroBased >= 0 && zeroBased < citations.count {
                return citations[zeroBased]
            }
            return nil
        }

        // Extract numeric IDs from a marker like "[c001, c006]"
        func extractIDs(from marker: String) -> [Int] {
            guard let inner = try? NSRegularExpression(pattern: #"c(\d{1,4})"#) else { return [] }
            let ns = marker as NSString
            return inner
                .matches(in: marker, options: [], range: NSRange(location: 0, length: ns.length))
                .compactMap { match in
                    if let r = Range(match.range(at: 1), in: marker) { return Int(marker[r]) }
                    return nil
                }
        }

        var spans: [ContentSpan] = []
        var lastEnd = 0
        for match in matches {
            // Emit text before this marker
            if match.range.location > lastEnd {
                let chunk = nsText.substring(with: NSRange(location: lastEnd, length: match.range.location - lastEnd))
                if !chunk.isEmpty { spans.append(.text(chunk)) }
            }
            let raw = nsText.substring(with: match.range)
            let ids = extractIDs(from: raw)
            // Resolve all IDs in this marker
            let sources = ids.compactMap(resolve(idNumber:))

            if let primary = sources.first {
                let extras = sources.count - 1
                // Coalesce with previous citation chip if this immediately follows another
                if case .citation(let prev, let prevExtras) = spans.last {
                    spans[spans.count - 1] = .citation(prev, extras: prevExtras + 1 + extras)
                } else {
                    spans.append(.citation(primary, extras: extras))
                }
            } else {
                // No IDs resolved (citations not yet streamed in). Keep literal text.
                if case .text(let prev) = spans.last {
                    spans[spans.count - 1] = .text(prev + raw)
                } else {
                    spans.append(.text(raw))
                }
            }
            lastEnd = match.range.location + match.range.length
        }
        if lastEnd < nsText.length {
            let chunk = nsText.substring(with: NSRange(location: lastEnd, length: nsText.length - lastEnd))
            if !chunk.isEmpty {
                if case .text(let prev) = spans.last {
                    spans[spans.count - 1] = .text(prev + chunk)
                } else {
                    spans.append(.text(chunk))
                }
            }
        }
        return spans
    }
}
