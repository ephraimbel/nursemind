import Foundation
import OSLog
import RevenueCat
import Supabase
import SwiftData

private let deletionLog = Logger(subsystem: "app.nursemind.ios", category: "AccountDeletion")

/// Performs an end-to-end account deletion: calls the `delete_my_account()`
/// Postgres RPC (which removes the user from `auth.users`, cascading to
/// `profiles`, `saved_answers`, `daily_usage`), then locally wipes SwiftData,
/// UserDefaults, the Keychain Supabase session, and resets RevenueCat to an
/// anonymous user. After this completes successfully, the app is in the same
/// state as a fresh install — onboarding will run again on next launch.
///
/// Apple Guideline 5.1.1(v) requires this surface for any app that lets users
/// create an account. We anonymous-auth on first launch, which counts as
/// account creation, so this is mandatory for v1 review.
@MainActor
public final class AccountDeletionService {
    public static let shared = AccountDeletionService()

    public enum DeletionError: Error, LocalizedError {
        case notSignedIn
        case serverFailed(String)

        public var errorDescription: String? {
            switch self {
            case .notSignedIn:
                return "You're not signed in — nothing to delete."
            case .serverFailed(let message):
                return "Couldn't delete your account: \(message)"
            }
        }
    }

    private init() {}

    /// Run the full deletion sequence. Throws if the server-side delete
    /// fails — local data is left intact in that case so the user can retry
    /// without ending up in a half-deleted state.
    public func deleteAccount(
        modelContainer: ModelContainer
    ) async throws {
        let supabase = SupabaseService.shared
        guard let client = supabase.client else {
            throw DeletionError.notSignedIn
        }
        guard supabase.currentUserID != nil else {
            throw DeletionError.notSignedIn
        }

        // 1. Server-side: invoke the SECURITY DEFINER RPC that nukes the
        //    user's row from auth.users and cascades the public data.
        do {
            try await client.rpc("delete_my_account").execute()
            deletionLog.info("Server-side account deletion succeeded")
        } catch {
            deletionLog.error("Server-side deletion failed: \(error.localizedDescription, privacy: .public)")
            throw DeletionError.serverFailed(error.localizedDescription)
        }

        // 2. Local-side cleanup. Best-effort — even if these throw, the
        //    server data is already gone. Order matters: sign out of services
        //    FIRST so background refresh tasks don't try to talk to a deleted
        //    session, then wipe persisted state.
        await wipeRevenueCat()
        await wipeSupabaseSession(client: client)
        wipeSwiftData(container: modelContainer)
        UserPreferences.shared.wipe()
        SavedAnswerSyncService.shared.resetForFreshAccount()
        ProfileSyncService.shared.resetForFreshAccount()
        RevenueCatService.shared.resetForFreshAccount()

        deletionLog.info("Local cleanup complete")
    }

    // MARK: - Cleanup helpers

    private func wipeRevenueCat() async {
        // RevenueCat's `logOut()` reverts the SDK to an anonymous appUserID.
        // Idempotent — if we were already anonymous, this is a no-op.
        do {
            _ = try await Purchases.shared.logOut()
        } catch {
            deletionLog.warning("RevenueCat logOut failed (non-fatal): \(error.localizedDescription, privacy: .public)")
        }
    }

    private func wipeSupabaseSession(client: SupabaseClient) async {
        // Sign out of all sessions (Keychain + refresh tokens). The user
        // record on the server is already gone — this just clears the
        // device's cached credentials.
        do {
            try await client.auth.signOut(scope: .local)
        } catch {
            deletionLog.warning("Supabase signOut failed (non-fatal): \(error.localizedDescription, privacy: .public)")
        }
    }

    private func wipeSwiftData(container: ModelContainer) {
        // Delete every SavedAnswer and StoredConversation in the SwiftData
        // store. Wrapped in best-effort try? — partial failure is acceptable
        // because the server data is already gone.
        let context = ModelContext(container)
        do {
            try context.delete(model: SavedAnswer.self)
            try context.delete(model: StoredConversation.self)
            try context.save()
        } catch {
            deletionLog.warning("SwiftData wipe failed (non-fatal): \(error.localizedDescription, privacy: .public)")
        }
    }
}
