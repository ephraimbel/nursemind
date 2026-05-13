import SwiftUI

// MARK: - Shared citation sources

private let aaGradientRef = CitationSource(
    id: "aa_gradient_ref",
    shortName: "Alveolar Gas Equation — standard physiology reference",
    detail: "PAO₂ = FiO₂ × (Patm − PH₂O) − PaCO₂ ÷ R",
    publisher: "Open RN / OpenStax Anatomy & Physiology",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=respiratory+ventilation+oxygenation",
    lastRetrieved: "2026-05-04"
)

private let percKline = CitationSource(
    id: "kline_2004_perc",
    shortName: "PERC Rule — Kline JA et al., J Thromb Haemost 2004 (concept citation)",
    detail: "Pulmonary Embolism Rule-out Criteria for low pretest probability ED patients",
    publisher: "Journal of Thrombosis and Haemostasis",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/15304025/",
    lastRetrieved: "2026-05-04"
)

private let cdcSmoking = CitationSource(
    id: "cdc_smoking_pack_years",
    shortName: "CDC Smoking & Tobacco Use — pack-years definition",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/tobacco/index.html",
    lastRetrieved: "2026-05-04"
)

private let openrnResp3 = CitationSource(
    id: "openrn_resp_3",
    shortName: "Open RN Health Alterations — Respiratory chapter",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=respiratory+ventilation+oxygenation",
    lastRetrieved: "2026-05-04"
)

// MARK: - A-a Gradient

public struct AAGradientCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "aa-gradient", key: "fio2_pct") private var fio2Percent
    @CalcPersistedDouble(calculatorID: "aa-gradient", key: "paco2") private var paco2
    @CalcPersistedDouble(calculatorID: "aa-gradient", key: "pao2") private var pao2
    @CalcPersistedDouble(calculatorID: "aa-gradient", key: "age") private var age

    private static let patm: Double = 760
    private static let ph2o: Double = 47
    private static let respiratoryQuotient: Double = 0.8

    private var pao2Alveolar: Double? {
        guard let percent = fio2Percent, percent > 0,
              let co2 = paco2, co2 > 0 else { return nil }
        let fio2 = percent / 100.0
        return fio2 * (Self.patm - Self.ph2o) - co2 / Self.respiratoryQuotient
    }

    private var gradient: Double? {
        guard let alveolar = pao2Alveolar, let arterial = pao2 else { return nil }
        return alveolar - arterial
    }

    private var expectedNormal: Double? {
        guard let yrs = age, yrs > 0 else { return nil }
        // Common bedside approximation: (age / 4) + 4
        return yrs / 4.0 + 4.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let g = gradient else { return nil }
        let normal = expectedNormal ?? 15
        if g > normal + 10 { return ("A–a gradient elevated above age-adjusted expected (\(String(format: "%.0f", normal)) mmHg). Consider V/Q mismatch, shunt, or diffusion impairment (PE, pneumonia, ARDS, pulmonary edema).", .alert) }
        if g > normal { return ("A–a gradient slightly above expected; clinical correlation needed.", .caution) }
        return ("A–a gradient within age-adjusted expected range. Hypoxemia (if present) is likely from hypoventilation or low FiO₂.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "A–a Gradient",
            subtitle: "Alveolar-arterial oxygen gradient"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "FiO₂",   unit: "%",     value: $fio2Percent)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "PaCO₂",  unit: "mmHg",  value: $paco2)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "PaO₂",   unit: "mmHg",  value: $pao2)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Age (for expected)", unit: "years", value: $age)
            }
            CalculatorResultDisplay(
                label: "A–a gradient",
                value: gradient.map { String(format: "%.0f", $0) },
                unit: "mmHg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "PAO₂ = FiO₂ × (760 − 47) − PaCO₂ ÷ 0.8\nA–a = PAO₂ − PaO₂\nExpected normal ≈ (age ÷ 4) + 4 mmHg (sea level)",
                notes: "Patm = 760 mmHg at sea level; PH₂O = 47 mmHg. Use measured PaO₂ from ABG. The gradient differentiates causes of hypoxemia: low gradient (≈ normal) suggests hypoventilation or low inspired oxygen; elevated gradient suggests V/Q mismatch (most common), shunt (PE, atelectasis), or diffusion impairment (ILD).",
                citations: [aaGradientRef, openrnResp3]
            )
        }
    }
}

// MARK: - PERC Rule

