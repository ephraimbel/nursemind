import SwiftUI

// MARK: - Shared citation sources

private let kim2008Meld = CitationSource(
    id: "kim_2008_meld_na",
    shortName: "MELD-Na — Kim WR et al., NEJM 2008 (concept citation)",
    detail: "Sodium incorporation into the MELD score for transplant priority",
    publisher: "New England Journal of Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/18768945/",
    lastRetrieved: "2026-05-04"
)

private let optn = CitationSource(
    id: "optn_meld_policy",
    shortName: "OPTN/UNOS Liver Allocation — current MELD-Na policy (concept citation)",
    detail: "MELD-Na is the OPTN allocation score for adult liver transplantation",
    publisher: "Organ Procurement & Transplantation Network",
    license: .publicDomain,
    url: "https://optn.transplant.hrsa.gov/policies-bylaws/policies/",
    lastRetrieved: "2026-05-04"
)

private let openrnHepatic = CitationSource(
    id: "openrn_hepatic_tools",
    shortName: "Open RN Health Alterations — Hepatic Disorders",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hepatic+liver+gi+bleed",
    lastRetrieved: "2026-05-04"
)

// MARK: - MELD-Na

public struct MELDNaCalculatorView: View {
    @CalcPersistedDouble(calculatorID: "meld-na", key: "bili") private var bilirubin
    @CalcPersistedDouble(calculatorID: "meld-na", key: "inr") private var inr
    @CalcPersistedDouble(calculatorID: "meld-na", key: "cr") private var creatinine
    @CalcPersistedDouble(calculatorID: "meld-na", key: "na") private var sodium
    @CalcPersistedBool(calculatorID: "meld-na", key: "dialysis") private var dialysisTwiceInWeek

    private var meldComponents: (Double, Double, Double)? {
        guard var bili = bilirubin, var ratio = inr, var cr = creatinine else { return nil }
        // Lower-bound the inputs at 1.0 per OPTN convention
        if bili < 1.0 { bili = 1.0 }
        if ratio < 1.0 { ratio = 1.0 }
        if cr < 1.0   { cr = 1.0 }
        // Cap creatinine at 4.0; force 4.0 if ≥2 dialysis sessions in past 7 days
        if dialysisTwiceInWeek || cr > 4.0 { cr = 4.0 }
        return (bili, ratio, cr)
    }

    private var meld: Double? {
        guard let (bili, ratio, cr) = meldComponents else { return nil }
        let score = 3.78 * log(bili) + 11.2 * log(ratio) + 9.57 * log(cr) + 6.43
        return max(score, 6.0)   // OPTN MELD floor
    }

    private var meldNa: Double? {
        guard let m = meld else { return nil }
        // Sodium contributes only if MELD > 11 per OPTN convention
        guard m > 11 else { return min(m, 40) }
        let na = sodium.map { min(max($0, 125), 137) } ?? 137   // clamp 125–137
        let raw = m + 1.32 * (137.0 - na) - 0.033 * m * (137.0 - na)
        return min(max(raw, 6.0), 40.0)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = meldNa else { return nil }
        let rounded = Int(s.rounded())
        if rounded >= 40 { return ("MELD-Na ≥ 40 — capped per OPTN; ~71% 3-month mortality without transplant.", .alert) }
        if rounded >= 30 { return ("MELD-Na 30–39 — ~52% 3-month mortality; high transplant priority.", .alert) }
        if rounded >= 20 { return ("MELD-Na 20–29 — ~20% 3-month mortality.", .alert) }
        if rounded >= 10 { return ("MELD-Na 10–19 — ~6% 3-month mortality.", .caution) }
        return ("MELD-Na 6–9 — ~2% 3-month mortality.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "MELD-Na",
            subtitle: "Cirrhosis severity · OPTN transplant allocation"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorNumberField(label: "Bilirubin",   unit: "mg/dL", value: $bilirubin)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "INR",                       value: $inr)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Creatinine",  unit: "mg/dL", value: $creatinine)
                Hairline(color: NMColor.borderSubtle)
                CalculatorNumberField(label: "Sodium",      unit: "mEq/L", value: $sodium)
                Hairline(color: NMColor.borderSubtle)
                HStack {
                    Toggle(isOn: $dialysisTwiceInWeek) {
                        Text("≥ 2 hemodialysis sessions in past 7 days")
                            .font(NMFont.bodyLG)
                            .foregroundStyle(NMColor.textPrimary)
                            .lineLimit(2)
                    }
                    .toggleStyle(.switch)
                }
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "MELD-Na",
                value: meldNa.map { String(format: "%.0f", $0) },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "MELD = 3.78·ln(bili) + 11.2·ln(INR) + 9.57·ln(Cr) + 6.43\nMELD-Na = MELD + 1.32·(137 − Na) − 0.033·MELD·(137 − Na)\n(values floored at 1.0; Cr capped at 4.0; Na clamped 125–137; result floored 6, capped 40)",
                notes: "OPTN-endorsed adult liver-transplant allocation score. Sodium component only applied when MELD > 11. Use the live serum chemistries; do not adjust for diuretics. For acute liver failure, fulminant hepatic failure scoring uses different criteria (King's College).",
                citations: [kim2008Meld, optn, openrnHepatic]
            )
        }
    }
}
