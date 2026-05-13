import SwiftUI

// MARK: - Shared citation sources

private let mewsSubbe = CitationSource(
    id: "mews_subbe",
    shortName: "MEWS — Subbe et al. QJM 2001 (concept citation)",
    detail: "Modified Early Warning Score for medical admissions",
    publisher: "Quarterly Journal of Medicine",
    license: .factCitationOnly,
    url: "https://academic.oup.com/qjmed",
    lastRetrieved: "2026-05-04"
)

private let news2Royal = CitationSource(
    id: "news2_rcp",
    shortName: "NEWS2 — Royal College of Physicians (concept citation)",
    detail: "National Early Warning Score 2 — second-edition NHS-endorsed early-warning system",
    publisher: "Royal College of Physicians",
    license: .factCitationOnly,
    url: "https://www.rcp.ac.uk/improving-care/national-early-warning-score-news/",
    lastRetrieved: "2026-05-04"
)

private let gcsTeasdale = CitationSource(
    id: "gcs_teasdale_jennett",
    shortName: "Glasgow Coma Scale — Teasdale & Jennett, Lancet 1974 (concept citation)",
    detail: "Original Glasgow Coma Scale (eye, verbal, motor)",
    publisher: "Lancet",
    license: .factCitationOnly,
    url: "https://www.glasgowcomascale.org/",
    lastRetrieved: "2026-05-04"
)

private let apgarVirginia = CitationSource(
    id: "apgar_virginia_apgar",
    shortName: "Apgar Score — Virginia Apgar 1953 (concept citation)",
    detail: "Newborn cardiopulmonary assessment at 1 and 5 minutes",
    publisher: "Curr Res Anesth Analg",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/13083014/",
    lastRetrieved: "2026-05-04"
)

private let flaccMerkel = CitationSource(
    id: "flacc_merkel",
    shortName: "FLACC Pain Scale — Merkel et al. Pediatr Nurs 1997 (concept citation)",
    detail: "Face, Legs, Activity, Cry, Consolability — observational pain scale for non-verbal children",
    publisher: "Pediatric Nursing",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/9220806/",
    lastRetrieved: "2026-05-04"
)

private let openrnAssessment = CitationSource(
    id: "openrn_assessment",
    shortName: "Open RN Health Assessment — Vital Signs & Neurological",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthassessment/?s=assessment+vitals+pain+screening",
    lastRetrieved: "2026-05-04"
)

// MARK: - MEWS

