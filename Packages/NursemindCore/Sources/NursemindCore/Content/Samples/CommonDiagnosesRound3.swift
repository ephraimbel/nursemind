import Foundation

// Curator-model diagnosis entries (round 3 expansion — common ED/floor presentations).
// Sources: Open RN Med-Surg / Health Alterations (CC BY 4.0), CDC (public domain),
// IDSA / ACR / GOLD / GINA / KDIGO / AAN / NHLBI concept citations.

private let openrnMS3 = CitationSource(
    id: "openrn_ms_round3",
    shortName: "Open RN Health Alterations / Medical-Surgical Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=common+diagnoses+pathophysiology",
    lastRetrieved: "2026-05-04"
)
private let openstaxMS3 = CitationSource(
    id: "openstax_ms_round3",
    shortName: "OpenStax Medical-Surgical Nursing",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/medical-surgical-nursing",
    lastRetrieved: "2026-05-04"
)
private let cdcDx3 = CitationSource(
    id: "cdc_dx_round3",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let idsaConcept = CitationSource(
    id: "idsa_round3",
    shortName: "IDSA practice guidelines (concept citation)",
    publisher: "Infectious Diseases Society of America",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/practice-guideline/",
    lastRetrieved: "2026-05-04"
)
private let acrConcept = CitationSource(
    id: "acr_round3",
    shortName: "ACR rheumatology guidelines (concept citation)",
    publisher: "American College of Rheumatology",
    license: .factCitationOnly,
    url: "https://www.rheumatology.org/Practice-Quality/Clinical-Support/Clinical-Practice-Guidelines",
    lastRetrieved: "2026-05-04"
)

private let gas = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let infectionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let perfusionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let painTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort)

// MARK: - Diverticulitis

