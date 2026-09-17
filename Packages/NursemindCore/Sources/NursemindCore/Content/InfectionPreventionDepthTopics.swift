import Foundation

extension LibraryTopic {
    static let infectionPreventionDepthCollections: [LibraryTopic] = [
        .init(id: "pathogen-specific-precautions", group: .bedside, title: "Pathogen-specific precautions",
              subtitle: "Isolation, testing limits & exposure follow-up",
              entryIDs: [
                  "reference:c-diff-bedside-infection-prevention",
                  "reference:candida-auris-bedside-prevention",
                  "reference:norovirus-healthcare-outbreak-care",
                  "reference:measles-healthcare-exposure-prevention",
                  "reference:shingles-healthcare-precautions",
                  "reference:influenza-healthcare-prevention",
                  "reference:test-guide-flu-influenza-test",
                  "reference:test-guide-measles-and-mumps-tests",
                  "reference:test-guide-chickenpox-and-shingles-tests",
                  "lab:c-diff-toxin",
                  "reference:stool-sample-collection",
                  "reference:standard-precautions"
              ])
    ]
}
