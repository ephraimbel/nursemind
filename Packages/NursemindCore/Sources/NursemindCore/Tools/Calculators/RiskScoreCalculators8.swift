import SwiftUI

private let vanWalraven2010Lace = CitationSource(
    id: "van_walraven_2010_lace",
    shortName: "LACE Index — van Walraven C et al., CMAJ 2010 (concept citation)",
    detail: "4-variable bedside index of 30-day readmission and death after hospital discharge",
    publisher: "Canadian Medical Association Journal",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/20308747/",
    lastRetrieved: "2026-05-04"
)

private let anderson1996Pps = CitationSource(
    id: "anderson_1996_pps",
    shortName: "Palliative Performance Scale — Anderson F et al., J Palliat Care 1996 (concept citation)",
    detail: "11-level functional scale (0–100% in 10% steps) used in hospice and palliative care",
    publisher: "Journal of Palliative Care",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/8857241/",
    lastRetrieved: "2026-05-04"
)

private let openrnRisk8 = CitationSource(
    id: "openrn_risk_8",
    shortName: "Open RN Health Alterations — Transitions of Care / Palliative",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=transitions+palliative+hospice",
    lastRetrieved: "2026-05-04"
)

// MARK: - LACE Index

public struct LACEIndexCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "lace", key: "los")      private var losID
    @CalcPersistedBool(calculatorID: "lace", key: "acute") private var acute
    @CalcPersistedOptionID(calculatorID: "lace", key: "charlson") private var charlsonID
    @CalcPersistedOptionID(calculatorID: "lace", key: "edVisits") private var edVisitsID

    private var los:      CalculatorScoreRow.Option? { losOpts.first      { $0.id == losID } }
    private var charlson: CalculatorScoreRow.Option? { charlsonOpts.first { $0.id == charlsonID } }
    private var edVisits: CalculatorScoreRow.Option? { edOpts.first       { $0.id == edVisitsID } }

    private let losOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "1 day",         score: 1),
        .init(id: 1, label: "2 days",        score: 2),
        .init(id: 2, label: "3 days",        score: 3),
        .init(id: 3, label: "4–6 days",      score: 4),
        .init(id: 4, label: "7–13 days",     score: 5),
        .init(id: 5, label: "≥ 14 days",     score: 7)
    ]
    private let charlsonOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Charlson 0",       score: 0),
        .init(id: 1, label: "Charlson 1",       score: 1),
        .init(id: 2, label: "Charlson 2",       score: 2),
        .init(id: 3, label: "Charlson 3",       score: 3),
        .init(id: 4, label: "Charlson ≥ 4",     score: 5)
    ]
    private let edOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 ED visits in past 6 months", score: 0),
        .init(id: 1, label: "1 ED visit",                   score: 1),
        .init(id: 2, label: "2 ED visits",                  score: 2),
        .init(id: 3, label: "3 ED visits",                  score: 3),
        .init(id: 4, label: "≥ 4 ED visits",                score: 4)
    ]

    private var total: Int? {
        guard let l = los, let c = charlson, let e = edVisits else { return nil }
        var t = l.score + c.score + e.score
        if acute { t += 3 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 10 { return ("LACE ≥ 10 — high risk for 30-day readmission or death (van Walraven 2010 derivation cohort).", .alert) }
        if s >= 5  { return ("LACE 5–9 — moderate risk for 30-day readmission or death.", .caution) }
        return ("LACE 0–4 — low risk per published cutoff.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "LACE",
            subtitle: "30-day readmission / death risk"
        ) {
            CalculatorSection("L · LENGTH OF STAY") {
                CalculatorScoreRow(label: "Length of stay", options: losOpts, selection: $losID.option(in: losOpts))
            }
            CalculatorSection("A · ACUITY OF ADMISSION") {
                Toggle("Admitted via the emergency department", isOn: $acute).toggleStyle(.switch)
            }
            CalculatorSection("C · COMORBIDITY") {
                CalculatorScoreRow(label: "Charlson sum", options: charlsonOpts, selection: $charlsonID.option(in: charlsonOpts))
            }
            CalculatorSection("E · ED USE") {
                CalculatorScoreRow(label: "ED visits in 6 months prior to admission", options: edOpts, selection: $edVisitsID.option(in: edOpts))
            }
            CalculatorResultDisplay(
                label: "LACE",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "L (1–7) + A (0 or 3) + C (0–5) + E (0–4). Range 0–19.\nLow ≤ 4  ·  Moderate 5–9  ·  High ≥ 10.",
                notes: "Designed for general medical and surgical adult inpatients — not validated in obstetric or psychiatric admissions. Use the Charlson Comorbidity Index from this calculator set as the C component. Intended to inform discharge-planning resource allocation, not as a sole readmission-prediction tool.",
                citations: [vanWalraven2010Lace, openrnRisk8]
            )
        }
    }
}

// MARK: - Palliative Performance Scale

public struct PPSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "pps", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levelOpts.first { $0.id == levelID } }

    private let levelOpts: [CalculatorScoreRow.Option] = [
        .init(id: 100, label: "100% · Full ambulation, normal activity, no evidence of disease", score: 100),
        .init(id: 90,  label: "90% · Full ambulation, normal activity, some evidence of disease", score: 90),
        .init(id: 80,  label: "80% · Full ambulation, normal activity with effort, some disease", score: 80),
        .init(id: 70,  label: "70% · Reduced ambulation, unable to do normal job/work",           score: 70),
        .init(id: 60,  label: "60% · Reduced ambulation, unable to do hobby/housework, occasional assistance", score: 60),
        .init(id: 50,  label: "50% · Mainly sit/lie, unable to do any work, considerable assistance", score: 50),
        .init(id: 40,  label: "40% · Mainly in bed, unable to do most activity, mainly assistance", score: 40),
        .init(id: 30,  label: "30% · Totally bed bound, unable to do any activity, total care",   score: 30),
        .init(id: 20,  label: "20% · Bed bound, total care, minimal-to-sips intake",              score: 20),
        .init(id: 10,  label: "10% · Bed bound, total care, mouth care only",                     score: 10),
        .init(id: 0,   label: "0% · Death",                                                       score: 0)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 70...100: return ("PPS 70–100% — preserved ambulation and self-care; published 6-month survival in palliative cohorts trends high in this band.", .neutral)
        case 40...60:  return ("PPS 40–60% — substantial functional decline. Median survival in palliative cohorts is measured in weeks-to-months.", .caution)
        case 10...30:  return ("PPS 10–30% — bed-bound with total care. Published median survival in hospice cohorts is days-to-short weeks at the lower end.", .alert)
        default:       return ("PPS = 0% — death.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Palliative Performance",
            subtitle: "PPS · hospice-eligibility framework"
        ) {
            CalculatorSection("ASSESSMENT") {
                CalculatorScoreRow(label: "Best descriptor", options: levelOpts, selection: $levelID.option(in: levelOpts))
            }
            CalculatorResultDisplay(
                label: "PPS",
                value: level.map { "\($0.score)%" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 11-level functional scale (0–100% in 10% increments).\nIntegrates ambulation, activity / disease burden, self-care, intake, and consciousness into a single descriptor; pick the row that best matches the patient overall.",
                notes: "Widely used in hospice and palliative care for prognosis estimation, eligibility determination, and shared decision-making. PPS at admission is a stronger predictor of survival than diagnosis in many palliative cohorts. Like Karnofsky/ECOG, the rating should be assigned by the clinician most familiar with the patient's day-to-day function.",
                citations: [anderson1996Pps, openrnRisk8]
            )
        }
    }
}
