import Foundation

extension EntryLinkRegistry {
    static func bedsideWorkflowLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:reading-lab-results", to: "reference:lab-panels", relation: .seeAlso),
            EntryLink(from: "reference:reading-lab-results", to: "reference:laboratory-test-preparation", relation: .seeAlso),
            EntryLink(from: "reference:laboratory-test-preparation", to: "procedure:venipuncture", relation: .seeAlso),
            EntryLink(from: "reference:laboratory-test-preparation", to: "reference:lab-tube-colors", relation: .seeAlso),
            EntryLink(from: "reference:nursing-care-plan-evaluation", to: "reference:nursing-documentation-principles", relation: .seeAlso),
            EntryLink(from: "reference:nursing-care-plan-evaluation", to: "reference:adult-head-to-toe-assessment", relation: .seeAlso),
            EntryLink(from: "lab:albumin", to: "reference:bedside-nutrition-assessment", relation: .seeAlso),
            EntryLink(from: "lab:procalcitonin", to: "reference:reading-lab-results", relation: .seeAlso)
        ]
    }
}
