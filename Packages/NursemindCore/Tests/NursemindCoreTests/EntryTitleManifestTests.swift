import Foundation
import Testing
@testable import NursemindCore

/// Emits one `NM-TITLE` line per library entry so
/// `scripts/export-entry-titles.py` can rebuild
/// `supabase/functions/_shared/entry-titles.json`, the manifest the feed
/// pipeline matches stories against. Regenerate after every content round.
@Suite("Entry title manifest export", .serialized)
struct EntryTitleManifestTests {
    struct Row: Codable {
        let id: String
        let title: String
        let category: String
    }

    @Test func exportEveryEntryTitle() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        var seen = Set<String>()
        for entry in ContentRegistry.shared.all {
            let row = Row(id: entry.id, title: entry.title, category: entry.category.rawValue)
            #expect(seen.insert(row.id).inserted, "duplicate id \(row.id)")
            let data = try encoder.encode(row)
            print("NM-TITLE " + String(decoding: data, as: UTF8.self))
        }
        print("NM-TITLE-COUNT \(ContentRegistry.shared.all.count)")
    }
}
