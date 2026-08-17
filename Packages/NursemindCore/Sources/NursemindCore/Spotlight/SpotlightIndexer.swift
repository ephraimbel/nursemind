import CoreSpotlight
import Foundation
import OSLog
import SwiftUI
import UIKit

/// Publishes the library and calculators to the system index, so a nurse can
/// swipe down on the home screen, type "norepi", and land on the entry —
/// instead of unlock, find app, open, tab, search, type, tap.
///
/// Two deliberate exclusions:
///
/// - **Saved AI answers are never indexed.** They are user-authored clinical
///   questions. The system index is shared surface — Siri suggestions, lock
///   screen — and putting a nurse's own questions there is not ours to do,
///   regardless of how useful it would be.
/// - **Pro-locked entries are indexed anyway.** A locked entry still opens and
///   shows its paywall teaser, so surfacing it is discovery rather than a
///   bait-and-switch, and it is one of the few honest conversion surfaces.
public enum SpotlightIndexer {

    /// Bumped when the shape of an indexed item changes — new keywords, a new
    /// description format — so existing installs re-index rather than keeping
    /// the older, thinner records.
    private static let indexFormatVersion = 1

    private static let versionKey = "nm.spotlight.indexedVersion"
    private static let countKey = "nm.spotlight.indexedItemCount"

    private static let log = Logger(subsystem: "app.nursemind.ios", category: "spotlight")

    private static let entryDomain = "app.nursemind.library"
    private static let calculatorDomain = "app.nursemind.calculators"

    /// `uniqueIdentifier` prefixes. The router takes different paths for an
    /// entry and a calculator, so the identifier has to say which it is.
    private static let entryPrefix = "entry:"
    private static let calculatorPrefix = "calculator:"

    // MARK: - Indexing

    /// Indexes on a background task if the corpus or the item format changed.
    /// Cheap no-op on every launch after the first.
    public static func indexIfNeeded(registry: ContentRegistry = .shared) {
        let expectedCount = registry.all.count
            + (ToolsAvailability.calculatorsEnabled ? CalculatorRegistry.all.count : 0)
        let defaults = UserDefaults.standard
        let alreadyIndexed = defaults.integer(forKey: versionKey) == indexFormatVersion
            && defaults.integer(forKey: countKey) == expectedCount
        log.debug("indexIfNeeded expected=\(expectedCount, privacy: .public) stored=\(defaults.integer(forKey: countKey), privacy: .public) skip=\(alreadyIndexed, privacy: .public)")
        guard !alreadyIndexed else { return }

        Task.detached(priority: .utility) {
            await index(registry: registry, expectedCount: expectedCount)
        }
    }

    private static func index(registry: ContentRegistry, expectedCount: Int) async {
        let defaults = UserDefaults.standard
        let index = CSSearchableIndex.default()

        // Clear first so entries removed from the corpus don't linger as dead
        // results that open to "Entry not found".
        do {
            try await index.deleteSearchableItems(withDomainIdentifiers: [entryDomain, calculatorDomain])
        } catch {
            // A failed delete leaves stale items but must not block re-indexing.
            log.warning("stale-item delete failed: \(error.localizedDescription, privacy: .public)")
        }

        let thumbnails = await Thumbnails.render()
        var items = registry.all.map { searchableItem(for: $0, thumbnails: thumbnails) }
        if ToolsAvailability.calculatorsEnabled {
            items.append(contentsOf: CalculatorRegistry.all.map {
                searchableItem(for: $0, thumbnails: thumbnails)
            })
        }

        // Batched — one 1,900-item transaction is a large allocation and a
        // single point of failure for the whole index.
        var indexed = 0
        for (position, batch) in items.chunked(into: 250).enumerated() {
            do {
                try await index.indexSearchableItems(batch)
                indexed += batch.count
            } catch {
                // Stop rather than press on. The completion marker below is not
                // written, so the next launch retries the whole corpus — a
                // silently half-indexed library is worse than an unindexed one.
                log.error("batch \(position, privacy: .public) failed at \(indexed, privacy: .public)/\(expectedCount, privacy: .public): \(error.localizedDescription, privacy: .public)")
                break
            }
        }

        guard indexed == expectedCount else { return }
        defaults.set(indexFormatVersion, forKey: versionKey)
        defaults.set(expectedCount, forKey: countKey)
        log.info("indexed \(expectedCount, privacy: .public) items")
    }

    // MARK: - Item construction

    private static func searchableItem(for entry: LibraryEntry, thumbnails: Thumbnails) -> CSSearchableItem {
        let attributes = CSSearchableItemAttributeSet(contentType: .content)
        attributes.title = entry.title
        // The subtitle is already the "what is this" line the library rows use
        // — brand names, drug class, specimen. Falling back to the category
        // keeps a result from looking empty.
        attributes.contentDescription = entry.subtitle ?? entry.category.displayName
        attributes.keywords = keywords(for: entry)
        attributes.thumbnailData = thumbnails.byEntryCategory[entry.category] ?? nil
        let item = CSSearchableItem(
            uniqueIdentifier: entryPrefix + entry.id,
            domainIdentifier: entryDomain,
            attributeSet: attributes
        )
        // Without this, CoreSpotlight expires items after roughly a month and
        // the library silently vanishes from system search.
        item.expirationDate = .distantFuture
        return item
    }

