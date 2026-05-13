import Foundation
import OSLog
import Supabase

private let flagLog = Logger(subsystem: "app.nursemind.ios", category: "FlagReports")

/// Submits user-flagged AI answers to the server-side review queue
/// (`public.flag_reports`). Fire-and-forget from the caller's perspective —
/// the UI shows a toast, this service does the network call in a Task and
/// logs failures via OSLog. No client-side persistence/retry: a failed
/// submission is acceptable to lose because the user will be reading the
/// answer again right after, can re-flag if they care enough.
@MainActor
public final class FlagReportService {
    public static let shared = FlagReportService()

    private let supabase: SupabaseService

    private init(supabase: SupabaseService = .shared) {
        self.supabase = supabase
    }

    /// Submit a flag report for the AI message the user is currently looking
    /// at. `reason` is optional free text; the user is prompted via an alert
    /// in the calling view but can submit empty.
    public func submit(
        question: String,
        answerMarkdown: String,
        citations: [CitationSource],
        sourceMessageID: UUID,
        reason: String?
    ) {
        guard let client = supabase.client,
              let userID = supabase.currentUserID else {
            flagLog.warning("Flag submit dropped — not signed in")
            return
        }
        let upsert = FlagReportInsert(
            userID: userID,
            question: question,
            answerMarkdown: answerMarkdown,
            citationsData: citations,
            sourceMessageID: sourceMessageID,
            reason: reason?.isEmpty == true ? nil : reason
        )
        Task { [weak self] in
            do {
                _ = try await client
                    .from("flag_reports")
                    .insert(upsert)
                    .execute()
                flagLog.info("Flag report submitted")
            } catch {
                flagLog.error("Flag report failed: \(error.localizedDescription, privacy: .public)")
                _ = self
            }
        }
    }
}

/// Wire-format insert payload — id, status, created_at all default server-side.
public struct FlagReportInsert: Codable, Sendable {
    public var userID: UUID
    public var question: String
    public var answerMarkdown: String
    public var citationsData: [CitationSource]
    public var sourceMessageID: UUID
    public var reason: String?

    enum CodingKeys: String, CodingKey {
        case userID            = "user_id"
        case question
        case answerMarkdown    = "answer_markdown"
        case citationsData     = "citations_data"
        case sourceMessageID   = "source_message_id"
        case reason
    }
}
