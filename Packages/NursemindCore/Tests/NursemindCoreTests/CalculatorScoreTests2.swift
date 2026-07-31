import Foundation
import Testing
@testable import NursemindCore

// Second score batch — the ones whose weight tables carry a trap: a negative
// term, a non-uniform tier, a subscale with a lower ceiling than its siblings.
// Each maximum is asserted explicitly, because an off-by-one in a single option
// table shows up there and nowhere else.

@Suite("Calculator scores — VTE risk")
struct VTEScoreTests {

    @Test("Wells DVT subtracts 2 for an alternative diagnosis")
    func wellsDVT() {
        func wells(_ flags: Bool = false, alternative: Bool = false) -> Int {
            ClinicalScore.wellsDVT(
                activeCancer: flags, paralysisOrImmobilization: flags,
                bedriddenOrMajorSurgery: flags, localizedTenderness: flags,
                entireLegSwollen: flags, calfSwellingOver3cm: flags,
                pittingEdemaUnilateral: flags, collateralSuperficialVeins: flags,
                previousDVT: flags, alternativeDiagnosisAsLikely: alternative)
        }
        #expect(wells() == 0)
        #expect(wells(true) == 9, "nine positive criteria")
        // The only negative term in the score — the range floor is −2, not 0
        #expect(wells(false, alternative: true) == -2, "alternative diagnosis subtracts 2")
        #expect(wells(true, alternative: true) == 7)
    }

    @Test("Padua weights four criteria at 3 and caps at 20")
    func padua() {
        func padua(cancer: Bool = false, vte: Bool = false, mobility: Bool = false,
                   thrombophilia: Bool = false, trauma: Bool = false, age: Bool = false,
                   hf: Bool = false, mi: Bool = false, infection: Bool = false,
                   obesity: Bool = false, hormonal: Bool = false) -> Int {
            ClinicalScore.padua(
                activeCancer: cancer, previousVTE: vte, reducedMobility: mobility,
                thrombophilia: thrombophilia, recentTraumaOrSurgery: trauma, ageGE70: age,
                heartOrRespiratoryFailure: hf, acuteMIOrStroke: mi,
                acuteInfectionOrRheumatologic: infection, obesityBMI30: obesity,
                hormonalTreatment: hormonal)
        }
        #expect(padua() == 0)
        // The 3-point tier
        #expect(padua(cancer: true) == 3)
        #expect(padua(vte: true) == 3)
        #expect(padua(mobility: true) == 3)
        #expect(padua(thrombophilia: true) == 3)
        // The lone 2-point criterion
        #expect(padua(trauma: true) == 2)
        // The 1-point tier
        #expect(padua(age: true) == 1)
        #expect(padua(obesity: true) == 1)
        // 4 is the prophylaxis threshold
        #expect(padua(cancer: true, age: true) == 4)
        #expect(padua(cancer: true, vte: true, mobility: true, thrombophilia: true,
                      trauma: true, age: true, hf: true, mi: true, infection: true,
                      obesity: true, hormonal: true) == 20, "max is 20")
    }

    @Test("Caprini weights are tiered 1, 2, 3 and 5")
    func caprini() {
        #expect(ClinicalScore.caprini(onePointFactors: 0, twoPointFactors: 0,
                                      threePointFactors: 0, fivePointFactors: 0) == 0)
        #expect(ClinicalScore.caprini(onePointFactors: 1, twoPointFactors: 1,
                                      threePointFactors: 1, fivePointFactors: 1) == 11,
                "1 + 2 + 3 + 5")
        // A single 5-point factor — hip fracture, stroke, multiple trauma, acute
        // spinal cord injury, elective arthroplasty — is highest risk alone
        #expect(ClinicalScore.caprini(onePointFactors: 0, twoPointFactors: 0,
                                      threePointFactors: 0, fivePointFactors: 1) == 5)
        #expect(ClinicalScore.caprini(onePointFactors: 0, twoPointFactors: 3,
                                      threePointFactors: 0, fivePointFactors: 0) == 6)
        #expect(ClinicalScore.caprini(onePointFactors: -1, twoPointFactors: 0,
                                      threePointFactors: 0, fivePointFactors: 0) == nil)
    }
}

@Suite("Calculator scores — banded")
struct BandedScoreTests {

