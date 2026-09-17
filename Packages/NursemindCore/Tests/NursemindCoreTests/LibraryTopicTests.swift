import Testing
import UIKit
@testable import NursemindCore

@Suite("Library topic navigation")
struct LibraryTopicTests {
    @Test func topicSymbolsExistInTheSystemCatalog() {
        let symbols = Set(LibraryTopicGroup.allCases.map(\.glyph) + LibraryTopic.all.map(\.glyph))
        for symbol in symbols {
            #expect(UIImage(systemName: symbol) != nil, "Missing SF Symbol: \(symbol)")
        }
    }

    @Test func everyCollectionResolvesWithoutDuplicateEntries() {
        let registry = ContentRegistry.shared
        #expect(Set(LibraryTopic.all.map(\.id)).count == LibraryTopic.all.count)
        for topic in LibraryTopic.all {
            #expect(!topic.entryIDs.isEmpty, "Empty topic: \(topic.id)")
            #expect(Set(topic.entryIDs).count == topic.entryIDs.count, "Duplicate entry in \(topic.id)")
            for id in topic.entryIDs {
                #expect(registry.entry(byID: id) != nil, "Broken topic link: \(topic.id) → \(id)")
            }
            #expect(topic.entries(in: registry).count == topic.entryIDs.count)
        }
    }

    @Test func allCollectionsAreReachableFromTheDirectory() {
        let reachable = LibraryTopicGroup.allCases.flatMap(\.topics).map(\.id)
        #expect(Set(reachable) == Set(LibraryTopic.all.map(\.id)))
        #expect(reachable.count == Set(reachable).count)
        #expect(LibraryTopicGroup.allCases.allSatisfy { !$0.topics.isEmpty })
        for id in reachable {
            #expect(LibraryTopic.topic(id: id)?.id == id)
        }
        #expect(LibraryTopic.topic(id: "unknown-topic") == nil)
    }

    @Test func topicBrowsingDoesNotRemoveEntriesFromTheFullIndex() {
        let registry = ContentRegistry.shared
        let indexedIDs = registry.allCategories.flatMap { registry.entries(in: $0) }.map(\.id)
        #expect(Set(indexedIDs) == Set(registry.all.map(\.id)))
        let collectionIDs = Set(LibraryTopic.all.flatMap(\.entryIDs))
        #expect(collectionIDs.isSubset(of: Set(indexedIDs)))
    }

    @Test func respiratoryTopicConnectsReferenceProcedureAndLab() throws {
        let topic = try #require(LibraryTopic.topic(id: "airway-ventilation"))
        let ids = Set(topic.entries(in: .shared).map(\.id))
        #expect(ids.contains("reference:mechanical-ventilation-basics"))
        #expect(ids.contains("lab:abg"))
        #expect(ids.contains("procedure:spontaneous-breathing-trial"))
    }
}
