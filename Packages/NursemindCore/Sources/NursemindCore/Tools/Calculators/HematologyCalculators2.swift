import SwiftUI

// MARK: - Shared citation sources

private let lo2006Hit4ts = CitationSource(
    id: "lo_2006_hit_4ts",
    shortName: "HIT 4Ts — Lo GK et al., J Thromb Haemost 2006 (concept citation)",
    detail: "Pretest probability score for heparin-induced thrombocytopenia",
    publisher: "Journal of Thrombosis & Haemostasis",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/16634744/",
    lastRetrieved: "2026-05-04"
)

private let cuker2012Hit4ts = CitationSource(
    id: "cuker_2012_hit_4ts_meta",
    shortName: "4Ts validation meta-analysis — Cuker A et al., Blood 2012 (concept citation)",
    detail: "Pooled NPV of low 4Ts ≈ 0.998 for HIT; intermediate / high require functional assay confirmation",
    publisher: "Blood",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/22802459/",
    lastRetrieved: "2026-05-04"
)

private let klastersky2000Mascc = CitationSource(
    id: "klastersky_2000_mascc",
    shortName: "MASCC Risk Index — Klastersky J et al., J Clin Oncol 2000 (concept citation)",
    detail: "Identifies low-risk febrile neutropenia (≥ 21) suitable for outpatient management in carefully selected patients",
    publisher: "Journal of Clinical Oncology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10944147/",
    lastRetrieved: "2026-05-04"
)

private let openrnHeme2 = CitationSource(
    id: "openrn_heme_2",
    shortName: "Open RN Health Alterations — Hematology / Oncology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hematology+oncology+neutropenia",
    lastRetrieved: "2026-05-04"
)

// MARK: - HIT 4Ts

