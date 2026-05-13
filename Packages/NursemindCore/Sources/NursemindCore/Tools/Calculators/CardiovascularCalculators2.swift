import SwiftUI

// MARK: - Shared citation sources

private let lip2010 = CitationSource(
    id: "lip_2010_chads_vasc",
    shortName: "CHA₂DS₂-VASc — Lip GYH et al., Chest 2010 (concept citation)",
    detail: "Refinement of CHADS₂ stroke-risk scheme adding vascular disease, age 65-74, and female sex",
    publisher: "American College of Chest Physicians",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/19762550/",
    lastRetrieved: "2026-05-04"
)

private let pisters2010 = CitationSource(
    id: "pisters_2010_has_bled",
    shortName: "HAS-BLED — Pisters R et al., Chest 2010 (concept citation)",
    detail: "Bleeding-risk score for atrial fibrillation patients on anticoagulation",
    publisher: "American College of Chest Physicians",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/20299623/",
    lastRetrieved: "2026-05-04"
)

private let six2008Heart = CitationSource(
    id: "six_2008_heart",
    shortName: "HEART Score — Six AJ et al., Neth Heart J 2008 (concept citation)",
    detail: "Risk stratification of chest-pain patients in the emergency department",
    publisher: "Netherlands Heart Journal",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/18958286/",
    lastRetrieved: "2026-05-04"
)

private let openrnTools = CitationSource(
    id: "openrn_clinical_tools",
    shortName: "Open RN Health Alterations — Cardiovascular & Risk Stratification",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cardiac+heart+arrhythmia",
    lastRetrieved: "2026-05-04"
)

// MARK: - CHA₂DS₂-VASc

public struct CHA2DS2VAScCalculatorView: View {
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "chf")          private var chf
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "hypertension") private var hypertension
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "ageGE75")      private var ageGE75
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "diabetes")     private var diabetes
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "stroke")       private var stroke
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "vascular")     private var vascular
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "age6574")      private var age6574
    @CalcPersistedBool(calculatorID: "cha2ds2-vasc", key: "female")       private var female

    private var total: Int {
        var s = 0
        if chf          { s += 1 }
        if hypertension { s += 1 }
        if ageGE75      { s += 2 }
        if diabetes     { s += 1 }
        if stroke       { s += 2 }
        if vascular     { s += 1 }
        // Age 65–74 only counted if ≥75 not also selected (mutually exclusive)
        if age6574 && !ageGE75 { s += 1 }
        if female       { s += 1 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total == 0 { return ("CHA₂DS₂-VASc = 0 — published low annual stroke risk; below the AHA/ACC/ESC anticoagulation-eligibility threshold.", .neutral) }
        if total == 1 { return ("CHA₂DS₂-VASc = 1 — published moderate annual stroke risk. AHA/ACC/ESC anticoagulation thresholds differ by sex (≥ 2 in men, ≥ 3 in women).", .caution) }
        return ("CHA₂DS₂-VASc ≥ 2 — published higher annual stroke risk; meets the AHA/ACC anticoagulation-eligibility threshold for men and (at ≥ 3) for women.", .alert)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "CHA₂DS₂-VASc",
            subtitle: "Stroke risk in non-valvular atrial fibrillation"
        ) {
            CalculatorSection("RISK FACTORS") {
                togglePoint(label: "C — CHF / LV dysfunction",         points: 1, isOn: $chf)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "H — Hypertension",                  points: 1, isOn: $hypertension)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "A₂ — Age ≥ 75",                     points: 2, isOn: $ageGE75)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "D — Diabetes mellitus",             points: 1, isOn: $diabetes)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "S₂ — Prior stroke / TIA / TE",      points: 2, isOn: $stroke)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "V — Vascular disease (MI/PAD/aortic plaque)", points: 1, isOn: $vascular)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "A — Age 65–74",                     points: 1, isOn: $age6574)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Sc — Female sex",                   points: 1, isOn: $female)
            }
            CalculatorResultDisplay(
                label: "CHA₂DS₂-VASc",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of risk factors. Range 0–9 (Age ≥75 and Age 65–74 are mutually exclusive).",
                notes: "Most guidelines (AHA/ACC, ESC) recommend long-term oral anticoagulation for CHA₂DS₂-VASc ≥ 2 in men and ≥ 3 in women. Female sex alone does not confer treatment indication. Always pair with bleeding-risk assessment (HAS-BLED) and patient-centered decision-making.",
                citations: [lip2010, openrnTools]
            )
        }
    }

    private func togglePoint(label: String, points: Int, isOn: Binding<Bool>) -> some View {
        HStack {
            Toggle(isOn: isOn) {
                Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
            }
            .toggleStyle(.switch)
            Text("+\(points)")
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 36, alignment: .trailing)
        }
        .padding(.vertical, NMSpace.base)
    }
}

