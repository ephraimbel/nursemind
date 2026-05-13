import SwiftUI

private let ranson1974 = CitationSource(
    id: "ranson_1974",
    shortName: "Ranson Criteria — Ranson JH et al., Surg Gynecol Obstet 1974 (concept citation)",
    detail: "11-criterion mortality predictor for acute pancreatitis (5 at admission + 6 at 48 h)",
    publisher: "Surgery, Gynecology & Obstetrics",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/4810437/",
    lastRetrieved: "2026-05-05"
)

private let openrnHepatic7 = CitationSource(
    id: "openrn_hepatic_7",
    shortName: "Open RN Health Alterations — Pancreatitis",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=pancreatitis",
    lastRetrieved: "2026-05-05"
)

// MARK: - Ranson Criteria

public struct RansonCalculatorView: View {
    // Admission criteria
    @CalcPersistedBool(calculatorID: "ranson", key: "ageOver55")     private var ageOver55
    @CalcPersistedBool(calculatorID: "ranson", key: "wbcOver16")     private var wbcOver16
    @CalcPersistedBool(calculatorID: "ranson", key: "glucoseOver200") private var glucoseOver200
    @CalcPersistedBool(calculatorID: "ranson", key: "ldhOver350")    private var ldhOver350
    @CalcPersistedBool(calculatorID: "ranson", key: "astOver250")    private var astOver250

    // 48-hour criteria
    @CalcPersistedBool(calculatorID: "ranson", key: "hctDropOver10") private var hctDropOver10
    @CalcPersistedBool(calculatorID: "ranson", key: "bunRiseOver5")  private var bunRiseOver5
    @CalcPersistedBool(calculatorID: "ranson", key: "calciumUnder8") private var calciumUnder8
    @CalcPersistedBool(calculatorID: "ranson", key: "pao2Under60")   private var pao2Under60
    @CalcPersistedBool(calculatorID: "ranson", key: "baseDeficitOver4") private var baseDeficitOver4
    @CalcPersistedBool(calculatorID: "ranson", key: "fluidSeqOver6L") private var fluidSeqOver6L

    private var total: Int {
        [ageOver55, wbcOver16, glucoseOver200, ldhOver350, astOver250,
         hctDropOver10, bunRiseOver5, calciumUnder8, pao2Under60,
         baseDeficitOver4, fluidSeqOver6L].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 0...2:  return ("Ranson 0–2 — published mortality < 1% (Ranson 1974 derivation cohort).", .neutral)
        case 3...4:  return ("Ranson 3–4 — published mortality ≈ 15%.", .caution)
        case 5...6:  return ("Ranson 5–6 — published mortality ≈ 40%.", .alert)
        default:     return ("Ranson ≥ 7 — published mortality ≈ 100% in original cohort.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "Ranson",
            subtitle: "Acute pancreatitis · admission + 48 h"
        ) {
            CalculatorSection("AT ADMISSION") {
                Toggle("Age > 55 years",                          isOn: $ageOver55).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("WBC > 16 ×10⁹/L",                          isOn: $wbcOver16).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Glucose > 200 mg/dL",                       isOn: $glucoseOver200).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("LDH > 350 IU/L",                            isOn: $ldhOver350).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("AST > 250 IU/L",                            isOn: $astOver250).toggleStyle(.switch)
            }
            CalculatorSection("AT 48 HOURS") {
                Toggle("Hematocrit drop > 10%",                    isOn: $hctDropOver10).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("BUN rise > 5 mg/dL despite fluids",         isOn: $bunRiseOver5).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Calcium < 8 mg/dL",                         isOn: $calciumUnder8).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("PaO₂ < 60 mmHg",                            isOn: $pao2Under60).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Base deficit > 4 mEq/L",                    isOn: $baseDeficitOver4).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Estimated fluid sequestration > 6 L",       isOn: $fluidSeqOver6L).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "Ranson",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 11 binary criteria (5 at admission + 6 at 48 h). Range 0–11.\nMortality strata published in Ranson 1974 derivation.",
                notes: "Requires the full 48-hour dataset for the complete score; many institutions favor BISAP for an early bedside read because Ranson can't be fully scored until day 2. Original criteria are for non-gallstone (alcoholic / idiopathic) pancreatitis; Ranson published a modified 10-criterion variant for biliary pancreatitis.",
                citations: [ranson1974, openrnHepatic7]
            )
        }
    }
}
