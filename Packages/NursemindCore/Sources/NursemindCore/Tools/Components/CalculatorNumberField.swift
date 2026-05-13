import SwiftUI

/// Labeled numeric input with right-aligned mono value and unit.
///
/// The text the user is typing is held in an internal `@State` so partial
/// input like `"1."` survives between keystrokes. The parent's `Double?`
/// binding is updated whenever the text parses to a valid number, and
/// cleared when the field is empty. If the parent updates the value
/// externally (e.g. a Clear button), the field syncs via `onChange`.
public struct CalculatorNumberField: View {
    private let label: String
    private let unit: String?
    @Binding private var value: Double?
    private let placeholder: String
    private let allowsDecimal: Bool

    @State private var rawText: String
    @FocusState private var isFocused: Bool

    public init(
        label: String,
        unit: String? = nil,
        value: Binding<Double?>,
        placeholder: String = "—",
        allowsDecimal: Bool = true
    ) {
        self.label = label
        self.unit = unit
        self._value = value
        self.placeholder = placeholder
        self.allowsDecimal = allowsDecimal
        self._rawText = State(initialValue: value.wrappedValue.map { Self.format($0) } ?? "")
    }

    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: NMSpace.base) {
            Text(label)
                .font(NMFont.bodyLG)
                .foregroundStyle(NMColor.textPrimary)
            Spacer(minLength: NMSpace.base)
            TextField(placeholder, text: $rawText)
                .keyboardType(allowsDecimal ? .decimalPad : .numberPad)
                .multilineTextAlignment(.trailing)
                .font(NMFont.monoXL)
                .foregroundStyle(NMColor.textPrimary)
                .frame(minWidth: 70, maxWidth: 110)
                .focused($isFocused)
                .onChange(of: rawText) { _, newText in
                    syncValue(from: newText)
                }
                .onChange(of: value) { _, newValue in
                    // Sync if the parent reset the value (e.g. external clear)
                    // but never clobber what the user is actively typing.
                    guard !isFocused else { return }
                    let formatted = newValue.map { Self.format($0) } ?? ""
                    if formatted != rawText { rawText = formatted }
                }
            if let unit {
                Text(unit)
                    .font(NMFont.bodySM)
                    .foregroundStyle(NMColor.textTertiary)
                    .frame(minWidth: 36, alignment: .leading)
            }
        }
        .padding(.vertical, NMSpace.base)
        .contentShape(Rectangle())
        .onTapGesture { isFocused = true }
    }

    private func syncValue(from text: String) {
        let trimmed = text.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty {
            value = nil
            return
        }
        // Accept partial decimal input ("1.", ".5") without clobbering the text.
        // Only update Double when fully parseable.
        if let parsed = Double(trimmed), parsed.isFinite {
            value = parsed
        }
    }

    private static func format(_ value: Double) -> String {
        if value == value.rounded() {
            return String(format: "%g", value)
        }
        // Up to 4 significant decimal places, trimmed
        return String(value)
    }
}
