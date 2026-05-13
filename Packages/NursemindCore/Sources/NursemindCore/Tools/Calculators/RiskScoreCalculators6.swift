import SwiftUI

// MARK: - Shared citation sources

private let johnston2007Abcd2 = CitationSource(
    id: "johnston_2007_abcd2",
    shortName: "ABCD² — Johnston SC et al., Lancet 2007 (concept citation)",
    detail: "Stroke risk after TIA, derived and validated in pooled cohorts",
    publisher: "The Lancet",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/17258668/",
    lastRetrieved: "2026-05-04"
)

private let bush1998AuditC = CitationSource(
    id: "bush_1998_audit_c",
    shortName: "AUDIT-C — Bush K et al., Arch Intern Med 1998 (concept citation)",
    detail: "3-item screen derived from WHO AUDIT for hazardous alcohol use in primary care",
    publisher: "Archives of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/9738608/",
    lastRetrieved: "2026-05-04"
)

private let aldrete1995 = CitationSource(
    id: "aldrete_1995",
    shortName: "Aldrete Score — Aldrete JA, J Clin Anesth 1995 (concept citation)",
    detail: "Modified post-anesthetic recovery score (originally 1970) for PACU discharge readiness",
    publisher: "Journal of Clinical Anesthesia",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/7669313/",
    lastRetrieved: "2026-05-04"
)

private let karnofsky1948 = CitationSource(
    id: "karnofsky_1948",
    shortName: "Karnofsky Performance Status — Karnofsky DA, Burchenal JH 1948 (concept citation)",
    detail: "0–100% global functional status scale used in oncology and palliative care",
    publisher: "Evaluation of Chemotherapeutic Agents (Columbia Univ Press)",
    license: .factCitationOnly,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK321113/",
    lastRetrieved: "2026-05-04"
)

private let oken1982Ecog = CitationSource(
    id: "oken_1982_ecog",
    shortName: "ECOG Performance Status — Oken MM et al., Am J Clin Oncol 1982 (concept citation)",
    detail: "0–5 functional status scale published as the ECOG/Zubrod scale",
    publisher: "American Journal of Clinical Oncology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/7165009/",
    lastRetrieved: "2026-05-04"
)

private let brennan2018GcsP = CitationSource(
    id: "brennan_2018_gcs_p",
    shortName: "GCS-Pupils — Brennan PM, Murray GD, Teasdale GM, J Neurosurg 2018 (concept citation)",
    detail: "Combines Glasgow Coma Scale with pupil-reactivity score for traumatic brain injury",
    publisher: "Journal of Neurosurgery",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/29303451/",
    lastRetrieved: "2026-05-04"
)

private let openrnRisk6 = CitationSource(
    id: "openrn_risk_6",
    shortName: "Open RN Health Alterations & Mental Health — Performance, Stroke, Recovery",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=stroke+pacu+performance+alcohol",
    lastRetrieved: "2026-05-04"
)

// MARK: - ABCD²

public struct ABCD2CalculatorView: View {
    @CalcPersistedBool(calculatorID: "abcd2", key: "ageGE60") private var ageGE60
    @CalcPersistedBool(calculatorID: "abcd2", key: "bp")      private var bp
    @CalcPersistedOptionID(calculatorID: "abcd2", key: "clinical") private var clinicalID
    @CalcPersistedOptionID(calculatorID: "abcd2", key: "duration") private var durationID

    private var clinical: CalculatorScoreRow.Option? { clinicalOptions.first { $0.id == clinicalID } }
    private var duration: CalculatorScoreRow.Option? { durationOptions.first { $0.id == durationID } }
    @CalcPersistedBool(calculatorID: "abcd2", key: "diabetes") private var diabetes

