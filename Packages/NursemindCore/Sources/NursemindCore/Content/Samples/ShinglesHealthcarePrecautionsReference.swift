import Foundation

private let depth9_zoster_clinical = CitationSource(
    id: "depth9_zoster_clinical",
    shortName: "Clinical Features of Shingles",
    detail: "Dermatomal rash; atypical features; ocular and disseminated complications. Page dated May 10, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/shingles/hcp/clinical-signs/index.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_isolation_appendix = CitationSource(
    id: "depth9_isolation_appendix",
    shortName: "Isolation Precautions: Appendix A",
    detail: "2007 guideline, maintained appendix: H, herpes zoster; localized versus disseminated precautions. Page dated September 11, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/isolation-precautions/appendix-a-type-duration.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_vzv_worker = CitationSource(
    id: "depth9_vzv_worker",
    shortName: "Varicella-Zoster Virus: Healthcare Personnel",
    detail: "Exposure; transmission from zoster; immune and susceptible personnel; lesions and work restrictions. Page dated March 23, 2026. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/healthcare-personnel-epidemiology-control/varicella.html",
    lastRetrieved: "2026-09-17"
)

private let depth9_vzv_test = CitationSource(
    id: "depth9_vzv_test",
    shortName: "Laboratory Testing for VZV",
    detail: "PCR of skin lesions; preferred specimens; limitations of serology. Page dated May 10, 2024. Federal educational prose adapted and condensed by NurseMind; images, logos and third-party material excluded. Source-fidelity review is not independent clinical approval.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/chickenpox/php/laboratories/index.html",
    lastRetrieved: "2026-09-17"
)

public enum ShinglesHealthcarePrecautionsSample {
    public static let entry = ReferenceEntry(
        id: "shingles-healthcare-precautions",
        title: "Shingles — healthcare precautions",
        subtitle: "Rash distribution, immune status, testing & exposure",
        eyebrow: "REFERENCE · INFECTION PREVENTION",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
        sections: [
            .bullets(title: "Recognize the pattern and exceptions", [
                AttributedBullet("Pain, tingling or itching may precede grouped blisters in one or two neighboring dermatomes, usually on one side. Immunocompromised patients may have atypical disease.", citationIDs: ["depth9_zoster_clinical"]),
                AttributedBullet("Lesions beyond the primary or neighboring dermatomes can represent dissemination. A generalized rash requires clinical assessment rather than assuming uncomplicated localized shingles.", citationIDs: ["depth9_zoster_clinical"])
            ]),
            .bullets(title: "Match precautions to immune status", [
                AttributedBullet("Localized shingles in an immunocompetent patient whose lesions can be fully contained or covered uses Standard Precautions until lesions are dry and crusted.", citationIDs: ["depth9_isolation_appendix"]),
                AttributedBullet("Disseminated shingles in any patient requires Airborne, Contact and Standard Precautions. The same applies to localized disease in immunocompromised patients until dissemination is ruled out.", citationIDs: ["depth9_isolation_appendix"])
            ]),
            .bullets(title: "Cover lesions and prevent exposure", [
                AttributedBullet("VZV from shingles can cause chickenpox in a susceptible contact. Covering lesions reduces transmission; active lesions remain infectious until they dry and crust.", citationIDs: ["depth9_vzv_worker"]),
                AttributedBullet("When immune caregivers are available, susceptible staff should not provide direct care. Precaution selection depends on lesion distribution, immune status and whether lesions can be contained.", citationIDs: ["depth9_isolation_appendix"])
            ]),
            .bullets(title: "Select a useful diagnostic sample", [
                AttributedBullet("PCR of skin lesions is the most useful confirmatory test, particularly for atypical presentations. Vesicles or scabs are preferred specimen sources.", citationIDs: ["depth9_vzv_test"]),
                AttributedBullet("IgM is less sensitive than lesion PCR and cannot reliably distinguish primary infection from reactivation. Serology has a limited role in confirming shingles.", citationIDs: ["depth9_vzv_test"])
            ]),
            .bullets(title: "Recognize higher-risk involvement", [
                AttributedBullet("Eye-region shingles can threaten vision. Ear or eye involvement can be associated with hearing or vision loss and warrants prompt clinical attention.", citationIDs: ["depth9_zoster_clinical"]),
                AttributedBullet("Disseminated disease may affect lungs, the nervous system or liver. Immunocompromised patients are more likely to develop severe or prolonged disease.", citationIDs: ["depth9_zoster_clinical"])
            ]),
            .bullets(title: "Address staff exposure promptly", [
                AttributedBullet("Exposure assessment includes unprotected contact with lesions and, for disseminated disease, shared infectious air. Occupational health determines immunity, prophylaxis and any work restrictions.", citationIDs: ["depth9_vzv_worker"]),
                AttributedBullet("Asymptomatic exposed staff with evidence of immunity generally need symptom monitoring from day eight after first exposure through day 21 after last exposure.", citationIDs: ["depth9_vzv_worker"])
            ]),
            .bullets(title: "Distinguish illness from exposure", [
                AttributedBullet("Staff with localized shingles may work only within occupational-health restrictions, with all lesions covered and avoidance of high-risk patients when feasible.", citationIDs: ["depth9_vzv_worker"]),
                AttributedBullet("If staff lesions cannot be covered, exclude from work until dry and crusted. Disseminated disease and immunocompromised staff with possible dissemination require exclusion.", citationIDs: ["depth9_vzv_worker"])
            ]),
            .bullets(title: "Follow symptoms beyond the rash", [
                AttributedBullet("Persistent pain after the rash resolves can represent postherpetic neuralgia. Pain burden and function deserve follow-up even when skin lesions have healed.", citationIDs: ["depth9_zoster_clinical"]),
                AttributedBullet("A typical rash helps recognition, but absence of rash or an atypical eruption can make clinical diagnosis uncertain. Lesion testing can clarify an appropriate case.", citationIDs: ["depth9_zoster_clinical"])
            ])
        ],
        citations: [depth9_zoster_clinical, depth9_isolation_appendix, depth9_vzv_worker, depth9_vzv_test],
        lastSourceFidelityReview: "2026-09-17"
    )
}