public struct MEWSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "mews", key: "sbp")  private var sbpID
    @CalcPersistedOptionID(calculatorID: "mews", key: "hr")   private var hrID
    @CalcPersistedOptionID(calculatorID: "mews", key: "rr")   private var rrID
    @CalcPersistedOptionID(calculatorID: "mews", key: "temp") private var tempID
    @CalcPersistedOptionID(calculatorID: "mews", key: "avpu") private var avpuID

    private var sbp:  CalculatorScoreRow.Option? { sbpOptions.first  { $0.id == sbpID } }
    private var hr:   CalculatorScoreRow.Option? { hrOptions.first   { $0.id == hrID } }
    private var rr:   CalculatorScoreRow.Option? { rrOptions.first   { $0.id == rrID } }
    private var temp: CalculatorScoreRow.Option? { tempOptions.first { $0.id == tempID } }
    private var avpu: CalculatorScoreRow.Option? { avpuOptions.first { $0.id == avpuID } }

    private let sbpOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 70",            score: 3),
        .init(id: 1, label: "71–80",           score: 2),
        .init(id: 2, label: "81–100",          score: 1),
        .init(id: 3, label: "101–199",         score: 0),
        .init(id: 4, label: "≥ 200",           score: 2)
    ]
    private let hrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 40",            score: 2),
        .init(id: 1, label: "41–50",           score: 1),
        .init(id: 2, label: "51–100",          score: 0),
        .init(id: 3, label: "101–110",         score: 1),
        .init(id: 4, label: "111–129",         score: 2),
        .init(id: 5, label: "≥ 130",           score: 3)
    ]
    private let rrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 9",             score: 2),
        .init(id: 1, label: "9–14",            score: 0),
        .init(id: 2, label: "15–20",           score: 1),
        .init(id: 3, label: "21–29",           score: 2),
        .init(id: 4, label: "≥ 30",            score: 3)
    ]
    private let tempOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 35°C",          score: 2),
        .init(id: 1, label: "35.0–38.4°C",     score: 0),
        .init(id: 2, label: "≥ 38.5°C",        score: 2)
    ]
    private let avpuOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Alert",           score: 0),
        .init(id: 1, label: "Reacts to Voice", score: 1),
        .init(id: 2, label: "Reacts to Pain",  score: 2),
        .init(id: 3, label: "Unresponsive",    score: 3)
    ]

    private var total: Int? {
        let parts = [sbp, hr, rr, temp, avpu]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 5 { return ("MEWS ≥ 5 — high-deterioration-risk band per Subbe 2001; the standard threshold for nurse-driven escalation in most published institutional protocols.", .alert) }
        if s >= 3 { return ("MEWS 3–4 — moderate-risk band; the typical published threshold for increased monitoring frequency.", .caution) }
        return ("MEWS ≤ 2 — low-risk band per published institutional thresholds.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "MEWS",
            subtitle: "Modified Early Warning Score (Subbe 2001)"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorScoreRow(label: "Systolic BP",       options: sbpOptions, selection: $sbpID.option(in: sbpOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Heart rate",        options: hrOptions, selection: $hrID.option(in: hrOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Respiratory rate",  options: rrOptions, selection: $rrID.option(in: rrOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Temperature",       options: tempOptions, selection: $tempID.option(in: tempOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "AVPU",              options: avpuOptions, selection: $avpuID.option(in: avpuOptions))
            }
            CalculatorResultDisplay(
                label: "MEWS",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of weighted points across 5 vital-sign domains.\nPoint thresholds per Subbe 2001 protocol.",
                notes: "Designed to detect adult medical-ward deterioration. Specific escalation thresholds vary by institution; coordinate with your facility's rapid-response policy. Not validated for pediatric or obstetric patients.",
                citations: [mewsSubbe, openrnAssessment]
            )
        }
    }
}

// MARK: - NEWS2

public struct NEWS2CalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "news2", key: "rr")             private var rrID
    @CalcPersistedOptionID(calculatorID: "news2", key: "spo2")           private var spo2ID
    @CalcPersistedOptionID(calculatorID: "news2", key: "supplementalO2") private var supplementalO2ID
    @CalcPersistedOptionID(calculatorID: "news2", key: "temp")           private var tempID
    @CalcPersistedOptionID(calculatorID: "news2", key: "sbp")            private var sbpID
    @CalcPersistedOptionID(calculatorID: "news2", key: "hr")             private var hrID
    @CalcPersistedOptionID(calculatorID: "news2", key: "loc")            private var locID

    private var rr:             CalculatorScoreRow.Option? { rrOptions.first   { $0.id == rrID } }
    private var spo2:           CalculatorScoreRow.Option? { spo2Options.first { $0.id == spo2ID } }
    private var supplementalO2: CalculatorScoreRow.Option? { suppOptions.first { $0.id == supplementalO2ID } }
    private var temp:           CalculatorScoreRow.Option? { tempOptions.first { $0.id == tempID } }
    private var sbp:            CalculatorScoreRow.Option? { sbpOptions.first  { $0.id == sbpID } }
    private var hr:             CalculatorScoreRow.Option? { hrOptions.first   { $0.id == hrID } }
    private var loc:            CalculatorScoreRow.Option? { locOptions.first  { $0.id == locID } }

    private let rrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 8", score: 3),
        .init(id: 1, label: "9–11", score: 1),
        .init(id: 2, label: "12–20", score: 0),
        .init(id: 3, label: "21–24", score: 2),
        .init(id: 4, label: "≥ 25", score: 3)
    ]
    private let spo2Options: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 96%", score: 0),
        .init(id: 1, label: "94–95%", score: 1),
        .init(id: 2, label: "92–93%", score: 2),
        .init(id: 3, label: "≤ 91%", score: 3)
    ]
    private let suppOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Room air", score: 0),
        .init(id: 1, label: "Supplemental O₂", score: 2)
    ]
    private let tempOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 35.0°C", score: 3),
        .init(id: 1, label: "35.1–36.0°C", score: 1),
        .init(id: 2, label: "36.1–38.0°C", score: 0),
        .init(id: 3, label: "38.1–39.0°C", score: 1),
        .init(id: 4, label: "≥ 39.1°C", score: 2)
    ]
    private let sbpOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 90", score: 3),
        .init(id: 1, label: "91–100", score: 2),
        .init(id: 2, label: "101–110", score: 1),
        .init(id: 3, label: "111–219", score: 0),
        .init(id: 4, label: "≥ 220", score: 3)
    ]
    private let hrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 40", score: 3),
        .init(id: 1, label: "41–50", score: 1),
        .init(id: 2, label: "51–90", score: 0),
        .init(id: 3, label: "91–110", score: 1),
        .init(id: 4, label: "111–130", score: 2),
        .init(id: 5, label: "≥ 131", score: 3)
    ]
    private let locOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Alert", score: 0),
        .init(id: 1, label: "Confusion / V / P / U", score: 3)
    ]

    private var total: Int? {
        let parts = [rr, spo2, supplementalO2, temp, sbp, hr, loc]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 7 { return ("NEWS2 ≥ 7 — RCP 'high' clinical risk band; the published threshold for emergency-team assessment.", .alert) }
        if s >= 5 { return ("NEWS2 5–6 — RCP 'medium' clinical risk band.", .alert) }
        if s >= 3 { return ("NEWS2 3–4 — RCP 'low-medium' clinical risk band.", .caution) }
        return ("NEWS2 0–2 — RCP 'low' clinical risk band.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "NEWS2",
            subtitle: "National Early Warning Score 2 (RCP)"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorScoreRow(label: "Respiratory rate", options: rrOptions, selection: $rrID.option(in: rrOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "SpO₂",             options: spo2Options, selection: $spo2ID.option(in: spo2Options))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Supplemental O₂",  options: suppOptions, selection: $supplementalO2ID.option(in: suppOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Temperature",      options: tempOptions, selection: $tempID.option(in: tempOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Systolic BP",      options: sbpOptions, selection: $sbpID.option(in: sbpOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Heart rate",       options: hrOptions, selection: $hrID.option(in: hrOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Consciousness",    options: locOptions, selection: $locID.option(in: locOptions))
            }
            CalculatorResultDisplay(
                label: "NEWS2",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of weighted points across 7 physiologic domains (RCP NEWS2 v2017).",
                notes: "NEWS2 differs from NEWS by separating the SpO₂ scale for hypercapnic respiratory failure (Scale 2) and adding a separate point for supplemental oxygen. Apply the appropriate SpO₂ scale per facility protocol. Score in any single parameter ≥ 3 also triggers escalation regardless of total.",
                citations: [news2Royal, openrnAssessment]
            )
        }
    }
}

// MARK: - GCS

public struct GCSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "gcs", key: "eye")    private var eyeID
    @CalcPersistedOptionID(calculatorID: "gcs", key: "verbal") private var verbalID
    @CalcPersistedOptionID(calculatorID: "gcs", key: "motor")  private var motorID

    private var eye:    CalculatorScoreRow.Option? { eyeOptions.first    { $0.id == eyeID } }
    private var verbal: CalculatorScoreRow.Option? { verbalOptions.first { $0.id == verbalID } }
    private var motor:  CalculatorScoreRow.Option? { motorOptions.first  { $0.id == motorID } }

    private let eyeOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Spontaneous", score: 4),
        .init(id: 1, label: "To speech",   score: 3),
        .init(id: 2, label: "To pain",     score: 2),
        .init(id: 3, label: "None",        score: 1)
    ]
    private let verbalOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Oriented",            score: 5),
        .init(id: 1, label: "Confused",            score: 4),
        .init(id: 2, label: "Inappropriate words", score: 3),
        .init(id: 3, label: "Incomprehensible",    score: 2),
        .init(id: 4, label: "None",                score: 1)
    ]
    private let motorOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Obeys commands",         score: 6),
        .init(id: 1, label: "Localizes pain",         score: 5),
        .init(id: 2, label: "Withdraws from pain",    score: 4),
        .init(id: 3, label: "Flexion (decorticate)",  score: 3),
        .init(id: 4, label: "Extension (decerebrate)",score: 2),
        .init(id: 5, label: "None",                   score: 1)
    ]

    private var total: Int? {
        guard let e = eye, let v = verbal, let m = motor else { return nil }
        return e.score + v.score + m.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s <= 8  { return ("GCS ≤ 8 — severe-brain-injury band per published TBI stratification (Teasdale 1974).", .alert) }
        if s <= 12 { return ("GCS 9–12 — moderate-brain-injury band.", .caution) }
        return ("GCS 13–15 — mild-brain-injury band.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Glasgow Coma Scale",
            subtitle: "Eye · Verbal · Motor (Teasdale & Jennett 1974)"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorScoreRow(label: "Eye opening",     options: eyeOptions,    selection: $eyeID.option(in: eyeOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Verbal response", options: verbalOptions, selection: $verbalID.option(in: verbalOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Motor response",  options: motorOptions,  selection: $motorID.option(in: motorOptions))
            }
            CalculatorResultDisplay(
                label: "GCS",
                value: total.map { s in
                    let e = eye?.score ?? 0; let v = verbal?.score ?? 0; let m = motor?.score ?? 0
                    return "\(s)  (E\(e) V\(v) M\(m))"
                },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Total = Eye (1–4) + Verbal (1–5) + Motor (1–6).  Range 3–15.",
                notes: "Always document the component scores (e.g., 'GCS 11 = E3 V3 M5'), not just the total. Patients who are intubated cannot be scored on Verbal — use 'T' as the verbal component (not zero). Pre-existing aphasia, sedation, and intoxication confound interpretation.",
                citations: [gcsTeasdale, openrnAssessment]
            )
        }
    }
}

