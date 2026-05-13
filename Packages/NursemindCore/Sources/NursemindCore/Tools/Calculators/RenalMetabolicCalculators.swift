import SwiftUI

// MARK: - Shared citation sources

private let ckdEpi2021 = CitationSource(
    id: "ckd_epi_2021_pmc",
    shortName: "CKD-EPI 2021 (race-free) eGFR — Inker LA et al. NEJM 2021 (PMC OA)",
    detail: "NKF/ASN Task Force-endorsed equation removing race coefficient",
    publisher: "New England Journal of Medicine",
    license: .ccBy4,
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8810714/",
    lastRetrieved: "2026-05-04"
)

private let openrnRenal = CitationSource(
    id: "openrn_renal",
    shortName: "Open RN Health Alterations — Renal & Fluids/Electrolytes",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=renal+kidney+electrolyte+acid+base",
    lastRetrieved: "2026-05-04"
)

private let kdigoTools = CitationSource(
    id: "kdigo_tools",
    shortName: "KDIGO CKD Classification (concept citation)",
    publisher: "Kidney Disease: Improving Global Outcomes",
    license: .factCitationOnly,
    url: "https://kdigo.org/guidelines/",
    lastRetrieved: "2026-05-04"
)

private let hillier1999 = CitationSource(
    id: "hillier_1999",
    shortName: "Hillier TA et al. — Sodium correction for hyperglycemia, Am J Med 1999 (PMC)",
    detail: "Updated correction factor: add 2.4 mEq/L per 100 mg/dL glucose above 100",
    publisher: "American Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10225241/",
    lastRetrieved: "2026-05-04"
)

private let payneCorrectedCa = CitationSource(
    id: "payne_corrected_ca",
    shortName: "Payne RB et al. — Corrected calcium for albumin, Br Med J 1973",
    detail: "Standard formula: corrected Ca = measured Ca + 0.8 × (4.0 − albumin)",
    publisher: "British Medical Journal",
    license: .factCitationOnly,
    url: "https://www.bmj.com/",
    lastRetrieved: "2026-05-04"
)

// MARK: - GFR (CKD-EPI 2021, race-free)

public struct GFRCalculatorView: View {
    @State private var creatinine: Double?
    @State private var age: Double?
    @State private var sex: SexOption?

    public init(preset: [String: Double] = [:]) {
        let store = CalculatorStateStore.shared
        _creatinine = State(initialValue: preset["creatinine"] ?? store.loadDouble(for: "gfr", key: "cr"))
        _age = State(initialValue: preset["age"] ?? store.loadDouble(for: "gfr", key: "age"))
    }

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    private var result: Double? {
        guard let scr = creatinine, scr > 0,
              let yrs = age, yrs > 0, yrs < 130,
              let s = sex else { return nil }

        let kappa  = (s == .female) ? 0.7 : 0.9
        let alpha  = (s == .female) ? -0.241 : -0.302
        let sexMul = (s == .female) ? 1.012 : 1.0
        let ratio  = scr / kappa
        let minTerm = pow(min(ratio, 1.0), alpha)
        let maxTerm = pow(max(ratio, 1.0), -1.200)
        let ageTerm = pow(0.9938, yrs)
        return 142.0 * minTerm * maxTerm * ageTerm * sexMul
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r >= 90 { return ("G1 — normal/high (with kidney damage marker if classifying CKD).", .neutral) }
        if r >= 60 { return ("G2 — mildly decreased (CKD only with damage marker).", .neutral) }
        if r >= 45 { return ("G3a — mild-to-moderate decrease.", .caution) }
        if r >= 30 { return ("G3b — moderate-to-severe decrease.", .caution) }
        if r >= 15 { return ("G4 — severely decreased; prepare for renal replacement.", .alert) }
        return ("G5 — kidney failure (eGFR < 15); dialysis or transplant likely indicated.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "GFR",
            subtitle: "CKD-EPI 2021 — race-free creatinine-based eGFR"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Serum creatinine", unit: "mg/dL", value: $creatinine)
                    .onChange(of: creatinine) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "gfr", key: "cr")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Age", unit: "years", value: $age)
                    .onChange(of: age) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "gfr", key: "age")
                    }
                Hairline(color: NMColor.borderSubtle)
                HStack {
                    Text("Sex at birth")
                        .font(NMFont.bodyLG)
                    Spacer()
                    Picker("Sex", selection: $sex) {
                        Text("—").tag(SexOption?.none)
                        ForEach(SexOption.allCases) { Text($0.display).tag(SexOption?.some($0)) }
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 200)
                }
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "eGFR",
                value: result.map { String(format: "%.0f", $0) },
                unit: "mL/min/1.73 m²",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "eGFR = 142 × min(Scr/κ, 1)^α × max(Scr/κ, 1)^−1.200 × 0.9938^age × 1.012 if female\n(κ = 0.7 female / 0.9 male; α = −0.241 female / −0.302 male)",
                notes: "Race-free CKD-EPI 2021 equation endorsed by the NKF/ASN Task Force. Substitutes for the 2009 equation that included a race coefficient. Validated against measured GFR and accurate across diverse populations. KDIGO stages: G1 ≥90, G2 60–89, G3a 45–59, G3b 30–44, G4 15–29, G5 <15.",
                citations: [ckdEpi2021, kdigoTools]
            )
        }
    }
}

