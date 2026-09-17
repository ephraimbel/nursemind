import Foundation

public struct AnswerCitationEvidence: Hashable, Codable, Sendable {
    public enum Origin: String, Codable, Sendable {
        case retrievedSource
        case librarySummary
    }

    public let origin: Origin
    public let passages: [String]

    static func attaching(to sources: [CitationSource], context: String, origin: Origin) -> [CitationSource] {
        sources.enumerated().map { index, source in
            var source = source
            let marker = String(format: "c%03d", index + 1)
            var passages: [String] = []
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
            }
            source.answerEvidence = passages.isEmpty ? nil : .init(origin: origin, passages: passages)
            return source
        }
    }
}
