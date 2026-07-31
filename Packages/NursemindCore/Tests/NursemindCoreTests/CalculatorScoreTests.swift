import Foundation
import Testing
@testable import NursemindCore

// Weight-table tests for the point-sum scores. The arithmetic is trivial; what
// these pin is the published weighting — which criteria score 2 rather than 1,
// which are mutually exclusive, and what the maximum is. Those are the parts
// that silently misstratify a patient when wrong.

@Suite("Calculator scores — cardiovascular")
struct CardiovascularScoreTests {

    @Test("CHA2DS2-VASc weights age 75+ and prior stroke as 2 points")
    func cha2ds2VAScWeights() {
        func score(chf: Bool = false, htn: Bool = false, age75: Bool = false,
                   dm: Bool = false, stroke: Bool = false, vasc: Bool = false,
                   age65: Bool = false, female: Bool = false) -> Int {
            ClinicalScore.cha2ds2VASc(
                chf: chf, hypertension: htn, ageGE75: age75, diabetes: dm,
                strokeOrTIA: stroke, vascularDisease: vasc, age65to74: age65, female: female)
        }

        #expect(score() == 0)
        // The two doubled criteria
        #expect(score(age75: true) == 2, "age >=75 is 2 points")
        #expect(score(stroke: true) == 2, "prior stroke/TIA is 2 points")
        // The single criteria
        #expect(score(chf: true) == 1)
        #expect(score(htn: true) == 1)
        #expect(score(dm: true) == 1)
        #expect(score(vasc: true) == 1)
        #expect(score(age65: true) == 1)
        #expect(score(female: true) == 1)
        // Maximum is 9, not 10 — the age bands cannot both count
        #expect(score(chf: true, htn: true, age75: true, dm: true, stroke: true,
                      vasc: true, age65: true, female: true) == 9, "max is 9")
    }

    @Test("CHA2DS2-VASc age bands are mutually exclusive")
    func cha2ds2VAScAgeBands() {
        let both = ClinicalScore.cha2ds2VASc(
            chf: false, hypertension: false, ageGE75: true, diabetes: false,
            strokeOrTIA: false, vascularDisease: false, age65to74: true, female: false)
        // A patient over 75 is also over 65; scoring both would give 3
        #expect(both == 2, "75+ supersedes 65-74 rather than stacking")
    }

    @Test("HAS-BLED counts nine criteria at one point each")
    func hasBled() {
        #expect(ClinicalScore.hasBled(
            hypertensionUncontrolled: false, abnormalRenal: false, abnormalLiver: false,
            strokeHistory: false, bleedingHistory: false, labileINR: false,
            elderly: false, drugs: false, alcohol: false) == 0)
        #expect(ClinicalScore.hasBled(
            hypertensionUncontrolled: true, abnormalRenal: true, abnormalLiver: true,
            strokeHistory: true, bleedingHistory: true, labileINR: true,
            elderly: true, drugs: true, alcohol: true) == 9, "max is 9")
        // Renal and liver score separately — the shared "A" is two criteria
        #expect(ClinicalScore.hasBled(
            hypertensionUncontrolled: false, abnormalRenal: true, abnormalLiver: true,
            strokeHistory: false, bleedingHistory: false, labileINR: false,
            elderly: false, drugs: false, alcohol: false) == 2)
        // 3 or more is the "high risk" threshold clinicians act on
        #expect(ClinicalScore.hasBled(
            hypertensionUncontrolled: true, abnormalRenal: true, abnormalLiver: false,
            strokeHistory: false, bleedingHistory: true, labileINR: false,
            elderly: false, drugs: false, alcohol: false) == 3)
    }
}

@Suite("Calculator scores — sepsis and severity")
struct SeverityScoreTests {

