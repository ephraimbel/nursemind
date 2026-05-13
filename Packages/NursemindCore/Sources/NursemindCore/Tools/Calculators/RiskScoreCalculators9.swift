import SwiftUI

private let knaus1985Apache = CitationSource(
    id: "knaus_1985_apache_ii",
    shortName: "APACHE II — Knaus WA et al., Crit Care Med 1985 (concept citation)",
    detail: "Acute Physiology and Chronic Health Evaluation II — the standard ICU mortality-prediction model",
    publisher: "Critical Care Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/3928249/",
    lastRetrieved: "2026-05-05"
)

private let posner2011Cssrs = CitationSource(
    id: "posner_2011_cssrs",
    shortName: "C-SSRS — Posner K et al., Am J Psychiatry 2011 (concept citation)",
    detail: "Columbia Suicide Severity Rating Scale — validated suicide-risk assessment with FDA-recognized scoring",
    publisher: "American Journal of Psychiatry",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/22193671/",
    lastRetrieved: "2026-05-05"
)

private let openrnRisk9 = CitationSource(
    id: "openrn_risk_9",
    shortName: "Open RN Health Alterations & Mental Health — ICU Severity / Suicide Risk",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=ICU+APACHE+suicide",
    lastRetrieved: "2026-05-05"
)

// MARK: - APACHE II

