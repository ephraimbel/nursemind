import Foundation

/// Apple Guideline 1.4.2 kill switch. App Review has read 1.4.2 as covering
/// any clinical calculator regardless of whether it computes a dose (their
/// build-22 rejection screenshotted MELD, a mortality score), and the
/// publisher-of-record requirement cannot be satisfied in-app. The entire
/// calculator surface is therefore withheld from App Store builds while the
/// Review Board appeal is pending. Flip to `true` only after Apple approves
/// the surface in writing; `CalculatorRegistryGuardTests` pins the current
/// value so a stray toggle can't ship silently.
public enum ToolsAvailability {
    public static let calculatorsEnabled = false
}
