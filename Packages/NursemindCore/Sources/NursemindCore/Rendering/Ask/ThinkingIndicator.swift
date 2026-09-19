import SwiftUI

struct ThinkingIndicator: View {
    /// Server progress ("Reading 3 sources…"); nil shows the generic line.
    var stage: String? = nil
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var dotVisible = false
    @State private var isTakingLonger = false

    var body: some View {
        HStack(alignment: .top, spacing: NMSpace.sm) {
            Circle()
                .fill(NMColor.textSecondary)
                .frame(width: 6, height: 6)
                .opacity(reduceMotion || dotVisible ? 1 : 0.35)
                .padding(.top, 9)
                .animation(reduceMotion ? nil : .easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: dotVisible)
            VStack(alignment: .leading, spacing: NMSpace.xs) {
                Text(stage ?? "Finding a supported answer…")
                    .font(NMFont.displayItalicMD)
                    .foregroundStyle(NMColor.textSecondary)
                    .contentTransition(.opacity)
                    .animation(.easeOut(duration: 0.25), value: stage)
                if isTakingLonger {
                    Text("Still working. Your answer will appear once it has been checked.")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .onAppear { dotVisible = true }
        .task {
            do {
                try await Task.sleep(for: .seconds(12))
                isTakingLonger = true
            } catch { }
        }
    }
}

#Preview {
    ThinkingIndicator().padding().background(NMColor.bgPrimary)
}