// MARK: - HAS-BLED

public struct HASBLEDCalculatorView: View {
    @CalcPersistedBool(calculatorID: "has-bled", key: "hypertensionUncontrolled") private var hypertensionUncontrolled
    @CalcPersistedBool(calculatorID: "has-bled", key: "abnRenal")  private var abnRenal
    @CalcPersistedBool(calculatorID: "has-bled", key: "abnLiver")  private var abnLiver
    @CalcPersistedBool(calculatorID: "has-bled", key: "stroke")    private var stroke
    @CalcPersistedBool(calculatorID: "has-bled", key: "bleeding")  private var bleeding
    @CalcPersistedBool(calculatorID: "has-bled", key: "labileINR") private var labileINR
    @CalcPersistedBool(calculatorID: "has-bled", key: "elderly")   private var elderly
    @CalcPersistedBool(calculatorID: "has-bled", key: "drugs")     private var drugs
    @CalcPersistedBool(calculatorID: "has-bled", key: "alcohol")   private var alcohol

    private var total: Int {
        var s = 0
        if hypertensionUncontrolled { s += 1 }
        if abnRenal                 { s += 1 }
        if abnLiver                 { s += 1 }
        if stroke                   { s += 1 }
        if bleeding                 { s += 1 }
        if labileINR                { s += 1 }
        if elderly                  { s += 1 }
        if drugs                    { s += 1 }
        if alcohol                  { s += 1 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 3 { return ("HAS-BLED ≥ 3 — high-bleeding-risk band per Pisters 2010; modifiable factors (BP, INR stability, alcohol, NSAIDs) are the published targets. ESC explicitly notes a high score does not by itself contraindicate anticoagulation when stroke risk is high.", .alert) }
        if total == 2 { return ("HAS-BLED = 2 — intermediate-bleeding-risk band per Pisters 2010.", .caution) }
        return ("HAS-BLED 0–1 — low-bleeding-risk band per Pisters 2010.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "HAS-BLED",
            subtitle: "Bleeding risk on anticoagulation"
        ) {
            CalculatorSection("RISK FACTORS") {
                togglePoint(label: "H — Hypertension (SBP > 160)",      points: 1, isOn: $hypertensionUncontrolled)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "A — Abnormal renal function",       points: 1, isOn: $abnRenal)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "A — Abnormal liver function",       points: 1, isOn: $abnLiver)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "S — Prior stroke",                  points: 1, isOn: $stroke)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "B — Bleeding history / predisposition", points: 1, isOn: $bleeding)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "L — Labile INR",                    points: 1, isOn: $labileINR)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "E — Elderly (age > 65)",            points: 1, isOn: $elderly)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "D — Drugs (NSAIDs / antiplatelets)", points: 1, isOn: $drugs)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "D — Alcohol (≥ 8 drinks/week)",     points: 1, isOn: $alcohol)
            }
            CalculatorResultDisplay(
                label: "HAS-BLED",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 9 risk factors (1 point each). Range 0–9.",
                notes: "HAS-BLED identifies modifiable bleeding risks (BP control, INR stability, NSAID/alcohol use). A high score should prompt mitigation, not automatic withdrawal of anticoagulation. Always interpret alongside CHA₂DS₂-VASc and patient values.",
                citations: [pisters2010, openrnTools]
            )
        }
    }

    private func togglePoint(label: String, points: Int, isOn: Binding<Bool>) -> some View {
        HStack {
            Toggle(isOn: isOn) {
                Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
            }
            .toggleStyle(.switch)
            Text("+\(points)")
                .font(NMFont.mono)
                .foregroundStyle(NMColor.textTertiary)
                .frame(minWidth: 36, alignment: .trailing)
        }
        .padding(.vertical, NMSpace.base)
    }
}

