import Foundation
import OSLog
import Supabase

private let caseLog = Logger(subsystem: "app.nursemind.ios", category: "MicroCase")

/// What the nurse answered, kept on device (source of truth for the UI) and
/// mirrored to `micro_case_answers` for the dashboard. No text, no score:
/// one row per case with the chosen option and whether it was the best step.
@MainActor
@Observable
public final class MicroCaseProgress {
    public static let shared = MicroCaseProgress()

    public struct Answer: Codable, Equatable, Sendable {
        public let caseID: String
        public let chosenIndex: Int
        public let correct: Bool
        public let answeredOn: String   // yyyy-MM-dd, local
        public let answeredAt: Date
    }

    private static let key = "nm.microcase.answers"
    private let defaults: UserDefaults
    public private(set) var answers: [String: Answer]

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        if let data = defaults.data(forKey: Self.key),
           let decoded = try? JSONDecoder().decode([String: Answer].self, from: data) {
            self.answers = decoded
        } else {
            self.answers = [:]
        }
    }

    public func answer(for caseID: String) -> Answer? { answers[caseID] }

    /// First answer wins; there is no retry.
    @discardableResult
    public func record(_ microCase: MicroCase, chosenIndex: Int, now: Date = Date()) -> Answer {
        if let existing = answers[microCase.id] { return existing }
        let answer = Answer(
            caseID: microCase.id,
            chosenIndex: chosenIndex,
            correct: chosenIndex == microCase.bestOptionIndex,
            answeredOn: MicroCaseRegistry.dayKey(now),
            answeredAt: now
        )
        answers[microCase.id] = answer
        persist()
        Task { await upload(answer) }
        return answer
    }

    private func persist() {
        if let data = try? JSONEncoder().encode(answers) {
            defaults.set(data, forKey: Self.key)
        }
    }

    private struct Row: Encodable {
        let user_id: UUID
        let case_id: String
        let answered_on: String
        let chosen_option: Int
        let correct: Bool
        let answered_at: Date
    }

    /// Best effort; the row is a dashboard aggregate, never read back.
    private func upload(_ answer: Answer) async {
        guard let client = SupabaseService.shared.client,
              let userID = SupabaseService.shared.currentUserID else { return }
        do {
            try await client
                .from("micro_case_answers")
                .upsert(Row(user_id: userID, case_id: answer.caseID, answered_on: answer.answeredOn,
                            chosen_option: answer.chosenIndex, correct: answer.correct, answered_at: answer.answeredAt),
                        onConflict: "user_id,answered_on")
                .execute()
        } catch {
            caseLog.debug("micro_case_answers upsert failed: \(error.localizedDescription, privacy: .public)")
        }
    }
}

/// Analytics for the daily case. Ids, booleans and buckets only.
@MainActor
enum MicroCaseAnalytics {
    static var sink: AnalyticsSink = AnalyticsSinks.postHog

    static func shown(_ c: MicroCase, answered: Bool) {
        sink("micro_case_shown", ["case_id": c.id, "answered": answered])
    }
    static func opened(_ c: MicroCase, readOnly: Bool) {
        sink("micro_case_opened", ["case_id": c.id, "read_only": readOnly])
    }
    static func answered(_ c: MicroCase, correct: Bool, secondsToAnswer: TimeInterval) {
        sink("micro_case_answered", ["case_id": c.id, "correct": correct, "seconds_bucket": bucket(secondsToAnswer)])
    }
    static func relatedOpened(_ c: MicroCase, entryID: String) {
        sink("micro_case_related_opened", ["case_id": c.id, "entry_id": entryID])
    }

    static func bucket(_ seconds: TimeInterval) -> String {
        switch seconds {
        case ..<10:  return "<10s"
        case ..<30:  return "10-30s"
        case ..<60:  return "30-60s"
        default:     return "60s+"
        }
    }
}
