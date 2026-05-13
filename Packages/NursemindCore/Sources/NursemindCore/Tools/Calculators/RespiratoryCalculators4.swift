import SwiftUI

// MARK: - Shared citation sources

private let yangTobin1991 = CitationSource(
    id: "yang_tobin_1991",
    shortName: "RSBI — Yang & Tobin, NEJM 1991 (concept citation)",
    detail: "Rapid Shallow Breathing Index for predicting weaning success",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2030713/",
    lastRetrieved: "2026-05-04"
)

private let bode2004 = CitationSource(
    id: "celli_2004_bode",
    shortName: "BODE Index — Celli BR et al., NEJM 2004 (concept citation)",
    detail: "Multidimensional 10-point COPD prognostic index",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/15007110/",
    lastRetrieved: "2026-05-04"
)

private let psiFine1997 = CitationSource(
    id: "fine_1997_psi",
    shortName: "PSI / PORT — Fine MJ et al., NEJM 1997 (concept citation)",
    detail: "Pneumonia Severity Index for community-acquired pneumonia disposition",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/8995086/",
    lastRetrieved: "2026-05-04"
)

private let openrnResp4 = CitationSource(
    id: "openrn_resp_4",
    shortName: "Open RN Health Alterations — Respiratory chapter",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=respiratory+ventilation+oxygenation",
    lastRetrieved: "2026-05-04"
)

// MARK: - Minute Ventilation

public struct MinuteVentilationCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "minute-vent", key: "rr") private var rr
    @CalcPersistedDouble(calculatorID: "minute-vent", key: "tv_ml") private var tvMl

    private var resultLpm: Double? {
        guard let rr, rr > 0, let tv = tvMl, tv > 0 else { return nil }
        return rr * tv / 1000.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = resultLpm else { return nil }
        if r > 12 { return ("Elevated minute ventilation. Consider hyperventilation, pain, anxiety, sepsis, metabolic acidosis (Kussmaul respirations), DKA.", .caution) }
        if r < 4  { return ("Low minute ventilation. Concerning for hypoventilation — opioid effect, neuromuscular weakness, severe COPD with retention. Check ETCO₂ / ABG.", .alert) }
        return ("Within typical adult range (5–8 L/min at rest).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Minute Ventilation",
            subtitle: "RR × tidal volume"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Respiratory rate", unit: "breaths/min", value: $rr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Tidal volume",     unit: "mL",          value: $tvMl)
            }
            CalculatorResultDisplay(
                label: "Minute Ventilation",
                value: resultLpm.map { String(format: "%.1f", $0) },
                unit: "L/min",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "VE (L/min) = RR × TV (in liters)\n= RR × TV (mL) ÷ 1000",
                notes: "On a ventilator, minute ventilation drives PaCO₂. To lower CO₂: increase RR or TV (within lung-protective limits). Lung-protective ventilation in ARDS uses TV 4–8 mL/kg of IBW with permissive hypercapnia as needed.",
                citations: [openrnResp4]
            )
        }
    }
}

// MARK: - RSBI

public struct RSBICalculatorView: View {
    @CalcPersistedDouble(calculatorID: "rsbi", key: "rr") private var rr
    @CalcPersistedDouble(calculatorID: "rsbi", key: "tv_ml") private var tvMl

    private var result: Double? {
        guard let rr, rr > 0, let tv = tvMl, tv > 0 else { return nil }
        return rr / (tv / 1000.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r < 105 { return ("RSBI < 105 — predictive of successful extubation (sensitivity 97%). Combine with leak test, mental status, secretion burden, hemodynamics.", .neutral) }
        return ("RSBI ≥ 105 — predicts weaning failure. Consider longer SBT, optimize sedation/secretions/oxygenation before reassessing.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "RSBI",
            subtitle: "Rapid Shallow Breathing Index"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Respiratory rate (during SBT)", unit: "breaths/min", value: $rr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Tidal volume",                 unit: "mL",          value: $tvMl)
            }
            CalculatorResultDisplay(
                label: "RSBI",
                value: result.map { String(format: "%.0f", $0) },
                unit: "breaths/min/L",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "RSBI = RR ÷ TV (in liters)",
                notes: "Measured during a spontaneous breathing trial (SBT) on minimal pressure support. Threshold of 105 has high sensitivity but moderate specificity — RSBI < 105 supports extubation; ≥ 105 does not preclude attempting if other parameters are favorable. Always assess airway protection (gag, cuff leak, secretion clearance) separately.",
                citations: [yangTobin1991, openrnResp4]
            )
        }
    }
}

// MARK: - BODE Index

