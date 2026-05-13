import Foundation

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

    public enum Category: String, Codable, Sendable, Equatable {
        case drugSafety        = "drug_safety"
        case clinicalGuideline = "clinical_guideline"
        case publicHealth      = "public_health"
        case medicationSafety  = "medication_safety"
        case licensure
        case research

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
    }
}

/// Single inline citation referenced by `[N]` markers in the body text.
public struct FeedCitation: Codable, Sendable, Identifiable, Equatable {
    public let n: Int
    public let source: String
    public let url: String
    public let quote: String

    public var id: Int { n }
}

public extension FeedItem {
    /// Short authority label for the card eyebrow. Derived from `source`
    /// (the ingest-stage source id) so the iOS doesn't need a roundtrip to
    /// a label table — adding a new source means one map entry here.
    var authorityLabel: String {
        switch source {
        case "fda-drugs", "fda-medwatch": return "FDA"
        case "cdc-han":                   return "CDC"
        case "cdc-mmwr":                  return "CDC MMWR"
        default:                          return source.uppercased()
        }
    }
}
