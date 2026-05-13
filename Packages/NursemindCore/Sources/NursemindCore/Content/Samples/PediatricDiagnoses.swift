import Foundation

// Curator-model pediatric diagnosis entries (v1.5 expansion).
// Sources: Open RN Nursing Pediatrics where covered (CC BY 4.0), CDC pediatric
// guidance (public domain), AAP / PALS / IDSA concept citations only.
// NOTE: Pediatric content is intentionally focused — pediatric drug dosing remains
// out of scope per Apple 1.4.2; entries below describe diagnosis recognition,
// supportive nursing care, and family education without patient-specific dose math.

private let openrnPeds = CitationSource(
    id: "openrn_peds",
    shortName: "Open RN Nursing Pediatric Care (and pediatric chapters of Med-Surg)",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingpediatric/?s=pediatric+infant+child+adolescent",
    lastRetrieved: "2026-05-04"
)
private let cdcPeds = CitationSource(
    id: "cdc_peds",
    shortName: "CDC Pediatric Clinical Guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let aapConcept = CitationSource(
    id: "aap_concept",
    shortName: "AAP Clinical Practice Guidelines (concept citation only)",
    publisher: "American Academy of Pediatrics",
    license: .factCitationOnly,
    url: "https://www.aap.org/en/practice-management/practice-guidance/",
    lastRetrieved: "2026-05-04"
)
private let palsConcept = CitationSource(
    id: "pals_concept",
    shortName: "PALS algorithms (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/",
    lastRetrieved: "2026-05-04"
)

private let pedsRespTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let pedsInfectionTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let pedsHealthTags = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .nutrition)
private let pedsSafetyTags = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)

// MARK: - Bronchiolitis (RSV)