// MARK: - Anion Gap

public struct AnionGapCalculatorView: View {
    @State private var sodium: Double?
    @State private var chloride: Double?
    @State private var bicarbonate: Double?
    @State private var albumin: Double?

    public init(preset: [String: Double] = [:]) {
        let store = CalculatorStateStore.shared
        _sodium = State(initialValue: preset["sodium"] ?? store.loadDouble(for: "anion-gap", key: "na"))
        _chloride = State(initialValue: preset["chloride"] ?? store.loadDouble(for: "anion-gap", key: "cl"))
        _bicarbonate = State(initialValue: preset["bicarbonate"] ?? store.loadDouble(for: "anion-gap", key: "hco3"))
        _albumin = State(initialValue: preset["albumin"] ?? store.loadDouble(for: "anion-gap", key: "alb"))
    }

    private var rawGap: Double? {
        guard let na = sodium, let cl = chloride, let hco3 = bicarbonate else { return nil }
        return na - (cl + hco3)
    }

    private var correctedGap: Double? {
        guard let raw = rawGap, let alb = albumin, alb > 0 else { return nil }
        return raw + 2.5 * (4.0 - alb)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        let gap = correctedGap ?? rawGap
        guard let g = gap else { return nil }
        if g > 12 { return ("Elevated anion gap — consider MUDPILES (methanol, uremia, DKA, propylene glycol, INH/iron, lactic acidosis, ethylene glycol, salicylates).", .alert) }
        if g < 4  { return ("Low anion gap — consider hypoalbuminemia, lithium, multiple myeloma.", .caution) }
        return ("Within typical adult range (~4–12 mEq/L; lab-dependent).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Anion Gap",
            subtitle: "Na − (Cl + HCO₃) · albumin-corrected"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Sodium",      unit: "mEq/L", value: $sodium)
                    .onChange(of: sodium) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "anion-gap", key: "na")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Chloride",    unit: "mEq/L", value: $chloride)
                    .onChange(of: chloride) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "anion-gap", key: "cl")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Bicarbonate", unit: "mEq/L", value: $bicarbonate)
                    .onChange(of: bicarbonate) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "anion-gap", key: "hco3")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Albumin (optional)", unit: "g/dL", value: $albumin)
            }
            CalculatorResultDisplay(
                label: correctedGap != nil ? "Corrected AG" : "Anion Gap",
                value: (correctedGap ?? rawGap).map { String(format: "%.1f", $0) },
                unit: "mEq/L",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "AG = Na − (Cl + HCO₃)\nAG_corrected = AG + 2.5 × (4.0 − albumin)",
                notes: "Albumin correction reduces false-negative anion gaps in critically ill, hypoalbuminemic patients. Pair with a delta-gap analysis when evaluating mixed acid-base disorders. Reference ranges vary by lab.",
                citations: [openrnRenal]
            )
        }
    }
}

// MARK: - Corrected Sodium (for hyperglycemia)

public struct CorrectedSodiumCalculatorView: View {
    @State private var measuredNa: Double?
    @State private var glucose: Double?

    public init(preset: [String: Double] = [:]) {
        let store = CalculatorStateStore.shared
        _measuredNa = State(initialValue: preset["sodium"] ?? store.loadDouble(for: "corrected-na", key: "s_na"))
        _glucose = State(initialValue: preset["glucose"] ?? store.loadDouble(for: "corrected-na", key: "glu"))
    }

