import SwiftUI

// MARK: - Shared citation sources

private let adrogueMadias = CitationSource(
    id: "adrogue_madias_2000",
    shortName: "Adrogue-Madias formula — Adrogue HJ & Madias NE, NEJM 2000 (concept citation)",
    detail: "Predicts change in serum sodium per liter of infusate",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10824078/",
    lastRetrieved: "2026-05-04"
)

private let toxicAlcoholRef = CitationSource(
    id: "toxic_alcohols_ref",
    shortName: "Osmolar Gap in toxic alcohol ingestion — standard toxicology reference",
    publisher: "Open RN Health Alterations / Goldfrank's Toxicologic Emergencies (concept)",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=renal+kidney+electrolyte+acid+base",
    lastRetrieved: "2026-05-04"
)

private let deltaGapRef = CitationSource(
    id: "delta_gap_ref",
    shortName: "Delta-gap analysis — standard ABG interpretation",
    detail: "ΔAG ÷ ΔHCO₃ to identify mixed metabolic disorders",
    publisher: "Open RN Health Alterations / standard pulmonary critical-care references",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=renal+kidney+electrolyte+acid+base",
    lastRetrieved: "2026-05-04"
)

private let openrnRenal3 = CitationSource(
    id: "openrn_renal_3",
    shortName: "Open RN Health Alterations — Acid-Base & Fluid/Electrolyte chapters",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=renal+kidney+electrolyte+acid+base",
    lastRetrieved: "2026-05-04"
)

// MARK: - Sodium Correction Rate (Adrogue-Madias)

public struct SodiumCorrectionRateCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "na-correction-rate", key: "inf_na") private var infusateNa
    @CalcPersistedDouble(calculatorID: "na-correction-rate", key: "s_na") private var serumNa
    @CalcPersistedDouble(calculatorID: "na-correction-rate", key: "wt") private var weightKg
    @CalcPersistedRawValue<SexOption>(calculatorID: "na-correction-rate", key: "sex") private var sex
    @CalcPersistedRawValue<AgeOption>(calculatorID: "na-correction-rate", key: "age") private var age

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
            case .adult:   return "Adult (< 65)"
            case .elderly: return "Elderly (≥ 65)"
            }
        }
    }

    private var totalBodyWater: Double? {
        guard let kg = weightKg, kg > 0, let s = sex, let a = age else { return nil }
        let fraction: Double
        switch (s, a) {
        case (.male, .adult):     fraction = 0.6
        case (.female, .adult):   fraction = 0.5
        case (.male, .elderly):   fraction = 0.5
        case (.female, .elderly): fraction = 0.45
        }
        return kg * fraction
    }

    private var deltaPerLiter: Double? {
        guard let inf = infusateNa,
              let serum = serumNa,
              let tbw = totalBodyWater else { return nil }
        return (inf - serum) / (tbw + 1.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let d = deltaPerLiter else { return nil }
        let abs = Swift.abs(d)
        if abs > 8 { return ("Each liter of this infusate would change serum sodium by ≈ \(String(format: "%.1f", d)) mEq/L. Limit total correction to ≤ 8–10 mEq/L per 24 hours to avoid osmotic demyelination (chronic hyponatremia) or cerebral edema (chronic hypernatremia).", .alert) }
        return ("Each liter of this infusate would change serum sodium by ≈ \(String(format: "%.1f", d)) mEq/L. Adjust the rate to keep total correction within 8–10 mEq/L per 24 hours.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Na Correction Rate",
            subtitle: "Adrogue-Madias — ΔNa per liter of infusate"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Infusate Na",  unit: "mEq/L", value: $infusateNa, placeholder: "e.g. 154 (NS)")
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Serum Na",     unit: "mEq/L", value: $serumNa)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Weight",       unit: "kg",    value: $weightKg)
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
                label: "ΔNa per L of infusate",
                value: deltaPerLiter.map { String(format: "%+.2f", $0) },
                unit: "mEq/L",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "ΔNa = (infusate Na − serum Na) ÷ (TBW + 1)\nTBW = weight × (M 0.6 / F 0.5; elderly M 0.5 / F 0.45)\nCommon infusate Na: D5W = 0; ½NS = 77; NS = 154; 3% saline = 513",
                notes: "Predicts steady-state sodium change per L of fluid; does not account for ongoing renal/insensible losses or oral intake. Recheck serum sodium every 4–6 hours during active correction. Limit total correction to ≤ 8–10 mEq/L in 24 h (more conservative in chronic disorders, alcoholics, malnourished).",
                citations: [adrogueMadias, openrnRenal3]
            )
        }
    }
}