    private static func searchableItem(for calculator: CalculatorEntry, thumbnails: Thumbnails) -> CSSearchableItem {
        let attributes = CSSearchableItemAttributeSet(contentType: .content)
        attributes.title = calculator.title
        attributes.contentDescription = calculator.subtitle
        attributes.keywords = keywords(for: calculator)
        attributes.thumbnailData = thumbnails.byCalculatorCategory[calculator.category] ?? nil

        let item = CSSearchableItem(
            uniqueIdentifier: calculatorPrefix + calculator.id,
            domainIdentifier: calculatorDomain,
            attributeSet: attributes
        )
        item.expirationDate = .distantFuture
        return item
    }

    /// Spotlight matches a fixed keyword list — it does not run our synonym
    /// expander — so every alias an entry answers to has to be carried into the
    /// index explicitly. This is what makes "lasix", "K+" and "MI" work from
    /// the home screen.
    private static func keywords(for entry: LibraryEntry) -> [String] {
        var out = [entry.category.displayName]
        out.append(contentsOf: ClinicalSynonyms.alternateTerms(for: entry.title))
        if let subtitle = entry.subtitle {
            out.append(contentsOf: ClinicalSynonyms.alternateTerms(for: subtitle))
            // Subtitles carry brand names as "Vancocin · glycopeptide antibiotic";
            // the separators are noise as keywords.
            out.append(contentsOf: subtitle
                .split(whereSeparator: { "·,—-/()".contains($0) })
                .map { $0.trimmingCharacters(in: .whitespaces) }
                .filter { $0.count >= 3 })
        }
        if entry.isHighAlert { out.append("high-alert") }
        return dedupe(out)
    }

    private static func keywords(for calculator: CalculatorEntry) -> [String] {
        var out = ["calculator", calculator.category.displayName]
        out.append(contentsOf: ClinicalSynonyms.alternateTerms(for: calculator.title))
        out.append(contentsOf: ClinicalSynonyms.alternateTerms(for: calculator.subtitle))
        return dedupe(out)
    }

    private static func dedupe(_ terms: [String]) -> [String] {
        var seen: Set<String> = []
        return terms
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty && seen.insert($0.lowercased()).inserted }
    }

    /// One rendered glyph per category, built once and shared by every item in
    /// it. Rendering 1,900 individually would cost far more than it shows, and
    /// computing them up front keeps the indexer free of shared mutable state.
    struct Thumbnails: Sendable {
        let byEntryCategory: [EntryCategory: Data]
        let byCalculatorCategory: [CalculatorCategory: Data]

        @MainActor
        static func render() -> Thumbnails {
            var entries: [EntryCategory: Data] = [:]
            for category in EntryCategory.allCases {
                entries[category] = image(category.glyph, tint: category.glyphTint)
            }
            var calculators: [CalculatorCategory: Data] = [:]
            for category in CalculatorCategory.allCases {
                // Calculators stay monochrome — they are instruments, not
                // sources, so they take no source tone (CategoryGlyphs).
                calculators[category] = image(category.glyph, tint: NMColor.textSecondary)
            }
            return Thumbnails(byEntryCategory: entries, byCalculatorCategory: calculators)
        }

        @MainActor
        private static func image(_ symbol: String, tint: Color) -> Data? {
            let configuration = UIImage.SymbolConfiguration(pointSize: 96, weight: .regular)
            return UIImage(systemName: symbol, withConfiguration: configuration)?
                .withTintColor(UIColor(tint), renderingMode: .alwaysOriginal)
                .pngData()
        }
    }

    // MARK: - Continuation

    /// Routes a tapped Spotlight result. Returns false when the identifier is
    /// not ours or no longer resolves, so the caller can ignore it rather than
    /// dropping the user on a blank screen.
    @MainActor
    @discardableResult
    public static func handle(
        activity: NSUserActivity,
        router: AppRouter = .shared,
        registry: ContentRegistry = .shared
    ) -> Bool {
        guard activity.activityType == CSSearchableItemActionType,
              let identifier = activity.userInfo?[CSSearchableItemActivityIdentifier] as? String
        else { return false }

        if identifier.hasPrefix(entryPrefix) {
            let id = String(identifier.dropFirst(entryPrefix.count))
            guard registry.entry(byID: id) != nil else { return false }
            router.openLibraryEntry(id)
            AnalyticsService.shared.capture("spotlight_opened", properties: ["kind": "entry"])
            return true
        }

        if identifier.hasPrefix(calculatorPrefix) {
            let id = String(identifier.dropFirst(calculatorPrefix.count))
            guard CalculatorRegistry.all.contains(where: { $0.id == id }) else { return false }
            router.openCalculator(id)
            AnalyticsService.shared.capture("spotlight_opened", properties: ["kind": "calculator"])
            return true
        }

        return false
    }
}

private extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
