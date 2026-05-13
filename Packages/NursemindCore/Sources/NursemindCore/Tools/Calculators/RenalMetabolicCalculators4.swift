import SwiftUI

private let albert1967Winters = CitationSource(
    id: "albert_1967_winters",
    shortName: "Winters' Formula — Albert MS, Dell RB, Winters RW, Ann Intern Med 1967 (concept citation)",
    detail: "Expected pCO₂ in compensated metabolic acidosis = 1.5 × HCO₃ + 8 (± 2)",
    publisher: "Annals of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/6016545/",
    lastRetrieved: "2026-05-04"
)

private let nathan2008A1cAg = CitationSource(
    id: "nathan_2008_a1c_ag",
    shortName: "HbA1c → eAG — Nathan DM et al., Diabetes Care 2008 (concept citation)",
    detail: "ADAG study: estimated average glucose (mg/dL) = 28.7 × A1c − 46.7",
    publisher: "Diabetes Care / American Diabetes Association",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/18540046/",
    lastRetrieved: "2026-05-04"
)

private let openrnRenal4 = CitationSource(
    id: "openrn_renal_4",
    shortName: "Open RN Health Alterations — Acid-Base & Endocrine",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=acid+base+diabetes",
    lastRetrieved: "2026-05-04"
)

// MARK: - Winters' Formula

public struct WintersFormulaCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "winters", key: "hco3")    private var hco3
    @CalcPersistedDouble(calculatorID: "winters", key: "pco2")    private var measuredPCO2

    private var expectedRange: (Double, Double)? {
        guard let h = hco3 else { return nil }
        let center = 1.5 * h + 8.0
        return (center - 2.0, center + 2.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let (lo, hi) = expectedRange else { return nil }
        guard let m = measuredPCO2 else {
            return ("Expected pCO₂ \(format(lo))–\(format(hi)) mmHg for compensated metabolic acidosis. Enter measured pCO₂ to compare.", .neutral)
        }
        if m > hi {
            return ("Measured pCO₂ \(format(m)) is above the expected range (\(format(lo))–\(format(hi))) — concomitant respiratory acidosis is suggested.", .alert)
        }
        if m < lo {
            return ("Measured pCO₂ \(format(m)) is below the expected range (\(format(lo))–\(format(hi))) — concomitant respiratory alkalosis is suggested.", .caution)
        }
        return ("Measured pCO₂ \(format(m)) is within the expected range (\(format(lo))–\(format(hi))) — appropriate respiratory compensation.", .neutral)
    }

    private func format(_ v: Double) -> String { String(format: "%.0f", v) }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "Winters' Formula",
            subtitle: "Expected pCO₂ in metabolic acidosis"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Bicarbonate", unit: "mEq/L", value: $hco3)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Measured pCO₂ (optional)", unit: "mmHg", value: $measuredPCO2)
            }
            CalculatorResultDisplay(
                label: "Expected pCO₂",
                value: expectedRange.map { "\(format($0.0))–\(format($0.1))" },
                unit: "mmHg",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Expected pCO₂ = 1.5 × HCO₃ + 8 (± 2 mmHg)\nValid only in primary metabolic acidosis. Apply after the anion gap and HCO₃ confirm metabolic acidosis is present.",
                notes: "Maximum respiratory compensation typically reaches pCO₂ ≈ 12–15 mmHg. Hypoventilation severe enough to drive pCO₂ above the expected range adds a respiratory acidosis; hyperventilation below the range adds a respiratory alkalosis. For metabolic alkalosis, expected pCO₂ ≈ 0.7 × HCO₃ + 21 (different formula).",
                citations: [albert1967Winters, openrnRenal4]
            )
        }
    }
}

// MARK: - HbA1c → eAG

public struct A1cEAGCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "a1c-eag", key: "a1c") private var a1c

    private var eAG: Double? {
        guard let a = a1c, a > 0 else { return nil }
        return 28.7 * a - 46.7
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let v = eAG, let a = a1c else { return nil }
        if a >= 9.0 { return ("HbA1c ≥ 9% (eAG ≈ \(Int(v.rounded())) mg/dL) — well above the ADA non-pregnancy adult target of < 7%; significantly elevated long-term glycemic exposure.", .alert) }
        if a >= 7.0 { return ("HbA1c 7.0–8.9% (eAG ≈ \(Int(v.rounded())) mg/dL) — above the ADA general adult target of < 7%; individualize per patient (ADA Standards of Care).", .caution) }
        if a >= 5.7 { return ("HbA1c 5.7–6.9% (eAG ≈ \(Int(v.rounded())) mg/dL) — prediabetes range per ADA criteria when ≥ 5.7%; or treated diabetes meeting general target when < 7%.", .caution) }
        return ("HbA1c < 5.7% (eAG ≈ \(Int(v.rounded())) mg/dL) — within the non-diabetic reference range per ADA criteria.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "HbA1c → eAG",
            subtitle: "Estimated average glucose"
        ) {
            CalculatorSection("INPUT") {
                CalculatorNumberField(label: "HbA1c", unit: "%", value: $a1c)
            }
            CalculatorResultDisplay(
                label: "eAG",
                value: eAG.map { String(format: "%.0f", $0) },
                unit: "mg/dL",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "eAG (mg/dL) = 28.7 × HbA1c − 46.7\n(Nathan DM et al., Diabetes Care 2008 — ADAG study)",
                notes: "Useful for translating long-term HbA1c into an average glucose value patients can compare to their meter readings. eAG is an *average* — it does not capture glycemic variability or hypoglycemia risk. Avoid in conditions that distort A1c (recent transfusion, hemolytic anemia, hemoglobinopathies, pregnancy, dialysis).",
                citations: [nathan2008A1cAg, openrnRenal4]
            )
        }
    }
}
