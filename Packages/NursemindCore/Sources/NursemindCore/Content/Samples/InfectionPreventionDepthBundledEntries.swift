import Foundation

extension ContentRegistry {
    static func bundledInfectionPreventionDepth() -> [LibraryEntry] {
        var entries: [LibraryEntry] = []
        entries.append(.reference(CdiffBedsidePreventionSample.entry))
        entries.append(.reference(CandidaAurisBedsidePreventionSample.entry))
        entries.append(.reference(NorovirusHealthcareOutbreakSample.entry))
        entries.append(.reference(MeaslesHealthcarePreventionSample.entry))
        entries.append(.reference(ShinglesHealthcarePrecautionsSample.entry))
        entries.append(.reference(InfluenzaHealthcarePreventionSample.entry))
        return entries
    }
}
