import AuthenticationServices
import CryptoKit
import Foundation
import UIKit

/// Native Apple Sign In coordinator. Wraps `ASAuthorizationController` in an
/// async/await API that returns the `id_token` + `nonce` needed to link the
/// Apple identity to the current anonymous Supabase user via
/// `auth.linkIdentityWithIdToken(...)`. Preserves the user's UUID so all
/// profile + saved-answer data stays attached.
///
/// Nonce flow follows Apple's recommended pattern:
///   1. Generate a random raw string (returned to Supabase as-is)
///   2. SHA-256 hash it and send the hash to Apple via the request's `nonce`
///   3. Apple includes the hash in the returned id_token claims; Supabase
///      verifies the raw nonce matches the hash, defeating replay attacks
///
/// Usage:
///   let coordinator = AppleSignInCoordinator()
///   let credential = try await coordinator.performSignIn()
///   try await SupabaseService.shared.linkAppleIdentity(credential: credential)
@MainActor
public final class AppleSignInCoordinator: NSObject {
    public struct AppleCredential: Sendable {
        public let idToken: String
        public let rawNonce: String
        /// Optional email returned only on first sign-in for this Apple ID +
        /// app pair. Apple will not re-issue it on subsequent sign-ins.
        public let email: String?
    }

    public enum AppleSignInError: Error, LocalizedError {
        case missingIdentityToken
        case invalidResponse
        case userCancelled

        public var errorDescription: String? {
            switch self {
            case .missingIdentityToken: return "Apple Sign In didn't return an identity token."
            case .invalidResponse:      return "Apple Sign In returned an unexpected response."
            case .userCancelled:        return "Apple Sign In was cancelled."
            }
        }
    }

    /// Stable across the lifetime of one sign-in attempt; set in
    /// `performSignIn`, cleared in the delegate callbacks.
    private var currentRawNonce: String?
    private var continuation: CheckedContinuation<AppleCredential, Error>?

    public override init() {
        super.init()
    }

    /// Trigger the native Sign in with Apple sheet and resolve with the
    /// `id_token` + raw nonce when the user completes authentication.
    public func performSignIn() async throws -> AppleCredential {
        try await withCheckedThrowingContinuation { continuation in
            let raw = Self.randomNonceString()
            self.currentRawNonce = raw
            self.continuation = continuation

            let provider = ASAuthorizationAppleIDProvider()
            let request = provider.createRequest()
            // Email scope so we can show "Signed in as <email>" in the
            // profile header. Apple may return a relay address — that's fine.
            request.requestedScopes = [.email]
            request.nonce = Self.sha256(raw)

            let controller = ASAuthorizationController(authorizationRequests: [request])
            controller.delegate = self
            controller.presentationContextProvider = self
            controller.performRequests()
        }
    }

    // MARK: - Nonce helpers

    /// Apple recommends 32 chars from a charset that survives URL encoding
    /// without reserved-character collisions.
    private static func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remaining = length

        while remaining > 0 {
            var random = [UInt8](repeating: 0, count: 16)
            _ = SecRandomCopyBytes(kSecRandomDefault, random.count, &random)
            for byte in random {
                guard remaining > 0 else { break }
                if byte < charset.count {
                    result.append(charset[Int(byte)])
                    remaining -= 1
                }
            }
        }
        return result
    }

    private static func sha256(_ input: String) -> String {
        let hash = SHA256.hash(data: Data(input.utf8))
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}

// MARK: - ASAuthorizationControllerDelegate

extension AppleSignInCoordinator: ASAuthorizationControllerDelegate {
    public func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        guard let credential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            resume(throwing: AppleSignInError.invalidResponse)
            return
        }
        guard let rawNonce = currentRawNonce else {
            resume(throwing: AppleSignInError.invalidResponse)
            return
        }
        guard let tokenData = credential.identityToken,
              let idToken = String(data: tokenData, encoding: .utf8) else {
            resume(throwing: AppleSignInError.missingIdentityToken)
            return
        }
        let result = AppleCredential(
            idToken: idToken,
            rawNonce: rawNonce,
            email: credential.email
        )
        resume(returning: result)
    }

    public func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: any Error
    ) {
        // ASAuthorizationError.canceled = 1001 — surface as a typed error so
        // the UI can no-op silently rather than showing an alert.
        if let asError = error as? ASAuthorizationError, asError.code == .canceled {
            resume(throwing: AppleSignInError.userCancelled)
        } else {
            resume(throwing: error)
        }
    }

    private func resume(throwing error: Error) {
        continuation?.resume(throwing: error)
        continuation = nil
        currentRawNonce = nil
    }

    private func resume(returning credential: AppleCredential) {
        continuation?.resume(returning: credential)
        continuation = nil
        currentRawNonce = nil
    }
}

// MARK: - ASAuthorizationControllerPresentationContextProviding

extension AppleSignInCoordinator: ASAuthorizationControllerPresentationContextProviding {
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        // Find a usable window across all connected scenes. iPad in iPhone-
        // compatibility mode sometimes reports scene states other than
        // `.foregroundActive` even when fully visible, which is why we don't
        // filter on activation state up-front — we just look for any
        // UIWindowScene with at least one window. App Review rejection
        // 2.1(a) on iPadOS 26 traced to this issue: the prior anchor lookup
        // failed and returned a disconnected `UIWindow()`, which Apple's
        // auth sheet refuses to present in.
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            // Prefer key window if there is one.
            if let keyWindow = windowScene.windows.first(where: \.isKeyWindow) {
                return keyWindow
            }
        }
        // Second pass — accept any window from any scene, even if not "key."
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene,
                  let firstWindow = windowScene.windows.first else { continue }
            return firstWindow
        }
        // Last-resort fallback. Reachable only if the app is genuinely
        // background — Apple's auth flow will fail with `noAuthAnchor` and
        // the user-facing error message will reflect that.
        return UIWindow()
    }
}
