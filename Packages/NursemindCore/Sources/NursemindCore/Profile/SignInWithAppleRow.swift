import AuthenticationServices
import OSLog
import SwiftUI

private let appleSignInLog = Logger(subsystem: "app.nursemind.ios", category: "AppleSignIn")

/// Profile-tab row that initiates a native Sign in with Apple flow and links
/// the resulting Apple identity to the currently signed-in anonymous user via
/// Supabase. After a successful link, `SupabaseService.isAnonymous` flips to
/// false and the parent view hides this row.
///
/// Keeps state local: button + a presented alert for errors. Cancellation is
/// silent (Apple Sign In treats user-initiated cancel as a no-op, not a
/// failure that needs a banner).
public struct SignInWithAppleRow: View {
    @State private var isLinking: Bool = false
    @State private var errorMessage: String?
    @State private var coordinator = AppleSignInCoordinator()

    public init() {}

    public var body: some View {
        Button(action: handleTap) {
            HStack(spacing: NMSpace.base) {
                ZStack {
                    Image(systemName: "applelogo")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundStyle(NMColor.textPrimary)
                        .opacity(isLinking ? 0 : 1)
                    if isLinking {
                        ProgressView()
                            .controlSize(.small)
                    }
                }
                .frame(width: 24, alignment: .center)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Sign in with Apple")
                        .font(NMFont.bodyLG)
                        .foregroundStyle(NMColor.textPrimary)
                    Text("Save your library and sync across devices")
                        .font(NMFont.displayItalicSM)
                        .foregroundStyle(NMColor.textTertiary)
                }
                Spacer(minLength: 0)
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            }
            .padding(.vertical, NMSpace.lg)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .disabled(isLinking)
        .alert("Sign in failed", isPresented: errorBinding) {
            Button("OK", role: .cancel) { errorMessage = nil }
        } message: {
            Text(errorMessage ?? "")
        }
    }

    private func handleTap() {
        guard !isLinking else { return }
        isLinking = true
        Task {
            do {
                let credential = try await coordinator.performSignIn()
                try await SupabaseService.shared.linkAppleIdentity(credential: credential)
                appleSignInLog.info("Linked Apple identity")
            } catch AppleSignInCoordinator.AppleSignInError.userCancelled {
                // Silent no-op — user cancelled the system sheet, no banner.
                appleSignInLog.debug("User cancelled Apple Sign In")
            } catch {
                appleSignInLog.error("Apple Sign In failed: \(error.localizedDescription, privacy: .public)")
                errorMessage = error.localizedDescription
            }
            isLinking = false
        }
    }

    private var errorBinding: Binding<Bool> {
        Binding(
            get: { errorMessage != nil },
            set: { if !$0 { errorMessage = nil } }
        )
    }
}
