import SwiftUI
import UIKit

/// Canvas-height tiers, for the few surfaces where display type should grow
/// with the screen rather than sit at one size everywhere.
///
/// Most of the app deliberately uses fixed sizing — a drug entry reads the same
/// on every phone. This exists for the full-page moments (paywall, onboarding)
/// where a fixed header leaves a 6.9" screen looking under-filled while the
/// same size is already tight on a 4.7".
public enum NMDeviceSize {

    /// Logical screen height in points. Falls back to the iPhone 15/16 height
    /// when no scene is attached (previews, unit tests).
    public static var screenHeight: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first?
            .screen.bounds.height ?? 852
    }

    /// iPhone 15/16-class and larger — 852pt and up. Excludes the 13 mini
    /// (812) and SE (667), where the larger type would crowd rather than fill.
    public static var isTallCanvas: Bool { screenHeight >= 850 }
}
