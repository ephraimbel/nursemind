import SwiftUI

/// The user's mark: their photo when they have chosen one, otherwise serif
/// initials in a hairline-bordered circle, and a neutral person glyph before
/// a name is set. Re-reads the photo whenever `profilePhotoVersion` changes.
public struct ProfileAvatarView: View {
    let initials: String
    let size: CGFloat
    @State private var prefs = UserPreferences.shared
    @State private var photo: UIImage?

    public init(initials: String, size: CGFloat = 54) {
        self.initials = initials
        self.size = size
    }

    public var body: some View {
        ZStack {
            Circle().fill(NMColor.bgElevated)
            if let photo {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .clipShape(Circle())
            } else if initials.isEmpty {
                Image(systemName: "person.fill")
                    .font(.system(size: size * 0.37, weight: .regular))
                    .foregroundStyle(NMColor.textTertiary)
            } else {
                Text(initials)
                    .font(size >= 72 ? NMFont.displayLG : NMFont.displayMD)
                    .foregroundStyle(NMColor.textPrimary)
            }
            Circle().strokeBorder(NMColor.border, lineWidth: 1)
        }
        .frame(width: size, height: size)
        .accessibilityHidden(true)
        .onAppear { reload() }
        .onChange(of: prefs.profilePhotoVersion) { reload() }
    }

    private func reload() {
        photo = prefs.profilePhotoVersion > 0 ? ProfilePhotoStore.shared.load() : nil
    }

    /// Up to two initials from a display name; empty when the name is unset.
    public static func initials(for name: String) -> String {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return "" }
        return String(trimmed.split(separator: " ").prefix(2).compactMap(\.first)).uppercased()
    }
}
