import Foundation
import Testing
import UIKit
@testable import NursemindCore

@Suite("Profile photo store")
struct ProfilePhotoStoreTests {
    private func image(width: CGFloat, height: CGFloat) -> UIImage {
        UIGraphicsImageRenderer(size: CGSize(width: width, height: height)).image { context in
            UIColor.systemTeal.setFill()
            context.fill(CGRect(x: 0, y: 0, width: width, height: height))
        }
    }

    @Test func storesACentreSquareAtTheAvatarSize() throws {
        let squared = try #require(ProfilePhotoStore.squared(image(width: 1800, height: 900)))
        #expect(squared.size == CGSize(width: ProfilePhotoStore.side, height: ProfilePhotoStore.side))
        #expect(squared.scale == 1)
        let tall = try #require(ProfilePhotoStore.squared(image(width: 300, height: 1200)))
        #expect(tall.size == CGSize(width: ProfilePhotoStore.side, height: ProfilePhotoStore.side))
        #expect(ProfilePhotoStore.squared(UIImage()) == nil)
    }

    @Test func savesLoadsAndRemovesOneFile() throws {
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("nm-photo-\(UUID().uuidString)", isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        let store = ProfilePhotoStore(directory: directory)
        #expect(!store.hasPhoto)
        #expect(store.load() == nil)
        #expect(store.save(image(width: 640, height: 480)))
        #expect(store.hasPhoto)
        let loaded = try #require(store.load())
        #expect(loaded.size.width == loaded.size.height)
        #expect(store.fileURL.lastPathComponent == "profile-photo.jpg")
        store.remove()
        #expect(!store.hasPhoto)
        store.remove()
    }

    @Test func initialsComeFromTheFirstTwoWords() {
        #expect(ProfileAvatarView.initials(for: "  ") == "")
        #expect(ProfileAvatarView.initials(for: "ephraim") == "E")
        #expect(ProfileAvatarView.initials(for: "Maya Ortiz Vega") == "MO")
    }
}
