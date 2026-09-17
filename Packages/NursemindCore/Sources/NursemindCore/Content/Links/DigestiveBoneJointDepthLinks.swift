import Foundation

extension EntryLinkRegistry {
    static func digestiveBoneJointDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:ibs-daily-symptom-food-support", to: "diagnosis:ibs", relation: .seeAlso),
            EntryLink(from: "reference:ibs-daily-symptom-food-support", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:ibs-daily-symptom-food-support", to: "reference:celiac-disease-food-planning", relation: .seeAlso),
            EntryLink(from: "reference:adult-constipation-bowel-routine", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:adult-constipation-bowel-routine", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:adult-constipation-bowel-routine", to: "reference:cancer-treatment-constipation-support", relation: .seeAlso),
            EntryLink(from: "reference:diverticular-disease-food-recovery", to: "diagnosis:diverticulitis", relation: .seeAlso),
            EntryLink(from: "reference:diverticular-disease-food-recovery", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:diverticular-disease-food-recovery", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:short-bowel-nutrition-continuity", to: "procedure:tpn-administration", relation: .seeAlso),
            EntryLink(from: "reference:short-bowel-nutrition-continuity", to: "reference:bowel-ostomy-daily-support", relation: .seeAlso),
            EntryLink(from: "reference:short-bowel-nutrition-continuity", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:osteoporosis-daily-fracture-prevention", to: "reference:osteoporosis-screening-frax", relation: .seeAlso),
            EntryLink(from: "reference:osteoporosis-daily-fracture-prevention", to: "reference:fall-fracture-prevention", relation: .seeAlso),
            EntryLink(from: "reference:osteoporosis-daily-fracture-prevention", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:osteoarthritis-daily-function-support", to: "diagnosis:osteoarthritis", relation: .seeAlso),
            EntryLink(from: "reference:osteoarthritis-daily-function-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:osteoarthritis-daily-function-support", to: "reference:hip-replacement-home-preparation", relation: .seeAlso),
            EntryLink(from: "reference:gout-daily-care-follow-up", to: "diagnosis:gout", relation: .seeAlso),
            EntryLink(from: "reference:gout-daily-care-follow-up", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:gout-daily-care-follow-up", to: "reference:chronic-pain-management-framework", relation: .seeAlso),
            EntryLink(from: "reference:scleroderma-daily-system-support", to: "diagnosis:systemic-sclerosis", relation: .seeAlso),
            EntryLink(from: "reference:scleroderma-daily-system-support", to: "reference:dysphagia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:scleroderma-daily-system-support", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso)
        ]
    }
}