    @Test("Centor uses the McIsaac age band, which can subtract")
    func centor() {
        // Age >=45 scores −1, so a patient with no other criteria is below zero
        #expect(ClinicalScore.centorMcIsaac(ageBandScore: -1, tonsillarExudate: false,
                                            tenderAnteriorNodes: false, fever: false,
                                            absenceOfCough: false) == -1)
        // Child 3–14 with everything: 1 + 4 = 5, the maximum
        #expect(ClinicalScore.centorMcIsaac(ageBandScore: 1, tonsillarExudate: true,
                                            tenderAnteriorNodes: true, fever: true,
                                            absenceOfCough: true) == 5, "max is 5")
        // Adult 15–44 band contributes nothing
        #expect(ClinicalScore.centorMcIsaac(ageBandScore: 0, tonsillarExudate: true,
                                            tenderAnteriorNodes: true, fever: false,
                                            absenceOfCough: false) == 2)
        #expect(ClinicalScore.centorMcIsaac(ageBandScore: 2, tonsillarExudate: false,
                                            tenderAnteriorNodes: false, fever: false,
                                            absenceOfCough: false) == nil)
    }

    @Test("ABCD2 spans 0 to 7")
    func abcd2() {
        #expect(ClinicalScore.abcd2(clinicalFeatureScore: 0, durationScore: 0, ageGE60: false,
                                    bloodPressureElevated: false, diabetes: false) == 0)
        // Unilateral weakness (2) + >=60 min (2) + all three flags
        #expect(ClinicalScore.abcd2(clinicalFeatureScore: 2, durationScore: 2, ageGE60: true,
                                    bloodPressureElevated: true, diabetes: true) == 7, "max is 7")
        // Speech disturbance without weakness scores 1, not 2
        #expect(ClinicalScore.abcd2(clinicalFeatureScore: 1, durationScore: 1, ageGE60: true,
                                    bloodPressureElevated: false, diabetes: false) == 3)
        #expect(ClinicalScore.abcd2(clinicalFeatureScore: 3, durationScore: 0, ageGE60: false,
                                    bloodPressureElevated: false, diabetes: false) == nil)
    }

    @Test("ICH score spans 0 to 6")
    func ichScore() {
        // GCS 13–15 with no other feature
        #expect(ClinicalScore.ichScore(gcsBandScore: 0, ageGE80: false, infratentorialOrigin: false,
                                       volumeGE30: false, intraventricularHemorrhage: false) == 0)
        #expect(ClinicalScore.ichScore(gcsBandScore: 2, ageGE80: true, infratentorialOrigin: true,
                                       volumeGE30: true, intraventricularHemorrhage: true) == 6,
                "max is 6")
        #expect(ClinicalScore.ichScore(gcsBandScore: 3, ageGE80: false, infratentorialOrigin: false,
                                       volumeGE30: false, intraventricularHemorrhage: false) == nil)
    }

    @Test("Glasgow-Blatchford weights syncope and comorbidity at 2")
    func glasgowBlatchford() {
        #expect(ClinicalScore.glasgowBlatchford(
            bunScore: 0, hemoglobinScore: 0, systolicScore: 0, pulseGE100: false,
            melena: false, syncope: false, hepaticDisease: false, cardiacFailure: false) == 0,
                "score 0 is the low-risk discharge candidate")
        // Pulse and melena are 1; syncope, hepatic disease, cardiac failure are 2
        #expect(ClinicalScore.glasgowBlatchford(
            bunScore: 0, hemoglobinScore: 0, systolicScore: 0, pulseGE100: true,
            melena: true, syncope: true, hepaticDisease: true, cardiacFailure: true) == 8)
        // Max banded contribution 6 + 6 + 3 plus all flags
        #expect(ClinicalScore.glasgowBlatchford(
            bunScore: 6, hemoglobinScore: 6, systolicScore: 3, pulseGE100: true,
            melena: true, syncope: true, hepaticDisease: true, cardiacFailure: true) == 23,
                "max is 23")
    }

    @Test("Child-Pugh spans 5 to 15, never below 5")
    func childPugh() {
        #expect(ClinicalScore.childPugh(encephalopathy: 1, ascites: 1, bilirubin: 1,
                                        albumin: 1, inr: 1) == 5, "class A floor is 5, not 0")
        #expect(ClinicalScore.childPugh(encephalopathy: 3, ascites: 3, bilirubin: 3,
                                        albumin: 3, inr: 3) == 15, "max is 15")
        // 7 — the A/B class boundary
        #expect(ClinicalScore.childPugh(encephalopathy: 1, ascites: 2, bilirubin: 2,
                                        albumin: 1, inr: 1) == 7)
        #expect(ClinicalScore.childPugh(encephalopathy: 0, ascites: 1, bilirubin: 1,
                                        albumin: 1, inr: 1) == nil, "no component scores 0")
    }

    @Test("Westley croup components have different ceilings")
    func westleyCroup() {
        #expect(ClinicalScore.westleyCroup(levelOfConsciousness: 0, cyanosis: 0, stridor: 0,
                                           airEntry: 0, retractions: 0) == 0)
        #expect(ClinicalScore.westleyCroup(levelOfConsciousness: 5, cyanosis: 5, stridor: 2,
                                           airEntry: 2, retractions: 3) == 17, "max is 17")
        // Cyanosis jumps 0 → 4 → 5; there is no 1, 2 or 3
        #expect(ClinicalScore.westleyCroup(levelOfConsciousness: 0, cyanosis: 2, stridor: 0,
                                           airEntry: 0, retractions: 0) == nil)
        // Consciousness is 0 or 5 only
        #expect(ClinicalScore.westleyCroup(levelOfConsciousness: 1, cyanosis: 0, stridor: 0,
                                           airEntry: 0, retractions: 0) == nil)
        // Stridor tops out at 2 even though cyanosis reaches 5
        #expect(ClinicalScore.westleyCroup(levelOfConsciousness: 0, cyanosis: 0, stridor: 5,
                                           airEntry: 0, retractions: 0) == nil)
    }
}

