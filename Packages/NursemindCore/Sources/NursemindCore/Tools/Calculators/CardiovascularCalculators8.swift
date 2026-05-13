import SwiftUI

private let sgarbossa1996 = CitationSource(
    id: "sgarbossa_1996",
    shortName: "Sgarbossa Criteria — Sgarbossa EB et al., NEJM 1996 (concept citation)",
    detail: "ECG criteria for diagnosing acute myocardial infarction in patients with left bundle-branch block",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/8559200/",
    lastRetrieved: "2026-05-06"
)

private let smith2012ModSgarbossa = CitationSource(
    id: "smith_2012_mod_sgarbossa",
    shortName: "Modified Sgarbossa — Smith SW et al., Ann Emerg Med 2012 (concept citation)",
    detail: "Replaces the 'discordant ≥ 5 mm' criterion with ST/S ratio ≤ −0.25 to improve sensitivity",
    publisher: "Annals of Emergency Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/22939607/",
    lastRetrieved: "2026-05-06"
)

private let morrow2000TimiStemi = CitationSource(
    id: "morrow_2000_timi_stemi",
    shortName: "TIMI for STEMI — Morrow DA et al., Circulation 2000 (concept citation)",
    detail: "8-variable 30-day mortality risk score for ST-elevation MI (distinct from TIMI for UA/NSTEMI)",
    publisher: "Circulation",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/11023933/",
    lastRetrieved: "2026-05-06"
)

private let openrnCardio8 = CitationSource(
    id: "openrn_cardio_8",
    shortName: "Open RN Health Alterations — Acute Coronary Syndromes / ECG",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=acute+coronary+syndrome+ECG+LBBB",
    lastRetrieved: "2026-05-06"
)

// MARK: - Sgarbossa Criteria

public struct SgarbossaCalculatorView: View {
    @CalcPersistedBool(calculatorID: "sgarbossa", key: "concordantST")  private var concordantST       // +5
    @CalcPersistedBool(calculatorID: "sgarbossa", key: "concordantDep") private var concordantDep     // +3
    @CalcPersistedBool(calculatorID: "sgarbossa", key: "discordantST")  private var discordantST     // +2 (original)
    @CalcPersistedBool(calculatorID: "sgarbossa", key: "modifiedRatio") private var modifiedRatio     // Smith-modified

    private var total: Int {
        var t = 0
        if concordantST  { t += 5 }
        if concordantDep { t += 3 }
        if discordantST  { t += 2 }
        return t
    }

    private var positive: Bool { total >= 3 || modifiedRatio }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if positive {
            return ("POSITIVE — meets the published Sgarbossa 1996 (≥ 3 points) or Smith 2012 Modified (ST/S ≤ −0.25) criteria for acute MI in the presence of LBBB. Original Sgarbossa published specificity ≈ 90% with NPV-limited sensitivity; Modified Sgarbossa improved sensitivity in subsequent validation cohorts.", .alert)
        }
        return ("Does not meet the published Sgarbossa or Smith-Modified criteria at this assessment. Negative Sgarbossa does not rule out acute MI in LBBB — pair with serial troponin and clinical context.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "Sgarbossa",
            subtitle: "Acute MI in LBBB · ECG criteria"
        ) {
            CalculatorSection("ORIGINAL CRITERIA (1996)") {
                Toggle("Concordant ST elevation ≥ 1 mm in a lead with positive QRS (+5)", isOn: $concordantST).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Concordant ST depression ≥ 1 mm in V1, V2, or V3 (+3)",            isOn: $concordantDep).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Discordant ST elevation ≥ 5 mm in a lead with negative QRS (+2)",   isOn: $discordantST).toggleStyle(.switch)
            }
            CalculatorSection("SMITH-MODIFIED (2012)") {
                Toggle("ST/S ratio ≤ −0.25 in any lead with discordant ST elevation",       isOn: $modifiedRatio).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "Sgarbossa",
                value: positive ? "POSITIVE" : "NEGATIVE",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Original Sgarbossa: sum of 3 criteria. Score ≥ 3 = positive.\nModified Sgarbossa (Smith 2012): replace criterion 3 with ST/S ratio ≤ −0.25; any modified-positive lead = positive overall.",
                notes: "Apply only when LBBB or ventricular-paced rhythm is present. The same logic also applies to right ventricular-paced rhythms with similar published performance. Negative criteria do not rule out MI — institutions typically combine with troponin trend and clinical presentation.",
                citations: [sgarbossa1996, smith2012ModSgarbossa, openrnCardio8]
            )
        }
    }
}

