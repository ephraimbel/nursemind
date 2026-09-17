import Foundation

extension EntryLinkRegistry {
    static func neurologyDigestiveEndocrineLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:parkinson-daily-function-support", to: "reference:dysphagia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:parkinson-daily-function-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:parkinson-daily-function-support", to: "reference:hospital-sleep-support", relation: .seeAlso),
            EntryLink(from: "reference:als-communication-daily-support", to: "diagnosis:als", relation: .seeAlso),
            EntryLink(from: "reference:als-communication-daily-support", to: "reference:dysphagia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:als-communication-daily-support", to: "diagnosis:caregiver-burnout", relation: .seeAlso),
            EntryLink(from: "reference:guillain-barre-recovery-support", to: "diagnosis:guillain-barre", relation: .seeAlso),
            EntryLink(from: "reference:guillain-barre-recovery-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:guillain-barre-recovery-support", to: "reference:dysphagia-mealtime-support", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-neuropathy-daily-support", to: "reference:cancer-treatment-neuropathy", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-neuropathy-daily-support", to: "reference:bedside-mobility-assessment", relation: .seeAlso),
            EntryLink(from: "reference:peripheral-neuropathy-daily-support", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:cirrhosis-nutrition-daily-support", to: "diagnosis:cirrhosis", relation: .seeAlso),
            EntryLink(from: "reference:cirrhosis-nutrition-daily-support", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:cirrhosis-nutrition-daily-support", to: "reference:hepatitis-c-treatment-follow-up", relation: .seeAlso),
            EntryLink(from: "reference:pancreatic-insufficiency-nutrition-support", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "reference:pancreatic-insufficiency-nutrition-support", to: "diagnosis:acute-pancreatitis", relation: .seeAlso),
            EntryLink(from: "reference:pancreatic-insufficiency-nutrition-support", to: "diagnosis:pancreatic-cancer", relation: .seeAlso),
            EntryLink(from: "reference:adrenal-insufficiency-illness-preparation", to: "diagnosis:addisons", relation: .seeAlso),
            EntryLink(from: "reference:adrenal-insufficiency-illness-preparation", to: "diagnosis:adrenal-crisis", relation: .seeAlso),
            EntryLink(from: "reference:adrenal-insufficiency-illness-preparation", to: "procedure:medication-reconciliation", relation: .seeAlso),
            EntryLink(from: "reference:hypothyroidism-treatment-follow-up", to: "diagnosis:hypothyroidism", relation: .seeAlso),
            EntryLink(from: "reference:hypothyroidism-treatment-follow-up", to: "lab:tsh", relation: .seeAlso),
            EntryLink(from: "reference:hypothyroidism-treatment-follow-up", to: "procedure:medication-reconciliation", relation: .seeAlso)
        ]
    }
}