// MARK: - Apgar

public struct ApgarCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "apgar", key: "appearance")  private var appearanceID
    @CalcPersistedOptionID(calculatorID: "apgar", key: "pulse")       private var pulseID
    @CalcPersistedOptionID(calculatorID: "apgar", key: "grimace")     private var grimaceID
    @CalcPersistedOptionID(calculatorID: "apgar", key: "activity")    private var activityID
    @CalcPersistedOptionID(calculatorID: "apgar", key: "respiration") private var respirationID

    private var appearance:  CalculatorScoreRow.Option? { appearanceOptions.first  { $0.id == appearanceID } }
    private var pulse:       CalculatorScoreRow.Option? { pulseOptions.first       { $0.id == pulseID } }
    private var grimace:     CalculatorScoreRow.Option? { grimaceOptions.first     { $0.id == grimaceID } }
    private var activity:    CalculatorScoreRow.Option? { activityOptions.first    { $0.id == activityID } }
    private var respiration: CalculatorScoreRow.Option? { respirationOptions.first { $0.id == respirationID } }

    private let appearanceOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Blue/pale",                       score: 0),
        .init(id: 1, label: "Body pink, extremities blue",     score: 1),
        .init(id: 2, label: "Completely pink",                 score: 2)
    ]
    private let pulseOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Absent",          score: 0),
        .init(id: 1, label: "< 100",           score: 1),
        .init(id: 2, label: "≥ 100",           score: 2)
    ]
    private let grimaceOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No response",     score: 0),
        .init(id: 1, label: "Grimace",         score: 1),
        .init(id: 2, label: "Cry / withdraw",  score: 2)
    ]
    private let activityOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Limp",            score: 0),
        .init(id: 1, label: "Some flexion",    score: 1),
        .init(id: 2, label: "Active motion",   score: 2)
    ]
    private let respirationOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Absent",          score: 0),
        .init(id: 1, label: "Slow / irregular", score: 1),
        .init(id: 2, label: "Strong cry",      score: 2)
    ]

    private var total: Int? {
        let parts = [appearance, pulse, grimace, activity, respiration]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s <= 3 { return ("Apgar 0–3 — severely depressed band per Apgar 1953 criteria; published association with the highest neonatal-resuscitation acuity.", .alert) }
        if s <= 6 { return ("Apgar 4–6 — moderately depressed band per Apgar 1953 criteria.", .caution) }
        return ("Apgar 7–10 — reassuring band per Apgar 1953 criteria.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Apgar",
            subtitle: "Newborn assessment at 1 and 5 minutes (Apgar 1953)"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorScoreRow(label: "Appearance (color)",    options: appearanceOptions,  selection: $appearanceID.option(in: appearanceOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Pulse",                 options: pulseOptions,       selection: $pulseID.option(in: pulseOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Grimace (reflex)",      options: grimaceOptions,     selection: $grimaceID.option(in: grimaceOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Activity (muscle tone)", options: activityOptions,    selection: $activityID.option(in: activityOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Respiratory effort",    options: respirationOptions, selection: $respirationID.option(in: respirationOptions))
            }
            CalculatorResultDisplay(
                label: "Apgar",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 components, each 0–2.  Range 0–10.\nAssessed at 1 minute and 5 minutes (and every 5 minutes if low).",
                notes: "Low Apgar at 1 minute identifies infants needing assistance with adaptation; the 5-minute score has stronger correlation with outcome. Apgar is NOT a tool to determine asphyxia or to guide individual resuscitation — Neonatal Resuscitation Program (NRP) algorithms guide care.",
                citations: [apgarVirginia, openrnAssessment]
            )
        }
    }
}

