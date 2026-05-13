import Foundation

public struct ProcedureEntry: Identifiable, Codable, Sendable {
    public let id: String
    public let title: String
    public let subtitle: String?
    public let nclexTags: NCLEXTags?

    public let indications: AttributedProse
    public let contraindications: AttributedProse?
    public let equipment: [AttributedBullet]
    public let preProcedure: [AttributedBullet]
    public let steps: [ProcedureStep]
    public let postProcedure: [AttributedBullet]
    public let documentation: [AttributedBullet]?
    public let watchFor: [AttributedBullet]?

    public let citations: [CitationSource]
    public let lastSourceFidelityReview: String

    public init(
        id: String,
        title: String,
        subtitle: String? = nil,
        nclexTags: NCLEXTags? = nil,
        indications: AttributedProse,
        contraindications: AttributedProse? = nil,
        equipment: [AttributedBullet],
        preProcedure: [AttributedBullet],
        steps: [ProcedureStep],
        postProcedure: [AttributedBullet],
        documentation: [AttributedBullet]? = nil,
        watchFor: [AttributedBullet]? = nil,
        citations: [CitationSource],
        lastSourceFidelityReview: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.nclexTags = nclexTags
        self.indications = indications
        self.contraindications = contraindications
        self.equipment = equipment
        self.preProcedure = preProcedure
        self.steps = steps
        self.postProcedure = postProcedure
        self.documentation = documentation
        self.watchFor = watchFor
        self.citations = citations
        self.lastSourceFidelityReview = lastSourceFidelityReview
    }
}

public struct ProcedureStep: Codable, Hashable, Sendable {
    public let number: Int
    public let title: String?
    public let body: String
    public let citationIDs: [String]

    public init(number: Int, title: String? = nil, body: String, citationIDs: [String]) {
        self.number = number
        self.title = title
        self.body = body
        self.citationIDs = citationIDs
    }
}
