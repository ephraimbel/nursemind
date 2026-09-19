import Foundation
import UIKit

/// The user's profile photo, kept as one JPEG in Application Support. It
/// never leaves the device: no upload, no sync, no storage cost, and no new
/// data surface to protect. The avatar is a circle, so the photo is stored
/// already square-cropped and small.
public struct ProfilePhotoStore: Sendable {
    public static let shared = ProfilePhotoStore()

    /// Longest side of the stored photo. 512 points at 3× fills the largest
    /// avatar the app draws (54 pt) many times over.
    public static let side: CGFloat = 512
    static let fileName = "profile-photo.jpg"

    private let directory: URL

    public init(directory: URL? = nil) {
        self.directory = directory ?? FileManager.default
            .urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("NurseMind", isDirectory: true)
    }

    public var fileURL: URL { directory.appendingPathComponent(Self.fileName) }

    public var hasPhoto: Bool { FileManager.default.fileExists(atPath: fileURL.path) }

    public func load() -> UIImage? {
        guard let data = try? Data(contentsOf: fileURL) else { return nil }
        return UIImage(data: data)
    }

    /// Crops the photo to its centre square, scales it to `side`, and writes
    /// it as JPEG. Returns false when the image cannot be encoded.
    @discardableResult
    public func save(_ image: UIImage) -> Bool {
        guard let prepared = Self.squared(image), let data = prepared.jpegData(compressionQuality: 0.86) else { return false }
        do {
            try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
            try data.write(to: fileURL, options: .atomic)
            return true
        } catch {
            return false
        }
    }

    public func remove() {
        try? FileManager.default.removeItem(at: fileURL)
    }

    /// Centre-square crop at 1× scale, orientation baked in, resized to `side`.
    static func squared(_ image: UIImage) -> UIImage? {
        let width = image.size.width, height = image.size.height
        guard width > 0, height > 0 else { return nil }
        let edge = min(width, height)
        let origin = CGPoint(x: (width - edge) / 2, y: (height - edge) / 2)
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = 1
        format.opaque = true
        let target = CGSize(width: Self.side, height: Self.side)
        return UIGraphicsImageRenderer(size: target, format: format).image { _ in
            let scale = Self.side / edge
            image.draw(in: CGRect(x: -origin.x * scale, y: -origin.y * scale, width: width * scale, height: height * scale))
        }
    }
}
