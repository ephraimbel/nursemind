import SwiftUI

/// Circular search affordance pinned to the top-trailing corner of a home tab.
/// Replaces the navigation-bar toolbar item so the editorial header (eyebrow +
/// `displayXL` title) can anchor at the same vertical position across every
/// tab — without it, the toolbar's reserved strip pushes the header down on
/// pages that have a search button and produces a visible misalignment when
/// swiping between Ask / Library / Tools.
///
/// Sized and padded so the bubble stays well inside the screen edge on every
/// iPhone from SE through 17 Pro Max — the parent should overlay this on a
/// scroll view with `alignment: .topTrailing` so safe-area insets handle the
/// vertical placement automatically.
public struct FloatingSearchButton: View {
    private let action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        FloatingIconButton(systemName: "magnifyingglass", accessibilityLabel: "Search", action: action)
    }
}

/// Generic circular floating affordance — same visual treatment as
/// `FloatingSearchButton`, parameterized on the SF Symbol. Used so Ask's
/// "conversation history" and "new conversation" controls can sit as
/// top-leading / top-trailing overlays instead of in the navigation bar
/// toolbar — the toolbar's reserved strip otherwise pushes Ask's editorial
/// header below Library's, producing a visible misalignment when swiping
/// between tabs.
public struct FloatingIconButton: View {
    private let systemName: String
    private let accessibilityLabel: String
    private let dimmed: Bool
    private let action: () -> Void

    public init(
        systemName: String,
        accessibilityLabel: String,
        dimmed: Bool = false,
        action: @escaping () -> Void
    ) {
        self.systemName = systemName
        self.accessibilityLabel = accessibilityLabel
        self.dimmed = dimmed
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(NMColor.textPrimary)
                .frame(width: 38, height: 38)
                .background(
                    Circle().fill(NMColor.bgElevated)
                )
                .overlay(
                    Circle().strokeBorder(NMColor.borderSubtle, lineWidth: 1)
                )
                .opacity(dimmed ? 0.4 : 1.0)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(accessibilityLabel)
    }
}
