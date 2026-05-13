import SwiftUI

// MARK: - Shared citation sources

private let sepsis3 = CitationSource(
    id: "sepsis_3_2016",
    shortName: "Sepsis-3 / qSOFA — Singer M et al., JAMA 2016 (PMC OA)",
    detail: "Third International Consensus Definitions for Sepsis and Septic Shock",
    publisher: "JAMA",
    license: .ccBy4,
    url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC4968574/",
    lastRetrieved: "2026-05-04"
)

private let sofaVincent = CitationSource(
    id: "sofa_vincent_1996",
    shortName: "SOFA Score — Vincent JL et al., Intensive Care Med 1996 (concept citation)",
    detail: "Sequential Organ Failure Assessment (originally Sepsis-related Organ Failure Assessment)",
    publisher: "Intensive Care Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/8844239/",
    lastRetrieved: "2026-05-04"
)

private let capriniRef = CitationSource(
    id: "caprini_2005",
    shortName: "Caprini VTE Risk Assessment — Caprini JA, 2005 (concept citation)",
    detail: "Validated VTE risk-stratification model for surgical patients",
    publisher: "Disease-a-Month / Caprini Score",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/15634548/",
    lastRetrieved: "2026-05-04"
)

private let rassSessler = CitationSource(
    id: "rass_sessler_2002",
    shortName: "RASS — Sessler CN et al., AJRCCM 2002 (concept citation)",
    detail: "Richmond Agitation-Sedation Scale; the standard ICU sedation scale",
    publisher: "American Journal of Respiratory and Critical Care Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/12421743/",
    lastRetrieved: "2026-05-04"
)

private let camInouye = CitationSource(
    id: "cam_inouye_1990",
    shortName: "Confusion Assessment Method — Inouye SK et al., Ann Intern Med 1990 (concept citation)",
    detail: "Validated bedside delirium screen",
    publisher: "Annals of Internal Medicine",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2240918/",
    lastRetrieved: "2026-05-04"
)

private let openrnRisk3 = CitationSource(
    id: "openrn_risk_3",
    shortName: "Open RN Health Alterations & Mental Health — Risk Assessment",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=risk+assessment+score+screening",
    lastRetrieved: "2026-05-04"
)

// MARK: - qSOFA

public struct QSOFACalculatorView: View {
    @CalcPersistedBool(calculatorID: "qsofa", key: "rrGE22")   private var rrGE22
    @CalcPersistedBool(calculatorID: "qsofa", key: "ams")      private var ams
    @CalcPersistedBool(calculatorID: "qsofa", key: "sbpLE100") private var sbpLE100