    private let clinicalOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Other symptoms",                     score: 0),
        .init(id: 1, label: "Speech disturbance, no weakness",    score: 1),
        .init(id: 2, label: "Unilateral weakness",                score: 2)
    ]
    private let durationOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 10 minutes",     score: 0),
        .init(id: 1, label: "10–59 minutes",    score: 1),
        .init(id: 2, label: "≥ 60 minutes",     score: 2)
    ]

    private var total: Int? {
        guard let c = clinical, let d = duration else { return nil }
        var t = c.score + d.score
        if ageGE60 { t += 1 }
        if bp      { t += 1 }
        if diabetes { t += 1 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 6 { return ("ABCD² 6–7 — high risk; published 2-day stroke risk ≈ 8.1% (Johnston 2007 pooled cohort).", .alert) }
        if s >= 4 { return ("ABCD² 4–5 — moderate risk; published 2-day stroke risk ≈ 4.1%.", .caution) }
        return ("ABCD² 0–3 — low risk; published 2-day stroke risk ≈ 1.0%.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "ABCD²",
            subtitle: "Stroke risk after TIA · 2-day"
        ) {
            CalculatorSection("CRITERIA") {
                Toggle("Age ≥ 60",                          isOn: $ageGE60).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("BP ≥ 140/90 at presentation",       isOn: $bp).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Clinical features", options: clinicalOptions, selection: $clinicalID.option(in: clinicalOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Duration",          options: durationOptions, selection: $durationID.option(in: durationOptions))
                Hairline(color: NMColor.borderSubtle)
                Toggle("Diabetes",                          isOn: $diabetes).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "ABCD²",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 weighted criteria. Range 0–7.\nLow: 0–3  ·  Moderate: 4–5  ·  High: 6–7.",
                notes: "ABCD² estimates short-term stroke risk after a transient ischemic attack. It is one input among several — consider neuroimaging findings, large-vessel disease, atrial fibrillation, and recurrence patterns when stratifying TIA workups.",
                citations: [johnston2007Abcd2, openrnRisk6]
            )
        }
    }
}

// MARK: - AUDIT-C

