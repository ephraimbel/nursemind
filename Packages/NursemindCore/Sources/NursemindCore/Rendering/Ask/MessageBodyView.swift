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
    /// Stable identity for the streaming parse cache. Pass the message id for
    /// live-streaming messages; nil (previews, saved answers) parses fresh.
    let cacheKey: UUID?
    /// Entries the answer was grounded in, so a source card can open one.
    let libraryEntryIDs: [String]
    @State private var presentedCitation: PresentedCitation?
    @Environment(\.colorScheme) private var colorScheme

    struct PresentedCitation: Identifiable {
        let index: Int
        let claim: String?
        var id: String { "\(index)|\(claim ?? "")" }
    }

    public init(content: String, citations: [CitationSource], cacheKey: UUID? = nil, libraryEntryIDs: [String] = []) {
        self.content = content
        self.citations = citations
        self.cacheKey = cacheKey
        self.libraryEntryIDs = libraryEntryIDs
    }

    public var body: some View {
        let parsed = blocks
        // Index of the FIRST paragraph block in the answer — used to give
        // that paragraph editorial weight (slightly larger font) so the lead
        // sentence carries the answer the way a magazine lede does. Bullets
        // and headers are excluded: if the answer opens with a header, the
        // first paragraph AFTER the header gets the emphasis (the header
        // already carries display weight). Computed once per render so the
        // emphasis stays stable as content streams in — the first paragraph
        // is whatever's accumulated until the first blank line, which is
        // well-defined even mid-stream.
        let firstParagraphIdx = parsed.firstIndex {
            if case .paragraph = $0 { return true } else { return false }
        }
        VStack(alignment: .leading, spacing: NMSpace.base) {
            ForEach(Array(parsed.enumerated()), id: \.offset) { idx, block in
                renderBlock(block, emphasized: idx == firstParagraphIdx)
                    // Each block arrives whole and settles into place.
                    .transition(.opacity.combined(with: .offset(y: 6)))
            }
        }
        .animation(.easeOut(duration: 0.32), value: parsed.count)
        // Inline pills are rasterized per appearance; a live switch rebuilds
        // the text views so they pick up the other variant.
        .id(colorScheme)
        .sheet(item: $presentedCitation) { presented in
            CitationCardView(
                number: presented.index,
                citations: citations,
                claim: presented.claim,
                libraryEntryIDs: libraryEntryIDs
            )
        }
    }

    private var blocks: [ContentBlock] {
        ContentBlockParser.parse(content: content, citations: citations, cacheKey: cacheKey)
    }

    @ViewBuilder
    private func renderBlock(_ block: ContentBlock, emphasized: Bool = false) -> some View {
        switch block {
        case .header(let text):
            Text(text)
                .font(NMFont.title)
                .foregroundStyle(NMColor.textPrimary)
                .padding(.top, NMSpace.sm)

        case .paragraph(let spans):
            // The lede: the direct answer, set in Instrument Serif with a
            // hairline under it, so a nurse can read one line and stop.
            // Everything after it is body Inter.
            if emphasized {
                VStack(alignment: .leading, spacing: NMSpace.base) {
                    AttributedTextView(
                        attributed: buildAttributed(spans, font: leadFont, textColor: bodyColor, lineSpacing: 6, monoPointSize: 19),
                        onLinkTap: handleLinkTap
                    )
                    Hairline()
                }
                .padding(.bottom, NMSpace.xs)
            } else {
                AttributedTextView(
                    attributed: buildAttributed(spans, font: bodyFont, textColor: bodyColor),
                    onLinkTap: handleLinkTap
                )
            }

        case .table(let rows):
            // Key, figure, source: three quiet columns. The pill sits in its
            // own trailing column so every row lands on one baseline instead
            // of wrapping wherever the figure and the pill run out of room.
            VStack(alignment: .leading, spacing: 0) {
                Hairline()
                ForEach(Array(rows.enumerated()), id: \.offset) { idx, row in
                    let figure = NumericTokens.isNumericCell(row.valueText)
                    let pill = row.citation.map { source, extras in
                        CitationPill(source: source, extraCount: extras) {
                            presentedCitation = .init(index: (citations.firstIndex(where: { $0.id == source.id }) ?? 0) + 1,
                                                      claim: "\(row.key): \(row.valueText.trimmingCharacters(in: .whitespaces))")
                        }
                        .fixedSize()
                    }
                    HStack(alignment: .firstTextBaseline, spacing: NMSpace.md) {
                        Text(row.key)
                            .font(NumericTokens.isNumericCell(row.key) ? NMFont.mono : NMFont.body)
                            .foregroundStyle(NMColor.textSecondary)
                            .frame(width: 104, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        // A figure keeps its pill on the same line; a phrase
                        // takes the full column and carries the pill beneath,
                        // so a wide pill can never squeeze the text.
                        if figure {
                            AttributedTextView(
                                attributed: buildAttributed(row.textSpans, font: monoFont, textColor: bodyColor, lineSpacing: 3, monoNumbers: false),
                                onLinkTap: handleLinkTap
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                            if let pill {
                                pill.alignmentGuide(.firstTextBaseline) { $0[VerticalAlignment.center] + 4 }
                            }
                        } else {
                            VStack(alignment: .leading, spacing: NMSpace.sm) {
                                AttributedTextView(
                                    attributed: buildAttributed(row.textSpans, font: bodyFont, textColor: bodyColor, lineSpacing: 3),
                                    onLinkTap: handleLinkTap
                                )
                                if let pill { pill }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.vertical, NMSpace.md)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(rowSpokenLabel(row))
                    .accessibilityHint(row.citation == nil ? "" : "Shows the source")
                    if idx < rows.count - 1 {
                        Hairline(color: NMColor.borderSubtle)
                    }
                }
                Hairline()
            }
            .padding(.vertical, NMSpace.xs)

        case .bedside(let rows):
            // Three nursing actions the nurse can screenshot: assess, watch,
            // escalate. Each label sits over its full-width line, with the
            // source pill inline at the end of the sentence.
            VStack(alignment: .leading, spacing: NMSpace.sm) {
                EyebrowLabel("At the bedside", sparkle: false)
                VStack(alignment: .leading, spacing: 0) {
                    Hairline()
                    ForEach(Array(rows.enumerated()), id: \.offset) { idx, row in
                        VStack(alignment: .leading, spacing: NMSpace.xs + 2) {
                            Text(row.key.uppercased())
                                .font(NMFont.label)
                                .tracking(1.2)
                                .foregroundStyle(NMColor.textTertiary)
                            AttributedTextView(
                                attributed: buildAttributed(row.value, font: bodyFont, textColor: bodyColor, lineSpacing: 3),
                                onLinkTap: handleLinkTap
                            )
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, NMSpace.md)
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(rowSpokenLabel(row))
                        if idx < rows.count - 1 {
                            Hairline(color: NMColor.borderSubtle)
                        }
                    }
                    Hairline()
                }
            }
            .padding(.top, NMSpace.xs)

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

        case .numberedList(let items, let start):
            VStack(alignment: .leading, spacing: NMSpace.sm + 2) {
                ForEach(Array(items.enumerated()), id: \.offset) { i, item in
                    HStack(alignment: .top, spacing: NMSpace.sm + 2) {
                        Text("\(start + i).")
                            .font(NMFont.monoSM)
                            .foregroundStyle(NMColor.textTertiary)
                            .frame(minWidth: 20, alignment: .trailing)
                            .padding(.top, 1.5)
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

    /// "Normal, 3.5 to 5.0 milliequivalents per liter, source Open RN".
    private func rowSpokenLabel(_ row: TableRow) -> String {
        var parts = [row.key, row.valueText.trimmingCharacters(in: .whitespaces)]
        if let (source, extras) = row.citation {
            parts.append(extras > 0 ? "sources \(source.shortName) and \(extras) more" : "source \(source.shortName)")
        }
        return parts.joined(separator: ", ")
    }

    private var bodyFont: UIFont {
        UIFont(name: "Inter", size: 17) ?? UIFont.systemFont(ofSize: 17)
    }

    /// The lede is display type: Instrument Serif at 24pt, the same voice
    /// as the app's titles, so the answer reads like the first line of an
    /// editorial rather than a chat bubble.
    private var leadFont: UIFont {
        UIFont(name: "InstrumentSerif-Regular", size: 24) ?? UIFont.systemFont(ofSize: 22, weight: .regular)
    }

    /// Table values and inline numbers: SF Mono, a point under the body.
    private var monoFont: UIFont {
        UIFont.monospacedSystemFont(ofSize: 15, weight: .regular)
    }

    private var bodyColor: UIColor {
        UIColor(NMColor.textPrimary)
    }

    private func handleLinkTap(_ url: URL) {
        guard url.scheme == "nm-citation",
              let host = url.host, let idx = Int(host),
              idx >= 1, idx <= citations.count else { return }
        let claim = URLComponents(url: url, resolvingAgainstBaseURL: false)?
            .queryItems?.first(where: { $0.name == "claim" })?.value
        presentedCitation = .init(index: idx, claim: claim.flatMap { $0.isEmpty ? nil : $0 })
    }

    /// The sentence a pill sits at the end of, so the source card can show
    /// which passage supports that line rather than the whole answer.
    nonisolated static func claim(before text: String) -> String {
        var tail = text.replacingOccurrences(of: "**", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        // A terminator counts only when whitespace follows it, so "3.5" and
        // "mEq/L." inside a sentence never split it.
        if let range = tail.range(of: #"[.!?]\s+(?!.*[.!?]\s)"#, options: .regularExpression) {
            tail = String(tail[range.upperBound...])
        }
        tail = tail.trimmingCharacters(in: CharacterSet(charactersIn: " ,;:("))
        return String(tail.prefix(240))
    }

    /// Build an NSAttributedString that interleaves markdown text segments with
    /// inline citation pill image attachments. The result is rendered by a
    /// UITextView wrapper so attachments display correctly (SwiftUI Text drops them).
    private func buildAttributed(_ spans: [ContentSpan], font: UIFont, textColor: UIColor, lineSpacing: CGFloat = 4, monoNumbers: Bool = true, monoPointSize: CGFloat? = nil) -> NSAttributedString {
        let result = NSMutableAttributedString()
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = lineSpacing

        var running = ""
        for span in spans {
            switch span {
            case .text(let s):
                running += s
                // A pill is padded with spaces; when the sentence's period or
                // comma follows the pill, drop the pad so it reads "…[1]." not "…[1] .".
                if let first = s.first, ".,;:!?)".contains(first), result.string.hasSuffix(" ") {
                    result.deleteCharacters(in: NSRange(location: result.length - 1, length: 1))
                }
                let parsed = NSMutableAttributedString(attributedString: parseMarkdownToNSAttributed(s, font: font, textColor: textColor))
                if monoNumbers { NumericTokens.applyMono(to: parsed, bodyFont: font, pointSize: monoPointSize) }
                result.append(parsed)
            case .citation(let source, let extras):
                let citationIndex = (citations.firstIndex(where: { $0.id == source.id }) ?? 0) + 1
                let chip = citationChip(source, index: citationIndex, extras: extras, claim: Self.claim(before: running))
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
    private func citationChip(_ source: CitationSource, index: Int, extras: Int, claim: String = "") -> NSAttributedString {
        let image = CitationPillImage.render(for: source, extras: extras, dark: colorScheme == .dark)

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
        var components = URLComponents()
        components.scheme = "nm-citation"
        components.host = String(index)
        if !claim.isEmpty { components.queryItems = [URLQueryItem(name: "claim", value: claim)] }
        if let url = components.url {
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
    case numberedList([[ContentSpan]], start: Int)
    /// Cited reference rows (`| key | value [cNNN] |`); values render in mono.
    case table([TableRow])
    case bedside([TableRow])
}

public struct TableRow {
    public let key: String
    public let value: [ContentSpan]

    /// The value without citation pills, for choosing a cell face.
    public var valueText: String {
        value.compactMap { if case .text(let t) = $0 { return t } else { return nil } }.joined()
    }

    /// The value's text spans only, trailing space trimmed, for the figure column.
    public var textSpans: [ContentSpan] {
        var spans = value.compactMap { span -> ContentSpan? in if case .text = span { return span } else { return nil } }
        if case .text(let last)? = spans.last {
            let trimmed = last.replacingOccurrences(of: #"\s+$"#, with: "", options: .regularExpression)
            spans[spans.count - 1] = .text(trimmed)
        }
        return spans
    }

    /// The row's sources folded into one pill: the first source plus how
    /// many more stand behind it.
    public var citation: (CitationSource, Int)? {
        var primary: CitationSource?
        var extras = 0
        for span in value {
            guard case .citation(let source, let more) = span else { continue }
            if primary == nil { primary = source; extras += more } else { extras += 1 + more }
        }
        return primary.map { ($0, extras) }
    }
}

public enum ContentSpan {
    case text(String)
    case citation(CitationSource, extras: Int)
}

// MARK: - Streaming parse cache

/// Per-message cache of the parsed stable prefix. Keyed by message id;
/// invalidated automatically when the prefix or citation count changes.
/// Bounded FIFO — a conversation only ever streams one message at a time,
/// so a dozen entries comfortably covers scroll-back re-renders.
private final class StreamingParseCache: @unchecked Sendable {
    static let shared = StreamingParseCache()

    private let lock = NSLock()
    private var store: [UUID: (prefix: String, citationCount: Int, blocks: [ContentBlock])] = [:]
    private var order: [UUID] = []

    func blocks(
        for key: UUID,
        prefix: String,
        citationCount: Int,
        compute: () -> [ContentBlock]
    ) -> [ContentBlock] {
        lock.lock()
        if let hit = store[key], hit.prefix == prefix, hit.citationCount == citationCount {
            lock.unlock()
            return hit.blocks
        }
        lock.unlock()

        let computed = compute()

        lock.lock()
        if store[key] == nil {
            order.append(key)
            if order.count > 12 {
                store.removeValue(forKey: order.removeFirst())
            }
        }
        store[key] = (prefix, citationCount, computed)
        lock.unlock()
        return computed
    }
}

// MARK: - Parser

enum ContentBlockParser {

    /// Parse with an optional streaming cache. During a stream the message
    /// body re-renders ~30×/second and every block before the last blank
    /// line is immutable — re-parsing all of them per tick made the render
    /// loop O(answer²) over the stream's lifetime. With a `cacheKey` the
    /// stable prefix parses once and only the trailing (still-growing) block
    /// re-parses per tick. Splitting at a blank line is lossless: a blank
    /// line always flushes every accumulator, so parse(prefix) + parse(tail)
    /// is identical to parse(whole).
    static func parse(content: String, citations: [CitationSource], cacheKey: UUID? = nil) -> [ContentBlock] {
        guard let cacheKey,
              let boundary = content.range(of: "\n\n", options: .backwards) else {
            return parseAll(content: content, citations: citations)
        }
        let prefix = String(content[..<boundary.upperBound])
        let tail = String(content[boundary.upperBound...])
        let prefixBlocks = StreamingParseCache.shared.blocks(
            for: cacheKey,
            prefix: prefix,
            citationCount: citations.count
        ) {
            parseAll(content: prefix, citations: citations)
        }
        return prefixBlocks + parseAll(content: tail, citations: citations)
    }

    private static func parseAll(content: String, citations: [CitationSource]) -> [ContentBlock] {
        let lines = content.components(separatedBy: "\n")
        var blocks: [ContentBlock] = []
        var currentParagraph: [String] = []
        var currentBullets: [String] = []
        var currentNumbered: [String] = []
        var numberedStart: Int = 1
        var currentRows: [TableRow] = []
        var bedsidePending = false

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
        func flushNumbered() {
            if !currentNumbered.isEmpty {
                let items = currentNumbered.map { parseSpans(in: $0, citations: citations) }
                blocks.append(.numberedList(items, start: numberedStart))
                currentNumbered.removeAll()
            }
        }
        func flushRows() {
            if !currentRows.isEmpty {
                blocks.append(bedsidePending ? .bedside(currentRows) : .table(currentRows))
                currentRows.removeAll()
            }
            bedsidePending = false
        }
        func flushAll() { flushParagraph(); flushBullets(); flushNumbered(); flushRows() }

        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed.isEmpty {
                flushAll()
                continue
            }
            if isTableSeparator(trimmed) {
                continue
            }
            if let row = parseTableRow(trimmed, citations: citations) {
                flushParagraph(); flushBullets(); flushNumbered()
                currentRows.append(row)
            } else if let numbered = parseNumberedLine(trimmed) {
                flushParagraph(); flushBullets(); flushRows()
                if currentNumbered.isEmpty { numberedStart = numbered.number }
                currentNumbered.append(numbered.text)
            } else if let bulletText = parseBulletLine(trimmed) {
                flushParagraph(); flushNumbered(); flushRows()
                currentBullets.append(bulletText)
            } else if let headerText = parseHeaderLine(trimmed) {
                flushAll()
                // The server's fixed heading for the nursing-action trio; the
                // rows under it render as the bedside block, not a table.
                if headerText.caseInsensitiveCompare("At the bedside") == .orderedSame {
                    bedsidePending = true
                } else {
                    blocks.append(.header(headerText))
                }
            } else {
                flushBullets(); flushNumbered(); flushRows()
                currentParagraph.append(trimmed)
            }
        }
        flushAll()
        return blocks
    }

    /// `|---|---|` and `|:--|--:|` — GFM's header underline, meaningless here.
    static func isTableSeparator(_ line: String) -> Bool {
        line.hasPrefix("|") && line.range(of: #"^\|(?:\s*:?-{2,}:?\s*\|)+\s*$"#, options: .regularExpression) != nil
    }

    /// `| key | value [c001] |` → a table row. GFM header/separator lines
    /// (`| --- |`, `|:--|`) are dropped so a model that emits full markdown
    /// tables still renders cleanly.
    static func parseTableRow(_ line: String, citations: [CitationSource]) -> TableRow? {
        guard line.hasPrefix("|") else { return nil }
        var cells = line.split(separator: "|", omittingEmptySubsequences: false).map { $0.trimmingCharacters(in: .whitespaces) }
        if cells.first?.isEmpty == true { cells.removeFirst() }
        if cells.last?.isEmpty == true { cells.removeLast() }
        guard cells.count >= 2 else { return nil }
        let key = cells[0]
        if key.isEmpty || key.range(of: #"^:?-{2,}:?$"#, options: .regularExpression) != nil { return nil }
        let value = cells[1...].joined(separator: " · ")
        return TableRow(key: key, value: parseSpans(in: value, citations: citations))
    }

    /// Matches "1. text", "12) text" — ordered-list items the model emits
    /// constantly for step sequences. Without this they rendered as run-on
    /// paragraphs.
    private static func parseNumberedLine(_ line: String) -> (number: Int, text: String)? {
        guard let match = line.range(of: #"^\d{1,3}[.)]\s+"#, options: .regularExpression) else {
            return nil
        }
        let digits = line[line.startIndex..<match.upperBound].prefix(while: \.isNumber)
        guard let number = Int(digits) else { return nil }
        return (number, String(line[match.upperBound...]))
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
                // Whitespace between two markers is not text: dropping it lets
                // "[c001] [c002]" fold into one pill instead of two.
                let betweenMarkers = chunk.allSatisfy(\.isWhitespace)
                if case .citation = spans.last, betweenMarkers {
                    // fold
                } else if !chunk.isEmpty {
                    spans.append(.text(chunk))
                }
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
