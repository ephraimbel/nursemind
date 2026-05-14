import SwiftUI

/// Bottom tab bar replacing SwiftUI's `TabView`. Built because iPadOS 18+
/// automatically migrates `TabView` to a top-of-screen tab strip on iPad —
/// breaking the "iPhone style on iPad" look NurseMind wants (universal app
/// that fills the iPad screen but presents bottom tabs identical to iPhone).
///
/// Visual contract:
///   - Anchored to the bottom safe area
///   - Hairline at top separating it from content
///   - 4 (or 3 if Feed disabled) items evenly spaced across full width
///   - Each item = SF Symbol icon over a label, both tinted accent-green
///     when selected, textTertiary when not
///   - Cream background matching the app
public struct BottomTabBar: View {
    @Binding public var selectedTab: Int
    public let showFeed: Bool

    public init(selectedTab: Binding<Int>, showFeed: Bool) {
        self._selectedTab = selectedTab
        self.showFeed = showFeed
    }

    public var body: some View {
        VStack(spacing: 0) {
            Hairline(color: NMColor.border)
            HStack(spacing: 0) {
                tabButton(label: "Ask",     icon: "sparkle",         tag: AppRouter.askTab)
                if showFeed {
                    tabButton(label: "Feed",    icon: "newspaper",   tag: AppRouter.feedTab)
                }
                tabButton(label: "Library", icon: "books.vertical",  tag: AppRouter.libraryTab)
                tabButton(label: "Profile", icon: "person",          tag: AppRouter.profileTab)
            }
            .padding(.top, 8)
            .padding(.bottom, 4)  // small bottom inset; safeAreaInset adds the home-indicator gap
        }
        .background(NMColor.bgPrimary)
    }

    @ViewBuilder
    private func tabButton(label: String, icon: String, tag: Int) -> some View {
        let isSelected = selectedTab == tag
        Button {
            if selectedTab != tag {
                // Light haptic on tab switch — matches UITabBar's feel.
                #if canImport(UIKit)
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                #endif
            }
            selectedTab = tag
        } label: {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 22, weight: .regular))
                    .symbolVariant(isSelected ? .fill : .none)
                    .foregroundStyle(isSelected ? NMColor.accent : NMColor.textTertiary)
                    .frame(height: 26)
                Text(label)
                    .font(NMFont.bodySM)
                    .foregroundStyle(isSelected ? NMColor.accent : NMColor.textTertiary)
            }
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(label)
        .accessibilityAddTraits(isSelected ? [.isSelected, .isButton] : [.isButton])
    }
}