public struct APACHE2CalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "temp")    private var tempID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "map")     private var mapID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "hr")      private var hrID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "rr")      private var rrID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "oxy")     private var oxyID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "pH")      private var pHID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "na")      private var naID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "k")       private var kID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "cr")      private var crID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "hct")     private var hctID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "wbc")     private var wbcID
    @CalcPersistedDouble(calculatorID: "apache-2", key: "gcs")       private var gcs
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "ageBand") private var ageBandID
    @CalcPersistedOptionID(calculatorID: "apache-2", key: "chronic") private var chronicID
    @CalcPersistedBool(calculatorID: "apache-2", key: "acuteRenalFailure") private var acuteRenalFailure

    private var temp: CalculatorScoreRow.Option? { tempOptions.first { $0.id == tempID } }
    private var map: CalculatorScoreRow.Option? { mapOptions.first  { $0.id == mapID } }
    private var hr:  CalculatorScoreRow.Option? { hrOptions.first   { $0.id == hrID } }
    private var rr:  CalculatorScoreRow.Option? { rrOptions.first   { $0.id == rrID } }
    private var oxy: CalculatorScoreRow.Option? { oxyOptions.first  { $0.id == oxyID } }
    private var pH:  CalculatorScoreRow.Option? { pHOptions.first   { $0.id == pHID } }
    private var na:  CalculatorScoreRow.Option? { naOptions.first   { $0.id == naID } }
    private var k:   CalculatorScoreRow.Option? { kOptions.first    { $0.id == kID } }
    private var cr:  CalculatorScoreRow.Option? { crOptions.first   { $0.id == crID } }
    private var hct: CalculatorScoreRow.Option? { hctOptions.first  { $0.id == hctID } }
    private var wbc: CalculatorScoreRow.Option? { wbcOptions.first  { $0.id == wbcID } }
    private var ageBand: CalculatorScoreRow.Option? { ageOptions.first    { $0.id == ageBandID } }
    private var chronic: CalculatorScoreRow.Option? { chronicOptions.first { $0.id == chronicID } }

    private let tempOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 41 °C",      score: 4),
        .init(id: 1, label: "39–40.9",      score: 3),
        .init(id: 2, label: "38.5–38.9",    score: 1),
        .init(id: 3, label: "36–38.4",      score: 0),
        .init(id: 4, label: "34–35.9",      score: 1),
        .init(id: 5, label: "32–33.9",      score: 2),
        .init(id: 6, label: "30–31.9",      score: 3),
        .init(id: 7, label: "≤ 29.9",       score: 4)
    ]
    private let mapOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 160 mmHg", score: 4),
        .init(id: 1, label: "130–159",    score: 3),
        .init(id: 2, label: "110–129",    score: 2),
        .init(id: 3, label: "70–109",     score: 0),
        .init(id: 4, label: "50–69",      score: 2),
        .init(id: 5, label: "≤ 49",       score: 4)
    ]
    private let hrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 180",  score: 4),
        .init(id: 1, label: "140–179", score: 3),
        .init(id: 2, label: "110–139", score: 2),
        .init(id: 3, label: "70–109",  score: 0),
        .init(id: 4, label: "55–69",   score: 2),
        .init(id: 5, label: "40–54",   score: 3),
        .init(id: 6, label: "≤ 39",    score: 4)
    ]
    private let rrOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 50",   score: 4),
        .init(id: 1, label: "35–49",  score: 3),
        .init(id: 2, label: "25–34",  score: 1),
        .init(id: 3, label: "12–24",  score: 0),
        .init(id: 4, label: "10–11",  score: 1),
        .init(id: 5, label: "6–9",    score: 2),
        .init(id: 6, label: "≤ 5",    score: 4)
    ]
    private let oxyOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "FiO₂ < 0.5: PaO₂ > 70 mmHg",                     score: 0),
        .init(id: 1, label: "FiO₂ < 0.5: PaO₂ 61–70",                          score: 1),
        .init(id: 2, label: "FiO₂ < 0.5: PaO₂ 55–60",                          score: 3),
        .init(id: 3, label: "FiO₂ < 0.5: PaO₂ < 55",                           score: 4),
        .init(id: 4, label: "FiO₂ ≥ 0.5: A-aO₂ < 200",                         score: 0),
        .init(id: 5, label: "FiO₂ ≥ 0.5: A-aO₂ 200–349",                       score: 2),
        .init(id: 6, label: "FiO₂ ≥ 0.5: A-aO₂ 350–499",                       score: 3),
        .init(id: 7, label: "FiO₂ ≥ 0.5: A-aO₂ ≥ 500",                         score: 4)
    ]
    private let pHOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 7.70",      score: 4),
        .init(id: 1, label: "7.60–7.69",   score: 3),
        .init(id: 2, label: "7.50–7.59",   score: 1),
        .init(id: 3, label: "7.33–7.49",   score: 0),
        .init(id: 4, label: "7.25–7.32",   score: 2),
        .init(id: 5, label: "7.15–7.24",   score: 3),
        .init(id: 6, label: "< 7.15",      score: 4)
    ]
    private let naOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 180 mEq/L", score: 4),
        .init(id: 1, label: "160–179",     score: 3),
        .init(id: 2, label: "155–159",     score: 2),
        .init(id: 3, label: "150–154",     score: 1),
        .init(id: 4, label: "130–149",     score: 0),
        .init(id: 5, label: "120–129",     score: 2),
        .init(id: 6, label: "111–119",     score: 3),
        .init(id: 7, label: "≤ 110",       score: 4)
    ]
    private let kOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 7.0 mEq/L", score: 4),
        .init(id: 1, label: "6.0–6.9",     score: 3),
        .init(id: 2, label: "5.5–5.9",     score: 1),
        .init(id: 3, label: "3.5–5.4",     score: 0),
        .init(id: 4, label: "3.0–3.4",     score: 1),
        .init(id: 5, label: "2.5–2.9",     score: 2),
        .init(id: 6, label: "< 2.5",       score: 4)
    ]
    private let crOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 3.5 mg/dL", score: 4),
        .init(id: 1, label: "2.0–3.4",     score: 3),
        .init(id: 2, label: "1.5–1.9",     score: 2),
        .init(id: 3, label: "0.6–1.4",     score: 0),
        .init(id: 4, label: "< 0.6",       score: 2)
    ]
    private let hctOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 60",     score: 4),
        .init(id: 1, label: "50–59.9",  score: 2),
        .init(id: 2, label: "46–49.9",  score: 1),
        .init(id: 3, label: "30–45.9",  score: 0),
        .init(id: 4, label: "20–29.9",  score: 2),
        .init(id: 5, label: "< 20",     score: 4)
    ]
    private let wbcOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≥ 40 ×10⁹/L", score: 4),
        .init(id: 1, label: "20–39.9",     score: 2),
        .init(id: 2, label: "15–19.9",     score: 1),
        .init(id: 3, label: "3–14.9",      score: 0),
        .init(id: 4, label: "1–2.9",       score: 2),
        .init(id: 5, label: "< 1",         score: 4)
    ]
    private let ageOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ 44 years",  score: 0),
        .init(id: 1, label: "45–54",       score: 2),
        .init(id: 2, label: "55–64",       score: 3),
        .init(id: 3, label: "65–74",       score: 5),
        .init(id: 4, label: "≥ 75",        score: 6)
    ]
    private let chronicOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No severe organ insufficiency / no immunocompromise", score: 0),
        .init(id: 1, label: "Severe organ failure / immunocompromised — elective post-op", score: 2),
        .init(id: 2, label: "Severe organ failure / immunocompromised — non-operative or emergency post-op", score: 5)
    ]

    private var apsTotal: Int? {
        let parts = [temp, map, hr, rr, oxy, pH, na, k, hct, wbc]
        guard parts.allSatisfy({ $0 != nil }), let cR = cr, let g = gcs else { return nil }
        var aps = parts.compactMap { $0?.score }.reduce(0, +)
        // Creatinine — double the points if acute renal failure
        aps += (acuteRenalFailure ? cR.score * 2 : cR.score)
        // GCS contributes 15 - actual GCS
        let gInt = max(3, min(15, Int(g.rounded())))
        aps += (15 - gInt)
        return aps
    }

    private var total: Int? {
        guard let aps = apsTotal, let a = ageBand, let c = chronic else { return nil }
        return aps + a.score + c.score
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        switch s {
        case ..<5:    return ("APACHE II 0–4 — published in-hospital mortality ≈ 4% (Knaus 1985 derivation cohort).", .neutral)
        case 5..<10:  return ("APACHE II 5–9 — published in-hospital mortality ≈ 8%.", .caution)
        case 10..<15: return ("APACHE II 10–14 — published in-hospital mortality ≈ 15%.", .caution)
        case 15..<20: return ("APACHE II 15–19 — published in-hospital mortality ≈ 25%.", .alert)
        case 20..<25: return ("APACHE II 20–24 — published in-hospital mortality ≈ 40%.", .alert)
        case 25..<30: return ("APACHE II 25–29 — published in-hospital mortality ≈ 55%.", .alert)
        case 30..<35: return ("APACHE II 30–34 — published in-hospital mortality ≈ 73%.", .alert)
        default:      return ("APACHE II ≥ 35 — published in-hospital mortality ≈ 85%.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "APACHE II",
            subtitle: "ICU mortality prediction · 12 physiology + age + chronic"
        ) {
            CalculatorSection("PHYSIOLOGY · WORST 24 H") {
                CalculatorScoreRow(label: "Temperature (rectal)", options: tempOptions, selection: $tempID.option(in: tempOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Mean arterial pressure", options: mapOptions, selection: $mapID.option(in: mapOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Heart rate", options: hrOptions, selection: $hrID.option(in: hrOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Respiratory rate", options: rrOptions, selection: $rrID.option(in: rrOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Oxygenation", options: oxyOptions, selection: $oxyID.option(in: oxyOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Arterial pH", options: pHOptions, selection: $pHID.option(in: pHOptions))
            }
            CalculatorSection("LABS") {
                CalculatorScoreRow(label: "Sodium", options: naOptions, selection: $naID.option(in: naOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Potassium", options: kOptions, selection: $kID.option(in: kOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Creatinine", options: crOptions, selection: $crID.option(in: crOptions))
                Hairline(color: NMColor.borderSubtle)
                Toggle("Acute renal failure (×2 creatinine points)", isOn: $acuteRenalFailure).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Hematocrit", options: hctOptions, selection: $hctID.option(in: hctOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "WBC", options: wbcOptions, selection: $wbcID.option(in: wbcOptions))
            }
            CalculatorSection("NEURO") {
                CalculatorNumberField(label: "GCS total (3–15)", value: $gcs)
            }
            CalculatorSection("AGE · CHRONIC HEALTH") {
                CalculatorScoreRow(label: "Age band", options: ageOptions, selection: $ageBandID.option(in: ageOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Chronic health status", options: chronicOptions, selection: $chronicID.option(in: chronicOptions))
            }
            CalculatorResultDisplay(
                label: "APACHE II",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "APS (sum of 12 physiologic variables, each 0–4) + Age points (0–6) + Chronic Health points (0/2/5).\nGCS contributes 15 − actual GCS. Range 0–71.",
                notes: "Use the WORST values from the first 24 hours of ICU admission. Creatinine points are DOUBLED if acute renal failure is present. Chronic Health points are added only when severe organ insufficiency or immunocompromise is documented before this admission. APACHE II is the most-cited general-ICU mortality model; SAPS II and APACHE III/IV are validated alternatives.",
                citations: [knaus1985Apache, openrnRisk9]
            )
        }
    }
}

// MARK: - C-SSRS (Screening Version)

public struct CSSRSCalculatorView: View {
    @CalcPersistedBool(calculatorID: "cssrs", key: "wishDead")        private var wishDead          // Q1
    @CalcPersistedBool(calculatorID: "cssrs", key: "nonspecific")     private var nonspecific       // Q2
    @CalcPersistedBool(calculatorID: "cssrs", key: "ideationNoIntent") private var ideationNoIntent // Q3
    @CalcPersistedBool(calculatorID: "cssrs", key: "ideationSomeIntent") private var ideationSomeIntent // Q4
    @CalcPersistedBool(calculatorID: "cssrs", key: "ideationPlanIntent") private var ideationPlanIntent // Q5
    @CalcPersistedBool(calculatorID: "cssrs", key: "behaviorEver")    private var behaviorEver      // Q6
    @CalcPersistedBool(calculatorID: "cssrs", key: "behaviorRecent")  private var behaviorRecent    // Q6 within 3 mo

    private enum RiskBand { case minimal, low, moderate, high, imminent }

    private var risk: RiskBand {
        if behaviorRecent || ideationPlanIntent { return .imminent }
        if behaviorEver || ideationSomeIntent   { return .high }
        if ideationNoIntent                     { return .moderate }
        if nonspecific                          { return .low }
        if wishDead                             { return .low }
        return .minimal
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch risk {
        case .minimal:
            return ("No suicide-risk items endorsed at this assessment.", .neutral)
        case .low:
            return ("Q1 or Q2 endorsed (passive ideation) — published low-risk band per C-SSRS triage framework.", .caution)
        case .moderate:
            return ("Q3 endorsed (active ideation, no intent or plan) — published moderate-risk band per C-SSRS.", .alert)
        case .high:
            return ("Q4 endorsed (active ideation with some intent, no plan) OR any lifetime suicidal behavior (Q6) — published high-risk band per C-SSRS.", .alert)
        case .imminent:
            return ("Q5 endorsed (active ideation with plan and intent) OR suicidal behavior within past 3 months (Q6 recent) — published imminent-risk band per C-SSRS triage framework.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "C-SSRS",
            subtitle: "Columbia Suicide Severity · screening version"
        ) {
            CalculatorSection("IDEATION — PAST 1 MONTH") {
                Toggle("1. Wish to be dead",                                                          isOn: $wishDead).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("2. Non-specific active suicidal thoughts",                                    isOn: $nonspecific).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("3. Active ideation with any methods (not plan), without intent to act",       isOn: $ideationNoIntent).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("4. Active ideation with some intent to act, without specific plan",           isOn: $ideationSomeIntent).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("5. Active ideation with specific plan AND intent",                            isOn: $ideationPlanIntent).toggleStyle(.switch)
            }
            CalculatorSection("BEHAVIOR — LIFETIME") {
                Toggle("6. Ever did, started, or prepared anything to end your life",                 isOn: $behaviorEver).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("    ↳ within past 3 months",                                                   isOn: $behaviorRecent).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "C-SSRS",
                value: {
                    switch risk {
                    case .minimal:  return "Minimal"
                    case .low:      return "Low"
                    case .moderate: return "Moderate"
                    case .high:     return "High"
                    case .imminent: return "Imminent"
                    }
                }(),
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "C-SSRS Screening triage logic per published Columbia framework:\n  • Q5 OR Q6-recent → Imminent risk\n  • Q4 OR Q6-ever → High risk\n  • Q3 → Moderate risk\n  • Q1 or Q2 only → Low risk\n  • None → Minimal",
                notes: "C-SSRS is the FDA-recognized standardized suicide-severity tool used across inpatient psych, ED, and primary care. The 'Screening' version (used here) covers ideation in the past month and lifetime/recent behavior; the 'Recent' version asks about ideation/behavior since last assessment. Pair with PHQ-9 item 9 in routine depression screening, but C-SSRS is the more specific risk-stratification tool. Always pair with a clinical interview for safety planning.",
                citations: [posner2011Cssrs, openrnRisk9]
            )
        }
    }
}
