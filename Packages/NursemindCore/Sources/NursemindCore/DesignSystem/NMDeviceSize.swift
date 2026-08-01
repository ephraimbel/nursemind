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

    /// Three tiers, because two could not serve both ends. A 6.9" screen looks
    /// under-filled at the size an iPhone 14 can actually hold, and the 14
    /// overflows at the size that fills the 6.9".
    ///
    /// Boundaries land between real device families, never inside one:
    ///   compact  <840 — SE (667), 13 mini (812)
    ///   standard  840–899 — 13/14 (844), 15/16 (852), 17 (874)
    ///   large     >=900 — Plus (932), Pro Max (956)
    ///
    /// 840 rather than 850 matters: 13 and 14 are 844 and 15 is 852, so a 850
    /// cutoff would have split otherwise-identical phones over 8 points.
    public enum CanvasTier { case compact, standard, large }

    public static var canvasTier: CanvasTier {
        let height = screenHeight
        if height >= 900 { return .large }
        if height >= 840 { return .standard }
        return .compact
    }

    public static var isTallCanvas: Bool { canvasTier != .compact }
}