// MARK: - HEART Score

public struct HEARTScoreCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "heart", key: "history")  private var historyID
    @CalcPersistedOptionID(calculatorID: "heart", key: "ecg")      private var ecgID
    @CalcPersistedOptionID(calculatorID: "heart", key: "age")      private var ageID
    @CalcPersistedOptionID(calculatorID: "heart", key: "risk")     private var riskID
    @CalcPersistedOptionID(calculatorID: "heart", key: "troponin") private var troponinID

    private var history:  CalculatorScoreRow.Option? { historyOptions.first  { $0.id == historyID } }
    private var ecg:      CalculatorScoreRow.Option? { ecgOptions.first      { $0.id == ecgID } }
    private var age:      CalculatorScoreRow.Option? { ageOptions.first      { $0.id == ageID } }
    private var risk:     CalculatorScoreRow.Option? { riskOptions.first     { $0.id == riskID } }
    private var troponin: CalculatorScoreRow.Option? { troponinOptions.first { $0.id == troponinID } }

    private let historyOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Slightly suspicious",   score: 0),
        .init(id: 1, label: "Moderately suspicious", score: 1),
        .init(id: 2, label: "Highly suspicious",     score: 2)
    ]
    private let ecgOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Normal",                                      score: 0),
        .init(id: 1, label: "Non-specific repolarization disturbance",     score: 1),
        .init(id: 2, label: "Significant ST depression / new LBBB",        score: 2)
    ]
    private let ageOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 45", score: 0),
        .init(id: 1, label: "45–64", score: 1),
        .init(id: 2, label: "≥ 65",  score: 2)
    ]
    private let riskOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "No risk factors",                  score: 0),
        .init(id: 1, label: "1–2 risk factors",                 score: 1),
        .init(id: 2, label: "≥ 3 risk factors or known atherosclerotic disease", score: 2)
    ]
    private let troponinOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "≤ Normal limit",   score: 0),
        .init(id: 1, label: "1–3× normal",      score: 1),
        .init(id: 2, label: "> 3× normal",      score: 2)
    ]

    private var total: Int? {
        let parts = [history, ecg, age, risk, troponin]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 7 { return ("HEART 7–10 — high-risk band per Six 2008; published 6-week MACE rate ≈ 50%.", .alert) }
        if s >= 4 { return ("HEART 4–6 — moderate-risk band; published 6-week MACE rate ≈ 17%.", .alert) }
        return ("HEART 0–3 — low-risk band; published 6-week MACE rate ≈ 1.7%.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.cardiovascular.eyebrowName,
            title: "HEART Score",
            subtitle: "Chest pain — emergency department risk stratification"
        ) {
            CalculatorSection("INPUTS") {
                CalculatorScoreRow(label: "History",       options: historyOptions,  selection: $historyID.option(in: historyOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "ECG",           options: ecgOptions,      selection: $ecgID.option(in: ecgOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Age",           options: ageOptions,      selection: $ageID.option(in: ageOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Risk factors",  options: riskOptions,     selection: $riskID.option(in: riskOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Troponin",      options: troponinOptions, selection: $troponinID.option(in: troponinOptions))
            }
            CalculatorResultDisplay(
                label: "HEART Score",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 5 components, each 0–2. Range 0–10.\nRisk factors: HTN, hypercholesterolemia, diabetes, obesity (BMI > 30), smoking (current or recent quit), family history of CAD, atherosclerotic disease.",
                notes: "HEART has been extensively validated for ED chest-pain triage. Use the HEART Pathway (HEART Score + 0- and 3-hour troponin) for accelerated discharge of low-risk patients. Always interpret in clinical context — atypical presentations may warrant admission despite low scores.",
                citations: [six2008Heart, openrnTools]
            )
        }
    }
}
