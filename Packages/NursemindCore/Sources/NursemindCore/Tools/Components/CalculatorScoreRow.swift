import SwiftUI

/// Categorical row used by risk scores (GCS, Apgar, FLACC, MEWS, NEWS2).
/// Each option carries an integer score; the row exposes the selected option
/// via a binding to the option index. Renders as a labeled row with a menu
/// disclosure showing the currently selected option.
public struct CalculatorScoreRow: View {
    public struct Option: Identifiable, Hashable {
        public let id: Int
        public let label: String
        public let score: Int

        public init(id: Int, label: String, score: Int) {
            self.id = id
            self.label = label
            self.score = score
        }
    }

    private let label: String
    private let options: [Option]
    @Binding private var selection: Option?

    public init(label: String, options: [Option], selection: Binding<Option?>) {
        self.label = label
        self.options = options
        self._selection = selection
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: NMSpace.xs) {
            HStack(alignment: .firstTextBaseline) {
                Text(label)
                    .font(NMFont.bodyLG)
                    .foregroundStyle(NMColor.textPrimary)
                Spacer()
                Menu {
                    ForEach(options) { option in
                        Button {
                            selection = option
                        } label: {
                            HStack {
                                Text(option.label)
                                Spacer()
                                Text("\(option.score)")
                                    .font(NMFont.mono)
                            }
                        }
                    }
                } label: {
                    HStack(spacing: NMSpace.sm) {
                        Text(selection?.label ?? "Select…")
                            .font(NMFont.body)
                            .foregroundStyle(selection == nil ? NMColor.textTertiary : NMColor.textPrimary)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        if let score = selection?.score {
                            Text("\(score)")
                                .font(NMFont.mono)
                                .foregroundStyle(NMColor.textPrimary)
                        }
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.system(size: 11))
                            .foregroundStyle(NMColor.textTertiary)
                    }
                }
                .frame(maxWidth: 220, alignment: .trailing)
            }
            .padding(.vertical, NMSpace.base)
        }
    }
}