public struct AUDITCCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "audit-c", key: "freq")   private var freqID
    @CalcPersistedOptionID(calculatorID: "audit-c", key: "amount") private var amountID
    @CalcPersistedOptionID(calculatorID: "audit-c", key: "binge")  private var bingeID

    private var freq:   CalculatorScoreRow.Option? { freqOptions.first   { $0.id == freqID } }
    private var amount: CalculatorScoreRow.Option? { amountOptions.first { $0.id == amountID } }
    private var binge:  CalculatorScoreRow.Option? { bingeOptions.first  { $0.id == bingeID } }
    @CalcPersistedBool(calculatorID: "audit-c", key: "maleSex") private var maleSex

    private let freqOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Never",              score: 0),
        .init(id: 1, label: "Monthly or less",    score: 1),
        .init(id: 2, label: "2–4 times / month",  score: 2),
        .init(id: 3, label: "2–3 times / week",   score: 3),
        .init(id: 4, label: "≥ 4 times / week",   score: 4)
    ]
    private let amountOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "1 or 2 drinks",     score: 0),
        .init(id: 1, label: "3 or 4 drinks",     score: 1),
        .init(id: 2, label: "5 or 6 drinks",     score: 2),
        .init(id: 3, label: "7 to 9 drinks",     score: 3),
        .init(id: 4, label: "10 or more drinks", score: 4)
    ]
    private let bingeOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Never",                 score: 0),
        .init(id: 1, label: "Less than monthly",     score: 1),
        .init(id: 2, label: "Monthly",               score: 2),
        .init(id: 3, label: "Weekly",                score: 3),
        .init(id: 4, label: "Daily or almost daily", score: 4)
    ]

    private var total: Int? {
        guard let f = freq, let a = amount, let b = binge else { return nil }
        return f.score + a.score + b.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        let cutoff = maleSex ? 4 : 3
        if s >= cutoff {
            return ("AUDIT-C ≥ \(cutoff) — positive screen for hazardous drinking in \(maleSex ? "men" : "women") per Bush 1998 cutoff. Sensitivity ≈ 86–95% for past-year alcohol misuse in primary-care validation.", .caution)
        }
        return ("AUDIT-C < \(cutoff) — negative screen at the published \(maleSex ? "male" : "female") cutoff.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "AUDIT-C",
            subtitle: "3-item alcohol use screen"
        ) {
            CalculatorSection("QUESTIONS") {
                CalculatorScoreRow(label: "How often do you drink?",                  options: freqOptions,   selection: $freqID.option(in: freqOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Drinks per typical drinking day",          options: amountOptions, selection: $amountID.option(in: amountOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "How often ≥ 6 drinks at one time?",        options: bingeOptions,  selection: $bingeID.option(in: bingeOptions))
                Hairline(color: NMColor.borderSubtle)
                Toggle("Patient is male (cutoff differs by sex)",                     isOn: $maleSex).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "AUDIT-C",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 3 questions, each 0–4. Range 0–12.\nPositive cutoff: ≥ 3 (women)  ·  ≥ 4 (men).",
                notes: "AUDIT-C is the 3-question short form of the WHO AUDIT, validated for screening hazardous and harmful alcohol use in primary care. A 'standard drink' in U.S. validation studies = 14 g ethanol (12 oz beer / 5 oz wine / 1.5 oz spirits). Positive screen warrants a brief intervention conversation; alcohol-use disorder diagnosis requires DSM criteria, not AUDIT-C alone.",
                citations: [bush1998AuditC, openrnRisk6]
            )
        }
    }
}

// MARK: - Aldrete

public struct AldreteScoreCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "aldrete", key: "activity")      private var activityID
    @CalcPersistedOptionID(calculatorID: "aldrete", key: "respiration")   private var respirationID
    @CalcPersistedOptionID(calculatorID: "aldrete", key: "circulation")   private var circulationID
    @CalcPersistedOptionID(calculatorID: "aldrete", key: "consciousness") private var consciousnessID
    @CalcPersistedOptionID(calculatorID: "aldrete", key: "saturation")    private var saturationID

    private var activity:      CalculatorScoreRow.Option? { activityOptions.first      { $0.id == activityID } }
    private var respiration:   CalculatorScoreRow.Option? { respirationOptions.first   { $0.id == respirationID } }
    private var circulation:   CalculatorScoreRow.Option? { circulationOptions.first   { $0.id == circulationID } }
    private var consciousness: CalculatorScoreRow.Option? { consciousnessOptions.first { $0.id == consciousnessID } }
    private var saturation:    CalculatorScoreRow.Option? { saturationOptions.first    { $0.id == saturationID } }

    private let activityOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Unable to move limbs voluntarily",                       score: 0),
        .init(id: 1, label: "Able to move 2 extremities voluntarily / on command",    score: 1),
        .init(id: 2, label: "Able to move 4 extremities voluntarily / on command",    score: 2)
    ]
    private let respirationOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Apneic",                                                  score: 0),
        .init(id: 1, label: "Dyspnea / shallow / limited breathing",                  score: 1),
        .init(id: 2, label: "Able to breathe deeply and cough freely",                score: 2)
    ]
    private let circulationOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "BP ± 50% of pre-anesthetic baseline",                    score: 0),
        .init(id: 1, label: "BP ± 20–49% of pre-anesthetic baseline",                 score: 1),
        .init(id: 2, label: "BP ± < 20% of pre-anesthetic baseline",                  score: 2)
    ]
    private let consciousnessOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Not responsive",                                          score: 0),
        .init(id: 1, label: "Responsive on calling",                                   score: 1),
        .init(id: 2, label: "Fully awake",                                             score: 2)
    ]
    private let saturationOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "SpO₂ < 90% even with O₂",                                 score: 0),
        .init(id: 1, label: "SpO₂ ≥ 90% with supplemental O₂",                         score: 1),
        .init(id: 2, label: "SpO₂ ≥ 92% on room air",                                  score: 2)
    ]

    private var total: Int? {
        guard let a = activity, let r = respiration, let c = circulation,
              let n = consciousness, let s = saturation else { return nil }
        return a.score + r.score + c.score + n.score + s.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 9 { return ("Aldrete ≥ 9 — meets the published threshold for PACU discharge readiness in most protocols.", .neutral) }
        if s >= 7 { return ("Aldrete 7–8 — does not meet the published ≥ 9 threshold; continue PACU monitoring.", .caution) }
        return ("Aldrete ≤ 6 — substantial recovery still required.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Aldrete",
            subtitle: "Post-anesthesia recovery readiness"
        ) {
            CalculatorSection("CRITERIA") {
                CalculatorScoreRow(label: "Activity",       options: activityOptions,      selection: $activityID.option(in: activityOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Respiration",    options: respirationOptions,   selection: $respirationID.option(in: respirationOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Circulation",    options: circulationOptions,   selection: $circulationID.option(in: circulationOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Consciousness",  options: consciousnessOptions, selection: $consciousnessID.option(in: consciousnessOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "O₂ saturation",  options: saturationOptions,    selection: $saturationID.option(in: saturationOptions))
            }
            CalculatorResultDisplay(
                label: "Aldrete",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 criteria, each 0–2. Range 0–10.\nMost institutions use ≥ 9 as the discharge-ready threshold (Aldrete 1995 modified scoring).",
                notes: "Modified Aldrete adds SpO₂ to the original 1970 4-item score. Many ambulatory surgery centers use a separate Post-Anesthesia Discharge Score (PADS) for home-readiness, which adds pain, vomiting, ambulation, and surgical-site bleeding criteria.",
                citations: [aldrete1995, openrnRisk6]
            )
        }
    }
}

// MARK: - Karnofsky Performance Status

public struct KarnofskyCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "karnofsky", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 100, label: "100 · Normal, no complaints, no evidence of disease",       score: 100),
        .init(id: 90,  label: "90 · Able to carry on normal activity; minor symptoms",      score: 90),
        .init(id: 80,  label: "80 · Normal activity with effort; some symptoms",            score: 80),
        .init(id: 70,  label: "70 · Cares for self; unable to carry on normal activity",    score: 70),
        .init(id: 60,  label: "60 · Requires occasional assistance; cares for most needs",  score: 60),
        .init(id: 50,  label: "50 · Requires considerable assistance and frequent care",    score: 50),
        .init(id: 40,  label: "40 · Disabled; requires special care and assistance",        score: 40),
        .init(id: 30,  label: "30 · Severely disabled; hospitalization indicated",          score: 30),
        .init(id: 20,  label: "20 · Very sick; hospitalization and active supportive care", score: 20),
        .init(id: 10,  label: "10 · Moribund; fatal processes progressing rapidly",         score: 10),
        .init(id: 0,   label: "0 · Dead",                                                   score: 0)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 80...100: return ("KPS 80–100 — able to carry on normal activity. Reference baseline for active treatment eligibility in many oncology trials.", .neutral)
        case 50...79:  return ("KPS 50–79 — unable to work; cares for most personal needs at the higher end of this band, requires assistance at the lower end.", .caution)
        case 10...49:  return ("KPS 10–49 — unable to care for self; requires institutional or hospital-equivalent care. Lower end of the scale aligns with hospice eligibility per published prognostic literature.", .alert)
        default:       return ("KPS = 0 — death.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Karnofsky",
            subtitle: "Performance status · 0–100%"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Level", options: levelOptions, selection: $levelID.option(in: levelOptions))
            }
            CalculatorResultDisplay(
                label: "KPS",
                value: level.map { "\($0.score)%" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 11-level functional scale: 100% (no impairment) → 0% (death), in 10-point increments.",
                notes: "Originally developed for chemotherapy candidacy in advanced cancer; widely used today in oncology, palliative care, and hospice eligibility frameworks. ECOG (0–5) is a coarser modern equivalent. Both should be assigned by the clinician most familiar with the patient's day-to-day function — not from chart review alone.",
                citations: [karnofsky1948, openrnRisk6]
            )
        }
    }
}

