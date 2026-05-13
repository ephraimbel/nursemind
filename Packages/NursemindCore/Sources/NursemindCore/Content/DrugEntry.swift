import Foundation

public struct DrugEntry: Identifiable, Codable, Sendable {
    public let id: String                    // slug, e.g. "norepinephrine"
    public let title: String                 // "Norepinephrine"
    public let subtitle: String?             // "Levophed · norepinephrine bitartrate"
    public let category: String              // "Vasopressor"
    public let isHighAlert: Bool

    public let quickReference: [KeyValueRow]
    public let indications: AttributedProse
    public let mechanism: AttributedProse
    public let dosing: [DosingBlock]
    public let contraindications: AttributedProse?
    public let warnings: [AttributedBullet]
    public let adverseReactions: AttributedProse
    public let drugInteractions: [AttributedBullet]
    public let nursingImplications: [AttributedBullet]?    // omitted if no OER coverage
    public let patientTeaching: AttributedProse?           // omitted if no OER coverage

    public let citations: [CitationSource]
    public let lastSourceFidelityReview: String           // ISO date

    public init(
        id: String,
        title: String,
        subtitle: String? = nil,
        category: String,
        isHighAlert: Bool = false,
        quickReference: [KeyValueRow],
        indications: AttributedProse,
        mechanism: AttributedProse,
        dosing: [DosingBlock],
        contraindications: AttributedProse? = nil,
        warnings: [AttributedBullet],
        adverseReactions: AttributedProse,
        drugInteractions: [AttributedBullet],
        nursingImplications: [AttributedBullet]? = nil,
        patientTeaching: AttributedProse? = nil,
        citations: [CitationSource],
        lastSourceFidelityReview: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.category = category
        self.isHighAlert = isHighAlert
        self.quickReference = quickReference
        self.indications = indications
        self.mechanism = mechanism
        self.dosing = dosing
        self.contraindications = contraindications
        self.warnings = warnings
        self.adverseReactions = adverseReactions
        self.drugInteractions = drugInteractions
        self.nursingImplications = nursingImplications
        self.patientTeaching = patientTeaching
        self.citations = citations
        self.lastSourceFidelityReview = lastSourceFidelityReview
    }
}

public struct KeyValueRow: Codable, Hashable, Sendable {
    public let key: String
    public let value: String

    public init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}

public struct AttributedProse: Codable, Hashable, Sendable {
    public let text: String
    public let citationIDs: [String]   // refs into DrugEntry.citations[].id

    public init(_ text: String, citationIDs: [String]) {
        self.text = text
        self.citationIDs = citationIDs
    }
}

public struct AttributedBullet: Codable, Hashable, Sendable {
    public let text: String
    public let citationIDs: [String]

    public init(_ text: String, citationIDs: [String]) {
        self.text = text
        self.citationIDs = citationIDs
    }
}

public struct DosingBlock: Codable, Hashable, Sendable {
    public let label: String           // "Initial", "Maintenance", "Dilution", "Discontinuation"
    public let body: String            // verbatim from source
    public let citationIDs: [String]

    public init(label: String, body: String, citationIDs: [String]) {
        self.label = label
        self.body = body
        self.citationIDs = citationIDs
    }
}
