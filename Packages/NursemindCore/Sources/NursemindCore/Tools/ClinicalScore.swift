import Foundation

/// Pure, testable clinical scoring.
///
/// Companion to `ClinicalFormula` for the point-sum scores. The risk in a score
/// is not arithmetic but the weight table — CHA₂DS₂-VASc gives 2 points for age
/// ≥75 and 1 for 65–74, and the two are mutually exclusive. That kind of rule
/// is invisible in a view's `private var total` and silently misstratifies risk
/// if wrong, so it lives here and is pinned by `CalculatorScoreTests`.
public enum ClinicalScore {

    /// CHA₂DS₂-VASc — stroke risk in non-valvular atrial fibrillation. Max 9.
    /// Age is banded: ≥75 scores 2 and supersedes the 65–74 band's 1.
    public static func cha2ds2VASc(
        chf: Bool,
        hypertension: Bool,
        ageGE75: Bool,
        diabetes: Bool,
        strokeOrTIA: Bool,
        vascularDisease: Bool,
        age65to74: Bool,
        female: Bool
    ) -> Int {
        var score = 0
        if chf { score += 1 }
        if hypertension { score += 1 }
        if ageGE75 { score += 2 }
        if diabetes { score += 1 }
        if strokeOrTIA { score += 2 }
        if vascularDisease { score += 1 }
        if age65to74 && !ageGE75 { score += 1 }
        if female { score += 1 }
        return score
    }

    /// HAS-BLED — bleeding risk on anticoagulation. Nine criteria, 1 each.
    public static func hasBled(
        hypertensionUncontrolled: Bool,
        abnormalRenal: Bool,
        abnormalLiver: Bool,
        strokeHistory: Bool,
        bleedingHistory: Bool,
        labileINR: Bool,
        elderly: Bool,
        drugs: Bool,
        alcohol: Bool
    ) -> Int {
        [hypertensionUncontrolled, abnormalRenal, abnormalLiver, strokeHistory,
         bleedingHistory, labileINR, elderly, drugs, alcohol].filter { $0 }.count
    }

    /// CURB-65 — pneumonia severity. Five criteria, 1 each.
    public static func curb65(
        confusion: Bool,
        ureaHigh: Bool,
        respiratoryRateHigh: Bool,
        lowBloodPressure: Bool,
        ageGE65: Bool
    ) -> Int {
        [confusion, ureaHigh, respiratoryRateHigh, lowBloodPressure, ageGE65].filter { $0 }.count
    }

    /// qSOFA — bedside sepsis screen. Three criteria, 1 each; ≥2 is the alert.
    public static func qSOFA(
        respiratoryRateGE22: Bool,
        alteredMentation: Bool,
        systolicLE100: Bool
    ) -> Int {
        [respiratoryRateGE22, alteredMentation, systolicLE100].filter { $0 }.count
    }

    /// SIRS — four criteria, 1 each; ≥2 meets the historical definition.
    public static func sirs(
        temperatureAbnormal: Bool,
        heartRateAbnormal: Bool,
        respiratoryRateAbnormal: Bool,
        whiteCountAbnormal: Bool
    ) -> Int {
        [temperatureAbnormal, heartRateAbnormal,
         respiratoryRateAbnormal, whiteCountAbnormal].filter { $0 }.count
    }

    /// Glasgow Coma Scale — eye 1–4, verbal 1–5, motor 1–6, total 3–15.
    /// Returns nil for a component outside its scale: there is no GCS of 2, and
    /// a total built from an out-of-range part would look plausible and be wrong.
    public static func glasgowComaScale(eye: Int, verbal: Int, motor: Int) -> Int? {
        guard (1...4).contains(eye), (1...5).contains(verbal), (1...6).contains(motor) else {
            return nil
        }
        return eye + verbal + motor
    }

    /// Apgar — five components scored 0–2, total 0–10.
    public static func apgar(
        appearance: Int, pulse: Int, grimace: Int, activity: Int, respiration: Int
    ) -> Int? {
        let parts = [appearance, pulse, grimace, activity, respiration]
        guard parts.allSatisfy({ (0...2).contains($0) }) else { return nil }
        return parts.reduce(0, +)
    }

    // MARK: - VTE risk

    /// Wells score for DVT. Nine criteria at +1, and an alternative diagnosis
    /// at least as likely subtracts 2 — the only negative term in the score,
    /// and the one that makes the range −2 to 9 rather than 0 to 9.
    public static func wellsDVT(
        activeCancer: Bool, paralysisOrImmobilization: Bool, bedriddenOrMajorSurgery: Bool,
        localizedTenderness: Bool, entireLegSwollen: Bool, calfSwellingOver3cm: Bool,
        pittingEdemaUnilateral: Bool, collateralSuperficialVeins: Bool, previousDVT: Bool,
        alternativeDiagnosisAsLikely: Bool
    ) -> Int {
        var score = [activeCancer, paralysisOrImmobilization, bedriddenOrMajorSurgery,
                     localizedTenderness, entireLegSwollen, calfSwellingOver3cm,
                     pittingEdemaUnilateral, collateralSuperficialVeins, previousDVT]
            .filter { $0 }.count
        if alternativeDiagnosisAsLikely { score -= 2 }
        return score
    }

