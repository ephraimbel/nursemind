import Foundation

/// Pure, testable clinical arithmetic.
///
/// These formulas previously lived as `private var result` inside each
/// SwiftUI calculator view, which made them unreachable from tests — a wrong
/// constant could ship and nothing would catch it. Every function here is
/// referenced by exactly one view and pinned by golden-value tests in
/// `CalculatorMathTests`.
///
/// Each returns `nil` for input outside the formula's valid domain rather than
/// a misleading number. Sources are named because that is what makes a bare
/// constant like 0.9938 auditable later.
public enum ClinicalFormula {

    public enum Sex: Sendable { case male, female }

    // MARK: - Anthropometry

    /// Body mass index — kg/m².
    public static func bmi(weightKg: Double, heightCm: Double) -> Double? {
        guard weightKg > 0, heightCm > 0 else { return nil }
        let meters = heightCm / 100.0
        return weightKg / (meters * meters)
    }

    /// Body surface area — Mosteller: √(kg × cm / 3600).
    public static func bsaMosteller(weightKg: Double, heightCm: Double) -> Double? {
        guard weightKg > 0, heightCm > 0 else { return nil }
        return ((weightKg * heightCm) / 3600.0).squareRoot()
    }

    /// Ideal body weight — Devine: 50 kg (male) / 45.5 kg (female), plus 2.3 kg
    /// per inch over 5 feet. Devine's formula is undefined below 5 feet; height
    /// under that clamps to the base weight rather than extrapolating downward.
    public static func idealBodyWeightDevine(heightCm: Double, sex: Sex) -> Double? {
        guard heightCm > 0 else { return nil }
        let inchesOver5Ft = max(heightCm / 2.54 - 60.0, 0)
        let base: Double = (sex == .male) ? 50.0 : 45.5
        return base + 2.3 * inchesOver5Ft
    }

    // MARK: - Cardiovascular

    /// Mean arterial pressure — DBP + (SBP − DBP)/3.
    public static func meanArterialPressure(systolic: Double, diastolic: Double) -> Double? {
        guard systolic > 0, diastolic > 0, systolic >= diastolic else { return nil }
        return diastolic + (systolic - diastolic) / 3.0
    }

    /// Cardiac index — cardiac output indexed to body surface area.
    public static func cardiacIndex(cardiacOutput: Double, bsa: Double) -> Double? {
        guard cardiacOutput > 0, bsa > 0 else { return nil }
        return cardiacOutput / bsa
    }

    /// Shock index — HR ÷ SBP.
    public static func shockIndex(heartRate: Double, systolic: Double) -> Double? {
        guard heartRate > 0, systolic > 0 else { return nil }
        return heartRate / systolic
    }

    public static func pulsePressure(systolic: Double, diastolic: Double) -> Double? {
        guard systolic > 0, diastolic > 0, systolic >= diastolic else { return nil }
        return systolic - diastolic
    }

    /// Ankle-brachial index — higher ankle systolic ÷ higher brachial systolic.
    public static func ankleBrachialIndex(ankleSystolic: Double, armSystolic: Double) -> Double? {
        guard ankleSystolic > 0, armSystolic > 0 else { return nil }
        return ankleSystolic / armSystolic
    }

    /// Cerebral perfusion pressure — MAP − ICP.
    public static func cerebralPerfusionPressure(map: Double, icp: Double) -> Double? {
        guard map > 0 else { return nil }
        return map - icp
    }

    // MARK: - Renal · Metabolic

    /// eGFR — CKD-EPI 2021 creatinine equation, the race-free revision.
    /// 142 × min(Scr/κ,1)^α × max(Scr/κ,1)^−1.200 × 0.9938^age × 1.012 (female).
    /// Inker LA et al. N Engl J Med 2021;385:1737-49.
    public static func egfrCKDEPI2021(creatinine: Double, age: Double, sex: Sex) -> Double? {
        guard creatinine > 0, age > 0, age < 130 else { return nil }
        let kappa: Double = (sex == .female) ? 0.7 : 0.9
        let alpha: Double = (sex == .female) ? -0.241 : -0.302
        let sexMultiplier: Double = (sex == .female) ? 1.012 : 1.0
        let ratio = creatinine / kappa
        return 142.0
            * pow(min(ratio, 1.0), alpha)
            * pow(max(ratio, 1.0), -1.200)
            * pow(0.9938, age)
            * sexMultiplier
    }

