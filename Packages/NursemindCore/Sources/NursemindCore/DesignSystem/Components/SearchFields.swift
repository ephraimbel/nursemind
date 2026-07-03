import SwiftUI

/// Field-styled button that opens the global search sheet. Looks like a
/// search input so the affordance is unmistakable, but it's a button —
/// GlobalSearchView owns the real input and first-responder state, so
/// there's exactly one search implementation in the app.
public struct SearchFieldButton: View {
    private let prompt: String
    private let action: () -> Void

    public init(prompt: String, action: @escaping () -> Void) {
        self.prompt = prompt
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: NMSpace.sm) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
                Text(prompt)
                    .font(NMFont.body)
                    .foregroundStyle(NMColor.textTertiary)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, NMSpace.md)
            .padding(.vertical, NMSpace.sm + 2)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(NMColor.bgElevated)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(NMColor.borderSubtle, lineWidth: 1)
                    )
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Search")
    }
}

/// Scoped filter field pinned above long lists (category lists, NCLEX
/// subcategory lists). Narrows the list in place — it is not global search.
public struct ListFilterField: View {
    private let prompt: String
    @Binding private var text: String
    @FocusState private var focused: Bool

    public init(prompt: String, text: Binding<String>) {
        self.prompt = prompt
        self._text = text
    }

    public var body: some View {
        HStack(spacing: NMSpace.sm) {
            Image(systemName: "line.3.horizontal.decrease")
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(NMColor.textTertiary)
            TextField(prompt, text: $text)
                .font(NMFont.body)
                .foregroundStyle(NMColor.textPrimary)
                .focused($focused)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .submitLabel(.done)
            if !text.isEmpty {
                Button {
                    text = ""
                    focused = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(NMColor.textTertiary)
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Clear filter")
            }
        }
        .padding(.horizontal, NMSpace.md)
        .padding(.vertical, NMSpace.sm + 2)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(NMColor.bgElevated)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(NMColor.borderSubtle, lineWidth: 1)
                )
        )
    }
}