public enum DiverticulitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "diverticulitis",
        title: "Diverticulitis",
        subtitle: "Inflamed colonic diverticula · LLQ pain + fever · Hinchey staging",
        nclexTags: infectionTags,
        definition: AttributedProse(
            "Inflammation/infection of one or more colonic diverticula (most commonly sigmoid). Spectrum from uncomplicated (locally inflamed) to complicated (abscess, perforation, fistula, obstruction). Common in adults >50; rising in younger patients.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Chronically increased intraluminal pressure → mucosal herniation through colonic wall (diverticulosis). Stool impaction or local irritation → micro-perforation → inflammation/infection of and around the diverticulum.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Persistent left lower quadrant pain (RLQ in Asian populations where right-sided is more common).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Low-grade fever, leukocytosis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Change in bowel habits, nausea, anorexia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Tender LLQ on exam; possible mass.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("COMPLICATED: high fever, peritoneal signs (rebound, guarding), urinary symptoms (colovesical fistula → pneumaturia, fecaluria), obstruction (vomiting, distention).", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT abdomen/pelvis with contrast — gold standard; identifies inflammation, abscess, perforation, fistula. Hinchey staging (I–IV) by CT findings.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CBC (leukocytosis), CMP, lactate (if severe), urinalysis (rule out fistula or UTI).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Avoid colonoscopy in acute attack — perforation risk; arrange 6 weeks after resolution.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain pattern, severity, peritoneal signs.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Vital signs — sepsis criteria.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hydration, urine output.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Recurrence history (prior episodes affect surgical decisions).", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("UNCOMPLICATED, MILD (selected outpatient): clear liquids advancing as tolerated; oral antibiotics in some cases (recent evidence: many uncomplicated cases do not require antibiotics — observation acceptable).", citationIDs: ["idsa_round3"]),
            AttributedBullet("MODERATE/SEVERE: hospitalize, NPO or clear liquids, IV fluids, IV broad-spectrum antibiotics covering gram-negatives + anaerobes (e.g., piperacillin-tazobactam, ceftriaxone + metronidazole).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("ABSCESS: percutaneous drainage if >3–4 cm; antibiotics; interval colonoscopy; possible elective surgery.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PERFORATION / PERITONITIS: emergent surgery (Hartmann procedure or primary anastomosis with diversion).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pain control — opioids historically; some sources caution opioids increase perforation risk (favor acetaminophen-based regimens).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Long-term: high-fiber diet to PREVENT recurrence (no longer required to avoid nuts/seeds — that recommendation is debunked).", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("Perforation with peritonitis — surgical emergency.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Abscess — percutaneous drainage.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Fistula — colovesical (pneumaturia, recurrent UTI), colovaginal, coloenteric.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Obstruction.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Recurrent disease — elective sigmoidectomy after 2+ episodes per individual factors.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, idsaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pyelonephritis

public enum PyelonephritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pyelonephritis",
        title: "Pyelonephritis",
        subtitle: "Upper UTI · fever + flank pain + UTI symptoms",
        nclexTags: infectionTags,
        definition: AttributedProse(
            "Bacterial infection of the renal parenchyma and pelvis, typically ascending from a lower UTI. Severity ranges from mild (oral antibiotics outpatient) to severe (sepsis, perinephric abscess, emphysematous pyelonephritis in diabetics).",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Most common pathogen E. coli. Ascending infection from lower urinary tract → renal pelvis and parenchyma. Risk factors: female anatomy, sexual activity, structural abnormality (stones, reflux, BPH), diabetes, immunosuppression, pregnancy, foley catheter.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("UTI symptoms — dysuria, frequency, urgency.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("FLANK PAIN, costovertebral angle (CVA) tenderness.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Fever, chills, rigors.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Nausea, vomiting.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Sepsis criteria possible — tachycardia, hypotension, AMS in elderly.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnant patients — high risk; urgent treatment; pre-term labor risk.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical (UTI symptoms + fever / flank pain) + UA (pyuria, bacteriuria, possible WBC casts).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Urine culture and sensitivities — obtain before antibiotics.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Blood cultures if septic, immunocompromised, severe disease.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Imaging (CT or US) for: severe disease, no improvement at 48–72 hr, suspected obstruction or stone, recurrent.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — sepsis screen.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CVA tenderness, pain severity.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hydration, urine output.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnancy testing.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Obstructive workup if no improvement.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("MILD outpatient (low-risk, can tolerate PO): oral fluoroquinolone (cipro/levo) × 7 days OR Bactrim × 14 days OR cefpodoxime × 10–14 days, per local resistance.", citationIDs: ["idsa_round3"]),
            AttributedBullet("MODERATE/SEVERE inpatient: IV ceftriaxone or piperacillin-tazobactam; add vancomycin if at risk for MRSA. Switch to oral once afebrile and improving.", citationIDs: ["idsa_round3"]),
            AttributedBullet("Pregnancy: hospitalize; IV β-lactam (ceftriaxone, ampicillin/sulbactam); avoid fluoroquinolones and Bactrim near term.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Sepsis / shock: full sepsis bundle (lactate, cultures, antibiotics within 1 hr, IV fluids, vasopressors).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hydration, antipyretic, antiemetic.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Address obstruction urgently — relieve via stenting or nephrostomy.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("Urosepsis / septic shock — leading cause of mortality.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Obstruction with infection — surgical/IR emergency; antibiotics alone insufficient.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Perinephric abscess — failure to improve at 48–72 hr; imaging.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Emphysematous pyelonephritis (diabetics) — necrotizing infection with gas in tissues; surgical emergency.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnancy — preterm labor.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Chronic / recurrent — workup for structural disease (reflux, stones).", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, idsaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Influenza

public enum InfluenzaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "influenza",
        title: "Influenza",
        subtitle: "Seasonal A/B viral · vaccine + early oseltamivir for at-risk",
        nclexTags: gas,
        definition: AttributedProse(
            "Acute respiratory infection caused by influenza A or B viruses; seasonal epidemic late fall–early spring. Most cases self-limited; severe disease in elderly, pregnant, very young, immunocompromised, and chronic disease patients. Leading cause of preventable acute-illness hospitalization; antiviral benefit greatest within 48 hours of onset.",
            citationIDs: ["openrn_ms_round3", "cdc_dx_round3"]
        ),
        pathophysiology: AttributedProse(
            "Influenza virus invades respiratory epithelium → cytokine response → systemic and respiratory symptoms. Annual antigenic drift (vaccine update); periodic antigenic shift (pandemic risk). Secondary bacterial pneumonia (S. pneumoniae, S. aureus, MRSA) is the leading cause of mortality.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("ABRUPT onset — fever (often >38.5°C), chills, myalgia, malaise, headache.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Respiratory — non-productive cough (early), sore throat, rhinorrhea.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Children may have GI symptoms; elderly may present atypically (AMS, decompensated chronic disease).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Symptoms typically last 5–7 days (cough lingers).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Severe: pneumonia, ARDS, myocarditis, encephalitis.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis during peak season often sufficient.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Rapid molecular (RT-PCR or rapid antigen) for hospitalized, immunocompromised, severe disease, infection control purposes.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("CXR if pneumonia suspected.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, SpO2, work of breathing.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Risk factors for complications: ≥65, <2, pregnant, immunocompromised, asthma/COPD, heart disease, obesity, diabetes, dialysis.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Hydration, mental status.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Bacterial superinfection signs — biphasic illness, focal lung findings, productive sputum, recrudescent fever.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("DROPLET PRECAUTIONS in healthcare facilities until 24 hr afebrile + improving + 7 days from symptom onset.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Antiviral — OSELTAMIVIR (Tamiflu) 75 mg PO BID × 5 days; baloxavir is single-dose alternative; start within 48 hours of onset for best benefit. Treat ALL hospitalized and high-risk regardless of timing.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Supportive — antipyretics (NOT aspirin in <19 yr — Reye), hydration, rest.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Treat secondary bacterial pneumonia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PREVENTION: annual flu vaccine for all ≥6 months (very few contraindications).", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Post-exposure chemoprophylaxis with oseltamivir for select high-risk unvaccinated contacts.", citationIDs: ["cdc_dx_round3"])
        ],
        watchFor: [
            AttributedBullet("Pneumonia (primary viral OR secondary bacterial — leading complication).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Decompensation of chronic conditions (CHF, COPD, DM).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Myocarditis (particularly in young patients).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Encephalopathy / Reye syndrome — never give aspirin to children with viral illness.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("In pregnancy — high risk for severe disease; treat aggressively.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Healthcare worker fitness for duty — PCR + 24 hr afebrile criteria.", citationIDs: ["cdc_dx_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, cdcDx3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - COVID-19

public enum COVIDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "covid-19",
        title: "COVID-19",
        subtitle: "SARS-CoV-2 · spectrum from mild to ARDS · vaccinate; treat early in at-risk",
        nclexTags: gas,
        definition: AttributedProse(
            "Disease caused by SARS-CoV-2 coronavirus. Spectrum from asymptomatic to severe ARDS, multi-organ failure, and death. Long-COVID (PASC) affects subset post-acute. Highly variable clinical course; older age, obesity, immunocompromise, chronic disease, and unvaccinated status are major risk factors for severe disease.",
            citationIDs: ["openrn_ms_round3", "cdc_dx_round3"]
        ),
        pathophysiology: AttributedProse(
            "SARS-CoV-2 enters cells via ACE2 receptor (lung, heart, GI, vascular endothelium) → cytokine response. Severe disease involves dysregulated inflammation, microvascular thrombosis, and ARDS. Multiple variants of concern have shifted transmissibility, vaccine evasion, and severity.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Variable: fever, cough, fatigue, myalgia, headache, sore throat, anosmia/ageusia (less common with newer variants), GI symptoms, congestion.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Severe disease — dyspnea, hypoxia (often disproportionate to symptoms — 'happy hypoxia'), ARDS.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Thromboembolic — PE, stroke, MI; markedly elevated D-dimer.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("MIS-C in pediatric patients (rare; weeks post-infection).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Long COVID (PASC) — fatigue, dyspnea, brain fog, palpitations, autonomic dysfunction lasting weeks–months.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("RT-PCR or rapid antigen testing — PCR more sensitive but rapid antigen widely used.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Hospitalized: CBC (lymphopenia), CMP, LDH, D-dimer (often markedly elevated), CRP, ferritin, troponin (myocarditis risk), CXR, possibly CT chest.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Severity classification (NIH): asymptomatic, mild, moderate (clinical evidence of LRTI, SpO₂ ≥94%), severe (SpO₂ <94%, RR >30, PaO₂/FiO₂ <300), critical (respiratory failure, septic shock, MOF).", citationIDs: ["cdc_dx_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs continuous in moderate-severe; SpO₂ trend particularly.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Risk stratification — vaccination status, age, comorbidities, immunocompromise.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("VTE risk — active surveillance.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Mental status, ability to manage at home.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Isolation and exposure tracing per facility / public health.", citationIDs: ["cdc_dx_round3"])
        ],
        commonInterventions: [
            AttributedBullet("AIRBORNE + CONTACT precautions in healthcare facilities; N95 for aerosol-generating procedures.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("OUTPATIENT high-risk: PAXLOVID (nirmatrelvir-ritonavir) within 5 days of symptoms — most effective; many drug interactions. Remdesivir as IV alternative.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("HOSPITALIZED, hypoxic: dexamethasone 6 mg daily × up to 10 days (RECOVERY trial — mortality reduction).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Severe/critical: dexamethasone + remdesivir (early); add baricitinib or tocilizumab for rapid escalation; mechanical ventilation with lung-protective settings; prone positioning.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Anticoagulation — prophylactic for hospitalized; therapeutic in select moderate disease.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("VACCINATION — annual COVID booster recommended for ≥6 months, especially immunocompromised and elderly.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Long COVID — multidisciplinary supportive care; symptom-targeted therapy.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("Rapid decompensation — silent hypoxia, then crash; serial SpO2 critical.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Thromboembolism — PE, stroke, MI; elevated D-dimer trigger imaging in deteriorating patient.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Myocarditis — chest pain, troponin rise; cardiology consult.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Secondary bacterial / fungal pneumonia (especially with prolonged steroids).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Long COVID — disabling fatigue, cognitive impairment, dysautonomia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Drug interactions with Paxlovid — ritonavir is potent CYP3A4 inhibitor; review all meds.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, cdcDx3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Rheumatoid Arthritis

public enum RheumatoidArthritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "rheumatoid-arthritis",
        title: "Rheumatoid Arthritis (RA)",
        subtitle: "Symmetric inflammatory polyarthritis · DMARD therapy",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .mobility),
        definition: AttributedProse(
            "Chronic systemic autoimmune disease primarily affecting synovial joints — symmetric inflammatory polyarthritis with joint destruction and extra-articular manifestations. ACR criteria-based diagnosis; early aggressive DMARD therapy markedly reduces disability.",
            citationIDs: ["openrn_ms_round3", "acr_round3"]
        ),
        pathophysiology: AttributedProse(
            "Genetic susceptibility (HLA-DR4) + environmental triggers → synovial inflammation, pannus formation, cartilage and bone destruction. Anti-CCP antibodies present years before clinical disease in most patients.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Symmetric polyarthritis affecting MCP, PIP, MTP, wrists, knees (NOT DIPs typically — distinguishes from osteoarthritis).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Morning stiffness >1 hour (vs OA <30 min).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Joint swelling, warmth, tenderness; classic deformities — ulnar deviation, swan neck, boutonnière, Z-thumb.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Constitutional — fatigue, low-grade fever, weight loss.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Extra-articular: rheumatoid nodules, dry eyes/mouth (Sjögren's), pleuritis, pericarditis, scleritis, vasculitis (rare), Felty's (RA + splenomegaly + neutropenia), atlantoaxial subluxation (intubation risk).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Increased cardiovascular and infection mortality.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACR/EULAR 2010 criteria — joint involvement, serology (RF, anti-CCP), acute-phase reactants (CRP/ESR), symptom duration (≥6 weeks); score ≥6 = definite RA.", citationIDs: ["acr_round3"]),
            AttributedBullet("Anti-CCP — most specific (~95%); RF (~70% sensitivity, less specific).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("X-ray — early may be normal; later marginal erosions, joint space narrowing, periarticular osteopenia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("MRI / US more sensitive for early synovitis.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Joint count (tender + swollen), DAS28 or other activity score.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Functional status (HAQ-DI), pain, mobility.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cardiovascular risk (RA is independent CV risk factor).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Infection screening before biologic initiation — TB (IGRA), HBV, HCV.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Atlantoaxial subluxation — pre-op or pre-intubation neck imaging if longstanding RA.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("METHOTREXATE — first-line DMARD; weekly dosing with folic acid; treat-to-target.", citationIDs: ["acr_round3"]),
            AttributedBullet("Hydroxychloroquine, sulfasalazine — alternative or combination.", citationIDs: ["acr_round3"]),
            AttributedBullet("Biologics — TNF inhibitors (etanercept, adalimumab, infliximab), IL-6 (tocilizumab), JAK inhibitors (tofacitinib), B-cell (rituximab) — for inadequate response.", citationIDs: ["acr_round3"]),
            AttributedBullet("BRIDGE THERAPY: NSAIDs + low-dose corticosteroids (e.g., prednisone 5–10 mg) until DMARD takes effect; minimize steroid duration.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PT/OT, occupational adaptations, joint protection.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cardiovascular risk reduction — statin, BP control, smoking cessation.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Infection screening + non-live vaccines before/with biologics.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Joint replacement / surgery for refractory damage.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("DMARD toxicity — methotrexate hepatotoxicity, marrow suppression, pneumonitis; biologic infections.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Increased infection risk with biologics — TB reactivation.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cardiovascular events — accelerated atherosclerosis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Atlantoaxial subluxation — caution with intubation/manipulation.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Lymphoma slightly increased.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnancy — many DMARDs teratogenic; pre-conception counseling.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, acrConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Gout

public enum GoutSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "gout",
        title: "Gout",
        subtitle: "Monosodium urate crystal arthropathy · podagra · uricosurics + ULT",
        nclexTags: painTags,
        definition: AttributedProse(
            "Inflammatory arthritis caused by deposition of monosodium urate (MSU) crystals in joints and soft tissues, driven by chronic hyperuricemia. Most common inflammatory arthritis in men; rising in postmenopausal women.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Hyperuricemia from urate overproduction (purine-rich foods, alcohol, fructose, cell turnover) or under-excretion (renal insufficiency, diuretics, low-dose aspirin). Crystal precipitation in joints/soft tissue → neutrophil-driven inflammatory response → acute attacks and, over time, tophi and erosive arthritis.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("ACUTE attack — sudden severe pain, swelling, redness, warmth in single joint; first MTP (PODAGRA) classic.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Often nocturnal onset; peak severity 12–24 hours; resolves over 1–2 weeks if untreated.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Triggers — alcohol (especially beer), purine-rich meals, dehydration, surgery, illness, starting/stopping ULT.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Chronic tophaceous gout — visible tophi (helix of ear, fingers, Achilles, MTPs), polyarticular involvement, joint erosion.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Renal — uric acid kidney stones; uric acid nephropathy.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("GOLD STANDARD: arthrocentesis with MSU crystal identification under polarized microscopy (negatively birefringent needle-shaped).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Clinical diagnosis often acceptable when classic (podagra in middle-aged man with hyperuricemia).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Serum uric acid — supportive but can be normal during acute attack.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Differential — septic arthritis (must exclude in any monoarthritis with fever/elevated WBC), pseudogout (CPPD crystals — positively birefringent rhomboid), cellulitis.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain, mobility, joint involvement.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Fever / signs concerning for septic joint — arthrocentesis MUST be done before treating.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Triggers identification — diet, medications (thiazides, low-dose aspirin), alcohol, recent surgery.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CKD assessment — affects medication choice.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cardiovascular risk — gout is independent risk factor.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE ATTACK: NSAIDs (ibuprofen 800 mg TID, naproxen 500 mg BID, indomethacin) — first-line if no contraindication. Colchicine 1.2 mg PO then 0.6 mg in 1 hour, then 0.6 mg BID daily. Corticosteroid (prednisone 30–40 mg taper × 5–10 days) when NSAIDs/colchicine contraindicated. Intra-articular steroid for 1–2 joints.", citationIDs: ["acr_round3"]),
            AttributedBullet("Do NOT start ULT during acute attack (worsens). Continue ULT if patient already on it.", citationIDs: ["acr_round3"]),
            AttributedBullet("URATE-LOWERING THERAPY (ULT) — start 2–4 weeks after acute attack resolves (or sooner if frequent attacks/tophi/CKD): allopurinol first-line; titrate to serum urate <6 mg/dL (<5 with tophi).", citationIDs: ["acr_round3"]),
            AttributedBullet("Concomitant prophylaxis when starting ULT — colchicine 0.6 mg daily or low-dose NSAID × 3–6 months to prevent flare.", citationIDs: ["acr_round3"]),
            AttributedBullet("Febuxostat — alternative; cardiac concerns in some studies.", citationIDs: ["acr_round3"]),
            AttributedBullet("Probenecid — uricosuric (avoid if CKD, kidney stones).", citationIDs: ["acr_round3"]),
            AttributedBullet("Dietary — limit purine-rich (red meat, organ meat, shellfish), high-fructose drinks, alcohol (especially beer); encourage water, dairy.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Address triggers — switch from thiazide if appropriate, manage CV risk.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("SEPTIC ARTHRITIS in any acute monoarthritis — joint aspiration is essential; missed septic joint destroys cartilage in hours.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("ALLOPURINOL HYPERSENSITIVITY (SCAR) — particularly HLA-B*5801 carriers (Asian, African); SJS/TEN possible.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Tumor lysis syndrome (rare in gout patients on chemo).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Renal — uric acid stones, uric acid nephropathy; address hydration and ULT.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CKD — colchicine and NSAIDs need caution.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Tophi — joint destruction and disfigurement if undertreated.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, acrConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Migraine

public enum MigraineSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "migraine",
        title: "Migraine",
        subtitle: "Recurrent disabling primary headache · acute + preventive treatment",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        definition: AttributedProse(
            "Primary recurrent headache disorder characterized by attacks of moderate-severe pulsating pain, often unilateral, with associated nausea/vomiting and/or photophobia/phonophobia. With or without aura. Major source of disability; lifetime prevalence ~12% (women >> men).",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Trigeminovascular system activation; cortical spreading depression (aura). CGRP (calcitonin gene-related peptide) is central; new monoclonal therapies target it. Hereditary component.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Headache 4–72 hours with at least 2 of: unilateral, pulsating, moderate-severe intensity, aggravated by physical activity.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Plus at least one of: nausea/vomiting, photophobia/phonophobia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Phases: prodrome (irritability, food cravings, yawning, neck stiffness — hours-days before), aura (visual scintillations, scotomata, paresthesias — minutes), headache, postdrome (fatigue, mental fog).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Common triggers: stress, hormonal (menstrual), sleep changes, certain foods (aged cheeses, tyramine, MSG, alcohol), missed meals, weather, scents.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical (ICHD-3 criteria); imaging only for red flags (SNOOP — Systemic symptoms / Neurologic deficits / Onset sudden / Older >50 / Pattern change).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Headache diary helpful for pattern recognition and treatment response.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Red flags suggesting secondary cause (SAH, meningitis, mass, GCA) — sudden severe, fever, neurologic deficit, age >50 new onset, papilledema.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Frequency, duration, disability — informs treatment intensity.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Trigger identification.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Medication overuse — analgesic-rebound headache.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hormonal context — menstrual migraine, pregnancy, contraception.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE: Mild — NSAIDs (ibuprofen, naproxen), acetaminophen, combination analgesics. Moderate-severe — TRIPTAN (sumatriptan, rizatriptan) at first sign. Newer: gepants (rimegepant, ubrogepant — CGRP antagonists), ditans (lasmiditan).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Antiemetic adjunct — metoclopramide, prochlorperazine.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("AVOID OPIOIDS — worsen migraine course, dependence; not first-line.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("AVOID triptan in: ischemic heart disease, uncontrolled HTN, stroke, hemiplegic/basilar migraine, pregnancy, recent MAOI.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PREVENTIVE (≥4 attacks/month or significant disability): β-blockers (propranolol, metoprolol), topiramate, amitriptyline, anti-CGRP monoclonals (erenumab, fremanezumab, galcanezumab — monthly injections), botulinum toxin A (chronic migraine).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Lifestyle — sleep hygiene, hydration, regular meals, stress management, exercise, trigger avoidance.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("Status migrainosus — attack >72 hours; ED-level treatment.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Medication overuse headache — ≥10 days/month of triptans/opioids OR ≥15 days/month of simple analgesics; treat by withdrawing offending agent.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Migrainous infarction — rare; aura with persistent neurologic deficit + imaging-confirmed stroke.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnancy — many drugs contraindicated; acetaminophen first-line; magnesium and metoclopramide have been used.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Atypical features — workup for secondary cause.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Concussion / Mild TBI

public enum ConcussionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "concussion",
        title: "Concussion (Mild TBI)",
        subtitle: "Closed brain injury with transient neurologic dysfunction · graded return to activity",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
        definition: AttributedProse(
            "Traumatic brain injury induced by biomechanical forces (direct blow OR transmitted force) causing transient neurologic dysfunction. By definition, normal structural neuroimaging when obtained. Graded clinically; recovery typically days–weeks.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Diffuse axonal injury at the cellular level; transient neurometabolic crisis (potassium efflux, glutamate release, glucose metabolism dysregulation). Repeat injury during the symptomatic period markedly increases severity (second-impact syndrome).",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("LOC (not required), confusion, disorientation, amnesia (peri-traumatic).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Headache, nausea/vomiting, dizziness, balance problems, photophobia, phonophobia, blurred vision.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cognitive — slowed processing, difficulty concentrating, memory issues.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Emotional — irritability, sadness, emotional lability.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Sleep — insomnia or hypersomnia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Symptoms typically peak 24–72 hours, resolve within 7–14 days (~80%); persistent post-concussive in 10–20%.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — biomechanical force + acute neurologic dysfunction; structural imaging normal when performed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Clinical decision rules (Canadian CT Head Rule, New Orleans) determine need for CT to rule out traumatic intracranial injury.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Sport-specific tools — SCAT-5 / Child SCAT-5; baseline testing helpful.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("GCS, focal deficits, pupillary exam, mental status.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Indications for CT: GCS <15 at 2 hr, vomiting >2 episodes, age ≥65, suspected basilar skull fracture, dangerous mechanism, retrograde amnesia >30 min.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Anticoagulation history — much lower threshold for imaging.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cervical spine — coexisting injury common; clear before mobilization.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("RELATIVE REST 24–48 hours — limit cognitive and physical exertion that worsens symptoms; not strict bed rest.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("GRADED RETURN TO ACTIVITY (sport / school) — progress through stages only when asymptomatic at each step; specific protocols (CDC HEADS UP, SCAT).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Symptom-targeted: acetaminophen (avoid NSAIDs/aspirin first 24–48 hr per some protocols, though debated), antiemetics, sleep hygiene.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("AVOID alcohol, sedatives, second concussion risk activities until cleared.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Driving restriction until cognitively cleared.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("School/work accommodations — gradual academic return, reduced screen time initially.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Specialist referral if symptoms persist >2–4 weeks (post-concussive), recurrent, or worsening.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("DELAYED INTRACRANIAL HEMORRHAGE (especially elderly or anticoagulated) — return for severe headache, repeated vomiting, worsening confusion, focal deficit.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("SECOND-IMPACT SYNDROME — second concussion before first resolves; rare but devastating cerebral edema; absolute reason for graded return.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Post-concussive syndrome — symptoms >3 months; refer for multidisciplinary care.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CTE (chronic traumatic encephalopathy) — repetitive head injury exposure (athletes, military); long-term risk.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pediatric — recovery slower; conservative protocols; school accommodations.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Mood disorders post-concussion — depression and anxiety common; screen.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, cdcDx3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Iron Deficiency Anemia

public enum IronDeficiencyAnemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "iron-deficiency-anemia",
        title: "Iron Deficiency Anemia",
        subtitle: "Most common anemia worldwide · investigate the cause",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Anemia (low Hgb) due to insufficient iron for hemoglobin production. Most common cause of anemia worldwide and in the US. Always investigate the underlying cause — in adult men and post-menopausal women, occult GI blood loss (including malignancy) until proven otherwise.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Causes: (1) blood loss — menstrual, GI (peptic, malignancy, AVMs, IBD), surgery, repeated phlebotomy; (2) malabsorption — celiac, gastric bypass, atrophic gastritis, PPI use; (3) inadequate intake — vegan, malnutrition; (4) increased demand — pregnancy, lactation, growth.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Fatigue, dyspnea on exertion, palpitations, headache.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pallor — conjunctival and palmar.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pica (ice, dirt, starch — pagophagia common), restless legs.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Glossitis, angular cheilitis, koilonychia (spoon nails — rare/late).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Asymptomatic in many; discovered incidentally.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pediatric — irritability, developmental delay, increased risk lead poisoning.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CBC: low Hgb, low MCV (microcytic), low MCH (hypochromic), elevated RDW.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Iron studies: LOW ferritin (<30 ng/mL definitive; <15 absolute), LOW serum iron, HIGH TIBC, LOW transferrin saturation (<20%).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Reticulocyte count low or inappropriately normal.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Differential of microcytic anemia — thalassemia (normal/elevated ferritin), anemia of chronic disease (low TIBC), sideroblastic anemia.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Detailed history — menstrual losses, GI symptoms, hematochezia/melena, dietary, prior surgery (gastric bypass), medications (PPI, ASA/NSAIDs).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Stool occult blood (FIT test) — multiple samples.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Functional status — symptoms with daily activities; transfusion threshold.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnancy testing in patients of childbearing potential.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("INVESTIGATE THE CAUSE — colonoscopy + EGD in adult men and post-menopausal women; gynecologic workup for pre-menopausal women with menorrhagia; celiac testing in selected.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("ORAL IRON: ferrous sulfate 325 mg PO daily or every-other-day (recent evidence — equal absorption, less GI upset). Take with vitamin C; avoid coffee/tea/calcium within 1–2 hr.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Counsel: dark/black stools (harmless), constipation common, takes 2–4 weeks for retic increase, 6+ weeks for Hgb response, 3–6 MONTHS to replenish iron stores.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("IV IRON when oral fails (intolerance, malabsorption, ongoing loss exceeding oral, CKD, post-bariatric, pregnancy 2nd-3rd trimester, severe disease): iron sucrose, ferric gluconate, ferric carboxymaltose, ferumoxytol per facility.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Transfusion only for symptomatic / severe (Hgb <7 or hemodynamic instability).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Treat underlying cause — H. pylori (some), celiac diet, surgical of GI lesion.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("UNDIAGNOSED MALIGNANCY — IDA in an adult man or post-menopausal woman is COLON CANCER until proven otherwise; do not just treat with iron.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("IV iron infusion reactions — anaphylaxis (rare), hypotension, flushing; resuscitation equipment available.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cardiovascular decompensation in severe anemia, especially with cardiac comorbidity.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Recurrent IDA without identified cause — persistent occult bleed, malabsorption, hemolysis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pediatric — long-term cognitive effects of chronic deficiency.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Heparin-Induced Thrombocytopenia (HIT)

public enum HITSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hit",
        title: "Heparin-Induced Thrombocytopenia (HIT)",
        subtitle: "Immune-mediated · paradoxical thrombosis · STOP heparin, switch to non-heparin anticoag",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .clottingHemostasis),
        definition: AttributedProse(
            "Immune-mediated reaction to heparin in which IgG antibodies form against heparin-platelet factor 4 (PF4) complexes, activating platelets → thrombocytopenia AND PARADOXICAL THROMBOSIS (arterial and venous). Type II HIT is the dangerous form (immune); Type I is benign non-immune mild platelet drop.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "IgG antibody to heparin-PF4 complex → cross-links FcγRIIa receptors on platelets → platelet activation, aggregation, and consumption. Activated platelets generate microparticles and thrombin → prothrombotic state. Affects both UFH and LMWH (lower with LMWH); cross-reacts with fondaparinux less commonly.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("PLATELET DROP — typically 5–14 days after heparin start (or earlier if recent prior exposure), >50% drop from baseline OR absolute <150K.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("THROMBOSIS in 30–50% — DVT, PE, MI, stroke, limb ischemia, skin necrosis at injection sites.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Skin lesions — erythematous painful skin necrosis at heparin injection sites.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Anaphylactoid reaction — within 30 minutes of IV heparin bolus in re-exposed patients.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("4Ts SCORE — Thrombocytopenia, Timing, Thrombosis, oTher cause; high score → high pretest probability.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Confirm with anti-PF4/heparin antibody (immunoassay — sensitive but less specific) and serotonin release assay (SRA — gold standard, less available).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Don't wait for confirmation — TREAT EMPIRICALLY based on clinical suspicion (4Ts score intermediate-high).", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Daily platelet trend in any patient on heparin >4 days.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Calculate 4Ts score on suspicion.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Active thrombosis screening — bilateral lower extremity Doppler, head-to-toe exam, line/site exam.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Review heparin exposure — UFH, LMWH, heparin flushes, heparin-coated catheters, heparin in hemodialysis.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("STOP ALL HEPARIN IMMEDIATELY — including flushes, coated lines, dialysis heparin.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("DOCUMENT 'HIT' as allergy — lifelong avoidance of heparin.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("START NON-HEPARIN ANTICOAGULATION (anticoagulation IS required even without confirmed thrombosis to prevent it):", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("ARGATROBAN (direct thrombin inhibitor, IV) — preferred in renal impairment; titrate by aPTT 1.5–3× baseline.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("BIVALIRUDIN (direct thrombin inhibitor, IV) — alternative.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("FONDAPARINUX (off-label but commonly used).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("DO NOT bridge with warfarin alone — initial warfarin causes paradoxical worsening of thrombosis (warfarin-induced skin necrosis, venous limb gangrene); start warfarin only after platelets ≥150K and overlap with non-heparin agent ≥5 days.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("DOACs (rivaroxaban, apixaban) — increasing evidence for use after acute phase.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Avoid platelet transfusion (paradoxical worsening) unless severe bleeding.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Continue therapeutic anticoagulation 3 months if thrombosis, 4 weeks if isolated thrombocytopenia.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("PROGRESSIVE THROMBOSIS despite stopping heparin — initiate non-heparin agent IMMEDIATELY; do not wait.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("WARFARIN-INDUCED SKIN NECROSIS / VENOUS LIMB GANGRENE if starting warfarin too early without protein C protection.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hidden heparin sources — flushes, coated lines, dialysis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("HIT can recur in re-exposure years later — lifelong avoidance.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Limb ischemia / amputation if untreated.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Adrenal hemorrhage — bilateral adrenal vein thrombosis; adrenal crisis.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Neutropenic Fever

public enum NeutropenicFeverSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neutropenic-fever",
        title: "Neutropenic Fever (Febrile Neutropenia)",
        subtitle: "ANC <500 + fever ≥38.3°C · oncology emergency · empiric antibiotics within 1 hour",
        nclexTags: infectionTags,
        definition: AttributedProse(
            "Single oral temperature ≥38.3°C (101°F) OR ≥38.0°C (100.4°F) sustained over 1 hour in a patient with absolute neutrophil count (ANC) <500 cells/mcL OR expected to fall <500 within 48 hours. Oncologic emergency — mortality without prompt empiric antibiotics is high.",
            citationIDs: ["openrn_ms_round3", "idsa_round3"]
        ),
        pathophysiology: AttributedProse(
            "Chemotherapy (especially cytotoxic) suppresses bone marrow → neutropenia 7–14 days post-treatment nadir. Severely neutropenic patients cannot mount inflammatory response — infection signs may be subtle (fever may be the ONLY sign). Bacterial sources include gut translocation, indwelling catheters, mucositis, perirectal infection.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Fever — may be the only sign of serious infection.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Other signs may be ABSENT — no purulence (no neutrophils), minimal erythema, scant mucositis findings.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Rigors — bacteremia (especially with line draws or manipulation).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hypotension / sepsis criteria can develop rapidly.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Mucositis, perirectal pain, line site, skin lesions — all sources warrant exam.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ANC <500 (or <1000 with expected drop). Severity: <100 'profound' = highest risk.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Workup BEFORE first antibiotic dose (do not delay): CBC with differential, CMP, lactate, BLOOD CULTURES (peripheral × 2 plus from each lumen of central line), UA + culture, CXR, viral studies if epidemic season.", citationIDs: ["idsa_round3"]),
            AttributedBullet("MASCC score risk-stratifies (≥21 low-risk = oral outpatient antibiotics in selected; <21 high-risk = hospitalized IV).", citationIDs: ["idsa_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — sepsis screen.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Source examination — perineal/perirectal (do NOT do rectal exam if ANC <500 — bacteremia risk; visual only), oral mucositis, central line site, skin.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Time-stamp fever, blood culture draw, antibiotic administration — door-to-antibiotic <1 hour standard.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("EMPIRIC IV ANTIBIOTICS WITHIN 1 HOUR of fever recognition. Do not wait for cultures.", citationIDs: ["idsa_round3"]),
            AttributedBullet("STANDARD: anti-pseudomonal β-lactam — cefepime, piperacillin-tazobactam, meropenem; OR ceftazidime.", citationIDs: ["idsa_round3"]),
            AttributedBullet("ADD VANCOMYCIN if: hemodynamic instability, suspected catheter infection, skin/soft tissue, MRSA colonization, severe mucositis.", citationIDs: ["idsa_round3"]),
            AttributedBullet("ADD ANTIFUNGAL (caspofungin or voriconazole) if persistent fever >4 days on antibacterial — invasive fungal common with prolonged neutropenia.", citationIDs: ["idsa_round3"]),
            AttributedBullet("REVERSE ISOLATION (protective environment) — single room, no fresh flowers, no raw produce, hand hygiene by all visitors.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("G-CSF (filgrastim) — for high-risk patients or to shorten duration of severe neutropenia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Continue antibiotics until afebrile + ANC recovering >500 + no source identified.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Antifungal/PJP/HSV prophylaxis per oncologic protocol.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("SEPSIS / SEPTIC SHOCK — can decompensate rapidly; full sepsis bundle.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Invasive FUNGAL infection (Aspergillus, Candida) — prolonged neutropenia, persistent fever despite broad-spectrum antibiotics; CT chest/sinuses, beta-D-glucan, galactomannan.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PERIRECTAL infection — DO NOT do digital rectal; visual + culture; surgical eval if abscess.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Typhlitis (neutropenic enterocolitis) — abdominal pain, fever, diarrhea; CT imaging.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CENTRAL LINE infection — may need line removal if persistent positive cultures or specific organisms.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, idsaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tumor Lysis Syndrome

public enum TumorLysisSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tumor-lysis-syndrome",
        title: "Tumor Lysis Syndrome (TLS)",
        subtitle: "Massive cell death · ↑K, ↑PO4, ↑uric acid, ↓Ca · oncologic emergency",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes),
        definition: AttributedProse(
            "Metabolic emergency caused by rapid release of intracellular contents from massive tumor cell death — typically within 12–72 hours of starting cytotoxic therapy in highly proliferative malignancies. Hyperuricemia, hyperphosphatemia, hyperkalemia, secondary hypocalcemia → cardiac arrhythmia, AKI, seizures.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "High-grade hematologic malignancies (Burkitt lymphoma, ALL, AML, advanced NHL, CLL) have rapid cell turnover; cytotoxic therapy causes massive simultaneous lysis → release of intracellular K, PO4, nucleic acids (→ uric acid). Phosphate binds calcium (hypocalcemia + calcium phosphate deposition in tubules) → AKI.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Often initially asymptomatic — labs lead.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hyperkalemia — peaked T waves, arrhythmias.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hyperphosphatemia + hypocalcemia — tetany, perioral numbness, seizures.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hyperuricemia — uric acid nephropathy → AKI; can present with flank pain.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Volume changes, edema (renal injury).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Most commonly within 12–72 hours of chemotherapy initiation; can also occur spontaneously (rare).", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Cairo-Bishop criteria (laboratory): ≥2 of K >6, PO4 >4.5, uric acid >8, Ca <7 (or 25% change from baseline) within 3 days before to 7 days after therapy start.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Clinical TLS: Lab + AKI, arrhythmia, or seizure.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Risk stratification — high-risk (Burkitt, ALL with WBC >100K, advanced NHL with bulky disease and elevated LDH) vs intermediate vs low.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous cardiac monitoring during peak risk window (12–72 hr post-therapy initiation in high-risk).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Q4–6h K, PO4, Ca, uric acid, creatinine, LDH × 24–72 hours after high-risk therapy initiation.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Strict I&O; goal urine output ≥100 mL/hr.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Neuromuscular signs — tetany, Chvostek, Trousseau.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("ECG — peaked T, QT prolongation (hypoCa).", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION (high-risk): aggressive IV hydration (250–500 mL/hr to maintain UOP ≥100 mL/hr) starting 24–48 hours BEFORE therapy.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("ALLOPURINOL (xanthine oxidase inhibitor) — for low-intermediate risk; 300 mg PO daily, start 24–48 hr before therapy.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("RASBURICASE (recombinant urate oxidase) — for high-risk; rapidly converts uric acid to soluble allantoin. AVOID in G6PD deficiency (hemolysis).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Treat hyperkalemia — calcium gluconate (membrane stabilization), insulin/D50 (intracellular shift), kayexalate or patiromer (excretion), dialysis if severe.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Treat hyperphosphatemia — phosphate binders; replace calcium ONLY if symptomatic (phosphate replacement aggravates kidney injury via Ca-PO4 deposition).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("DIALYSIS (HD or CRRT) for severe TLS — refractory hyperK, refractory hyperphosphatemia, anuria, fluid overload.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Avoid alkalinization with bicarbonate — can precipitate calcium phosphate; not recommended.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("Lethal HYPERKALEMIA → arrhythmia → cardiac arrest.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("AKI requiring dialysis — high mortality if not addressed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Symptomatic HYPOCALCEMIA — tetany, seizures, laryngospasm.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Rasburicase contraindicated in G6PD deficiency — screen first in at-risk populations.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Spontaneous TLS (without therapy) — high-WBC leukemia or rapidly proliferative malignancy; rare.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - HIV / AIDS

public enum HIVAIDSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hiv-aids",
        title: "HIV / AIDS",
        subtitle: "Treatable chronic disease · undetectable = untransmittable · early ART for everyone",
        nclexTags: infectionTags,
        definition: AttributedProse(
            "Human Immunodeficiency Virus (HIV) is a retrovirus causing chronic progressive immune dysfunction. Untreated → AIDS (CD4 <200 OR AIDS-defining illness) → opportunistic infections and malignancies. Modern antiretroviral therapy (ART) makes HIV a manageable chronic disease with normal life expectancy when treated early; 'undetectable = untransmittable' (U=U) for sexual transmission.",
            citationIDs: ["openrn_ms_round3", "cdc_dx_round3"]
        ),
        pathophysiology: AttributedProse(
            "HIV (HIV-1 most common in US) infects CD4 T cells, macrophages, dendritic cells via CD4 + co-receptor (CCR5 or CXCR4). Reverse transcribes RNA → DNA → integrates into host genome → ongoing replication. Without treatment, progressive CD4 loss; eventually opportunistic infections.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("ACUTE retroviral syndrome (2–4 weeks post-exposure): fever, lymphadenopathy, sore throat, rash, mucocutaneous ulcers, myalgia — flu/mono-like.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CHRONIC clinical latency — often asymptomatic for years; progressive CD4 decline.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("AIDS — CD4 <200 OR AIDS-defining illness: PJP pneumonia, CMV retinitis, Kaposi sarcoma, cryptococcal meningitis, esophageal candidiasis, MAC, toxoplasmosis, lymphoma.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Constitutional — weight loss, night sweats, chronic fevers, persistent diarrhea, oral thrush.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("4th-generation HIV antigen/antibody combo test (detects ~2 weeks earlier than antibody-only); confirmatory differentiation assay; HIV RNA viral load.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("CD4 count and HIV RNA at diagnosis and follow-up.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Resistance testing to guide ART selection.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Coinfection screening — HBV, HCV, syphilis, gonorrhea, chlamydia, TB.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Adherence to ART — most important factor in outcome.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CD4 count and viral load trends.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Opportunistic infection screening per CD4 (PJP, MAC, toxoplasmosis prophylaxis thresholds).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Mental health, substance use, social support — major adherence factors.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Disclosure / partner notification / pre-exposure prophylaxis (PrEP) for partners.", citationIDs: ["cdc_dx_round3"])
        ],
        commonInterventions: [
            AttributedBullet("ART for ALL persons with HIV regardless of CD4 — early treatment improves outcomes and stops transmission.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Common modern regimens: integrase inhibitor (bictegravir, dolutegravir) + 2 NRTIs (TAF/emtricitabine or 3TC).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Single-tablet regimens (Biktarvy = bictegravir/TAF/FTC) for adherence.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Long-acting injectable (cabotegravir + rilpivirine) every 1–2 months for select adherent virologically-suppressed patients.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Opportunistic infection prophylaxis: TMP-SMX for PJP if CD4 <200; azithromycin for MAC if CD4 <50; TMP-SMX for toxoplasmosis if CD4 <100 + IgG positive.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Vaccinate per immunization guidelines — non-live (pneumococcal, flu, HBV, HPV); live vaccines (MMR, varicella) only if CD4 >200.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PrEP (Truvada or Descovy) for HIV-negative partners and high-risk populations — ~99% effective when adherent.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("PEP (post-exposure prophylaxis) within 72 hours for high-risk exposure × 28 days.", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Treat coinfections (HBV, HCV, STIs).", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("OPPORTUNISTIC INFECTIONS — PJP pneumonia (most common); CMV retinitis; cryptococcal meningitis; MAC; toxoplasmosis; esophageal candidiasis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("IMMUNE RECONSTITUTION INFLAMMATORY SYNDROME (IRIS) — paradoxical worsening or 'unmasking' of latent infection 2–8 weeks after starting ART; treat infection, continue ART.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("MALIGNANCIES — Kaposi sarcoma, lymphoma (NHL, primary CNS), invasive cervical and anal cancer.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cardiovascular disease — accelerated atherosclerosis; CV risk factor management.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Renal — TDF nephrotoxicity (use TAF when possible); HIV-associated nephropathy.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Mental health — depression, substance use, suicide risk; integrated care.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Stigma — confidentiality, non-judgmental approach essential.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, cdcDx3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hepatitis C

public enum HepatitisCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hepatitis-c",
        title: "Hepatitis C",
        subtitle: "Curable with DAAs · screen all adults · cirrhosis + HCC if untreated",
        nclexTags: infectionTags,
        definition: AttributedProse(
            "Bloodborne RNA virus causing chronic liver disease in 75–85% of acutely infected adults. Now CURABLE with 8–12 week course of direct-acting antivirals (DAAs) — sustained virologic response (SVR) >95%. USPSTF + CDC recommend screening all adults at least once.",
            citationIDs: ["openrn_ms_round3", "cdc_dx_round3"]
        ),
        pathophysiology: AttributedProse(
            "Bloodborne transmission — IV drug use (most common), historical transfusion (pre-1992), perinatal, occupational, less commonly sexual. Acute infection often asymptomatic; ~75% become chronically infected; chronic infection can progress over decades to cirrhosis (20–30%), hepatocellular carcinoma, hepatic failure.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("ACUTE — most asymptomatic; 20–30% have mild jaundice, fatigue, anorexia 6–7 weeks after exposure.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CHRONIC — typically asymptomatic for decades; fatigue most common; arthralgias, depression.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Cirrhosis (decompensated) — ascites, varices, encephalopathy, jaundice, coagulopathy.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Extrahepatic — mixed cryoglobulinemia, glomerulonephritis, lichen planus, porphyria cutanea tarda.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HCV antibody (screen) + HCV RNA (confirms active infection — antibody-positive without detectable RNA = past resolved infection).", citationIDs: ["cdc_dx_round3"]),
            AttributedBullet("Genotype (1, 2, 3, 4 most common in US) — guides regimen for some.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("LFTs — variably elevated (AST/ALT often <3× normal in chronic), can be normal.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Liver fibrosis assessment — FibroScan (transient elastography), FIB-4, APRI scores; biopsy rarely needed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Coinfection screening — HIV, HBV.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Risk factor history without judgment — IV drug use (current/past), tattoos in non-sterile settings, transfusion before 1992, occupational exposure.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Liver-disease severity — fibrosis assessment, signs of portal hypertension, decompensation.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Adherence factors for DAA course — housing, mental health, substance use.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Coinfection (HIV, HBV).", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("DAA therapy — sofosbuvir/velpatasvir (Epclusa — pangenotypic, 12 weeks), glecaprevir/pibrentasvir (Mavyret — 8 weeks for treatment-naïve without cirrhosis). >95% SVR.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Treat ALL adults with chronic HCV — no longer require advanced fibrosis as treatment criterion.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Vaccinate against HAV and HBV if not immune.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Avoid alcohol; weight management for fatty liver; control diabetes.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("HCC screening (US ± AFP every 6 months) for cirrhotic patients — even after cure.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Harm reduction for active IV drug use — clean syringes, MOUD; treatment of HCV is effective concurrent with active substance use.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("HBV REACTIVATION RISK during DAA — screen for HBV before; monitor or pre-treat.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Confirm SVR (cure) at 12 weeks post-treatment — undetectable HCV RNA.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("Decompensated cirrhosis — variceal bleed, hepatic encephalopathy, ascites, SBP, HRS; transplant evaluation.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hepatocellular carcinoma — risk persists post-cure in cirrhotic patients; lifelong screening.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("HBV reactivation during DAA — screen for HBV first.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Drug interactions with DAAs — amiodarone (with sofosbuvir) bradycardia; many CYP interactions; review carefully.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Reinfection — possible after cure; counsel harm reduction.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, cdcDx3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Renal Calculi (Kidney Stones)

public enum RenalCalculiSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "renal-calculi",
        title: "Renal Calculi (Kidney Stones)",
        subtitle: "Severe colicky flank pain · hematuria · stone passage vs intervention",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        definition: AttributedProse(
            "Crystalline concretions in the urinary tract. ~80% calcium oxalate; others include calcium phosphate, uric acid, struvite (infection-related), cystine. Lifetime prevalence ~10%; recurrence high.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Supersaturation of urine with stone-forming substances + low urine volume + dietary/genetic factors → crystal formation → growth → migration. Risk factors: dehydration, high-sodium/animal-protein/oxalate intake, hyperparathyroidism, gout, IBD, gastric bypass, certain medications.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("RENAL COLIC — sudden severe colicky pain, often described as 'worst ever'; flank → groin/testicle/labia (depending on stone location).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Patient often restless/writhing (in contrast to peritonitis where patient lies still).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Nausea, vomiting (common).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hematuria (gross or microscopic).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Dysuria, urgency, frequency if stone in bladder/distal ureter.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Fever / sepsis if obstruction + infection — urgent intervention.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Non-contrast CT abdomen/pelvis (low-dose protocols available) — gold standard; identifies stones, size, location, hydronephrosis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Ultrasound — pregnancy, follow-up; identifies hydronephrosis but stones often missed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("UA — hematuria, possible pyuria; pH suggests stone type (acidic = uric acid; alkaline = struvite or calcium phosphate).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("BMP, calcium, phosphate, uric acid; PTH if recurrent.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Strain urine to capture passed stone for analysis.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain (typically very severe), nausea, hydration.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Sepsis screen — obstruction + infection is a urologic emergency.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Renal function — bilateral obstruction or solitary kidney.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnancy testing.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("PAIN — IV ketorolac 30 mg (NSAIDs effective; consider renal status); opioid (morphine, hydromorphone) if NSAID inadequate or contraindicated.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Antiemetic.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("IV fluids — hydration to encourage passage; not aggressive (does not push stone faster).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("MEDICAL EXPULSIVE THERAPY (MET) — tamsulosin 0.4 mg PO daily for distal ureteral stones 5–10 mm; modest benefit per recent evidence.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("STRAIN urine; analyze stone if passed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("INTERVENTION criteria: stone >10 mm, persistent pain, infection + obstruction (urgent), AKI, pregnancy with obstruction, solitary kidney.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Procedural options — extracorporeal shock-wave lithotripsy (ESWL), ureteroscopy with laser lithotripsy, percutaneous nephrolithotomy (large stones).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Decompression for infected obstruction — ureteral stent or percutaneous nephrostomy + IV antibiotics; do NOT wait for definitive stone treatment.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PREVENTION — increase fluid (>2.5 L/day urine output goal), reduce sodium and animal protein, normal calcium intake, avoid dehydration, avoid oxalate-rich foods if calcium-oxalate former; specific therapy by stone type (thiazide for hypercalciuria, allopurinol for uric acid, citrate for hypocitraturia).", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("INFECTED OBSTRUCTING STONE — sepsis emergency; antibiotics + decompression; mortality if missed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Bilateral obstruction or single-kidney obstruction → AKI; emergent decompression.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Recurrence — high; preventive workup after second stone or first complicated stone.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pregnancy — limited imaging (US first), avoid most procedures until postpartum if stable; stenting acceptable.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("AAA — atypical 'flank pain' in older patient with risk factors; do not anchor on stone.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Aspiration Pneumonia

public enum AspirationPneumoniaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "aspiration-pneumonia",
        title: "Aspiration Pneumonia",
        subtitle: "Chemical pneumonitis vs bacterial · dependent lobes · prevention is key",
        nclexTags: gas,
        definition: AttributedProse(
            "Pneumonia developing after macroaspiration of oropharyngeal or gastric contents into the lower airways. Distinguished from aspiration pneumonitis (chemical injury from acid). Common causes: dysphagia, decreased LOC, alcohol/drug intoxication, post-anesthesia, GERD, NG tube feeding, intubation/extubation events.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Aspirated material reaches dependent lobes (right lower lobe, posterior segments) due to bronchial anatomy. Bacterial aspiration involves oropharyngeal flora — anaerobes, strep, staph; nosocomial includes gram-negatives, MRSA. Acid aspiration (Mendelson syndrome) is chemical injury, not initially infectious.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("Cough (often productive, foul-smelling sputum if anaerobic), fever, dyspnea — develops over hours to days after aspiration.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Tachypnea, tachycardia, hypoxia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Crackles in dependent areas; possible bronchial breath sounds.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Witnessed event helpful but not always present.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Risk factors: dysphagia (stroke, dementia, ALS), decreased LOC, alcohol, NG/PEG tubes, intubation, GERD.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical + CXR — infiltrate in dependent lobes (right lower most common; right upper if supine).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CBC, CMP, lactate (severity), sputum culture (variable yield).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CT chest if cavitation, abscess, or atypical course.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, SpO2, work of breathing.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Swallow evaluation — bedside screen by SLP; modified barium swallow if persistent risk.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Mental status, ability to protect airway.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Source of risk — dental hygiene, dentures, GERD, NG/PEG, sedation.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIBIOTICS for confirmed pneumonia (not routinely for suspected pneumonitis without bacterial signs):", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Community-acquired aspiration: ampicillin-sulbactam, ceftriaxone + metronidazole, or amoxicillin-clavulanate (oral after stable).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hospital-acquired aspiration: piperacillin-tazobactam ± vancomycin (MRSA) ± antipseudomonal (cefepime).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Oxygen, suction, position upright (HOB ≥30°).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Steroids NOT routinely indicated (no benefit in chemical pneumonitis).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PREVENTION (key):", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("HOB elevation 30–45° in tube-fed and ventilated patients.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Oral care (chlorhexidine in select; tooth-brushing) to reduce oropharyngeal bacterial load.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Swallow assessment before oral intake post-stroke, post-extubation.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Diet modifications (thickened liquids, pureed) per SLP.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Address underlying cause — GERD treatment, dental care, address sedation.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("ARDS — severe aspiration → diffuse alveolar damage.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Lung abscess or empyema — anaerobic infection; cavitation on imaging; prolonged antibiotics + drainage.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Recurrence — if underlying risk factor not addressed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("In demented patients with recurrent aspiration — goals-of-care discussion; PEG tube does NOT prevent aspiration in advanced dementia.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, idsaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Necrotizing Fasciitis

public enum NecrotizingFasciitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "necrotizing-fasciitis",
        title: "Necrotizing Fasciitis",
        subtitle: "Pain out of proportion · rapidly progressive · surgical emergency",
        nclexTags: infectionTags,
        definition: AttributedProse(
            "Rapidly progressive deep soft-tissue infection extending along fascial planes with associated tissue necrosis. Mortality 20–40% even with appropriate care. Two main types: Type I (polymicrobial — gram-positives, gram-negatives, anaerobes — especially in diabetics, immunocompromised); Type II (monomicrobial — Group A strep ± S. aureus — including MRSA).",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Bacterial entry through skin breach → spread along fascia → necrosis of subcutaneous tissue, fat, fascia → eventually muscle. Toxin-mediated systemic inflammatory response → shock, multi-organ failure. Subcutaneous gas in some cases (clostridial myonecrosis, mixed infections).",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("PAIN OUT OF PROPORTION to visible findings — single most important feature; unbearable pain with relatively benign-appearing skin early on.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("RAPID progression over hours.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Skin findings progress: erythema → dusky → violaceous → blistering/bullae (often hemorrhagic) → frank necrosis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Crepitus on palpation (gas in tissue) — late sign.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Systemic toxicity — fever, tachycardia, hypotension, AMS.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Risk factors: diabetes, IV drug use, alcohol use disorder, immunocompromise, cirrhosis, peripheral vascular disease, recent surgery/trauma; can occur in healthy individuals.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — high index of suspicion in pain out of proportion + signs of systemic toxicity.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("LRINEC score uses CRP, WBC, Hgb, Na, Cr, glucose; high score (≥6 → suspect; ≥8 → strongly).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Imaging (CT or MRI) shows fascial gas, fluid; should NOT delay surgery if clinical suspicion is high.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Definitive diagnosis at surgical exploration — gray, edematous fascia; loss of resistance to blunt dissection ('finger test'); no bleeding from fascia.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Sepsis screen — vital signs, lactate, MAP.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Skin exam serial photographs / mark borders with marker — track rapid progression.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Pain assessment — disproportion is key.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Surgical consult URGENTLY — debridement is the only definitive treatment.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("URGENT SURGICAL DEBRIDEMENT — definitive treatment; often within hours of suspicion; serial debridements typically required. Antibiotics alone do not save the patient.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("EMPIRIC IV BROAD-SPECTRUM ANTIBIOTICS within 1 hour: piperacillin-tazobactam OR meropenem PLUS vancomycin (MRSA) PLUS clindamycin (anti-toxin effect for Group A strep — even in MRSA).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Aggressive resuscitation — IV fluids, vasopressors as needed.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("ICU admission.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hyperbaric oxygen — controversial; some centers use for clostridial.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("IVIG — for streptococcal toxic shock syndrome (Group A strep) per institution.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Wound vac and reconstructive surgery once infection controlled; functional rehab.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("RAPID DETERIORATION — hours, not days; surgical delay = mortality.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Multi-organ failure from sepsis.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Compartment syndrome of affected extremity.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Limb amputation may be required.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Streptococcal toxic shock syndrome — Group A strep + multi-organ failure.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("In Fournier gangrene (perineal nec fasc) — particularly in diabetics; surgical emergency.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3, idsaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Obstructive Sleep Apnea

public enum OSASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "osa",
        title: "Obstructive Sleep Apnea (OSA)",
        subtitle: "Pharyngeal collapse · cardiovascular consequences · CPAP first-line",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
        definition: AttributedProse(
            "Recurrent upper-airway collapse during sleep causing partial (hypopnea) or complete (apnea) obstruction → desaturation, sleep fragmentation, sympathetic activation. Apnea-Hypopnea Index (AHI) ≥5 with symptoms or ≥15 without. Massively underdiagnosed; major modifiable contributor to HTN, atrial fibrillation, stroke, MI, motor-vehicle crashes, and metabolic syndrome.",
            citationIDs: ["openrn_ms_round3"]
        ),
        pathophysiology: AttributedProse(
            "Anatomic + neuromuscular factors → pharyngeal airway collapse during sleep (obstructive). Repetitive arousals → sleep fragmentation, sympathetic surges, hypoxia/reoxygenation injury → cardiovascular and metabolic consequences. Risk factors: obesity (most), male sex, age, postmenopausal status, retrognathia, large neck circumference, alcohol/sedatives, family history.",
            citationIDs: ["openrn_ms_round3"]
        ),
        presentation: [
            AttributedBullet("LOUD SNORING with witnessed apneas / gasping (partner-reported).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Excessive daytime sleepiness (Epworth Sleepiness Scale).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Morning headaches, dry mouth, sore throat.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Non-restorative sleep, irritability, poor concentration.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Nocturia.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Resistant hypertension, atrial fibrillation, stroke, depression — strongly associated.", citationIDs: ["openrn_ms_round3"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Polysomnography (in-lab) — gold standard; AHI ≥5 with symptoms OR ≥15 without symptoms = OSA.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Home sleep apnea test (HSAT) — increasingly used for high-pretest-probability adults; misses central apnea, less accurate in moderate disease.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("STOP-BANG screening tool — Snoring, Tired, Observed apneas, BP, BMI, Age, Neck, Gender; ≥3 high risk.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Severity by AHI: mild 5–14, moderate 15–29, severe ≥30 events/hour.", citationIDs: ["openrn_ms_round3"])
        ],
        priorityAssessments: [
            AttributedBullet("Pre-op screening — STOP-BANG; high-risk patients require careful peri-anesthesia management (opioids dangerous, careful extubation).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CV risk — BP, AFib, HF, stroke history.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Driving/job safety — commercial drivers.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Concomitant — obesity hypoventilation, COPD overlap, central apnea (HF), heart-failure-related Cheyne-Stokes.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CPAP adherence — biggest predictor of treatment success.", citationIDs: ["openrn_ms_round3"])
        ],
        commonInterventions: [
            AttributedBullet("CPAP — first-line for moderate-severe; auto-titrating PAP commonly used; mask fit and titration critical for adherence.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("BiPAP — for OSA + obesity hypoventilation, COPD overlap, or CPAP-intolerant.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("WEIGHT LOSS — substantial impact (10% body weight = ~25% AHI reduction); bariatric surgery for select.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Position therapy (avoid supine sleep) for positional OSA.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Oral appliances (mandibular advancement device) for mild-moderate or CPAP-intolerant.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Hypoglossal nerve stimulator (Inspire) — selected moderate-severe CPAP-intolerant patients.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Surgery — UPPP, maxillomandibular advancement (selected patients).", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Avoid alcohol and sedatives, especially before sleep.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Address comorbid conditions — HTN, AFib, HF, depression.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Counsel about driving and CPAP — major safety issue.", citationIDs: ["openrn_ms_round3"])
        ],
        watchFor: [
            AttributedBullet("CARDIOVASCULAR — uncontrolled HTN, AFib, MI, stroke; CPAP improves BP control especially in resistant HTN.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("PERIOPERATIVE — opioids and sedatives can be fatal in untreated OSA; bring CPAP to hospital; minimize narcotics; capnography monitoring.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Motor vehicle crashes — drowsy-driving risk; commercial driver evaluations.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("Right HF / cor pulmonale in long-standing untreated severe OSA.", citationIDs: ["openrn_ms_round3"]),
            AttributedBullet("CPAP-related issues — claustrophobia, nasal dryness, pressure sores; troubleshoot to maintain adherence.", citationIDs: ["openrn_ms_round3"])
        ],
        citations: [openrnMS3, openstaxMS3],
        lastSourceFidelityReview: "2026-05-04"
    )
}
