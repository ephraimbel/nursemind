import Foundation
import SwiftData

/// A user-saved AI answer. Captured at the moment of save so source rot or
/// library updates don't change what the nurse remembers reading.
@Model
public final class SavedAnswer {
    @Attribute(.unique) public var id: UUID
    public var question: String
    public var answerMarkdown: String
    public var citationsData: Data           // JSON-encoded [CitationSource]
    public var savedAt: Date
    public var customTitle: String?
    public var sourceMessageID: UUID         // dedup key: ties this save to the AskMessage it came from

    public init(
        id: UUID = UUID(),
        question: String,
        answerMarkdown: String,
        citations: [CitationSource],
        savedAt: Date = Date(),
        customTitle: String? = nil,
        sourceMessageID: UUID
    ) {
        self.id = id
        self.question = question
        self.answerMarkdown = answerMarkdown
        self.citationsData = (try? JSONEncoder().encode(citations)) ?? Data()
        self.savedAt = savedAt
        self.customTitle = customTitle
        self.sourceMessageID = sourceMessageID
    }

    public var citations: [CitationSource] {
        (try? JSONDecoder().decode([CitationSource].self, from: citationsData)) ?? []
    }

    public func setCitations(_ value: [CitationSource]) {
        citationsData = (try? JSONEncoder().encode(value)) ?? Data()
    }

    /// Display title — uses custom override if set, otherwise the question itself
    /// (truncated for list display by the caller).
    public var displayTitle: String {
        if let custom = customTitle, !custom.isEmpty { return custom }
        return question
    }
}
