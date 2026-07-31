import Foundation
import Testing
@testable import NursemindCore

// Third batch — PE risk, MELD, and the obstetric/haematology scores.

@Suite("Calculator math — hepatic")
struct HepaticMathTests {

    @Test("MELD uses the original coefficients")
    func meld() {
        // 3.78·ln(2) + 11.2·ln(1.5) + 9.57·ln(1.5) + 6.43
        //   = 2.6201 + 4.5412 + 3.8803 + 6.43
        let value = ClinicalFormula.meldClassic(
            bilirubin: 2.0, inr: 1.5, creatinine: 1.5, onDialysis: false)
        #expect(value != nil)
        #expect(abs(value! - 17.4716) < 0.01, "got \(value!), expected 17.4716")
    }

    @Test("MELD floors every input at 1.0 so no logarithm goes negative")
    func meldFloors() {
        // All three below 1.0 clamp up, leaving only the intercept
        let allNormal = ClinicalFormula.meldClassic(
            bilirubin: 0.4, inr: 0.9, creatinine: 0.6, onDialysis: false)
        #expect(allNormal != nil)
        #expect(abs(allNormal! - 6.43) < 0.01,
                "healthy labs should give the 6.43 intercept, got \(allNormal!)")
        // Identical to explicitly passing 1.0 — the clamp, not a coincidence
        let atOne = ClinicalFormula.meldClassic(
            bilirubin: 1.0, inr: 1.0, creatinine: 1.0, onDialysis: false)
        #expect(abs(allNormal! - atOne!) < 0.0001)
    }

    @Test("MELD forces creatinine to 4.0 on dialysis")
    func meldDialysis() {
        // 9.57·ln(4) + 6.43 = 13.2668 + 6.43
        let dialysis = ClinicalFormula.meldClassic(
            bilirubin: 1.0, inr: 1.0, creatinine: 0.5, onDialysis: true)
        #expect(dialysis != nil)
        #expect(abs(dialysis! - 19.6968) < 0.01, "got \(dialysis!), expected 19.6968")
        // A dialysis patient with low creatinine must not score as healthy
        let noDialysis = ClinicalFormula.meldClassic(
            bilirubin: 1.0, inr: 1.0, creatinine: 0.5, onDialysis: false)
        #expect(dialysis! > noDialysis!)
        // Creatinine above 4.0 caps to the same value
        let capped = ClinicalFormula.meldClassic(
            bilirubin: 1.0, inr: 1.0, creatinine: 9.0, onDialysis: false)
        #expect(abs(capped! - dialysis!) < 0.0001, "Cr is capped at 4.0")
    }

    @Test("MELD is bounded 6 to 40 per OPTN")
    func meldBounds() {
        let extreme = ClinicalFormula.meldClassic(
            bilirubin: 50, inr: 10, creatinine: 8, onDialysis: true)
        #expect(extreme == 40.0, "capped at 40")
        let minimal = ClinicalFormula.meldClassic(
            bilirubin: 1.0, inr: 1.0, creatinine: 1.0, onDialysis: false)
        #expect(minimal! >= 6.0, "floored at 6")
        #expect(ClinicalFormula.meldClassic(
            bilirubin: 0, inr: 1.0, creatinine: 1.0, onDialysis: false) == nil)
    }
}

@Suite("Calculator scores — pulmonary embolism")
struct PEScoreTests {

