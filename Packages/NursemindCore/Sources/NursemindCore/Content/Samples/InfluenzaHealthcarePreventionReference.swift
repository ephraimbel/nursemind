import Foundation

private let depth9_flu_clinical = CitationSource(
    id: "depth9_flu_clinical",
    shortName: "Clinical Signs and Symptoms of Influenza",
    detail: "Atypical older-adult presentation; complications; clinical course. Page dated February 4, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/flu/hcp/clinical-signs/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_flu_control = CitationSource(
    id: "depth9_flu_control",
    shortName: "Seasonal Influenza: Healthcare Prevention",
    detail: "Healthcare scope; Droplet Precautions; duration; transport; aerosol-generating procedures. Page dated April 28, 2025. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/flu/hcp/infection-control/healthcare-settings.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_flu_test = CitationSource(
    id: "depth9_flu_test",
    shortName: "Rapid Influenza Diagnostic Tests",
    detail: "Antigen-test limitations; specimen selection; hospitalized patients; outbreak investigation. Page dated June 22, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/flu/hcp/testing-methods/clinician_guidance_ridt.html",
    lastRetrieved: "2026-09-17"
)

public enum InfluenzaHealthcarePreventionSample {
    public static let entry = ReferenceEntry(
        id: "influenza-healthcare-prevention",
        title: "Influenza — healthcare prevention",
        subtitle: "Seasonal flu, test limitations & bedside precautions",
        eyebrow: "REFERENCE · INFECTION PREVENTION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Recognize atypical influenza", [
                AttributedBullet("Abrupt cough, fever, aches and malaise are common, but older or immunosuppressed adults may have no fever. Absence of fever does not exclude influenza.", citationIDs: ["depth9_flu_clinical"]),
                AttributedBullet("Frail older adults may develop mental-status or behavioral changes and reduced appetite. Consider these changes alongside respiratory symptoms and the clinical assessment.", citationIDs: ["depth9_flu_clinical"])
            ]),
            .bullets(title: "Apply healthcare precautions", [
                AttributedBullet("For suspected or confirmed seasonal influenza, use Standard and Droplet Precautions. Place patients in a private room or an infection-prevention-approved cohort.", citationIDs: ["depth9_flu_control"]),
                AttributedBullet("Wear a facemask on entry to the room or patient space. Patient masking and respiratory hygiene provide source control when tolerated.", citationIDs: ["depth9_flu_control"])
            ]),
            .bullets(title: "Know what a rapid test means", [
                AttributedBullet("Rapid antigen influenza tests are different from rapid molecular assays. Antigen tests have limited sensitivity, so a negative result does not rule out influenza.", citationIDs: ["depth9_flu_test"]),
                AttributedBullet("Interpret results with community activity, symptom timing and specimen quality. False-positive antigen results are more likely when influenza prevalence is low.", citationIDs: ["depth9_flu_test"])
            ]),
            .bullets(title: "Support appropriate specimen collection", [
                AttributedBullet("Use the specimen type, collection device and transport medium specified for the assay. Collection early in illness generally improves the chance of detecting influenza.", citationIDs: ["depth9_flu_test"]),
                AttributedBullet("Molecular testing is recommended for hospitalized patients. A negative rapid antigen result should not delay indicated precautions or clinician-directed treatment decisions.", citationIDs: ["depth9_flu_test"])
            ]),
            .bullets(title: "Use the healthcare isolation timeline", [
                AttributedBullet("In healthcare settings, CDC recommends Droplet Precautions for seven days after illness onset or until 24 hours after fever and respiratory symptoms resolve, whichever is longer.", citationIDs: ["depth9_flu_control"]),
                AttributedBullet("Some patients, including severely immunocompromised people, may require longer precautions. Clinical discharge decisions and the receiving facility’s precautions should be coordinated.", citationIDs: ["depth9_flu_control"])
            ]),
            .bullets(title: "Plan higher-exposure procedures", [
                AttributedBullet("For medically necessary aerosol-generating procedures, limit staff and use an AIIR when feasible. Staff need gown, gloves, eye protection and a fit-tested N95 or equivalent.", citationIDs: ["depth9_flu_control"]),
                AttributedBullet("Room entry afterward follows the facility’s ventilation-based clearance interval. These seasonal-influenza recommendations do not replace guidance for novel influenza A, including avian strains.", citationIDs: ["depth9_flu_control"])
            ]),
            .bullets(title: "Communicate movement and clusters", [
                AttributedBullet("Limit transport to essential care, notify receiving staff and have the patient wear a facemask if tolerated. Maintain cleaning and disinfection of shared equipment.", citationIDs: ["depth9_flu_control"]),
                AttributedBullet("A suspected institutional influenza outbreak warrants public-health consultation and appropriate molecular testing. Negative rapid antigen tests should not end an outbreak investigation.", citationIDs: ["depth9_flu_test"])
            ]),
            .bullets(title: "Reassess the clinical course", [
                AttributedBullet("Cough and malaise can outlast other symptoms, especially in older adults or people with chronic lung disease. Recovery patterns should be assessed in context.", citationIDs: ["depth9_flu_clinical"]),
                AttributedBullet("Complications include viral or secondary bacterial pneumonia, dehydration and worsening chronic illness. Respiratory failure and sepsis are possible with severe disease.", citationIDs: ["depth9_flu_clinical"])
            ])
        ],
        citations: [depth9_flu_clinical, depth9_flu_control, depth9_flu_test],
        lastSourceFidelityReview: "2026-09-17"
    )
}
