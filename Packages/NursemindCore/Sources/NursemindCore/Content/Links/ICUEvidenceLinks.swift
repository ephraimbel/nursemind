import Foundation

extension EntryLinkRegistry {
    static func icuEvidenceDraftLinks() -> [EntryLink] {
#if DEBUG && ICU_EVIDENCE_REVIEW
        return [
            .init(from: "diagnosis:aki", to: "diagnosis:hepatorenal-syndrome-aki", relation: .seeAlso),
            .init(from: "diagnosis:aki", to: "drug:terlipressin", relation: .seeAlso),
            .init(from: "diagnosis:aki", to: "reference:aki-kidney-support-timing", relation: .seeAlso),
            .init(from: "diagnosis:ards", to: "reference:ards-treatment-evidence", relation: .seeAlso),
            .init(from: "diagnosis:carbapenem-resistant-acinetobacter-infection", to: "diagnosis:ventilator-associated-pneumonia", relation: .seeAlso),
            .init(from: "diagnosis:carbapenem-resistant-acinetobacter-infection", to: "drug:sulbactam-durlobactam", relation: .seeAlso),
            .init(from: "diagnosis:carbapenem-resistant-acinetobacter-infection", to: "reference:attack-trial-crab-treatment", relation: .seeAlso),
            .init(from: "diagnosis:hepatorenal-syndrome-aki", to: "drug:terlipressin", relation: .seeAlso),
            .init(from: "diagnosis:hepatorenal-syndrome-aki", to: "reference:aki-kidney-support-timing", relation: .seeAlso),
            .init(from: "diagnosis:septic-shock", to: "reference:sepsis-fluid-strategy-evidence", relation: .seeAlso),
            .init(from: "diagnosis:septic-shock", to: "reference:septic-shock-corticosteroid-evidence", relation: .seeAlso),
            .init(from: "diagnosis:upper-gi-bleed", to: "reference:icu-stress-ulcer-prophylaxis", relation: .seeAlso),
            .init(from: "diagnosis:ventilator-associated-pneumonia", to: "drug:sulbactam-durlobactam", relation: .seeAlso),
            .init(from: "diagnosis:ventilator-associated-pneumonia", to: "reference:attack-trial-crab-treatment", relation: .seeAlso),
            .init(from: "drip:cisatracurium-drip", to: "reference:ards-treatment-evidence", relation: .seeAlso),
            .init(from: "drip:dexmedetomidine-drip", to: "reference:icu-sedation-drug-evidence", relation: .seeAlso),
            .init(from: "drip:propofol-drip", to: "reference:icu-sedation-drug-evidence", relation: .seeAlso),
            .init(from: "drug:famotidine", to: "reference:icu-stress-ulcer-prophylaxis", relation: .seeAlso),
            .init(from: "drug:flumazenil", to: "drug:remimazolam", relation: .seeAlso),
            .init(from: "drug:hydrocortisone", to: "reference:septic-shock-corticosteroid-evidence", relation: .seeAlso),
            .init(from: "drug:pantoprazole", to: "reference:icu-stress-ulcer-prophylaxis", relation: .seeAlso),
            .init(from: "drug:remimazolam", to: "reference:icu-sedation-drug-evidence", relation: .seeAlso),
            .init(from: "drug:remimazolam", to: "reference:remimazolam-procedural-sedation-evidence", relation: .seeAlso),
            .init(from: "drug:sulbactam-durlobactam", to: "reference:attack-trial-crab-treatment", relation: .seeAlso),
            .init(from: "drug:terlipressin", to: "reference:aki-kidney-support-timing", relation: .seeAlso),
            .init(from: "lab:creatinine", to: "reference:aki-kidney-support-timing", relation: .seeAlso),
            .init(from: "lab:lactate", to: "reference:sepsis-fluid-strategy-evidence", relation: .seeAlso),
            .init(from: "procedure:bronchoscopy", to: "reference:remimazolam-procedural-sedation-evidence", relation: .seeAlso),
            .init(from: "procedure:crrt-setup", to: "reference:aki-kidney-support-timing", relation: .seeAlso),
            .init(from: "procedure:intubation-assist", to: "reference:icu-intubation-first-pass-evidence", relation: .seeAlso),
            .init(from: "procedure:intubation-assist", to: "reference:icu-preoxygenation-evidence", relation: .seeAlso),
            .init(from: "procedure:spontaneous-breathing-trial", to: "reference:high-risk-extubation-support", relation: .seeAlso),
            .init(from: "reference:ards-management-protocol", to: "reference:ards-treatment-evidence", relation: .seeAlso),
            .init(from: "reference:artificial-airway-secretion-assessment", to: "reference:high-risk-extubation-support", relation: .seeAlso),
            .init(from: "reference:difficult-airway-algorithm", to: "reference:icu-intubation-first-pass-evidence", relation: .seeAlso),
            .init(from: "reference:high-risk-extubation-support", to: "reference:post-extubation-observation", relation: .seeAlso),
            .init(from: "reference:icu-intubation-first-pass-evidence", to: "reference:icu-preoxygenation-evidence", relation: .seeAlso),
            .init(from: "reference:icu-preoxygenation-evidence", to: "reference:noninvasive-ventilation-bedside-assessment", relation: .seeAlso),
            .init(from: "reference:icu-preoxygenation-evidence", to: "reference:resuscitation-airway-capnography", relation: .seeAlso),
            .init(from: "reference:icu-sedation-drug-evidence", to: "reference:rass-scale", relation: .seeAlso),
            .init(from: "reference:icu-sedation-drug-evidence", to: "reference:remimazolam-procedural-sedation-evidence", relation: .seeAlso),
            .init(from: "reference:sepsis-fluid-strategy-evidence", to: "reference:vasopressor-selection", relation: .seeAlso),
            .init(from: "reference:septic-shock-corticosteroid-evidence", to: "reference:vasopressor-selection", relation: .seeAlso)
        ]
#else
        return []
#endif
    }
}