// MARK: - TIMI for STEMI

public struct TIMISTEMICalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "timi-stemi", key: "ageBand") private var ageBandID
    @CalcPersistedBool(calculatorID: "timi-stemi", key: "dmHTNAngina") private var dmHTNAngina
    @CalcPersistedBool(calculatorID: "timi-stemi", key: "sbpUnder100") private var sbpUnder100
    @CalcPersistedBool(calculatorID: "timi-stemi", key: "hrOver100")   private var hrOver100
    @CalcPersistedBool(calculatorID: "timi-stemi", key: "killip2to4")  private var killip2to4
    @CalcPersistedBool(calculatorID: "timi-stemi", key: "weightUnder67") private var weightUnder67
    @CalcPersistedBool(calculatorID: "timi-stemi", key: "antLBBB")     private var antLBBB
    @CalcPersistedBool(calculatorID: "timi-stemi", key: "timeOver4h")  private var timeOver4h

    private var ageBand: CalculatorScoreRow.Option? { ageOpts.first { $0.id == ageBandID } }

    private let ageOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 65 years",  score: 0),
        .init(id: 1, label: "65–74 years", score: 2),
        .init(id: 2, label: "≥ 75 years",  score: 3)
    ]

    private var total: Int? {
        guard let a = ageBand else { return nil }
        var t = a.score
        if dmHTNAngina   { t += 1 }
        if sbpUnder100   { t += 3 }
        if hrOver100     { t += 2 }
        if killip2to4    { t += 2 }
        if weightUnder67 { t += 1 }
        if antLBBB       { t += 1 }
        if timeOver4h    { t += 1 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case 0:    return ("TIMI-STEMI 0 — published 30-day mortality ≈ 0.8% (Morrow 2000 derivation cohort).", .neutral)
        case 1:    return ("TIMI-STEMI 1 — published 30-day mortality ≈ 1.6%.", .neutral)
        case 2:    return ("TIMI-STEMI 2 — published 30-day mortality ≈ 2.2%.", .caution)
        case 3:    return ("TIMI-STEMI 3 — published 30-day mortality ≈ 4.4%.", .caution)
        case 4:    return ("TIMI-STEMI 4 — published 30-day mortality ≈ 7.3%.", .alert)
        case 5:    return ("TIMI-STEMI 5 — published 30-day mortality ≈ 12.4%.", .alert)
        case 6:    return ("TIMI-STEMI 6 — published 30-day mortality ≈ 16.1%.", .alert)
        case 7:    return ("TIMI-STEMI 7 — published 30-day mortality ≈ 23.4%.", .alert)
        case 8:    return ("TIMI-STEMI 8 — published 30-day mortality ≈ 26.8%.", .alert)
        default:   return ("TIMI-STEMI ≥ 9 — published 30-day mortality ≈ 35.9%.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "TIMI for STEMI",
            subtitle: "30-day mortality after STEMI"
        ) {
            CalculatorSection("DEMOGRAPHICS") {
                CalculatorScoreRow(label: "Age", options: ageOpts, selection: $ageBandID.option(in: ageOpts))
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of diabetes, hypertension, or angina (+1)", isOn: $dmHTNAngina).toggleStyle(.switch)
            }
            CalculatorSection("CLINICAL") {
                Toggle("Systolic BP < 100 mmHg (+3)",                   isOn: $sbpUnder100).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Heart rate > 100 bpm (+2)",                     isOn: $hrOver100).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Killip class II–IV (+2)",                       isOn: $killip2to4).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Weight < 67 kg (+1)",                            isOn: $weightUnder67).toggleStyle(.switch)
            }
            CalculatorSection("ECG · TIMING") {
                Toggle("Anterior MI on ECG OR LBBB (+1)",               isOn: $antLBBB).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Time to treatment > 4 hours (+1)",               isOn: $timeOver4h).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "TIMI-STEMI",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 8 weighted criteria. Range 0–14.\nDistinct from the TIMI score for UA/NSTEMI (which uses 7 different binary criteria).",
                notes: "Derived from InTIME-II fibrinolytic-era data; remains a useful bedside risk stratifier for STEMI even in the primary-PCI era. Pair with GRACE for combined ACS-mortality assessment, and with Killip class for clinical severity at presentation.",
                citations: [morrow2000TimiStemi, openrnCardio8]
            )
        }
    }
}