    @Test("Revised Geneva bands heart rate and caps at 22")
    func geneva() {
        func geneva(hr: Int, all: Bool = false) -> Int? {
            ClinicalScore.genevaPERevised(
                heartRateBandScore: hr, ageGE65: all, previousVTE: all,
                surgeryOrFractureWithinMonth: all, activeMalignancy: all,
                unilateralLimbPain: all, hemoptysis: all, painOnPalpationAndEdema: all)
        }
        #expect(geneva(hr: 0) == 0)
        #expect(geneva(hr: 5, all: true) == 22, "max is 22")
        // The heart-rate band jumps 0 -> 3 -> 5; there is no 1, 2 or 4
        #expect(geneva(hr: 1) == nil)
        #expect(geneva(hr: 4) == nil)
        // Pain on palpation with oedema is the heaviest single criterion at 4
        #expect(ClinicalScore.genevaPERevised(
            heartRateBandScore: 0, ageGE65: false, previousVTE: false,
            surgeryOrFractureWithinMonth: false, activeMalignancy: false,
            unilateralLimbPain: false, hemoptysis: false, painOnPalpationAndEdema: true) == 4)
    }

    @Test("PESI adds to age in years")
    func pesi() {
        // Age alone is the score — class I if under 66
        #expect(ClinicalScore.pesi(
            ageYears: 50, male: false, cancer: false, heartFailure: false,
            chronicLungDisease: false, pulseGE110: false, systolicUnder100: false,
            respiratoryRateGE30: false, temperatureUnder36: false,
            alteredMentalStatus: false, oxygenSaturationUnder90: false) == 50)
        // Altered mental status is 60 — heavier than any other criterion
        #expect(ClinicalScore.pesi(
            ageYears: 50, male: false, cancer: false, heartFailure: false,
            chronicLungDisease: false, pulseGE110: false, systolicUnder100: false,
            respiratoryRateGE30: false, temperatureUnder36: false,
            alteredMentalStatus: true, oxygenSaturationUnder90: false) == 110)
        // Cancer and hypotension are 30 each; male, HF and lung disease 10 each
        #expect(ClinicalScore.pesi(
            ageYears: 70, male: true, cancer: true, heartFailure: true,
            chronicLungDisease: true, pulseGE110: false, systolicUnder100: true,
            respiratoryRateGE30: false, temperatureUnder36: false,
            alteredMentalStatus: false, oxygenSaturationUnder90: false) == 160)
        #expect(ClinicalScore.pesi(
            ageYears: 0, male: false, cancer: false, heartFailure: false,
            chronicLungDisease: false, pulseGE110: false, systolicUnder100: false,
            respiratoryRateGE30: false, temperatureUnder36: false,
            alteredMentalStatus: false, oxygenSaturationUnder90: false) == nil)
    }
}

@Suite("Calculator scores — haematology and obstetrics")
struct HaemObScoreTests {

    @Test("HIT 4Ts spans 0 to 8")
    func hit4Ts() {
        #expect(ClinicalScore.hit4Ts(thrombocytopenia: 0, timing: 0,
                                     thrombosis: 0, otherCauses: 0) == 0)
        #expect(ClinicalScore.hit4Ts(thrombocytopenia: 2, timing: 2,
                                     thrombosis: 2, otherCauses: 2) == 8, "max is 8")
        // 3 is the low-probability ceiling that rules HIT out
        #expect(ClinicalScore.hit4Ts(thrombocytopenia: 2, timing: 1,
                                     thrombosis: 0, otherCauses: 0) == 3)
        #expect(ClinicalScore.hit4Ts(thrombocytopenia: 3, timing: 0,
                                     thrombosis: 0, otherCauses: 0) == nil)
    }

    @Test("Bishop caps at 13 with only three components reaching 3")
    func bishop() {
        #expect(ClinicalScore.bishop(dilation: 0, effacement: 0, consistency: 0,
                                     position: 0, station: 0) == 0)
        #expect(ClinicalScore.bishop(dilation: 3, effacement: 3, consistency: 2,
                                     position: 2, station: 3) == 13, "max is 13")
        // Consistency and position stop at 2 — a 3 there is out of scale
        #expect(ClinicalScore.bishop(dilation: 3, effacement: 3, consistency: 3,
                                     position: 2, station: 3) == nil)
        #expect(ClinicalScore.bishop(dilation: 3, effacement: 3, consistency: 2,
                                     position: 3, station: 3) == nil)
        // 8 — the favourable-cervix threshold for induction
        #expect(ClinicalScore.bishop(dilation: 2, effacement: 2, consistency: 1,
                                     position: 1, station: 2) == 8)
    }
}