@Suite("Calculator scores — nursing assessment scales")
struct NursingScaleTests {

    @Test("Braden maximum is 23 because friction and shear stops at 3")
    func braden() {
        #expect(ClinicalScore.braden(sensoryPerception: 1, moisture: 1, activity: 1,
                                     mobility: 1, nutrition: 1, frictionAndShear: 1) == 6,
                "minimum is 6 — severe risk")
        #expect(ClinicalScore.braden(sensoryPerception: 4, moisture: 4, activity: 4,
                                     mobility: 4, nutrition: 4, frictionAndShear: 3) == 23,
                "max is 23, not 24")
        // The trap: friction and shear has no level 4
        #expect(ClinicalScore.braden(sensoryPerception: 4, moisture: 4, activity: 4,
                                     mobility: 4, nutrition: 4, frictionAndShear: 4) == nil)
        // 18 — the at-risk threshold
        #expect(ClinicalScore.braden(sensoryPerception: 3, moisture: 3, activity: 3,
                                     mobility: 3, nutrition: 3, frictionAndShear: 3) == 18)
        #expect(ClinicalScore.braden(sensoryPerception: 0, moisture: 4, activity: 4,
                                     mobility: 4, nutrition: 4, frictionAndShear: 3) == nil)
    }

    @Test("Morse Fall Scale uses non-uniform weights up to 125")
    func morseFallScale() {
        #expect(ClinicalScore.morseFallScale(historyOfFalling: 0, secondaryDiagnosis: 0,
                                             ambulatoryAid: 0, ivOrHeparinLock: 0,
                                             gait: 0, mentalStatus: 0) == 0)
        #expect(ClinicalScore.morseFallScale(historyOfFalling: 25, secondaryDiagnosis: 15,
                                             ambulatoryAid: 30, ivOrHeparinLock: 20,
                                             gait: 20, mentalStatus: 15) == 125, "max is 125")
        // 45 — the high-risk threshold
        #expect(ClinicalScore.morseFallScale(historyOfFalling: 25, secondaryDiagnosis: 0,
                                             ambulatoryAid: 0, ivOrHeparinLock: 20,
                                             gait: 0, mentalStatus: 0) == 45)
        // Furniture is 30 while crutches/cane/walker is 15 — not interchangeable
        #expect(ClinicalScore.morseFallScale(historyOfFalling: 0, secondaryDiagnosis: 0,
                                             ambulatoryAid: 20, ivOrHeparinLock: 0,
                                             gait: 0, mentalStatus: 0) == nil)
        // History of falling is 25, not 15
        #expect(ClinicalScore.morseFallScale(historyOfFalling: 15, secondaryDiagnosis: 0,
                                             ambulatoryAid: 0, ivOrHeparinLock: 0,
                                             gait: 0, mentalStatus: 0) == nil)
    }
}
