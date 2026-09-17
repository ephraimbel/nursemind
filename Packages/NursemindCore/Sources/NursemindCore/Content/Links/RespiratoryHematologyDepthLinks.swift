import Foundation

extension EntryLinkRegistry {
    static func respiratoryHematologyDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:bronchoscopy-preparation-recovery", to: "procedure:bronchoscopy", relation: .seeAlso),
            EntryLink(from: "reference:bronchoscopy-preparation-recovery", to: "reference:focused-respiratory-assessment", relation: .seeAlso),
            EntryLink(from: "reference:bronchoscopy-preparation-recovery", to: "lab:sputum-culture", relation: .seeAlso),
            EntryLink(from: "reference:thoracentesis-assessment-recovery", to: "procedure:thoracentesis", relation: .seeAlso),
            EntryLink(from: "reference:thoracentesis-assessment-recovery", to: "reference:test-guide-pleural-fluid-analysis", relation: .seeAlso),
            EntryLink(from: "reference:thoracentesis-assessment-recovery", to: "reference:pleural-effusion-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-function-testing-support", to: "diagnosis:copd", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-function-testing-support", to: "reference:oxygenation-versus-ventilation", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-function-testing-support", to: "reference:bronchoscopy-preparation-recovery", relation: .seeAlso),
            EntryLink(from: "reference:pleural-effusion-follow-up", to: "diagnosis:pleural-effusion", relation: .seeAlso),
            EntryLink(from: "reference:pleural-effusion-follow-up", to: "reference:chest-tube-drainage", relation: .seeAlso),
            EntryLink(from: "reference:vte-recovery-follow-up", to: "diagnosis:pulmonary-embolism", relation: .seeAlso),
            EntryLink(from: "reference:vte-recovery-follow-up", to: "reference:anticoagulation-teaching", relation: .seeAlso),
            EntryLink(from: "reference:vte-recovery-follow-up", to: "reference:pulmonary-hypertension-follow-up-support", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-artery-disease-foot-care", to: "reference:focused-cardiovascular-assessment", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-artery-disease-foot-care", to: "reference:test-guide-diabetic-foot-exam", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-artery-disease-foot-care", to: "reference:wound-care-fundamentals", relation: .seeAlso),
            EntryLink(from: "reference:immune-thrombocytopenia-follow-up", to: "lab:platelets", relation: .seeAlso),
            EntryLink(from: "reference:immune-thrombocytopenia-follow-up", to: "reference:bleeding-disorder-procedure-planning", relation: .seeAlso),
            EntryLink(from: "reference:immune-thrombocytopenia-follow-up", to: "reference:test-guide-bone-marrow-tests", relation: .seeAlso),
            EntryLink(from: "reference:aplastic-anemia-nursing-support", to: "diagnosis:aplastic-anemia", relation: .seeAlso),
            EntryLink(from: "reference:aplastic-anemia-nursing-support", to: "reference:test-guide-bone-marrow-tests", relation: .seeAlso),
            EntryLink(from: "reference:aplastic-anemia-nursing-support", to: "reference:blood-transfusion-administration", relation: .seeAlso),
            EntryLink(from: "reference:hemolytic-anemia-follow-up", to: "lab:reticulocyte-count", relation: .seeAlso),
            EntryLink(from: "reference:hemolytic-anemia-follow-up", to: "lab:haptoglobin", relation: .seeAlso),
            EntryLink(from: "reference:hemolytic-anemia-follow-up", to: "reference:blood-transfusion-administration", relation: .seeAlso),
            EntryLink(from: "reference:vitamin-b12-deficiency-follow-up", to: "diagnosis:vitamin-b12-deficiency", relation: .seeAlso),
            EntryLink(from: "reference:vitamin-b12-deficiency-follow-up", to: "lab:vitamin-b12", relation: .seeAlso),
            EntryLink(from: "reference:vitamin-b12-deficiency-follow-up", to: "reference:peripheral-neuropathy-daily-support", relation: .seeAlso)
        ]
    }
}
