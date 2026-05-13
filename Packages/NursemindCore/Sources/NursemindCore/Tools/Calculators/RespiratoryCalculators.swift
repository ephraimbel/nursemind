import SwiftUI

// MARK: - Shared citation sources

private let ardsBerlin = CitationSource(
    id: "ards_berlin_pmc",
    shortName: "ARDS Berlin Definition (PMC OA) — Ranieri et al. JAMA 2012",
    detail: "P/F-ratio severity stratification: 200–300 mild, 100–200 moderate, ≤100 severe (with PEEP/CPAP ≥5)",
    publisher: "JAMA",
    license: .ccBy4,
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4486753/",
    lastRetrieved: "2026-05-04"
)

private let palicc = CitationSource(
    id: "palicc_oxygenation_index",
    shortName: "Pediatric Acute Lung Injury Consensus Conference (PALICC) — Oxygenation Index thresholds",
    detail: "OI ≥4 mild, ≥8 moderate, ≥16 severe pediatric ARDS (concept citation)",
    publisher: "Pediatric Acute Lung Injury Consensus Conference",
    license: .factCitationOnly,
    url: "https://journals.lww.com/pccmjournal",
    lastRetrieved: "2026-05-04"
)

private let openrnRespiratory = CitationSource(
    id: "openrn_respiratory",
    shortName: "Open RN Health Alterations — Respiratory chapter",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=respiratory+ventilation+oxygenation",
    lastRetrieved: "2026-05-04"
)

// MARK: - P/F Ratio

public struct PFRatioCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "pf-ratio", key: "pao2") private var pao2
    @CalcPersistedDouble(calculatorID: "pf-ratio", key: "fio2_pct") private var fio2Percent

    private var result: Double? {
        guard let p = pao2, let percent = fio2Percent, percent > 0, p > 0 else { return nil }
        let fio2 = percent / 100.0
        return p / fio2
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r > 300  { return ("Above ARDS threshold — not consistent with ARDS by Berlin criteria (requires PEEP ≥5).", .neutral) }
        if r > 200  { return ("Mild ARDS range (200–300) per Berlin definition (with PEEP/CPAP ≥5).", .caution) }
        if r > 100  { return ("Moderate ARDS range (100–200) per Berlin definition.", .alert) }
        return ("Severe ARDS range (≤100) per Berlin definition.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "P/F Ratio",
            subtitle: "PaO₂ ÷ FiO₂ — ARDS severity"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "PaO₂", unit: "mmHg", value: $pao2)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "FiO₂", unit: "%", value: $fio2Percent)
            }
            CalculatorResultDisplay(
                label: "P/F Ratio",
                value: result.map { String(format: "%.0f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "P/F = PaO₂ ÷ FiO₂   (FiO₂ as decimal)",
                notes: "Berlin definition of ARDS requires P/F ≤ 300 with PEEP or CPAP ≥ 5 cmH₂O, bilateral opacities, and respiratory failure not fully explained by cardiac failure or fluid overload. Room air = FiO₂ 21%. P/F alone does not diagnose ARDS — use the full Berlin criteria.",
                citations: [ardsBerlin, openrnRespiratory]
            )
        }
    }
}

// MARK: - Oxygenation Index

public struct OxygenationIndexCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "oxygenation-index", key: "fio2_pct") private var fio2Percent
    @CalcPersistedDouble(calculatorID: "oxygenation-index", key: "map_aw") private var meanAirwayPressure
    @CalcPersistedDouble(calculatorID: "oxygenation-index", key: "pao2") private var pao2

    private var result: Double? {
        guard let percent = fio2Percent, percent > 0,
              let map = meanAirwayPressure, map > 0,
              let p = pao2, p > 0 else { return nil }
        let fio2 = percent / 100.0
        return (fio2 * map * 100.0) / p
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let r = result else { return nil }
        if r >= 16 { return ("Severe pediatric ARDS range (OI ≥ 16) per PALICC.", .alert) }
        if r >= 8  { return ("Moderate pediatric ARDS range (OI 8–16) per PALICC.", .alert) }
        if r >= 4  { return ("Mild pediatric ARDS range (OI 4–8) per PALICC.", .caution) }
        return ("Below typical PALICC ARDS thresholds.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Oxygenation Index",
            subtitle: "Pediatric ARDS severity (PALICC)"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "FiO₂", unit: "%", value: $fio2Percent)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Mean airway pressure", unit: "cmH₂O", value: $meanAirwayPressure)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "PaO₂", unit: "mmHg", value: $pao2)
            }
            CalculatorResultDisplay(
                label: "OI",
                value: result.map { String(format: "%.1f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "OI = (FiO₂ × MAP × 100) ÷ PaO₂\n(FiO₂ as decimal; MAP = mean airway pressure)",
                notes: "PALICC pediatric ARDS thresholds: mild OI 4–8, moderate 8–16, severe ≥ 16 (intubated, invasively-ventilated patients). Use OSI instead in non-invasively ventilated patients per PALICC.",
                citations: [palicc, openrnRespiratory]
            )
        }
    }
}
