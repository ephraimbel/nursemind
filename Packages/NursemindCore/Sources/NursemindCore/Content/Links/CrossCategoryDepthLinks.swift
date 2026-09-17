import Foundation

extension EntryLinkRegistry {
    static func crossCategoryDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "drug:cefiderocol", to: "drug:ceftazidime-avibactam", relation: .seeAlso),
            EntryLink(from: "drug:cefiderocol", to: "drug:meropenem", relation: .seeAlso),
            EntryLink(from: "drug:cefiderocol", to: "diagnosis:septic-shock", relation: .seeAlso),
            EntryLink(from: "drug:ceftazidime-avibactam", to: "drug:meropenem", relation: .seeAlso),
            EntryLink(from: "drug:ceftazidime-avibactam", to: "lab:creatinine", relation: .seeAlso),
            EntryLink(from: "drip:angiotensin-ii-drip", to: "diagnosis:septic-shock", relation: .seeAlso),
            EntryLink(from: "drip:angiotensin-ii-drip", to: "reference:shock-hemodynamic-patterns", relation: .seeAlso),
            EntryLink(from: "drip:angiotensin-ii-drip", to: "lab:lactate", relation: .seeAlso),
            EntryLink(from: "drip:cangrelor-drip", to: "drug:cangrelor", relation: .seeAlso),
            EntryLink(from: "drip:cangrelor-drip", to: "reference:cardiac-catheterization-preparation-recovery", relation: .seeAlso),
            EntryLink(from: "drip:cangrelor-drip", to: "reference:coagulation-panel-interpretation", relation: .seeAlso),
            EntryLink(from: "lab:cystatin-c", to: "lab:creatinine", relation: .seeAlso),
            EntryLink(from: "lab:cystatin-c", to: "lab:urine-protein-creatinine", relation: .seeAlso),
            EntryLink(from: "lab:cystatin-c", to: "reference:kidney-biopsy-preparation-recovery", relation: .seeAlso),
            EntryLink(from: "lab:urine-osmolality", to: "lab:serum-osmolality", relation: .seeAlso),
            EntryLink(from: "lab:urine-osmolality", to: "reference:fluid-volume-assessment", relation: .seeAlso),
            EntryLink(from: "lab:urine-osmolality", to: "lab:sodium", relation: .seeAlso),
            EntryLink(from: "lab:urine-protein-creatinine", to: "lab:creatinine", relation: .seeAlso),
            EntryLink(from: "lab:urine-protein-creatinine", to: "procedure:24-hour-urine-collection", relation: .seeAlso),
            EntryLink(from: "procedure:24-hour-urine-collection", to: "lab:urine-osmolality", relation: .seeAlso),
            EntryLink(from: "procedure:24-hour-urine-collection", to: "reference:kidney-stone-recovery-prevention", relation: .seeAlso),
            EntryLink(from: "procedure:peak-flow-measurement", to: "diagnosis:asthma", relation: .seeAlso),
            EntryLink(from: "procedure:peak-flow-measurement", to: "reference:asthma-action-plan-daily-support", relation: .seeAlso),
            EntryLink(from: "procedure:peak-flow-measurement", to: "reference:pulmonary-function-testing-support", relation: .seeAlso),
            EntryLink(from: "diagnosis:alpha-1-antitrypsin-deficiency", to: "lab:alpha-1-antitrypsin", relation: .seeAlso),
            EntryLink(from: "diagnosis:alpha-1-antitrypsin-deficiency", to: "reference:bronchiectasis-daily-airway-care", relation: .seeAlso),
            EntryLink(from: "diagnosis:alpha-1-antitrypsin-deficiency", to: "reference:pulmonary-rehabilitation-support", relation: .seeAlso),
            EntryLink(from: "diagnosis:central-sleep-apnea", to: "diagnosis:osa-obstructive-sleep-apnea", relation: .seeAlso),
            EntryLink(from: "diagnosis:central-sleep-apnea", to: "reference:cpap-daily-support", relation: .seeAlso),
            EntryLink(from: "diagnosis:central-sleep-apnea", to: "reference:home-oxygen-and-oximetry", relation: .seeAlso),
            EntryLink(from: "scenario:checkback-falling-blood-pressure", to: "communication:check-back", relation: .seeAlso),
            EntryLink(from: "scenario:checkback-falling-blood-pressure", to: "communication:sbar", relation: .seeAlso),
            EntryLink(from: "scenario:checkback-falling-blood-pressure", to: "reference:shock-hemodynamic-patterns", relation: .seeAlso),
            EntryLink(from: "scenario:cus-labor-delivery-escalation", to: "communication:cus-assertive", relation: .seeAlso),
            EntryLink(from: "scenario:cus-labor-delivery-escalation", to: "communication:check-back", relation: .seeAlso),
            EntryLink(from: "scenario:cus-labor-delivery-escalation", to: "communication:sbar", relation: .seeAlso),
            EntryLink(from: "communication:interpreter-safety-escalation", to: "communication:cus-assertive", relation: .seeAlso),
            EntryLink(from: "communication:interpreter-safety-escalation", to: "communication:check-back", relation: .seeAlso),
            EntryLink(from: "communication:interpreter-safety-escalation", to: "reference:health-literacy-teach-back", relation: .seeAlso)
        ]
    }
}
