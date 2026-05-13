import Foundation

/// Wire format for `public.saved_answers`. Snake_case Postgres columns map
/// to camelCase Swift via CodingKeys. `citationsData` is the rich
/// `[CitationSource]` array — Postgres stores it as `jsonb`, the SDK encodes
/// it transparently.
public struct SavedAnswerRecord: Codable, Sendable, Equatable {
    public var id: UUID
    public var userID: UUID
    public var question: String
    public var answerMarkdown: String
    public var customTitle: String?
    public var citationsData: [CitationSource]
    public var sourceMessageID: UUID
    public var savedAt: Date
    public var createdAt: Date
    public var updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case userID            = "user_id"
        case question
        case answerMarkdown    = "answer_markdown"
        case customTitle       = "custom_title"
        case citationsData     = "citations_data"
        case sourceMessageID   = "source_message_id"
        case savedAt           = "saved_at"
        case createdAt         = "created_at"
        case updatedAt         = "updated_at"
    }

    public init(
        id: UUID,
        userID: UUID,
        question: String,
        answerMarkdown: String,
        customTitle: String?,
        citationsData: [CitationSource],
        sourceMessageID: UUID,
        savedAt: Date,
        createdAt: Date = Date(),
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.userID = userID
        self.question = question
        self.answerMarkdown = answerMarkdown
        self.customTitle = customTitle
        self.citationsData = citationsData
        self.sourceMessageID = sourceMessageID
        self.savedAt = savedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}

/// Upsert variant — omits server-managed timestamps so the trigger owns
/// them and clients can't rewrite history with stale device clocks.
public struct SavedAnswerUpsert: Codable, Sendable {
    public var id: UUID
    public var userID: UUID
    public var question: String
    public var answerMarkdown: String
    public var customTitle: String?
    public var citationsData: [CitationSource]
    public var sourceMessageID: UUID
    public var savedAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case userID            = "user_id"
        case question
        case answerMarkdown    = "answer_markdown"
        case customTitle       = "custom_title"
        case citationsData     = "citations_data"
        case sourceMessageID   = "source_message_id"
        case savedAt           = "saved_at"
    }
}