    /// Padua Prediction Score — VTE risk in hospitalised medical patients.
    /// Four criteria carry 3 points, one carries 2, six carry 1. Max 20.
    public static func padua(
        activeCancer: Bool, previousVTE: Bool, reducedMobility: Bool, thrombophilia: Bool,
        recentTraumaOrSurgery: Bool,
        ageGE70: Bool, heartOrRespiratoryFailure: Bool, acuteMIOrStroke: Bool,
        acuteInfectionOrRheumatologic: Bool, obesityBMI30: Bool, hormonalTreatment: Bool
    ) -> Int {
        var score = 0
        for flag in [activeCancer, previousVTE, reducedMobility, thrombophilia] where flag {
            score += 3
        }
        if recentTraumaOrSurgery { score += 2 }
        for flag in [ageGE70, heartOrRespiratoryFailure, acuteMIOrStroke,
                     acuteInfectionOrRheumatologic, obesityBMI30, hormonalTreatment] where flag {
            score += 1
        }
        return score
    }

    /// Caprini risk assessment model. Weights are tiered 1/2/3/5; the five
    /// 5-point factors are the ones that put a patient straight into the
    /// highest risk category on their own.
    public static func caprini(
        onePointFactors: Int, twoPointFactors: Int, threePointFactors: Int, fivePointFactors: Int
    ) -> Int? {
        let counts = [onePointFactors, twoPointFactors, threePointFactors, fivePointFactors]
        guard counts.allSatisfy({ $0 >= 0 }) else { return nil }
        return onePointFactors + 2 * twoPointFactors + 3 * threePointFactors + 5 * fivePointFactors
    }

    // MARK: - Banded scores

    /// Centor, McIsaac-modified — the age band is what makes it McIsaac, and it
    /// can subtract, so the range is −1 to 5 rather than 0 to 4.
    /// Age band: 3–14 → +1, 15–44 → 0, ≥45 → −1.
    public static func centorMcIsaac(
        ageBandScore: Int, tonsillarExudate: Bool, tenderAnteriorNodes: Bool,
        fever: Bool, absenceOfCough: Bool
    ) -> Int? {
        guard (-1...1).contains(ageBandScore) else { return nil }
        return ageBandScore
            + [tonsillarExudate, tenderAnteriorNodes, fever, absenceOfCough].filter { $0 }.count
    }

    /// ABCD² — TIA stroke risk. Clinical features 0–2 and duration 0–2 are
    /// bands; age, blood pressure and diabetes are 1 each. Range 0–7.
    public static func abcd2(
        clinicalFeatureScore: Int, durationScore: Int,
        ageGE60: Bool, bloodPressureElevated: Bool, diabetes: Bool
    ) -> Int? {
        guard (0...2).contains(clinicalFeatureScore), (0...2).contains(durationScore) else {
            return nil
        }
        return clinicalFeatureScore + durationScore
            + [ageGE60, bloodPressureElevated, diabetes].filter { $0 }.count
    }

    /// ICH score. GCS band 0–2 (13–15 → 0, 5–12 → 1, 3–4 → 2) plus four
    /// one-point criteria. Range 0–6.
    public static func ichScore(
        gcsBandScore: Int, ageGE80: Bool, infratentorialOrigin: Bool,
        volumeGE30: Bool, intraventricularHemorrhage: Bool
    ) -> Int? {
        guard (0...2).contains(gcsBandScore) else { return nil }
        return gcsBandScore
            + [ageGE80, infratentorialOrigin, volumeGE30,
               intraventricularHemorrhage].filter { $0 }.count
    }

    /// Glasgow-Blatchford. Three banded labs plus five flags — syncope, hepatic
    /// disease and cardiac failure are 2 points each, not 1.
    public static func glasgowBlatchford(
        bunScore: Int, hemoglobinScore: Int, systolicScore: Int,
        pulseGE100: Bool, melena: Bool, syncope: Bool,
        hepaticDisease: Bool, cardiacFailure: Bool
    ) -> Int? {
        guard bunScore >= 0, hemoglobinScore >= 0, systolicScore >= 0 else { return nil }
        var score = bunScore + hemoglobinScore + systolicScore
        if pulseGE100 { score += 1 }
        if melena { score += 1 }
        if syncope { score += 2 }
        if hepaticDisease { score += 2 }
        if cardiacFailure { score += 2 }
        return score
    }

