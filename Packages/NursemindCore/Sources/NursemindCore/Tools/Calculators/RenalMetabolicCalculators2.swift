import SwiftUI

// MARK: - Shared citation sources

private let cockcroftGault1976 = CitationSource(
    id: "cockcroft_gault_1976",
    shortName: "Cockcroft-Gault — Cockcroft & Gault, Nephron 1976 (concept citation)",
    detail: "Original creatinine-clearance estimate from age, weight, sex, and serum creatinine",
    publisher: "Nephron",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/1244564/",
    lastRetrieved: "2026-05-04"
)

private let openrnRenal2 = CitationSource(
    id: "openrn_renal_2",
    shortName: "Open RN Health Alterations — Renal & Fluid/Electrolyte chapters",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=renal+kidney+electrolyte+acid+base",
    lastRetrieved: "2026-05-04"
)

private let osmolalityRef = CitationSource(
    id: "osmolality_calc",
    shortName: "Plasma Osmolality calculation — standard formula",
    detail: "2(Na) + glucose/18 + BUN/2.8 (mg/dL units)",
    publisher: "Open RN Health Alterations",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=renal+kidney+electrolyte+acid+base",
    lastRetrieved: "2026-05-04"
)

// MARK: - Cockcroft-Gault Creatinine Clearance

public struct CockcroftGaultCalculatorView: View {
    @State private var age: Double?
    @State private var weightKg: Double?
    @State private var creatinine: Double?
    @State private var sex: SexOption?

    public init(preset: [String: Double] = [:]) {
        let store = CalculatorStateStore.shared
        _age = State(initialValue: preset["age"] ?? store.loadDouble(for: "crcl", key: "age"))
        _weightKg = State(initialValue: preset["weight_kg"] ?? store.loadDouble(for: "crcl", key: "wt"))
        _creatinine = State(initialValue: preset["creatinine"] ?? store.loadDouble(for: "crcl", key: "cr"))
    }

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    private var result: Double? {
        guard let yrs = age, yrs > 0, yrs < 130,
              let kg = weightKg, kg > 0,
              let cr = creatinine, cr > 0,
              let s = sex else { return nil }
        let raw = ((140.0 - yrs) * kg) / (72.0 * cr)
        return s == .female ? raw * 0.85 : raw
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r >= 90 { return ("CrCl ≥ 90 mL/min — normal range.", .neutral) }
        if r >= 60 { return ("CrCl 60–89 — mild reduction; many drug-dose adjustments begin here.", .caution) }
        if r >= 30 { return ("CrCl 30–59 — moderate reduction; many renally-cleared drugs require dose reduction or interval extension.", .caution) }
        if r >= 15 { return ("CrCl 15–29 — severe reduction; aggressive renal dosing required; many drugs contraindicated.", .alert) }
        return ("CrCl < 15 — kidney failure; dialysis-relevant dosing.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Creatinine Clearance",
            subtitle: "Cockcroft-Gault — drug-dosing reference"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Age",                unit: "years",  value: $age)
                    .onChange(of: age) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "crcl", key: "age")
                    }
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Weight (actual or IBW)", unit: "kg", value: $weightKg)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum creatinine",   unit: "mg/dL",  value: $creatinine)
                    .onChange(of: creatinine) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "crcl", key: "cr")
                    }
                Hairline(color: NMColor.borderSubtle)
                HStack {
                    Text("Sex at birth").font(NMFont.bodyLG)
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
                label: "CrCl",
                value: result.map { String(format: "%.0f", $0) },
                unit: "mL/min",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "CrCl = ((140 − age) × weight in kg) ÷ (72 × Scr)\nMultiply × 0.85 if female",
                notes: "Cockcroft-Gault remains the FDA-required estimate for many drug-dose adjustments (e.g., DOACs, aminoglycosides, vancomycin nomograms in some institutions) even though CKD-EPI 2021 is preferred for staging CKD. Use ACTUAL body weight in non-obese patients; many institutions use ideal or adjusted body weight for obese (BMI > 30) patients — follow your protocol. Not validated in unstable creatinine (AKI), pregnancy, or AKA amputees.",
                citations: [cockcroftGault1976, openrnRenal2]
            )
        }
    }
}

// MARK: - Free Water Deficit

