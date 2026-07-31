import Foundation
import Testing
@testable import NursemindCore

// Golden-value tests for the continuous clinical formulas.
//
// Expected values are derived from the published formula independently of the
// implementation — a test that asserts whatever the code already returns would
// pass just as happily against a wrong constant. Where possible the case is
// chosen to land on a threshold a nurse actually acts on (P/F 200, RSBI 100,
// FENa < 1%, MAP 93) so a broken formula fails somewhere meaningful.

private func expect(
    _ actual: Double?,
    _ expected: Double,
    tolerance: Double = 0.01,
    _ label: String,
    sourceLocation: SourceLocation = #_sourceLocation
) {
    guard let actual else {
        Issue.record("\(label): got nil, expected \(expected)", sourceLocation: sourceLocation)
        return
    }
    #expect(
        abs(actual - expected) <= tolerance,
        "\(label): got \(actual), expected \(expected) ± \(tolerance)",
        sourceLocation: sourceLocation
    )
}

@Suite("Calculator math — anthropometry")
struct AnthropometryMathTests {

    @Test("BMI is kg over metres squared")
    func bmi() {
        // 70 / 1.75² = 70 / 3.0625
        expect(ClinicalFormula.bmi(weightKg: 70, heightCm: 175), 22.857, "BMI 70kg/175cm")
        // 100 / 1.80² = 100 / 3.24
        expect(ClinicalFormula.bmi(weightKg: 100, heightCm: 180), 30.864, "BMI 100kg/180cm")
        #expect(ClinicalFormula.bmi(weightKg: 0, heightCm: 175) == nil)
        #expect(ClinicalFormula.bmi(weightKg: 70, heightCm: 0) == nil)
    }

    @Test("BSA follows Mosteller")
    func bsa() {
        // √(70 × 175 / 3600) = √3.40278
        expect(ClinicalFormula.bsaMosteller(weightKg: 70, heightCm: 175), 1.8447, tolerance: 0.001,
               "BSA 70kg/175cm")
        // √(3600/3600) — the formula's unit point
        expect(ClinicalFormula.bsaMosteller(weightKg: 60, heightCm: 60), 1.0, tolerance: 0.0001,
               "BSA unit case")
        #expect(ClinicalFormula.bsaMosteller(weightKg: -1, heightCm: 175) == nil)
    }

    @Test("Ideal body weight follows Devine")
    func idealBodyWeight() {
        // Male: 50 + 2.3 × (175/2.54 − 60) = 50 + 2.3 × 8.8976
        expect(ClinicalFormula.idealBodyWeightDevine(heightCm: 175, sex: .male), 70.465,
               "IBW male 175cm")
        // Female: 45.5 + 2.3 × (165/2.54 − 60) = 45.5 + 2.3 × 4.9606
        expect(ClinicalFormula.idealBodyWeightDevine(heightCm: 165, sex: .female), 56.909,
               "IBW female 165cm")
        // Exactly 5 feet — no increment for either sex
        expect(ClinicalFormula.idealBodyWeightDevine(heightCm: 152.4, sex: .male), 50.0,
               "IBW male 5ft")
        expect(ClinicalFormula.idealBodyWeightDevine(heightCm: 152.4, sex: .female), 45.5,
               "IBW female 5ft")
        // Below 5 feet clamps rather than extrapolating to a negative increment
        expect(ClinicalFormula.idealBodyWeightDevine(heightCm: 140, sex: .male), 50.0,
               "IBW male below 5ft")
    }
}

@Suite("Calculator math — cardiovascular")
struct CardiovascularMathTests {

