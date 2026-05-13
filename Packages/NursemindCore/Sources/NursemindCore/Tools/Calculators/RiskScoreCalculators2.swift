import SwiftUI

// MARK: - Shared citation sources

private let sullivan1989Ciwa = CitationSource(
    id: "sullivan_1989_ciwa",
    shortName: "CIWA-Ar — Sullivan JT et al., Br J Addict 1989 (concept citation)",
    detail: "Clinical Institute Withdrawal Assessment for Alcohol — revised 10-item scale",
    publisher: "British Journal of Addiction",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2597811/",
    lastRetrieved: "2026-05-04"
)

private let morse1989 = CitationSource(
    id: "morse_1989_falls",
    shortName: "Morse Fall Scale — Morse JM et al. 1989 (concept citation)",
    detail: "Validated inpatient fall-risk assessment used widely in U.S. hospitals",
    publisher: "Canadian Journal of Aging",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2700681/",
    lastRetrieved: "2026-05-04"
)

private let bergstrom1987 = CitationSource(
    id: "bergstrom_1987_braden",
    shortName: "Braden Scale — Bergstrom N et al., Nurs Res 1987 (concept citation)",
    detail: "Validated tool for predicting pressure-injury risk in adult inpatients",
    publisher: "Nursing Research",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/3299278/",
    lastRetrieved: "2026-05-04"
)

private let openrnRisk2 = CitationSource(
    id: "openrn_risk_tools_2",
    shortName: "Open RN Health Alterations & Fundamentals — Risk Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=risk+assessment+score+screening",
    lastRetrieved: "2026-05-04"
)

// MARK: - CIWA-Ar

public struct CIWAArCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "nausea")      private var nauseaID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "tremor")      private var tremorID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "sweats")      private var sweatsID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "anxiety")     private var anxietyID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "agitation")   private var agitationID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "tactile")     private var tactileID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "auditory")    private var auditoryID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "visual")      private var visualID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "headache")    private var headacheID
    @CalcPersistedOptionID(calculatorID: "ciwa-ar", key: "orientation") private var orientationID

    private var nausea:      CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == nauseaID } }
    private var tremor:      CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == tremorID } }
    private var sweats:      CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == sweatsID } }
    private var anxiety:     CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == anxietyID } }
    private var agitation:   CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == agitationID } }
    private var tactile:     CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == tactileID } }
    private var auditory:    CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == auditoryID } }
    private var visual:      CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == visualID } }
    private var headache:    CalculatorScoreRow.Option? { zeroToSeven.first { $0.id == headacheID } }
    private var orientation: CalculatorScoreRow.Option? { zeroToFour.first  { $0.id == orientationID } }

    private let zeroToSeven: [CalculatorScoreRow.Option] = (0...7).map { i in
        .init(id: i, label: ciwaLabel(i), score: i)
    }

    private static func ciwaLabel(_ score: Int) -> String {
        switch score {
        case 0: return "0 — none"
        case 1: return "1 — very mild"
        case 2: return "2 — mild"
        case 3: return "3 — mild–moderate"
        case 4: return "4 — moderate"
        case 5: return "5 — moderate–severe"
        case 6: return "6 — severe"
        default: return "7 — extreme"
        }
    }

    private let zeroToFour: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 — fully oriented",                    score: 0),
        .init(id: 1, label: "1 — uncertain about date",              score: 1),
        .init(id: 2, label: "2 — disoriented to date by ≤ 2 days",   score: 2),
        .init(id: 3, label: "3 — disoriented by > 2 days",           score: 3),
        .init(id: 4, label: "4 — disoriented to place / person",     score: 4)
    ]

    private var total: Int? {
        let parts = [nausea, tremor, sweats, anxiety, agitation, tactile, auditory, visual, headache, orientation]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 20 { return ("CIWA-Ar ≥ 20 — severe-withdrawal band per Sullivan 1989; published high risk of withdrawal seizure and delirium tremens.", .alert) }
        if s >= 16 { return ("CIWA-Ar 16–19 — severe-withdrawal band.", .alert) }
        if s >= 9  { return ("CIWA-Ar 9–15 — moderate-withdrawal band; standard threshold for symptom-triggered protocols in published literature.", .caution) }
        return ("CIWA-Ar ≤ 8 — mild-withdrawal band per published cutoffs.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "CIWA-Ar",
            subtitle: "Alcohol withdrawal severity"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Nausea / vomiting",        options: zeroToSeven, selection: $nauseaID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Tremor",                   options: zeroToSeven, selection: $tremorID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Paroxysmal sweats",        options: zeroToSeven, selection: $sweatsID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Anxiety",                  options: zeroToSeven, selection: $anxietyID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Agitation",                options: zeroToSeven, selection: $agitationID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Tactile disturbances",     options: zeroToSeven, selection: $tactileID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Auditory disturbances",    options: zeroToSeven, selection: $auditoryID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Visual disturbances",      options: zeroToSeven, selection: $visualID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Headache / fullness",      options: zeroToSeven, selection: $headacheID.option(in: zeroToSeven))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Orientation / clouding",   options: zeroToFour,  selection: $orientationID.option(in: zeroToFour))
            }
            CalculatorResultDisplay(
                label: "CIWA-Ar",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 9 items (0–7) + 1 item (0–4). Range 0–67.\nReassess every 1–2 hours per institutional protocol.",
                notes: "Symptom-triggered protocols (benzodiazepines dosed by serial CIWA-Ar) are associated in published literature with lower total benzodiazepine exposure and shorter withdrawal duration vs. fixed-schedule dosing in alert, communicative patients. CIWA-Ar requires a verbal, cooperative patient — alternative tools (e.g., RASS-based protocols) are used in intubated or non-communicative patients per published consensus.",
                citations: [sullivan1989Ciwa, openrnRisk2]
            )
        }
    }
}

