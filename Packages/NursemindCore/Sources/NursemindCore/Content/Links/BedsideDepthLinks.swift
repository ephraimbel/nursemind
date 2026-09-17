import Foundation

extension EntryLinkRegistry {
    static func bedsideDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:central-venous-catheter", to: "reference:clabsi-bundle", relation: .seeAlso),
            EntryLink(from: "reference:central-venous-catheter", to: "reference:peripheral-iv-complication-assessment", relation: .seeAlso),
            EntryLink(from: "reference:clabsi-bundle", to: "reference:standard-precautions", relation: .seeAlso),
            EntryLink(from: "reference:cauti-bundle", to: "procedure:foley-catheter-management", relation: .seeAlso),
            EntryLink(from: "reference:cauti-bundle", to: "procedure:bladder-scan", relation: .seeAlso),
            EntryLink(from: "reference:cauti-bundle", to: "reference:urinary-retention-recognition", relation: .seeAlso),
            EntryLink(from: "reference:chest-tube-drainage", to: "reference:focused-respiratory-assessment", relation: .seeAlso),
            EntryLink(from: "reference:chest-tube-drainage", to: "reference:surgical-drain-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:chest-tube-drainage", to: "reference:oxygen-device-bedside-checks", relation: .seeAlso),
            EntryLink(from: "reference:wound-care-fundamentals", to: "reference:surgical-drain-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:wound-care-fundamentals", to: "procedure:wound-dressing-change", relation: .seeAlso),
            EntryLink(from: "reference:wound-care-fundamentals", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:blood-transfusion-administration", to: "procedure:blood-transfusion", relation: .seeAlso),
            EntryLink(from: "reference:blood-transfusion-administration", to: "reference:transfusion-reaction-protocol", relation: .seeAlso),
            EntryLink(from: "reference:blood-transfusion-administration", to: "reference:peripheral-iv-complication-assessment", relation: .seeAlso),
            EntryLink(from: "reference:feeding-tube-placement-safety", to: "procedure:ng-tube", relation: .seeAlso),
            EntryLink(from: "reference:feeding-tube-placement-safety", to: "reference:enteral-feeding-tolerance", relation: .seeAlso),
            EntryLink(from: "reference:feeding-tube-placement-safety", to: "reference:enteral-medication-safety", relation: .seeAlso),
            EntryLink(from: "reference:enteral-feeding-tolerance", to: "reference:enteral-medication-safety", relation: .seeAlso),
            EntryLink(from: "reference:enteral-feeding-tolerance", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:enteral-feeding-tolerance", to: "reference:fluid-volume-assessment", relation: .seeAlso),
            EntryLink(from: "reference:enteral-medication-safety", to: "procedure:enteral-medication-tube", relation: .seeAlso),
            EntryLink(from: "reference:enteral-medication-safety", to: "reference:do-not-crush", relation: .seeAlso),
            EntryLink(from: "reference:nasogastric-decompression-monitoring", to: "procedure:ng-tube", relation: .seeAlso),
            EntryLink(from: "reference:nasogastric-decompression-monitoring", to: "reference:feeding-tube-placement-safety", relation: .seeAlso),
            EntryLink(from: "reference:nasogastric-decompression-monitoring", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:nasogastric-decompression-monitoring", to: "reference:fluid-volume-assessment", relation: .seeAlso),
            EntryLink(from: "reference:serial-neurological-assessment", to: "procedure:neuro-check", relation: .seeAlso),
            EntryLink(from: "reference:serial-neurological-assessment", to: "reference:mental-status-exam", relation: .seeAlso),
            EntryLink(from: "reference:serial-neurological-assessment", to: "reference:stroke-recovery-daily-support", relation: .seeAlso),
            EntryLink(from: "reference:fluid-volume-assessment", to: "reference:fluid-balance-monitoring", relation: .seeAlso),
            EntryLink(from: "reference:fluid-volume-assessment", to: "reference:focused-cardiovascular-assessment", relation: .seeAlso),
            EntryLink(from: "reference:fluid-volume-assessment", to: "reference:kidney-medication-safety", relation: .seeAlso),
            EntryLink(from: "reference:surgical-drain-monitoring", to: "reference:post-op-assessment", relation: .seeAlso),
            EntryLink(from: "reference:surgical-drain-monitoring", to: "reference:fluid-volume-assessment", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-iv-complication-assessment", to: "reference:chemo-extravasation", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-iv-complication-assessment", to: "reference:fluid-volume-assessment", relation: .seeAlso)
        ]
    }
}
