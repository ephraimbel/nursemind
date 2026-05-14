import UIKit

/// Lightweight haptic feedback wrapper. Each call prepares + fires in a
/// single function so callers don't need to think about generator lifetime.
/// Use sparingly — haptics are seasoning, not the meal.
enum Haptic {
    /// Light tap. Use for navigation, primary CTAs, back buttons.
    static func light() {
        let gen = UIImpactFeedbackGenerator(style: .light)
        gen.prepare()
        gen.impactOccurred()
    }

    /// Medium tap. Use for committal actions like form submissions.
    static func medium() {
        let gen = UIImpactFeedbackGenerator(style: .medium)
        gen.prepare()
        gen.impactOccurred()
    }

    /// Selection click. Use for picker / option-row changes.
    static func selection() {
        let gen = UISelectionFeedbackGenerator()
        gen.prepare()
        gen.selectionChanged()
    }

    /// Success notification. Use sparingly for true completion moments
    /// (onboarding done, payment confirmed, etc.).
    static func success() {
        let gen = UINotificationFeedbackGenerator()
        gen.prepare()
        gen.notificationOccurred(.success)
    }

    /// Warning notification. Use for one-shot moments when the app declines
    /// to do what the user asked — refusals (PHI, off-scope, service down),
    /// or surfacing a quota wall. Distinct from `.error()` which signals a
    /// system failure rather than a deliberate boundary.
    static func warning() {
        let gen = UINotificationFeedbackGenerator()
        gen.prepare()
        gen.notificationOccurred(.warning)
    }
}
