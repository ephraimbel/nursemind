import Foundation
import SwiftUI

/// Wire format for `public.feed_items_visible` (the security-invoker view
/// over published Feed items). Mirrors the migration schema in
/// `supabase/migrations/20260601_0007_feed.sql`.
public struct FeedItem: Codable, Sendable, Identifiable, Equatable {
    public let id: UUID
    public let source: String
    public let sourceURL: String
    public let sourcePublishedAt: Date?
    public let headline: String
    public let whyNursesCare: String
    public let body: String
    public let askFollowupPrompt: String
    public let category: Category
    public let specialties: [String]
    public let nclexAreas: [String]
    public let priority: Priority
    public let citations: [FeedCitation]
    public let publishedAt: Date
    /// Prefixed library entry ids matched server-side from the story text
    /// (R2). Empty until the pipeline has classified or backfilled the row;
    /// `FeedStore.relatedEntryIDs(for:)` falls back to on-device matching.
    public let relatedEntryIDs: [String]

    public enum Category: String, Codable, Sendable, Equatable, CaseIterable, Identifiable {
        case drugSafety        = "drug_safety"
        case clinicalGuideline = "clinical_guideline"
        case publicHealth      = "public_health"
        case medicationSafety  = "medication_safety"
        case licensure
        case research

        public var id: String { rawValue }

        public var label: String {
            switch self {
            case .drugSafety:        return "Drug safety"
            case .clinicalGuideline: return "Clinical guideline"
            case .publicHealth:      return "Public health"
            case .medicationSafety:  return "Medication safety"
            case .licensure:         return "Licensure"
            case .research:          return "Research"
            }
        }

        /// Compact label for filter chips (Title Case fits the chip-row visual).
        public var chipLabel: String {
            switch self {
            case .drugSafety:        return "Drug safety"
            case .clinicalGuideline: return "Guidelines"
            case .publicHealth:      return "Public health"
            case .medicationSafety:  return "Med safety"
            case .licensure:         return "Licensure"
            case .research:          return "Research"
            }
        }
    }

    public enum Priority: String, Codable, Sendable, Equatable {
        case urgent
        case standard
    }

    enum CodingKeys: String, CodingKey {
        case id
        case source
        case sourceURL          = "source_url"
        case sourcePublishedAt  = "source_published_at"
        case headline
        case whyNursesCare      = "why_nurses_care"
        case body
        case askFollowupPrompt  = "ask_followup_prompt"
        case category
        case specialties
        case nclexAreas         = "nclex_areas"
        case priority
        case citations
        case publishedAt        = "published_at"
        case relatedEntryIDs    = "related_entry_ids"
    }
}

extension FeedItem {
    /// `related_entry_ids` is absent from rows served before migration 0014
    /// and from cached payloads; treat it as empty rather than failing the row.
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.id                = try c.decode(UUID.self, forKey: .id)
        self.source            = try c.decode(String.self, forKey: .source)
        self.sourceURL         = try c.decode(String.self, forKey: .sourceURL)
        self.sourcePublishedAt = try c.decodeIfPresent(Date.self, forKey: .sourcePublishedAt)
        self.headline          = Self.unemphasized(try c.decode(String.self, forKey: .headline))
        self.whyNursesCare     = Self.unemphasized(try c.decode(String.self, forKey: .whyNursesCare))
        self.body              = try c.decode(String.self, forKey: .body)
        self.askFollowupPrompt = try c.decode(String.self, forKey: .askFollowupPrompt)
        self.category          = try c.decode(Category.self, forKey: .category)
        self.specialties       = try c.decode([String].self, forKey: .specialties)
        self.nclexAreas        = try c.decode([String].self, forKey: .nclexAreas)
        self.priority          = try c.decode(Priority.self, forKey: .priority)
        self.citations         = try c.decode([FeedCitation].self, forKey: .citations)
        self.publishedAt       = try c.decode(Date.self, forKey: .publishedAt)
        self.relatedEntryIDs   = try c.decodeIfPresent([String].self, forKey: .relatedEntryIDs) ?? []
    }
}

