import Foundation

extension EntryLinkRegistry {
    static func crossSpecialtyDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:cardiac-rehabilitation-recovery", to: "diagnosis:myocardial-infarction", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-rehabilitation-recovery", to: "reference:heart-failure-teaching", relation: .seeAlso),
            EntryLink(from: "reference:cardiac-rehabilitation-recovery", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:home-blood-pressure-measurement", to: "reference:focused-cardiovascular-assessment", relation: .seeAlso),
            EntryLink(from: "reference:home-blood-pressure-measurement", to: "procedure:orthostatic-vitals", relation: .seeAlso),
            EntryLink(from: "reference:continuous-glucose-monitor-teaching", to: "reference:diabetes-self-management-teaching", relation: .seeAlso),
            EntryLink(from: "reference:continuous-glucose-monitor-teaching", to: "diagnosis:hypoglycemia", relation: .seeAlso),
            EntryLink(from: "reference:celiac-disease-food-planning", to: "diagnosis:celiac-disease", relation: .seeAlso),
            EntryLink(from: "reference:celiac-disease-food-planning", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:gastroparesis-nutrition-support", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:gastroparesis-nutrition-support", to: "reference:diabetes-self-management-teaching", relation: .seeAlso),
            EntryLink(from: "reference:cataract-surgery-recovery-teaching", to: "procedure:eye-drops", relation: .seeAlso),
            EntryLink(from: "reference:cataract-surgery-recovery-teaching", to: "reference:low-vision-bedside-support", relation: .seeAlso),
            EntryLink(from: "reference:hearing-aid-daily-support", to: "reference:hearing-loss-communication", relation: .seeAlso),
            EntryLink(from: "reference:hearing-aid-daily-support", to: "diagnosis:ssnhl", relation: .seeAlso),
            EntryLink(from: "reference:rheumatoid-arthritis-daily-function", to: "diagnosis:rheumatoid-arthritis", relation: .seeAlso),
            EntryLink(from: "reference:rheumatoid-arthritis-daily-function", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:hip-replacement-home-preparation", to: "diagnosis:hip-fracture", relation: .seeAlso),
            EntryLink(from: "reference:hip-replacement-home-preparation", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:hip-replacement-home-preparation", to: "reference:fall-fracture-prevention", relation: .seeAlso),
            EntryLink(from: "reference:eczema-daily-skin-care", to: "diagnosis:atopic-dermatitis", relation: .seeAlso),
            EntryLink(from: "reference:eczema-daily-skin-care", to: "diagnosis:eczema-atopic", relation: .seeAlso),
            EntryLink(from: "reference:eczema-daily-skin-care", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:psoriasis-daily-skin-support", to: "diagnosis:psoriasis", relation: .seeAlso),
            EntryLink(from: "reference:psoriasis-daily-skin-support", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:epilepsy-daily-self-management", to: "reference:seizure-aed-selection", relation: .seeAlso),
            EntryLink(from: "reference:epilepsy-daily-self-management", to: "scenario:seizure-response-scenario", relation: .seeAlso),
            EntryLink(from: "reference:psychotherapy-preparation-follow-up", to: "communication:therapeutic-communication", relation: .seeAlso),
            EntryLink(from: "reference:psychotherapy-preparation-follow-up", to: "reference:trauma-informed-care", relation: .seeAlso),
            EntryLink(from: "reference:psychotherapy-preparation-follow-up", to: "reference:nursing-mental-health-support", relation: .seeAlso),
            EntryLink(from: "reference:asthma-action-plan-daily-support", to: "diagnosis:asthma", relation: .seeAlso),
            EntryLink(from: "reference:asthma-action-plan-daily-support", to: "procedure:mdi-inhaler-teaching", relation: .seeAlso),
            EntryLink(from: "reference:asthma-action-plan-daily-support", to: "reference:asthma-step-therapy", relation: .seeAlso)
        ]
    }
}
