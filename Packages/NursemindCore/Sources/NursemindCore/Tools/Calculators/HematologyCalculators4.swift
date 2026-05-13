import SwiftUI

private let khorana2008 = CitationSource(
    id: "khorana_2008",
    shortName: "Khorana Score — Khorana AA et al., Blood 2008 (concept citation)",
    detail: "Validated risk model for chemotherapy-associated venous thromboembolism in ambulatory cancer patients",
    publisher: "Blood",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/18006700/",
    lastRetrieved: "2026-05-05"
)

private let openrnHeme4 = CitationSource(
    id: "openrn_heme_4",
    shortName: "Open RN Health Alterations — VTE in Cancer",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cancer+VTE+thromboprophylaxis",
    lastRetrieved: "2026-05-05"
)

// MARK: - Khorana Score

public struct KhoranaCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "khorana", key: "site")     private var siteID
    @CalcPersistedBool(calculatorID: "khorana", key: "pltGE350")     private var pltGE350
    @CalcPersistedBool(calculatorID: "khorana", key: "lowHgb")       private var lowHgb
    @CalcPersistedBool(calculatorID: "khorana", key: "wbcGT11")      private var wbcGT11
    @CalcPersistedBool(calculatorID: "khorana", key: "bmiGE35")      private var bmiGE35

    private var site: CalculatorScoreRow.Option? { siteOpts.first { $0.id == siteID } }

    private let siteOpts: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Other (not listed below)",                                      score: 0),
        .init(id: 1, label: "High risk (lung, lymphoma, gynecologic, bladder, testicular)",  score: 1),
        .init(id: 2, label: "Very high risk (pancreas, stomach)",                            score: 2)
    ]

    private var total: Int? {
        guard let s = site else { return nil }
        var t = s.score
        if pltGE350 { t += 1 }
        if lowHgb   { t += 1 }
        if wbcGT11  { t += 1 }
        if bmiGE35  { t += 1 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 3 { return ("Khorana ≥ 3 — high-VTE-risk band per Khorana 2008; published 2.5-month VTE rate ≈ 7.1% in derivation cohort.", .alert) }
        if s >= 1 { return ("Khorana 1–2 — intermediate-risk band; published 2.5-month VTE rate ≈ 2.0%.", .caution) }
        return ("Khorana 0 — low-risk band; published 2.5-month VTE rate ≈ 0.5%.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hematology.eyebrowName,
            title: "Khorana",
            subtitle: "Chemotherapy-associated VTE risk"
        ) {
            CalculatorSection("CANCER SITE") {
                CalculatorScoreRow(label: "Site", options: siteOpts, selection: $siteID.option(in: siteOpts))
            }
            CalculatorSection("LABS · BMI") {
                Toggle("Pre-chemo platelet count ≥ 350 ×10⁹/L (+1)",                       isOn: $pltGE350).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Hemoglobin < 10 g/dL OR using erythropoiesis-stimulating agent (+1)", isOn: $lowHgb).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Pre-chemo WBC > 11 ×10⁹/L (+1)",                                    isOn: $wbcGT11).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("BMI ≥ 35 kg/m² (+1)",                                                isOn: $bmiGE35).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "Khorana",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 weighted variables. Range 0–6.\nLow: 0  ·  Intermediate: 1–2  ·  High: ≥ 3.",
                notes: "Validated for ambulatory cancer patients starting chemotherapy. ASCO 2019 and ITAC 2022 guidelines reference Khorana ≥ 2 as the published threshold for considering primary thromboprophylaxis with apixaban or rivaroxaban in selected outpatients (CASSINI / AVERT trials). Original derivation used the ≥ 3 cutoff.",
                citations: [khorana2008, openrnHeme4]
            )
        }
    }
}
