import Foundation

public struct LabEntry: Identifiable, Codable, Sendable {
    public let id: String
    public let title: String
    public let subtitle: String?            // e.g. "Serum / plasma"
    public let specimen: String             // e.g. "Serum", "Whole blood", "Arterial blood"
    public let nclexTags: NCLEXTags?

    public let referenceRanges: [ReferenceRangeRow]
    public let interpretationTiers: [InterpretationTier]
    public let commonCauses: [CauseGroup]
    public let nursingActions: [AttributedBullet]?
    public let watchFor: [AttributedBullet]?

    public let citations: [CitationSource]
    public let lastSourceFidelityReview: String

    public init(
        id: String,
        title: String,
        subtitle: String? = nil,
        specimen: String,
        nclexTags: NCLEXTags? = nil,
        referenceRanges: [ReferenceRangeRow],
        interpretationTiers: [InterpretationTier],
        commonCauses: [CauseGroup] = [],
        nursingActions: [AttributedBullet]? = nil,
        watchFor: [AttributedBullet]? = nil,
        citations: [CitationSource],
        lastSourceFidelityReview: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.specimen = specimen
        self.nclexTags = nclexTags
        self.referenceRanges = referenceRanges
        self.interpretationTiers = interpretationTiers
        self.commonCauses = commonCauses
        self.nursingActions = nursingActions
        self.watchFor = watchFor
        self.citations = citations
        self.lastSourceFidelityReview = lastSourceFidelityReview
    }
}

public struct ReferenceRangeRow: Codable, Hashable, Sendable {
    public let value: String                // "< 2.0 mmol/L", "135–145 mEq/L"
    public let label: String                // "Normal", "Elevated", "Critical"
    public let citationIDs: [String]

    public init(value: String, label: String, citationIDs: [String]) {
        self.value = value
        self.label = label
        self.citationIDs = citationIDs
    }
}

public enum InterpretationSeverity: String, Codable, Sendable {
    case normal, low, high, critical
}

public struct InterpretationTier: Codable, Hashable, Sendable {
    public let severity: InterpretationSeverity
    public let label: String                // "Critical (>4.0)"
    public let summary: String              // verbatim from source — what it means clinically
    public let nursingActions: [String]     // bulleted nursing actions
    public let citationIDs: [String]

    public init(
        severity: InterpretationSeverity,
        label: String,
        summary: String,
        nursingActions: [String] = [],
        citationIDs: [String]
    ) {
        self.severity = severity
        self.label = label
        self.summary = summary
        self.nursingActions = nursingActions
        self.citationIDs = citationIDs
    }
}

public struct CauseGroup: Codable, Hashable, Sendable {
    public let title: String                // "Type A (hypoxic)" / "Acute causes"
    public let causes: [String]
    public let citationIDs: [String]

    public init(title: String, causes: [String], citationIDs: [String]) {
        self.title = title
        self.causes = causes
        self.citationIDs = citationIDs
    }
}
