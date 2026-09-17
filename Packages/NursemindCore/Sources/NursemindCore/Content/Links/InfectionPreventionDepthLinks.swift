import Foundation

extension EntryLinkRegistry {
    static func infectionPreventionDepthLinks() -> [EntryLink] {
        [
            EntryLink(from: "reference:c-diff-bedside-infection-prevention", to: "lab:c-diff-toxin", relation: .seeAlso),
            EntryLink(from: "reference:c-diff-bedside-infection-prevention", to: "reference:stool-sample-collection", relation: .seeAlso),
            EntryLink(from: "reference:c-diff-bedside-infection-prevention", to: "reference:diarrhea-acute-evaluation", relation: .seeAlso),
            EntryLink(from: "reference:candida-auris-bedside-prevention", to: "reference:contact-precautions", relation: .seeAlso),
            EntryLink(from: "reference:candida-auris-bedside-prevention", to: "reference:standard-precautions", relation: .seeAlso),
            EntryLink(from: "reference:candida-auris-bedside-prevention", to: "reference:c-diff-bedside-infection-prevention", relation: .seeAlso),
            EntryLink(from: "reference:norovirus-healthcare-outbreak-care", to: "reference:diarrhea-acute-evaluation", relation: .seeAlso),
            EntryLink(from: "reference:norovirus-healthcare-outbreak-care", to: "reference:stool-sample-collection", relation: .seeAlso),
            EntryLink(from: "reference:norovirus-healthcare-outbreak-care", to: "reference:c-diff-bedside-infection-prevention", relation: .seeAlso),
            EntryLink(from: "reference:measles-healthcare-exposure-prevention", to: "reference:airborne-precautions", relation: .seeAlso),
            EntryLink(from: "reference:measles-healthcare-exposure-prevention", to: "reference:test-guide-measles-and-mumps-tests", relation: .seeAlso),
            EntryLink(from: "reference:measles-healthcare-exposure-prevention", to: "reference:standard-precautions", relation: .seeAlso),
            EntryLink(from: "reference:shingles-healthcare-precautions", to: "reference:test-guide-chickenpox-and-shingles-tests", relation: .seeAlso),
            EntryLink(from: "reference:shingles-healthcare-precautions", to: "reference:airborne-precautions", relation: .seeAlso),
            EntryLink(from: "reference:shingles-healthcare-precautions", to: "reference:skin-assessment-beyond-wounds", relation: .seeAlso),
            EntryLink(from: "reference:influenza-healthcare-prevention", to: "reference:test-guide-flu-influenza-test", relation: .seeAlso),
            EntryLink(from: "reference:influenza-healthcare-prevention", to: "reference:droplet-precautions", relation: .seeAlso),
            EntryLink(from: "reference:influenza-healthcare-prevention", to: "reference:norovirus-healthcare-outbreak-care", relation: .seeAlso)
        ]
    }
}
