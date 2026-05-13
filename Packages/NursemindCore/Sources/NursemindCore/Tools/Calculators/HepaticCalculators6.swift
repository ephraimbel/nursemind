import SwiftUI

private let wu2008Bisap = CitationSource(
    id: "wu_2008_bisap",
    shortName: "BISAP — Wu BU et al., Gut 2008 (concept citation)",
    detail: "5-criterion bedside index of severity in acute pancreatitis; predicts 24-hour and in-hospital mortality",
    publisher: "Gut",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/18519429/",
    lastRetrieved: "2026-05-04"
)

private let kim2021Meld3 = CitationSource(
    id: "kim_2021_meld_3",
    shortName: "MELD 3.0 — Kim WR et al., Gastroenterology 2021 (concept citation)",
    detail: "Updated MELD incorporating sex, albumin, and refit Na/Cr/INR/bili coefficients; OPTN-adopted June 2023",
    publisher: "Gastroenterology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/34481843/",
    lastRetrieved: "2026-05-04"
)

private let openrnHepatic6 = CitationSource(
    id: "openrn_hepatic_6",
    shortName: "Open RN Health Alterations — Pancreatitis & Cirrhosis",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=pancreatitis+cirrhosis+transplant",
    lastRetrieved: "2026-05-04"
)

// MARK: - BISAP

public struct BISAPCalculatorView: View {
    @CalcPersistedBool(calculatorID: "bisap", key: "bun25")     private var bun25
    @CalcPersistedBool(calculatorID: "bisap", key: "ams")       private var ams
    @CalcPersistedBool(calculatorID: "bisap", key: "sirs")      private var sirs
    @CalcPersistedBool(calculatorID: "bisap", key: "ageOver60") private var ageOver60
    @CalcPersistedBool(calculatorID: "bisap", key: "pleural")   private var pleural

    private var total: Int {
        [bun25, ams, sirs, ageOver60, pleural].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 3 {
            return ("BISAP ≥ 3 — published in-hospital mortality 5.3–22% (Wu 2008 derivation); identifies severe acute pancreatitis with substantial NPV.", .alert)
        }
        return ("BISAP 0–2 — published in-hospital mortality < 2% (Wu 2008 derivation cohort).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "BISAP",
            subtitle: "Acute pancreatitis severity · 24 h"
        ) {
            CalculatorSection("CRITERIA") {
                Toggle("BUN > 25 mg/dL",                                                  isOn: $bun25).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Impaired mental status (GCS < 15)",                              isOn: $ams).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("SIRS criteria met (≥ 2 of T, HR, RR, WBC abnormalities)",         isOn: $sirs).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Age > 60 years",                                                  isOn: $ageOver60).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Pleural effusion present on imaging",                             isOn: $pleural).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "BISAP",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 binary criteria scored within 24 hours of admission. Range 0–5.",
                notes: "Faster than Ranson (which requires 48-hour data) and APACHE II. BISAP is well validated for early severe-pancreatitis identification but is one of several available scoring tools (Ranson, APACHE II, modified Marshall) — institutions vary in which they use. Pair with imaging severity grading (CTSI / modified CTSI) for a complete picture.",
                citations: [wu2008Bisap, openrnHepatic6]
            )
        }
    }
}

// MARK: - MELD 3.0

public struct MELD3CalculatorView: View {
    @CalcPersistedDouble(calculatorID: "meld-3", key: "bili")    private var bilirubin
    @CalcPersistedDouble(calculatorID: "meld-3", key: "inr")     private var inr
    @CalcPersistedDouble(calculatorID: "meld-3", key: "cr")      private var creatinine
    @CalcPersistedDouble(calculatorID: "meld-3", key: "na")      private var sodium
    @CalcPersistedDouble(calculatorID: "meld-3", key: "albumin") private var albumin
    @CalcPersistedBool(calculatorID: "meld-3",   key: "female")  private var female
    @CalcPersistedBool(calculatorID: "meld-3",   key: "dialysis") private var dialysisTwiceInWeek

    private var meld3: Double? {
        guard var bili = bilirubin, var ratio = inr, var cr = creatinine,
              var na = sodium, var alb = albumin else { return nil }

        // OPTN MELD 3.0 lower-bounds and caps
        if bili < 1.0 { bili = 1.0 }
        if ratio < 1.0 { ratio = 1.0 }
        if cr < 1.0 { cr = 1.0 }
        if dialysisTwiceInWeek || cr > 3.0 { cr = 3.0 }
        if na < 125 { na = 125 }
        if na > 137 { na = 137 }
        if alb < 1.5 { alb = 1.5 }
        if alb > 3.5 { alb = 3.5 }

        let femaleAdj = female ? 1.33 : 0.0
        let raw =
            femaleAdj
            + 4.56 * log(bili)
            + 0.82 * (137.0 - na)
            - 0.24 * (137.0 - na) * log(bili)
            + 9.09 * log(ratio)
            + 11.14 * log(cr)
            + 1.85 * (3.5 - alb)
            - 1.83 * (3.5 - alb) * log(cr)
            + 6.0
        return min(max(raw, 6.0), 40.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = meld3 else { return nil }
        let r = Int(s.rounded())
        if r >= 40 { return ("MELD 3.0 ≥ 40 — capped per OPTN; highest transplant-priority band.", .alert) }
        if r >= 30 { return ("MELD 3.0 30–39 — high transplant priority per OPTN allocation policy.", .alert) }
        if r >= 20 { return ("MELD 3.0 20–29 — substantial transplant priority.", .alert) }
        if r >= 10 { return ("MELD 3.0 10–19 — moderate severity band.", .caution) }
        return ("MELD 3.0 6–9 — least severe; published 3-month survival exceeds 95% in most cohorts.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "MELD 3.0",
            subtitle: "OPTN allocation · adopted June 2023"
        ) {
            CalculatorSection("DEMOGRAPHICS") {
                Toggle("Female sex (+1.33)", isOn: $female).toggleStyle(.switch)
            }
            CalculatorSection("LABS") {
                CalculatorNumberField(label: "Bilirubin",  unit: "mg/dL", value: $bilirubin)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "INR",                       value: $inr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Creatinine", unit: "mg/dL", value: $creatinine)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Sodium",     unit: "mEq/L", value: $sodium)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Albumin",    unit: "g/dL",  value: $albumin)
                Hairline(color: NMColor.borderSubtle)
                Toggle("≥ 2 hemodialysis sessions in past 7 days", isOn: $dialysisTwiceInWeek).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "MELD 3.0",
                value: meld3.map { String(format: "%.0f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "MELD 3.0 = 1.33·(female) + 4.56·ln(bili) + 0.82·(137 − Na) − 0.24·(137 − Na)·ln(bili) + 9.09·ln(INR) + 11.14·ln(Cr) + 1.85·(3.5 − alb) − 1.83·(3.5 − alb)·ln(Cr) + 6\nLower-bounds: bili/INR/Cr ≥ 1.0; albumin ≥ 1.5; Na clamped 125–137; albumin capped 3.5; Cr capped 3.0; result floored 6, capped 40.",
                notes: "MELD 3.0 was OPTN-adopted June 2023 and replaces MELD-Na for adult liver-transplant allocation in the U.S. The female-sex adjustment + albumin term were added to address documented disparities in transplant access for women in the prior MELD-Na model. Use live serum chemistries; do not adjust for diuretics or transfusions in the input numbers.",
                citations: [kim2021Meld3, openrnHepatic6]
            )
        }
    }
}
