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

    /// iPhone 13-class and larger — 844pt and up, which covers 13, 14, 15, 16
    /// and 17 plus every Pro/Plus/Max variant. The cutoff sits at 840 rather
    /// than 850 deliberately: 13 and 14 are 844 and 15 is 852, so a 850
    /// threshold would have split otherwise-identical phones across two
    /// different designs over 8 points. Below it sit only the 13 mini (812)
    /// and SE (667), where the larger type would crowd rather than fill.
    public static var isTallCanvas: Bool { screenHeight >= 840 }
}
