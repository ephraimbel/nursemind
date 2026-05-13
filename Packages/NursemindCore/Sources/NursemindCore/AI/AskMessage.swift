import Foundation

public struct AskMessage: Identifiable, Codable, Sendable, Equatable {
    public let id: UUID
    public let role: Role
    public var content: String                    // mutable so we can append streaming chunks
    public let citations: [CitationSource]
    public let refusal: RefusalType?
    public let phiRedacted: Bool
    public let timestamp: Date
    public var isStreaming: Bool
    public var rating: Rating?
    public var followUps: [String] = []           // populated post-stream from FollowUpService
    public var calculatorSuggestion: String?       // calculator id when CalculatorSuggester matches the question
    public var calculatorPreset: [String: Double] = [:]  // values pulled from the question to pre-fill calculators
    public var libraryEntryIDs: [String] = []      // entry IDs that grounded this answer — shown as deep-dive chips

    public enum Role: String, Codable, Sendable {
        case user
        case assistant
    }

    public enum Rating: String, Codable, Sendable {
        case thumbsUp
        case thumbsDown
    }

    public init(
        id: UUID = UUID(),
        role: Role,
        content: String,
        citations: [CitationSource] = [],
        refusal: RefusalType? = nil,
        phiRedacted: Bool = false,
        timestamp: Date = Date(),
        isStreaming: Bool = false,
        rating: Rating? = nil
    ) {
        self.id = id
        self.role = role
        self.content = content
        self.citations = citations
        self.refusal = refusal
        self.phiRedacted = phiRedacted
        self.timestamp = timestamp
        self.isStreaming = isStreaming
        self.rating = rating
    }
}

public struct AskConversation: Identifiable, Codable, Sendable {
    public let id: UUID
    public var title: String                      // first user message, truncated
    public var messages: [AskMessage]
    public var startedAt: Date
    public var lastUpdatedAt: Date

    public init(id: UUID = UUID(), title: String = "New conversation", messages: [AskMessage] = [], startedAt: Date = Date(), lastUpdatedAt: Date = Date()) {
        self.id = id
        self.title = title
        self.messages = messages
        self.startedAt = startedAt
        self.lastUpdatedAt = lastUpdatedAt
    }

    public mutating func append(_ message: AskMessage) {
        messages.append(message)
        if title == "New conversation", message.role == .user {
            title = String(message.content.prefix(60))
        }
        lastUpdatedAt = Date()
    }
}
