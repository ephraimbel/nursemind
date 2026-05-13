import Foundation

// Curator-model diagnosis entries (round 4 expansion).
// Sources: Open RN Med-Surg / Health Alterations (CC BY 4.0), CDC (public domain),
// AAN / ACR / AAD / AAOS / AAFP / IDSA concept citations.

private let openrnMSr4 = CitationSource(
    id: "openrn_ms_round4",
    shortName: "Open RN Health Alterations / Medical-Surgical Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let openstaxMSr4 = CitationSource(
    id: "openstax_ms_round4",
    shortName: "OpenStax Medical-Surgical Nursing",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/medical-surgical-nursing",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR4 = CitationSource(
    id: "cdc_dx_round4",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let acrR4 = CitationSource(
    id: "acr_round4",
    shortName: "ACR rheumatology guidelines (concept citation)",
    publisher: "American College of Rheumatology",
    license: .factCitationOnly,
    url: "https://www.rheumatology.org/Practice-Quality/Clinical-Support/Clinical-Practice-Guidelines",
    lastRetrieved: "2026-05-04"
)

private let infectionR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let neuroR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let mobilityR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility)
private let painR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort)
private let sensoryR4 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .sensoryPerception)

// MARK: - Shingles (Herpes Zoster)

public enum ShinglesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "shingles",
        title: "Shingles (Herpes Zoster)",
        subtitle: "Reactivation of varicella · dermatomal rash · post-herpetic neuralgia",
        nclexTags: infectionR4,
        definition: AttributedProse(
            "Reactivation of latent varicella-zoster virus (VZV) from dorsal root ganglia, presenting as a unilateral, dermatomal vesicular rash. Most cases self-limited; complications include post-herpetic neuralgia, ocular involvement, and disseminated disease in immunocompromised. Lifetime risk ~30% in unvaccinated.",
            citationIDs: ["openrn_ms_round4", "cdc_dx_round4"]
        ),
        pathophysiology: AttributedProse(
            "After primary varicella infection (chickenpox), VZV remains dormant in sensory ganglia. Declining cell-mediated immunity (age, immunosuppression, stress) triggers reactivation; virus travels along sensory nerve to skin → vesicular rash in single dermatome.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("PRODROMAL pain, burning, tingling, itching in a dermatomal distribution 1–5 days before rash.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("UNILATERAL dermatomal vesicular rash — does not cross midline (key distinguishing feature).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Most common: thoracic, then lumbar, then trigeminal.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Vesicles crust over 7–10 days; total course 3–4 weeks.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Ophthalmic zoster (V1 distribution) — Hutchinson sign (lesions on tip of nose) → urgent ophthalmology; vision loss risk.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Ramsay Hunt syndrome (CN VII) — facial palsy + vesicles in ear/mouth.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — characteristic dermatomal vesicular rash typically diagnostic.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PCR of vesicle fluid — gold standard for atypical presentations.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DFA (less sensitive than PCR).", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain severity, location, dermatome.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Eye involvement — visual acuity, eye pain, redness; ophthalmology referral if V1.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Immunocompromise status — disseminated zoster risk; respiratory isolation if disseminated.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pregnancy — counsel; VZV in pregnancy can be severe.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("History of chickenpox or varicella vaccination — confirms VZV exposure.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIVIRAL — start within 72 hours of rash onset for best benefit (reduces severity, duration, post-herpetic neuralgia risk).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Acyclovir 800 mg PO 5×/day × 7–10 days, OR valacyclovir 1 g PO TID × 7 days, OR famciclovir 500 mg PO TID × 7 days.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PAIN — acetaminophen + NSAID; gabapentin or pregabalin for neuropathic pain; opioids for severe; lidocaine patch (after lesions crusted) for post-herpetic neuralgia.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("OPHTHALMIC zoster — IV acyclovir + urgent ophthalmology; topical antivirals; corticosteroids per ophthalmology.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DISSEMINATED zoster (immunocompromised, >1 dermatome) — IV acyclovir, airborne + contact precautions, hospitalization.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ISOLATION — contact precautions until lesions crusted; airborne also if disseminated or immunocompromised.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Cool compresses, calamine, oatmeal baths for symptom relief.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PREVENTION — Shingrix (recombinant zoster vaccine) two-dose series for adults ≥50 (and 19+ if immunocompromised); >90% effective.", citationIDs: ["cdc_dx_round4"])
        ],
        watchFor: [
            AttributedBullet("POST-HERPETIC NEURALGIA — pain persisting >3 months after rash resolves; up to 30% in elderly; gabapentin, pregabalin, TCAs, lidocaine patch, capsaicin cream.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("OPHTHALMIC zoster — visual loss; urgent ophtho.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bacterial superinfection of skin lesions.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Disseminated zoster in immunocompromised — high mortality without prompt IV antivirals.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Patient with active shingles can transmit VZV (chickenpox) to non-immune contacts (especially pregnant, immunocompromised, infants); cover lesions, hand hygiene.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4, cdcDxR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Lyme Disease

public enum LymeDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "lyme-disease",
        title: "Lyme Disease",
        subtitle: "Borrelia burgdorferi · tick-borne · doxycycline first-line",
        nclexTags: infectionR4,
        definition: AttributedProse(
            "Tick-borne infection caused by Borrelia burgdorferi (in US) or B. afzelii / B. garinii (Europe), transmitted by Ixodes scapularis (deer tick). Most common vector-borne illness in US. Three stages: early localized (erythema migrans), early disseminated, late.",
            citationIDs: ["openrn_ms_round4", "cdc_dx_round4"]
        ),
        pathophysiology: AttributedProse(
            "Tick must be attached >36–48 hours for transmission. Spirochete spreads from skin to multiple organs via blood and lymph. Northeast and Upper Midwest US are highest-incidence regions; cases now reported from many states.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("EARLY LOCALIZED (3–30 days post-bite): erythema migrans — expanding red rash with central clearing ('bull's-eye' classic but variable, often without clearing); fever, fatigue, myalgia, headache.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("EARLY DISSEMINATED (weeks-months): multiple EM lesions, facial nerve palsy (uni- or bilateral), aseptic meningitis, lymphocytic meningoradiculitis, cardiac (AV block, myocarditis).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LATE (months-years): arthritis (typically large joints, especially knee), peripheral neuropathy, encephalopathy.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Post-treatment Lyme disease syndrome (PTLDS) — persistent fatigue, arthralgia, cognitive symptoms after appropriate treatment; controversial 'chronic Lyme.'", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis sufficient when erythema migrans present in endemic area — TREAT, do not test.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Without EM, two-tier serology — ELISA → confirm with Western blot (early infection may be seronegative).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CSF studies for neurologic Lyme.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Tick-bite history — duration of attachment matters (<36 hr = low transmission risk).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Geographic exposure — endemic area or travel.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Skin exam for EM (often missed if patient does not see initial rash).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Cardiac (ECG for AV block in early disseminated), neuro (CN VII palsy), joints.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("EARLY LOCALIZED: doxycycline 100 mg PO BID × 10 days (preferred) OR amoxicillin 500 mg PO TID × 14 days (children, pregnancy) OR cefuroxime.", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("EARLY DISSEMINATED with neurologic / cardiac involvement (high-degree AV block, meningitis): IV ceftriaxone 2 g daily × 14 days.", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("LYME ARTHRITIS: doxycycline 100 mg PO BID × 28 days (or amoxicillin alternative).", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("Cardiac monitoring with severe AV block; pacemaker rarely needed (resolves with treatment).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("POST-EXPOSURE PROPHYLAXIS — single 200 mg doxycycline within 72 hours of tick removal in high-risk exposures (Ixodes attached >36 hr, endemic area).", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("PREVENTION — DEET insect repellent, permethrin-treated clothing, tick checks after outdoor activity, prompt removal with fine-tipped tweezers (steady upward pull, do not twist or burn).", citationIDs: ["cdc_dx_round4"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC LYME — AV block can be sudden; cardiac monitoring; rare cardiac arrest.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bilateral facial palsy — almost pathognomonic for Lyme in endemic area.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Persistent symptoms after treatment (PTLDS) — limited evidence for prolonged antibiotics; supportive care, address depression/anxiety.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Coinfection with anaplasmosis, babesiosis (Ixodes can transmit multiple pathogens).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pregnancy — treat aggressively to prevent congenital transmission.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4, cdcDxR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mononucleosis

public enum MononucleosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mononucleosis",
        title: "Infectious Mononucleosis (Mono)",
        subtitle: "EBV · adolescents/young adults · splenic rupture risk",
        nclexTags: infectionR4,
        definition: AttributedProse(
            "Acute clinical syndrome typically caused by Epstein-Barr virus (EBV; ~90%); occasionally CMV. Most common in adolescents and young adults. Self-limited but with characteristic prolonged fatigue and significant complications including splenic rupture and rare airway compromise.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "EBV transmitted through saliva ('kissing disease'); incubation 30–50 days. Virus infects B-lymphocytes → atypical lymphocytosis. Splenomegaly common from lymphocytic infiltration.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Classic triad: severe FATIGUE, fever, pharyngitis (often with exudate; symmetric tonsillar enlargement).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Lymphadenopathy — posterior cervical especially, often symmetric and tender.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Splenomegaly (50%); hepatomegaly (10–20%); transaminitis common.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("RASH — about 5% spontaneously; near-universal MORBILLIFORM RASH if patient receives amoxicillin/ampicillin (a hallmark — does not equal true penicillin allergy).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Symptoms peak 1–2 weeks; fatigue can persist 3–6 months.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Heterophile antibody (Monospot) — sensitive in adolescents/adults, less in children <4.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("EBV serology — VCA IgM (acute), VCA IgG, EBNA (past infection).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CBC: lymphocytosis with atypical lymphocytes >10%.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LFTs frequently elevated.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Splenic palpation (gentle); document size at baseline.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Airway — assess for tonsillar obstruction; rare but possible.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Activity counseling — NO contact sports until splenomegaly resolves (typically 4–6 weeks; some say 8 weeks).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LFT trend; supportive care needs.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("SUPPORTIVE — rest, hydration, acetaminophen / NSAIDs for pain and fever.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("AVOID amoxicillin/ampicillin (and avoid these in any pharyngitis until strep confirmed) — 80–90% develop morbilliform rash that gets misdiagnosed as penicillin allergy.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("AVOID CONTACT SPORTS / heavy lifting × 4–6 weeks (splenic rupture risk) — even minor trauma can rupture an enlarged spleen.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Corticosteroids ONLY for severe complications (airway compromise, severe thrombocytopenia, hemolytic anemia) — not for routine symptom management.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Acyclovir not effective in routine mono.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("SPLENIC RUPTURE — sudden left upper-quadrant or shoulder pain (Kehr sign); hypotension; SURGICAL EMERGENCY.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("AIRWAY OBSTRUCTION from massive tonsillar enlargement — rare but possible; corticosteroids and ENT.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hemolytic anemia, thrombocytopenia (autoimmune mediated; rare).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hepatitis (transaminitis) usually mild and self-limited.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("EBV is associated with later malignancies (Burkitt lymphoma, NPC, post-transplant lymphoproliferative disease in immunocompromised) — relevant for transplant or immunosuppression decisions.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Rash misattributed as 'penicillin allergy' — patient may avoid penicillin lifelong unnecessarily; counsel and document accurately.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pertussis

public enum PertussisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pertussis",
        title: "Pertussis (Whooping Cough)",
        subtitle: "Bordetella pertussis · paroxysmal cough · infants high-mortality",
        nclexTags: infectionR4,
        definition: AttributedProse(
            "Highly contagious respiratory infection caused by Bordetella pertussis. Severe in infants (apnea, mortality); milder in adolescents/adults but persistent. Vaccine-preventable but resurgent due to waning immunity. Reportable disease.",
            citationIDs: ["openrn_ms_round4", "cdc_dx_round4"]
        ),
        pathophysiology: AttributedProse(
            "Aerosol transmission. Pertussis toxin and tracheal cytotoxin damage respiratory epithelium → impaired ciliary function and intense paroxysmal cough.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("CATARRHAL stage (1–2 weeks): rhinorrhea, mild cough, low-grade fever — looks like URI; most contagious.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PAROXYSMAL stage (2–6 weeks): violent paroxysms of cough → INSPIRATORY 'WHOOP' (children); post-tussive emesis; cyanosis with paroxysm.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CONVALESCENT stage (weeks-months): gradual decrease in cough.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("INFANTS — apnea may be the only sign (no whoop); high mortality risk.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Adolescents/adults — atypical, persistent cough >2 weeks; missed diagnosis common.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("PCR of nasopharyngeal swab — first 3 weeks of cough most sensitive.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Culture (specialized media) — gold standard but slow and less sensitive.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Serology — useful in late presentation.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("DROPLET PRECAUTIONS until ≥5 days of effective antibiotics.", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("Vaccination history (Tdap, DTaP).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Infant — admit, monitor for apnea continuously; ICU if young or severe.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Identify household contacts and close contacts for prophylaxis.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIBIOTICS — start within 3 weeks of cough onset (does not shorten duration much but reduces transmissibility): azithromycin 5 days (preferred), erythromycin 14 days, clarithromycin 7 days. TMP-SMX in macrolide allergy.", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("INFANTS <6 months — admit; monitor for apnea, feeding difficulty, hypoxia; ICU possible.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Supportive — small frequent feedings, hydration, oxygen as needed, suctioning; avoid cough suppressants.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("POST-EXPOSURE PROPHYLAXIS — household and close contacts (regardless of vaccination) get same antibiotics × 5–14 days.", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("PREVENTION — DTaP at 2/4/6/15-18 months and 4–6 years; Tdap booster at 11–12; Tdap in pregnancy (27–36 weeks each pregnancy) — protects newborn until they can be vaccinated.", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("Adult Tdap booster every 10 years; one-time Tdap if not previously received.", citationIDs: ["cdc_dx_round4"]),
            AttributedBullet("REPORTABLE — notify public health.", citationIDs: ["cdc_dx_round4"])
        ],
        watchFor: [
            AttributedBullet("INFANT APNEA — leading cause of pertussis death; continuous monitoring.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pulmonary hypertension and severe pneumonia in infants — high mortality.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Post-tussive complications — rib fracture, hernia, syncope, urinary incontinence (adults).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Encephalopathy (rare) — hypoxic in infants.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Outbreaks in unvaccinated communities; boost herd immunity through Tdap.", citationIDs: ["cdc_dx_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4, cdcDxR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - SLE

public enum SLESample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sle",
        title: "Systemic Lupus Erythematosus (SLE)",
        subtitle: "Multi-system autoimmune · women of reproductive age · ANA positive",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation),
        definition: AttributedProse(
            "Systemic autoimmune disease with multi-organ involvement and variable course. Driven by autoantibodies against nuclear antigens. Disproportionately affects women (9:1 F:M), people of color, and presents in reproductive years. Mortality from cardiovascular disease, infection, and lupus nephritis.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Genetic susceptibility + environmental triggers (UV light, infection, drugs) → loss of tolerance → autoantibody production (ANA, anti-dsDNA, anti-Smith) → immune complex deposition in tissues → inflammation across multiple organ systems.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Constitutional — fatigue (most common), fever, weight loss.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MUCOCUTANEOUS — malar (butterfly) rash sparing nasolabial folds, discoid rash, photosensitivity, oral ulcers (typically painless), alopecia.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Joints — symmetric polyarthritis (non-erosive, unlike RA).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Renal (lupus nephritis) — proteinuria, hematuria, RBC casts, HTN; biopsy classifies.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hematologic — anemia of chronic disease, autoimmune hemolytic anemia, leukopenia, thrombocytopenia.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Serositis — pleurisy, pericarditis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Neurologic — seizures, psychosis, stroke, cognitive dysfunction.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Cardiopulmonary — premature CAD, pulmonary HTN, Libman-Sacks endocarditis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Antiphospholipid syndrome (APS) — clotting and pregnancy losses.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACR/EULAR 2019 criteria (entry: ANA ≥1:80) — weighted scoring across constitutional, hematologic, neuropsychiatric, mucocutaneous, serosal, musculoskeletal, renal, antibody domains; ≥10 = SLE.", citationIDs: ["acr_round4"]),
            AttributedBullet("ANA — sensitive (95%+); anti-dsDNA and anti-Sm specific.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Complement (C3, C4) — low in active disease.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Antiphospholipid antibodies (lupus anticoagulant, anticardiolipin, β2-glycoprotein) — coexisting APS.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Renal biopsy if proteinuria — classifies nephritis (Class I–VI).", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Disease activity — SLEDAI score, mucocutaneous, joint count, BP, urine.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Renal function — creatinine, urinalysis with microscopy, urine protein-creatinine ratio.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CV risk — accelerated atherosclerosis; statin, BP, smoking cessation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mental health — depression, cognitive symptoms common.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pregnancy — high-risk; pre-conception counseling; SLE flares can occur during pregnancy.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Infection — leading cause of mortality with immunosuppression.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("HYDROXYCHLOROQUINE — foundational; mortality benefit; recommended for ALL SLE patients unless contraindicated.", citationIDs: ["acr_round4"]),
            AttributedBullet("NSAIDs / acetaminophen for joint and serositis pain.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CORTICOSTEROIDS — for moderate-severe; lowest effective dose; taper aggressively; long-term toxicity major concern.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("IMMUNOSUPPRESSANTS — methotrexate, azathioprine, mycophenolate (especially for nephritis), cyclophosphamide for severe.", citationIDs: ["acr_round4"]),
            AttributedBullet("BIOLOGICS — belimumab, anifrolumab; rituximab off-label.", citationIDs: ["acr_round4"]),
            AttributedBullet("Lupus nephritis — induction (mycophenolate or cyclophosphamide) + glucocorticoids; maintenance (mycophenolate or azathioprine).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Sun protection — UV triggers flares; SPF, hats, avoidance.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Vaccines — non-live preferred; influenza annually, pneumococcal, COVID, HPV, Tdap; AVOID live (MMR, varicella, intranasal flu) on immunosuppressants.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Cardiovascular risk reduction — accelerated atherosclerosis; aggressive BP, lipid, glucose, smoking management.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("LUPUS NEPHRITIS — leading mortality cause; renal biopsy guides treatment; ACEi/ARB for proteinuria.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("INFECTION — opportunistic with immunosuppression; early evaluation of fever.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CV mortality — accelerated atherosclerosis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("APS / clotting — anticoagulation if APS positive with thrombosis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Drug-induced lupus — hydralazine, procainamide, isoniazid, anti-TNF — usually resolves on discontinuation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hydroxychloroquine retinal toxicity — annual ophthalmologic exam.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pregnancy planning — preconception assessment; specific medication considerations.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4, acrR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Polymyalgia Rheumatica

public enum PMRSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "polymyalgia-rheumatica",
        title: "Polymyalgia Rheumatica (PMR)",
        subtitle: "Older adults · proximal stiffness · responds dramatically to low-dose steroids",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        definition: AttributedProse(
            "Inflammatory rheumatic condition of older adults (>50) characterized by symmetric proximal pain and stiffness in the shoulders, hips, and neck. Strongly associated with giant cell arteritis (GCA — 15–30% of PMR patients have or develop GCA). Dramatic response to low-dose steroids is diagnostic.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Likely systemic inflammatory process; specific etiology unclear. Higher in those of Northern European descent; >50 years (peak 70s).",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("BILATERAL shoulder and/or hip girdle ACHING and stiffness — typically morning stiffness >45 minutes.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Difficulty rising from chair, brushing hair, dressing.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Constitutional — low-grade fever, fatigue, weight loss.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Onset can be acute (days) or subacute (weeks).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Range of motion limited by pain (not weakness — strength testing normal once warmed up).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("GCA OVERLAP — temporal headache, jaw claudication, scalp tenderness, visual changes; GCA must be screened in any PMR patient.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical: age >50, bilateral shoulder/hip stiffness ≥45 min morning, ≥2 weeks duration.", citationIDs: ["acr_round4"]),
            AttributedBullet("ELEVATED ESR (>40 typical) and/or CRP — supportive but not always required.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Dramatic response to prednisone 15–20 mg PO daily within 48 hours essentially confirms.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Ultrasound — bilateral subdeltoid bursitis, biceps tenosynovitis, glenohumeral synovitis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Differential — RA, hypothyroidism, statin myopathy, paraneoplastic, fibromyalgia.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("SCREEN FOR GCA at every visit — temporal headache, jaw claudication, scalp tenderness, visual changes.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ESR, CRP at baseline and during treatment.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Functional status — getting in/out of car, standing from chair, dressing.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bone density — chronic steroid use; baseline DEXA, calcium/vitamin D, bisphosphonate.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Glucose, BP, weight monitoring on steroids.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("PREDNISONE 15–20 mg PO daily — dramatic symptom relief within 24–72 hours; treatment course 1–2+ years with slow taper.", citationIDs: ["acr_round4"]),
            AttributedBullet("Standard taper — reduce by 2.5 mg every 2–4 weeks once symptoms controlled; slower below 10 mg.", citationIDs: ["acr_round4"]),
            AttributedBullet("If concurrent GCA — 40–60 mg prednisone (or higher); IV methylprednisolone for visual symptoms.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Methotrexate — steroid-sparing for relapses or steroid intolerance.", citationIDs: ["acr_round4"]),
            AttributedBullet("Tocilizumab — for refractory cases or GCA.", citationIDs: ["acr_round4"]),
            AttributedBullet("Bone protection — calcium 1000–1200 mg/day, vitamin D 800–1000 IU/day, bisphosphonate per duration/dose.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Vaccinations — non-live; pneumococcal, influenza, COVID; herpes zoster (Shingrix non-live OK).", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("GIANT CELL ARTERITIS — visual loss, stroke risk; immediate high-dose steroids before biopsy if suspected.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("STEROID COMPLICATIONS — diabetes, hypertension, osteoporosis, weight gain, mood changes, infection susceptibility, cataract.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Relapse during taper — common; slow taper, consider methotrexate.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Adrenal suppression with prolonged steroid use — never stop abruptly; stress-dose for illness/surgery.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Misdiagnosis — RA, fibromyalgia, statin myopathy, hypothyroidism — workup before steroids.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4, acrR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Giant Cell Arteritis

public enum GCASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "giant-cell-arteritis",
        title: "Giant Cell Arteritis (Temporal Arteritis)",
        subtitle: "Vision-threatening · DON'T DELAY steroids · biopsy after starting",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Granulomatous vasculitis of medium and large arteries (especially branches of carotid — temporal, ophthalmic). Older adults (>50, peak 70s). Untreated, can cause irreversible vision loss within hours and increase stroke risk. Steroids prevent vision loss and must be started on suspicion — biopsy confirms but is performed AFTER steroids begin.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Inflammatory infiltrate (multinucleated giant cells) of arterial wall → narrowing/occlusion → end-organ ischemia. Highest risk: ophthalmic artery (vision loss), aortic arch and branches.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("NEW HEADACHE — temporal especially; persistent, severe, often unilateral.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Scalp tenderness — pain combing hair.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("JAW CLAUDICATION — pain with chewing or talking; nearly pathognomonic.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("VISUAL changes — diplopia, amaurosis fugax (transient monocular blindness), persistent vision loss; medical emergency.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Constitutional — fatigue, low-grade fever, weight loss.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Coexisting PMR symptoms in many.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Tongue claudication, ear pain (rare).", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ELEVATED ESR (often >50, sometimes >100) and CRP.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Temporal artery — thickened, tender, possibly nodular, decreased pulse.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Temporal artery BIOPSY — gold standard; perform within 1–2 weeks of starting steroids (yield drops only modestly).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Temporal artery ultrasound (halo sign) — increasingly used at experienced centers.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CTA / MRA / PET — large-vessel involvement; thoracic aortic aneurysm screening recommended.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Visual acuity, fundoscopic exam, eye pain — any visual involvement is emergency.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Temporal artery palpation; cranial nerve exam.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Stroke screen — focal neurologic deficits.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Aorta — listen for bruits; CTA at diagnosis and follow-up for thoracic aneurysm.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("DO NOT DELAY STEROIDS — start before biopsy if suspicion is high; biopsy yield remains adequate within 1–2 weeks.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("VISUAL SYMPTOMS: METHYLPREDNISOLONE 1 g IV daily × 3 days, then prednisone 60 mg daily.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("NO visual symptoms: PREDNISONE 40–60 mg PO daily; gradual taper over 12+ months.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("TOCILIZUMAB — IL-6 inhibitor; FDA-approved for GCA; steroid-sparing.", citationIDs: ["acr_round4"]),
            AttributedBullet("Aspirin 81 mg daily — reduces ischemic complications (some evidence).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bone protection (calcium, vitamin D, bisphosphonate) for prolonged steroids.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Aortic aneurysm surveillance — chest imaging at diagnosis and yearly.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Vaccinations (non-live).", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("VISION LOSS — permanent if not treated within hours; bilateral involvement possible after first eye affected.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("STROKE — vertebrobasilar territory.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("THORACIC AORTIC ANEURYSM / DISSECTION — late complication; lifelong surveillance.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Steroid complications — diabetes, hypertension, osteoporosis, infection, mood, cataract.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Relapse during taper — common.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Coexisting PMR.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4, acrR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bell's Palsy

public enum BellsPalsySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bells-palsy",
        title: "Bell's Palsy",
        subtitle: "Acute idiopathic peripheral CN VII palsy · forehead involved · steroids ± antivirals",
        nclexTags: neuroR4,
        definition: AttributedProse(
            "Acute (≤72 hour onset) idiopathic peripheral facial nerve (CN VII) paralysis. Most common acute mononeuropathy. Unilateral facial weakness involving the FOREHEAD (distinguishes from central / stroke). Most patients recover with appropriate treatment; ~70–85% complete recovery.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Likely viral inflammation of CN VII (HSV-1 implicated; reactivation hypothesized) → swelling within bony facial canal → compression and ischemia of the nerve. Pregnancy, diabetes, hypertension are risk factors.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Acute (hours-days) UNILATERAL facial paralysis affecting upper AND lower face — INABILITY TO WRINKLE FOREHEAD or close eyelid on affected side.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Loss of taste anterior 2/3 of tongue (ipsilateral) — chorda tympani involvement.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hyperacusis (sound sensitivity) — stapedius muscle paralysis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Decreased lacrimation, drooling, slurred speech.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Ear pain (post-auricular) often precedes paralysis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DISTINGUISH from STROKE — central VII palsy spares forehead (frontalis innervated by both hemispheres). Forehead involvement = peripheral / Bell's; forehead sparing = central / stroke until proven otherwise.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — diagnosis of exclusion. House-Brackmann scale grades severity (1–6).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MRI for atypical presentations — slow-onset, no improvement at 6+ weeks, recurrent, atypical features (suggests tumor / Lyme / HSV).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Lyme serology in endemic areas, especially with bilateral or concurrent rash.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Differential — stroke, tumor, Lyme disease, Ramsay Hunt syndrome (vesicles in ear, CN VII palsy from VZV), parotid mass, sarcoidosis (Heerfordt).", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Clearly differentiate FOREHEAD INVOLVEMENT — peripheral (Bell's) vs central (stroke).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("EYE PROTECTION — corneal abrasion / exposure keratitis from inability to close eyelid.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hearing exam (audiometry) if hyperacusis or asymmetry.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pregnancy testing in patients of childbearing potential (3× higher risk in pregnancy).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Glucose — diabetes association.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("PREDNISONE 60 mg PO daily × 5 days, then taper over 5 days (or similar) — START WITHIN 72 HOURS for best benefit.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ANTIVIRAL — valacyclovir 1 g PO TID × 7 days OR acyclovir; combined with steroids in moderate-severe; benefit modest but present.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("EYE CARE — artificial tears every 1–2 hours daytime, lubricating ointment at night, eye patch or moisture chamber at night, avoid wind/dust; ophthalmology if symptomatic.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Follow-up — assess recovery; most begin improving within 3 weeks; complete recovery within 3–6 months.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Physical therapy — facial exercises; consider biofeedback for residual weakness.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Reassurance — most patients recover substantially.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("STROKE MIMIC — central VII spares forehead; assess upper face function carefully.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Ramsay Hunt — VZV reactivation; vesicles in ear / mouth + CN VII; treat with antivirals + steroids; worse prognosis than Bell's.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CORNEAL INJURY — most common complication; aggressive eye protection.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Synkinesis (involuntary co-contraction) — late complication; PT may help.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Recurrent or bilateral palsy — unusual for Bell's; workup for Lyme, sarcoidosis, GBS, tumor.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Slow improvement (>3 weeks) — imaging warranted.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Vertigo (BPPV)

public enum VertigoSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "vertigo-bppv",
        title: "Vertigo (BPPV and Peripheral Causes)",
        subtitle: "Spinning sensation · differentiate peripheral from central",
        nclexTags: sensoryR4,
        definition: AttributedProse(
            "Vertigo = sensation of spinning or movement when stationary. PERIPHERAL causes (inner ear) — BPPV (most common), Ménière disease, vestibular neuritis, labyrinthitis. CENTRAL causes (brainstem/cerebellum) — stroke, MS, tumor — these are the dangerous ones. Distinguishing them is the bedside priority.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "BPPV — otoliths (calcium carbonate crystals) dislodge from utricle into semicircular canals → abnormal endolymph movement during head position changes → vertigo. Ménière — increased endolymphatic fluid pressure. Vestibular neuritis — inflammation of vestibular nerve, often viral.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("BPPV: brief (seconds-1 minute) episodes of spinning triggered by HEAD POSITION CHANGES (rolling over in bed, looking up, lying down); positional nystagmus on Dix-Hallpike maneuver.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MÉNIÈRE: episodes 20 min–24 hr; vertigo + low-frequency hearing loss + tinnitus + ear fullness.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("VESTIBULAR NEURITIS: prolonged severe vertigo (days), no hearing loss; often after viral illness.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LABYRINTHITIS: similar to neuritis but WITH hearing loss.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CENTRAL: gradual onset, persistent symptoms, focal neurologic signs (diplopia, ataxia, weakness, dysarthria), abnormal HiNT exam, vertical/torsional/direction-changing nystagmus.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HISTORY — duration of episode, triggers, associated symptoms (HEAR, hearing/tinnitus; HEADACHE; HiNT exam).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DIX-HALLPIKE MANEUVER — provokes BPPV; produces transient nystagmus and vertigo.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("HEAD IMPULSE TEST — abnormal in peripheral; normal in central (paradox — abnormal HiT suggests peripheral, NORMAL HiT in someone with vertigo suggests central / stroke).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MRI brain (DWI) for any central red flag — sudden severe vertigo, focal deficits, abnormal HiNT pattern, advanced age, vascular risk factors.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish PERIPHERAL vs CENTRAL — focal neuro exam, HINTS exam (Head Impulse, Nystagmus, Test of Skew), age, risk factors.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hearing loss / tinnitus (Ménière) vs no hearing change.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Fall risk — hospitalize if severe and unable to ambulate safely.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hydration — vomiting and inability to eat may necessitate IV fluids.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("BPPV: EPLEY MANEUVER — repositions otoliths; highly effective; can be performed at bedside or by PT.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Vestibular suppressants for ACUTE severe vertigo — meclizine, diphenhydramine, promethazine, lorazepam (short-term ONLY; impair central compensation if used long-term).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Antiemetic — ondansetron, prochlorperazine.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MÉNIÈRE — low-sodium diet, diuretics (HCTZ), betahistine (off-label), intratympanic dexamethasone, severe cases — gentamicin (chemical labyrinthectomy).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("VESTIBULAR NEURITIS — early steroids may shorten course; vestibular rehab.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CENTRAL VERTIGO (stroke) — emergency stroke pathway; do NOT treat as BPPV.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("VESTIBULAR REHABILITATION THERAPY — for chronic / recurrent dizziness; promotes central adaptation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Fall prevention — assistive devices, home safety.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("STROKE — vertebrobasilar; unrecognized 'dizziness' as stroke is well-documented; consider in any vertigo with vascular risk factors or focal deficits, or normal head impulse test.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Ménière progression — gradual hearing loss; counseling and early intervention.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Falls and trauma during severe vertigo episodes.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Vestibular suppressants long-term — impair central adaptation; limit duration.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Angle-Closure Glaucoma

public enum AcuteGlaucomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-angle-closure-glaucoma",
        title: "Acute Angle-Closure Glaucoma",
        subtitle: "Eye emergency · severe pain + vision loss + halos · STAT ophthalmology",
        nclexTags: sensoryR4,
        definition: AttributedProse(
            "Sudden closure of anterior chamber angle → impaired aqueous humor outflow → rapid rise in intraocular pressure → optic nerve injury and irreversible vision loss within hours. Ophthalmologic emergency.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Anatomically narrow angle (genetic, hyperopia, age, ethnic — Asian descent) → pupillary block from physiologic mydriasis (dim light, stress, anticholinergic medications) → iris bulges forward → angle closes → aqueous accumulates → IOP rises rapidly (>40–50 mmHg).",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Sudden severe UNILATERAL eye pain.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Decreased VISION; HALOS around lights.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Headache (often described as 'worst' on affected side).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Nausea, vomiting (vagal response — can mimic GI illness).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Eye examination: red eye, mid-dilated/fixed pupil, hazy/cloudy cornea, ROCK-HARD globe on palpation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Triggers: dim light (movie theater, evening), anticholinergic drugs (antihistamines, decongestants, antidepressants, cold medicine), stress.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Tonometry — IOP markedly elevated (>40–50 mmHg; normal 10–21).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Slit-lamp exam — narrow/closed angle, corneal edema, fixed mid-dilated pupil.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Gonioscopy — visualizes the closed angle.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Recognize as eye emergency — VISION LOSS within hours if untreated.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("STAT ophthalmology — definitive treatment is at the eye doctor.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Symptom severity, eye exam, IOP if available.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Recent medication history — anticholinergics, sympathomimetics.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("URGENT OPHTHALMOLOGY referral — they perform laser peripheral iridotomy as definitive treatment.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("INITIAL IOP-LOWERING (per facility, often initiated in ED with eye specialist input):", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Topical β-blocker (timolol), α-agonist (apraclonidine, brimonidine), prostaglandin analog or carbonic anhydrase inhibitor (dorzolamide).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Oral / IV acetazolamide 500 mg.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Topical pilocarpine 1–2% (after IOP <40 — pulls iris away from angle).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("IV mannitol 1–2 g/kg if refractory — reduces vitreous volume.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Avoid medications that worsen — sympathomimetics, anticholinergics, dilating drops in narrow-angle patients.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LASER PERIPHERAL IRIDOTOMY — definitive; creates small hole in iris, equalizing pressure.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PROPHYLACTIC iridotomy in fellow eye — high risk of subsequent attack.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("PERMANENT VISION LOSS — within hours if IOP not lowered.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Misdiagnosis as migraine, GI illness, sinus infection — eye exam is critical in headache + nausea + visual symptoms.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Anticholinergic precipitants — review medication list; avoid in narrow-angle patients.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bilateral attacks — possible; treat both eyes.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Open-angle glaucoma is DIFFERENT — chronic, asymptomatic, gradual peripheral vision loss; managed long-term, not an emergency.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hip Fracture

public enum HipFractureSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hip-fracture",
        title: "Hip Fracture",
        subtitle: "Elderly · falls · surgical fixation within 48 hours · 1-year mortality 20–30%",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .mobility),
        definition: AttributedProse(
            "Fracture of the proximal femur — femoral neck (intracapsular), intertrochanteric, or subtrochanteric. Predominantly in elderly with osteoporosis after low-energy fall; in younger patients high-energy trauma. Surgical fixation within 24–48 hours improves outcomes; one-year mortality 20–30%.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Risk factors: osteoporosis (bone density), advanced age, female sex, prior fracture, falls, poor vision, polypharmacy, dementia. The lethality reflects underlying frailty + immobilization complications + surgery in older adults.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Pain in groin / hip / thigh / referred to knee.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Inability to bear weight.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Affected leg classically SHORTENED, EXTERNALLY ROTATED, ABDUCTED.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Occult / non-displaced fracture — can ambulate; high index of suspicion in elderly with hip pain after fall even with normal X-ray (need MRI).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("History of fall (low-energy in elderly; high-energy in young).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Confusion / delirium common — can mask presentation.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("X-ray (AP pelvis, lateral hip) — first imaging; misses ~5% of occult fractures.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MRI or CT for high suspicion with negative X-ray.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CBC, BMP, coag, type & screen, ECG — pre-op workup.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Investigate cause of fall — orthostatics, ECG, BMP, medications, vision, gait.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, perfusion — large amount of blood can be lost into thigh.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pain score; circulation, sensation, motor function distal to injury.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Skin integrity — sacral, heel, intertrochanteric pressure.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Nutritional status, hydration.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Cognitive baseline — delirium risk.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Anticoagulation status — affects surgical timing and reversal.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("PAIN — multimodal: regional NERVE BLOCK (fascia iliaca compartment block) at presentation; acetaminophen ATC; opioid sparingly.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("SURGICAL FIXATION WITHIN 24–48 HOURS — improves mortality and reduces complications. Type depends on fracture (hemiarthroplasty / total hip replacement for displaced femoral neck; ORIF intramedullary nail for intertrochanteric).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("VTE PROPHYLAXIS — high risk; mechanical (SCDs) until therapeutic; pharmacologic (LMWH, fondaparinux, aspirin, DOAC) per protocol.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Reverse anticoagulation as appropriate (vitamin K, andexanet, idarucizumab) before surgery.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Prevent DELIRIUM — orient, glasses, hearing aids, sleep, mobility, minimize anticholinergics/benzodiazepines.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PRESSURE injury prevention — turning, heel offloading, specialty mattress.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Aggressive PT/OT post-op — early mobilization day 1; weight-bearing per surgeon.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Nutrition — protein supplementation reduces complications.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bone protection — vitamin D 800–2000 IU, calcium 1000–1200 mg, anti-resorptive (bisphosphonate) post-op.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("FALL PREVENTION going forward — home safety, medication review, vision/hearing optimization, vestibular, strength.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("PE / DVT — high risk; aggressive prophylaxis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Delirium — common, predicts poor outcome.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pneumonia, UTI from immobility.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("AVASCULAR NECROSIS of femoral head — especially with displaced femoral neck; reason for arthroplasty rather than fixation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hip dislocation post-arthroplasty — adherence to hip precautions for 6+ weeks (no flexion >90°, no adduction past midline, no internal rotation).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ONE-YEAR MORTALITY 20–30% in elderly — frailty + complications.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Long-term — loss of independence; ~50% return to pre-fracture function.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Vertebral Compression Fracture

public enum CompressionFractureSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "vertebral-compression-fracture",
        title: "Vertebral Compression Fracture",
        subtitle: "Osteoporosis · sudden back pain · conservative vs vertebroplasty",
        nclexTags: painR4,
        definition: AttributedProse(
            "Collapse of one or more vertebral bodies, most commonly from osteoporosis (low-energy or no trauma) in postmenopausal women and elderly. Pain typically resolves over 6–12 weeks with conservative care; some require vertebroplasty/kyphoplasty. Multiple compression fractures cause kyphosis, height loss, restrictive lung disease.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Bone loss → low-energy fracture (cough, sneeze, lifting) or asymptomatic gradual collapse. Less commonly malignancy (metastases — myeloma, breast, prostate, lung), trauma, hyperparathyroidism, prolonged steroid use.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Acute or gradual onset thoracic/lumbar back pain — often after minor activity.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pain worse with movement, transitional positions.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Tender to palpation over involved vertebra.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LOSS OF HEIGHT, KYPHOSIS over time with multiple fractures.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Neurologic deficits UNCOMMON — if present, suspect alternative diagnosis (burst fracture, pathologic, infection).", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("X-ray spine — wedge or biconcave deformity; >20% height loss.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MRI — distinguishes acute (edema/marrow signal) vs chronic; rules out malignancy, infection.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DEXA — confirm osteoporosis; T-score ≤ -2.5.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pathologic fracture workup — CBC, ESR, CMP, SPEP/UPEP (myeloma), TSH, vitamin D, PTH, possible PSA.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain severity, mobility limitation, ADL impact.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Neurologic exam — motor, sensory, bowel/bladder function (red flags).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mechanism — true low-energy or trauma; pathologic vs osteoporotic.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Falls history; future fracture prevention.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pulmonary function in multi-level kyphosis.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("CONSERVATIVE — first-line; most pain resolves over 6–12 weeks.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PAIN — multimodal: acetaminophen, NSAIDs (caution in elderly), low-dose opioid short course, calcitonin (analgesic in some), gabapentin / pregabalin if neuropathic.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bracing for selected (TLSO) — provides comfort and reduces flexion; debated for healing.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Early mobilization — bed rest >2–3 days worsens outcomes.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("VERTEBROPLASTY / KYPHOPLASTY — for refractory pain >6 weeks despite conservative care; injects cement; benefit/risk debated; reserve for selected.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("OSTEOPOROSIS treatment — bisphosphonate (alendronate, zoledronic acid), denosumab, romosozumab, teriparatide; calcium 1000–1200 mg, vitamin D 800–2000 IU.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Fall prevention; weight-bearing exercise, balance training.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pathologic fracture — oncologic workup; radiation, surgery as needed.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("RED FLAGS — neurologic deficit, bowel/bladder dysfunction, fever, weight loss, history of malignancy → urgent imaging and surgical evaluation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Adjacent-level fracture after vertebroplasty.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Restrictive lung disease from kyphosis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Falls and additional fractures — common; aggressive prevention.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Chronic pain syndrome — common after multiple fractures.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pathologic — myeloma is the most common occult cause; SPEP/UPEP.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sciatica / Lumbar Radiculopathy

public enum SciaticaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sciatica",
        title: "Sciatica (Lumbar Radiculopathy)",
        subtitle: "Disc herniation · radiating leg pain · cauda equina red flags",
        nclexTags: painR4,
        definition: AttributedProse(
            "Pain radiating along the sciatic nerve distribution (low back → buttock → posterior/lateral leg → foot), typically from lumbar nerve-root compression by disc herniation, spinal stenosis, or spondylolisthesis. Most cases self-limited (resolve in 6–12 weeks); cauda equina syndrome is an emergency.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Most common cause: L4-L5 or L5-S1 disc herniation compressing nerve root. Other causes: spinal stenosis, spondylolisthesis, pyriformis syndrome, tumor (rare).",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Unilateral RADIATING leg pain (below knee distinguishes radiculopathy from non-specific back pain).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Worse with sitting, coughing, sneezing, Valsalva, certain positions.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Numbness, paresthesias in dermatomal distribution (L4 — medial foot; L5 — dorsum, big toe; S1 — lateral foot, sole).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Weakness — foot drop (L5), plantarflexion (S1), quadriceps (L4).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Positive STRAIGHT LEG RAISE (passive lift of straight leg between 30–70° reproduces leg pain).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("RED FLAGS for cauda equina — bilateral leg symptoms, saddle anesthesia, urinary retention/incontinence, fecal incontinence, sexual dysfunction.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — history + dermatomal pain + neurologic exam + positive SLR.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Imaging usually NOT needed in first 6 weeks unless red flags or severe progressive deficits.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MRI lumbar spine — for persistent symptoms >6 weeks, motor deficit, red flags, or considering surgery.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CT myelogram if MRI contraindicated.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("DERMATOMAL exam — sensation, motor strength (especially foot dorsiflexion / plantarflexion / quadriceps), reflexes (knee L4, ankle S1).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CAUDA EQUINA SCREEN — saddle anesthesia, post-void residual (bladder scan), bowel/anal sphincter tone.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pain severity, ADL impact, work activities.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Identify red flags warranting emergent imaging — fever, weight loss, history of cancer, IV drug use, immunosuppression.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("CONSERVATIVE first-line — most resolve in 6–12 weeks.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Stay ACTIVE — bed rest worsens outcomes; modify activity but do not immobilize.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PAIN — acetaminophen + NSAIDs first-line; gabapentin / pregabalin / duloxetine for neuropathic component.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Steroids — short course oral steroid burst (limited evidence) OR epidural steroid injection (modest, short-term benefit) for refractory.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Avoid muscle relaxants long-term; avoid opioids when possible.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("PHYSICAL THERAPY — directional preference (McKenzie), core strengthening, postural training; effective.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Heat / cold packs as adjunct.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("SURGICAL CONSULTATION — for: cauda equina (emergent), progressive motor deficit, refractory disabling pain >6 weeks, recurrent severe.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("CAUDA EQUINA SYNDROME — SURGICAL EMERGENCY (operate within 24–48 hours); permanent neurologic deficits if delayed.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Progressive motor deficit — neurosurgical consult.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Spinal infection / epidural abscess — fever + back pain + IV drug use / immunosuppression / recent procedure; emergent imaging.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Spinal cord compression from malignancy — known cancer + back pain + neurologic deficit; oncologic emergency.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Chronic pain syndrome — psychosocial factors important; multidisciplinary approach.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mastitis

public enum MastitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mastitis",
        title: "Mastitis",
        subtitle: "Lactational · S. aureus most common · keep breastfeeding",
        nclexTags: infectionR4,
        definition: AttributedProse(
            "Inflammation/infection of breast tissue. Most common during lactation (lactational mastitis) — typically due to milk stasis + Staphylococcus aureus. Can also occur in non-lactating women (periductal mastitis, granulomatous, idiopathic). Untreated lactational mastitis can progress to abscess.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Lactational: milk stasis + nipple cracks → bacterial entry → infection. Non-lactational: periductal inflammation, smoking-associated, granulomatous (often misdiagnosed as cancer).",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("UNILATERAL breast pain, redness (often wedge-shaped), warmth, swelling, induration.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Systemic — fever (often >38.5°C), chills, malaise, myalgias.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Tender lymphadenopathy in axilla.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ABSCESS — fluctuant area on exam; persistent symptoms despite antibiotics.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Inflammatory breast cancer can mimic — peau d'orange, persistent erythema not improving with antibiotics; biopsy if any concern.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — typical presentation in lactating woman.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Ultrasound — to evaluate for abscess (fluid collection).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Milk culture — for failed therapy or hospital-acquired.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mammography / biopsy — for non-lactational or persistent mastitis to rule out malignancy.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — sepsis screen.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Breast exam — symmetry, redness pattern, fluctuance, lymphadenopathy.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Breastfeeding status, latch, frequency, milk supply concerns.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Maternal mental health — pain and difficulty feeding contribute to postpartum depression.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("CONTINUE BREASTFEEDING — empty the affected breast frequently; avoiding nursing worsens stasis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ANTIBIOTICS for 10–14 days — DICLOXACILLIN or cephalexin first-line (empiric for MSSA). If MRSA suspected (severe, recurrent, healthcare exposure): clindamycin or TMP-SMX.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pain — acetaminophen, ibuprofen (compatible with breastfeeding).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Warm compresses BEFORE feeding (improves milk flow); cool compresses AFTER for comfort.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Improve LATCH — lactation consultant; correct cracked nipples.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hydration, rest, support.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ABSCESS — needs DRAINAGE (US-guided needle aspiration or incision); continue antibiotics; can usually continue breastfeeding from unaffected side or pumping affected.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Most improve within 24–48 hours of antibiotics; if not improving, reassess for abscess or resistance.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("ABSCESS — failure to improve with antibiotics; needs drainage.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Sepsis from delayed treatment — admit if systemic, bacteremic, or immunocompromised.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("INFLAMMATORY BREAST CANCER — persistent erythema, peau d'orange, no improvement with antibiotics; do NOT delay biopsy.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Premature weaning — many women stop breastfeeding due to mastitis; lactation support and reassurance critical.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Postpartum depression — pain and feeding difficulty are major contributors; screen.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Postpartum Psychosis

public enum PostpartumPsychosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "postpartum-psychosis",
        title: "Postpartum Psychosis",
        subtitle: "Rare · psychiatric emergency · highest infanticide and suicide risk · admit",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
        definition: AttributedProse(
            "Severe postpartum mental illness with psychotic features — hallucinations, delusions (often with infant content), confusion, severe mood symptoms — with rapid onset typically within first 1–2 weeks postpartum. Affects 1–2 per 1000 deliveries; highest in first-time mothers and women with bipolar disorder. PSYCHIATRIC EMERGENCY with risk of infanticide (~4%) and suicide (~5%). Hospitalize.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Likely abrupt hormonal shifts (estrogen, progesterone, thyroid) on background of biological vulnerability (especially bipolar disorder spectrum). Sleep deprivation amplifies. Strong genetic component.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Onset typically days 1–14 postpartum, occasionally up to 6 weeks; rapidly progressive.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Confusion, disorientation, agitation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hallucinations (auditory, visual), DELUSIONS (often involving the infant — that the infant is evil, divine, possessed, replaced, or that the mother needs to harm the infant or herself to save the baby).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mood lability — manic, depressed, mixed.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bizarre or out-of-character behavior.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Insomnia (severe; precedes psychotic symptoms).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Thoughts of harming infant or self.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Risk factors: prior bipolar disorder (most important — 25% recurrence), prior postpartum psychosis (50% recurrence), family history, primiparity, sleep deprivation, prior psychiatric history.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — psychotic symptoms in postpartum period.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Distinguish from POSTPARTUM DEPRESSION (not psychotic; gradual onset, weeks-months) and POSTPARTUM BLUES (mild, peaks day 4–5, resolves by 2 weeks).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Rule out medical causes — TSH, glucose, electrolytes, infection, drugs, postpartum thyroiditis, eclampsia.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Organic causes more common than primary psychosis in pure postpartum window — full medical workup.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("INFANT SAFETY — separate mother from infant if any concern; do not leave alone with infant; supervised feeding and care.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Suicide risk assessment — direct, frequent.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mother safety — fall, dehydration, malnutrition.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Sleep — assess; improvement of sleep is a critical early intervention.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Support system — partner, family; counsel about severity and supervision.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("INPATIENT PSYCHIATRIC ADMISSION — almost always required; mother-baby units when available, otherwise psychiatric hospitalization with arranged infant care.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Antipsychotic — atypical (olanzapine, risperidone, quetiapine).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mood stabilizer — lithium most effective in bipolar-related; valproate may be used (caution if breastfeeding).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Benzodiazepine for acute agitation, insomnia.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ECT — rapidly effective; safe in postpartum and breastfeeding; often used for severe / refractory cases.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Address SLEEP — sleep is a treatment in itself; consult to maximize uninterrupted sleep.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Postpartum medical workup — TSH, electrolytes, infection.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Family education — recurrence risk, monitoring for future pregnancies, prophylactic considerations.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mother-infant bonding support in supervised setting once stable.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("INFANTICIDE / SUICIDE — risk is real; do not leave mother alone with infant during acute episode; supervise sleep, feeding, all interactions.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("RECURRENCE in subsequent pregnancies — 50%+ in those with prior PP psychosis; preconception planning, prophylactic mood stabilizer in some.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DELAY in seeking care — family may dismiss as 'baby blues'; nurse education key.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Stigma and reluctance to disclose — reassure that early treatment is highly effective.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bipolar disorder underlying — many will be diagnosed with bipolar after this episode; long-term mood stabilization.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Breastfeeding considerations — many psychiatric medications compatible; lithium typically not; consult perinatal psychiatry.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Stevens-Johnson Syndrome / TEN

public enum SJSTENSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sjs-ten",
        title: "Stevens-Johnson Syndrome / Toxic Epidermal Necrolysis",
        subtitle: "Drug reaction · skin sloughing · burn-unit care · STOP offending drug",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety),
        definition: AttributedProse(
            "Severe cutaneous adverse drug reaction characterized by extensive epidermal detachment, mucosal involvement, and systemic illness. SJS = <10% BSA detachment; SJS/TEN overlap = 10–30%; TEN = >30% BSA. Mortality SJS ~5%, TEN ~30%. Almost always drug-induced.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Drug-specific T-cell-mediated cytotoxic reaction → keratinocyte apoptosis → epidermal-dermal separation. HLA-B*5701 (abacavir), HLA-B*1502 (carbamazepine in Asians), HLA-B*5801 (allopurinol) are genetic risks.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("PRODROME — fever, malaise, sore throat, eye irritation 1–3 days before rash; mistaken for viral illness.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Painful erythematous rash on face/trunk, spreading peripherally → vesicles, bullae, sheets of detachment.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("MUCOSAL involvement — oral, ocular (PURULENT conjunctivitis with PSEUDOMEMBRANES, can scar permanently), genital, anal — exquisitely painful.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("NIKOLSKY SIGN — gentle pressure causes epidermis to slide off (positive in SJS/TEN).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Fever, tachycardia, hypotension; mimics burn injury.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Common offending drugs: SULFA (TMP-SMX), ANTICONVULSANTS (carbamazepine, phenytoin, lamotrigine — slow titration prevents), ALLOPURINOL, NSAIDs, antibiotics (penicillins, cephalosporins, vancomycin), nevirapine.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Onset typically 1–3 weeks after starting offending drug; rare with re-exposure (faster).", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — typical presentation + drug history.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("SCORTEN score — TEN severity score using age, BSA, malignancy, HR, BUN, glucose, bicarb; predicts mortality.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Skin biopsy — full-thickness epidermal necrosis, subepidermal blister.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Differential — staphylococcal scalded skin syndrome (children, no mucosal), erythema multiforme major (target lesions), DRESS, autoimmune blistering, severe drug rash with eosinophilia.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("BSA estimation (similar to burns).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hemodynamic stability — fluid losses can be massive.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Mucosal involvement — eye exam (urgent ophthalmology), oral, GU.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Drug history — start from 4 weeks back; identify suspect.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pain.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("STOP THE OFFENDING DRUG — single most important intervention; mortality reduces with early discontinuation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("BURN UNIT or specialized ICU — parallel to thermal burn management.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Aggressive fluid resuscitation — significant insensible losses.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Wound care — non-adherent dressings; sterile technique; minimize debridement.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Pain — opioids (often IV), regional/neuraxial when appropriate.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Eye care — urgent ophthalmology; aggressive lubrication, antibiotics; lifelong vision-threatening sequelae possible.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Oral / mucosal care — debride pseudomembranes, topical anesthetics, soft diet or NG.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Nutrition — high-protein, possibly enteral support.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Infection prevention — AVOID empiric systemic antibiotics (raise SJS risk further); strict isolation; surveillance for sepsis.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Specific therapies — debated; cyclosporine, IVIG, etanercept have been used; corticosteroids controversial (some evidence for harm).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DOCUMENT drug allergy as 'SJS/TEN' — lifelong avoidance of related agents.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Counsel — never re-take offending drug; provide medical alert ID; family screening for HLA in some cases.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY — SCORTEN-stratified; sepsis is leading cause.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("BLINDNESS / corneal scarring — urgent ophthalmology and intensive eye care.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Sepsis — staph, pseudomonas; vigilant infection surveillance.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Genital, GI, respiratory mucosal involvement — long-term scarring/strictures.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Persistent post-acute sequelae — eyes, lungs, pigmentation, nail changes, psychological trauma.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Re-exposure to offending drug or related class — fatal possible; document carefully.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acute Viral Gastroenteritis

public enum ViralGastroenteritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "viral-gastroenteritis",
        title: "Acute Viral Gastroenteritis",
        subtitle: "Norovirus dominant in adults · supportive care · ORS first-line",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .fluidElectrolytes),
        definition: AttributedProse(
            "Acute infectious diarrhea and vomiting from viral pathogens. Adults: NOROVIRUS most common (most common cause of acute non-bacterial gastroenteritis in US; rapid onset, sharp resolution). Children: rotavirus (declining due to vaccine), norovirus, adenovirus. Self-limited; main risk is dehydration.",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Fecal-oral transmission; norovirus also via airborne vomitus particles → highly contagious in closed settings (cruises, schools, nursing homes, healthcare). Mucosal damage → secretory diarrhea + vomiting → fluid losses.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("Acute onset NAUSEA, VOMITING, watery DIARRHEA, abdominal cramping.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Low-grade fever, headache, myalgias.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Norovirus — 24–48 hr duration, abrupt onset/resolution.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Rotavirus — children 6 mo – 2 yr; up to 7 days; can be severe with dehydration.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bloody diarrhea, high fever, severe abdominal pain — suggest BACTERIAL etiology, not viral; further workup.", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — acute onset GE without bloody diarrhea, severe pain, or systemic toxicity is typically viral.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Stool studies if: bloody, prolonged (>3 days), severe, immunocompromised, healthcare exposure (consider C diff), recent travel.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Norovirus PCR — primarily for outbreak investigation.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("BMP — assess for dehydration, electrolyte derangement.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Hydration — intake/output, mucous membranes, capillary refill, mental status.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Severity — frequency/volume of diarrhea, vomiting; orthostatic vitals.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Risk factors — pregnancy, elderly, immunocompromise, comorbidities.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Exposure history — recent food, travel, contacts, healthcare facility, daycare.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Outbreak — multiple cases in same setting → public health notification.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("ORAL REHYDRATION SOLUTION (ORS) — first-line for mild-moderate; sip small amounts frequently.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("IV fluids (NS or LR) for severe or unable to tolerate PO.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("ANTIEMETICS — ondansetron 4 mg PO/ODT (single dose) for vomiting in adults and children >2 yr; promethazine, prochlorperazine alternatives.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LOPERAMIDE — only for non-bloody, non-toxic adults; AVOID in children, fever, bloody diarrhea, severe disease, suspected C. diff.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Resume normal diet ASAP — BRAT diet historical, NOT recommended (insufficient calories).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("CONTACT precautions in healthcare; private room; SOAP-AND-WATER hand hygiene (alcohol does NOT inactivate norovirus).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bleach-based environmental cleaning.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Healthcare workers — exclude from work until 48–72 hours after symptom resolution.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Outbreak control — public health notification, contact tracing.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Probiotics — modest benefit in some studies for diarrhea duration.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("Severe dehydration → AKI, hypovolemic shock — admit, IV fluids.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hyponatremia in children rehydrated with plain water — use ORS.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bacterial pathogens (Salmonella, Shigella, EHEC, Campylobacter) — bloody diarrhea, severe pain, fever; antibiotics in select.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("C. difficile in healthcare exposure — soap-and-water hygiene, contact precautions, oral vancomycin or fidaxomicin.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Hemolytic uremic syndrome from EHEC — bloody diarrhea + thrombocytopenia + AKI; AVOID antibiotics in suspected EHEC.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Outbreak — norovirus on cruise ships, schools, nursing homes; public health.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Travelers' diarrhea — bacterial more common; loperamide + azithromycin for moderate.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4, cdcDxR4],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Atopic Dermatitis (Eczema)

public enum EczemaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "atopic-dermatitis",
        title: "Atopic Dermatitis (Eczema)",
        subtitle: "Chronic relapsing pruritic dermatitis · moisturize + topical steroids",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .sensoryPerception),
        definition: AttributedProse(
            "Chronic, relapsing inflammatory skin disease with intense pruritus and characteristic distribution by age. Most common in children (60% onset before age 1, 90% before age 5); ~50% persist into adulthood. Part of the 'atopic march' (allergic rhinitis, asthma, food allergies).",
            citationIDs: ["openrn_ms_round4"]
        ),
        pathophysiology: AttributedProse(
            "Skin barrier dysfunction (filaggrin gene mutations) + immune dysregulation (Th2-skewed) + environmental triggers (irritants, allergens, microbes, climate). Itch–scratch cycle perpetuates.",
            citationIDs: ["openrn_ms_round4"]
        ),
        presentation: [
            AttributedBullet("INTENSE PRURITUS (defining feature).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("DISTRIBUTION by age — INFANTS: face, scalp, extensor surfaces of arms/legs. CHILDREN: flexural areas (antecubital, popliteal, neck). ADULTS: hands, eyelids, neck, flexural.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Acute lesions — erythema, papules, vesicles, weeping, crusting.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Chronic lesions — lichenification (thickening), hyperpigmentation, fissures.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Sleep disturbance, school/work absence, mood impact.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Family history of atopy (eczema, asthma, allergic rhinitis).", citationIDs: ["openrn_ms_round4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Hanifin and Rajka criteria — pruritus + typical morphology/distribution + chronic-relapsing course + family/personal history of atopy.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("No specific lab test; allergy testing if specific triggers suspected.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Differential — contact dermatitis, scabies, psoriasis, seborrheic dermatitis.", citationIDs: ["openrn_ms_round4"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity — BSA involvement, sleep disturbance, functional impairment.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Triggers — soaps, detergents, fragrances, fabrics (wool), sweat, food (in some), stress, climate.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Skin infection — secondary bacterial (S. aureus), viral (eczema herpeticum from HSV — emergency), fungal.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Adherence to skin-care routine.", citationIDs: ["openrn_ms_round4"])
        ],
        commonInterventions: [
            AttributedBullet("MOISTURIZE — at least once daily, especially within 3 minutes of bathing ('soak and seal'). Thick, fragrance-free emollients (Cerave, Cetaphil, Aquaphor, plain petrolatum).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("LUKEWARM short baths/showers (5–10 min); pat dry; apply moisturizer immediately.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("TOPICAL STEROIDS for flares — potency matched to body area (low-potency hydrocortisone 1% for face/groin; medium-high for trunk/extremities); apply to active lesions BID × 2–4 weeks. Long-term high-potency on face causes atrophy.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Topical calcineurin inhibitors (tacrolimus, pimecrolimus) — steroid-sparing; OK on face, eyelids; black box warning for theoretical lymphoma risk (controversial).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Crisaborole, ruxolitinib (newer topicals).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Dilute bleach baths (1/4 cup household bleach in full tub) twice weekly — reduces S. aureus colonization, improves disease.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Antihistamines — limited benefit for itch (sedating ones may help sleep).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("SEVERE / refractory: phototherapy, dupilumab (IL-4/13 monoclonal — highly effective), JAK inhibitors (upadacitinib, abrocitinib, baricitinib), cyclosporine.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Trigger avoidance — fragrance-free products, soft cotton clothing, no wool, avoid extreme temperatures.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Treat infection — topical/oral antibiotic for impetiginized eczema; SYSTEMIC ACYCLOVIR for eczema herpeticum (emergency).", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Patient education — chronic disease, itch–scratch cycle, daily routine adherence.", citationIDs: ["openrn_ms_round4"])
        ],
        watchFor: [
            AttributedBullet("ECZEMA HERPETICUM — HSV superinfection of eczema; vesicles in clusters, fever, malaise; medical emergency; IV/oral acyclovir; can disseminate.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Bacterial superinfection (impetiginization) — yellow crusts; topical/oral antibiotics.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Steroid atrophy with prolonged high-potency use on face; striae.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Topical steroid withdrawal / 'red skin syndrome' — controversial; flares after stopping.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Sleep, school, work impact — quality of life heavily affected; mood disorders common.", citationIDs: ["openrn_ms_round4"]),
            AttributedBullet("Atopic march — eczema infants at higher risk for asthma, allergic rhinitis, food allergies.", citationIDs: ["openrn_ms_round4"])
        ],
        citations: [openrnMSr4, openstaxMSr4],
        lastSourceFidelityReview: "2026-05-04"
    )
}
