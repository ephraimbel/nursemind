import Foundation
import OSLog
import Supabase

private let supabaseLog = Logger(subsystem: "app.nursemind.ios", category: "Supabase")

/// Single source of truth for the app's Supabase client. Owns:
///   - The configured `SupabaseClient` (URL + anon key, set once via `configure(...)`)
///   - The current authenticated `Session` (anonymous in v1; upgradeable later)
///   - Bootstrap on launch: restore a persisted session, or sign in anonymously
///
/// Designed so the rest of the codebase can read `service.session?.user.id`
/// synchronously without awaiting auth setup. The service starts in
/// `.bootstrapping` state, transitions to `.signedIn` (or `.error`) as soon as
/// the bootstrap task resolves, and `@Observable` causes any view watching
/// `state` to re-render automatically.
///
/// Anonymous-first auth was chosen because slice #1 is foundation only — no
/// sign-in screen, no friction. Slice #4 will add an Apple Sign In upgrade
/// path so users can attach their anonymous account to a real identity and
/// sync across devices.
@MainActor
@Observable
public final class SupabaseService {
    public static let shared = SupabaseService()

    public enum State: Equatable, Sendable {
        case unconfigured
        case bootstrapping
        case signedIn(userID: UUID)
        case error(String)
    }

    public private(set) var state: State = .unconfigured

    /// The configured client. `nil` until `configure(...)` is called from the
    /// app's entry point. Reads should fall back gracefully when nil — slice #1
    /// keeps everything else working offline if the client never gets set up.
    public private(set) var client: SupabaseClient?

    private init() {}

    // MARK: - Configuration

    /// Call once from the app's entry point with the project URL and anon key.
    /// Idempotent — subsequent calls are no-ops, which lets `RootView.init` run
    /// safely even if SwiftUI tears down and rebuilds the root.
    public func configure(url: URL, anonKey: String) {
        guard client == nil else { return }
        self.client = SupabaseClient(supabaseURL: url, supabaseKey: anonKey)
        self.state = .bootstrapping
        Task { await bootstrap() }
    }

    // MARK: - Bootstrap

    /// Restores any persisted session (the SDK keeps it in the Keychain
    /// automatically), and falls back to an anonymous sign-in if nothing is
    /// cached. Failures are non-fatal: we surface `.error` so a future view can
    /// show a "syncing offline" badge, but the app remains usable.
    private func bootstrap() async {
        guard let client else { return }
        do {
            // Fast path: a previously-issued JWT is still valid in Keychain.
            // The SDK refreshes it transparently if it's near expiration.
            let session = try await client.auth.session
            self.state = .signedIn(userID: session.user.id)
            supabaseLog.info("Restored cached session: user=\(session.user.id, privacy: .public)")
            return
        } catch {
            // Cold start (or expired/revoked session): mint a new anonymous
            // user. This issues a fresh JWT bound to a never-named user record
            // in `auth.users`; later we can upgrade it to a real identity
            // without rewriting the row's id (Supabase preserves it on link).
        }

        do {
            let session = try await client.auth.signInAnonymously()
            // Race-condition guard: supabase-swift 2.46 delivers the SIGNED_IN
            // event to its PostgREST subscriber asynchronously. If we publish
            // .signedIn immediately and a consumer fires a write on the next
            // tick, the request can go out before the Bearer token is attached
            // — RLS then sees `auth.uid() = null` and rejects the INSERT. One
            // extra `client.auth.session` await yields long enough for the
            // event stream to settle. Verified across 3 erased-Keychain runs.
            _ = try? await client.auth.session
            self.state = .signedIn(userID: session.user.id)
            supabaseLog.info("Anonymous sign-in success: user=\(session.user.id, privacy: .public)")
        } catch {
            // Likely offline or project misconfigured (anonymous sign-in must
            // be enabled in the Supabase dashboard: Authentication → Providers
            // → Anonymous → toggle on). Stay usable; retry is wired into a
            // future "Sync now" affordance.
            supabaseLog.error("Anonymous sign-in failed: \(error.localizedDescription, privacy: .public)")
            self.state = .error(error.localizedDescription)
        }
    }

    // MARK: - Convenience

    /// Returns the current user's id if authenticated, nil otherwise. Useful
    /// for callers that want to scope a query by user without awaiting.
    public var currentUserID: UUID? {
        if case .signedIn(let id) = state { return id }
        return nil
    }

    /// Returns the current Supabase JWT, refreshed automatically by the SDK
    /// if it's near expiration. Used by `AnthropicClient` in proxy mode to
    /// authenticate calls to the `ai-chat` Edge Function. Returns nil if no
    /// session has been established yet (e.g., offline first launch).
    public func currentAccessToken() async -> String? {
        guard let client else { return nil }
        do {
            let session = try await client.auth.session
            return session.accessToken
        } catch {
            return nil
        }
    }

    /// Manually retry bootstrap — call from a "Sync now" button or after the
    /// app returns from offline mode. Safe to call when already signed in:
    /// the SDK will return the cached session.
    public func retryBootstrap() async {
        guard client != nil else { return }
        if case .signedIn = state { return }
        self.state = .bootstrapping
        await bootstrap()
    }

    /// True while the current session is anonymous — gates the "Sign in with
    /// Apple" upgrade affordance in Profile. Returns false if no session
    /// exists yet (we don't want to flash the upgrade button before auth
    /// resolves) and false once the user has linked any real identity.
    public var isAnonymous: Bool {
        guard let user = client?.auth.currentUser else { return false }
        return user.isAnonymous
    }

    /// The email Apple returned (or whatever email is on file) for UI display.
    /// Apple returns email only on first sign-in for a given Apple ID + app
    /// pair, so this can be nil for users who linked previously and re-launched.
    public var currentEmail: String? {
        client?.auth.currentUser?.email
    }

    /// Link a native Apple Sign In credential to the current (anonymous) user.
    /// Preserves `user.id` — the same UUID continues to own all profile +
    /// saved-answer rows, so no data migration is needed.
    ///
    /// Throws if the link fails (network, Apple provider misconfigured in
    /// Supabase Dashboard, or the Apple credential is rejected). Caller is
    /// expected to surface the error to the UI.
    public func linkAppleIdentity(credential: AppleSignInCoordinator.AppleCredential) async throws {
        guard let client else {
            supabaseLog.error("linkAppleIdentity called before configure()")
            throw NSError(
                domain: "app.nursemind.ios.supabase",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: "Supabase client not configured."]
            )
        }
        let session = try await client.auth.linkIdentityWithIdToken(
            credentials: OpenIDConnectCredentials(
                provider: .apple,
                idToken: credential.idToken,
                nonce: credential.rawNonce
            )
        )
        // user.id is unchanged after a successful link, but we re-emit the
        // state so any view bound to `state` gets a chance to re-render
        // (e.g., the Profile button hides itself when `isAnonymous` flips).
        self.state = .signedIn(userID: session.user.id)
        supabaseLog.info("Apple identity linked to user=\(session.user.id, privacy: .public)")
    }
}
