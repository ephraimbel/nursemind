import SwiftUI

/// SwiftUI Environment key carrying the currently-displayed calculator ID
/// down through the view tree. Set by CalculatorDetailRouter; read by
/// CalculatorScaffold so it can inject a RelatedLibrarySection without
/// individual calculator views needing to know their own IDs.
private struct CurrentCalculatorIDKey: EnvironmentKey {
    static let defaultValue: String? = nil
}

public extension EnvironmentValues {
    var currentCalculatorID: String? {
        get { self[CurrentCalculatorIDKey.self] }
        set { self[CurrentCalculatorIDKey.self] = newValue }
    }
}

/// Common page layout for every calculator detail view. Provides the eyebrow,
/// display title, italic subtitle, and a scrollable content slot. Matches the
/// editorial pattern used by LibraryEntryView.
///
/// Also drives state-persistence affordances: when the calculator has saved
/// state, a "Last entered Xmin ago · Clear" pill appears under the subtitle.
/// Tapping Clear wipes the store AND increments a reset trigger bound to the
/// content's `.id()` — that forces SwiftUI to rebuild the calculator view,
/// which re-runs the `@CalcPersistedDouble` etc. initializers, which read
/// the freshly-cleared (nil) values.
public struct CalculatorScaffold<Content: View>: View {
    private let eyebrow: String
    private let title: String
    private let subtitle: String?
    private let content: Content

    @Environment(\.currentCalculatorID) private var currentCalculatorID
    @State private var store = CalculatorStateStore.shared
    @State private var resetTrigger: Int = 0

    public init(
        eyebrow: String,
        title: String,
        subtitle: String? = nil,
        @ViewBuilder content: () -> Content
    ) {
        self.eyebrow = eyebrow
        self.title = title
        self.subtitle = subtitle
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                EyebrowLabel(eyebrow, sparkle: false)
                    .padding(.top, NMSpace.xxl)
                Text(title)
                    .displayXL()
                    .padding(.top, NMSpace.md)
                if let subtitle {
                    Text(subtitle)
                        .font(NMFont.displayItalicMD)
                        .foregroundStyle(NMColor.textSecondary)
                        .padding(.top, NMSpace.xs)
                }
                if let id = currentCalculatorID, store.hasState(id) {
                    lastEnteredPill(for: id)
                        .padding(.top, NMSpace.lg)
                }
                content
                    .padding(.top, NMSpace.xxl)
                    .id(resetTrigger)
                if let id = currentCalculatorID {
                    RelatedLibrarySection(calculatorID: id)
                        .padding(.top, NMSpace.xxl)
                }
                Spacer(minLength: NMSpace.huge)
            }
            .padding(.horizontal, NMSpace.lg)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(GrainBackground())
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func lastEnteredPill(for id: String) -> some View {
        if let formatted = store.formattedLastTouched(id) {
            HStack(spacing: NMSpace.sm) {
                Text("Last entered \(formatted)")
                    .font(NMFont.displayItalicSM)
                    .foregroundStyle(NMColor.textTertiary)
                Spacer(minLength: 0)
                Button {
                    store.clear(id)
                    resetTrigger &+= 1
                } label: {
                    Text("Clear")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.accent)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Clear saved values")
            }
        }
    }
}

/// Eyebrow + title pair used as a section header inside a calculator
/// (Inputs / Result / Formula). Smaller than the main page title.
public struct CalculatorSectionHeader: View {
    let label: String

    public init(_ label: String) {
        self.label = label
    }

    public var body: some View {
        EyebrowLabel(label, sparkle: false)
            .padding(.bottom, NMSpace.md)
    }
}

/// Vertical container for one calculator section (Inputs / Formula / etc.)
/// with the standard hairline before and consistent vertical rhythm.
public struct CalculatorSection<Content: View>: View {
    private let title: String
    private let content: Content

    public init(_ title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Hairline().padding(.bottom, NMSpace.xl)
            CalculatorSectionHeader(title)
            content
        }
        .padding(.top, NMSpace.lg)
    }
}
