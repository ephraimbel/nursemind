import SwiftUI

private let aujesky2005Pesi = CitationSource(
    id: "aujesky_2005_pesi",
    shortName: "PESI — Aujesky D et al., Arch Intern Med 2005 (concept citation)",
    detail: "Pulmonary Embolism Severity Index — 11-variable predictor of 30-day mortality after acute PE",
    publisher: "Archives of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/16009862/",
    lastRetrieved: "2026-05-04"
)

private let jimenez2010Spesi = CitationSource(
    id: "jimenez_2010_spesi",
    shortName: "Simplified PESI (sPESI) — Jiménez D et al., Arch Intern Med 2010 (concept citation)",
    detail: "6-variable simplified PESI; ≥ 1 point identifies non-low-risk patients",
    publisher: "Archives of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/20696966/",
    lastRetrieved: "2026-05-04"
)

private let mahler1984Mmrc = CitationSource(
    id: "mahler_1984_mmrc",
    shortName: "Modified MRC dyspnea scale — Mahler DA et al., Chest 1984 (concept citation)",
    detail: "5-grade self-reported dyspnea scale used in COPD management and the BODE index",
    publisher: "Chest",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/6723384/",
    lastRetrieved: "2026-05-04"
)

private let openrnResp6 = CitationSource(
    id: "openrn_resp_6",
    shortName: "Open RN Health Alterations — Pulmonary Embolism / Dyspnea Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=pulmonary+embolism+dyspnea",
    lastRetrieved: "2026-05-04"
)

// MARK: - PESI

public struct PESICalculatorView: View {
    @CalcPersistedDouble(calculatorID: "pesi", key: "age") private var age
    @CalcPersistedBool(calculatorID: "pesi", key: "male")    private var male
    @CalcPersistedBool(calculatorID: "pesi", key: "cancer")  private var cancer
    @CalcPersistedBool(calculatorID: "pesi", key: "hf")      private var hf
    @CalcPersistedBool(calculatorID: "pesi", key: "lung")    private var lung
    @CalcPersistedBool(calculatorID: "pesi", key: "hr110")   private var hr110
    @CalcPersistedBool(calculatorID: "pesi", key: "sbp100")  private var sbp100
    @CalcPersistedBool(calculatorID: "pesi", key: "rr30")    private var rr30
    @CalcPersistedBool(calculatorID: "pesi", key: "temp36")  private var temp36
    @CalcPersistedBool(calculatorID: "pesi", key: "ams")     private var ams
    @CalcPersistedBool(calculatorID: "pesi", key: "sat90")   private var sat90

    private var total: Int? {
        guard let a = age else { return nil }
        var t = Int(a.rounded())
        if male    { t += 10 }
        if cancer  { t += 30 }
        if hf      { t += 10 }
        if lung    { t += 10 }
        if hr110   { t += 20 }
        if sbp100  { t += 30 }
        if rr30    { t += 20 }
        if temp36  { t += 20 }
        if ams     { t += 60 }
        if sat90   { t += 20 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s > 125 { return ("Class V (> 125) — published 30-day mortality 10.0–24.5%.", .alert) }
        if s > 105 { return ("Class IV (106–125) — published 30-day mortality 4.0–11.4%.", .alert) }
        if s > 85  { return ("Class III (86–105) — published 30-day mortality 3.2–7.1%.", .caution) }
        if s > 65  { return ("Class II (66–85) — published 30-day mortality 1.7–3.5%.", .caution) }
        return ("Class I (≤ 65) — published 30-day mortality 0–1.6% (Aujesky 2005 derivation cohort).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "PESI",
            subtitle: "Pulmonary Embolism Severity Index"
        ) {
            CalculatorSection("DEMOGRAPHICS") {
                CalculatorNumberField(label: "Age",            unit: "years", value: $age)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Male sex (+10)",                       isOn: $male).toggleStyle(.switch)
            }
            CalculatorSection("HISTORY") {
                Toggle("History of cancer (+30)",              isOn: $cancer).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of heart failure (+10)",       isOn: $hf).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of chronic lung disease (+10)", isOn: $lung).toggleStyle(.switch)
            }
            CalculatorSection("CLINICAL") {
                Toggle("Pulse ≥ 110 (+20)",                    isOn: $hr110).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Systolic BP < 100 (+30)",              isOn: $sbp100).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Respiratory rate ≥ 30 (+20)",          isOn: $rr30).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Temperature < 36 °C (+20)",            isOn: $temp36).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Altered mental status (+60)",           isOn: $ams).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Arterial O₂ saturation < 90% (+20)",   isOn: $sat90).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "PESI",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Score = age (years) + sum of weighted criteria.\nClass I ≤ 65  ·  II 66–85  ·  III 86–105  ·  IV 106–125  ·  V > 125.",
                notes: "Calculated at PE diagnosis using initial vital signs and exam. Class I/II identifies low-risk patients potentially eligible for outpatient treatment in selected institutions per ESC 2019 PE guidelines, but the score does not by itself authorize disposition. The simplified sPESI is faster at the bedside and equally validated for the low-risk binary decision.",
                citations: [aujesky2005Pesi, openrnResp6]
            )
        }
    }
}

