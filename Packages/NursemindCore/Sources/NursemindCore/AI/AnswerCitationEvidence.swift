import Foundation

public struct AnswerCitationEvidence: Hashable, Codable, Sendable {
    public enum Origin: String, Codable, Sendable {
        case retrievedSource
        case librarySummary
    }

    public let origin: Origin
    public let passages: [String]
    /// Library entries the passages came from, so a source card can open
    /// the entry the answer was grounded in. Empty for retrieved sources.
    public let entryTitles: [String]

    public init(origin: Origin, passages: [String], entryTitles: [String] = []) {
        self.origin = origin
        self.passages = passages
        self.entryTitles = entryTitles
    }

    private enum CodingKeys: String, CodingKey { case origin, passages, entryTitles }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        origin = try container.decode(Origin.self, forKey: .origin)
        passages = try container.decode([String].self, forKey: .passages)
        entryTitles = try container.decodeIfPresent([String].self, forKey: .entryTitles) ?? []
    }

    static func attaching(to sources: [CitationSource], context: String, origin: Origin) -> [CitationSource] {
        sources.enumerated().map { index, source in
            var source = source
            let marker = String(format: "c%03d", index + 1)
            var passages: [String] = []
            var entryTitles: [String] = []
            for line in context.components(separatedBy: .newlines) {
                guard let start = line.range(of: origin == .librarySummary ? "(entry:" : "(source:"),
                      ResponseValidator.citationIDs(in: String(line[..<start.lowerBound])).contains(marker) else { continue }
                var depth = 0
                var end: String.Index?
                for i in line.indices where i >= start.lowerBound {
                    if line[i] == "(" { depth += 1 }
                    if line[i] == ")" {
                        depth -= 1
                        if depth == 0 { end = line.index(after: i); break }
                    }
                }
                guard let end else { continue }
                let passage = String(line[end...]).trimmingCharacters(in: .whitespaces)
                if !passage.isEmpty, !passages.contains(passage) { passages.append(passage) }
                if origin == .librarySummary {
                    let head = line[start.upperBound..<end]
                    let title = head.split(separator: ";", maxSplits: 1).first.map { $0.trimmingCharacters(in: .whitespaces) } ?? ""
                    if !title.isEmpty, !entryTitles.contains(title) { entryTitles.append(title) }
                }
            }
            source.answerEvidence = passages.isEmpty ? nil : .init(origin: origin, passages: passages, entryTitles: entryTitles)
            return source
        }
    }
}