// MARK: - Osmolar Gap

public struct OsmolarGapCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "osmolar-gap", key: "measured") private var measured
    @CalcPersistedDouble(calculatorID: "osmolar-gap", key: "na") private var na
    @CalcPersistedDouble(calculatorID: "osmolar-gap", key: "glu") private var glucose
    @CalcPersistedDouble(calculatorID: "osmolar-gap", key: "bun") private var bun

    private var calculated: Double? {
        guard let na, let glucose, let bun else { return nil }
        return 2 * na + glucose / 18 + bun / 2.8
    }

    private var gap: Double? {
        guard let m = measured, let c = calculated else { return nil }
        return m - c
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let g = gap else { return nil }
        if g > 10 { return ("Osmolar gap > 10 mOsm/kg — suggests an unmeasured osmole. Suspect toxic alcohol ingestion (ethanol, methanol, ethylene glycol, isopropanol), mannitol, glycine, or unmeasured ketones.", .alert) }
        if g > 5  { return ("Mildly elevated gap; correlate clinically. Mild ethanol use can produce gaps in this range.", .caution) }
        return ("Gap within normal range (typically < 10 mOsm/kg).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Osmolar Gap",
            subtitle: "Measured − calculated osmolality"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Measured osmolality", unit: "mOsm/kg", value: $measured)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Sodium",   unit: "mEq/L", value: $na)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Glucose",  unit: "mg/dL", value: $glucose)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "BUN",      unit: "mg/dL", value: $bun)
            }
            CalculatorResultDisplay(
                label: "Osmolar Gap",
                value: gap.map { String(format: "%+.1f", $0) },
                unit: "mOsm/kg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Gap = measured − calculated\nCalculated = 2(Na) + glucose ÷ 18 + BUN ÷ 2.8",
                notes: "A high osmolar gap with high anion gap metabolic acidosis is the classic toxic-alcohol presentation (methanol → blindness; ethylene glycol → renal failure). Toxicology consult, fomepizole, and consider hemodialysis. Always send a TRUE osmolality (freezing-point depression), not a calculated estimate.",
                citations: [toxicAlcoholRef, openrnRenal3]
            )
        }
    }
}

// MARK: - Delta-Gap

public struct DeltaGapCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "delta-gap", key: "na") private var na
    @CalcPersistedDouble(calculatorID: "delta-gap", key: "cl") private var cl
    @CalcPersistedDouble(calculatorID: "delta-gap", key: "hco3") private var hco3

    private var anionGap: Double? {
        guard let na, let cl, let hco3 else { return nil }
        return na - (cl + hco3)
    }

    private var deltaRatio: Double? {
        guard let ag = anionGap, let hco3 else { return nil }
        let dAG = ag - 12.0
        let dHCO3 = 24.0 - hco3
        guard dHCO3 != 0 else { return nil }
        return dAG / dHCO3
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = deltaRatio else { return nil }
        if r < 0.4 { return ("Δ ratio < 0.4 — pure non-anion-gap (hyperchloremic) metabolic acidosis (e.g. diarrhea, RTA, saline).", .caution) }
        if r < 0.8 { return ("Δ ratio 0.4–0.8 — mixed HAGMA + non-AG metabolic acidosis.", .caution) }
        if r <= 2.0 { return ("Δ ratio 0.8–2.0 — pure HAGMA (lactic acidosis, DKA, salicylates, toxic alcohols, uremia).", .alert) }
        return ("Δ ratio > 2.0 — HAGMA + concurrent metabolic alkalosis OR pre-existing chronic respiratory acidosis (compensatory bicarbonate retention).", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Delta-Gap",
            subtitle: "ΔAG ÷ ΔHCO₃ — mixed acid-base disorders"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Sodium",      unit: "mEq/L", value: $na)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Chloride",    unit: "mEq/L", value: $cl)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Bicarbonate", unit: "mEq/L", value: $hco3)
            }
            CalculatorResultDisplay(
                label: "Δ Ratio",
                value: deltaRatio.map { String(format: "%.2f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "ΔAG = AG − 12   (AG = Na − Cl − HCO₃)\nΔHCO₃ = 24 − HCO₃\nΔ Ratio = ΔAG ÷ ΔHCO₃",
                notes: "In a pure HAGMA, every additional mEq of acid produces an equivalent fall in bicarbonate, so the Δ ratio approaches 1. Ratio < 1 suggests an additional non-AG acidosis component (the HCO₃ has fallen more than the AG has risen). Ratio > 2 suggests a co-existing metabolic alkalosis maintaining the bicarbonate.",
                citations: [deltaGapRef, openrnRenal3]
            )
        }
    }
}
