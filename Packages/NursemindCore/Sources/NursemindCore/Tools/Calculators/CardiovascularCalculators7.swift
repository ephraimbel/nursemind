import SwiftUI

private let granger2003Grace = CitationSource(
    id: "granger_2003_grace",
    shortName: "GRACE — Granger CB et al., Arch Intern Med 2003 (concept citation)",
    detail: "Logistic-regression model for in-hospital and 6-month mortality after acute coronary syndromes",
    publisher: "Archives of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/14581255/",
    lastRetrieved: "2026-05-05"
)

private let escAcsGuide = CitationSource(
    id: "esc_acs_2023_grace",
    shortName: "ESC ACS Guidelines 2023 — GRACE risk-stratification endorsement (concept citation)",
    detail: "ESC continues to endorse GRACE 2.0 as the recommended risk score for ACS prognosis",
    publisher: "European Society of Cardiology",
    license: .factCitationOnly,
    url: "https://www.escardio.org/Guidelines/Clinical-Practice-Guidelines/ACS-Guidelines",
    lastRetrieved: "2026-05-05"
)

private let openrnCardio7 = CitationSource(
    id: "openrn_cardio_7",
    shortName: "Open RN Health Alterations — Acute Coronary Syndromes",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=acute+coronary+syndrome",
    lastRetrieved: "2026-05-05"
)

// MARK: - GRACE

public struct GRACECalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "grace", key: "ageBand")    private var ageBandID
    @CalcPersistedOptionID(calculatorID: "grace", key: "hrBand")     private var hrBandID
    @CalcPersistedOptionID(calculatorID: "grace", key: "sbpBand")    private var sbpBandID
    @CalcPersistedOptionID(calculatorID: "grace", key: "crBand")     private var crBandID
    @CalcPersistedOptionID(calculatorID: "grace", key: "killipClass") private var killipClassID
    @CalcPersistedBool(calculatorID: "grace", key: "cardiacArrest")  private var cardiacArrest
    @CalcPersistedBool(calculatorID: "grace", key: "stDeviation")    private var stDeviation
    @CalcPersistedBool(calculatorID: "grace", key: "abnEnzymes")     private var abnEnzymes

    private var ageBand:    CalculatorScoreRow.Option? { ageOptions.first    { $0.id == ageBandID } }
    private var hrBand:     CalculatorScoreRow.Option? { hrOptions.first     { $0.id == hrBandID } }
    private var sbpBand:    CalculatorScoreRow.Option? { sbpOptions.first    { $0.id == sbpBandID } }
    private var crBand:     CalculatorScoreRow.Option? { crOptions.first     { $0.id == crBandID } }
    private var killipClass: CalculatorScoreRow.Option? { killipOptions.first { $0.id == killipClassID } }

    private let ageOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 30 years",    score: 0),
        .init(id: 1, label: "30–39",         score: 8),
        .init(id: 2, label: "40–49",         score: 25),
        .init(id: 3, label: "50–59",         score: 41),
        .init(id: 4, label: "60–69",         score: 58),
        .init(id: 5, label: "70–79",         score: 75),
        .init(id: 6, label: "80–89",         score: 91),
        .init(id: 7, label: "≥ 90",          score: 100)
    ]
    private let hrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 50 bpm",     score: 0),
        .init(id: 1, label: "50–69",        score: 3),
        .init(id: 2, label: "70–89",        score: 9),
        .init(id: 3, label: "90–109",       score: 15),
        .init(id: 4, label: "110–149",      score: 24),
        .init(id: 5, label: "150–199",      score: 38),
        .init(id: 6, label: "≥ 200",        score: 46)
    ]
    private let sbpOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 80 mmHg",    score: 58),
        .init(id: 1, label: "80–99",        score: 53),
        .init(id: 2, label: "100–119",      score: 43),
        .init(id: 3, label: "120–139",      score: 34),
        .init(id: 4, label: "140–159",      score: 24),
        .init(id: 5, label: "160–199",      score: 10),
        .init(id: 6, label: "≥ 200",        score: 0)
    ]
    private let crOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "0–0.39 mg/dL",  score: 1),
        .init(id: 1, label: "0.40–0.79",     score: 4),
        .init(id: 2, label: "0.80–1.19",     score: 7),
        .init(id: 3, label: "1.20–1.59",     score: 10),
        .init(id: 4, label: "1.60–1.99",     score: 13),
        .init(id: 5, label: "2.00–3.99",     score: 21),
        .init(id: 6, label: "≥ 4.00",        score: 28)
    ]
    private let killipOptions: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "Class I — no CHF signs",            score: 0),
        .init(id: 2, label: "Class II — rales / S3 / elevated JVP", score: 20),
        .init(id: 3, label: "Class III — frank pulmonary edema",  score: 39),
        .init(id: 4, label: "Class IV — cardiogenic shock",       score: 59)
    ]

    private var total: Int? {
        guard let a = ageBand, let h = hrBand, let s = sbpBand,
              let c = crBand, let k = killipClass else { return nil }
        var t = a.score + h.score + s.score + c.score + k.score
        if cardiacArrest { t += 39 }
        if stDeviation   { t += 28 }
        if abnEnzymes    { t += 14 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s > 140 { return ("GRACE > 140 — high-risk band per Granger 2003 derivation; published in-hospital mortality > 3% (and 6-month mortality > 8% at GRACE > 118).", .alert) }
        if s >= 109 { return ("GRACE 109–140 — intermediate-risk band; published in-hospital mortality 1–3%.", .caution) }
        return ("GRACE ≤ 108 — low-risk band; published in-hospital mortality < 1%.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "GRACE",
            subtitle: "ACS in-hospital + 6-month mortality"
        ) {
            CalculatorSection("DEMOGRAPHICS") {
                CalculatorScoreRow(label: "Age",            options: ageOptions, selection: $ageBandID.option(in: ageOptions))
            }
            CalculatorSection("VITAL SIGNS") {
                CalculatorScoreRow(label: "Heart rate",     options: hrOptions,  selection: $hrBandID.option(in: hrOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Systolic BP",    options: sbpOptions, selection: $sbpBandID.option(in: sbpOptions))
            }
            CalculatorSection("LABS · CLINICAL") {
                CalculatorScoreRow(label: "Creatinine",      options: crOptions,     selection: $crBandID.option(in: crOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Killip class",    options: killipOptions, selection: $killipClassID.option(in: killipOptions))
                Hairline(color: NMColor.borderSubtle)
                Toggle("Cardiac arrest at admission (+39)", isOn: $cardiacArrest).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("ST-segment deviation on ECG (+28)", isOn: $stDeviation).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Abnormal cardiac enzymes (+14)",     isOn: $abnEnzymes).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "GRACE",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of point values across 5 banded variables + 3 binary risk factors. Range 0–372.\nIn-hospital strata: ≤ 108 low  ·  109–140 intermediate  ·  > 140 high.\n6-month strata: ≤ 88 low  ·  89–118 intermediate  ·  > 118 high.",
                notes: "ESC continues to endorse GRACE (2.0) as the recommended risk score for ACS prognosis. The 'banded' point lookup approximates the published logistic-regression nomogram. For peri-operative risk and TIMI-applicable populations, pair with TIMI or HEART in the chest-pain workup.",
                citations: [granger2003Grace, escAcsGuide, openrnCardio7]
            )
        }
    }
}
