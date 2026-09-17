import Foundation

extension EntryLinkRegistry {
    static func dementiaKidneyDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:dementia-personal-care", to: "reference:dementia-communication-support", relation: .seeAlso),
            EntryLink(from: "reference:dementia-personal-care", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:dementia-mealtime-support", to: "reference:dysphagia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:dementia-mealtime-support", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:dementia-mealtime-support", to: "reference:dementia-personal-care", relation: .seeAlso),
            EntryLink(from: "reference:dementia-communication-support", to: "diagnosis:alzheimer-dementia", relation: .seeAlso),
            EntryLink(from: "reference:dementia-communication-support", to: "reference:hearing-loss-communication", relation: .seeAlso),
            EntryLink(from: "reference:dementia-wandering-safety", to: "reference:dementia-meaningful-activities", relation: .seeAlso),
            EntryLink(from: "reference:dementia-wandering-safety", to: "reference:dementia-home-and-respite-support", relation: .seeAlso),
            EntryLink(from: "reference:dementia-sleep-and-sundowning", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:dementia-sleep-and-sundowning", to: "reference:dementia-hospital-care", relation: .seeAlso),
            EntryLink(from: "reference:dementia-sleep-and-sundowning", to: "diagnosis:delirium", relation: .seeAlso),
            EntryLink(from: "reference:dementia-hospital-care", to: "reference:dementia-communication-support", relation: .seeAlso),
            EntryLink(from: "reference:dementia-hospital-care", to: "procedure:painad", relation: .seeAlso),
            EntryLink(from: "reference:dementia-hospital-care", to: "reference:dementia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:dementia-meaningful-activities", to: "reference:dementia-communication-support", relation: .seeAlso),
            EntryLink(from: "reference:dementia-meaningful-activities", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:dementia-home-and-respite-support", to: "diagnosis:caregiver-burnout", relation: .seeAlso),
            EntryLink(from: "reference:dementia-home-and-respite-support", to: "reference:dementia-hospital-care", relation: .seeAlso),
            EntryLink(from: "reference:dementia-home-and-respite-support", to: "reference:dementia-meaningful-activities", relation: .seeAlso),
            EntryLink(from: "reference:kidney-medication-safety", to: "diagnosis:ckd", relation: .seeAlso),
            EntryLink(from: "reference:kidney-medication-safety", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:kidney-medication-safety", to: "reference:kidney-transplant-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:kidney-transplant-follow-up", to: "diagnosis:acute-transplant-rejection", relation: .seeAlso),
            EntryLink(from: "reference:kidney-transplant-follow-up", to: "reference:food-safety-weakened-immunity", relation: .seeAlso),
            EntryLink(from: "reference:fecal-incontinence-support", to: "reference:urinary-continence-support", relation: .seeAlso),
            EntryLink(from: "reference:fecal-incontinence-support", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:fecal-incontinence-support", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:urinary-retention-recognition", to: "procedure:bladder-scan", relation: .seeAlso),
            EntryLink(from: "reference:urinary-retention-recognition", to: "reference:urinary-continence-support", relation: .seeAlso),
            EntryLink(from: "reference:urinary-retention-recognition", to: "procedure:foley-catheter-management", relation: .seeAlso)
        ]
    }
}
