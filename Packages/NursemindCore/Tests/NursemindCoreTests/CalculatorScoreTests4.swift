import Foundation
import Testing
@testable import NursemindCore

// Fourth batch — instruments whose items share one scale. The item count is
// asserted alongside the range: a PHQ-9 summed over eight items still produces
// a plausible number, in a milder severity band than the patient is actually in.

@Suite("Calculator scores — uniform instruments")
struct UniformInstrumentTests {

    @Test("HEART score spans 0 to 10")
    func heartScore() {
        #expect(ClinicalScore.heartScore(history: 0, ecg: 0, age: 0,
                                         riskFactors: 0, troponin: 0) == 0)
        #expect(ClinicalScore.heartScore(history: 2, ecg: 2, age: 2,
                                         riskFactors: 2, troponin: 2) == 10, "max is 10")
        // 3 is the low-risk discharge ceiling; 7 the high-risk floor
        #expect(ClinicalScore.heartScore(history: 1, ecg: 1, age: 1,
                                         riskFactors: 0, troponin: 0) == 3)
        #expect(ClinicalScore.heartScore(history: 3, ecg: 0, age: 0,
                                         riskFactors: 0, troponin: 0) == nil)
    }

    @Test("FLACC spans 0 to 10")
    func flacc() {
        #expect(ClinicalScore.flacc(face: 0, legs: 0, activity: 0,
                                    cry: 0, consolability: 0) == 0)
        #expect(ClinicalScore.flacc(face: 2, legs: 2, activity: 2,
                                    cry: 2, consolability: 2) == 10, "max is 10")
        #expect(ClinicalScore.flacc(face: 1, legs: 1, activity: 1,
                                    cry: 1, consolability: 1) == 5)
        #expect(ClinicalScore.flacc(face: 3, legs: 0, activity: 0,
                                    cry: 0, consolability: 0) == nil)
    }

    @Test("SOFA spans 0 to 24 across six organ systems")
    func sofa() {
        #expect(ClinicalScore.sofa(respiration: 0, coagulation: 0, liver: 0,
                                   cardiovascular: 0, cns: 0, renal: 0) == 0)
        #expect(ClinicalScore.sofa(respiration: 4, coagulation: 4, liver: 4,
                                   cardiovascular: 4, cns: 4, renal: 4) == 24, "max is 24")
        // A 2-point rise is the Sepsis-3 organ-dysfunction criterion
        #expect(ClinicalScore.sofa(respiration: 2, coagulation: 0, liver: 0,
                                   cardiovascular: 0, cns: 0, renal: 0) == 2)
        #expect(ClinicalScore.sofa(respiration: 5, coagulation: 0, liver: 0,
                                   cardiovascular: 0, cns: 0, renal: 0) == nil)
    }

    @Test("Aldrete spans 0 to 10 with 9 as the discharge threshold")
    func aldrete() {
        #expect(ClinicalScore.aldrete(activity: 2, respiration: 2, circulation: 2,
                                      consciousness: 2, oxygenSaturation: 2) == 10,
                "max is 10 — the ceiling the 9 threshold depends on")
        #expect(ClinicalScore.aldrete(activity: 2, respiration: 2, circulation: 2,
                                      consciousness: 2, oxygenSaturation: 1) == 9)
        #expect(ClinicalScore.aldrete(activity: 0, respiration: 0, circulation: 0,
                                      consciousness: 0, oxygenSaturation: 0) == 0)
        #expect(ClinicalScore.aldrete(activity: 3, respiration: 2, circulation: 2,
                                      consciousness: 2, oxygenSaturation: 2) == nil)
    }

    @Test("PHQ-9 requires nine items and spans 0 to 27")
    func phq9() {
        #expect(ClinicalScore.phq9(items: Array(repeating: 0, count: 9)) == 0)
        #expect(ClinicalScore.phq9(items: Array(repeating: 3, count: 9)) == 27, "max is 27")
        // 10 — the threshold for probable major depression
        #expect(ClinicalScore.phq9(items: [2, 2, 1, 1, 1, 1, 1, 1, 0]) == 10)
        // Eight items would sum to a lower band, not an error, without this guard
        #expect(ClinicalScore.phq9(items: Array(repeating: 3, count: 8)) == nil,
                "eight items is not a PHQ-9")
        #expect(ClinicalScore.phq9(items: Array(repeating: 4, count: 9)) == nil)
    }

    @Test("GAD-7 requires seven items and spans 0 to 21")
    func gad7() {
        #expect(ClinicalScore.gad7(items: Array(repeating: 0, count: 7)) == 0)
        #expect(ClinicalScore.gad7(items: Array(repeating: 3, count: 7)) == 21, "max is 21")
        // 10 — the moderate-anxiety threshold
        #expect(ClinicalScore.gad7(items: [2, 2, 2, 1, 1, 1, 1]) == 10)
        #expect(ClinicalScore.gad7(items: Array(repeating: 3, count: 9)) == nil,
                "nine items is a PHQ-9, not a GAD-7")
    }

    @Test("Epworth requires eight situations and spans 0 to 24")
    func epworth() {
        #expect(ClinicalScore.epworth(items: Array(repeating: 0, count: 8)) == 0)
        #expect(ClinicalScore.epworth(items: Array(repeating: 3, count: 8)) == 24, "max is 24")
        // 11 — the excessive-daytime-sleepiness threshold
        #expect(ClinicalScore.epworth(items: [2, 2, 2, 2, 1, 1, 1, 0]) == 11)
        #expect(ClinicalScore.epworth(items: Array(repeating: 3, count: 7)) == nil)
    }

    @Test("AUDIT-C spans 0 to 12")
    func auditC() {
        #expect(ClinicalScore.auditC(frequency: 0, amount: 0, bingeFrequency: 0) == 0)
        #expect(ClinicalScore.auditC(frequency: 4, amount: 4, bingeFrequency: 4) == 12,
                "max is 12")
        // 4 in men, 3 in women, are the positive-screen thresholds
        #expect(ClinicalScore.auditC(frequency: 2, amount: 1, bingeFrequency: 1) == 4)
        #expect(ClinicalScore.auditC(frequency: 5, amount: 0, bingeFrequency: 0) == nil)
    }

    @Test("PEWS adds two-point modifiers on top of the three domains")
    func pews() {
        #expect(ClinicalScore.pews(behavior: 0, cardiovascular: 0, respiratory: 0,
                                   quarterHourlyNebulizers: false,
                                   persistentVomiting: false) == 0)
        // Three domains alone cap at 9 — the modifiers take it to 13
        #expect(ClinicalScore.pews(behavior: 3, cardiovascular: 3, respiratory: 3,
                                   quarterHourlyNebulizers: false,
                                   persistentVomiting: false) == 9)
        #expect(ClinicalScore.pews(behavior: 3, cardiovascular: 3, respiratory: 3,
                                   quarterHourlyNebulizers: true,
                                   persistentVomiting: true) == 13, "max is 13, not 9")
        // Each modifier is 2, not 1
        #expect(ClinicalScore.pews(behavior: 0, cardiovascular: 0, respiratory: 0,
                                   quarterHourlyNebulizers: true,
                                   persistentVomiting: false) == 2)
        #expect(ClinicalScore.pews(behavior: 4, cardiovascular: 0, respiratory: 0,
                                   quarterHourlyNebulizers: false,
                                   persistentVomiting: false) == nil)
    }

    @Test("CIWA-Ar scores orientation 0-4 while the other nine items reach 7")
    func ciwaAr() {
        #expect(ClinicalScore.ciwaAr(symptomItems: Array(repeating: 0, count: 9),
                                     orientation: 0) == 0)
        #expect(ClinicalScore.ciwaAr(symptomItems: Array(repeating: 7, count: 9),
                                     orientation: 4) == 67, "max is 67")
        // 8 and 15 are the protocol thresholds symptom-triggered dosing keys off
        #expect(ClinicalScore.ciwaAr(symptomItems: [1, 1, 1, 1, 1, 1, 1, 1, 0],
                                     orientation: 0) == 8)
        // Orientation stops at 4 even though the symptom items reach 7
        #expect(ClinicalScore.ciwaAr(symptomItems: Array(repeating: 0, count: 9),
                                     orientation: 7) == nil)
        #expect(ClinicalScore.ciwaAr(symptomItems: Array(repeating: 8, count: 9),
                                     orientation: 0) == nil)
        #expect(ClinicalScore.ciwaAr(symptomItems: Array(repeating: 7, count: 10),
                                     orientation: 0) == nil)
    }
}