    private var total: Int {
        [rrGE22, ams, sbpLE100].filter { $0 }.count
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 2 { return ("qSOFA ≥ 2 — Sepsis-3 threshold for high risk of poor outcome from infection; published in-hospital mortality ≥ 10%. Used as the bedside trigger for full sepsis evaluation in many protocols.", .alert) }
        if total == 1 { return ("qSOFA = 1 — single positive criterion; below the Sepsis-3 high-risk cutoff.", .caution) }
        return ("qSOFA = 0 — bedside criteria do not meet the Sepsis-3 high-risk cutoff at this assessment.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "qSOFA",
            subtitle: "Bedside sepsis screen — Sepsis-3"
        ) {
            CalculatorSection("CRITERIA") {
                togglePoint(label: "Respiratory rate ≥ 22",            points: 1, isOn: $rrGE22)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Altered mental status (GCS < 15)", points: 1, isOn: $ams)
                Hairline(color: NMColor.borderSubtle)
                togglePoint(label: "Systolic BP ≤ 100 mmHg",           points: 1, isOn: $sbpLE100)
            }
            CalculatorResultDisplay(
                label: "qSOFA",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of 3 binary criteria. Range 0–3.\n≥ 2 suggests increased mortality risk in patients with suspected infection.",
                notes: "qSOFA replaced SIRS as the bedside sepsis screen in Sepsis-3 (2016). It is a SCREEN, not a diagnosis — use it to flag patients for full workup, not to rule sepsis in or out. Less sensitive than SIRS but more specific. Many institutions still use SIRS or NEWS2 as the trigger; follow your sepsis bundle.",
                citations: [sepsis3, openrnRisk3]
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

// MARK: - SOFA

public struct SOFACalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "sofa", key: "resp")   private var respID
    @CalcPersistedOptionID(calculatorID: "sofa", key: "coag")   private var coagID
    @CalcPersistedOptionID(calculatorID: "sofa", key: "liver")  private var liverID
    @CalcPersistedOptionID(calculatorID: "sofa", key: "cardio") private var cardioID
    @CalcPersistedOptionID(calculatorID: "sofa", key: "cns")    private var cnsID
    @CalcPersistedOptionID(calculatorID: "sofa", key: "renal")  private var renalID

    private var resp:   CalculatorScoreRow.Option? { respOptions.first   { $0.id == respID } }
    private var coag:   CalculatorScoreRow.Option? { coagOptions.first   { $0.id == coagID } }
    private var liver:  CalculatorScoreRow.Option? { liverOptions.first  { $0.id == liverID } }
    private var cardio: CalculatorScoreRow.Option? { cardioOptions.first { $0.id == cardioID } }
    private var cns:    CalculatorScoreRow.Option? { cnsOptions.first    { $0.id == cnsID } }
    private var renal:  CalculatorScoreRow.Option? { renalOptions.first  { $0.id == renalID } }

    private let respOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "PaO₂/FiO₂ ≥ 400",                                score: 0),
        .init(id: 1, label: "PaO₂/FiO₂ 300–399",                              score: 1),
        .init(id: 2, label: "PaO₂/FiO₂ 200–299",                              score: 2),
        .init(id: 3, label: "PaO₂/FiO₂ 100–199 (with vent support)",          score: 3),
        .init(id: 4, label: "PaO₂/FiO₂ < 100 (with vent support)",            score: 4)
    ]
    private let coagOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Platelets ≥ 150",          score: 0),
        .init(id: 1, label: "Platelets 100–149",        score: 1),
        .init(id: 2, label: "Platelets 50–99",          score: 2),
        .init(id: 3, label: "Platelets 20–49",          score: 3),
        .init(id: 4, label: "Platelets < 20",           score: 4)
    ]
    private let liverOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Bilirubin < 1.2 mg/dL",     score: 0),
        .init(id: 1, label: "1.2–1.9 mg/dL",             score: 1),
        .init(id: 2, label: "2.0–5.9 mg/dL",             score: 2),
        .init(id: 3, label: "6.0–11.9 mg/dL",            score: 3),
        .init(id: 4, label: "≥ 12 mg/dL",                score: 4)
    ]
    private let cardioOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "MAP ≥ 70, no vasopressor",                                            score: 0),
        .init(id: 1, label: "MAP < 70, no vasopressor",                                            score: 1),
        .init(id: 2, label: "Dopamine ≤ 5 OR dobutamine (any)",                                    score: 2),
        .init(id: 3, label: "Dopamine > 5 OR epi/norepi ≤ 0.1 mcg/kg/min",                         score: 3),
        .init(id: 4, label: "Dopamine > 15 OR epi/norepi > 0.1 mcg/kg/min",                        score: 4)
    ]
    private let cnsOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "GCS 15",     score: 0),
        .init(id: 1, label: "GCS 13–14",  score: 1),
        .init(id: 2, label: "GCS 10–12",  score: 2),
        .init(id: 3, label: "GCS 6–9",    score: 3),
        .init(id: 4, label: "GCS < 6",    score: 4)
    ]
    private let renalOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "Cr < 1.2 mg/dL",                                  score: 0),
        .init(id: 1, label: "Cr 1.2–1.9 mg/dL",                                score: 1),
        .init(id: 2, label: "Cr 2.0–3.4 mg/dL",                                score: 2),
        .init(id: 3, label: "Cr 3.5–4.9 mg/dL OR UOP < 500 mL/day",            score: 3),
        .init(id: 4, label: "Cr ≥ 5.0 mg/dL OR UOP < 200 mL/day",              score: 4)
    ]

    private var total: Int? {
        let parts = [resp, coag, liver, cardio, cns, renal]
        guard parts.allSatisfy({ $0 != nil }) else { return nil }
        return parts.compactMap { $0?.score }.reduce(0, +)
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let s = total else { return nil }
        if s >= 15 { return ("SOFA ≥ 15 — > 80% mortality estimate.", .alert) }
        if s >= 10 { return ("SOFA 10–14 — 40–50% mortality estimate.", .alert) }
        if s >= 7  { return ("SOFA 7–9 — 15–20% mortality estimate.", .alert) }
        if s >= 2  { return ("Sepsis defined per Sepsis-3 if ≥ 2-point increase from baseline in suspected infection.", .caution) }
        return ("SOFA 0–1 — minimal organ dysfunction.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "SOFA",
            subtitle: "Sequential Organ Failure Assessment"
        ) {
            CalculatorSection("ORGAN SYSTEMS") {
                CalculatorScoreRow(label: "Respiration",     options: respOptions,   selection: $respID.option(in: respOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Coagulation",     options: coagOptions,   selection: $coagID.option(in: coagOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Liver",           options: liverOptions,  selection: $liverID.option(in: liverOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Cardiovascular",  options: cardioOptions, selection: $cardioID.option(in: cardioOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "CNS",             options: cnsOptions,    selection: $cnsID.option(in: cnsOptions))
                Hairline(color: NMColor.borderSubtle)
                CalculatorScoreRow(label: "Renal",           options: renalOptions,  selection: $renalID.option(in: renalOptions))
            }
            CalculatorResultDisplay(
                label: "SOFA",
                value: total.map { "\($0)" },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of 6 organ-system scores (0–4 each). Range 0–24.\nSepsis-3: ≥ 2-point acute increase from baseline + suspected infection = sepsis.",
                notes: "Used in ICU to track multi-organ failure severity. Trend serially — change is more meaningful than absolute value. Mortality estimates above are population averages, not individual predictions.",
                citations: [sepsis3, sofaVincent, openrnRisk3]
            )
        }
    }
}

// MARK: - Caprini

public struct CapriniCalculatorView: View {
    @CalcPersistedBool(calculatorID: "caprini", key: "age4160")                private var age4160
    @CalcPersistedBool(calculatorID: "caprini", key: "age6174")                private var age6174
    @CalcPersistedBool(calculatorID: "caprini", key: "ageGE75")                private var ageGE75
    @CalcPersistedBool(calculatorID: "caprini", key: "minorSurgery")           private var minorSurgery
    @CalcPersistedBool(calculatorID: "caprini", key: "majorSurgery")           private var majorSurgery
    @CalcPersistedBool(calculatorID: "caprini", key: "arthroscopic")           private var arthroscopic
    @CalcPersistedBool(calculatorID: "caprini", key: "bmiOver25")              private var bmiOver25
    @CalcPersistedBool(calculatorID: "caprini", key: "bedrest")                private var bedrest
    @CalcPersistedBool(calculatorID: "caprini", key: "swollenLegs")            private var swollenLegs
    @CalcPersistedBool(calculatorID: "caprini", key: "varicoseVeins")          private var varicoseVeins
    @CalcPersistedBool(calculatorID: "caprini", key: "pregnancy")              private var pregnancy
    @CalcPersistedBool(calculatorID: "caprini", key: "hxContraceptive")        private var hxContraceptive
    @CalcPersistedBool(calculatorID: "caprini", key: "sepsis")                 private var sepsis
    @CalcPersistedBool(calculatorID: "caprini", key: "seriousLungDisease")     private var seriousLungDisease
    @CalcPersistedBool(calculatorID: "caprini", key: "copdHx")                 private var copdHx
    @CalcPersistedBool(calculatorID: "caprini", key: "miHx")                   private var miHx
    @CalcPersistedBool(calculatorID: "caprini", key: "chf")                    private var chf
    @CalcPersistedBool(calculatorID: "caprini", key: "ibd")                    private var ibd
    @CalcPersistedBool(calculatorID: "caprini", key: "medicalPatientBedrest")  private var medicalPatientBedrest
    @CalcPersistedBool(calculatorID: "caprini", key: "malignancy")             private var malignancy
    @CalcPersistedBool(calculatorID: "caprini", key: "openSurgeryGT45min")     private var openSurgeryGT45min
    @CalcPersistedBool(calculatorID: "caprini", key: "laparoscopicGT45min")    private var laparoscopicGT45min
    @CalcPersistedBool(calculatorID: "caprini", key: "arthroplasty")           private var arthroplasty
    @CalcPersistedBool(calculatorID: "caprini", key: "hipFracture")            private var hipFracture
    @CalcPersistedBool(calculatorID: "caprini", key: "stroke")                 private var stroke
    @CalcPersistedBool(calculatorID: "caprini", key: "multipleTrauma")         private var multipleTrauma
    @CalcPersistedBool(calculatorID: "caprini", key: "spinalCordInjury")       private var spinalCordInjury
    @CalcPersistedBool(calculatorID: "caprini", key: "hxDvtPe")                private var hxDvtPe
    @CalcPersistedBool(calculatorID: "caprini", key: "familyHxThrombosis")     private var familyHxThrombosis
    @CalcPersistedBool(calculatorID: "caprini", key: "factorVLeiden")          private var factorVLeiden
    @CalcPersistedBool(calculatorID: "caprini", key: "lupusAnticoag")          private var lupusAnticoag
    @CalcPersistedBool(calculatorID: "caprini", key: "heparinThrombocytopenia") private var heparinThrombocytopenia

    private var total: Int {
        var s = 0
        // 1 point each
        if age4160       { s += 1 }
        if minorSurgery  { s += 1 }
        if bmiOver25     { s += 1 }
        if swollenLegs   { s += 1 }
        if varicoseVeins { s += 1 }
        if pregnancy     { s += 1 }
        if hxContraceptive { s += 1 }
        if sepsis        { s += 1 }
        if seriousLungDisease { s += 1 }
        if copdHx        { s += 1 }
        if miHx          { s += 1 }
        if chf           { s += 1 }
        if ibd           { s += 1 }
        if medicalPatientBedrest { s += 1 }
        // 2 points each
        if age6174       { s += 2 }
        if majorSurgery  { s += 2 }
        if arthroscopic  { s += 2 }
        if bedrest       { s += 2 }
        if malignancy    { s += 2 }
        if openSurgeryGT45min { s += 2 }
        if laparoscopicGT45min { s += 2 }
        // 3 points each
        if ageGE75               { s += 3 }
        if hxDvtPe               { s += 3 }
        if familyHxThrombosis    { s += 3 }
        if factorVLeiden         { s += 3 }
        if lupusAnticoag         { s += 3 }
        if heparinThrombocytopenia { s += 3 }
        // 5 points each
        if arthroplasty   { s += 5 }
        if hipFracture    { s += 5 }
        if stroke         { s += 5 }
        if multipleTrauma { s += 5 }
        if spinalCordInjury { s += 5 }
        return s
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if total >= 5 { return ("Caprini ≥ 5 — high risk. Pharmacologic + mechanical prophylaxis (LMWH or low-dose UFH PLUS SCDs) per institutional protocol.", .alert) }
        if total >= 3 { return ("Caprini 3–4 — moderate risk. Pharmacologic OR mechanical prophylaxis per protocol.", .caution) }
        if total >= 1 { return ("Caprini 1–2 — low risk. Mechanical prophylaxis (SCDs) and early ambulation.", .caution) }
        return ("Caprini 0 — very low risk. Early ambulation; routine prophylaxis usually not indicated.", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "Caprini Score",
            subtitle: "VTE risk in surgical patients"
        ) {
            CalculatorSection("1 POINT EACH") {
                tg("Age 41–60",                                        $age4160)
                Hairline(color: NMColor.borderSubtle)
                tg("Minor surgery planned",                            $minorSurgery)
                Hairline(color: NMColor.borderSubtle)
                tg("BMI > 25",                                         $bmiOver25)
                Hairline(color: NMColor.borderSubtle)
                tg("Swollen legs",                                     $swollenLegs)
                Hairline(color: NMColor.borderSubtle)
                tg("Varicose veins",                                   $varicoseVeins)
                Hairline(color: NMColor.borderSubtle)
                tg("Pregnancy / postpartum",                           $pregnancy)
                Hairline(color: NMColor.borderSubtle)
                tg("Oral contraceptive / hormone replacement",         $hxContraceptive)
                Hairline(color: NMColor.borderSubtle)
                tg("Sepsis (< 1 month)",                               $sepsis)
                Hairline(color: NMColor.borderSubtle)
                tg("Serious lung disease (< 1 month)",                 $seriousLungDisease)
                Hairline(color: NMColor.borderSubtle)
                tg("COPD",                                             $copdHx)
                Hairline(color: NMColor.borderSubtle)
                tg("Acute MI",                                         $miHx)
                Hairline(color: NMColor.borderSubtle)
                tg("CHF (< 1 month)",                                  $chf)
                Hairline(color: NMColor.borderSubtle)
                tg("IBD",                                              $ibd)
                Hairline(color: NMColor.borderSubtle)
                tg("Medical patient at bedrest",                       $medicalPatientBedrest)
            }
            CalculatorSection("2 POINTS EACH") {
                tg("Age 61–74",                                        $age6174)
                Hairline(color: NMColor.borderSubtle)
                tg("Major surgery (> 45 min)",                         $majorSurgery)
                Hairline(color: NMColor.borderSubtle)
                tg("Arthroscopic surgery",                             $arthroscopic)
                Hairline(color: NMColor.borderSubtle)
                tg("Confined to bed > 72 hours",                       $bedrest)
                Hairline(color: NMColor.borderSubtle)
                tg("Malignancy (active or past)",                      $malignancy)
                Hairline(color: NMColor.borderSubtle)
                tg("Open major surgery (> 45 min)",                    $openSurgeryGT45min)
                Hairline(color: NMColor.borderSubtle)
                tg("Laparoscopic surgery (> 45 min)",                  $laparoscopicGT45min)
            }
            CalculatorSection("3 POINTS EACH") {
                tg("Age ≥ 75",                                         $ageGE75)
                Hairline(color: NMColor.borderSubtle)
                tg("History of DVT / PE",                              $hxDvtPe)
                Hairline(color: NMColor.borderSubtle)
                tg("Family history of thrombosis",                     $familyHxThrombosis)
                Hairline(color: NMColor.borderSubtle)
                tg("Factor V Leiden / prothrombin mutation",           $factorVLeiden)
                Hairline(color: NMColor.borderSubtle)
                tg("Lupus anticoagulant / antiphospholipid",           $lupusAnticoag)
                Hairline(color: NMColor.borderSubtle)
                tg("HIT (history)",                                    $heparinThrombocytopenia)
            }
            CalculatorSection("5 POINTS EACH") {
                tg("Major joint arthroplasty",                         $arthroplasty)
                Hairline(color: NMColor.borderSubtle)
                tg("Hip / pelvis / leg fracture",                      $hipFracture)
                Hairline(color: NMColor.borderSubtle)
                tg("Stroke (< 1 month)",                               $stroke)
                Hairline(color: NMColor.borderSubtle)
                tg("Multiple trauma",                                  $multipleTrauma)
                Hairline(color: NMColor.borderSubtle)
                tg("Acute spinal cord injury (paralysis, < 1 month)",  $spinalCordInjury)
            }
            CalculatorResultDisplay(
                label: "Caprini Score",
                value: "\(total)",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Sum of weighted risk factors. Surgical-patient-specific.",
                notes: "Validated for surgical patients. For medical inpatients, consider the Padua Prediction Score instead. Pair with bleeding-risk assessment (e.g., IMPROVE bleeding score) before initiating pharmacologic prophylaxis.",
                citations: [capriniRef, openrnRisk3]
            )
        }
    }

    private func tg(_ label: String, _ binding: Binding<Bool>) -> some View {
        Toggle(isOn: binding) {
            Text(label).font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary).lineLimit(2)
        }
        .toggleStyle(.switch)
        .padding(.vertical, NMSpace.base)
    }
}

// MARK: - RASS

public struct RASSCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "rass", key: "level") private var levelID
    private var level: CalculatorScoreRow.Option? { levels.first { $0.id == levelID } }

    private let levels: [CalculatorScoreRow.Option] = [
        .init(id: 1, label: "+4 — combative",                          score: 4),
        .init(id: 2, label: "+3 — very agitated",                      score: 3),
        .init(id: 3, label: "+2 — agitated",                           score: 2),
        .init(id: 4, label: "+1 — restless",                           score: 1),
        .init(id: 5, label: " 0 — alert and calm",                     score: 0),
        .init(id: 6, label: "−1 — drowsy (sustained awakening to voice)", score: -1),
        .init(id: 7, label: "−2 — light sedation (eye opening to voice < 10s)", score: -2),
        .init(id: 8, label: "−3 — moderate sedation (movement / eye opening to voice, no eye contact)", score: -3),
        .init(id: 9, label: "−4 — deep sedation (no response to voice; movement to physical stimulation)", score: -4),
        .init(id: 10, label: "−5 — unarousable (no response to voice or physical stimulation)", score: -5)
    ]

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let l = level else { return nil }
        switch l.score {
        case 4, 3:  return ("Severely agitated. Address pain, delirium, withdrawal; team safety first; sedation per provider order.", .alert)
        case 2, 1:  return ("Agitated / restless. Reorient; non-pharmacologic comfort; assess for pain, urinary retention, anxiety.", .caution)
        case 0:     return ("Target for most ICU patients on light sedation. Continue daily awakening trials.", .neutral)
        case -1, -2:return ("Light sedation — usually appropriate for mechanically ventilated patients with daily SAT/SBT.", .neutral)
        case -3, -4:return ("Moderate-to-deep sedation. Reassess goal of sedation; deeper levels associated with longer vent days, more delirium.", .caution)
        default:    return ("Unarousable. Verify clinically appropriate; rule out neurologic deterioration if unexpected.", .alert)
        }
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "RASS",
            subtitle: "Richmond Agitation-Sedation Scale"
        ) {
            CalculatorSection("LEVEL") {
                CalculatorScoreRow(label: "RASS level", options: levels, selection: $levelID.option(in: levels))
            }
            CalculatorResultDisplay(
                label: "RASS",
                value: level.map { String($0.score >= 0 ? "+\($0.score)" : "\($0.score)") },
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Single 10-point scale from −5 (unarousable) to +4 (combative).\nGoal in most ICU patients is RASS 0 to −2 with daily sedation interruption.",
                notes: "Pair with CAM-ICU for delirium screening every shift. Light sedation (RASS 0 to −2) plus daily spontaneous awakening trials and spontaneous breathing trials reduce ventilator days, ICU stay, and delirium per the ABCDEF bundle.",
                citations: [rassSessler, openrnRisk3]
            )
        }
    }
}

