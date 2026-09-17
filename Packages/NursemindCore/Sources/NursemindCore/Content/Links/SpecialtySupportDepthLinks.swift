import Foundation

extension EntryLinkRegistry {
    static func specialtySupportDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:bronchiectasis-daily-airway-care", to: "diagnosis:bronchiectasis", relation: .seeAlso),
            EntryLink(from: "reference:bronchiectasis-daily-airway-care", to: "reference:pulmonary-rehabilitation-support", relation: .seeAlso),
            EntryLink(from: "reference:bronchiectasis-daily-airway-care", to: "reference:home-oxygen-and-oximetry", relation: .seeAlso),
            EntryLink(from: "reference:ipf-daily-care-follow-up", to: "diagnosis:ipf", relation: .seeAlso),
            EntryLink(from: "reference:ipf-daily-care-follow-up", to: "reference:pulmonary-rehabilitation-support", relation: .seeAlso),
            EntryLink(from: "reference:ipf-daily-care-follow-up", to: "reference:home-oxygen-and-oximetry", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-hypertension-follow-up-support", to: "diagnosis:pulmonary-hypertension", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-hypertension-follow-up-support", to: "reference:pulmonary-rehabilitation-support", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-hypertension-follow-up-support", to: "reference:home-oxygen-and-oximetry", relation: .seeAlso),
            EntryLink(from: "reference:sickle-cell-everyday-care-planning", to: "diagnosis:sickle-cell-crisis", relation: .seeAlso),
            EntryLink(from: "reference:sickle-cell-everyday-care-planning", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:sickle-cell-everyday-care-planning", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:bleeding-disorder-procedure-planning", to: "diagnosis:hemophilia", relation: .seeAlso),
            EntryLink(from: "reference:bleeding-disorder-procedure-planning", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:bleeding-disorder-procedure-planning", to: "reference:hospital-oral-care", relation: .seeAlso),
            EntryLink(from: "reference:thalassemia-treatment-monitoring-support", to: "diagnosis:beta-thalassemia", relation: .seeAlso),
            EntryLink(from: "reference:thalassemia-treatment-monitoring-support", to: "lab:ferritin", relation: .seeAlso),
            EntryLink(from: "reference:thalassemia-treatment-monitoring-support", to: "procedure:blood-transfusion", relation: .seeAlso),
            EntryLink(from: "reference:tinnitus-assessment-coping-support", to: "reference:hearing-aid-daily-support", relation: .seeAlso),
            EntryLink(from: "reference:tinnitus-assessment-coping-support", to: "reference:hearing-loss-communication", relation: .seeAlso),
            EntryLink(from: "reference:tinnitus-assessment-coping-support", to: "reference:psychotherapy-preparation-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:balance-symptom-history-safety", to: "reference:test-guide-balance-tests", relation: .seeAlso),
            EntryLink(from: "reference:balance-symptom-history-safety", to: "reference:test-guide-videonystagmography-vng", relation: .seeAlso),
            EntryLink(from: "reference:balance-symptom-history-safety", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:smell-taste-safety-nutrition", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:smell-taste-safety-nutrition", to: "reference:hospital-oral-care", relation: .seeAlso),
            EntryLink(from: "reference:smell-taste-safety-nutrition", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:hidradenitis-daily-skin-support", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:hidradenitis-daily-skin-support", to: "reference:psychotherapy-preparation-follow-up", relation: .seeAlso)
        ]
    }
}
