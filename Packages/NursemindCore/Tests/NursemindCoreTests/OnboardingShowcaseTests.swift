import Foundation
import Testing
@testable import NursemindCore

@Suite("Onboarding showcase is grounded")
struct OnboardingShowcaseTests {
    @Test func askScriptComposesFromThePotassiumEntryWithItsOwnCitations() throws {
        let script = try #require(AskShowcaseScript.load())
        let entry = try #require(ContentRegistry.shared.entry(byID: AskShowcaseScript.entryID))
        #expect(script.entryID == entry.id)
        #expect(!script.citations.isEmpty)
        #expect(script.citations.map(\.id) == entry.citationSources.map(\.id))
        #expect(script.content.contains("[c001]"))
        #expect(script.content.contains("## "))
        #expect(script.content.contains("| "))
        #expect(!script.content.contains("give "))
    }

    @Test func askScriptRevealsBlockByBlockAndEndsComplete() throws {
        let script = try #require(AskShowcaseScript.load())
        var buffer = script.content
        var revealed = ""
        var units = 0
        while let (unit, rest) = AskViewModel.nextRevealUnit(in: buffer, streamEnded: true) {
            buffer = rest
            revealed += unit
            units += 1
        }
        #expect(revealed == script.content)
        #expect(units >= 4)
    }

    @Test func feedFixtureIsThreeRealPublishedItems() {
        let items = FeedShowcaseFixture.items
        #expect(items.count == 3)
        #expect(Set(items.map(\.id)).count == 3)
        for item in items {
            #expect(!item.headline.isEmpty)
            #expect(!item.whyNursesCare.contains("*"))
            #expect(item.sourceURL.hasPrefix("https://"))
            #expect(!item.citations.isEmpty)
        }
    }

    @Test func libraryFactsCountTheBundledRegistry() async {
        let counts = await LibraryFacts.shared.counts()
        #expect(counts.entries == ContentRegistry.shared.all.count)
        #expect(counts.entries > 1_000)
        #expect(counts.sources > 100)
        #expect(counts.sources <= counts.entries * 8)
    }

    @Test func rollingDigitsGroupThousands() {
        #expect(RollingDigits.formatted(2147) == "2,147")
        #expect(RollingDigits.formatted(0) == "0")
    }
}

@Suite("Feed copy hygiene")
struct FeedCopyHygieneTests {
    @Test func wrappingEmphasisIsStrippedFromHeadlinesAndDeks() {
        #expect(FeedItem.unemphasized("*Contaminated compounded injectables pose risk.*") == "Contaminated compounded injectables pose risk.")
        #expect(FeedItem.unemphasized("_Quiet note_") == "Quiet note")
        #expect(FeedItem.unemphasized("A 2 × 2 study* of *nothing") == "A 2 × 2 study* of *nothing")
        #expect(FeedItem.unemphasized("*") == "*")
    }
}