public enum BronchiolitisDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bronchiolitis",
        title: "Bronchiolitis",
        subtitle: "Infants <2 yr · viral (RSV most common) · supportive care",
        nclexTags: pedsRespTags,
        definition: AttributedProse(
            "Acute lower respiratory tract infection of small airways (bronchioles) in infants and young children, typically caused by respiratory syncytial virus (RSV). Most common cause of hospitalization in children <1 year. Self-limited but can cause significant respiratory distress in young or high-risk infants.",
            citationIDs: ["openrn_peds", "aap_concept"]
        ),
        pathophysiology: AttributedProse(
            "Viral infection of bronchiolar epithelium → mucosal edema, mucus plugging, bronchiolar obstruction → air trapping, V/Q mismatch, hypoxemia. Most affect infants 2–24 months; peak incidence 3–6 months. Seasonal (fall–spring).",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("URI prodrome (1–3 days): rhinorrhea, mild cough, low-grade fever.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Progression to lower tract: tachypnea, wheezing, crackles, retractions, nasal flaring, grunting, hypoxemia.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Apnea may be the presenting sign in infants <2 months — admit and monitor.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Poor feeding, dehydration from work of breathing.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Risk factors for severe disease: <12 weeks, prematurity, congenital heart disease, chronic lung disease, immunocompromise, neuromuscular disease.", citationIDs: ["aap_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — routine viral testing not recommended in typical outpatient presentations (does not change management).", citationIDs: ["aap_concept"]),
            AttributedBullet("RSV testing if it would change isolation, prophylaxis, or therapy (e.g., admitted patient).", citationIDs: ["aap_concept"]),
            AttributedBullet("Routine CXR not recommended — leads to overuse of antibiotics; reserve for atypical course or complications.", citationIDs: ["aap_concept"]),
            AttributedBullet("Pulse oximetry to assess oxygenation; persistent SpO₂ <90% considered admission criterion.", citationIDs: ["aap_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous SpO₂ for hospitalized infants; assess work of breathing, RR, retractions, nasal flaring, grunting.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hydration — wet diapers, mucous membranes, fontanelle, capillary refill; infants stop feeding before they decompensate.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Apnea monitoring in <2 months.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Trend severity over 48–72 hours — typically peaks day 3–5.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("SUPPORTIVE CARE — foundation of treatment.", citationIDs: ["aap_concept"]),
            AttributedBullet("Nasal suctioning (bulb or saline + suction) before feeds and as needed; do NOT use deep suctioning routinely.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Oxygen for sustained SpO₂ <90% (per AAP); high-flow nasal cannula for moderate distress; CPAP/BiPAP/intubation for severe.", citationIDs: ["aap_concept"]),
            AttributedBullet("Hydration — encourage oral intake; small frequent feeds; IV fluids if poor PO; monitor for SIADH (overhydration risk).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Cool-mist humidifier for symptom comfort.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Routinely NOT recommended: bronchodilators, corticosteroids, antibiotics (unless secondary infection), chest physiotherapy.", citationIDs: ["aap_concept"]),
            AttributedBullet("Hospital admission criteria: persistent SpO₂ <90%, severe distress, apnea, dehydration/poor feeding, age <2–3 months, comorbidities, social barriers to follow-up.", citationIDs: ["aap_concept"]),
            AttributedBullet("CONTACT + DROPLET precautions for hospitalized RSV.", citationIDs: ["cdc_peds"]),
            AttributedBullet("Prevention: nirsevimab (monoclonal antibody) for all infants in their first RSV season; maternal RSV vaccination; palivizumab for select high-risk infants per AAP.", citationIDs: ["aap_concept"])
        ],
        watchFor: [
            AttributedBullet("APNEA — especially in <2 months; can be the presenting sign before respiratory distress.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Worsening respiratory failure — escalate to HFNC → CPAP/BiPAP → intubation; PICU.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Dehydration from poor feeding plus increased insensible losses.", citationIDs: ["openrn_peds"]),
            AttributedBullet("SIADH from RSV — restrict free water; monitor sodium.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Secondary bacterial pneumonia (rare but considered if persistent/worsening fever, focal findings).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Family education: signs of worsening (rapid breathing, poor feeding, fewer wet diapers, change in color); follow-up plan.", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept, cdcPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Croup

public enum CroupDiagnosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "croup",
        title: "Croup (Laryngotracheobronchitis)",
        subtitle: "Viral · barky cough · stridor · 6 mo – 3 yr",
        nclexTags: pedsRespTags,
        definition: AttributedProse(
            "Acute viral upper-airway infection causing subglottic swelling, characterized by barking cough, hoarse voice, and inspiratory stridor. Most common in children 6 months to 3 years. Most cases mild and self-limited; severe cases can compromise the airway.",
            citationIDs: ["openrn_peds"]
        ),
        pathophysiology: AttributedProse(
            "Parainfluenza viruses are most common cause; also RSV, influenza, adenovirus. Inflammation of larynx, trachea, bronchi → subglottic edema (the narrowest part of the pediatric airway) → turbulent airflow → stridor.",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("URI prodrome 1–3 days.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Classic triad: BARKING/SEAL-LIKE cough, INSPIRATORY STRIDOR, HOARSENESS.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Symptoms typically worse at night and with agitation.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Low-grade fever; well-appearing between coughing episodes (in mild disease).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Severe: stridor at rest, retractions, accessory muscle use, hypoxia, fatigue, decreased LOC.", citationIDs: ["openrn_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — Westley Croup Score grades severity (LOC, cyanosis, stridor, air entry, retractions).", citationIDs: ["openrn_peds"]),
            AttributedBullet("XR (lateral neck) — 'steeple sign' (subglottic narrowing) — only if diagnosis uncertain.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Differential: epiglottitis (toxic appearance, drooling, tripod), bacterial tracheitis (toxic, high fever, copious purulent secretions), foreign body aspiration, retropharyngeal abscess, anaphylaxis.", citationIDs: ["openrn_peds"])
        ],
        priorityAssessments: [
            AttributedBullet("Westley Croup Score on presentation and serially.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Stridor at rest vs only with agitation.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Work of breathing, air entry, color, mental status.", citationIDs: ["openrn_peds"]),
            AttributedBullet("KEEP CHILD CALM — agitation worsens stridor; allow position of comfort with caregiver.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("MILD (no stridor at rest): supportive care, cool-mist humidifier, fluids; outpatient.", citationIDs: ["openrn_peds"]),
            AttributedBullet("MODERATE (stridor at rest, mild–moderate retractions): single dose oral DEXAMETHASONE 0.6 mg/kg (max 16 mg) — improves outcomes for nearly all croup; observation 3–4 hours.", citationIDs: ["aap_concept", "openrn_peds"]),
            AttributedBullet("SEVERE (stridor at rest with severe retractions, agitation, hypoxia): NEBULIZED RACEMIC EPINEPHRINE plus dexamethasone; observe ≥3–4 hours after epi (rebound).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Oxygen and airway management as needed; rare intubation for impending airway failure (use smaller-than-predicted ETT due to subglottic swelling).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Family education: warning signs warranting return (worsening stridor, retractions at rest, color change, lethargy).", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("Airway compromise — rare but possible; do NOT instrument/visualize the throat without anesthesia/airway support if severe (precipitates obstruction).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Bacterial tracheitis as complication or alternative diagnosis — toxic appearance, high fever, copious thick purulent secretions, no improvement with usual treatment.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Rebound after racemic epinephrine — observe 3–4 hours; risk of return of stridor.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Recurrent croup — consider underlying anatomic abnormality (subglottic stenosis).", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Epiglottitis

public enum EpiglottitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "epiglottitis",
        title: "Epiglottitis (Supraglottitis)",
        subtitle: "Airway emergency · drooling · tripod · do NOT examine throat",
        nclexTags: pedsRespTags,
        definition: AttributedProse(
            "Life-threatening cellulitis of the epiglottis and supraglottic structures causing rapid airway obstruction. Historically Haemophilus influenzae type b (Hib) in unvaccinated children; now seen across ages from H. flu, S. pneumoniae, S. aureus, GAS. Pediatric incidence dramatically reduced by Hib vaccine but cases occur in unvaccinated and adults.",
            citationIDs: ["openrn_peds"]
        ),
        pathophysiology: AttributedProse(
            "Bacterial inflammation → rapid swelling of epiglottis and aryepiglottic folds → progressive airway narrowing → asphyxiation. Highly variable progression — can deteriorate within hours.",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("ABRUPT onset (hours) of high fever, severe sore throat, dysphagia, muffled 'hot potato' voice.", citationIDs: ["openrn_peds"]),
            AttributedBullet("CLASSIC '4 D's': Drooling, Dysphagia, Dysphonia, Distress.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Tripod position (sitting, leaning forward, neck extended, mouth open) — preserves airway.", citationIDs: ["openrn_peds"]),
            AttributedBullet("TOXIC appearance — distressed, anxious, looks ill.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Inspiratory stridor (later/severe finding); refuses to lie flat.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Cough is NOT prominent (vs croup); patient typically NOT vaccinated against Hib.", citationIDs: ["openrn_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — confirmed by laryngoscopy in OPERATING ROOM with airway team present.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Lateral neck XR (if absolutely necessary, with personnel ready to intubate): 'thumb sign' (swollen epiglottis).", citationIDs: ["openrn_peds"]),
            AttributedBullet("DO NOT depress the tongue, examine the throat, lay the child flat, or perform any procedure that could agitate the child outside of OR.", citationIDs: ["openrn_peds"])
        ],
        priorityAssessments: [
            AttributedBullet("KEEP CHILD CALM — let parent hold; do not separate; do not insert IV/draw blood until airway secured.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Position of comfort — tripod sitting; do NOT force supine.", citationIDs: ["openrn_peds"]),
            AttributedBullet("100% oxygen via blow-by (not mask if it agitates).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Vital signs minimally invasive observational only.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("CALL AIRWAY TEAM STAT — anesthesia, ENT, PICU.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Transport to OR for controlled intubation under inhalational anesthesia by experienced provider.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Surgical airway readiness (cricothyrotomy/tracheostomy) if intubation fails.", citationIDs: ["openrn_peds"]),
            AttributedBullet("After airway secured: blood/throat cultures, IV antibiotics — third-gen cephalosporin (ceftriaxone) + anti-staphylococcal coverage (vancomycin) per local epidemiology.", citationIDs: ["openrn_peds"]),
            AttributedBullet("PICU monitoring; extubation typically possible 24–72 hours when swelling resolves.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Rifampin prophylaxis for household contacts in confirmed Hib cases.", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("RAPID AIRWAY OBSTRUCTION — death within hours if untreated.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Cardiac arrest from hypoxia.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Septicemia, meningitis from Hib.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hib vaccine status — verify and update.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Adult epiglottitis — increasing relative incidence; presentation often more subtle (severe sore throat without visible findings).", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Kawasaki Disease

public enum KawasakiSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "kawasaki-disease",
        title: "Kawasaki Disease",
        subtitle: "Pediatric vasculitis · coronary artery aneurysm risk · IVIG within 10 days",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Acute medium-vessel vasculitis primarily affecting children <5 years. Etiology unknown (likely infectious trigger in genetically susceptible). Leading cause of acquired heart disease in children in developed countries due to coronary artery aneurysms. Self-limited but cardiac complications can be permanent.",
            citationIDs: ["openrn_peds", "aap_concept"]
        ),
        pathophysiology: AttributedProse(
            "Generalized inflammation of medium-sized arteries with predilection for coronaries. Untreated, ~25% develop coronary artery aneurysms; with IVIG within 10 days, this falls to ~5%.",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("FEVER ≥5 days (often high, ≥39°C, persistent despite antipyretics).", citationIDs: ["aap_concept"]),
            AttributedBullet("CRASH and Burn mnemonic: Conjunctivitis (bilateral, non-purulent), Rash (polymorphic, not vesicular), Adenopathy (cervical, often unilateral, ≥1.5 cm), Strawberry tongue (and lips — red, cracked, fissured), Hands and feet changes (erythema, edema; later peeling).", citationIDs: ["aap_concept"]),
            AttributedBullet("Irritability often pronounced.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Incomplete/atypical Kawasaki: fever + only 2–3 features, especially in infants <6 months — workup with labs and echo.", citationIDs: ["aap_concept"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLASSIC: fever ≥5 days + ≥4 of 5 principal features (conjunctivitis, rash, adenopathy, mucous membrane changes, extremity changes).", citationIDs: ["aap_concept"]),
            AttributedBullet("Labs (supportive): elevated CRP/ESR, leukocytosis, anemia, thrombocytosis (>450K) appearing in week 2, transaminitis, sterile pyuria.", citationIDs: ["openrn_peds"]),
            AttributedBullet("ECHO at diagnosis and during follow-up — assess for coronary artery dilation/aneurysm.", citationIDs: ["aap_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Cardiac status — ECG, ECHO; assess for myocarditis (gallop, mitral regurgitation, decreased function).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hydration; weigh daily; track fevers.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Skin care — moisturize, gentle handling; peeling phase week 2–3.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Family education on long-term cardiac surveillance.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("IV IMMUNOGLOBULIN (IVIG) 2 g/kg single infusion — give within 10 days of fever onset (ideally 5–7 days); reduces coronary aneurysm risk from ~25% to ~5%.", citationIDs: ["aap_concept"]),
            AttributedBullet("HIGH-DOSE ASPIRIN (anti-inflammatory, 80–100 mg/kg/day divided) until afebrile, then LOW-DOSE (3–5 mg/kg/day) for antiplatelet effect for 6–8 weeks (longer if coronary involvement). Note: aspirin in Kawasaki is the EXCEPTION to general no-aspirin-in-children rule.", citationIDs: ["aap_concept"]),
            AttributedBullet("Refractory cases: second IVIG dose, corticosteroids, infliximab.", citationIDs: ["aap_concept"]),
            AttributedBullet("Defer live vaccines (MMR, varicella) for 11 months after IVIG.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Long-term follow-up with pediatric cardiology if coronary involvement; serial echocardiograms.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Family education — recognize relapse, cardiac symptoms, importance of follow-up.", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("CORONARY ARTERY ANEURYSMS — leading complication; lifelong cardiac risk if persistent.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Myocarditis, pericarditis, valvular insufficiency.", citationIDs: ["openrn_peds"]),
            AttributedBullet("IVIG reactions — anaphylaxis (rare), aseptic meningitis, hemolytic anemia.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Reye syndrome with concomitant viral illness — though Kawasaki is the indication for high-dose aspirin, monitor for hepatic dysfunction; influenza/varicella vaccination important.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Multisystem inflammatory syndrome in children (MIS-C) post-COVID — overlapping features but distinct entity; consider in differential.", citationIDs: ["cdc_peds"])
        ],
        citations: [openrnPeds, aapConcept, cdcPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Reye Syndrome

public enum ReyeSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "reye-syndrome",
        title: "Reye Syndrome",
        subtitle: "Acute encephalopathy + hepatic dysfunction · linked to aspirin in viral illness",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
        definition: AttributedProse(
            "Rare but life-threatening pediatric syndrome of acute non-inflammatory encephalopathy with fatty degeneration of the liver. Strongly associated with salicylate (aspirin) use during viral illnesses (especially influenza, varicella). Incidence dramatically reduced since the 1980s warning against pediatric aspirin use.",
            citationIDs: ["openrn_peds"]
        ),
        pathophysiology: AttributedProse(
            "Mitochondrial dysfunction with impaired beta-oxidation → hepatic steatosis → hyperammonemia → cerebral edema and encephalopathy. Pathogenesis incompletely understood; aspirin is a key trigger.",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("Recent viral illness (influenza, varicella, URI) with aspirin use.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Persistent vomiting (often the first sign) in apparently recovering child.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Lethargy, irritability, confusion progressing to seizures, coma.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hepatomegaly (typically without jaundice).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Stage progression: I (lethargic, vomiting) → II (combative, hyperventilation, hyperreflexia) → III (coma, decorticate posturing) → IV (decerebrate posturing) → V (areflexia, apnea, death).", citationIDs: ["openrn_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — encephalopathy + hepatic dysfunction in a child after viral illness.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Labs: AST/ALT elevation (3× normal), ammonia elevation, INR prolongation, hypoglycemia (especially in <2 yr), normal bilirubin (distinguishes from hepatic failure).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Liver biopsy (microvesicular steatosis) — rarely performed; reserved for atypical cases.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Rule out inborn errors of metabolism, sepsis, toxin ingestion, encephalitis.", citationIDs: ["openrn_peds"])
        ],
        priorityAssessments: [
            AttributedBullet("Neuro checks frequent; assess for increased ICP.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Glucose monitoring — hypoglycemia common.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Ammonia, LFTs, INR, BMP.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Airway management as encephalopathy progresses.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("Supportive care in PICU.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Manage cerebral edema — head elevation, mannitol/hypertonic saline, hyperventilation as bridge, possible ICP monitoring.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Control hyperammonemia — protein restriction, lactulose, dialysis if severe.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Glucose infusion to prevent hypoglycemia.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Vitamin K, FFP for coagulopathy.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Mechanical ventilation as needed.", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("PREVENTION is the key intervention — NEVER give aspirin (or aspirin-containing products like Pepto-Bismol) to children/teens with viral illness.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Exception: Kawasaki disease (with cardiac surveillance).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Educate parents on hidden aspirin (combination cold preparations, oil of wintergreen, salicylate-containing topicals).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Influenza vaccination in children reduces risk by reducing influenza incidence.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Mortality and severe neurologic disability significant if encephalopathy advanced.", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - SIDS

public enum SIDSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sids",
        title: "Sudden Infant Death Syndrome (SIDS)",
        subtitle: "Sudden unexplained infant death · safe sleep prevention",
        nclexTags: pedsSafetyTags,
        definition: AttributedProse(
            "Sudden unexpected death of an infant <1 year that remains unexplained after thorough investigation including autopsy, scene investigation, and review of medical history. Peak incidence 2–4 months; >90% before 6 months. Reduced ~50% since 'Back to Sleep' campaign in 1990s.",
            citationIDs: ["aap_concept", "cdc_peds"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial 'triple-risk' model — vulnerable infant (brainstem abnormalities affecting arousal), critical developmental period (2–4 months), exogenous stressor (prone position, soft bedding, overheating, smoke exposure). Failure of arousal during apnea → death.",
            citationIDs: ["aap_concept"]
        ),
        presentation: [
            AttributedBullet("Sudden, unexpected, unexplained death of an apparently healthy infant.", citationIDs: ["aap_concept"]),
            AttributedBullet("Often found in sleep environment.", citationIDs: ["aap_concept"]),
            AttributedBullet("Risk factors: prone or side sleeping position, soft bedding/sleeping surface, bed sharing, prematurity/low birth weight, maternal smoking (prenatal or postnatal), overheating, lack of breastfeeding, no pacifier use.", citationIDs: ["aap_concept"]),
            AttributedBullet("Higher rates in: AI/AN and Black infants (related to socioeconomic factors and disparities), male infants, winter months.", citationIDs: ["cdc_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Diagnosis of EXCLUSION — requires complete autopsy, scene investigation, medical history review.", citationIDs: ["aap_concept"]),
            AttributedBullet("'SUDI' (sudden unexpected death in infancy) is the broader category; SIDS is the unexplained subset.", citationIDs: ["aap_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Assess sleep environment at every well-child visit.", citationIDs: ["aap_concept"]),
            AttributedBullet("Educate caregivers on safe sleep — every infant, every sleep, every time.", citationIDs: ["aap_concept"]),
            AttributedBullet("Identify risk factors (smoking exposure, prematurity, social factors).", citationIDs: ["aap_concept"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION: Safe sleep ABCs — Alone, on Back, in Crib.", citationIDs: ["aap_concept"]),
            AttributedBullet("Always SUPINE for sleep until 1 year (unless contraindicated by provider).", citationIDs: ["aap_concept"]),
            AttributedBullet("Firm, flat sleep surface in safety-approved crib/bassinet/play yard.", citationIDs: ["aap_concept"]),
            AttributedBullet("NO soft objects (pillows, blankets, bumpers, stuffed animals, sleep positioners) in sleep area.", citationIDs: ["aap_concept"]),
            AttributedBullet("Room sharing without bed sharing for first 6 months (ideally 1 year) — cuts SIDS risk ~50%.", citationIDs: ["aap_concept"]),
            AttributedBullet("Avoid overheating (light clothing, room temperature comfortable for adult).", citationIDs: ["aap_concept"]),
            AttributedBullet("BREASTFEEDING reduces SIDS risk.", citationIDs: ["aap_concept"]),
            AttributedBullet("Pacifier at sleep onset (after breastfeeding established) — protective.", citationIDs: ["aap_concept"]),
            AttributedBullet("ZERO smoke exposure — prenatal and postnatal.", citationIDs: ["aap_concept"]),
            AttributedBullet("Routine immunizations — protective (no causal link to SIDS).", citationIDs: ["aap_concept"]),
            AttributedBullet("Tummy time when AWAKE and supervised.", citationIDs: ["aap_concept"]),
            AttributedBullet("Avoid commercial 'anti-SIDS' devices not endorsed by AAP.", citationIDs: ["aap_concept"]),
            AttributedBullet("Bereavement support — family-centered, validate grief, provide resources, follow-up.", citationIDs: ["aap_concept"])
        ],
        watchFor: [
            AttributedBullet("Subsequent siblings — slightly higher risk; same prevention principles.", citationIDs: ["aap_concept"]),
            AttributedBullet("Differential diagnosis at autopsy — abuse (suffocation), inborn errors of metabolism, cardiac channelopathies, infection.", citationIDs: ["aap_concept"]),
            AttributedBullet("Disparities — focus on community-based education and culturally appropriate messaging.", citationIDs: ["cdc_peds"]),
            AttributedBullet("Bed sharing in tired/intoxicated/medicated parents — higher risk; counsel feeding-then-return-to-crib.", citationIDs: ["aap_concept"])
        ],
        citations: [openrnPeds, aapConcept, cdcPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Failure to Thrive

public enum FailureToThriveSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "failure-to-thrive",
        title: "Failure to Thrive (FTT)",
        subtitle: "Inadequate weight gain or growth in infants/children",
        nclexTags: pedsHealthTags,
        definition: AttributedProse(
            "Inadequate physical growth in young children — weight (or weight for length) below the 5th percentile, declining across two or more major percentile lines, or persistently <80% expected weight for age. Reflects mismatch between caloric intake/absorption/utilization. Etiology often multifactorial.",
            citationIDs: ["openrn_peds", "aap_concept"]
        ),
        pathophysiology: AttributedProse(
            "Three categories (often overlapping): inadequate INTAKE (most common — feeding difficulties, behavioral, neglect, poverty, formula errors), inadequate ABSORPTION (CF, celiac, milk protein allergy, IBD), increased METABOLIC demand (CHF, hyperthyroid, chronic infection, malignancy).",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("Weight loss or inadequate weight gain on serial measurements.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Weight typically affected first; length and head circumference follow if chronic/severe.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Decreased subcutaneous fat, muscle wasting (severe).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Developmental delay, decreased activity.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Feeding difficulty: prolonged feeding times, fatigue with feeds, gagging/vomiting, food refusal.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Family/social: stress, mental health, food insecurity, parent-child interaction concerns.", citationIDs: ["openrn_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Plot all measurements on appropriate growth curve (WHO 0–2 years; CDC 2+ years; specialty curves for prematurity, Down syndrome, etc.).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Detailed feeding history (24-hour recall, formula preparation, breast feeding adequacy, food access).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Targeted workup based on history/exam — CBC, BMP, UA, TSH, sweat chloride (CF), celiac panel, lead, etc.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Social work involvement — assess for neglect, food insecurity, postpartum depression, IPV.", citationIDs: ["openrn_peds"])
        ],
        priorityAssessments: [
            AttributedBullet("Accurate weight, length, head circumference; plot on appropriate curve.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Feeding observation — direct observation of feeding identifies many issues.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Caregiver mental health, support system, financial resources.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Developmental milestones.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Safety — consider abuse/neglect; use trauma-informed approach.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("MULTIDISCIPLINARY — pediatrician, dietitian, lactation consultant, social work, OT/SLP for feeding therapy, mental health.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Increase caloric density of feeds (high-calorie formula, fortifying breast milk per provider).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Address feeding behaviors — calm environment, structured meal/snack times, avoid grazing, family meals, model healthy eating.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Connect with WIC, SNAP, food banks, formula assistance.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Address caregiver mental health (PPD), substance use, IPV.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hospitalize for catch-up feeding, observation, severe cases, suspected abuse, or failed outpatient management.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Slow refeeding to avoid refeeding syndrome in chronically malnourished.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Treat underlying medical condition if identified.", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("Refeeding syndrome — replete K, Mg, phosphorus; advance feeds slowly.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Long-term cognitive and developmental impacts of early malnutrition — may not fully reverse.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Recurrence — close follow-up after discharge; community resources.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Child welfare reporting — mandatory if neglect suspected.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Stigma and blame — approach families with empathy; FTT is rarely a single cause.", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric Dehydration

public enum PediatricDehydrationSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-dehydration",
        title: "Pediatric Dehydration",
        subtitle: "Assess severity · oral rehydration first-line for mild–moderate",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes),
        definition: AttributedProse(
            "Loss of body water and electrolytes exceeding intake in infants and children. Most commonly from acute gastroenteritis. Severity grading guides treatment (mild, moderate, severe). Children at higher risk than adults due to higher body water turnover and less reserve.",
            citationIDs: ["openrn_peds", "aap_concept"]
        ),
        pathophysiology: AttributedProse(
            "Common causes: viral gastroenteritis (rotavirus, norovirus), bacterial (Salmonella, Shigella, E. coli, C. diff), parasitic (Giardia), DKA, fever with poor intake, burns, extensive vomiting. Infants/young children have higher surface area-to-mass ratio → higher insensible losses.",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("MILD (3–5% body weight loss): slightly increased thirst; otherwise normal exam.", citationIDs: ["aap_concept"]),
            AttributedBullet("MODERATE (6–9%): dry mucous membranes, decreased tears, sunken fontanelle, sunken eyes, decreased skin turgor, prolonged cap refill 2–3 sec, tachycardia, oliguria, irritability/lethargy.", citationIDs: ["aap_concept"]),
            AttributedBullet("SEVERE (≥10%): all above plus weak rapid pulse, hypotension (LATE in pediatrics), cool mottled extremities, cap refill >3 sec, anuria, decreased LOC, eventually shock.", citationIDs: ["aap_concept"]),
            AttributedBullet("ISOTONIC most common; HYPONATREMIC (Na <130) with free-water replacement; HYPERNATREMIC (Na >150) with insensible-loss-predominant or improper formula dilution.", citationIDs: ["openrn_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — combination of signs; weight loss vs baseline most accurate.", citationIDs: ["aap_concept"]),
            AttributedBullet("Labs reserved for moderate–severe or atypical: BMP (Na, K, BUN, glucose), bicarbonate (acidosis), urine specific gravity.", citationIDs: ["openrn_peds"])
        ],
        priorityAssessments: [
            AttributedBullet("Weight comparison to recent baseline if available — most accurate severity measure.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Mental status, vital signs, peripheral perfusion, capillary refill.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Mucous membranes, tears (when crying), fontanelle (in infants), eyes (sunken).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Number of wet diapers in last 24 hr.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hourly I&O in moderate–severe.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("ORAL REHYDRATION THERAPY (ORT) is FIRST-LINE for mild–moderate — Pedialyte or ORS; small frequent volumes (5 mL every few minutes initially), increase as tolerated.", citationIDs: ["aap_concept"]),
            AttributedBullet("Goal: 50 mL/kg over 4 hours for moderate dehydration; reassess frequently.", citationIDs: ["aap_concept"]),
            AttributedBullet("AVOID: plain water (hyponatremia risk in infants), juice/soda (hyperosmolar, worsens diarrhea), sports drinks (high sugar, low electrolyte ratio).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Continue breastfeeding/formula throughout (unless severe vomiting; resume ASAP).", citationIDs: ["aap_concept"]),
            AttributedBullet("Resume normal age-appropriate diet as soon as tolerated; BRAT diet historical and not recommended (insufficient calories).", citationIDs: ["aap_concept"]),
            AttributedBullet("Consider ondansetron (4 mg ODT or 0.15 mg/kg) for vomiting to facilitate ORT (single dose proven effective).", citationIDs: ["aap_concept"]),
            AttributedBullet("Severe / failed ORT / shock → IV ISOTONIC FLUID (NS or LR) 20 mL/kg bolus, repeat × 3 if needed; reassess between boluses.", citationIDs: ["aap_concept", "pals_concept"]),
            AttributedBullet("Replace deficit + maintenance + ongoing losses; gradual sodium correction in hyper-/hyponatremia (no faster than 0.5 mEq/L/hr) to avoid demyelination/cerebral edema.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Anti-diarrheal agents (loperamide) NOT recommended in young children.", citationIDs: ["aap_concept"]),
            AttributedBullet("Probiotics may shorten diarrhea duration (Lactobacillus, S. boulardii).", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("Hypovolemic shock — late finding (compensated tachycardia precedes hypotension).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hypernatremic dehydration — cerebral edema with rapid free-water replacement; correct slowly.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hyponatremic dehydration — seizures, demyelination with rapid sodium correction.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Acute kidney injury, hypoglycemia (especially in infants).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Inappropriate formula preparation (over-/under-diluted) — ask specifically; common cause of dyselectrolyte.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Bloody diarrhea, severe abdominal pain, persistent fever — suggest bacterial enteritis or surgical pathology; further workup.", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept, palsConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cystic Fibrosis

public enum CysticFibrosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cystic-fibrosis",
        title: "Cystic Fibrosis (CF)",
        subtitle: "Autosomal recessive · CFTR mutation · multisystem disease",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        definition: AttributedProse(
            "Autosomal recessive disorder caused by mutations in the CFTR gene → defective chloride transport across epithelial cells → thick viscous secretions in lungs, pancreas, intestines, sweat glands, hepatobiliary system. Median survival now into the 50s with modern care including CFTR modulators (e.g., elexacaftor-tezacaftor-ivacaftor / Trikafta).",
            citationIDs: ["openrn_peds", "aap_concept"]
        ),
        pathophysiology: AttributedProse(
            "CFTR dysfunction → impaired chloride/bicarbonate secretion and water transport. Lung: thick mucus → airway obstruction, chronic infection (Pseudomonas, S. aureus, B. cepacia), bronchiectasis, respiratory failure. Pancreas: ductal obstruction → exocrine insufficiency, malabsorption, eventual diabetes. GI: meconium ileus, distal intestinal obstruction. Sweat: high sodium chloride content (basis of diagnostic test).",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("Newborn screening (universal in U.S.) — elevated immunoreactive trypsinogen + CFTR mutation testing.", citationIDs: ["aap_concept"]),
            AttributedBullet("Meconium ileus in newborn (15%).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Salty-tasting skin (parents notice when kissing baby).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Failure to thrive, steatorrhea (foul-smelling, bulky, fatty stools).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Recurrent respiratory infections, chronic productive cough, wheezing, clubbing.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Chronic sinusitis, nasal polyps.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Distal intestinal obstruction syndrome (DIOS), rectal prolapse, hepatobiliary disease.", citationIDs: ["openrn_peds"]),
            AttributedBullet("CF-related diabetes (typically in adolescence/adulthood).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Male infertility (congenital absence of vas deferens), reduced female fertility.", citationIDs: ["openrn_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Newborn screening (IRT + DNA panel) → confirmatory SWEAT CHLORIDE TEST (≥60 mmol/L diagnostic; 30–59 intermediate; <30 normal in adults).", citationIDs: ["aap_concept"]),
            AttributedBullet("Genetic testing for CFTR mutations.", citationIDs: ["aap_concept"]),
            AttributedBullet("Pancreatic function: fecal elastase low.", citationIDs: ["openrn_peds"])
        ],
        priorityAssessments: [
            AttributedBullet("Pulmonary status — daily, more frequent during exacerbations; trend FEV₁.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Nutrition — daily weight; growth percentiles; high caloric needs (120–150% RDA).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Glucose monitoring (CFRD develops in adolescence).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Mental health — chronic illness burden; depression and anxiety common.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Adherence assessment — complex daily regimen.", citationIDs: ["openrn_peds"])
        ],
        commonInterventions: [
            AttributedBullet("CFTR MODULATORS — elexacaftor-tezacaftor-ivacaftor (Trikafta) for eligible mutations; transformative effect on lung function and survival.", citationIDs: ["aap_concept"]),
            AttributedBullet("AIRWAY CLEARANCE: chest physiotherapy (vibrating vest, manual percussion + postural drainage), positive expiratory pressure devices, autogenic drainage; multiple times per day.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Nebulized therapies: hypertonic saline (3–7%), dornase alfa (Pulmozyme — DNase), inhaled bronchodilators.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Inhaled antibiotics for chronic Pseudomonas (tobramycin, aztreonam — alternating months).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Pulmonary EXACERBATION: IV antibiotics (often 14+ days; cover Pseudomonas with two agents from different classes), intensified airway clearance, nutritional support.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Nutrition: pancreatic enzyme replacement with EVERY meal/snack (Creon, Zenpep); fat-soluble vitamin supplementation (ADEK); high-calorie/high-fat diet; G-tube if needed.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Salt supplementation, especially in heat/exercise (high sweat sodium losses).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Lung transplantation for end-stage disease.", citationIDs: ["openrn_peds"]),
            AttributedBullet("CF-specific care center; multidisciplinary team (pulm, GI, endo, RD, RT, social work, psych).", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("Pulmonary exacerbation — increased cough, sputum, dyspnea, weight loss, fever, declining FEV₁.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Pseudomonas, Burkholderia cepacia colonization — strict infection control between CF patients (no co-mingling, dedicated equipment).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hemoptysis, pneumothorax — life-threatening complications.", citationIDs: ["openrn_peds"]),
            AttributedBullet("CF-related diabetes — screen annually with OGTT after age 10.", citationIDs: ["openrn_peds"]),
            AttributedBullet("DIOS, pancreatitis, hepatobiliary disease.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Mental health — depression, anxiety; treatment burden; transition to adult care.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Genetic counseling for family — autosomal recessive (1 in 4 risk per pregnancy).", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric Fever Workup / Sepsis

public enum PediatricFeverSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-fever-workup",
        title: "Pediatric Fever and Sepsis Recognition",
        subtitle: "Age-stratified workup · don't miss serious bacterial infection",
        nclexTags: pedsInfectionTags,
        definition: AttributedProse(
            "Fever (rectal ≥38.0°C / 100.4°F) in a young child is a common chief complaint and most often viral, but workup is age-stratified because risk of serious bacterial infection (SBI: bacteremia, UTI, meningitis, pneumonia) varies dramatically with age. Pediatric sepsis recognition saves lives.",
            citationIDs: ["openrn_peds", "aap_concept"]
        ),
        pathophysiology: AttributedProse(
            "Young infants (<28 days) lack mature immune defense; SBI rate ~10%. As infants mature and receive vaccines (Hib, pneumococcal), SBI incidence falls. Sepsis cascade similar to adults but compensatory mechanisms in pediatrics make hypotension a LATE sign.",
            citationIDs: ["openrn_peds"]
        ),
        presentation: [
            AttributedBullet("Fever ≥38.0°C rectal (most reliable in <3 months); axillary/tympanic less sensitive.", citationIDs: ["aap_concept"]),
            AttributedBullet("Toxic appearance: lethargy, poor perfusion, irritability, poor feeding, weak cry.", citationIDs: ["aap_concept"]),
            AttributedBullet("Yale Observation Scale identifies severity (quality of cry, reaction to parent stimulation, state, color, hydration, response to social cues).", citationIDs: ["openrn_peds"]),
            AttributedBullet("PEDIATRIC SEPSIS: tachycardia (or bradycardia in neonates), tachypnea, fever or hypothermia, abnormal WBC, AMS, poor perfusion (cap refill >2 sec, mottled, cool extremities), oliguria, HYPOTENSION IS LATE.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Petechial/purpuric rash → consider meningococcemia → urgent.", citationIDs: ["openrn_peds"])
        ],
        diagnosticCriteria: [
            AttributedBullet("AGE-STRATIFIED workup (general principles; specific protocols vary):", citationIDs: ["aap_concept"]),
            AttributedBullet("0–28 days, ANY fever: full workup — CBC, blood culture, UA + urine culture, LP, CXR (if respiratory symptoms); admit; empiric IV antibiotics (ampicillin + gentamicin or cefotaxime).", citationIDs: ["aap_concept"]),
            AttributedBullet("29–60 days: blood culture, UA + urine culture; LP based on risk score (Step-by-Step, PECARN, AAP); consider admission; antibiotics if not low-risk.", citationIDs: ["aap_concept"]),
            AttributedBullet("3–36 months, well-appearing immunized child with fever <39°C: observation often sufficient.", citationIDs: ["aap_concept"]),
            AttributedBullet("Fever ≥39°C in girls <2, uncircumcised boys <1, all <6 months → UA + urine culture for occult UTI.", citationIDs: ["aap_concept"]),
            AttributedBullet("Toxic appearance at any age → full sepsis workup + IV antibiotics + admission.", citationIDs: ["aap_concept"])
        ],
        priorityAssessments: [
            AttributedBullet("Rectal temperature in <3 months for accuracy.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Vital signs with age-appropriate norms; peripheral perfusion (cap refill).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Mental status — alert, interactive, consolable.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Hydration — wet diapers, mucous membranes, fontanelle.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Source of fever — exam thoroughly (ears, throat, lungs, abdomen, GU, joints, skin).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Immunization status — affects bacterial workup recommendations.", citationIDs: ["aap_concept"])
        ],
        commonInterventions: [
            AttributedBullet("Antipyretic for COMFORT (not to prevent seizure or alter outcome) — acetaminophen 10–15 mg/kg q4–6h or ibuprofen 10 mg/kg q6h (>6 months).", citationIDs: ["aap_concept"]),
            AttributedBullet("AVOID aspirin (Reye syndrome).", citationIDs: ["aap_concept"]),
            AttributedBullet("Hydration — frequent small fluids; ORS for dehydration.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Sepsis bundle (PEDIATRIC): recognize, broad-spectrum antibiotics within 1 hour, fluid resuscitation 20 mL/kg NS or LR boluses up to 60 mL/kg (more cautious in cardiac disease, hepatic, renal), vasopressors if fluid-refractory (epinephrine first-line in pediatric septic shock; dopamine/norepinephrine alternatives), admit to PICU.", citationIDs: ["openrn_peds", "pals_concept"]),
            AttributedBullet("Source-specific antibiotics once identified.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Education for caregivers — temperature measurement, when to seek care, fever myths (no harm at usual heights, antipyretic for comfort).", citationIDs: ["openrn_peds"])
        ],
        watchFor: [
            AttributedBullet("Toxic appearance — overrides 'low-risk' lab criteria; treat as septic until proven otherwise.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Petechial/purpuric rash with fever → meningococcemia consideration; urgent.", citationIDs: ["openrn_peds"]),
            AttributedBullet("HSV in neonates — vesicles, seizures, transaminitis, sepsis-like picture; empiric acyclovir in unwell <60-day infants.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Febrile seizures (6 months – 5 years) — usually benign; rule out CNS infection if atypical.", citationIDs: ["openrn_peds"]),
            AttributedBullet("Kawasaki disease (≥5 days fever).", citationIDs: ["openrn_peds"]),
            AttributedBullet("Shock — hypotension is LATE in pediatrics; act on perfusion changes earlier.", citationIDs: ["openrn_peds"])
        ],
        citations: [openrnPeds, aapConcept, palsConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}
