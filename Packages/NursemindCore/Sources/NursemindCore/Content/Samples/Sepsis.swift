import Foundation

public enum SepsisSample {
    public static let entry: DiagnosisEntry = {
        let ssc = CitationSource(
            id: "ssc_2021_pmc",
            shortName: "Surviving Sepsis Campaign 2021 (PMC OA)",
            detail: "Evans L, et al. Crit Care Med 2021. International Guidelines for Management of Sepsis and Septic Shock",
            publisher: "Society of Critical Care Medicine",
            license: .ccBy4,
            url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC8486643/",
            lastRetrieved: "2026-05-03"
        )
        let sep1 = CitationSource(
            id: "cms_sep1_2024",
            shortName: "CMS SEP-1 (Severe Sepsis and Septic Shock Bundle)",
            publisher: "Centers for Medicare & Medicaid Services",
            license: .publicDomain,
            url: "https://www.cms.gov/medicare/quality/measures/inpatient-hospital",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_medsurg_sepsis",
            shortName: "Open RN Health Alterations — Sepsis chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
            lastRetrieved: "2026-05-03"
        )

        return DiagnosisEntry(
            id: "sepsis",
            title: "Sepsis",
            subtitle: "Sepsis and septic shock",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .physiologicalAdaptation,
                priorityConcept: .perfusion
            ),
            definition: AttributedProse(
                "Sepsis is life-threatening organ dysfunction caused by a dysregulated host response to infection. Septic shock is a subset where circulatory and cellular abnormalities are profound enough to substantially increase mortality, with persistent hypotension requiring vasopressors to maintain MAP ≥65 mmHg and serum lactate >2 mmol/L despite adequate volume resuscitation.",
                citationIDs: ["ssc_2021_pmc"]
            ),
            pathophysiology: AttributedProse(
                "An infection triggers an exaggerated systemic inflammatory response. Cytokine release, endothelial dysfunction, and microcirculatory failure cause vasodilation, capillary leak, hypotension, tissue hypoperfusion, and multiorgan dysfunction.",
                citationIDs: ["openrn_medsurg_sepsis"]
            ),
            presentation: [
                AttributedBullet("Fever or hypothermia (older adults and immunocompromised may not mount a fever).", citationIDs: ["openrn_medsurg_sepsis", "ssc_2021_pmc"]),
                AttributedBullet("Tachycardia, tachypnea, hypotension.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Altered mental status — confusion, lethargy, agitation.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Cool, clammy, mottled skin or warm flushed skin (early septic shock).", citationIDs: ["openrn_medsurg_sepsis"]),
                AttributedBullet("Decreased urine output (<0.5 mL/kg/hr).", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Source-specific: cough/dyspnea (pneumonia), dysuria/CVA tenderness (UTI), abdominal pain (intra-abdominal), cellulitis or wound drainage (skin/soft tissue).", citationIDs: ["openrn_medsurg_sepsis"])
            ],
            diagnosticCriteria: [
                AttributedBullet("Suspected or documented infection PLUS organ dysfunction (SOFA score increase ≥2 from baseline).", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("qSOFA bedside screen (≥2 of: respiratory rate ≥22, altered mental status, systolic BP ≤100) flags risk but is no longer the primary diagnostic tool.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Lactate ≥2 mmol/L suggests tissue hypoperfusion; lactate >4 indicates critical perfusion.", citationIDs: ["cms_sep1_2024", "ssc_2021_pmc"]),
                AttributedBullet("Septic shock = sepsis + persistent hypotension requiring vasopressors for MAP ≥65 + lactate >2 despite volume resuscitation.", citationIDs: ["ssc_2021_pmc"])
            ],
            priorityAssessments: [
                AttributedBullet("Vital signs every 15 minutes during initial resuscitation; continuous cardiac monitoring.", citationIDs: ["openrn_medsurg_sepsis"]),
                AttributedBullet("Mental status (sepsis-associated encephalopathy is often the first sign in older adults).", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Skin perfusion: capillary refill, temperature, mottling.", citationIDs: ["openrn_medsurg_sepsis"]),
                AttributedBullet("Strict hourly intake and output; trend MAP and urine output.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Source identification: cultures (blood × 2, urine, sputum, wound) BEFORE antibiotics if it does not delay treatment.", citationIDs: ["ssc_2021_pmc", "cms_sep1_2024"])
            ],
            commonInterventions: [
                AttributedBullet("Broad-spectrum IV antibiotics within 1 hour of recognition (Hour-1 Bundle).", citationIDs: ["ssc_2021_pmc", "cms_sep1_2024"]),
                AttributedBullet("Crystalloid fluid resuscitation: 30 mL/kg in the first 3 hours for hypotension or lactate ≥4.", citationIDs: ["ssc_2021_pmc", "cms_sep1_2024"]),
                AttributedBullet("Vasopressors for persistent hypotension after fluid resuscitation — norepinephrine first-line, target MAP ≥65.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Source control — drainage, debridement, removal of infected hardware, surgical intervention as indicated.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Repeat lactate within 2–4 hours to assess clearance.", citationIDs: ["ssc_2021_pmc", "cms_sep1_2024"])
            ],
            watchFor: [
                AttributedBullet("Multi-organ dysfunction: AKI, ARDS, DIC, hepatic failure.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Late-stage atypical presentations: hypothermia, leukopenia, hypoglycemia — worse prognosis.", citationIDs: ["openrn_medsurg_sepsis"]),
                AttributedBullet("Persistent lactate elevation despite resuscitation suggests inadequate source control.", citationIDs: ["ssc_2021_pmc"]),
                AttributedBullet("Rapid deterioration — sepsis can progress from sepsis to septic shock to MODS within hours.", citationIDs: ["openrn_medsurg_sepsis"])
            ],
            citations: [ssc, sep1, openrn],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