    /// Child-Pugh — five components scored 1–3. Range 5–15; there is no zero.
    public static func childPugh(
        encephalopathy: Int, ascites: Int, bilirubin: Int, albumin: Int, inr: Int
    ) -> Int? {
        let parts = [encephalopathy, ascites, bilirubin, albumin, inr]
        guard parts.allSatisfy({ (1...3).contains($0) }) else { return nil }
        return parts.reduce(0, +)
    }

    /// Westley croup score. Each component has a different maximum — cyanosis
    /// reaches 5 and stridor only 2 — so a value valid for one is invalid for
    /// another. Range 0–17.
    public static func westleyCroup(
        levelOfConsciousness: Int, cyanosis: Int, stridor: Int,
        airEntry: Int, retractions: Int
    ) -> Int? {
        guard [0, 5].contains(levelOfConsciousness),
              [0, 4, 5].contains(cyanosis),
              (0...2).contains(stridor),
              (0...2).contains(airEntry),
              (0...3).contains(retractions) else { return nil }
        return levelOfConsciousness + cyanosis + stridor + airEntry + retractions
    }

    // MARK: - Nursing assessment scales

    /// Braden pressure-injury risk. Five subscales score 1–4 but friction and
    /// shear only reaches 3, so the maximum is 23, not 24. Lower is worse.
    public static func braden(
        sensoryPerception: Int, moisture: Int, activity: Int,
        mobility: Int, nutrition: Int, frictionAndShear: Int
    ) -> Int? {
        let fourPoint = [sensoryPerception, moisture, activity, mobility, nutrition]
        guard fourPoint.allSatisfy({ (1...4).contains($0) }),
              (1...3).contains(frictionAndShear) else { return nil }
        return fourPoint.reduce(0, +) + frictionAndShear
    }

    /// Morse Fall Scale. Weights are 0/25, 0/15, 0/15/30, 0/20, 0/10/20, 0/15 —
    /// deliberately non-uniform, and the total runs 0–125.
    public static func morseFallScale(
        historyOfFalling: Int, secondaryDiagnosis: Int, ambulatoryAid: Int,
        ivOrHeparinLock: Int, gait: Int, mentalStatus: Int
    ) -> Int? {
        guard [0, 25].contains(historyOfFalling),
              [0, 15].contains(secondaryDiagnosis),
              [0, 15, 30].contains(ambulatoryAid),
              [0, 20].contains(ivOrHeparinLock),
              [0, 10, 20].contains(gait),
              [0, 15].contains(mentalStatus) else { return nil }
        return historyOfFalling + secondaryDiagnosis + ambulatoryAid
            + ivOrHeparinLock + gait + mentalStatus
    }

    // MARK: - Pulmonary embolism

    /// Revised Geneva score. Heart rate is a band (<75 → 0, 75–94 → 3,
    /// ≥95 → 5); the rest are weighted 1–4, with pain on deep venous palpation
    /// plus unilateral oedema the single heaviest criterion at 4. Max 22.
    public static func genevaPERevised(
        heartRateBandScore: Int, ageGE65: Bool, previousVTE: Bool,
        surgeryOrFractureWithinMonth: Bool, activeMalignancy: Bool,
        unilateralLimbPain: Bool, hemoptysis: Bool, painOnPalpationAndEdema: Bool
    ) -> Int? {
        guard [0, 3, 5].contains(heartRateBandScore) else { return nil }
        var score = heartRateBandScore
        if ageGE65 { score += 1 }
        if previousVTE { score += 3 }
        if surgeryOrFractureWithinMonth { score += 2 }
        if activeMalignancy { score += 2 }
        if unilateralLimbPain { score += 3 }
        if hemoptysis { score += 2 }
        if painOnPalpationAndEdema { score += 4 }
        return score
    }

    /// PESI — the original, where age in years is the base and everything else
    /// is added to it. Altered mental status is 60 points, twice the next
    /// heaviest, so a confused patient is class IV on that criterion alone.
    public static func pesi(
        ageYears: Int, male: Bool, cancer: Bool, heartFailure: Bool, chronicLungDisease: Bool,
        pulseGE110: Bool, systolicUnder100: Bool, respiratoryRateGE30: Bool,
        temperatureUnder36: Bool, alteredMentalStatus: Bool, oxygenSaturationUnder90: Bool
    ) -> Int? {
        guard ageYears > 0, ageYears < 130 else { return nil }
        var score = ageYears
        if male { score += 10 }
        if cancer { score += 30 }
        if heartFailure { score += 10 }
        if chronicLungDisease { score += 10 }
        if pulseGE110 { score += 20 }
        if systolicUnder100 { score += 30 }
        if respiratoryRateGE30 { score += 20 }
        if temperatureUnder36 { score += 20 }
        if alteredMentalStatus { score += 60 }
        if oxygenSaturationUnder90 { score += 20 }
        return score
    }