    /// Creatinine clearance — Cockcroft-Gault, × 0.85 for female.
    public static func creatinineClearanceCockcroftGault(
        age: Double, weightKg: Double, creatinine: Double, sex: Sex
    ) -> Double? {
        guard age > 0, age < 130, weightKg > 0, creatinine > 0 else { return nil }
        let raw = ((140.0 - age) * weightKg) / (72.0 * creatinine)
        return sex == .female ? raw * 0.85 : raw
    }

    /// Sodium corrected for hyperglycemia — Hillier's 2.4 mEq/L per 100 mg/dL
    /// over 100, which tracks measured osmolality better than Katz's 1.6.
    /// Returns nil at or below 100 mg/dL, where no correction applies.
    public static func correctedSodium(measuredNa: Double, glucose: Double) -> Double? {
        guard glucose > 100 else { return nil }
        return measuredNa + 2.4 * ((glucose - 100.0) / 100.0)
    }

    /// Calcium corrected for albumin — Ca + 0.8 × (4.0 − albumin).
    public static func correctedCalcium(totalCalcium: Double, albumin: Double) -> Double? {
        totalCalcium + 0.8 * (4.0 - albumin)
    }

    /// Fractional excretion of sodium, as a percentage.
    public static func fractionalExcretionOfSodium(
        urineNa: Double, serumNa: Double, urineCreatinine: Double, serumCreatinine: Double
    ) -> Double? {
        guard serumNa > 0, urineCreatinine > 0, serumCreatinine > 0 else { return nil }
        return ((urineNa * serumCreatinine) / (serumNa * urineCreatinine)) * 100.0
    }

    /// Calculated plasma osmolality — 2×Na + glucose/18 + BUN/2.8 (US units).
    public static func plasmaOsmolality(sodium: Double, glucose: Double, bun: Double) -> Double? {
        2.0 * sodium + glucose / 18.0 + bun / 2.8
    }

    // MARK: - Respiratory

    /// P/F ratio — PaO₂ ÷ FiO₂ as a fraction. `fio2Percent` is 21–100.
    public static func pfRatio(pao2: Double, fio2Percent: Double) -> Double? {
        guard pao2 > 0, fio2Percent > 0 else { return nil }
        return pao2 / (fio2Percent / 100.0)
    }

    /// Oxygenation index — (FiO₂ × mean airway pressure × 100) ÷ PaO₂.
    public static func oxygenationIndex(
        fio2Percent: Double, meanAirwayPressure: Double, pao2: Double
    ) -> Double? {
        guard fio2Percent > 0, meanAirwayPressure > 0, pao2 > 0 else { return nil }
        return ((fio2Percent / 100.0) * meanAirwayPressure * 100.0) / pao2
    }

    public static func packYears(packsPerDay: Double, yearsSmoked: Double) -> Double? {
        guard packsPerDay > 0, yearsSmoked > 0 else { return nil }
        return packsPerDay * yearsSmoked
    }

    /// Rapid shallow breathing index — RR ÷ tidal volume in litres.
    /// Tidal volume is entered in mL, so the conversion is part of the formula.
    public static func rapidShallowBreathingIndex(
        respiratoryRate: Double, tidalVolumeMl: Double
    ) -> Double? {
        guard respiratoryRate > 0, tidalVolumeMl > 0 else { return nil }
        return respiratoryRate / (tidalVolumeMl / 1000.0)
    }

    // MARK: - Hepatic

    /// MELD (original) — 3.78·ln(bili) + 11.2·ln(INR) + 9.57·ln(Cr) + 6.43.
    ///
    /// The clamps are part of the score, not defensive coding: each value is
    /// floored at 1.0 so no logarithm goes negative, creatinine is capped at
    /// 4.0, two or more dialysis sessions in the past week force creatinine to
    /// 4.0, and the result is bounded 6–40 per OPTN.
    public static func meldClassic(
        bilirubin: Double, inr: Double, creatinine: Double, onDialysis: Bool
    ) -> Double? {
        guard bilirubin > 0, inr > 0, creatinine > 0 else { return nil }
        let bili = max(bilirubin, 1.0)
        let ratio = max(inr, 1.0)
        var creat = max(creatinine, 1.0)
        if onDialysis || creat > 4.0 { creat = 4.0 }
        let raw = 3.78 * log(bili) + 11.2 * log(ratio) + 9.57 * log(creat) + 6.43
        return min(max(raw, 6.0), 40.0)
    }
}
