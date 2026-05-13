import Foundation

/// A general-purpose reference entry — used for CDC isolation precautions, immunization
/// schedules, scope-of-practice quick-refs, and similar curated reference content.
/// Composed of an ordered list of typed sections.
public struct ReferenceEntry: Identifiable, Codable, Sendable {
    public let id: String
    public let title: String
    public let subtitle: String?
    public let eyebrow: String                  // e.g. "REFERENCE · PRECAUTIONS"
    public let nclexTags: NCLEXTags?
    public let sections: [ReferenceSection]
    public let citations: [CitationSource]
    public let lastSourceFidelityReview: String

    public init(
        id: String,
        title: String,
        subtitle: String? = nil,
        eyebrow: String,
        nclexTags: NCLEXTags? = nil,
        sections: [ReferenceSection],
        citations: [CitationSource],
        lastSourceFidelityReview: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.eyebrow = eyebrow
        self.nclexTags = nclexTags
        self.sections = sections
        self.citations = citations
        self.lastSourceFidelityReview = lastSourceFidelityReview
    }
}

public enum ReferenceSection: Codable, Sendable, Hashable {
    case prose(title: String, AttributedProse)
    case bullets(title: String, [AttributedBullet])
    case keyValueTable(title: String, [KeyValueRow])
    case numberedSteps(title: String, [String], citationIDs: [String])
}