extension FeedItem {
    /// A headline or dek the server wrapped in markdown emphasis (`*…*`,
    /// `_…_`) is shown as words: the card sets its own italics.
    nonisolated static func unemphasized(_ text: String) -> String {
        var trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        while let first = trimmed.first, let last = trimmed.last,
              first == last, "*_".contains(first), trimmed.count > 2 {
            trimmed = String(trimmed.dropFirst().dropLast()).trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return trimmed
    }
}

/// Single inline citation referenced by `[N]` markers in the body text.
public struct FeedCitation: Codable, Sendable, Identifiable, Equatable {
    public let n: Int
    public let source: String
    public let url: String
    public let quote: String

    public var id: Int { n }

    /// Server-authored JSON has occasionally shipped citations missing
    /// `quote` (2026-08-11 incident: two such rows failed the whole-array
    /// decode and blanked the feed for every user). The quote is display-only
    /// supporting text, so tolerate its absence rather than losing the item.
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.n      = try c.decode(Int.self, forKey: .n)
        self.source = try c.decode(String.self, forKey: .source)
        self.url    = try c.decode(String.self, forKey: .url)
        self.quote  = try c.decodeIfPresent(String.self, forKey: .quote) ?? ""
    }

    public init(n: Int, source: String, url: String, quote: String) {
        self.n = n
        self.source = source
        self.url = url
        self.quote = quote
    }
}

/// Wrapper that turns a row-level decode failure into `nil` instead of
/// failing the surrounding array. One malformed served row must degrade to
/// one missing card, never an empty feed.
struct LossyFeedItem: Decodable {
    let item: FeedItem?

    init(from decoder: Decoder) {
        self.item = try? FeedItem(from: decoder)
    }
}

public extension FeedItem {
    /// Short authority label for the card eyebrow. Derived from `source`
    /// (the ingest-stage source id) so the iOS doesn't need a roundtrip to
    /// a label table — adding a new source means one map entry here.
    var authorityLabel: String {
        switch source {
        case "fda-drugs", "fda-medwatch", "fda-enforcement", "fda-shortages":
            return "FDA"
        case "cdc-newsroom", "cdc-han", "cdc-outbreaks":
            return "CDC"
        case "cdc-mmwr":
            return "CDC MMWR"
        case "cdc-eid":
            return "CDC EID"
        case "plos-medicine", "plos-gph":
            return "PLOS"
        case "fedreg-rn", "fedreg-cms":
            return "Federal Register"
        case "osha-news":
            return "OSHA"
        default:
            return source.uppercased()
        }
    }

    /// Editorial source tone for the authority eyebrow. Each source family maps
    /// to a desaturated bibliography color so a feed mixing FDA, CDC, journals,
    /// and regulators reads as a curated wire — never the single FDA navy that
    /// previously tinted every item regardless of origin.
    var authorityColor: Color {
        switch source {
        case "fda-drugs", "fda-medwatch", "fda-enforcement", "fda-shortages":
            return NMColor.sourceFDA        // classical navy — drug regulation
        case "cdc-newsroom", "cdc-han", "cdc-outbreaks", "cdc-mmwr", "osha-news":
            return NMColor.sourceAgency     // letterhead slate — public-health agencies
        case "cdc-eid", "plos-medicine", "plos-gph":
            return NMColor.sourceJournal    // aged burgundy — peer-reviewed
        case "fedreg-rn", "fedreg-cms":
            return NMColor.sourceGuideline  // institutional slate — regulation
        default:
            return NMColor.sourceAgency
        }
    }

    /// Estimated reading time in minutes, rounded up, minimum 1. Uses the
    /// 200-words-per-minute benchmark Medium and Substack use, applied to
    /// the body word count (whitespace-split). Headline + dek aren't counted
    /// — they're scanned, not read.
    var readMinutes: Int {
        let words = body.split { $0.isWhitespace }.count
        return max(1, Int((Double(words) / 200.0).rounded(.up)))
    }

    /// Date to surface in card eyebrows and reading view. Prefers the real
    /// FDA/CDC publication time (`sourcePublishedAt`); falls back to our
    /// internal `publishedAt` (the moment the item was promoted to
    /// auto_published) only when the source feed didn't include a pubDate.
    /// Without this, the eyebrow would show "approval time" instead of
    /// "FDA publish time" — misleading.
    var displayDate: Date {
        sourcePublishedAt ?? publishedAt
    }
}
