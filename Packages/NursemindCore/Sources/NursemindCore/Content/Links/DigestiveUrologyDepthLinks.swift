import Foundation

extension EntryLinkRegistry {
    static func digestiveUrologyDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:colonoscopy-preparation-recovery", to: "reference:flexible-sigmoidoscopy-preparation-recovery", relation: .seeAlso),
            EntryLink(from: "reference:colonoscopy-preparation-recovery", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:colonoscopy-preparation-recovery", to: "reference:stool-sample-collection", relation: .seeAlso),
            EntryLink(from: "reference:upper-gi-endoscopy-preparation-recovery", to: "diagnosis:upper-gi-bleed", relation: .seeAlso),
            EntryLink(from: "reference:upper-gi-endoscopy-preparation-recovery", to: "reference:dysphagia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:upper-gi-endoscopy-preparation-recovery", to: "reference:ercp-preparation-recovery", relation: .seeAlso),
            EntryLink(from: "reference:ercp-preparation-recovery", to: "diagnosis:acute-pancreatitis", relation: .seeAlso),
            EntryLink(from: "reference:ercp-preparation-recovery", to: "diagnosis:severe-acute-cholangitis", relation: .seeAlso),
            EntryLink(from: "reference:liver-biopsy-preparation-recovery", to: "procedure:liver-biopsy", relation: .seeAlso),
            EntryLink(from: "reference:liver-biopsy-preparation-recovery", to: "reference:lft-liver-function-interpretation", relation: .seeAlso),
            EntryLink(from: "reference:liver-biopsy-preparation-recovery", to: "reference:coagulation-panel-interpretation", relation: .seeAlso),
            EntryLink(from: "reference:flexible-sigmoidoscopy-preparation-recovery", to: "reference:ibd-nutrition-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:flexible-sigmoidoscopy-preparation-recovery", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:cystoscopy-ureteroscopy-preparation-recovery", to: "reference:hematuria-assessment-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:cystoscopy-ureteroscopy-preparation-recovery", to: "reference:kidney-stone-recovery-prevention", relation: .seeAlso),
            EntryLink(from: "reference:cystoscopy-ureteroscopy-preparation-recovery", to: "reference:urinary-retention-recognition", relation: .seeAlso),
            EntryLink(from: "reference:urodynamic-testing-preparation", to: "procedure:bladder-scan", relation: .seeAlso),
            EntryLink(from: "reference:urodynamic-testing-preparation", to: "reference:urinary-continence-support", relation: .seeAlso),
            EntryLink(from: "reference:urodynamic-testing-preparation", to: "reference:bph-symptom-treatment-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:urinary-tract-imaging-preparation", to: "reference:hematuria-assessment-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:urinary-tract-imaging-preparation", to: "reference:kidney-stone-recovery-prevention", relation: .seeAlso),
            EntryLink(from: "reference:urinary-tract-imaging-preparation", to: "reference:urodynamic-testing-preparation", relation: .seeAlso),
            EntryLink(from: "reference:bph-symptom-treatment-follow-up", to: "diagnosis:bph", relation: .seeAlso),
            EntryLink(from: "reference:bph-symptom-treatment-follow-up", to: "reference:urinary-retention-recognition", relation: .seeAlso),
            EntryLink(from: "reference:hematuria-assessment-follow-up", to: "lab:urinalysis", relation: .seeAlso),
            EntryLink(from: "reference:hematuria-assessment-follow-up", to: "reference:kidney-biopsy-preparation-recovery", relation: .seeAlso)
        ]
    }
}