// MARK: - CAM (Confusion Assessment Method)

public struct CAMCalculatorView: View {
    @CalcPersistedBool(calculatorID: "cam", key: "acuteOnsetFluctuating") private var acuteOnsetFluctuating
    @CalcPersistedBool(calculatorID: "cam", key: "inattention")           private var inattention
    @CalcPersistedBool(calculatorID: "cam", key: "disorganizedThinking")  private var disorganizedThinking
    @CalcPersistedBool(calculatorID: "cam", key: "alteredLOC")            private var alteredLOC

    private var camPositive: Bool {
        acuteOnsetFluctuating && inattention && (disorganizedThinking || alteredLOC)
    }

    private var interpretation: (String, CalculatorInterpretationLevel) {
        if camPositive {
            return ("CAM POSITIVE — meets the published Inouye 1990 criteria for delirium (Feature 1 + Feature 2 + Feature 3 OR 4).", .alert)
        }
        if !acuteOnsetFluctuating || !inattention {
            return ("CAM negative — Feature 1 (acute onset / fluctuating course) AND Feature 2 (inattention) are both required by the published algorithm.", .neutral)
        }
        return ("CAM negative — Features 1 and 2 present but neither Feature 3 nor Feature 4 — does not meet the published Inouye 1990 algorithm.", .caution)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.riskScores.eyebrowName,
            title: "CAM",
            subtitle: "Confusion Assessment Method — delirium"
        ) {
            CalculatorSection("FEATURES") {
                Toggle(isOn: $acuteOnsetFluctuating) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Feature 1 — Acute onset and/or fluctuating course")
                            .font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
                        Text("Required").font(NMFont.bodySM).foregroundStyle(NMColor.textTertiary)
                    }
                }
                .toggleStyle(.switch)
                .padding(.vertical, NMSpace.base)
                Hairline(color: NMColor.borderSubtle)
                Toggle(isOn: $inattention) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Feature 2 — Inattention")
                            .font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
                        Text("Required").font(NMFont.bodySM).foregroundStyle(NMColor.textTertiary)
                    }
                }
                .toggleStyle(.switch)
                .padding(.vertical, NMSpace.base)
                Hairline(color: NMColor.borderSubtle)
                Toggle(isOn: $disorganizedThinking) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Feature 3 — Disorganized thinking")
                            .font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
                        Text("Either #3 or #4 needed").font(NMFont.bodySM).foregroundStyle(NMColor.textTertiary)
                    }
                }
                .toggleStyle(.switch)
                .padding(.vertical, NMSpace.base)
                Hairline(color: NMColor.borderSubtle)
                Toggle(isOn: $alteredLOC) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Feature 4 — Altered level of consciousness")
                            .font(NMFont.bodyLG).foregroundStyle(NMColor.textPrimary)
                        Text("Either #3 or #4 needed").font(NMFont.bodySM).foregroundStyle(NMColor.textTertiary)
                    }
                }
                .toggleStyle(.switch)
                .padding(.vertical, NMSpace.base)
            }
            CalculatorResultDisplay(
                label: "CAM",
                value: camPositive ? "POSITIVE" : "Negative",
                interpretation: interpretation.0,
                level: interpretation.1
            )
            CalculatorFormulaSection(
                formula: "Delirium = Feature 1 AND Feature 2 AND (Feature 3 OR Feature 4).",
                notes: "Validated, widely-used bedside delirium screen. CAM-ICU is a non-verbal adaptation for intubated/critically ill patients. Reassess every shift in at-risk populations (postoperative, ICU, elderly hospitalized). Delirium is a medical emergency — investigate cause, do not assume baseline.",
                citations: [camInouye, openrnRisk3]
            )
        }
    }
}
