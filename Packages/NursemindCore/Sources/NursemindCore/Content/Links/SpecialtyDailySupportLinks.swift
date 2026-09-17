import Foundation

extension EntryLinkRegistry {
    static func specialtyDailySupportLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:hemodialysis-nursing-support", to: "diagnosis:ckd", relation: .seeAlso),
            EntryLink(from: "reference:hemodialysis-nursing-support", to: "reference:dialysis-nutrition-and-fluids", relation: .seeAlso),
            EntryLink(from: "reference:hemodialysis-nursing-support", to: "reference:peritoneal-dialysis-daily-care", relation: .seeAlso),
            EntryLink(from: "reference:peritoneal-dialysis-daily-care", to: "reference:dialysis-nutrition-and-fluids", relation: .seeAlso),
            EntryLink(from: "reference:peritoneal-dialysis-daily-care", to: "reference:fluid-balance-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:dialysis-nutrition-and-fluids", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:dialysis-nutrition-and-fluids", to: "lab:potassium", relation: .seeAlso),
            EntryLink(from: "reference:conservative-kidney-care", to: "diagnosis:ckd", relation: .seeAlso),
            EntryLink(from: "reference:conservative-kidney-care", to: "reference:advance-directives-polst", relation: .seeAlso),
            EntryLink(from: "reference:conservative-kidney-care", to: "reference:hemodialysis-nursing-support", relation: .seeAlso),
            EntryLink(from: "reference:cpap-daily-support", to: "diagnosis:osa", relation: .seeAlso),
            EntryLink(from: "reference:cpap-daily-support", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:home-oxygen-and-oximetry", to: "procedure:pulse-oximetry", relation: .seeAlso),
            EntryLink(from: "reference:home-oxygen-and-oximetry", to: "procedure:oxygen-administration", relation: .seeAlso),
            EntryLink(from: "reference:home-oxygen-and-oximetry", to: "reference:pulmonary-rehabilitation-support", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-rehabilitation-support", to: "diagnosis:copd", relation: .seeAlso),
            EntryLink(from: "reference:pulmonary-rehabilitation-support", to: "procedure:mdi-inhaler-teaching", relation: .seeAlso),
            EntryLink(from: "reference:urinary-continence-support", to: "procedure:bladder-scan", relation: .seeAlso),
            EntryLink(from: "reference:urinary-continence-support", to: "reference:fluid-balance-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:urostomy-daily-care", to: "procedure:ostomy-care", relation: .seeAlso),
            EntryLink(from: "reference:urostomy-daily-care", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:bowel-ostomy-daily-support", to: "procedure:ostomy-care", relation: .seeAlso),
            EntryLink(from: "reference:bowel-ostomy-daily-support", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:bowel-ostomy-daily-support", to: "reference:fluid-balance-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:dysphagia-mealtime-support", to: "reference:stroke-recovery-daily-support", relation: .seeAlso),
            EntryLink(from: "reference:dysphagia-mealtime-support", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:stroke-recovery-daily-support", to: "diagnosis:stroke", relation: .seeAlso),
            EntryLink(from: "reference:stroke-recovery-daily-support", to: "reference:aphasia-communication-support", relation: .seeAlso),
            EntryLink(from: "reference:stroke-recovery-daily-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso)
        ]
    }
}
