import SwiftUI

private let lundBrowder1944 = CitationSource(
    id: "lund_browder_1944",
    shortName: "Lund-Browder Chart — Lund CC, Browder NC, Surg Gynecol Obstet 1944 (concept citation)",
    detail: "Age-stratified body-region percentages for burn TBSA estimation; the standard pediatric chart",
    publisher: "Surgery, Gynecology & Obstetrics",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/14292962/",
    lastRetrieved: "2026-05-04"
)

private let openrnBurns2 = CitationSource(
    id: "openrn_burns_2",
    shortName: "Open RN Health Alterations — Burns / TBSA",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=burns+tbsa",
    lastRetrieved: "2026-05-04"
)

// MARK: - Lund-Browder

public struct LundBrowderCalculatorView: View {
    @CalcPersistedOptionID(calculatorID: "lund-browder", key: "ageGroup") private var ageGroupID
    private var ageGroup: CalculatorScoreRow.Option? { ageOptions.first { $0.id == ageGroupID } }

    // Symmetric body regions — toggled per side
    @CalcPersistedBool(calculatorID: "lund-browder", key: "head")          private var head
    @CalcPersistedBool(calculatorID: "lund-browder", key: "neck")          private var neck
    @CalcPersistedBool(calculatorID: "lund-browder", key: "antTrunk")      private var antTrunk
    @CalcPersistedBool(calculatorID: "lund-browder", key: "postTrunk")     private var postTrunk
    @CalcPersistedBool(calculatorID: "lund-browder", key: "rightButtock")  private var rightButtock
    @CalcPersistedBool(calculatorID: "lund-browder", key: "leftButtock")   private var leftButtock
    @CalcPersistedBool(calculatorID: "lund-browder", key: "genitalia")     private var genitalia
    @CalcPersistedBool(calculatorID: "lund-browder", key: "rightUpperArm") private var rightUpperArm
    @CalcPersistedBool(calculatorID: "lund-browder", key: "leftUpperArm")  private var leftUpperArm
    @CalcPersistedBool(calculatorID: "lund-browder", key: "rightForearm")  private var rightForearm
    @CalcPersistedBool(calculatorID: "lund-browder", key: "leftForearm")   private var leftForearm
    @CalcPersistedBool(calculatorID: "lund-browder", key: "rightHand")     private var rightHand
    @CalcPersistedBool(calculatorID: "lund-browder", key: "leftHand")      private var leftHand
    @CalcPersistedBool(calculatorID: "lund-browder", key: "rightThigh")    private var rightThigh
    @CalcPersistedBool(calculatorID: "lund-browder", key: "leftThigh")     private var leftThigh
    @CalcPersistedBool(calculatorID: "lund-browder", key: "rightLeg")      private var rightLeg
    @CalcPersistedBool(calculatorID: "lund-browder", key: "leftLeg")       private var leftLeg
    @CalcPersistedBool(calculatorID: "lund-browder", key: "rightFoot")     private var rightFoot
    @CalcPersistedBool(calculatorID: "lund-browder", key: "leftFoot")      private var leftFoot

    private let ageOptions: [CalculatorScoreRow.Option] = [
        .init(id: 0, label: "< 1 year",   score: 0),
        .init(id: 1, label: "1–4 years",  score: 1),
        .init(id: 2, label: "5–9 years",  score: 2),
        .init(id: 3, label: "10–14 years", score: 3),
        .init(id: 4, label: "15 years",   score: 4),
        .init(id: 5, label: "Adult",      score: 5)
    ]

    // Lund-Browder published percentages by age band (head, each thigh, each leg)
    private func headPct(_ band: Int) -> Double {
        switch band { case 0: return 19; case 1: return 17; case 2: return 13; case 3: return 11; case 4: return 9; default: return 7 }
    }
    private func thighPct(_ band: Int) -> Double {
        switch band { case 0: return 5.5; case 1: return 6.5; case 2: return 8; case 3: return 8.5; case 4: return 9; default: return 9.5 }
    }
    private func legPct(_ band: Int) -> Double {
        switch band { case 0: return 5; case 1: return 5; case 2: return 5.5; case 3: return 6; case 4: return 6.5; default: return 7 }
    }

