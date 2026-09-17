import Foundation

extension ContentRegistry {
    static func bundledRespiratoryHematologyDepth() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(RHDepthBronchoscopyPreparationRecoverySample.entry))
        entries.append(.reference(RHDepthThoracentesisAssessmentRecoverySample.entry))
        entries.append(.reference(RHDepthPulmonaryFunctionTestingSupportSample.entry))
        entries.append(.reference(RHDepthPleuralEffusionFollowUpSample.entry))
        entries.append(.reference(RHDepthVteRecoveryFollowUpSample.entry))
        entries.append(.reference(RHDepthPeripheralArteryDiseaseFootCareSample.entry))
        entries.append(.reference(RHDepthImmuneThrombocytopeniaFollowUpSample.entry))
        entries.append(.reference(RHDepthAplasticAnemiaNursingSupportSample.entry))
        entries.append(.reference(RHDepthHemolyticAnemiaFollowUpSample.entry))
        entries.append(.reference(RHDepthVitaminB12DeficiencyFollowUpSample.entry))
        return entries
    }
}
