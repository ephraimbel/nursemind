import SwiftUI

private let lee1999Rcri = CitationSource(
    id: "lee_1999_rcri",
    shortName: "RCRI — Lee TH et al., Circulation 1999 (concept citation)",
    detail: "Revised Cardiac Risk Index — peri-operative major cardiac event risk in non-cardiac surgery",
    publisher: "Circulation",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/10477528/",
    lastRetrieved: "2026-05-04"
)

private let acc2024PerioGuide = CitationSource(
    id: "acc_2024_perioperative",
    shortName: "ACC/AHA Perioperative Guideline 2024 (concept citation)",
    detail: "Endorses RCRI (or NSQIP MICA) as the recommended preoperative cardiac risk index for non-cardiac surgery",
    publisher: "American College of Cardiology / American Heart Association",
    license: .factCitationOnly,
    url: "https://www.acc.org/Latest-in-Cardiology/ten-points-to-remember/2024/09/24/19/57/2024-aha-acc-perioperative-cv",
    lastRetrieved: "2026-05-04"
)

private let openrnCardio5 = CitationSource(
    id: "openrn_cardio_5",
    shortName: "Open RN Health Alterations — Pre-operative Risk",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=preoperative+cardiac+risk",
    lastRetrieved: "2026-05-04"
)

// MARK: - RCRI

public struct RCRICalculatorView: View {
    @CalcPersistedBool(calculatorID: "rcri", key: "highRiskSurgery") private var highRiskSurgery
    @CalcPersistedBool(calculatorID: "rcri", key: "ihd")             private var ihd
    @CalcPersistedBool(calculatorID: "rcri", key: "chf")             private var chf
    @CalcPersistedBool(calculatorID: "rcri", key: "cvaTia")          private var cvaTia
    @CalcPersistedBool(calculatorID: "rcri", key: "insulinDM")       private var insulinDM
    @CalcPersistedBool(calculatorID: "rcri", key: "crGT2")           private var crGT2

    private var total: Int {
        [highRiskSurgery, ihd, chf, cvaTia, insulinDM, crGT2].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        switch total {
        case 0:    return ("RCRI 0 — published 30-day major cardiac event risk ≈ 0.4% (Lee 1999 derivation cohort).", .neutral)
        case 1:    return ("RCRI 1 — published 30-day major cardiac event risk ≈ 0.9%.", .neutral)
        case 2:    return ("RCRI 2 — published 30-day major cardiac event risk ≈ 6.6%.", .caution)
        default:   return ("RCRI ≥ 3 — published 30-day major cardiac event risk ≈ 11%.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "RCRI",
            subtitle: "Revised Cardiac Risk Index · pre-op non-cardiac surgery"
        ) {
            CalculatorSection("RISK FACTORS") {
                Toggle("High-risk surgery (intraperitoneal, intrathoracic, suprainguinal vascular)", isOn: $highRiskSurgery).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of ischemic heart disease",                                          isOn: $ihd).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of congestive heart failure",                                       isOn: $chf).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("History of cerebrovascular disease (stroke or TIA)",                        isOn: $cvaTia).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Insulin therapy for diabetes",                                              isOn: $insulinDM).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Pre-op creatinine > 2.0 mg/dL (177 µmol/L)",                                isOn: $crGT2).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "RCRI",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 6 binary risk factors. Range 0–6.\nMajor cardiac event = MI, pulmonary edema, ventricular fibrillation/cardiac arrest, complete heart block.",
                notes: "Endorsed by 2024 ACC/AHA Perioperative Guideline as one of the validated indices for pre-op risk stratification (alongside NSQIP MICA / NSQIP Surgical Risk Calculator). Helps identify patients who may benefit from cardiology consultation, beta-blocker continuation, or further pre-op testing — but does not by itself trigger any specific intervention.",
                citations: [lee1999Rcri, acc2024PerioGuide, openrnCardio5]
            )
        }
    }
}
