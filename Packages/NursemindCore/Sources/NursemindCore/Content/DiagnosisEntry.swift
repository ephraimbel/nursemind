import Foundation

public struct DiagnosisEntry: Identifiable, Codable, Sendable {
    public let id: String
    public let title: String
    public let subtitle: String?
    public let nclexTags: NCLEXTags?

    public let definition: AttributedProse
    public let pathophysiology: AttributedProse?
    public let presentation: [AttributedBullet]
    public let diagnosticCriteria: [AttributedBullet]?
    public let priorityAssessments: [AttributedBullet]?
    public let commonInterventions: [AttributedBullet]?
    public let watchFor: [AttributedBullet]?

    public let citations: [CitationSource]
    public let lastSourceFidelityReview: String

    public init(
        id: String,
        title: String,
        subtitle: String? = nil,
        nclexTags: NCLEXTags? = nil,
        definition: AttributedProse,
        pathophysiology: AttributedProse? = nil,
        presentation: [AttributedBullet],
        diagnosticCriteria: [AttributedBullet]? = nil,
        priorityAssessments: [AttributedBullet]? = nil,
        commonInterventions: [AttributedBullet]? = nil,
        watchFor: [AttributedBullet]? = nil,
        citations: [CitationSource],
        lastSourceFidelityReview: String
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.nclexTags = nclexTags
        self.definition = definition
        self.pathophysiology = pathophysiology
        self.presentation = presentation
        self.diagnosticCriteria = diagnosticCriteria
        self.priorityAssessments = priorityAssessments
        self.commonInterventions = commonInterventions
        self.watchFor = watchFor
        self.citations = citations
        self.lastSourceFidelityReview = lastSourceFidelityReview
    }
}
