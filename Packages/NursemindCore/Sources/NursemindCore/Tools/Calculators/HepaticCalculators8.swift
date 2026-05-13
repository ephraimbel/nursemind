import SwiftUI

private let oGrady1989 = CitationSource(
    id: "ogrady_1989_kings",
    shortName: "King's College Criteria — O'Grady JG et al., Gastroenterology 1989 (concept citation)",
    detail: "Criteria for emergency liver transplantation in acute liver failure (acetaminophen and non-acetaminophen forms)",
    publisher: "Gastroenterology",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2490426/",
    lastRetrieved: "2026-05-05"
)

private let openrnHepatic8 = CitationSource(
    id: "openrn_hepatic_8",
    shortName: "Open RN Health Alterations — Acute Liver Failure",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=acute+liver+failure",
    lastRetrieved: "2026-05-05"
)

// MARK: - King's College Criteria

public struct KingsCollegeCalculatorView: View {
    @CalcPersistedBool(calculatorID: "kings", key: "isAcetaminophen")  private var isAcetaminophen

    // Acetaminophen pathway
    @CalcPersistedBool(calculatorID: "kings", key: "apapPHUnder7_30")  private var apapPHUnder7_30
    @CalcPersistedBool(calculatorID: "kings", key: "apapINRGT6_5")     private var apapINRGT6_5
    @CalcPersistedBool(calculatorID: "kings", key: "apapCrGT3_4")      private var apapCrGT3_4
    @CalcPersistedBool(calculatorID: "kings", key: "apapEnceph3or4")   private var apapEnceph3or4

    // Non-acetaminophen pathway
    @CalcPersistedBool(calculatorID: "kings", key: "nonINRGT6_5")      private var nonINRGT6_5
    @CalcPersistedBool(calculatorID: "kings", key: "nonAgeOutOfRange") private var nonAgeOutOfRange  // < 10 or > 40
    @CalcPersistedBool(calculatorID: "kings", key: "nonAdverseEtiol")  private var nonAdverseEtiol   // non-A/non-B hep, halothane, drug
    @CalcPersistedBool(calculatorID: "kings", key: "nonJaundiceGT7d")  private var nonJaundiceGT7d
    @CalcPersistedBool(calculatorID: "kings", key: "nonINRGT3_5")      private var nonINRGT3_5
    @CalcPersistedBool(calculatorID: "kings", key: "nonBiliGT17_5")    private var nonBiliGT17_5

    private var nonAcetaminophenMinorCount: Int {
        [nonAgeOutOfRange, nonAdverseEtiol, nonJaundiceGT7d, nonINRGT3_5, nonBiliGT17_5].filter { $0 }.count
    }

    private var meetsCriteria: Bool {
        if isAcetaminophen {
            // Either pH < 7.30 alone, OR all 3 of (INR > 6.5, Cr > 3.4, encephalopathy III/IV)
            return apapPHUnder7_30 || (apapINRGT6_5 && apapCrGT3_4 && apapEnceph3or4)
        } else {
            // Either INR > 6.5 alone, OR ≥ 3 of the 5 minor criteria
            return nonINRGT6_5 || nonAcetaminophenMinorCount >= 3
        }
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if meetsCriteria {
            return ("MEETS King's College Criteria for emergency liver transplantation per O'Grady 1989. Published positive predictive value for spontaneous mortality without transplant ≈ 84–88% in the original validation cohort.", .alert)
        }
        return ("Does NOT meet King's College Criteria at this assessment. Continue serial evaluation — these criteria can become positive over hours to days as ALF evolves.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.hepatic.eyebrowName,
            title: "King's College",
            subtitle: "Acute liver failure · transplant criteria"
        ) {
            CalculatorSection("ETIOLOGY") {
                Toggle("Acetaminophen-induced ALF", isOn: $isAcetaminophen).toggleStyle(.switch)
            }
            if isAcetaminophen {
                CalculatorSection("ACETAMINOPHEN PATHWAY") {
                    Toggle("Arterial pH < 7.30 (after volume resuscitation)", isOn: $apapPHUnder7_30).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("INR > 6.5 (PT > 100 sec)",                         isOn: $apapINRGT6_5).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("Creatinine > 3.4 mg/dL (> 300 µmol/L)",            isOn: $apapCrGT3_4).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("Hepatic encephalopathy grade III or IV",           isOn: $apapEnceph3or4).toggleStyle(.switch)
                }
            } else {
                CalculatorSection("NON-ACETAMINOPHEN PATHWAY") {
                    Toggle("INR > 6.5 alone (sufficient regardless of others)", isOn: $nonINRGT6_5).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Text("OR any 3 of the following 5:")
                        .font(NMFont.bodySM)
                        .foregroundStyle(NMColor.textTertiary)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("Age < 10 OR > 40 years",                                          isOn: $nonAgeOutOfRange).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("Etiology: non-A/non-B hepatitis, halothane, drug-induced",        isOn: $nonAdverseEtiol).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("Jaundice present > 7 days before encephalopathy",                  isOn: $nonJaundiceGT7d).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("INR > 3.5",                                                        isOn: $nonINRGT3_5).toggleStyle(.switch)
                    Hairline(color: NMColor.borderSubtle)
                    Toggle("Bilirubin > 17.5 mg/dL (> 300 µmol/L)",                            isOn: $nonBiliGT17_5).toggleStyle(.switch)
                }
            }
            CalculatorResultDisplay(
                label: "King's College",
                value: meetsCriteria ? "MEETS" : "DOES NOT MEET",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Acetaminophen ALF: Arterial pH < 7.30 OR all 3 of [INR > 6.5, Cr > 3.4 mg/dL, hepatic encephalopathy III–IV].\nNon-acetaminophen ALF: INR > 6.5 OR ≥ 3 of [age < 10 or > 40, adverse etiology, jaundice > 7 days before encephalopathy, INR > 3.5, bilirubin > 17.5 mg/dL].",
                notes: "Originally derived from a King's College Hospital ALF cohort; remains the most-cited transplant-listing criteria worldwide. The MELD/MELD 3.0 scores are also used for transplant prioritization in chronic liver disease but King's College is the standard for fulminant ALF. Lactate > 3.5 mmol/L early or > 3.0 mmol/L after fluid resuscitation has been added in some centers as an additional acetaminophen criterion.",
                citations: [oGrady1989, openrnHepatic8]
            )
        }
    }
}
