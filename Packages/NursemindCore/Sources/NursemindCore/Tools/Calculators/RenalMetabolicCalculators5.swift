import SwiftUI

private let kdigo2012Aki = CitationSource(
    id: "kdigo_2012_aki",
    shortName: "KDIGO Clinical Practice Guideline for Acute Kidney Injury, 2012 (concept citation)",
    detail: "International consensus AKI definition and 3-stage severity classification (replaces RIFLE / AKIN)",
    publisher: "Kidney Disease Improving Global Outcomes",
    license: .factCitationOnly,
    url: "https://kdigo.org/guidelines/acute-kidney-injury/",
    lastRetrieved: "2026-05-04"
)

private let openrnRenal5 = CitationSource(
    id: "openrn_renal_5",
    shortName: "Open RN Health Alterations — Acute Kidney Injury",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=AKI+kidney+injury",
    lastRetrieved: "2026-05-04"
)

// MARK: - KDIGO AKI staging

public struct KDIGOAKICalculatorView: View {
    @CalcPersistedDouble(calculatorID: "kdigo-aki", key: "baseline_cr") private var baselineCr
    @CalcPersistedDouble(calculatorID: "kdigo-aki", key: "current_cr")  private var currentCr
    @CalcPersistedBool(calculatorID: "kdigo-aki",   key: "rrt")         private var initiatedRRT
    @CalcPersistedOptionID(calculatorID: "kdigo-aki", key: "uoStage") private var uoStageID
    private var uoStage: CalculatorScoreRow.Option? { uoOpts.first { $0.id == uoStageID } }

    private let uoOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 0.5 mL/kg/h or not measured",                        score: 0),
        .init(id: 1, label: "< 0.5 mL/kg/h for 6–12 hours",                         score: 1),
        .init(id: 2, label: "< 0.5 mL/kg/h for ≥ 12 hours",                         score: 2),
        .init(id: 3, label: "< 0.3 mL/kg/h for ≥ 24 hours OR anuria for ≥ 12 hours", score: 3)
    ]

    private var crStage: Int? {
        guard let c = currentCr, c > 0 else { return nil }
        if initiatedRRT { return 3 }
        if c >= 4.0 { return 3 }
        guard let b = baselineCr, b > 0 else { return nil }
        let ratio = c / b
        if ratio >= 3.0 { return 3 }
        if ratio >= 2.0 { return 2 }
        if ratio >= 1.5 { return 1 }
        // Δ ≥ 0.3 mg/dL within 48h is also Stage 1; we approximate as a fallback if delta criterion is met
        if (c - b) >= 0.3 { return 1 }
        return 0
    }

    private var stage: Int? {
        let cr = crStage
        let uo = uoStage?.score
        if cr == nil && uo == nil { return nil }
        return max(cr ?? 0, uo ?? 0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = stage else { return nil }
        switch s {
        case 0: return ("No KDIGO AKI criteria met at this assessment.", .neutral)
        case 1: return ("KDIGO Stage 1 AKI — published in-hospital mortality ≈ 1.7× the no-AKI baseline in pooled validation cohorts.", .caution)
        case 2: return ("KDIGO Stage 2 AKI — published in-hospital mortality ≈ 4× the no-AKI baseline.", .alert)
        default: return ("KDIGO Stage 3 AKI — published in-hospital mortality ≈ 7× the no-AKI baseline; includes patients receiving RRT or with SCr ≥ 4.0 mg/dL.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.renalMetabolic.eyebrowName,
            title: "KDIGO AKI",
            subtitle: "AKI severity staging"
        ) {
            CalculatorSection("CREATININE") {
                CalculatorNumberField(label: "Baseline serum Cr", unit: "mg/dL", value: $baselineCr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Current serum Cr",  unit: "mg/dL", value: $currentCr)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Renal replacement therapy initiated", isOn: $initiatedRRT).toggleStyle(.switch)
            }
            CalculatorSection("URINE OUTPUT") {
                CalculatorScoreRow(label: "Urine output threshold met", options: uoOpts, selection: $uoStageID.option(in: uoOpts))
            }
            CalculatorResultDisplay(
                label: "KDIGO Stage",
                value: stage.map { $0 == 0 ? "No AKI" : "Stage \($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Stage 1 — SCr 1.5–1.9× baseline (within 7 days) OR ΔSCr ≥ 0.3 mg/dL (within 48 h) OR UO < 0.5 mL/kg/h × 6–12 h\nStage 2 — SCr 2.0–2.9× baseline OR UO < 0.5 mL/kg/h × ≥ 12 h\nStage 3 — SCr ≥ 3.0× baseline OR SCr ≥ 4.0 mg/dL OR initiation of RRT OR UO < 0.3 mL/kg/h × ≥ 24 h OR anuria × ≥ 12 h\nFinal stage = highest of the creatinine and urine-output criteria.",
                notes: "KDIGO is the current international consensus definition (2012) — replaces RIFLE and AKIN. Baseline SCr should reflect a stable pre-illness value within the last year; if unavailable, use the lowest SCr in the current admission as a surrogate. Urine output is the more sensitive criterion in oliguric patients but requires accurate weight-based per-hour tracking.",
                citations: [kdigo2012Aki, openrnRenal5]
            )
        }
    }
}
