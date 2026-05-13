import SwiftUI
import UIKit

/// All color tokens. Each `NMColor.x` is a `Color` with dynamic light/dark resolution
/// via UIColor providers, so the system reacts to user-mode changes automatically.
public enum NMColor {
    public static let bgPrimary       = dynamic(light: 0xF4F2EC, dark: 0x14130F)
    public static let bgElevated      = dynamic(light: 0xFBFAF6, dark: 0x1F1E18)
    public static let bgSecondary     = dynamic(light: 0xEDEAE2, dark: 0x1A1914)
    public static let bgTertiary      = dynamic(light: 0xE5E1D6, dark: 0x0F0E0A)

    public static let border          = dynamic(light: 0xD9D4C7, dark: 0x2D2B22)
    public static let borderSubtle    = dynamic(light: 0xE5E1D6, dark: 0x1F1E18)
    public static let borderStrong    = dynamic(light: 0x1A1F1A, dark: 0xF4F2EC)

    public static let textPrimary     = dynamic(light: 0x1A1F1A, dark: 0xF4F2EC)
    public static let textSecondary   = dynamic(light: 0x4A4F47, dark: 0xBAB7AC)
    public static let textTertiary    = dynamic(light: 0x8B8A82, dark: 0x8B8A82)
    public static let textQuaternary  = dynamic(light: 0xBAB7AC, dark: 0x4A4F47)

    public static let accent          = dynamic(light: 0x4ABE7B, dark: 0x7AD2A0)
    public static let accentHover     = dynamic(light: 0x3DAB6B, dark: 0x8EDDAF)
    public static let onAccent        = dynamic(light: 0x0E2E1B, dark: 0x14130F)

    public static let alertHigh       = dynamic(light: 0x8B3220, dark: 0xD89A8A)
    public static let alertHighBg     = dynamic(light: 0xF0E1DA, dark: 0x3A1F18)
    public static let alertHighBorder = dynamic(light: 0xDCC8BD, dark: 0x4A2B22)

    /// Citation / external-link color. Used uniformly across CitationPill,
    /// CitationCardView, and ReferencesSection so the three surfaces read as
    /// the same interactive language. Deep saturated emerald — distinctly
    /// "link family" against the cream background, more chromatic and darker
    /// than the muted forest accent so it reads as alive without competing
    /// with primary CTAs. Information color, never action color.
    public static let link            = dynamic(light: 0x1F6B3D, dark: 0x4FAA70)
    /// Pale link-tinted background for the inline citation pill. Sage-green
    /// wash that complements the cream bg and signals "link family" before
    /// the user reads the text.
    public static let linkBg          = dynamic(light: 0xE8F0E5, dark: 0x1A2B20)

    // MARK: Source tones — semantic information color, never action color.
    // Used to tint citation source-type signals (numbered prefix, link arrow,
    // pill icon, type badge) so a long references list reads like a curated
    // bibliography. Desaturated, editorial; never compete with the forest-green
    // accent or the bedside-red alert family.
    public static let sourceFDA       = dynamic(light: 0x2F4D6B, dark: 0x8FA9BF)   // classical navy — drug regulation
    public static let sourceAgency    = dynamic(light: 0x5C6B7C, dark: 0xA8AEB8)   // letterhead slate — public health agencies
    public static let sourceGuideline = dynamic(light: 0x4F5D72, dark: 0x9CA5B5)   // institutional slate — practice guidelines
    public static let sourceJournal   = dynamic(light: 0x6B4555, dark: 0xB58A99)   // aged burgundy — peer-reviewed
    public static let sourceSociety   = dynamic(light: 0x5C5278, dark: 0xA099BC)   // dusty plum — professional societies
    public static let sourceTextbook  = dynamic(light: 0x7A5A40, dark: 0xC9A286)   // warm umber — OER textbooks

    private static func dynamic(light: UInt32, dark: UInt32) -> Color {
        Color(uiColor: UIColor { trait in
            trait.userInterfaceStyle == .dark ? UIColor(hex: dark) : UIColor(hex: light)
        })
    }
}

private extension UIColor {
    convenience init(hex: UInt32) {
        let r = CGFloat((hex >> 16) & 0xFF) / 255
        let g = CGFloat((hex >> 8) & 0xFF) / 255
        let b = CGFloat(hex & 0xFF) / 255
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
