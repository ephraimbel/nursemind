import SwiftUI

private let leGal2006Geneva = CitationSource(
    id: "le_gal_2006_geneva",
    shortName: "Revised Geneva Score — Le Gal G et al., Ann Intern Med 2006 (concept citation)",
    detail: "Standardized clinical decision rule for pulmonary embolism pretest probability — fully objective (no gestalt component vs. Wells)",
    publisher: "Annals of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/16461960/",
    lastRetrieved: "2026-05-05"
)

private let openrnResp7 = CitationSource(
    id: "openrn_resp_7",
    shortName: "Open RN Health Alterations — Pulmonary Embolism",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=pulmonary+embolism",
    lastRetrieved: "2026-05-05"
)

// MARK: - Revised Geneva PE Score

public struct GenevaPECalculatorView: View {
    @CalcPersistedBool(calculatorID: "geneva-pe", key: "ageGE65")        private var ageGE65
    @CalcPersistedBool(calculatorID: "geneva-pe", key: "priorVTE")       private var priorVTE
    @CalcPersistedBool(calculatorID: "geneva-pe", key: "surgeryFracture") private var surgeryFracture
    @CalcPersistedBool(calculatorID: "geneva-pe", key: "activeMalignancy") private var activeMalignancy
    @CalcPersistedBool(calculatorID: "geneva-pe", key: "unilateralLegPain") private var unilateralLegPain
    @CalcPersistedBool(calculatorID: "geneva-pe", key: "hemoptysis")     private var hemoptysis
    @CalcPersistedOptionID(calculatorID: "geneva-pe", key: "hrBand")     private var hrBandID
    @CalcPersistedBool(calculatorID: "geneva-pe", key: "painOnPalpation") private var painOnPalpation

    private var hrBand: CalculatorScoreRow.Option? { hrOptions.first { $0.id == hrBandID } }

    private let hrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 75 bpm",     score: 0),
        .init(id: 1, label: "75–94 bpm",    score: 3),
        .init(id: 2, label: "≥ 95 bpm",     score: 5)
    ]

    private var total: Int? {
        guard let h = hrBand else { return nil }
        var t = h.score
        if ageGE65            { t += 1 }
        if priorVTE           { t += 3 }
        if surgeryFracture    { t += 2 }
        if activeMalignancy   { t += 2 }
        if unilateralLegPain  { t += 3 }
        if hemoptysis         { t += 2 }
        if painOnPalpation    { t += 4 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 11 { return ("Geneva ≥ 11 — high PE pretest probability per Le Gal 2006; published prevalence ≈ 64% in the original validation cohort.", .alert) }
        if s >= 4  { return ("Geneva 4–10 — intermediate PE pretest probability; published prevalence ≈ 28%.", .caution) }
        return ("Geneva 0–3 — low PE pretest probability; published prevalence ≈ 8%.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.respiratory.eyebrowName,
            title: "Geneva PE",
            subtitle: "PE pretest probability · revised score"
        ) {
            CalculatorSection("HISTORY") {
                Toggle("Age ≥ 65 (+1)",                                                isOn: $ageGE65).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Previous DVT or PE (+3)",                                       isOn: $priorVTE).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Surgery (general anesthesia) or fracture (lower limb) within 1 mo (+2)", isOn: $surgeryFracture).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Active malignancy (within 1 yr or ongoing treatment) (+2)",      isOn: $activeMalignancy).toggleStyle(.switch)
            }
            CalculatorSection("SYMPTOMS") {
                Toggle("Unilateral lower-limb pain (+3)",                                isOn: $unilateralLegPain).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Hemoptysis (+2)",                                                isOn: $hemoptysis).toggleStyle(.switch)
            }
            CalculatorSection("CLINICAL") {
                CalculatorScoreRow(label: "Heart rate", options: hrOptions, selection: $hrBandID.option(in: hrOptions))
                Hairline(color: NMColor.borderSubtle)
                Toggle("Pain on lower-limb deep palpation AND unilateral edema (+4)",     isOn: $painOnPalpation).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "Geneva",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of weighted variables. Range 0–24.\nLow: 0–3  ·  Intermediate: 4–10  ·  High: ≥ 11.",
                notes: "Fully objective (no clinician-gestalt component vs. Wells) — better inter-rater reliability in published comparisons. PE prevalence in the validation cohort: 8% / 28% / 64% across the three bands. Pair with D-dimer in low/intermediate bands per ESC 2019 PE algorithm; CT-PA is the standard imaging in high-probability bands.",
                citations: [leGal2006Geneva, openrnResp7]
            )
        }
    }
}
