import Foundation
import Testing
@testable import NursemindCore

@Suite("Library view offline queue", .serialized)
@MainActor
struct LibraryViewLoggerTests {
    private let queueKey = "nm.libraryViews.offlineQueue"

    @Test func overlappingFlushDoesNotResendOrRemoveNewViews() async throws {
        let suite = "LibraryViewLoggerTests." + UUID().uuidString
        let defaults = try #require(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        let logger = LibraryViewLogger(defaults: defaults)
        let old = view("reference:old", time: 1)
        let new = view("reference:new", time: 2)
        logger.enqueueOffline(old)
        await logger.flushOfflineQueue { sent in
            #expect(sent == [old])
            await logger.flushOfflineQueue { _ in
                Issue.record("An overlapping flush resent an in-flight batch")
            }
            logger.enqueueOffline(new)
        }
        #expect(try queue(defaults) == [new])
        await logger.flushOfflineQueue { #expect($0 == [new]) }
        #expect(try queue(defaults).isEmpty)
    }

    @Test func capacityEvictionDuringFlushPreservesTheUnsentView() async throws {
        let suite = "LibraryViewLoggerTests." + UUID().uuidString
        let defaults = try #require(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        let initial = (0..<1000).map { view("reference:\($0)", time: Double($0)) }
        defaults.set(try JSONEncoder().encode(initial), forKey: queueKey)
        let logger = LibraryViewLogger(defaults: defaults)
        let new = view("reference:new", time: 1001)
        await logger.flushOfflineQueue { sent in
            #expect(sent == initial)
            logger.enqueueOffline(new)
        }
        #expect(try queue(defaults) == [new])
    }

    @Test func failedFlushRetainsViewsAndCanRetry() async throws {
        enum Failure: Error { case offline }
        let suite = "LibraryViewLoggerTests." + UUID().uuidString
        let defaults = try #require(UserDefaults(suiteName: suite))
        defer { defaults.removePersistentDomain(forName: suite) }
        let logger = LibraryViewLogger(defaults: defaults)
        let old = view("reference:old", time: 1)
        let new = view("reference:new", time: 2)
        logger.enqueueOffline(old)
        await logger.flushOfflineQueue { _ in
            logger.enqueueOffline(new)
            throw Failure.offline
        }
        #expect(try queue(defaults) == [old, new])
        await logger.flushOfflineQueue { #expect($0 == [old, new]) }
        #expect(try queue(defaults).isEmpty)
    }

    private func view(_ slug: String, time: Double) -> LibraryViewLogger.QueuedView {
        .init(entrySlug: slug, durationSec: 10, viewedAt: Date(timeIntervalSince1970: time))
    }

    private func queue(_ defaults: UserDefaults) throws -> [LibraryViewLogger.QueuedView] {
        let data = try #require(defaults.data(forKey: queueKey))
        return try JSONDecoder().decode([LibraryViewLogger.QueuedView].self, from: data)
    }
}