public struct HIT4TsCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "hit-4ts", key: "thrombocytopenia") private var thrombocytopeniaID
    @CalcPersistedOptionID(calculatorID: "hit-4ts", key: "timing")           private var timingID
    @CalcPersistedOptionID(calculatorID: "hit-4ts", key: "thrombosis")       private var thrombosisID
    @CalcPersistedOptionID(calculatorID: "hit-4ts", key: "otherCauses")      private var otherCausesID

    private var thrombocytopenia: CalculatorScoreRow.Option? { thrombocytopeniaOptions.first { $0.id == thrombocytopeniaID } }
    private var timing:           CalculatorScoreRow.Option? { timingOptions.first           { $0.id == timingID } }
    private var thrombosis:       CalculatorScoreRow.Option? { thrombosisOptions.first       { $0.id == thrombosisID } }
    private var otherCauses:      CalculatorScoreRow.Option? { otherCausesOptions.first      { $0.id == otherCausesID } }

    private let thrombocytopeniaOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 30% drop OR nadir < 10 ×10⁹/L",                score: 0),
        .init(id: 1, label: "30–50% drop OR nadir 10–19 ×10⁹/L",              score: 1),
        .init(id: 2, label: "> 50% drop AND nadir 20–100 ×10⁹/L",             score: 2)
    ]
    private let timingOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Drop < 4 days, no recent heparin",                                      score: 0),
        .init(id: 1, label: "Drop > 10 days OR ≤ 1 day with heparin exposure 30–100 days prior",     score: 1),
        .init(id: 2, label: "Drop 5–10 days OR ≤ 1 day with heparin exposure ≤ 30 days prior",       score: 2)
    ]
    private let thrombosisOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "None",                                                          score: 0),
        .init(id: 1, label: "Progressive/recurrent thrombosis OR non-necrotizing skin lesion", score: 1),
        .init(id: 2, label: "Confirmed new thrombosis, skin necrosis, or anaphylactoid reaction", score: 2)
    ]
    private let otherCausesOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Definite other cause",  score: 0),
        .init(id: 1, label: "Possible other cause",  score: 1),
        .init(id: 2, label: "None apparent",         score: 2)
    ]

    private var total: Int? {
        guard let a = thrombocytopenia, let b = timing, let c = thrombosis, let d = otherCauses else { return nil }
        return a.score + b.score + c.score + d.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 6 { return ("4Ts 6–8 — high pretest probability of HIT (Cuker 2012 PPV ≈ 64% in pooled data; functional/immunoassay confirmation indicated).", .alert) }
        if s >= 4 { return ("4Ts 4–5 — intermediate pretest probability (PPV ≈ 14%); HIT cannot be excluded by 4Ts alone.", .caution) }
        return ("4Ts 0–3 — low pretest probability (Cuker 2012 NPV ≈ 99.8%); HIT is unlikely on score alone.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hematology.eyebrowName,
            title: "HIT 4Ts",
            subtitle: "Heparin-induced thrombocytopenia pretest probability"
        ) {
            CalculatorSection("CRITERIA") {
                CalculatorScoreRow(label: "Thrombocytopenia",   options: thrombocytopeniaOptions, selection: $thrombocytopeniaID.option(in: thrombocytopeniaOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Timing of platelet drop", options: timingOptions,      selection: $timingID.option(in: timingOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Thrombosis or sequelae", options: thrombosisOptions,   selection: $thrombosisID.option(in: thrombosisOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Other causes for thrombocytopenia", options: otherCausesOptions, selection: $otherCausesID.option(in: otherCausesOptions))
            }
            CalculatorResultDisplay(
                label: "4Ts",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 4 categorical variables (each 0–2 points). Range 0–8.\nLow: 0–3  ·  Intermediate: 4–5  ·  High: 6–8.",
                notes: "4Ts is a clinical pretest probability tool — laboratory testing (PF4 immunoassay and confirmatory functional assay) is required for diagnosis. The very high NPV of a low 4Ts is the score's most useful property — it supports continuing heparin while waiting on labs in low-risk patients. Intermediate/high scores generally trigger heparin discontinuation pending workup per ASH 2018 guidelines.",
                citations: [lo2006Hit4ts, cuker2012Hit4ts, openrnHeme2]
            )
        }
    }
}

// MARK: - MASCC

public struct MASCCCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "mascc", key: "burden") private var burdenID
    private var burden: CalculatorScoreRow.Option? { burdenOptions.first { $0.id == burdenID } }
    @CalcPersistedBool(calculatorID: "mascc", key: "hypotension")      private var hypotension
    @CalcPersistedBool(calculatorID: "mascc", key: "noCOPD")           private var noCOPD
    @CalcPersistedBool(calculatorID: "mascc", key: "solidOrNoFungal")  private var solidOrNoFungal
    @CalcPersistedBool(calculatorID: "mascc", key: "noDehydration")    private var noDehydration
    @CalcPersistedBool(calculatorID: "mascc", key: "outpatient")       private var outpatient
    @CalcPersistedBool(calculatorID: "mascc", key: "ageUnder60")       private var ageUnder60

    private let burdenOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No or mild symptoms",      score: 5),
        .init(id: 1, label: "Moderate symptoms",        score: 3),
        .init(id: 2, label: "Severe / moribund",        score: 0)
    ]

    private var total: Int? {
        guard let b = burden else { return nil }
        var t = b.score
        if hypotension       { t += 5 }
        if noCOPD            { t += 4 }
        if solidOrNoFungal   { t += 4 }
        if noDehydration     { t += 3 }
        if outpatient        { t += 3 }
        if ageUnder60        { t += 2 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 21 {
            return ("MASCC ≥ 21 — low risk for serious complications (Klastersky 2000 PPV ≈ 91%, NPV ≈ 36%); some patients may be candidates for oral antibiotics and outpatient management per IDSA 2018 in carefully selected cases.", .neutral)
        }
        return ("MASCC < 21 — high risk for serious complications; published 30-day mortality ≈ 14% in derivation cohort.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hematology.eyebrowName,
            title: "MASCC",
            subtitle: "Febrile neutropenia risk index"
        ) {
            CalculatorSection("CLINICAL") {
                CalculatorScoreRow(label: "Burden of illness", options: burdenOptions, selection: $burdenID.option(in: burdenOptions))
                Hairline(color: NMColor.borderSubtle)
                Toggle("No hypotension (SBP > 90 mmHg) (+5)",                    isOn: $hypotension).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("No active COPD (+4)",                                    isOn: $noCOPD).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Solid tumor or no previous fungal infection (+4)",       isOn: $solidOrNoFungal).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("No dehydration requiring parenteral fluids (+3)",        isOn: $noDehydration).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Outpatient status at fever onset (+3)",                  isOn: $outpatient).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Age < 60 (+2)",                                          isOn: $ageUnder60).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "MASCC",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 7 weighted variables. Maximum 26.\n≥ 21 = low risk  ·  < 21 = high risk.",
                notes: "MASCC identifies LOW-RISK febrile neutropenic patients (with cancer-related fever and ANC < 500) who may be candidates for outpatient oral antibiotic therapy. It does not determine antibiotic choice. Score is calculated at fever onset, not later. Validated only in adults with cancer-related neutropenia.",
                citations: [klastersky2000Mascc, openrnHeme2]
            )
        }
    }
}

// MARK: - Corrected Reticulocyte Count

public struct CorrectedReticCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "corrected-retic", key: "retic_pct") private var reticPct
    @CalcPersistedDouble(calculatorID: "corrected-retic", key: "hct")       private var hct

    private var corrected: Double? {
        guard let r = reticPct, let h = hct, h > 0 else { return nil }
        return r * (h / 45.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let v = corrected else { return nil }
        if v < 2 { return ("Corrected reticulocyte < 2% — typically inadequate marrow response for the degree of anemia.", .caution) }
        if v <= 6 { return ("Corrected reticulocyte 2–6% — appropriate marrow response (e.g., bleeding, hemolysis, treatment of B12/iron deficiency).", .neutral) }
        return ("Corrected reticulocyte > 6% — vigorous marrow response.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hematology.eyebrowName,
            title: "Corrected Reticulocyte",
            subtitle: "Adjusts reticulocyte % for anemia"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Reticulocyte", unit: "%", value: $reticPct)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Hematocrit",   unit: "%", value: $hct)
            }
            CalculatorResultDisplay(
                label: "Corrected retic",
                value: corrected.map { String(format: "%.2f", $0) },
                unit: "%",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Corrected retic % = Retic % × (Hct / 45)\n(45 = the assumed normal hematocrit reference value)",
                notes: "Raw reticulocyte percentage overstates marrow output in severe anemia because the denominator (RBC count) is small. Corrected count gives a fairer estimate of erythropoietic activity. For an even more accurate picture in severe anemia, the Reticulocyte Production Index (RPI) further divides by a maturation factor (1.0 → 2.5 depending on Hct).",
                citations: [openrnHeme2]
            )
        }
    }
}
