import Foundation

extension EntryLinkRegistry {
    static func infectionProcedureDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:cre-bedside-transfer-precautions", to: "reference:contact-precautions", relation: .seeAlso),
            EntryLink(from: "reference:cre-bedside-transfer-precautions", to: "reference:antimicrobial-stewardship", relation: .seeAlso),
            EntryLink(from: "reference:cre-bedside-transfer-precautions", to: "reference:clabsi-bundle", relation: .seeAlso),
            EntryLink(from: "reference:hemodialysis-access-observation", to: "reference:hemodialysis-nursing-support", relation: .seeAlso),
            EntryLink(from: "reference:hemodialysis-access-observation", to: "reference:central-venous-catheter", relation: .seeAlso),
            EntryLink(from: "reference:hemodialysis-access-observation", to: "reference:dialysis-nutrition-and-fluids", relation: .seeAlso),
            EntryLink(from: "reference:peritoneal-dialysis-infection-recognition", to: "reference:peritoneal-dialysis-daily-care", relation: .seeAlso),
            EntryLink(from: "reference:peritoneal-dialysis-infection-recognition", to: "reference:fluid-volume-assessment", relation: .seeAlso),
            EntryLink(from: "reference:peritoneal-dialysis-infection-recognition", to: "reference:dialysis-nutrition-and-fluids", relation: .seeAlso),
            EntryLink(from: "reference:kidney-biopsy-preparation-recovery", to: "reference:reading-lab-results", relation: .seeAlso),
            EntryLink(from: "reference:kidney-biopsy-preparation-recovery", to: "reference:nephrotic-syndrome-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:kidney-biopsy-preparation-recovery", to: "reference:kidney-medication-safety", relation: .seeAlso),
            EntryLink(from: "reference:nephrotic-syndrome-follow-up", to: "diagnosis:nephrotic-syndrome", relation: .seeAlso),
            EntryLink(from: "reference:nephrotic-syndrome-follow-up", to: "reference:fluid-volume-assessment", relation: .seeAlso),
            EntryLink(from: "reference:kidney-stone-recovery-prevention", to: "diagnosis:kidney-stones", relation: .seeAlso),
            EntryLink(from: "reference:kidney-stone-recovery-prevention", to: "reference:test-guide-kidney-stone-analysis", relation: .seeAlso),
            EntryLink(from: "reference:kidney-stone-recovery-prevention", to: "reference:kidney-medication-safety", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-catheterization-preparation-recovery", to: "reference:cardiac-rehabilitation-recovery", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-catheterization-preparation-recovery", to: "reference:focused-cardiovascular-assessment", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-catheterization-preparation-recovery", to: "reference:post-op-assessment", relation: .seeAlso),
            EntryLink(from: "reference:planned-cardioversion-preparation-recovery", to: "diagnosis:atrial-fibrillation", relation: .seeAlso),
            EntryLink(from: "reference:planned-cardioversion-preparation-recovery", to: "reference:dysrhythmia-identification", relation: .seeAlso),
            EntryLink(from: "reference:planned-cardioversion-preparation-recovery", to: "reference:cardiac-catheterization-preparation-recovery", relation: .seeAlso),
            EntryLink(from: "reference:permanent-pacemaker-follow-up", to: "procedure:transcutaneous-pacing", relation: .seeAlso),
            EntryLink(from: "reference:permanent-pacemaker-follow-up", to: "reference:dysrhythmia-identification", relation: .seeAlso),
            EntryLink(from: "reference:permanent-pacemaker-follow-up", to: "reference:icd-shock-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:icd-shock-follow-up", to: "reference:dysrhythmia-identification", relation: .seeAlso),
            EntryLink(from: "reference:icd-shock-follow-up", to: "reference:advance-directives-polst", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-surgery-recovery-support", to: "reference:cardiac-rehabilitation-recovery", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-surgery-recovery-support", to: "reference:post-op-assessment", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-surgery-recovery-support", to: "reference:chest-tube-drainage", relation: .seeAlso)
        ]
    }
}