    @Test("MAP is diastolic plus a third of the pulse pressure")
    func map() {
        // 80 + (120 − 80)/3 = 80 + 13.333
        expect(ClinicalFormula.meanArterialPressure(systolic: 120, diastolic: 80), 93.333,
               "MAP 120/80")
        // 60 + (90 − 60)/3 = 70 — under the Surviving Sepsis 65 target
        expect(ClinicalFormula.meanArterialPressure(systolic: 90, diastolic: 60), 70.0,
               "MAP 90/60")
        // Equal pressures degenerate to that value, not a divide artefact
        expect(ClinicalFormula.meanArterialPressure(systolic: 100, diastolic: 100), 100.0,
               "MAP 100/100")
        // Diastolic above systolic is a transposed entry, not a computation
        #expect(ClinicalFormula.meanArterialPressure(systolic: 80, diastolic: 120) == nil)
    }

    @Test("Cardiac index is output over BSA")
    func cardiacIndex() {
        expect(ClinicalFormula.cardiacIndex(cardiacOutput: 5.0, bsa: 1.8), 2.778, "CI 5.0/1.8")
        #expect(ClinicalFormula.cardiacIndex(cardiacOutput: 5.0, bsa: 0) == nil)
    }

    @Test("Shock index is HR over systolic")
    func shockIndex() {
        // 120/90 — above the 0.9 concern threshold
        expect(ClinicalFormula.shockIndex(heartRate: 120, systolic: 90), 1.333, "SI 120/90")
        expect(ClinicalFormula.shockIndex(heartRate: 70, systolic: 120), 0.583, "SI 70/120")
        #expect(ClinicalFormula.shockIndex(heartRate: 120, systolic: 0) == nil)
    }

    @Test("Pulse pressure is the difference")
    func pulsePressure() {
        expect(ClinicalFormula.pulsePressure(systolic: 120, diastolic: 80), 40.0, "PP 120/80")
        // Narrow pulse pressure — the finding that matters clinically
        expect(ClinicalFormula.pulsePressure(systolic: 90, diastolic: 75), 15.0, "PP 90/75")
        #expect(ClinicalFormula.pulsePressure(systolic: 80, diastolic: 120) == nil)
    }

    @Test("ABI is ankle over brachial")
    func abi() {
        expect(ClinicalFormula.ankleBrachialIndex(ankleSystolic: 140, armSystolic: 120), 1.167,
               "ABI 140/120")
        // 0.9 — the PAD cutoff
        expect(ClinicalFormula.ankleBrachialIndex(ankleSystolic: 108, armSystolic: 120), 0.9,
               "ABI at PAD cutoff")
        #expect(ClinicalFormula.ankleBrachialIndex(ankleSystolic: 140, armSystolic: 0) == nil)
    }

    @Test("CPP is MAP minus ICP")
    func cpp() {
        // 85 − 20 = 65, the Brain Trauma Foundation floor
        expect(ClinicalFormula.cerebralPerfusionPressure(map: 85, icp: 20), 65.0, "CPP 85/20")
        // Raised ICP can drive CPP negative — that must not be clamped away
        expect(ClinicalFormula.cerebralPerfusionPressure(map: 60, icp: 70), -10.0,
               "CPP with ICP above MAP")
        #expect(ClinicalFormula.cerebralPerfusionPressure(map: 0, icp: 20) == nil)
    }
}

@Suite("Calculator math — renal and metabolic")
struct RenalMathTests {

    @Test("eGFR follows CKD-EPI 2021")
    func egfr() {
        // Female 50y, Scr 1.0: ratio 1.4286 > 1, so 142 × 1.4286^−1.2 × 0.9938^50 × 1.012
        expect(ClinicalFormula.egfrCKDEPI2021(creatinine: 1.0, age: 50, sex: .female), 68.63,
               tolerance: 0.1, "eGFR female 50y Scr 1.0")
        // Male 60y, Scr 1.5: 142 × (1.5/0.9)^−1.2 × 0.9938^60
        expect(ClinicalFormula.egfrCKDEPI2021(creatinine: 1.5, age: 60, sex: .male), 52.96,
               tolerance: 0.1, "eGFR male 60y Scr 1.5")
        // Male 40y, Scr 0.8: ratio 0.889 < 1, exercising the min-term branch
        expect(ClinicalFormula.egfrCKDEPI2021(creatinine: 0.8, age: 40, sex: .male), 114.74,
               tolerance: 0.1, "eGFR male 40y Scr 0.8")
        #expect(ClinicalFormula.egfrCKDEPI2021(creatinine: 0, age: 50, sex: .male) == nil)
        #expect(ClinicalFormula.egfrCKDEPI2021(creatinine: 1.0, age: 200, sex: .male) == nil)
    }

