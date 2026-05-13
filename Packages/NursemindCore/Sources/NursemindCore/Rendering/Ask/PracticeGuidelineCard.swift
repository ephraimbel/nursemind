import SwiftUI

/// Banner-style wrapper for sections grounded in clinical practice guidelines.
/// Visual treatment matches OpenEvidence's "Practice Guideline" card — soft blue
/// header with clipboard icon. Triggered when the AI response is heavily based
/// on guideline citations.
public struct PracticeGuidelineCard<Content: View>: View {
    let title: String
    let content: () -> Content

    public init(title: String = "Practice Guideline", @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            header
            VStack(alignment: .leading, spacing: NMSpace.base) {
                content()
            }
            .padding(NMSpace.base)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(NMColor.bgElevated)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(NMColor.borderSubtle, lineWidth: 1))
        )
    }

    private var header: some View {
        HStack(spacing: NMSpace.sm) {
            Image(systemName: "doc.text.fill")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color(red: 0.30, green: 0.50, blue: 0.85))
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color(red: 0.30, green: 0.50, blue: 0.85))
            Spacer()
        }
        .padding(.horizontal, NMSpace.base)
        .padding(.vertical, NMSpace.sm + 2)
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10))
                .fill(Color(red: 0.91, green: 0.94, blue: 0.99))
        )
    }
}
