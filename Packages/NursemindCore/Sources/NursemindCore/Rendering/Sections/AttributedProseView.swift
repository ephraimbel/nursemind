import SwiftUI

struct AttributedProseView: View {
    let prose: AttributedProse
    let citationIndex: [String: Int]   // citation_id → display number (1-based)

    var body: some View {
        let superscript = prose.citationIDs
            .compactMap { citationIndex[$0] }
            .map(superscriptDigits)
            .joined(separator: "·")

        // Append superscript citation marker as a small inline annotation
        (Text(prose.text) + Text(superscript.isEmpty ? "" : superscript)
            .font(NMFont.bodySM)
            .foregroundStyle(NMColor.textTertiary))
            .font(NMFont.bodyLG)
            .foregroundStyle(NMColor.textPrimary)
            .lineSpacing(4)
    }
}

func superscriptDigits(_ n: Int) -> String {
    let map: [Character: Character] = [
        "0": "⁰", "1": "¹", "2": "²", "3": "³", "4": "⁴",
        "5": "⁵", "6": "⁶", "7": "⁷", "8": "⁸", "9": "⁹"
    ]
    return String(n).map { map[$0] ?? $0 }.reduce("") { String($0) + String($1) }
}
