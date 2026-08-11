import SwiftUI

// MARK: - Shared citation sources

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
