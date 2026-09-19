import Foundation
import OSLog
import Supabase

private let storageLog = Logger(subsystem: "app.nursemind.ios", category: "AuthStorage")

/// Session storage for the Supabase client: Keychain first, with an
/// in-process copy as the fallback.
///
/// supabase-swift keeps the session only where this storage puts it and
/// re-reads it on every request. When the Keychain refuses a call (no
/// entitlement, device not yet unlocked, a corrupt item) the SDK would
/// otherwise see "session missing", drop the bearer token, and send every
/// write as `anon`, which row-level security rejects without a single log
/// line; the next launch would then mint a fresh anonymous user. With the
/// in-process copy the current launch keeps working as the signed-in user
/// and the failure is logged, so only cross-launch persistence is at the
/// Keychain's mercy.
public final class ResilientAuthStorage: AuthLocalStorage, @unchecked Sendable {
    private let backing: any AuthLocalStorage
    private let lock = NSLock()
    private var memory: [String: Data] = [:]
    private var reportedFallbackKeys: Set<String> = []

    public init(backing: any AuthLocalStorage = KeychainLocalStorage()) {
        self.backing = backing
    }

    public func store(key: String, value: Data) throws {
        lock.withLock { memory[key] = value }
        do {
            try backing.store(key: key, value: value)
        } catch {
            storageLog.error("Keychain store failed for \(key, privacy: .public): \(error.localizedDescription, privacy: .public). Session held in memory for this launch only.")
        }
    }

    public func retrieve(key: String) throws -> Data? {
        do {
            if let value = try backing.retrieve(key: key) {
                lock.withLock { memory[key] = value }
                return value
            }
        } catch {
            // The SDK's Keychain wrapper throws for a missing item too, and
            // its storage migrations probe legacy keys on every read, so a
            // throw is only worth an error line when it actually changes the
            // outcome: an in-memory copy exists and is about to be served.
            let (fallback, firstReport) = lock.withLock {
                (memory[key], memory[key] != nil && reportedFallbackKeys.insert(key).inserted)
            }
            if firstReport {
                // The SDK re-reads the session on every request; one error
                // line per key per launch is enough to see the degradation.
                storageLog.error("Keychain retrieve failed for \(key, privacy: .public): \(error.localizedDescription, privacy: .public). Serving the in-memory copy for the rest of this launch.")
            } else {
                storageLog.debug("Keychain retrieve for \(key, privacy: .public): \(error.localizedDescription, privacy: .public)")
            }
            return fallback
        }
        return lock.withLock { memory[key] }
    }

    public func remove(key: String) throws {
        lock.withLock { _ = memory.removeValue(forKey: key) }
        do {
            try backing.remove(key: key)
        } catch {
            storageLog.debug("Keychain remove for \(key, privacy: .public): \(error.localizedDescription, privacy: .public)")
        }
    }
}

/// Routes the SDK's warnings and errors into the unified log so auth and
/// storage failures are visible next to the app's logs. Debug and verbose
/// levels are dropped: the SDK logs full request and response bodies there.
struct SupabaseUnifiedLogger: SupabaseLogger {
    private static let log = Logger(subsystem: "app.nursemind.ios", category: "SupabaseSDK")

    func log(message: SupabaseLogMessage) {
        switch message.level {
        case .error:
            Self.log.error("\(message.system, privacy: .public): \(message.message, privacy: .public)")
        case .warning:
            Self.log.warning("\(message.system, privacy: .public): \(message.message, privacy: .public)")
        case .debug, .verbose:
            break
        }
    }
}