// MARK: - ECOG Performance Status

public struct ECOGCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "ecog", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOptions.first { $0.id == levelID } }

    private let levelOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Fully active; able to carry on all pre-disease activity",                 score: 0),
        .init(id: 1, label: "1 · Restricted in strenuous activity; ambulatory; able to do light work",      score: 1),
        .init(id: 2, label: "2 · Ambulatory and self-care; up > 50% of waking hours; no work",              score: 2),
        .init(id: 3, label: "3 · Capable of only limited self-care; in bed > 50% of waking hours",          score: 3),
        .init(id: 4, label: "4 · Completely disabled; cannot carry on self-care; bed/chair-bound",          score: 4),
        .init(id: 5, label: "5 · Dead",                                                                     score: 5)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 0...1: return ("ECOG 0–1 — fully active or restricted to light activity. Most oncology trials use this band as the eligibility threshold for cytotoxic chemotherapy.", .neutral)
        case 2:     return ("ECOG 2 — ambulatory and self-care but unable to work; up > 50% of waking hours. Borderline for many trial inclusions.", .caution)
        case 3:     return ("ECOG 3 — limited self-care; in bed > 50% of waking hours. Substantial functional limitation.", .alert)
        case 4:     return ("ECOG 4 — completely disabled; bed- or chair-bound.", .alert)
        default:    return ("ECOG = 5 — death.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "ECOG",
            subtitle: "Performance status · 0–5"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Level", options: levelOptions, selection: $levelID.option(in: levelOptions))
            }
            CalculatorResultDisplay(
                label: "ECOG",
                value: level.map { "\($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 6-level functional scale: 0 (fully active) → 5 (dead).\nAlso known as the WHO/Zubrod performance status.",
                notes: "Coarser than the Karnofsky 0–100% scale but easier to assign at the bedside. Used widely as an eligibility criterion in oncology trials and as a prognostic input across solid tumors. Reflects current functional capacity, not pre-illness baseline.",
                citations: [oken1982Ecog, openrnRisk6]
            )
        }
    }
}