// MARK: - sPESI

public struct SPESICalculatorView: View {
    @CalcPersistedBool(calculatorID: "spesi", key: "age80")      private var age80
    @CalcPersistedBool(calculatorID: "spesi", key: "cancer")     private var cancer
    @CalcPersistedBool(calculatorID: "spesi", key: "cardiopulm") private var cardiopulm
    @CalcPersistedBool(calculatorID: "spesi", key: "hr110")      private var hr110
    @CalcPersistedBool(calculatorID: "spesi", key: "sbp100")     private var sbp100
    @CalcPersistedBool(calculatorID: "spesi", key: "sat90")      private var sat90

    private var total: Int {
        [age80, cancer, cardiopulm, hr110, sbp100, sat90].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total == 0 {
            return ("sPESI = 0 — low-risk band; published 30-day mortality ≈ 1.0% (Jiménez 2010 derivation cohort).", .neutral)
        }
        return ("sPESI ≥ 1 — non-low-risk band; published 30-day mortality ≈ 10.9%.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "sPESI",
            subtitle: "Simplified PE Severity Index"
        ) {
            CalculatorSection("CRITERIA") {
                Toggle("Age > 80",                                    isOn: $age80).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of cancer",                            isOn: $cancer).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Chronic cardiopulmonary disease",             isOn: $cardiopulm).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Pulse ≥ 110",                                  isOn: $hr110).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Systolic BP < 100",                            isOn: $sbp100).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Arterial O₂ saturation < 90%",                 isOn: $sat90).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "sPESI",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 6 binary criteria. Range 0–6.\nLow risk = 0  ·  Non-low risk = ≥ 1.",
                notes: "sPESI is the bedside-friendly version of PESI — same intent, simpler arithmetic, equivalent low-risk discrimination. ESC 2019 PE guidelines endorse either PESI or sPESI for risk stratification.",
                citations: [jimenez2010Spesi, openrnResp6]
            )
        }
    }
}

// MARK: - mMRC dyspnea

public struct MMRCCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "mmrc", key: "grade") private var gradeID
    private var grade: CalculatorScoreRow.Option? { gradeOpts.first { $0.id == gradeID } }

    private let gradeOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0 · Breathless only with strenuous exercise",                                                  score: 0),
        .init(id: 1, label: "1 · Short of breath hurrying on the level or up a slight hill",                                score: 1),
        .init(id: 2, label: "2 · Walks slower than peers, or has to stop for breath at own pace",                           score: 2),
        .init(id: 3, label: "3 · Stops for breath after ~100 m or after a few minutes on level ground",                     score: 3),
        .init(id: 4, label: "4 · Too breathless to leave house OR breathless dressing/undressing",                          score: 4)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let g = grade else { return nil }
        switch g.score {
        case 0...1: return ("mMRC 0–1 — low symptom burden in COPD severity grading (GOLD 2024 'A/B' branch combined with exacerbation history).", .neutral)
        case 2:     return ("mMRC ≥ 2 — high symptom burden per GOLD 2024 cutoff; this is the threshold that pushes COPD assessment from 'A' to 'B' or 'C' to 'E' depending on exacerbation history.", .caution)
        default:    return ("mMRC \(g.score) — severe perceived dyspnea; substantial functional limitation.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "mMRC",
            subtitle: "Modified MRC dyspnea grade"
        ) {
            CalculatorSection("PATIENT-RATED") {
                CalculatorScoreRow(label: "Best descriptor", options: gradeOpts, selection: $gradeID.option(in: gradeOpts))
            }
            CalculatorResultDisplay(
                label: "mMRC",
                value: grade.map { "\($0.score)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 5-grade scale (0–4). Patient picks the descriptor that best matches their typical breathlessness.\nGOLD 2024 uses mMRC ≥ 2 as the high-symptom-burden cutoff, paired with exacerbation history for the COPD assessment quadrant.",
                notes: "Used as an input to BODE Index (where mMRC contributes 0–3 points). Reflects chronic perceived dyspnea, not acute trending. For acute bedside dyspnea trending, use the Modified Borg 0–10 scale instead.",
                citations: [mahler1984Mmrc, openrnResp6]
            )
        }
    }
}