// MARK: - Morse Fall Scale

public struct MorseFallCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "morse", key: "historyOfFalls") private var historyOfFallsID
    @CalcPersistedOptionID(calculatorID: "morse", key: "secondaryDx")    private var secondaryDxID
    @CalcPersistedOptionID(calculatorID: "morse", key: "aid")            private var aidID
    @CalcPersistedOptionID(calculatorID: "morse", key: "ivLock")         private var ivLockID
    @CalcPersistedOptionID(calculatorID: "morse", key: "gait")           private var gaitID
    @CalcPersistedOptionID(calculatorID: "morse", key: "mental")         private var mentalID

    private var historyOfFalls: CalculatorScoreRow.Option? { yesNo25.first        { $0.id == historyOfFallsID } }
    private var secondaryDx:    CalculatorScoreRow.Option? { yesNo15.first        { $0.id == secondaryDxID } }
    private var aid:            CalculatorScoreRow.Option? { aidOptions.first     { $0.id == aidID } }
    private var ivLock:         CalculatorScoreRow.Option? { ivOptions.first      { $0.id == ivLockID } }
    private var gait:           CalculatorScoreRow.Option? { gaitOptions.first    { $0.id == gaitID } }
    private var mental:         CalculatorScoreRow.Option? { mentalOptions.first  { $0.id == mentalID } }

    private let yesNo25: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No",  score: 0),
        .init(id: 1, label: "Yes", score: 25)
    ]
    private let yesNo15: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No",  score: 0),
        .init(id: 1, label: "Yes", score: 15)
    ]
    private let aidOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None / bedrest / wheelchair / nurse assist", score: 0),
        .init(id: 1, label: "Crutches / cane / walker",                   score: 15),
        .init(id: 2, label: "Furniture",                                  score: 30)
    ]
    private let ivOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No",  score: 0),
        .init(id: 1, label: "Yes", score: 20)
    ]
    private let gaitOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Normal / bedrest / immobile", score: 0),
        .init(id: 1, label: "Weak",                        score: 10),
        .init(id: 2, label: "Impaired",                    score: 20)
    ]
    private let mentalOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Knows own limits", score: 0),
        .init(id: 1, label: "Forgets limits",   score: 15)
    ]

    private var total: Int? {
        let parts = [historyOfFalls, secondaryDx, aid, ivLock, gait, mental]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 45 { return ("Morse ≥ 45 — high-fall-risk band per published cutoffs.", .alert) }
        if s >= 25 { return ("Morse 25–44 — low-fall-risk band per published cutoffs.", .caution) }
        return ("Morse 0–24 — minimal-fall-risk band per published cutoffs.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Morse Fall Scale",
            subtitle: "Inpatient fall risk"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "History of falls (3 mo)",   options: yesNo25,    selection: $historyOfFallsID.option(in: yesNo25))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Secondary diagnosis",       options: yesNo15,    selection: $secondaryDxID.option(in: yesNo15))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Ambulatory aid",            options: aidOptions, selection: $aidID.option(in: aidOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "IV / saline lock",          options: ivOptions,  selection: $ivLockID.option(in: ivOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Gait / transferring",       options: gaitOptions, selection: $gaitID.option(in: gaitOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Mental status",             options: mentalOptions, selection: $mentalID.option(in: mentalOptions))
            }
            CalculatorResultDisplay(
                label: "Morse Fall Scale",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 6 weighted items. Range 0–125.",
                notes: "The threshold for 'high risk' varies by facility (commonly ≥ 45 in adult med-surg; some institutions use ≥ 51). Apply your unit's specific cut-off and bundle. Reassess after a fall, with status change, on transfer, and per protocol.",
                citations: [morse1989, openrnRisk2]
            )
        }
    }
}