    @Test("CURB-65 counts five criteria")
    func curb65() {
        #expect(ClinicalScore.curb65(confusion: false, ureaHigh: false,
                                     respiratoryRateHigh: false, lowBloodPressure: false,
                                     ageGE65: false) == 0)
        #expect(ClinicalScore.curb65(confusion: true, ureaHigh: true,
                                     respiratoryRateHigh: true, lowBloodPressure: true,
                                     ageGE65: true) == 5, "max is 5")
        // 2 is the admission-consideration threshold
        #expect(ClinicalScore.curb65(confusion: true, ureaHigh: false,
                                     respiratoryRateHigh: false, lowBloodPressure: false,
                                     ageGE65: true) == 2)
    }

    @Test("qSOFA counts three criteria and flags at 2")
    func qsofa() {
        #expect(ClinicalScore.qSOFA(respiratoryRateGE22: false, alteredMentation: false,
                                    systolicLE100: false) == 0)
        #expect(ClinicalScore.qSOFA(respiratoryRateGE22: true, alteredMentation: true,
                                    systolicLE100: true) == 3, "max is 3")
        #expect(ClinicalScore.qSOFA(respiratoryRateGE22: true, alteredMentation: false,
                                    systolicLE100: true) == 2, "the actionable threshold")
    }

    @Test("SIRS counts four criteria")
    func sirs() {
        #expect(ClinicalScore.sirs(temperatureAbnormal: false, heartRateAbnormal: false,
                                   respiratoryRateAbnormal: false, whiteCountAbnormal: false) == 0)
        #expect(ClinicalScore.sirs(temperatureAbnormal: true, heartRateAbnormal: true,
                                   respiratoryRateAbnormal: true, whiteCountAbnormal: true) == 4,
                "max is 4")
        #expect(ClinicalScore.sirs(temperatureAbnormal: true, heartRateAbnormal: true,
                                   respiratoryRateAbnormal: false, whiteCountAbnormal: false) == 2,
                "2 meets the SIRS definition")
    }
}

@Suite("Calculator scores — neuro and neonatal")
struct NeuroScoreTests {

    @Test("GCS spans 3 to 15, never 0")
    func gcsRange() {
        // Deep coma is 3, not 0 — no component can score below 1
        #expect(ClinicalScore.glasgowComaScale(eye: 1, verbal: 1, motor: 1) == 3,
                "minimum GCS is 3")
        #expect(ClinicalScore.glasgowComaScale(eye: 4, verbal: 5, motor: 6) == 15,
                "maximum GCS is 15")
        // 8 — the intubation threshold
        #expect(ClinicalScore.glasgowComaScale(eye: 2, verbal: 2, motor: 4) == 8)
    }

    @Test("GCS rejects components outside their own scale")
    func gcsDomain() {
        // Each component has a different ceiling; a value from the wrong scale
        // would produce a plausible-looking total.
        #expect(ClinicalScore.glasgowComaScale(eye: 5, verbal: 5, motor: 6) == nil,
                "eye has no 5")
        #expect(ClinicalScore.glasgowComaScale(eye: 4, verbal: 6, motor: 6) == nil,
                "verbal has no 6")
        #expect(ClinicalScore.glasgowComaScale(eye: 4, verbal: 5, motor: 7) == nil,
                "motor has no 7")
        #expect(ClinicalScore.glasgowComaScale(eye: 0, verbal: 5, motor: 6) == nil,
                "no component scores 0")
    }

    @Test("Apgar spans 0 to 10 across five components")
    func apgar() {
        #expect(ClinicalScore.apgar(appearance: 0, pulse: 0, grimace: 0,
                                    activity: 0, respiration: 0) == 0)
        #expect(ClinicalScore.apgar(appearance: 2, pulse: 2, grimace: 2,
                                    activity: 2, respiration: 2) == 10, "max is 10")
        // 7 — the threshold below which resuscitation is escalated
        #expect(ClinicalScore.apgar(appearance: 1, pulse: 2, grimace: 1,
                                    activity: 1, respiration: 2) == 7)
        // Components are 0-2 only
        #expect(ClinicalScore.apgar(appearance: 3, pulse: 2, grimace: 2,
                                    activity: 2, respiration: 2) == nil)
        #expect(ClinicalScore.apgar(appearance: -1, pulse: 2, grimace: 2,
                                    activity: 2, respiration: 2) == nil)
    }
}
