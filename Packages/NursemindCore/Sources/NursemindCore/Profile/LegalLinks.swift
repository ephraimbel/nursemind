import Foundation

/// Canonical public URLs for NurseMind's legal documents. The same documents
/// are bundled in the app at `Resources/Legal/{terms,privacy}.md` and
/// rendered offline by `LegalDocumentView` — these URLs point to the hosted
/// web versions at nursemind.app for users who want to share or bookmark.
///
/// Single source of truth. Reference from:
///   - `LegalDocumentView` "Open on web" affordance
///   - App Store Connect → App Information → Privacy Policy URL
///   - App Store Connect → App Description (Terms link if using custom EULA)
///   - RevenueCat Dashboard → Paywall editor → Footer Links
///
/// Keep the hosted markdown at nursemind.app in sync with the bundled
/// markdown in this repo — they're the same legal document, just two
/// surfaces (offline-in-app vs online-on-web).
public enum LegalLinks {
    /// Canonical Terms of Use URL. iOS app falls back to the bundled markdown
    /// if this URL is unreachable, but external surfaces (App Store Connect,
    /// RevenueCat paywall footer, marketing emails) all reference this.
    public static let termsOfUse = URL(string: "https://nursemind.app/terms")!

    /// Canonical Privacy Policy URL.
    public static let privacyPolicy = URL(string: "https://nursemind.app/privacy")!

    /// Support contact (used in legal docs + App Review notes).
    public static let supportEmail = "support@nursemind.app"

    /// Privacy contact for GDPR/CCPA requests.
    public static let privacyEmail = "privacy@nursemind.app"
}
