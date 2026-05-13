import SwiftUI

// MARK: - Shared citation sources

private let ancRef = CitationSource(
    id: "anc_calc_ref",
    shortName: "Absolute Neutrophil Count — standard formula",
    detail: "ANC = WBC × (segmented neutrophils % + bands %) ÷ 100",
    publisher: "Open RN Health Alterations / NCI Common Terminology",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hematology+coagulation+blood",
    lastRetrieved: "2026-05-04"
)

private let nciNeutropenia = CitationSource(
    id: "nci_neutropenia_ctcae",
    shortName: "NCI CTCAE — Neutropenia grading (concept citation)",
    detail: "Grade 3: ANC 500–999; Grade 4: ANC < 500 per CTCAE v5",
    publisher: "National Cancer Institute",
    license: .publicDomain,
    url: "https://ctep.cancer.gov/protocoldevelopment/electronic_applications/ctc.htm",
    lastRetrieved: "2026-05-04"
)

private let openrnHeme = CitationSource(
    id: "openrn_heme",
    shortName: "Open RN Health Alterations — Hematology / Oncology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hematology+coagulation+blood",
    lastRetrieved: "2026-05-04"
)

// MARK: - ANC

public struct ANCCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "anc", key: "wbc")   private var wbc       // K/µL
    @CalcPersistedDouble(calculatorID: "anc", key: "segs")  private var segs      // % segmented
    @CalcPersistedDouble(calculatorID: "anc", key: "bands") private var bands     // % bands

    private var anc: Double? {
        guard let wbc, wbc > 0,
              let segs, segs >= 0,
              let bands, bands >= 0 else { return nil }
        // wbc in K/µL × (% / 100) × 1000 → cells/µL
        return wbc * (segs + bands) * 10.0
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let a = anc else { return nil }
        if a < 100 {
            return ("ANC < 100 cells/µL — profound neutropenia. Below the CTCAE grade 4 threshold; published infection risk is the highest band.", .alert)
        }
        if a < 500 {
            return ("ANC < 500 cells/µL — CTCAE grade 4 / severe neutropenia. IDSA defines febrile neutropenia at this band as a recognized clinical emergency in published guidelines.", .alert)
        }
        if a < 1000 {
            return ("ANC 500–999 cells/µL — CTCAE grade 3 / moderate neutropenia.", .alert)
        }
        if a < 1500 {
            return ("ANC 1000–1499 cells/µL — CTCAE grade 2 / mild neutropenia.", .caution)
        }
        return ("ANC ≥ 1500 cells/µL — within typical adult range (CTCAE grade 0).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hematology.eyebrowName,
            title: "ANC",
            subtitle: "Absolute neutrophil count"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "WBC", unit: "K/µL", value: $wbc)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Segmented neutrophils", unit: "%", value: $segs)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Bands",                 unit: "%", value: $bands)
            }
            CalculatorResultDisplay(
                label: "ANC",
                value: anc.map { String(format: "%.0f", $0) },
                unit: "cells/µL",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "ANC = WBC × (segs % + bands %) ÷ 100\n(WBC in cells/µL — multiply K/µL by 1000)",
                notes: "Used to assess infection risk in chemotherapy, transplant, and other neutropenic patients. Per CTCAE v5: Grade 1 < 1500, Grade 2 < 1000, Grade 3 < 500, Grade 4 < 100. IDSA 2018 defines febrile neutropenia as single oral temp ≥ 38.3°C or sustained ≥ 38°C for 1 hour with ANC < 500 (or expected to drop) — recognized in published guidelines as a clinical emergency. Pair with MASCC for outpatient-eligibility risk stratification.",
                citations: [ancRef, nciNeutropenia, openrnHeme]
            )
        }
    }
}