public struct BODEIndexCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "bode", key: "bmi")    private var bmiOptionID
    @CalcPersistedOptionID(calculatorID: "bode", key: "fev1")   private var fev1OptionID
    @CalcPersistedOptionID(calculatorID: "bode", key: "mmrc")   private var mmrcOptionID
    @CalcPersistedOptionID(calculatorID: "bode", key: "sixMwd") private var sixMwdOptionID

    private var bmiOption:    CalculatorScoreRow.Option? { bmiOptions.first    { $0.id == bmiOptionID } }
    private var fev1Option:   CalculatorScoreRow.Option? { fev1Options.first   { $0.id == fev1OptionID } }
    private var mmrcOption:   CalculatorScoreRow.Option? { mmrcOptions.first   { $0.id == mmrcOptionID } }
    private var sixMwdOption: CalculatorScoreRow.Option? { sixMwdOptions.first { $0.id == sixMwdOptionID } }

    private let bmiOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "BMI > 21", score: 0),
        .init(id: 1, label: "BMI ≤ 21", score: 1)
    ]
    private let fev1Options: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "FEV₁ ≥ 65% predicted",  score: 0),
        .init(id: 1, label: "FEV₁ 50–64% predicted", score: 1),
        .init(id: 2, label: "FEV₁ 36–49% predicted", score: 2),
        .init(id: 3, label: "FEV₁ ≤ 35% predicted",  score: 3)
    ]
    private let mmrcOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "MMRC 0 — dyspnea only with strenuous exercise",      score: 0),
        .init(id: 1, label: "MMRC 1 — short of breath when hurrying / slight hill", score: 0),
        .init(id: 2, label: "MMRC 2 — walks slower than peers / stops for breath",  score: 1),
        .init(id: 3, label: "MMRC 3 — stops after 100 m / few minutes on level",    score: 2),
        .init(id: 4, label: "MMRC 4 — too breathless to leave house / dressing",    score: 3)
    ]
    private let sixMwdOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 350 m",     score: 0),
        .init(id: 1, label: "250–349 m",   score: 1),
        .init(id: 2, label: "150–249 m",   score: 2),
        .init(id: 3, label: "≤ 149 m",     score: 3)
    ]

    private var total: Int? {
        let parts = [bmiOption, fev1Option, mmrcOption, sixMwdOption]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case 0...2: return ("Quartile 1 (BODE 0–2) — published 4-year survival ≈ 80% (Celli 2004 derivation cohort).", .neutral)
        case 3...4: return ("Quartile 2 (BODE 3–4) — published 4-year survival ≈ 67%.", .caution)
        case 5...6: return ("Quartile 3 (BODE 5–6) — published 4-year survival ≈ 57%.", .alert)
        default:    return ("Quartile 4 (BODE 7–10) — published 4-year survival ≈ 18%; advanced-disease band.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "BODE Index",
            subtitle: "COPD multidimensional prognostic index"
        ) {
            CalculatorSection("DOMAINS") {
                CalculatorScoreRow(label: "BMI",                  options: bmiOptions,  selection: $bmiOptionID.option(in: bmiOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Airflow Obstruction (FEV₁)", options: fev1Options, selection: $fev1OptionID.option(in: fev1Options))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Dyspnea (MMRC)",       options: mmrcOptions, selection: $mmrcOptionID.option(in: mmrcOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Exercise (6-min walk)", options: sixMwdOptions, selection: $sixMwdOptionID.option(in: sixMwdOptions))
            }
            CalculatorResultDisplay(
                label: "BODE",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 4 domains. Range 0–10.\nHigher = worse 4-year survival in COPD.",
                notes: "BODE outperforms FEV₁ alone for prognosis. Useful for advance-care-planning conversations, transplant referrals, and tracking treatment response (e.g. pulmonary rehab improves the dyspnea and exercise components).",
                citations: [bode2004, openrnResp4]
            )
        }
    }
}

// MARK: - PSI

public struct PSICalculatorView: View {
    // Demographics
    @State private var age: Double? = nil
    @CalcPersistedBool(calculatorID: "psi", key: "female")      private var female
    @CalcPersistedBool(calculatorID: "psi", key: "nursingHome") private var nursingHome
    // Comorbidities
    @CalcPersistedBool(calculatorID: "psi", key: "neoplasticDisease") private var neoplasticDisease
    @CalcPersistedBool(calculatorID: "psi", key: "liverDisease")      private var liverDisease
    @CalcPersistedBool(calculatorID: "psi", key: "chf")               private var chf
    @CalcPersistedBool(calculatorID: "psi", key: "cvd")               private var cvd
    @CalcPersistedBool(calculatorID: "psi", key: "renalDisease")      private var renalDisease
    // Physical
    @CalcPersistedBool(calculatorID: "psi", key: "ams")          private var ams
    @CalcPersistedBool(calculatorID: "psi", key: "rrGE30")       private var rrGE30
    @CalcPersistedBool(calculatorID: "psi", key: "sbpLT90")      private var sbpLT90
    @CalcPersistedBool(calculatorID: "psi", key: "tempAbnormal") private var tempAbnormal
    @CalcPersistedBool(calculatorID: "psi", key: "hrGE125")      private var hrGE125
    // Lab
    @CalcPersistedBool(calculatorID: "psi", key: "phLT735")         private var phLT735
    @CalcPersistedBool(calculatorID: "psi", key: "bunGE30")         private var bunGE30
    @CalcPersistedBool(calculatorID: "psi", key: "naLT130")         private var naLT130
    @CalcPersistedBool(calculatorID: "psi", key: "glucoseGE250")    private var glucoseGE250
    @CalcPersistedBool(calculatorID: "psi", key: "hctLT30")         private var hctLT30
    @CalcPersistedBool(calculatorID: "psi", key: "pao2LT60")        private var pao2LT60
    @CalcPersistedBool(calculatorID: "psi", key: "pleuralEffusion") private var pleuralEffusion

    private var total: Int? {
        guard let yrs = age, yrs > 0 else { return nil }
        var s = Int(yrs)
        if female              { s -= 10 }
        if nursingHome         { s += 10 }
        if neoplasticDisease   { s += 30 }
        if liverDisease        { s += 20 }
        if chf                 { s += 10 }
        if cvd                 { s += 10 }
        if renalDisease        { s += 10 }
        if ams                 { s += 20 }
        if rrGE30              { s += 20 }
        if sbpLT90             { s += 20 }
        if tempAbnormal        { s += 15 }
        if hrGE125             { s += 10 }
        if phLT735             { s += 30 }
        if bunGE30             { s += 20 }
        if naLT130             { s += 20 }
        if glucoseGE250        { s += 10 }
        if hctLT30             { s += 10 }
        if pao2LT60            { s += 10 }
        if pleuralEffusion     { s += 10 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        // Class I requires age <50 with no comorbid algorithm; here we always
        // start at Class II for adults with this scoring path
        switch s {
        case ..<71:    return ("Class II — published 30-day mortality ≈ 0.6% (Fine 1997 PORT cohort).", .neutral)
        case 71...90:  return ("Class III — published 30-day mortality ≈ 2.8%.", .caution)
        case 91...130: return ("Class IV — published 30-day mortality ≈ 8.2%.", .alert)
        default:       return ("Class V — published 30-day mortality ≈ 29.2%; highest-acuity band.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "PSI / PORT",
            subtitle: "Pneumonia Severity Index"
        ) {
            CalculatorSection("DEMOGRAPHICS") {
                CalculatorNumberField(label: "Age (years; female subtracts 10)", value: $age)
                Hairline(color: NMColor.borderSubtle)
                tg("Female (subtracts 10)",       $female)
                Hairline(color: NMColor.borderSubtle)
                tg("Nursing home resident (+10)", $nursingHome)
            }
            CalculatorSection("COMORBIDITIES") {
                tg("Neoplastic disease (+30)",    $neoplasticDisease)
                Hairline(color: NMColor.borderSubtle)
                tg("Liver disease (+20)",         $liverDisease)
                Hairline(color: NMColor.borderSubtle)
                tg("Congestive heart failure (+10)", $chf)
                Hairline(color: NMColor.borderSubtle)
                tg("Cerebrovascular disease (+10)", $cvd)
                Hairline(color: NMColor.borderSubtle)
                tg("Renal disease (+10)",         $renalDisease)
            }
            CalculatorSection("PHYSICAL EXAM") {
                tg("Altered mental status (+20)", $ams)
                Hairline(color: NMColor.borderSubtle)
                tg("Respiratory rate ≥ 30 (+20)", $rrGE30)
                Hairline(color: NMColor.borderSubtle)
                tg("Systolic BP < 90 (+20)",      $sbpLT90)
                Hairline(color: NMColor.borderSubtle)
                tg("Temperature < 35 or ≥ 40 °C (+15)", $tempAbnormal)
                Hairline(color: NMColor.borderSubtle)
                tg("Heart rate ≥ 125 (+10)",      $hrGE125)
            }
            CalculatorSection("LAB / IMAGING") {
                tg("Arterial pH < 7.35 (+30)",    $phLT735)
                Hairline(color: NMColor.borderSubtle)
                tg("BUN ≥ 30 mg/dL (+20)",        $bunGE30)
                Hairline(color: NMColor.borderSubtle)
                tg("Sodium < 130 mEq/L (+20)",    $naLT130)
                Hairline(color: NMColor.borderSubtle)
                tg("Glucose ≥ 250 mg/dL (+10)",   $glucoseGE250)
                Hairline(color: NMColor.borderSubtle)
                tg("Hematocrit < 30% (+10)",      $hctLT30)
                Hairline(color: NMColor.borderSubtle)
                tg("PaO₂ < 60 mmHg or SpO₂ < 90% (+10)", $pao2LT60)
                Hairline(color: NMColor.borderSubtle)
                tg("Pleural effusion (+10)",      $pleuralEffusion)
            }
            CalculatorResultDisplay(
                label: "PSI Score",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Class II ≤ 70 · Class III 71–90 · Class IV 91–130 · Class V > 130\n(Class I per separate algorithm: age < 50, no comorbidity, all vitals normal.)",
                notes: "More granular than CURB-65 and validated for community-acquired pneumonia disposition. Use clinical judgment — patients with low PSI but social-support gaps or rapid trajectory may still need admission.",
                citations: [psiFine1997, openrnResp4]
            )
        }
    }

    private func tg(_ label: String, _ binding: Binding<Bool>) -> some View {
        Toggle(isOn: binding) {
            Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
        }
        .toggleStyle(.switch)
        .padding(.vertical, NMSpace.base)
    }
}
