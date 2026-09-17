import Foundation

extension EntryLinkRegistry {
    static func bedsideReferenceLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:adult-head-to-toe-assessment", to: "procedure:neuro-check", relation: .seeAlso),
            EntryLink(from: "reference:adult-head-to-toe-assessment", to: "reference:post-op-assessment", relation: .seeAlso),
            EntryLink(from: "reference:adult-health-history", to: "reference:health-literacy-teach-back", relation: .seeAlso),
            EntryLink(from: "reference:adult-health-history", to: "communication:interpreter-use", relation: .seeAlso),
            EntryLink(from: "reference:focused-respiratory-assessment", to: "reference:mechanical-ventilation-basics", relation: .seeAlso),
            EntryLink(from: "reference:focused-respiratory-assessment", to: "reference:adult-head-to-toe-assessment", relation: .seeAlso),
            EntryLink(from: "reference:focused-cardiovascular-assessment", to: "reference:fluid-balance-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:focused-cardiovascular-assessment", to: "reference:adult-head-to-toe-assessment", relation: .seeAlso),
            EntryLink(from: "reference:focused-abdominal-assessment", to: "reference:stool-sample-collection", relation: .seeAlso),
            EntryLink(from: "reference:focused-abdominal-assessment", to: "reference:adult-head-to-toe-assessment", relation: .seeAlso),
            EntryLink(from: "reference:musculoskeletal-assessment", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:musculoskeletal-assessment", to: "procedure:ambulatory-aid-teaching", relation: .seeAlso),
            EntryLink(from: "reference:skin-assessment-beyond-wounds", to: "reference:braden-scale", relation: .seeAlso),
            EntryLink(from: "reference:skin-assessment-beyond-wounds", to: "reference:adult-head-to-toe-assessment", relation: .seeAlso),
            EntryLink(from: "reference:fluid-balance-monitoring", to: "reference:heart-failure-teaching", relation: .seeAlso),
            EntryLink(from: "reference:bedside-nutrition-assessment", to: "reference:therapeutic-diets", relation: .seeAlso),
            EntryLink(from: "reference:bedside-nutrition-assessment", to: "reference:hospital-oral-care", relation: .seeAlso),
            EntryLink(from: "reference:hospital-sleep-support", to: "reference:abcdef-bundle", relation: .seeAlso),
            EntryLink(from: "reference:bedside-mobility-assessment", to: "procedure:mechanical-lift", relation: .seeAlso),
            EntryLink(from: "reference:bedside-mobility-assessment", to: "reference:post-icu-recovery", relation: .seeAlso),
            EntryLink(from: "reference:hospital-oral-care", to: "reference:mechanical-ventilation-basics", relation: .seeAlso),
            EntryLink(from: "reference:nursing-documentation-principles", to: "reference:adult-head-to-toe-assessment", relation: .seeAlso),
            EntryLink(from: "reference:hearing-loss-communication", to: "communication:therapeutic-communication", relation: .seeAlso),
            EntryLink(from: "reference:hearing-loss-communication", to: "reference:low-vision-bedside-support", relation: .seeAlso),
            EntryLink(from: "reference:low-vision-bedside-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:aphasia-communication-support", to: "reference:communication-when-speech-is-limited", relation: .seeAlso),
            EntryLink(from: "reference:aphasia-communication-support", to: "procedure:neuro-check", relation: .seeAlso),
            EntryLink(from: "reference:cultural-preferences-assessment", to: "communication:interpreter-use", relation: .seeAlso),
            EntryLink(from: "reference:cultural-preferences-assessment", to: "reference:spiritual-support-in-hospital", relation: .seeAlso),
            EntryLink(from: "reference:spiritual-support-in-hospital", to: "communication:therapeutic-communication", relation: .seeAlso),
            EntryLink(from: "reference:stool-sample-collection", to: "reference:nursing-documentation-principles", relation: .seeAlso),
            EntryLink(from: "reference:sterile-field-principles", to: "procedure:sterile-gloving", relation: .seeAlso),
            EntryLink(from: "reference:sterile-field-principles", to: "procedure:sterile-dressing-change", relation: .seeAlso),
            EntryLink(from: "reference:post-icu-recovery", to: "reference:abcdef-bundle", relation: .seeAlso),
            EntryLink(from: "reference:post-icu-recovery", to: "reference:discharge-teaching-framework", relation: .seeAlso),
            EntryLink(from: "reference:alarm-fatigue-and-safety", to: "reference:mechanical-ventilation-basics", relation: .seeAlso),
            EntryLink(from: "reference:communication-when-speech-is-limited", to: "communication:therapeutic-communication", relation: .seeAlso),
            EntryLink(from: "reference:communication-when-speech-is-limited", to: "reference:hearing-loss-communication", relation: .seeAlso)
        ]
    }
}
