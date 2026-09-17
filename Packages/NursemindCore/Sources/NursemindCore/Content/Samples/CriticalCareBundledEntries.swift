import Foundation

extension ContentRegistry {
    static func bundledCriticalCareDepth() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(ICUDepthOxygenDeviceBedsideChecksSample.entry))
        entries.append(.reference(ICUDepthOxygenationVersusVentilationSample.entry))
        entries.append(.reference(ICUDepthHighFlowNasalCannulaMonitoringSample.entry))
        entries.append(.reference(ICUDepthNoninvasiveVentilationBedsideAssessmentSample.entry))
        entries.append(.reference(ICUDepthVentilatorBedsideAssessmentSample.entry))
        entries.append(.reference(ICUDepthVentilatorWaveformObservationSample.entry))
        entries.append(.reference(ICUDepthPatientVentilatorAsynchronyRecognitionSample.entry))
        entries.append(.reference(ICUDepthAutoPeepAndIneffectiveTriggeringSample.entry))
        entries.append(.reference(ICUDepthArtificialAirwaySecretionAssessmentSample.entry))
        entries.append(.reference(ICUDepthTracheostomyBedsideSafetyChecksSample.entry))
        entries.append(.reference(ICUDepthVentilatorLiberationObservationSample.entry))
        entries.append(.reference(ICUDepthPostExtubationObservationSample.entry))
        entries.append(.reference(ICUDepthTelemetrySignalQualitySample.entry))
        entries.append(.reference(ICUDepthEcgRateAndIntervalReviewSample.entry))
        entries.append(.reference(ICUDepthRhythmChangeBedsideAssessmentSample.entry))
        entries.append(.reference(ICUDepthQtIntervalMonitoringContextSample.entry))
        entries.append(.reference(ICUDepthAdultCprQualityReviewSample.entry))
        entries.append(.reference(ICUDepthResuscitationAirwayCapnographySample.entry))
        entries.append(.reference(ICUDepthPostArrestAssessmentPrioritiesSample.entry))
        entries.append(.reference(ICUDepthCardiacArrestRecoverySupportSample.entry))
        return entries
    }
}