    // MARK: - Haematology and obstetrics

    /// HIT 4Ts — four components scored 0–2. Range 0–8; ≤3 is low probability.
    public static func hit4Ts(
        thrombocytopenia: Int, timing: Int, thrombosis: Int, otherCauses: Int
    ) -> Int? {
        let parts = [thrombocytopenia, timing, thrombosis, otherCauses]
        guard parts.allSatisfy({ (0...2).contains($0) }) else { return nil }
        return parts.reduce(0, +)
    }

    /// Bishop score — cervical readiness for induction. Dilation, effacement
    /// and station reach 3; consistency and position only reach 2. Max 13.
    public static func bishop(
        dilation: Int, effacement: Int, consistency: Int, position: Int, station: Int
    ) -> Int? {
        guard (0...3).contains(dilation), (0...3).contains(effacement),
              (0...2).contains(consistency), (0...2).contains(position),
              (0...3).contains(station) else { return nil }
        return dilation + effacement + consistency + position + station
    }

    // MARK: - Uniform-component instruments

    /// Sums instruments whose items share one scale. Enforces the item count as
    /// well as the range: a PHQ-9 scored over eight items is not a PHQ-9, and
    /// the total would land in a lower severity band than the patient's.
    private static func sum(_ items: [Int], count: Int, each range: ClosedRange<Int>) -> Int? {
        guard items.count == count, items.allSatisfy({ range.contains($0) }) else { return nil }
        return items.reduce(0, +)
    }

    /// HEART score — history, ECG, age, risk factors, troponin, each 0–2. Max 10.
    public static func heartScore(
        history: Int, ecg: Int, age: Int, riskFactors: Int, troponin: Int
    ) -> Int? {
        sum([history, ecg, age, riskFactors, troponin], count: 5, each: 0...2)
    }

    /// FLACC — face, legs, activity, cry, consolability, each 0–2. Max 10.
    public static func flacc(
        face: Int, legs: Int, activity: Int, cry: Int, consolability: Int
    ) -> Int? {
        sum([face, legs, activity, cry, consolability], count: 5, each: 0...2)
    }

    /// SOFA — six organ systems, each 0–4. Max 24.
    public static func sofa(
        respiration: Int, coagulation: Int, liver: Int,
        cardiovascular: Int, cns: Int, renal: Int
    ) -> Int? {
        sum([respiration, coagulation, liver, cardiovascular, cns, renal],
            count: 6, each: 0...4)
    }

    /// Aldrete post-anaesthesia recovery — five components, each 0–2. Max 10;
    /// 9 is the usual discharge threshold, so the ceiling matters.
    public static func aldrete(
        activity: Int, respiration: Int, circulation: Int,
        consciousness: Int, oxygenSaturation: Int
    ) -> Int? {
        sum([activity, respiration, circulation, consciousness, oxygenSaturation],
            count: 5, each: 0...2)
    }

    /// PHQ-9 — nine items, each 0–3. Max 27.
    public static func phq9(items: [Int]) -> Int? { sum(items, count: 9, each: 0...3) }

    /// GAD-7 — seven items, each 0–3. Max 21.
    public static func gad7(items: [Int]) -> Int? { sum(items, count: 7, each: 0...3) }

    /// Epworth Sleepiness Scale — eight situations, each 0–3. Max 24.
    public static func epworth(items: [Int]) -> Int? { sum(items, count: 8, each: 0...3) }

    /// AUDIT-C — frequency, typical amount, binge frequency, each 0–4. Max 12.
    public static func auditC(frequency: Int, amount: Int, bingeFrequency: Int) -> Int? {
        sum([frequency, amount, bingeFrequency], count: 3, each: 0...4)
    }

    /// Brighton PEWS — three 0–3 domains plus two +2 modifiers for quarter-hourly
    /// nebulisers and persistent post-operative vomiting. Max 13, not 9.
    public static func pews(
        behavior: Int, cardiovascular: Int, respiratory: Int,
        quarterHourlyNebulizers: Bool, persistentVomiting: Bool
    ) -> Int? {
        guard let base = sum([behavior, cardiovascular, respiratory], count: 3, each: 0...3) else {
            return nil
        }
        return base
            + (quarterHourlyNebulizers ? 2 : 0)
            + (persistentVomiting ? 2 : 0)
    }

    /// CIWA-Ar — nine symptom items scored 0–7 plus orientation scored 0–4.
    /// Max 67. Orientation is the odd one out; scoring it 0–7 would overstate
    /// withdrawal severity and over-treat.
    public static func ciwaAr(symptomItems: [Int], orientation: Int) -> Int? {
        guard let symptoms = sum(symptomItems, count: 9, each: 0...7),
              (0...4).contains(orientation) else { return nil }
        return symptoms + orientation
    }
}
