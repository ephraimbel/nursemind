import Foundation

extension ContentRegistry {
    static func bundledInfectionProcedureDepth() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(IPDepthCreBedsideTransferPrecautionsSample.entry))
        entries.append(.reference(IPDepthHemodialysisAccessObservationSample.entry))
        entries.append(.reference(IPDepthPeritonealDialysisInfectionRecognitionSample.entry))
        entries.append(.reference(IPDepthKidneyBiopsyPreparationRecoverySample.entry))
        entries.append(.reference(IPDepthNephroticSyndromeFollowUpSample.entry))
        entries.append(.reference(IPDepthKidneyStoneRecoveryPreventionSample.entry))
        entries.append(.reference(IPDepthCardiacCatheterizationPreparationRecoverySample.entry))
        entries.append(.reference(IPDepthPlannedCardioversionPreparationRecoverySample.entry))
        entries.append(.reference(IPDepthPermanentPacemakerFollowUpSample.entry))
        entries.append(.reference(IPDepthIcdShockFollowUpSample.entry))
        entries.append(.reference(IPDepthCardiacSurgeryRecoverySupportSample.entry))
        return entries
    }
}