public struct FreeWaterDeficitCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "fwd", key: "s_na") private var serumNa
    @CalcPersistedDouble(calculatorID: "fwd", key: "wt") private var weightKg
    @CalcPersistedRawValue<SexOption>(calculatorID: "fwd", key: "sex") private var sex
    @CalcPersistedRawValue<AgeOption>(calculatorID: "fwd", key: "age") private var age

    enum SexOption: String, CaseIterable, Identifiable {
        case female, male
        var id: String { rawValue }
        var display: String { rawValue.capitalized }
    }

    enum AgeOption: String, CaseIterable, Identifiable {
        case adult, elderly
        var id: String { rawValue }
        var display: String {
            switch self {
            case .adult: return "Adult (< 65)"
            case .elderly: return "Elderly (≥ 65)"
            }
        }
    }

    private var totalBodyWater: Double? {
        guard let kg = weightKg, kg > 0, let s = sex, let a = age else { return nil }
        // Standard fractions: adult male 0.6, adult female 0.5; elderly male 0.5, elderly female 0.45
        let fraction: Double
        switch (s, a) {
        case (.male, .adult):    fraction = 0.6
        case (.female, .adult):  fraction = 0.5
        case (.male, .elderly):  fraction = 0.5
        case (.female, .elderly):fraction = 0.45
        }
        return kg * fraction
    }

    private var deficit: Double? {
        guard let na = serumNa, na > 140,
              let tbw = totalBodyWater else { return nil }
        return tbw * ((na / 140.0) - 1.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let d = deficit else { return nil }
        return ("Replace cautiously — generally over 48 hours and at a rate that lowers serum sodium by no more than 8–10 mEq/L per 24 hours to avoid cerebral edema. Use D5W or hypotonic saline per provider order; combine with the PATIENT'S OWN ongoing free-water losses (insensible + urinary).", .alert)
        _ = d
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Free Water Deficit",
            subtitle: "Replacement target in hypernatremia"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Serum sodium",     unit: "mEq/L", value: $serumNa)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Weight",            unit: "kg",    value: $weightKg)
                    .onChange(of: weightKg) { _, new in
                        CalculatorStateStore.shared.saveDouble(new, for: "crcl", key: "wt")
                    }
                Hairline(color: NMColor.borderSubtle)
                HStack {
                    Text("Sex at birth").font(NMFont.bodyLG)
                    Spacer()
                    Picker("Sex", selection: $sex) {
                        Text("—").tag(SexOption?.none)
                        ForEach(SexOption.allCases) { Text($0.display).tag(SexOption?.some($0)) }
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 200)
                }
                .padding(.vertical, NMSpace.base)
                Hairline(color: NMColor.borderSubtle)
                HStack {
                    Text("Age group").font(NMFont.bodyLG)
                    Spacer()
                    Picker("Age", selection: $age) {
                        Text("—").tag(AgeOption?.none)
                        ForEach(AgeOption.allCases) { Text($0.display).tag(AgeOption?.some($0)) }
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 220)
                }
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "Free water deficit",
                value: deficit.map { String(format: "%.1f", $0) },
                unit: "L",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "TBW = weight × fraction (M 0.6 / F 0.5; elderly M 0.5 / F 0.45)\nDeficit = TBW × ((serum Na ÷ 140) − 1)",
                notes: "Calculation only valid for true hypernatremia (Na > 140). Replacement is in addition to ongoing losses — measure or estimate insensible (~30–50 mL/kg/day) and urinary water losses, then add them to the deficit calculation. Lowering Na too rapidly causes cerebral edema; max 8–10 mEq/L per 24 hours in chronic hypernatremia.",
                citations: [openrnRenal2]
            )
        }
    }
}

// MARK: - Plasma Osmolality

public struct PlasmaOsmolalityCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "osmolality", key: "na") private var sodium
    @CalcPersistedDouble(calculatorID: "osmolality", key: "glu") private var glucose
    @CalcPersistedDouble(calculatorID: "osmolality", key: "bun") private var bun

    private var result: Double? {
        guard let na = sodium, let glu = glucose, let bun else { return nil }
        return 2.0 * na + glu / 18.0 + bun / 2.8
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r > 320 { return ("Calculated osmolality > 320 mOsm/kg — markedly hyperosmolar. Consider HHS, severe hypernatremia, mannitol, alcohol/toxic ingestion. Compare to measured osmolality for an osmolar gap.", .alert) }
        if r > 295 { return ("Slight hyperosmolality (296–320). Trend with clinical picture.", .caution) }
        if r < 275 { return ("Hyposmolar (< 275 mOsm/kg) — consistent with true hyponatremia. Determine etiology (volume status, urine osmolality, urine Na).", .alert) }
        return ("Within typical adult range (275–295 mOsm/kg).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Plasma Osmolality",
            subtitle: "Calculated serum osmolality"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Sodium",   unit: "mEq/L", value: $sodium)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Glucose",  unit: "mg/dL", value: $glucose)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "BUN",      unit: "mg/dL", value: $bun)
            }
            CalculatorResultDisplay(
                label: "Plasma osmolality",
                value: result.map { String(format: "%.0f", $0) },
                unit: "mOsm/kg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Osm = 2(Na) + glucose ÷ 18 + BUN ÷ 2.8\n(SI units: 2(Na) + glucose + BUN, all in mmol/L)",
                notes: "Compare calculated to a directly measured osmolality (lab assay) — the difference is the osmolar gap. A gap > 10 mOsm/kg suggests an unmeasured osmole (toxic alcohol, mannitol, glycine, ketones). The doubled sodium accounts for accompanying anion (mostly chloride and bicarbonate). Useful in workup of altered mental status with electrolyte derangements.",
                citations: [osmolalityRef, openrnRenal2]
            )
        }
    }
}
