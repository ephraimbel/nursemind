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
}
