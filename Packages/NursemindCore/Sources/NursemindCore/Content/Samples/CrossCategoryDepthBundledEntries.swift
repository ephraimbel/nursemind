import Foundation

extension ContentRegistry {
    static func bundledCrossCategoryDepth() -> [LibraryEntry] {
        [
            .drug(CCDepthCefiderocolSample.entry),
            .drug(CCDepthCeftazidimeAvibactamSample.entry),
            .drip(CCDepthAngiotensinIiDripSample.entry),
            .drip(CCDepthCangrelorDripSample.entry),
            .lab(CCDepthCystatinCSample.entry),
            .lab(CCDepthUrineOsmolalitySample.entry),
            .procedure(CCDepth24HourUrineCollectionSample.entry),
            .procedure(CCDepthPeakFlowMeasurementSample.entry),
            .diagnosis(CCDepthAlpha1AntitrypsinDeficiencySample.entry),
            .diagnosis(CCDepthCentralSleepApneaSample.entry),
            .scenario(CCDepthCheckbackFallingBloodPressureSample.entry),
            .scenario(CCDepthCusLaborDeliveryEscalationSample.entry),
            .communication(CCDepthInterpreterSafetyEscalationSample.entry)
        ]
    }
}
