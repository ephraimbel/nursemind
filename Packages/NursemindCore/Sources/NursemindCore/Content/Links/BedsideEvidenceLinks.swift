import Foundation

extension EntryLinkRegistry {
    static func bedsideEvidenceLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:delirium-prevention-ward-care", to: "diagnosis:delirium", relation: .seeAlso),
            EntryLink(from: "reference:delirium-prevention-ward-care", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:delirium-prevention-ward-care", to: "reference:hearing-loss-communication", relation: .seeAlso),
            EntryLink(from: "reference:inpatient-falls-prevention-evidence", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:inpatient-falls-prevention-evidence", to: "procedure:ambulatory-aid-teaching", relation: .seeAlso),
            EntryLink(from: "reference:inpatient-falls-prevention-evidence", to: "scenario:falls-prevention-scenario", relation: .seeAlso),
            EntryLink(from: "reference:pressure-injury-repositioning-evidence", to: "diagnosis:pressure-injury", relation: .seeAlso),
            EntryLink(from: "reference:pressure-injury-repositioning-evidence", to: "reference:wound-care-fundamentals", relation: .seeAlso),
            EntryLink(from: "reference:pressure-injury-repositioning-evidence", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:dysphagia-hydration-evidence", to: "reference:dysphagia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:dysphagia-hydration-evidence", to: "reference:fluid-balance-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:dysphagia-hydration-evidence", to: "reference:hospital-oral-care", relation: .seeAlso),
            EntryLink(from: "reference:discharge-communication-evidence", to: "reference:discharge-teaching-framework", relation: .seeAlso),
            EntryLink(from: "reference:discharge-communication-evidence", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:discharge-communication-evidence", to: "communication:interpreter-use", relation: .seeAlso),
            EntryLink(from: "reference:teach-back-and-show-me-evidence", to: "reference:health-literacy-teach-back", relation: .seeAlso),
            EntryLink(from: "reference:teach-back-and-show-me-evidence", to: "reference:discharge-teaching-framework", relation: .seeAlso),
            EntryLink(from: "reference:teach-back-and-show-me-evidence", to: "reference:diabetes-self-management-teaching", relation: .seeAlso),
            EntryLink(from: "reference:medication-reconciliation-transition-evidence", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:medication-reconciliation-transition-evidence", to: "reference:do-not-crush", relation: .seeAlso),
            EntryLink(from: "reference:medication-reconciliation-transition-evidence", to: "reference:discharge-teaching-framework", relation: .seeAlso),
            EntryLink(from: "reference:post-discharge-follow-up-evidence", to: "reference:discharge-communication-evidence", relation: .seeAlso),
            EntryLink(from: "reference:post-discharge-follow-up-evidence", to: "reference:medication-reconciliation-transition-evidence", relation: .seeAlso),
            EntryLink(from: "reference:post-discharge-follow-up-evidence", to: "communication:interpreter-use", relation: .seeAlso)
        ]
    }
}
