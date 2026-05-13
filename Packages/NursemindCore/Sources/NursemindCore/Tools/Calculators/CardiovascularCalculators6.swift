import SwiftUI

private let fickConcept = CitationSource(
    id: "fick_concept",
    shortName: "Fick principle — Adolf Fick, 1870 (concept citation)",
    detail: "Cardiac output equals VO₂ divided by arteriovenous oxygen content difference",
    publisher: "Verhandlungen der Physikalisch-Medizinischen Gesellschaft zu Würzburg",
    license: .factCitationOnly,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK482268/",
    lastRetrieved: "2026-05-04"
)

private let lafarge1970Vo2 = CitationSource(
    id: "lafarge_1970_vo2",
    shortName: "Estimated VO₂ — LaFarge CG, Miettinen OS, Cardiovasc Res 1970 (concept citation)",
    detail: "Age- and sex-adjusted oxygen consumption estimate (mL/min/m²) used when measured VO₂ is unavailable",
    publisher: "Cardiovascular Research",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/4192616/",
    lastRetrieved: "2026-05-04"
)

private let openrnCardio6 = CitationSource(
    id: "openrn_cardio_6",
    shortName: "Open RN Health Alterations — Hemodynamic Monitoring",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cardiac+output+hemodynamic",
    lastRetrieved: "2026-05-04"
)

// MARK: - Fick Cardiac Output

public struct FickCOCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "fick-co", key: "vo2")  private var vo2     // mL/min
    @CalcPersistedDouble(calculatorID: "fick-co", key: "hgb")  private var hgb     // g/dL
    @CalcPersistedDouble(calculatorID: "fick-co", key: "sao2") private var sao2    // %
    @CalcPersistedDouble(calculatorID: "fick-co", key: "svo2") private var svo2    // %
    @CalcPersistedDouble(calculatorID: "fick-co", key: "bsa")  private var bsa     // m² — for indexed CO

    private var avO2Diff: Double? {
        guard let h = hgb, let a = sao2, let v = svo2, h > 0 else { return nil }
        let aFrac = a / 100.0
        let vFrac = v / 100.0
        guard aFrac > vFrac else { return nil }
        // 1.34 mL O₂ per g Hgb; result in mL O₂ per dL blood.
        return 1.34 * h * (aFrac - vFrac)
    }

    private var co: Double? {
        guard let v = vo2, let avDiff = avO2Diff, avDiff > 0 else { return nil }
        // VO₂ in mL/min ÷ a-vO₂ diff (mL/dL) × 10 → L/min
        return v / (avDiff * 10.0)
    }

    private var ci: Double? {
        guard let c = co, let b = bsa, b > 0 else { return nil }
        return c / b
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let value = ci ?? co else { return nil }
        let usingIndex = ci != nil
        let label = usingIndex ? "Cardiac Index" : "Cardiac Output"
        let unit  = usingIndex ? "L/min/m²" : "L/min"
        if usingIndex {
            if value < 1.8 { return ("\(label) \(format(value)) \(unit) — within the published cardiogenic-shock band (CI < 1.8 per ESC HF/cardiogenic-shock literature).", .alert) }
            if value < 2.2 { return ("\(label) \(format(value)) \(unit) — below the typical normal CI range (2.5–4.0); evaluate hemodynamic context.", .caution) }
            if value <= 4.0 { return ("\(label) \(format(value)) \(unit) — within the typical adult reference range (CI 2.5–4.0).", .neutral) }
            return ("\(label) \(format(value)) \(unit) — above the typical normal CI range (e.g., sepsis-related vasodilation, hyperthyroidism, anemia compensation).", .caution)
        } else {
            if value < 4.0 { return ("\(label) \(format(value)) \(unit) — below the typical adult reference (4–8 L/min). Indexing to BSA gives a fairer comparison across body sizes.", .caution) }
            if value <= 8.0 { return ("\(label) \(format(value)) \(unit) — within the typical adult reference (4–8 L/min).", .neutral) }
            return ("\(label) \(format(value)) \(unit) — above typical reference; consider high-output states.", .caution)
        }
    }

    private func format(_ v: Double) -> String { String(format: "%.2f", v) }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "Fick CO",
            subtitle: "Cardiac output by Fick principle"
        ) {
            CalculatorSection("OXYGEN CONSUMPTION") {
                CalculatorNumberField(label: "VO₂", unit: "mL/min", value: $vo2)
            }
            CalculatorSection("HEMOGLOBIN & SATURATIONS") {
                CalculatorNumberField(label: "Hemoglobin",                       unit: "g/dL", value: $hgb)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "SaO₂ (arterial)",                 unit: "%",    value: $sao2)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "SvO₂ (mixed venous, PA catheter)", unit: "%",    value: $svo2)
            }
            CalculatorSection("OPTIONAL — INDEX TO BSA") {
                CalculatorNumberField(label: "Body surface area", unit: "m²", value: $bsa)
            }
            CalculatorResultDisplay(
                label: ci != nil ? "Cardiac Index" : "Cardiac Output",
                value: (ci ?? co).map { String(format: "%.2f", $0) },
                unit: ci != nil ? "L/min/m²" : "L/min",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "CO (L/min) = VO₂ (mL/min) ÷ [1.34 × Hgb × (SaO₂ − SvO₂)] × 10\nCardiac Index = CO ÷ BSA\n(SaO₂ and SvO₂ entered as percentages; converted to fractions internally.)",
                notes: "Direct Fick requires a measured oxygen consumption, typically obtained in the cath lab via metabolic cart. Estimated VO₂ approximations (LaFarge & Miettinen 1970: ≈ 125 mL/min/m² in younger adults, dropping with age) are widely used but introduce error. SvO₂ should be true mixed venous from a PA catheter; ScvO₂ from a central line is a reasonable surrogate but runs slightly higher. Assumes no significant intracardiac shunt.",
                citations: [fickConcept, lafarge1970Vo2, openrnCardio6]
            )
        }
    }
}