    private var tbsa: Double? {
        guard let ag = ageGroup else { return nil }
        let band = ag.score
        var t = 0.0
        if head            { t += headPct(band) }
        if neck            { t += 2 }
        if antTrunk        { t += 13 }
        if postTrunk       { t += 13 }
        if rightButtock    { t += 2.5 }
        if leftButtock     { t += 2.5 }
        if genitalia       { t += 1 }
        if rightUpperArm   { t += 4 }
        if leftUpperArm    { t += 4 }
        if rightForearm    { t += 3 }
        if leftForearm     { t += 3 }
        if rightHand       { t += 2.5 }
        if leftHand        { t += 2.5 }
        if rightThigh      { t += thighPct(band) }
        if leftThigh       { t += thighPct(band) }
        if rightLeg        { t += legPct(band) }
        if leftLeg         { t += legPct(band) }
        if rightFoot       { t += 3.5 }
        if leftFoot        { t += 3.5 }
        return t
    }

    private var interpretation: (String, CalculatorInterpretationLevel)? {
        guard let v = tbsa else { return nil }
        if v >= 20 { return ("TBSA ≥ 20% — published criterion for major burn referral to a verified burn center per ABA Burn Center Referral Criteria.", .alert) }
        if v >= 10 { return ("TBSA 10–19% — published criterion for moderate burn; ABA recommends burn-center referral for partial-thickness burns ≥ 10% TBSA in adults.", .caution) }
        return ("TBSA < 10% — published criterion for minor burn in adults without other risk modifiers (face/hands/feet/genitalia/joints, electrical, chemical, inhalation, comorbid disease, or pediatric/elderly).", .neutral)
    }

    public var body: some View {
        CalculatorScaffold(
            eyebrow: CalculatorCategory.burns.eyebrowName,
            title: "Lund-Browder",
            subtitle: "Age-adjusted TBSA estimation"
        ) {
            CalculatorSection("AGE BAND") {
                CalculatorScoreRow(label: "Patient age", options: ageOptions, selection: $ageGroupID.option(in: ageOptions))
            }
            CalculatorSection("AXIAL") {
                Toggle("Head (varies by age)",        isOn: $head).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Neck (2%)",                    isOn: $neck).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Anterior trunk (13%)",         isOn: $antTrunk).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Posterior trunk (13%)",        isOn: $postTrunk).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Right buttock (2.5%)",         isOn: $rightButtock).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Left buttock (2.5%)",          isOn: $leftButtock).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Genitalia (1%)",               isOn: $genitalia).toggleStyle(.switch)
            }
            CalculatorSection("UPPER LIMBS") {
                Toggle("Right upper arm (4%)",         isOn: $rightUpperArm).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Left upper arm (4%)",          isOn: $leftUpperArm).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Right forearm (3%)",           isOn: $rightForearm).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Left forearm (3%)",            isOn: $leftForearm).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Right hand (2.5%)",            isOn: $rightHand).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Left hand (2.5%)",             isOn: $leftHand).toggleStyle(.switch)
            }
            CalculatorSection("LOWER LIMBS") {
                Toggle("Right thigh (varies by age)",  isOn: $rightThigh).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Left thigh (varies by age)",   isOn: $leftThigh).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Right leg (varies by age)",    isOn: $rightLeg).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Left leg (varies by age)",     isOn: $leftLeg).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Right foot (3.5%)",            isOn: $rightFoot).toggleStyle(.switch)
                Hairline(color: NMColor.borderSubtle)
                Toggle("Left foot (3.5%)",             isOn: $leftFoot).toggleStyle(.switch)
            }
            CalculatorResultDisplay(
                label: "TBSA",
                value: tbsa.map { String(format: "%.1f", $0) },
                unit: "%",
                interpretation: interpretation?.0,
                level: interpretation?.1 ?? .neutral
            )
            CalculatorFormulaSection(
                formula: "Sum of body-region percentages (per Lund-Browder age-adjusted chart).\nHead, each thigh, each leg differ by age band; trunk, neck, arms, hands, feet, genitalia are constant.",
                notes: "More accurate than Rule of Nines in children because it accounts for the proportionally larger pediatric head and smaller legs. For partial-thickness burns only — exclude superficial (first-degree / epidermal) burns from TBSA per ABA convention. Use a body diagram to map exact involvement; this calculator estimates whole-region involvement.",
                citations: [lundBrowder1944, openrnBurns2]
            )
        }
    }
}