public struct PERCRuleCalculatorView: View {
    @CalcPersistedBool(calculatorID: "perc", key: "ageGE50")             private var ageGE50
    @CalcPersistedBool(calculatorID: "perc", key: "hrGE100")             private var hrGE100
    @CalcPersistedBool(calculatorID: "perc", key: "spo2LT95")            private var spo2LT95
    @CalcPersistedBool(calculatorID: "perc", key: "unilateralSwelling")  private var unilateralSwelling
    @CalcPersistedBool(calculatorID: "perc", key: "hemoptysis")          private var hemoptysis
    @CalcPersistedBool(calculatorID: "perc", key: "recentSurgeryTrauma") private var recentSurgeryTrauma
    @CalcPersistedBool(calculatorID: "perc", key: "priorVTE")            private var priorVTE
    @CalcPersistedBool(calculatorID: "perc", key: "hormoneUse")          private var hormoneUse

    private var failedCount: Int {
        [ageGE50, hrGE100, spo2LT95, unilateralSwelling,
         hemoptysis, recentSurgeryTrauma, priorVTE, hormoneUse]
            .filter { $0 }.count
    }

    private var passes: Bool {
        failedCount == 0
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if passes {
            return ("PERC rule SATISFIED (all 8 criteria negative). In a patient with low clinical pretest probability (gestalt ≤ 15%), PE can be ruled out without further workup or D-dimer.", .neutral)
        }
        return ("PERC NOT satisfied (\(failedCount) criteri\(failedCount == 1 ? "on" : "a") positive). Cannot rule out PE by PERC; proceed to risk-stratified workup (Wells + D-dimer or imaging).", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "PERC Rule",
            subtitle: "Pulmonary Embolism Rule-out Criteria"
        ) {
            CalculatorSection("CRITERIA — check any that are TRUE") {
                togglePoint(label: "Age ≥ 50",                                  isOn: $ageGE50)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "HR ≥ 100",                                  isOn: $hrGE100)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "SpO₂ < 95% on room air",                    isOn: $spo2LT95)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Unilateral leg swelling",                   isOn: $unilateralSwelling)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Hemoptysis",                                isOn: $hemoptysis)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Recent surgery / trauma (≤ 4 weeks)",       isOn: $recentSurgeryTrauma)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Prior DVT or PE",                           isOn: $priorVTE)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Estrogen / hormone use",                    isOn: $hormoneUse)
            }
            CalculatorResultDisplay(
                label: "PERC",
                value: passes ? "Rules OUT" : "Cannot rule out",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "All 8 criteria must be NEGATIVE.\nValid only when clinical gestalt pretest probability ≤ 15%.",
                notes: "PERC was derived to allow ED clinicians to safely discharge low-probability PE patients without D-dimer. Sensitivity ~97%, missed-PE rate ~1%. Do NOT apply if pretest probability is moderate or high — go directly to D-dimer or imaging in those patients.",
                citations: [percKline, openrnResp3]
            )
        }
    }

    private func togglePoint(label: String, isOn: Binding<Bool>) -> some View {
        HStack {
            Toggle(isOn: isOn) {
                Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
            }
            .toggleStyle(.switch)
        }
        .padding(.vertical, NMSpace.base)
    }
}

// MARK: - Pack-Years

public struct PackYearsCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "pack-years", key: "ppd") private var packsPerDay
    @CalcPersistedDouble(calculatorID: "pack-years", key: "years") private var yearsSmoked

    private var result: Double? {
        guard let packs = packsPerDay, packs > 0,
              let yrs = yearsSmoked, yrs > 0 else { return nil }
        return packs * yrs
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r >= 30 { return ("≥ 30 pack-years — meets pack-year criterion for USPSTF lung-cancer screening (low-dose CT) in eligible adults age 50–80 currently smoking or quit within 15 years. Strongly associated with COPD, atherosclerotic disease.", .alert) }
        if r >= 20 { return ("≥ 20 pack-years — substantial cumulative exposure; increased COPD and lung-cancer risk.", .caution) }
        return ("Cumulative tobacco exposure documented; counsel cessation per USPHS guidelines.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Pack-Years",
            subtitle: "Lifetime tobacco exposure"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Packs per day (1 pack = 20 cigarettes)", value: $packsPerDay)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Years smoked", unit: "years", value: $yearsSmoked)
            }
            CalculatorResultDisplay(
                label: "Pack-Years",
                value: result.map { String(format: "%g", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Pack-years = (packs per day) × (years smoked)",
                notes: "Standard quantification of cumulative tobacco exposure. USPSTF (2021) recommends annual low-dose chest CT lung-cancer screening for adults 50–80 with ≥ 20 pack-year history who currently smoke or quit within the past 15 years. Pack-years is also used in COPD risk assessment and surgical risk stratification.",
                citations: [cdcSmoking, openrnResp3]
            )
        }
    }
}
