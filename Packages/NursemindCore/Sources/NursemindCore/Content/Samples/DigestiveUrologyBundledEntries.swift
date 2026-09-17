import Foundation

extension ContentRegistry {
    static func bundledDigestiveUrologyDepth() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(DUDepthColonoscopyPreparationRecoverySample.entry))
        entries.append(.reference(DUDepthUpperGiEndoscopyPreparationRecoverySample.entry))
        entries.append(.reference(DUDepthErcpPreparationRecoverySample.entry))
        entries.append(.reference(DUDepthLiverBiopsyPreparationRecoverySample.entry))
        entries.append(.reference(DUDepthFlexibleSigmoidoscopyPreparationRecoverySample.entry))
        entries.append(.reference(DUDepthCystoscopyUreteroscopyPreparationRecoverySample.entry))
        entries.append(.reference(DUDepthUrodynamicTestingPreparationSample.entry))
        entries.append(.reference(DUDepthUrinaryTractImagingPreparationSample.entry))
        entries.append(.reference(DUDepthBphSymptomTreatmentFollowUpSample.entry))
        entries.append(.reference(DUDepthHematuriaAssessmentFollowUpSample.entry))
        return entries
    }
}
