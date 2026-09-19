import Foundation

extension LibraryTopic {
    static var icuEvidenceDraftCollections: [LibraryTopic] {
#if DEBUG && ICU_EVIDENCE_REVIEW
        return [
            .init(id: "icu-airway-evidence", group: .criticalCare, title: "Airway & ventilation evidence",
                  subtitle: "Preoxygenation, intubation, extubation & ARDS",
                  entryIDs: ["reference:icu-preoxygenation-evidence", "reference:icu-intubation-first-pass-evidence", "reference:high-risk-extubation-support", "reference:ards-treatment-evidence"]),
            .init(id: "icu-organ-support-evidence", group: .criticalCare, title: "ICU organ support evidence",
                  subtitle: "Shock, kidney support, bleeding prevention & sedation",
                  entryIDs: ["reference:sepsis-fluid-strategy-evidence", "reference:septic-shock-corticosteroid-evidence", "reference:aki-kidney-support-timing", "reference:icu-stress-ulcer-prophylaxis", "reference:icu-sedation-drug-evidence", "reference:remimazolam-procedural-sedation-evidence", "diagnosis:hepatorenal-syndrome-aki", "diagnosis:carbapenem-resistant-acinetobacter-infection", "reference:attack-trial-crab-treatment"]),
            .init(id: "icu-drug-evidence", group: .criticalCare, title: "ICU drug evidence",
                  subtitle: "Drug labels, trial context & monitoring limits",
                  entryIDs: ["drug:terlipressin", "drug:remimazolam", "drug:sulbactam-durlobactam"]),
        ]
#else
        return []
#endif
    }
}