    private var result: Double? {
        guard let na = measuredNa, let glu = glucose, glu > 100 else { return nil }
        return na + 2.4 * ((glu - 100.0) / 100.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result, let na = measuredNa else { return nil }
        let delta = r - na
        if r > 145 { return ("Corrected sodium hypernatremic — consider free-water deficit.", .alert) }
        if r < 135 { return ("Corrected sodium hyponatremic — true hyponatremia even after glucose correction.", .alert) }
        return ("Corrected sodium within typical range. Glucose correction added \(String(format: "%.1f", delta)) mEq/L.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Corrected Na⁺",
            subtitle: "Sodium correction for hyperglycemia · Hillier 1999"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Measured sodium", unit: "mEq/L", value: $measuredNa)
                    .onChange(of: measuredNa) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "corrected-na", key: "s_na")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum glucose",   unit: "mg/dL", value: $glucose)
                    .onChange(of: glucose) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "corrected-na", key: "glu")
                    }
            }
            CalculatorResultDisplay(
                label: "Corrected Na",
                value: (result ?? measuredNa).map { String(format: "%.1f", $0) },
                unit: "mEq/L",
                interpretation: glucose.map { $0 > 100 } == true ? interpretation?.0 : "Glucose ≤ 100 mg/dL — no correction needed; result equals measured value.",
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Corrected Na = measured Na + 2.4 × (glucose − 100) ÷ 100",
                notes: "Hillier 1999 updated the older Katz factor of 1.6, with experimental data supporting 2.4 mEq/L of sodium reduction per 100 mg/dL of glucose above 100. Use to detect true hyponatremia masked by glucose-driven water shift, particularly in DKA/HHS workup.",
                citations: [hillier1999, openrnRenal]
            )
        }
    }
}

// MARK: - Corrected Calcium (for albumin)

public struct CorrectedCalciumCalculatorView: View {
    @State private var totalCa: Double?
    @State private var albumin: Double?

    public init(preset: [String: Double] = [:]) {
        let store = CalculatorStateStore.shared
        _totalCa = State(initialValue: preset["calcium"])
        _albumin = State(initialValue: preset["albumin"] ?? store.loadDouble(for: "corrected-ca", key: "alb"))
    }

    private var result: Double? {
        guard let ca = totalCa, let alb = albumin else { return nil }
        return ca + 0.8 * (4.0 - alb)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r < 8.5 { return ("Hypocalcemia — assess for paresthesia, Chvostek/Trousseau, QT prolongation, tetany.", .alert) }
        if r > 10.5 { return ("Hypercalcemia — consider PTH-related, malignancy, vitamin D toxicity, immobility.", .alert) }
        return ("Within typical adult range (8.5–10.5 mg/dL; lab-dependent).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Corrected Ca²⁺",
            subtitle: "Calcium correction for albumin · Payne 1973"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Total calcium", unit: "mg/dL", value: $totalCa)
                    .onChange(of: totalCa) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "corrected-ca", key: "ca")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Albumin",       unit: "g/dL", value: $albumin)
                    .onChange(of: albumin) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "anion-gap", key: "alb")
                    }
            }
            CalculatorResultDisplay(
                label: "Corrected Ca",
                value: result.map { String(format: "%.2f", $0) },
                unit: "mg/dL",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Corrected Ca = measured Ca + 0.8 × (4.0 − albumin)",
                notes: "Approximation of ionized calcium when only total calcium and albumin are available. Less accurate in critically ill patients with rapid albumin shifts; obtain ionized calcium directly when correction matters clinically (e.g., suspected hypocalcemia in massive transfusion, citrate toxicity).",
                citations: [payneCorrectedCa, openrnRenal]
            )
        }
    }
}

// MARK: - FENa

public struct FENaCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "fena", key: "u_na") private var urineNa
    @CalcPersistedDouble(calculatorID: "fena", key: "s_na") private var serumNa
    @CalcPersistedDouble(calculatorID: "fena", key: "u_cr") private var urineCr
    @CalcPersistedDouble(calculatorID: "fena", key: "s_cr") private var serumCr

    private var result: Double? {
        guard let uNa = urineNa, let sNa = serumNa, sNa > 0,
              let uCr = urineCr, let sCr = serumCr, sCr > 0 else { return nil }
        return ((uNa * sCr) / (sNa * uCr)) * 100.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r < 1.0 { return ("FENa < 1% — pre-renal AKI most likely (hypovolemia, low renal perfusion). Less reliable on diuretics; use FEUrea instead.", .caution) }
        if r > 2.0 { return ("FENa > 2% — intrinsic AKI most likely (acute tubular necrosis).", .alert) }
        return ("Indeterminate range (1–2%) — interpret with clinical context.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "FENa",
            subtitle: "Fractional excretion of sodium"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Urine Na",       unit: "mEq/L", value: $urineNa)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum Na",       unit: "mEq/L", value: $serumNa)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Urine creatinine", unit: "mg/dL", value: $urineCr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum creatinine", unit: "mg/dL", value: $serumCr)
            }
            CalculatorResultDisplay(
                label: "FENa",
                value: result.map { String(format: "%.2f", $0) },
                unit: "%",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "FENa = (UNa × SCr) ÷ (SNa × UCr) × 100",
                notes: "Helps distinguish pre-renal AKI (< 1%) from intrinsic AKI / ATN (> 2%). Unreliable in patients on loop or thiazide diuretics — use FEUrea (< 35% suggests pre-renal) in that setting. Less useful in advanced CKD, glomerulonephritis, contrast nephropathy, post-obstruction.",
                citations: [openrnRenal]
            )
        }
    }
}
