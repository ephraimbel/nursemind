import SwiftUI

private let saltzman2011Aims65 = CitationSource(
    id: "saltzman_2011_aims65",
    shortName: "AIMS-65 — Saltzman JR et al., Gastrointest Endosc 2011 (concept citation)",
    detail: "5-item bedside score predicting in-hospital mortality in upper GI bleeding",
    publisher: "Gastrointestinal Endoscopy",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/21295641/",
    lastRetrieved: "2026-05-04"
)

private let openrnHepatic5 = CitationSource(
    id: "openrn_hepatic_5",
    shortName: "Open RN Health Alterations — Upper GI Bleeding",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=GI+bleed+ulcer",
    lastRetrieved: "2026-05-04"
)

// MARK: - AIMS-65

public struct AIMS65CalculatorView: View {
    @CalcPersistedBool(calculatorID: "aims-65", key: "lowAlbumin") private var lowAlbumin       // < 3.0 g/dL
    @CalcPersistedBool(calculatorID: "aims-65", key: "highINR")    private var highINR          // > 1.5
    @CalcPersistedBool(calculatorID: "aims-65", key: "alteredMS")  private var alteredMS
    @CalcPersistedBool(calculatorID: "aims-65", key: "lowSBP")     private var lowSBP           // ≤ 90 mmHg
    @CalcPersistedBool(calculatorID: "aims-65", key: "ageOver65")  private var ageOver65

    private var total: Int {
        [lowAlbumin, highINR, alteredMS, lowSBP, ageOver65].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 0:  return ("AIMS-65 = 0 — published in-hospital mortality ≈ 0.3% (Saltzman 2011 derivation cohort).", .neutral)
        case 1:  return ("AIMS-65 = 1 — published in-hospital mortality ≈ 1%.", .neutral)
        case 2:  return ("AIMS-65 = 2 — published in-hospital mortality ≈ 1.6%.", .caution)
        case 3:  return ("AIMS-65 = 3 — published in-hospital mortality ≈ 7.8%.", .alert)
        case 4:  return ("AIMS-65 = 4 — published in-hospital mortality ≈ 14.5%.", .alert)
        default: return ("AIMS-65 = 5 — published in-hospital mortality ≈ 24.5%.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "AIMS-65",
            subtitle: "UGI bleed in-hospital mortality"
        ) {
            CalculatorSection("CRITERIA") {
                Toggle("Albumin < 3.0 g/dL",                                   isOn: $lowAlbumin).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("INR > 1.5",                                            isOn: $highINR).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Altered mental status",                                 isOn: $alteredMS).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Systolic BP ≤ 90 mmHg",                                isOn: $lowSBP).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Age > 65 years",                                       isOn: $ageOver65).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "AIMS-65",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 binary criteria. Range 0–5.\nMortality strata published in Saltzman 2011 derivation cohort.",
                notes: "AIMS-65 is a fast bedside mortality predictor — simpler than Glasgow-Blatchford but does not predict need for intervention as well. Pair with Glasgow-Blatchford for a combined picture: AIMS-65 for mortality, GBS for transfusion/endoscopy need.",
                citations: [saltzman2011Aims65, openrnHepatic5]
            )
        }
    }
}
