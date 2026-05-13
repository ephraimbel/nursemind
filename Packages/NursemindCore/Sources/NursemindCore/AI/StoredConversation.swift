import Foundation
import SwiftData

/// SwiftData model that persists an entire `AskConversation` across app
/// launches. Stores the full conversation as a JSON blob (since
/// `AskConversation` is already `Codable`) plus denormalized fields for
/// efficient list display without decoding.
@Model
public final class StoredConversation {
    @Attribute(.unique) public var id: UUID
    public var title: String
    public var startedAt: Date
    public var lastUpdatedAt: Date
    public var messageCount: Int
    /// JSON-encoded `AskConversation`. Decoded on resume.
    public var conversationData: Data

    public init(from conversation: AskConversation) {
        self.id = conversation.id
        self.title = conversation.title
        self.startedAt = conversation.startedAt
        self.lastUpdatedAt = conversation.lastUpdatedAt
        self.messageCount = conversation.messages.count
        self.conversationData = (try? JSONEncoder().encode(conversation)) ?? Data()
    }

    /// Updates the stored row in place from the latest live conversation.
    /// Called on upsert when the user keeps adding to an existing thread.
    public func update(from conversation: AskConversation) {
        self.title = conversation.title
        self.lastUpdatedAt = conversation.lastUpdatedAt
        self.messageCount = conversation.messages.count
        self.conversationData = (try? JSONEncoder().encode(conversation)) ?? Data()
    }

    /// Decodes the stored JSON back into a live `AskConversation` for resume.
    /// Returns nil if the data is corrupt — caller falls back to a fresh
    /// conversation. (In practice this never happens; the same encoder/decoder
    /// pair has been used since v1.)
    public func toAskConversation() -> AskConversation? {
        try? JSONDecoder().decode(AskConversation.self, from: conversationData)
    }
}