// MARK: - FLACC

public struct FLACCCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "flacc", key: "face")          private var faceID
    @CalcPersistedOptionID(calculatorID: "flacc", key: "legs")          private var legsID
    @CalcPersistedOptionID(calculatorID: "flacc", key: "activity")      private var activityID
    @CalcPersistedOptionID(calculatorID: "flacc", key: "cry")           private var cryID
    @CalcPersistedOptionID(calculatorID: "flacc", key: "consolability") private var consolabilityID

    private var face:          CalculatorScoreRow.Option? { faceOptions.first          { $0.id == faceID } }
    private var legs:          CalculatorScoreRow.Option? { legsOptions.first          { $0.id == legsID } }
    private var activity:      CalculatorScoreRow.Option? { activityOptions.first      { $0.id == activityID } }
    private var cry:           CalculatorScoreRow.Option? { cryOptions.first           { $0.id == cryID } }
    private var consolability: CalculatorScoreRow.Option? { consolabilityOptions.first { $0.id == consolabilityID } }

    private let faceOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No expression / smile",                 score: 0),
        .init(id: 1, label: "Occasional grimace / withdrawn",        score: 1),
        .init(id: 2, label: "Frequent frown / clenched jaw / quivering chin", score: 2)
    ]
    private let legsOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Normal / relaxed",                      score: 0),
        .init(id: 1, label: "Uneasy / restless / tense",             score: 1),
        .init(id: 2, label: "Kicking / legs drawn up",               score: 2)
    ]
    private let activityOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Lying quietly / moves easily",          score: 0),
        .init(id: 1, label: "Squirming / shifting / tense",          score: 1),
        .init(id: 2, label: "Arched / rigid / jerking",              score: 2)
    ]
    private let cryOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No cry",                                 score: 0),
        .init(id: 1, label: "Moans or whimpers / occasional complaint", score: 1),
        .init(id: 2, label: "Crying steadily / screams / sobs",      score: 2)
    ]
    private let consolabilityOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Content / relaxed",                     score: 0),
        .init(id: 1, label: "Reassured by occasional touch / talking", score: 1),
        .init(id: 2, label: "Difficult to console / comfort",        score: 2)
    ]

    private var total: Int? {
        let parts = [face, legs, activity, cry, consolability]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 7 { return ("Severe pain / discomfort (7–10).", .alert) }
        if s >= 4 { return ("Moderate pain / discomfort (4–6).", .caution) }
        if s >= 1 { return ("Mild pain / discomfort (1–3).", .caution) }
        return ("Relaxed and comfortable.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "FLACC",
            subtitle: "Pain in non-verbal patients (Merkel 1997)"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorScoreRow(label: "Face",          options: faceOptions,          selection: $faceID.option(in: faceOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Legs",          options: legsOptions,          selection: $legsID.option(in: legsOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Activity",      options: activityOptions,      selection: $activityID.option(in: activityOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Cry",           options: cryOptions,           selection: $cryID.option(in: cryOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Consolability", options: consolabilityOptions, selection: $consolabilityID.option(in: consolabilityOptions))
            }
            CalculatorResultDisplay(
                label: "FLACC",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 observed-behavior components, each 0–2.  Range 0–10.",
                notes: "Designed for children 2 months to 7 years and other non-verbal patients (post-op, intubated, cognitive impairment). Not a substitute for self-report when the patient can self-report. Reassess after intervention to evaluate response.",
                citations: [flaccMerkel, openrnAssessment]
            )
        }
    }
}