    @Test("eGFR applies the female multiplier, not a race coefficient")
    func egfrSexDifference() {
        // The 2021 revision dropped race and kept a 1.012 female term. Same
        // inputs across sexes must differ only by the published κ/α/1.012 set.
        let female = ClinicalFormula.egfrCKDEPI2021(creatinine: 1.0, age: 50, sex: .female)
        let male = ClinicalFormula.egfrCKDEPI2021(creatinine: 1.0, age: 50, sex: .male)
        #expect(female != nil && male != nil)
        #expect(female! < male!, "female eGFR should be lower at identical creatinine")
    }

    @Test("Creatinine clearance follows Cockcroft-Gault")
    func cockcroftGault() {
        // ((140 − 60) × 70) / (72 × 1.2) = 5600 / 86.4
        expect(ClinicalFormula.creatinineClearanceCockcroftGault(
            age: 60, weightKg: 70, creatinine: 1.2, sex: .male), 64.815, "CrCl male")
        // Same case × 0.85
        expect(ClinicalFormula.creatinineClearanceCockcroftGault(
            age: 60, weightKg: 70, creatinine: 1.2, sex: .female), 55.093, "CrCl female")
        #expect(ClinicalFormula.creatinineClearanceCockcroftGault(
            age: 60, weightKg: 70, creatinine: 0, sex: .male) == nil)
    }

    @Test("Sodium correction uses 2.4 per 100 mg/dL over 100")
    func correctedSodium() {
        // 130 + 2.4 × (600 − 100)/100 = 130 + 12
        expect(ClinicalFormula.correctedSodium(measuredNa: 130, glucose: 600), 142.0,
               "corrected Na at glucose 600")
        // 125 + 2.4 × 2 = 129.8
        expect(ClinicalFormula.correctedSodium(measuredNa: 125, glucose: 300), 129.8,
               "corrected Na at glucose 300")
        // No correction applies at or below 100 mg/dL
        #expect(ClinicalFormula.correctedSodium(measuredNa: 140, glucose: 100) == nil)
        #expect(ClinicalFormula.correctedSodium(measuredNa: 140, glucose: 85) == nil)
    }

    @Test("Calcium correction is 0.8 per g/dL of albumin deficit")
    func correctedCalcium() {
        // 8.0 + 0.8 × (4.0 − 2.0) = 9.6 — hypocalcaemia that is only apparent
        expect(ClinicalFormula.correctedCalcium(totalCalcium: 8.0, albumin: 2.0), 9.6,
               "corrected Ca at albumin 2.0")
        // Normal albumin leaves the measured value untouched
        expect(ClinicalFormula.correctedCalcium(totalCalcium: 8.0, albumin: 4.0), 8.0,
               "corrected Ca at albumin 4.0")
        // Albumin above 4.0 corrects downward
        expect(ClinicalFormula.correctedCalcium(totalCalcium: 10.0, albumin: 5.0), 9.2,
               "corrected Ca at albumin 5.0")
    }

    @Test("FENa is a percentage")
    func fena() {
        // (20 × 2.0) / (140 × 50) × 100 = 0.5714 — prerenal, under 1%
        expect(ClinicalFormula.fractionalExcretionOfSodium(
            urineNa: 20, serumNa: 140, urineCreatinine: 50, serumCreatinine: 2.0), 0.5714,
               tolerance: 0.001, "FENa prerenal")
        // (60 × 2.0) / (140 × 30) × 100 = 2.857 — intrinsic, over 2%
        expect(ClinicalFormula.fractionalExcretionOfSodium(
            urineNa: 60, serumNa: 140, urineCreatinine: 30, serumCreatinine: 2.0), 2.857,
               "FENa intrinsic")
        #expect(ClinicalFormula.fractionalExcretionOfSodium(
            urineNa: 20, serumNa: 140, urineCreatinine: 0, serumCreatinine: 2.0) == nil)
    }

    @Test("Plasma osmolality uses the 18 and 2.8 divisors")
    func osmolality() {
        // 2×140 + 90/18 + 14/2.8 = 280 + 5 + 5
        expect(ClinicalFormula.plasmaOsmolality(sodium: 140, glucose: 90, bun: 14), 290.0,
               "osmolality normal")
        // 2×130 + 900/18 + 28/2.8 = 260 + 50 + 10 — DKA
        expect(ClinicalFormula.plasmaOsmolality(sodium: 130, glucose: 900, bun: 28), 320.0,
               "osmolality in DKA")
    }
}

