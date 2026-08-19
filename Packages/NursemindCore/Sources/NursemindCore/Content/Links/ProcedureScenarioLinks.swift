import Foundation

extension EntryLinkRegistry {
    /// Third batch: procedure hubs (performedFor + the specimen/drug/complication
    /// pairs that only seeAlso can express) and scenario/communication
    /// cross-references into the clinical topics they rehearse.
    static func procedureScenarioLinks() -> [EntryLink] {
        [
            // ===== Procedures → the diagnoses they treat =====
            EntryLink(from: "procedure:chest-tube-insertion", to: "diagnosis:pneumothorax", relation: .performedFor),
            EntryLink(from: "procedure:thoracentesis", to: "diagnosis:pleural-effusion", relation: .performedFor),
            EntryLink(from: "procedure:crrt-setup", to: "diagnosis:aki", relation: .performedFor),
            EntryLink(from: "procedure:transcutaneous-pacing", to: "diagnosis:complete-heart-block", relation: .performedFor),
            EntryLink(from: "procedure:ng-tube-insertion", to: "diagnosis:bowel-obstruction", relation: .performedFor),
            EntryLink(from: "procedure:icp-evd-management", to: "diagnosis:increased-icp", relation: .performedFor),
            EntryLink(from: "procedure:wound-vac", to: "diagnosis:pressure-injury", relation: .performedFor),
            EntryLink(from: "procedure:fundal-massage", to: "diagnosis:postpartum-hemorrhage", relation: .performedFor),

            // ===== Procedure ↔ specimen / drug / complication =====
            EntryLink(from: "procedure:foley-insertion", to: "diagnosis:cauti", relation: .seeAlso),
            EntryLink(from: "procedure:central-line-dressing", to: "diagnosis:clabsi", relation: .seeAlso),
            EntryLink(from: "procedure:lumbar-puncture-csf", to: "lab:csf-analysis", relation: .seeAlso),
            EntryLink(from: "procedure:rapid-sequence-intubation", to: "drug:succinylcholine", relation: .seeAlso),
            EntryLink(from: "procedure:pca-pump-management", to: "drug:morphine", relation: .seeAlso),
            EntryLink(from: "procedure:pca-pump-management", to: "drug:hydromorphone", relation: .seeAlso),
            EntryLink(from: "procedure:heel-stick-newborn", to: "lab:newborn-metabolic-screen", relation: .seeAlso),
            EntryLink(from: "procedure:blood-transfusion", to: "diagnosis:acute-hemolytic-transfusion", relation: .seeAlso),
            EntryLink(from: "procedure:naloxone-administration", to: "drug:naloxone", relation: .seeAlso),
            EntryLink(from: "procedure:methotrexate-rescue", to: "drug:leucovorin-rescue", relation: .seeAlso),
            EntryLink(from: "procedure:methotrexate-rescue", to: "drug:methotrexate", relation: .seeAlso),
            EntryLink(from: "procedure:tpa-stroke-admin", to: "drug:alteplase", relation: .seeAlso),

            // ===== Scenarios ↔ the topics they rehearse =====
            EntryLink(from: "scenario:sepsis-recognition-scenario", to: "diagnosis:sepsis", relation: .seeAlso),
            EntryLink(from: "scenario:ciwa-monitoring-scenario", to: "diagnosis:alcohol-withdrawal", relation: .seeAlso),
            EntryLink(from: "scenario:hyperkalemia-ekg-scenario", to: "diagnosis:hyperkalemia", relation: .seeAlso),
            EntryLink(from: "scenario:anaphylaxis-scenario", to: "diagnosis:anaphylaxis", relation: .seeAlso),
            EntryLink(from: "scenario:hypoglycemia-npo-scenario", to: "diagnosis:hypoglycemia", relation: .seeAlso),
            EntryLink(from: "scenario:pe-scenario", to: "diagnosis:pulmonary-embolism", relation: .seeAlso),
            EntryLink(from: "scenario:stroke-alert-scenario", to: "diagnosis:stroke", relation: .seeAlso),
            EntryLink(from: "scenario:peds-dka-scenario", to: "diagnosis:dka", relation: .seeAlso),
            EntryLink(from: "scenario:recognizing-delirium-scenario", to: "diagnosis:delirium", relation: .seeAlso),
            EntryLink(from: "scenario:opioid-oversedation-scenario", to: "drug:naloxone", relation: .seeAlso),
            EntryLink(from: "scenario:transfusion-reaction-scenario", to: "procedure:blood-transfusion", relation: .seeAlso),
            EntryLink(from: "scenario:transfusion-reaction-scenario", to: "diagnosis:acute-hemolytic-transfusion", relation: .seeAlso),
            EntryLink(from: "scenario:chest-tube-emergency-scenario", to: "procedure:chest-tube-care", relation: .seeAlso),
            EntryLink(from: "scenario:seizure-response-scenario", to: "diagnosis:status-epilepticus", relation: .seeAlso),
            EntryLink(from: "scenario:magnesium-toxicity-scenario", to: "drug:magnesium-sulfate", relation: .seeAlso),
            EntryLink(from: "scenario:magnesium-toxicity-scenario", to: "lab:magnesium", relation: .seeAlso),
            EntryLink(from: "scenario:code-blue-team-scenario", to: "procedure:code-blue-response", relation: .seeAlso),
            EntryLink(from: "scenario:rapid-response-scenario", to: "procedure:rapid-response-team-activation", relation: .seeAlso),
            EntryLink(from: "scenario:handoff-failure-scenario", to: "communication:sbar", relation: .seeAlso),
            EntryLink(from: "scenario:handoff-failure-scenario", to: "communication:ipass", relation: .seeAlso),
            EntryLink(from: "scenario:pph-scenario", to: "diagnosis:postpartum-hemorrhage", relation: .seeAlso),
            EntryLink(from: "scenario:pph-scenario", to: "procedure:fundal-massage", relation: .seeAlso),
            EntryLink(from: "scenario:neutropenic-fever-scenario", to: "diagnosis:neutropenic-fever", relation: .seeAlso),

            // ===== Communication ↔ the practices they pair with =====
            EntryLink(from: "communication:sbar", to: "communication:ipass", relation: .seeAlso),
            EntryLink(from: "communication:verbal-deescalation", to: "procedure:de-escalation", relation: .seeAlso),
            EntryLink(from: "communication:death-notification-bereavement", to: "procedure:postmortem-care", relation: .seeAlso),
            EntryLink(from: "communication:breaking-serious-news", to: "communication:death-notification-bereavement", relation: .seeAlso),
            EntryLink(from: "communication:chain-of-command-escalation", to: "procedure:rapid-response-team-activation", relation: .seeAlso),
        ]
    }
}
