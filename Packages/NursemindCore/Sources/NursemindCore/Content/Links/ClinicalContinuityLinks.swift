import Foundation

extension EntryLinkRegistry {
    static func clinicalContinuityLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:sepsis-recovery-support", to: "diagnosis:sepsis", relation: .seeAlso),
            EntryLink(from: "reference:sepsis-recovery-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:sepsis-recovery-support", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:multiple-sclerosis-fatigue-support", to: "diagnosis:multiple-sclerosis", relation: .seeAlso),
            EntryLink(from: "reference:multiple-sclerosis-fatigue-support", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:multiple-sclerosis-fatigue-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:lupus-daily-care-follow-up", to: "diagnosis:sle", relation: .seeAlso),
            EntryLink(from: "reference:lupus-daily-care-follow-up", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:sjogren-eye-mouth-support", to: "diagnosis:sjogrens", relation: .seeAlso),
            EntryLink(from: "reference:sjogren-eye-mouth-support", to: "diagnosis:sjogren-syndrome", relation: .seeAlso),
            EntryLink(from: "reference:sjogren-eye-mouth-support", to: "reference:hospital-oral-care", relation: .seeAlso),
            EntryLink(from: "reference:sjogren-eye-mouth-support", to: "procedure:eye-drops", relation: .seeAlso),
            EntryLink(from: "reference:fibromyalgia-sleep-pacing-support", to: "diagnosis:fibromyalgia", relation: .seeAlso),
            EntryLink(from: "reference:fibromyalgia-sleep-pacing-support", to: "reference:psychotherapy-preparation-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:fibromyalgia-sleep-pacing-support", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:gerd-daily-care-follow-up", to: "diagnosis:gerd", relation: .seeAlso),
            EntryLink(from: "reference:gerd-daily-care-follow-up", to: "reference:focused-abdominal-assessment", relation: .seeAlso),
            EntryLink(from: "reference:ibd-nutrition-follow-up", to: "diagnosis:crohns-disease", relation: .seeAlso),
            EntryLink(from: "reference:ibd-nutrition-follow-up", to: "diagnosis:ulcerative-colitis", relation: .seeAlso),
            EntryLink(from: "reference:ibd-nutrition-follow-up", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:hepatitis-b-daily-care-prevention", to: "diagnosis:chronic-hepatitis-b", relation: .seeAlso),
            EntryLink(from: "reference:hepatitis-b-daily-care-prevention", to: "lab:hepatitis-b-panel", relation: .seeAlso),
            EntryLink(from: "reference:hepatitis-b-daily-care-prevention", to: "reference:hepatitis-c-treatment-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:hepatitis-c-treatment-follow-up", to: "diagnosis:hepatitis-c", relation: .seeAlso),
            EntryLink(from: "reference:hepatitis-c-treatment-follow-up", to: "reference:test-guide-hepatitis-testing", relation: .seeAlso),
            EntryLink(from: "reference:latent-tb-treatment-support", to: "procedure:tuberculin-skin-test", relation: .seeAlso),
            EntryLink(from: "reference:latent-tb-treatment-support", to: "diagnosis:tuberculosis", relation: .seeAlso),
            EntryLink(from: "reference:hiv-treatment-continuity-support", to: "diagnosis:hiv-aids", relation: .seeAlso),
            EntryLink(from: "reference:hiv-treatment-continuity-support", to: "lab:hiv-viral-load-cd4", relation: .seeAlso),
            EntryLink(from: "reference:hiv-treatment-continuity-support", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:interstitial-cystitis-daily-support", to: "reference:urinary-continence-support", relation: .seeAlso),
            EntryLink(from: "reference:interstitial-cystitis-daily-support", to: "reference:urinary-retention-recognition", relation: .seeAlso),
            EntryLink(from: "reference:interstitial-cystitis-daily-support", to: "reference:focused-abdominal-assessment", relation: .seeAlso)
        ]
    }
}