@Suite("Calculator math — respiratory")
struct RespiratoryMathTests {

    @Test("P/F ratio divides by FiO2 as a fraction")
    func pfRatio() {
        // 80 / 0.40 = 200 — the Berlin moderate/severe ARDS boundary
        expect(ClinicalFormula.pfRatio(pao2: 80, fio2Percent: 40), 200.0, "P/F at ARDS boundary")
        // 60 / 1.00 = 60 — severe
        expect(ClinicalFormula.pfRatio(pao2: 60, fio2Percent: 100), 60.0, "P/F on 100%")
        // 95 / 0.21 = 452.4 — room air, normal
        expect(ClinicalFormula.pfRatio(pao2: 95, fio2Percent: 21), 452.381, "P/F on room air")
        #expect(ClinicalFormula.pfRatio(pao2: 80, fio2Percent: 0) == nil)
    }

    @Test("Oxygenation index multiplies FiO2 by mean airway pressure")
    func oxygenationIndex() {
        // (0.6 × 20 × 100) / 60 = 20
        expect(ClinicalFormula.oxygenationIndex(
            fio2Percent: 60, meanAirwayPressure: 20, pao2: 60), 20.0, "OI moderate")
        // (1.0 × 25 × 100) / 50 = 50
        expect(ClinicalFormula.oxygenationIndex(
            fio2Percent: 100, meanAirwayPressure: 25, pao2: 50), 50.0, "OI severe")
        #expect(ClinicalFormula.oxygenationIndex(
            fio2Percent: 60, meanAirwayPressure: 20, pao2: 0) == nil)
    }

    @Test("Pack-years multiply packs per day by years")
    func packYears() {
        expect(ClinicalFormula.packYears(packsPerDay: 1.5, yearsSmoked: 20), 30.0, "pack-years")
        // 20 pack-years — the lung cancer screening eligibility threshold
        expect(ClinicalFormula.packYears(packsPerDay: 0.5, yearsSmoked: 40), 20.0,
               "pack-years at screening threshold")
        #expect(ClinicalFormula.packYears(packsPerDay: 0, yearsSmoked: 20) == nil)
    }

    @Test("RSBI converts tidal volume from mL to litres")
    func rsbi() {
        // 30 / 0.300 = 100 — the classic weaning-failure threshold. If the mL
        // conversion were dropped this would read 0.1 and always look passable.
        expect(ClinicalFormula.rapidShallowBreathingIndex(
            respiratoryRate: 30, tidalVolumeMl: 300), 100.0, "RSBI at weaning threshold")
        // 20 / 0.500 = 40 — comfortably weanable
        expect(ClinicalFormula.rapidShallowBreathingIndex(
            respiratoryRate: 20, tidalVolumeMl: 500), 40.0, "RSBI weanable")
        #expect(ClinicalFormula.rapidShallowBreathingIndex(
            respiratoryRate: 30, tidalVolumeMl: 0) == nil)
    }
}
