import Foundation

extension ContentRegistry {
    static func bundledBedsideDepth() -> [LibraryEntry] {
        [
            .reference(BedsideDepthFeedingTubePlacementSafetySample.entry),
            .reference(BedsideDepthEnteralFeedingToleranceSample.entry),
            .reference(BedsideDepthEnteralMedicationSafetySample.entry),
            .reference(BedsideDepthNasogastricDecompressionMonitoringSample.entry),
            .reference(BedsideDepthSerialNeurologicalAssessmentSample.entry),
            .reference(BedsideDepthFluidVolumeAssessmentSample.entry),
            .reference(BedsideDepthSurgicalDrainMonitoringSample.entry),
            .reference(BedsideDepthPeripheralIvComplicationAssessmentSample.entry)
        ]
    }
}