// MARK: - Braden Scale

public struct BradenCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "braden", key: "sensory")   private var sensoryID
    @CalcPersistedOptionID(calculatorID: "braden", key: "moisture")  private var moistureID
    @CalcPersistedOptionID(calculatorID: "braden", key: "activity")  private var activityID
    @CalcPersistedOptionID(calculatorID: "braden", key: "mobility")  private var mobilityID
    @CalcPersistedOptionID(calculatorID: "braden", key: "nutrition") private var nutritionID
    @CalcPersistedOptionID(calculatorID: "braden", key: "friction")  private var frictionID

    private var sensory:   CalculatorScoreRow.Option? { sensoryOptions.first   { $0.id == sensoryID } }
    private var moisture:  CalculatorScoreRow.Option? { moistureOptions.first  { $0.id == moistureID } }
    private var activity:  CalculatorScoreRow.Option? { activityOptions.first  { $0.id == activityID } }
    private var mobility:  CalculatorScoreRow.Option? { mobilityOptions.first  { $0.id == mobilityID } }
    private var nutrition: CalculatorScoreRow.Option? { nutritionOptions.first { $0.id == nutritionID } }
    private var friction:  CalculatorScoreRow.Option? { frictionOptions.first  { $0.id == frictionID } }

    private let oneToFour = { (labels: [String]) -> [CalculatorScoreRow.Option] in
        zip(1...4, labels).map { CalculatorScoreRow.Option(id: $0.0, label: $0.1, score: $0.0) }
    }

    private var sensoryOptions: [CalculatorScoreRow.Option] {
        oneToFour(["1 — completely limited", "2 — very limited", "3 — slightly limited", "4 — no impairment"])
    }
    private var moistureOptions: [CalculatorScoreRow.Option] {
        oneToFour(["1 — constantly moist", "2 — often moist", "3 — occasionally moist", "4 — rarely moist"])
    }
    private var activityOptions: [CalculatorScoreRow.Option] {
        oneToFour(["1 — bedfast", "2 — chairfast", "3 — walks occasionally", "4 — walks frequently"])
    }
    private var mobilityOptions: [CalculatorScoreRow.Option] {
        oneToFour(["1 — completely immobile", "2 — very limited", "3 — slightly limited", "4 — no limitation"])
    }
    private var nutritionOptions: [CalculatorScoreRow.Option] {
        oneToFour(["1 — very poor", "2 — probably inadequate", "3 — adequate", "4 — excellent"])
    }
    private var frictionOptions: [CalculatorScoreRow.Option] {
        [.init(id: 1, label: "1 — problem",            score: 1),
         .init(id: 2, label: "2 — potential problem",  score: 2),
         .init(id: 3, label: "3 — no apparent problem", score: 3)]
    }

    private var total: Int? {
        let parts = [sensory, moisture, activity, mobility, nutrition, friction]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s <= 9   { return ("Braden ≤ 9 — severe-risk band per published cutoffs.", .alert) }
        if s <= 12  { return ("Braden 10–12 — high-risk band per published cutoffs.", .alert) }
        if s <= 14  { return ("Braden 13–14 — moderate-risk band per published cutoffs.", .caution) }
        if s <= 18  { return ("Braden 15–18 — mild-risk band per published cutoffs.", .caution) }
        return ("Braden ≥ 19 — at-risk threshold not met per published cutoffs.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Braden Scale",
            subtitle: "Pressure injury risk"
        ) {
            CalculatorSection("SUBSCALES") {
                CalculatorScoreRow(label: "Sensory perception", options: sensoryOptions,  selection: $sensoryID.option(in: sensoryOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Moisture",           options: moistureOptions, selection: $moistureID.option(in: moistureOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Activity",           options: activityOptions, selection: $activityID.option(in: activityOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Mobility",           options: mobilityOptions, selection: $mobilityID.option(in: mobilityOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Nutrition",          options: nutritionOptions, selection: $nutritionID.option(in: nutritionOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Friction / shear",   options: frictionOptions, selection: $frictionID.option(in: frictionOptions))
            }
            CalculatorResultDisplay(
                label: "Braden",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 6 subscales. Range 6–23.\n5 subscales rated 1–4; friction/shear rated 1–3.",
                notes: "Lower score = higher risk (inverse to Morse). Direct prevention to whichever subscale scored lowest — e.g. low Mobility prompts repositioning schedule and pressure-redistribution surface; low Nutrition prompts dietitian consult. Reassess on admission, daily, and after any status change.",
                citations: [bergstrom1987, openrnRisk2]
            )
        }
    }
}
