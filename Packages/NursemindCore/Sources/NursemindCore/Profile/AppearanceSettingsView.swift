import SwiftUI

public struct AppearanceSettingsView: View {
    @State private var prefs = UserPreferences.shared

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel("APPEARANCE", sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text("Theme")
                    .displayXL()
                    .padding(.top, NMSpace.md)
                Text("NurseMind adapts to your system theme by default. Pick Light or Dark to override.")
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textSecondary)
                    .padding(.top, NMSpace.sm)
                    .lineSpacing(3)

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(spacing: 0) {
                    ForEach(Array(AppearanceTheme.allCases.enumerated()), id: \.element) { idx, theme in
                        Button {
                            prefs.preferredAppearance = theme
                        } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(theme.displayName)
                                        .font(NMFont.bodyLG)
                                        .foregroundStyle(NMColor.textPrimary)
                                    Text(themeSubtitle(theme))
                                        .font(NMFont.bodySM)
                                        .foregroundStyle(NMColor.textTertiary)
                                }
                                Spacer()
                                if prefs.preferredAppearance == theme {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundStyle(NMColor.accent)
                                }
                            }
                            .padding(.vertical, NMSpace.base)
                        }
                        .buttonStyle(.plain)
                        if idx < AppearanceTheme.allCases.count - 1 {
                            Hairline(color: NMColor.borderSubtle)
                        }
                    }
                }

                Hairline().padding(.vertical, NMSpace.xxl)

                VStack(alignment: .leading, spacing: NMSpace.md) {
                    EyebrowLabel("TYPE SIZE", sparkle: false)
                    Text("NurseMind respects your iOS Dynamic Type setting. Adjust system-wide in Settings → Display & Brightness → Text Size.")
                        .font(NMFont.body)
                        .foregroundStyle(NMColor.textSecondary)
                        .lineSpacing(3)
                }
            }
            .padding(.horizontal, NMSpace.lg)
            .padding(.bottom, NMSpace.huge)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    private func themeSubtitle(_ theme: AppearanceTheme) -> String {
        switch theme {
        case .system: return "Match iOS"
        case .light:  return "Always light"
        case .dark:   return "Always dark"
        }
    }
}
