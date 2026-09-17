import SwiftUI

/// Minimal iPhone-shaped container for showcase demos. No fake speaker or
/// camera bumps — just a rounded rectangle with a hairline border, so the
/// content inside reads as the demo, not the device. The brand sage-cream
/// background matches the real app.
struct PhoneFrame<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            let scale = max(0, min(1, min(geometry.size.width / 260, geometry.size.height / 540)))

            // Scale the illustration as a whole so it yields space to the page title.
            content
                .frame(width: 260, height: 540)
                .background(NMColor.bgPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 36, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 36, style: .continuous)
                        .stroke(NMColor.border, lineWidth: 1)
                )
                .shadow(color: Color.black.opacity(0.06), radius: 24, x: 0, y: 12)
                .scaleEffect(scale)
                .frame(width: 260 * scale, height: 540 * scale)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