// MARK: - GCS-Pupils

public struct GCSPupilsCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "gcs-pupils", key: "gcs") private var gcsTotal
    @CalcPersistedOptionID(calculatorID: "gcs-pupils", key: "pupilScore") private var pupilScoreID
    private var pupilScore: CalculatorScoreRow.Option? { pupilOptions.first { $0.id == pupilScoreID } }

    private let pupilOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Both pupils reactive to light",     score: 0),
        .init(id: 1, label: "One pupil unreactive to light",     score: 1),
        .init(id: 2, label: "Both pupils unreactive to light",   score: 2)
    ]

    private var gcsP: Int? {
        guard let g = gcsTotal, let p = pupilScore else { return nil }
        let gInt = Int(g.rounded())
        let raw = gInt - p.score
        return max(raw, 1)   // GCS-P floored at 1 per Brennan 2018
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = gcsP else { return nil }
        if s <= 3  { return ("GCS-P 1–3 — corresponds to the most severe TBI strata; published 6-month mortality > 70% in IMPACT/CRASH-derivation cohorts at the lower end.", .alert) }
        if s <= 8  { return ("GCS-P 4–8 — severe TBI band per Brennan 2018; mortality and unfavorable-outcome rates rise steeply in this range versus GCS alone.", .alert) }
        if s <= 12 { return ("GCS-P 9–12 — moderate TBI band.", .caution) }
        return ("GCS-P 13–15 — mild TBI band.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "GCS-Pupils",
            subtitle: "GCS adjusted for pupil reactivity"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Total GCS (3–15)", value: $gcsTotal)
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Pupil reactivity score", options: pupilOptions, selection: $pupilScoreID.option(in: pupilOptions))
            }
            CalculatorResultDisplay(
                label: "GCS-P",
                value: gcsP.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "GCS-P = GCS − Pupil Reactivity Score (PRS)\nPRS = 0 (both reactive)  ·  1 (one unreactive)  ·  2 (both unreactive)\nResult floored at 1; range 1–15.",
                notes: "Adds prognostic information from non-reactive pupils to the standard GCS. Brennan 2018 showed GCS-P discriminates outcome better than GCS alone in TBI cohorts. Use the standard GCS calculator first, then enter the total here along with pupil reactivity.",
                citations: [brennan2018GcsP, openrnRisk6]
            )
        }
    }
}
