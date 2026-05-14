import Foundation

// Curator-model diagnoses (round 38 part B — general pediatric).

private let openrnPedsR38B = CitationSource(
    id: "openrn_peds_r38b",
    shortName: "Open RN Pediatric Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pediatricnursing/",
    lastRetrieved: "2026-05-13"
)
private let cdcPedsR38B = CitationSource(
    id: "cdc_peds_r38b",
    shortName: "CDC + AAP + NIH concept citations",
    publisher: "CDC · AAP · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyPedsR38B = CitationSource(
    id: "specialty_peds_r38b",
    shortName: "AAP + IDSA + ATS + ASH + AUA fact citations",
    publisher: "AAP · IDSA · ATS · ASH · AUA",
    license: .factCitationOnly,
    url: "https://www.aap.org/",
    lastRetrieved: "2026-05-13"
)

private let pedsRespTagsR38B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .gasExchange
)
private let pedsIDTagsR38B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .infection
)
private let pedsHemeTagsR38B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .clottingHemostasis
)
private let pedsGITagsR38B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .physiologicalAdaptation,
    priorityConcept: .elimination
)

public enum PediatricAsthmaExacerbationSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-asthma-exacerbation",
        title: "Pediatric asthma exacerbation",
        subtitle: "Acute wheezing + air trapping · severity stratification (mild/moderate/severe/imminent arrest) · O2 + bronchodilators + steroids · admission criteria · status asthmaticus",
        nclexTags: pedsRespTagsR38B,
        definition: AttributedProse(
            "Pediatric asthma — chronic airway inflammation + reversible obstruction + bronchial hyperresponsiveness; affects ~6 million US children. Exacerbations characterized by acute worsening of dyspnea + cough + wheeze + chest tightness. Severity stratification (Pediatric Respiratory Assessment Measure — PRAM, modified Pulmonary Index Score) guides management. STATUS ASTHMATICUS — life-threatening exacerbation refractory to standard therapy requiring ICU. Triggers — viral URI (most common in pediatrics), allergens, exercise, irritants, weather, stress per primary source.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        pathophysiology: AttributedProse(
            "Type 2 (eosinophilic) inflammation predominant in pediatric — IgE-mediated allergic + helminth response, IL-4/5/13, eosinophils, mast cells. Acute exacerbation — bronchospasm + airway edema + mucus hypersecretion → airflow obstruction → air trapping → V/Q mismatch + hypoxia + respiratory acidosis (late).",
            citationIDs: ["specialty_peds_r38b"]
        ),
        presentation: [
            AttributedBullet("Worsening respiratory symptoms — cough (often nocturnal), wheeze, dyspnea, chest tightness; usually triggered by URI in children.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Increased work of breathing — accessory muscle use (sternocleidomastoid, intercostal, subcostal retractions), nasal flaring, tripoding, head bobbing (infants).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Auscultation — wheezing (expiratory then inspiratory + expiratory in worsening); SILENT CHEST is OMINOUS sign of severe obstruction (no air movement); prolonged expiratory phase.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Severity grading: MILD — wheezing only with expiration, mild dyspnea, normal mental status, SpO2 >95%; MODERATE — wheezing throughout exhalation + inspiration, moderate dyspnea, decreased speech, accessory muscle use, SpO2 92-95%; SEVERE — wheezing audible without stethoscope, cannot complete sentences, marked accessory muscle use, lethargy/agitation, SpO2 <92%; IMMINENT RESPIRATORY ARREST — paradoxical thoracoabdominal movement, cyanosis, decreased LOC, silent chest.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Vital signs — tachycardia (drug + hypoxia), tachypnea, normal or rising CO2 (late = ominous), hypoxia.", citationIDs: ["specialty_peds_r38b"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis based on history + exam; severity assessed by PRAM, modified Pulmonary Index Score, or PASS.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Pulse oximetry — hypoxia indicates severity; normal does not rule out severe (early in obstruction).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Peak flow (>5 yr cooperative) — <50% predicted = severe; trends with treatment.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ABG — usually NOT needed; if obtained — early hyperventilation (low CO2), late respiratory acidosis (rising CO2) = ominous; severe acidosis or hypoxia despite treatment.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CXR — NOT routine; reserve for suspected pneumonia, foreign body, pneumothorax, atelectasis, first-time wheeze in young child.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Labs — generally not needed; consider CBC if febrile, blood gas if severe, electrolytes if dehydrated.", citationIDs: ["specialty_peds_r38b"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity stratification — PRAM/PASS scores guide intensity of treatment + admission.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Trigger identification — viral URI, allergen, exercise; address modifiable.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Adherence to controller therapy — long-term control depends; review technique + compliance.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Asthma action plan — written individualized plan; family education; school distribution.", citationIDs: ["specialty_peds_r38b"])
        ],
        commonInterventions: [
            AttributedBullet("OXYGEN — supplemental to maintain SpO2 ≥92-94%; nasal cannula → simple mask → non-rebreather → high-flow → BiPAP/intubation as needed.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("SHORT-ACTING BETA-2 AGONIST (SABA) — Albuterol nebulizer 2.5-5 mg Q20 min × 3 doses (continuous in severe — 10-15 mg/hr); MDI with spacer alternative (4-8 puffs Q20 min).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("IPRATROPIUM (anticholinergic) — Atrovent 0.25-0.5 mg neb added to first 3 SABA doses for moderate-severe; reduces hospitalization.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CORTICOSTEROIDS — early systemic steroids (within 1 hr) for moderate-severe; prednisone 1-2 mg/kg PO (max 60 mg) × 5 days OR dexamethasone 0.6 mg/kg PO/IV/IM single dose (or 2 doses 24 hr apart) — equivalent + better palatability + adherence.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("MAGNESIUM SULFATE — 25-50 mg/kg IV (max 2g) over 20 min for severe + refractory exacerbations; bronchodilator effect.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("EPINEPHRINE 0.01 mg/kg IM (max 0.5 mg) — for severe + impending arrest; especially helpful if anaphylactic component.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("HELIOX (helium-oxygen 70:30 or 80:20) — adjunct in severe + impending arrest; reduces work of breathing.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("INTUBATION — last resort; predict difficulty (high airway pressures); ketamine for induction (bronchodilator); avoid neuromuscular blockade if possible.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ICU admission — severe + impending arrest + requiring continuous bronchodilator + steroids + multiple medications.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Discharge — once SpO2 >92% on RA, normal RR, minimal accessory muscle use, response to SABA Q4h, asthma action plan + follow-up; consider longer observation in young child.", citationIDs: ["specialty_peds_r38b"])
        ],
        watchFor: [
            AttributedBullet("STATUS ASTHMATICUS — refractory to standard therapy; ICU + intubation considered; high mortality.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RESPIRATORY ARREST — silent chest + decreased LOC + paradoxical thoracoabdominal movement = imminent; intubate.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PNEUMOTHORAX / PNEUMOMEDIASTINUM — air trapping + barotrauma; CXR + chest tube if pneumothorax.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FOREIGN BODY ASPIRATION — first-time wheeze in young child + sudden onset; bronchoscopy.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ANAPHYLAXIS — wheezing + urticaria + hypotension + multisystem; epinephrine first-line.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Concurrent pneumonia — CXR + targeted antibiotics; common with viral URI trigger.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FATAL ASTHMA risk factors — prior intubation, recent ED visits, hospital admissions, ICU, oral steroid use, no controller therapy, low SES, depression, comorbidities.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("LONG-TERM CONTROL — inhaled corticosteroid (ICS) primary controller; review technique + adherence; step-up therapy + add LABA/LTRA/biologics as needed.", citationIDs: ["specialty_peds_r38b"])
        ],
        citations: [openrnPedsR38B, cdcPedsR38B, specialtyPedsR38B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricPharyngitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-pharyngitis",
        title: "Pediatric pharyngitis (strep)",
        subtitle: "Group A strep (GAS) most concerning bacterial · McIsaac/Centor criteria · rapid antigen + culture · penicillin first-line · prevent rheumatic fever",
        nclexTags: pedsIDTagsR38B,
        definition: AttributedProse(
            "Pediatric pharyngitis (sore throat) — common chief complaint. ~70-90% viral (rhinovirus, adenovirus, EBV, COVID); GROUP A STREPTOCOCCUS (GAS) most concerning bacterial cause (~15-30% of pediatric pharyngitis vs 5-15% adult); diagnosis distinguishing GAS from viral important to initiate antibiotics + prevent ACUTE RHEUMATIC FEVER (ARF). McIsaac/Centor criteria + rapid antigen detection test (RADT) + throat culture guide diagnosis per primary source.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        pathophysiology: AttributedProse(
            "GAS (Streptococcus pyogenes) — beta-hemolytic gram-positive cocci; M protein virulence factor + various exotoxins; clinically — exudative tonsillopharyngitis. RHEUMATIC FEVER from molecular mimicry between bacterial M protein + cardiac/joint/CNS antigens; develops 2-3 weeks after untreated GAS pharyngitis; antibiotics within 9 days of infection prevents.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        presentation: [
            AttributedBullet("Sudden-onset sore throat + odynophagia.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Fever (often >38°C/101°F) + headache + abdominal pain (especially young children) + nausea/vomiting (especially preschool).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Examination — tonsillar exudate (white-yellow patches), erythema, edema; soft palate petechiae (petechiae on uvula); tender anterior cervical lymphadenopathy; SCARLATINA RASH (sandpaper, accentuated in flexures, circumoral pallor) suggests scarlet fever; strawberry tongue.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ABSENT classical features — cough, rhinorrhea, conjunctivitis, hoarseness, oral ulcers, mild diarrhea (suggests viral over bacterial).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Mononucleosis (EBV) — fatigue + posterior cervical LAD + splenomegaly + hepatomegaly; can mimic GAS but treatment different.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Coxsackievirus (HFM, herpangina) — vesicles/ulcers on palate or tongue + hand-foot-mouth distribution.", citationIDs: ["specialty_peds_r38b"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CENTOR CRITERIA (modified McIsaac for age) — Fever >38°C (1), Absence of cough (1), Tender anterior cervical LAD (1), Tonsillar exudate/swelling (1), Age (3-14 yr +1, 15-44 yr 0, ≥45 yr -1).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Score interpretation — 0-1: low risk, no testing/antibiotics; 2-3: rapid antigen test (RADT) + treat if positive; 4+: empirically test + treat OR test + culture if negative RADT.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RAPID ANTIGEN DETECTION TEST (RADT) — high specificity (>95%), moderate sensitivity (70-90%); negative RADT in children should be confirmed by THROAT CULTURE (gold standard, 90-95% sensitive).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("MOLECULAR (PCR) — increasingly used; high sensitivity + specificity; faster than culture.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ASO TITER — for retrospective diagnosis (rheumatic fever workup); not acute diagnostic.", citationIDs: ["specialty_peds_r38b"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity assessment — airway compromise (rare) + dehydration + ability to swallow secretions.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Test indication — Centor 2+ in pediatrics; do NOT treat empirically based on symptoms alone.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Confirm GAS — RADT or culture; treat positive with antibiotics; negative typically viral.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Allergy history — penicillin allergy is significant factor in antibiotic choice.", citationIDs: ["specialty_peds_r38b"])
        ],
        commonInterventions: [
            AttributedBullet("PENICILLIN V (oral) — 250 mg PO BID-TID (≤27 kg) OR 500 mg PO BID-TID (>27 kg) × 10 DAYS; first-line for GAS; full 10-day course to prevent ARF.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("AMOXICILLIN — 50 mg/kg PO once daily (max 1g) × 10 days; better palatability; equally effective; preferred in pediatrics.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BENZATHINE PENICILLIN G — single IM dose (600,000 units <27 kg, 1.2 million units ≥27 kg); ensures adherence; painful injection.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PENICILLIN ALLERGY (non-anaphylactic) — cephalexin 40 mg/kg/day divided BID × 10 days; cefdinir 14 mg/kg/day × 5-10 days.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PENICILLIN ALLERGY (anaphylactic) — clindamycin 21 mg/kg/day divided TID × 10 days OR azithromycin 12 mg/kg PO once daily × 5 days; resistance increasing for macrolides.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Symptomatic care — acetaminophen + ibuprofen for fever + pain; warm fluids + soft foods; salt water gargle (older children); throat lozenges (>3 yr); humidification.", citationIDs: ["openrn_peds_r38b"]),
            AttributedBullet("Supportive — hydration; rest; return-to-school 24 hours after starting antibiotics + afebrile.", citationIDs: ["openrn_peds_r38b"]),
            AttributedBullet("Family education — full antibiotic course critical; identify drug allergy + new toothbrush after 24 hr antibiotic; recurrence + carrier states.", citationIDs: ["specialty_peds_r38b"])
        ],
        watchFor: [
            AttributedBullet("ACUTE RHEUMATIC FEVER (ARF) — 2-3 weeks post-untreated GAS; carditis + arthritis + chorea + erythema marginatum + subcutaneous nodules; Jones criteria; long-term prophylactic penicillin × 5-10 years OR until age 21.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("POST-STREPTOCOCCAL GLOMERULONEPHRITIS — 1-2 weeks post-GAS; hematuria + proteinuria + hypertension + edema; supportive care; usually resolves.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PERITONSILLAR ABSCESS — \"hot potato voice\", trismus, deviated uvula, severe pain, fever; ENT consultation + drainage + antibiotics.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RETROPHARYNGEAL / PARAPHARYNGEAL ABSCESS — CT diagnosis; surgical drainage; airway concern.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("LEMIERRE SYNDROME — Fusobacterium pharyngitis + jugular venous thrombosis + septic pulmonary emboli; rare but serious.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PANDAS / PANS — pediatric autoimmune neuropsychiatric disorders associated with strep; OCD/tics post-strep; controversial.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CHRONIC GAS CARRIER state (~10-20% of children) — does NOT require treatment in absence of acute symptoms; not transmissible same way as acute infection.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RECURRENT GAS pharyngitis — same antibiotic class typically; consider tonsillectomy if frequent (≥6/yr or 4/yr × 2 yr or 3/yr × 3 yr — Paradise criteria).", citationIDs: ["specialty_peds_r38b"])
        ],
        citations: [openrnPedsR38B, cdcPedsR38B, specialtyPedsR38B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricUTISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-uti",
        title: "Pediatric UTI",
        subtitle: "Most common occult source in young infant fever · UA + urine culture · cephalexin/amoxicillin/cefdinir outpatient · imaging (US first; VCUG indications) · prevent renal scarring",
        nclexTags: pedsIDTagsR38B,
        definition: AttributedProse(
            "Pediatric UTI — bacterial infection of urinary tract; common cause of pediatric fever (5-7% of febrile infants <2 yr); most common occult source in fever without source. Higher risk in females (anatomic), uncircumcised males <2 yr, vesicoureteral reflux (VUR), constipation, voiding dysfunction. Untreated pyelonephritis can cause RENAL SCARRING + future hypertension + ESRD. Prompt diagnosis + appropriate antibiotics + selective imaging per primary source.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        pathophysiology: AttributedProse(
            "Ascending infection from periurethral colonization (fecal flora) → bladder (cystitis) → ureters (vesicoureteral reflux risk) → kidneys (pyelonephritis) → renal scarring + abscess. Common pathogens — E. coli (~80%), Klebsiella, Proteus, Enterococcus, occasionally Pseudomonas + Staph saprophyticus (adolescent female).",
            citationIDs: ["specialty_peds_r38b"]
        ),
        presentation: [
            AttributedBullet("INFANT (<2 yr) — fever often only sign; nonspecific symptoms (irritability, poor feeding, vomiting, lethargy, jaundice in newborn); no classic dysuria.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("TODDLER + PRESCHOOL — fever, abdominal/flank pain, vomiting, irritability; new-onset enuresis/incontinence in toilet-trained child.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("SCHOOL-AGE + ADOLESCENT — classic adult symptoms — dysuria, frequency, urgency, suprapubic/flank pain; pyelonephritis = fever + flank pain + CVA tenderness.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Cloudy/foul-smelling urine + hematuria.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Sepsis — neonate especially; toxic appearance + hypotension + altered mental status.", citationIDs: ["specialty_peds_r38b"])
        ],
        diagnosticCriteria: [
            AttributedBullet("URINE COLLECTION method critical — STERILE method for diagnosis: catheterized specimen (preferred in toilet-trained <2 yr OR ill), suprapubic aspiration (most reliable, neonates), midstream clean catch (cooperative + properly cleaned, older children); BAG specimen has high contamination — useful for SCREENING only (negative rules out, positive needs confirmation).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("URINALYSIS — pyuria (≥10 WBC/hpf), positive leukocyte esterase + nitrites, bacteria; sensitivity ~85% for UTI.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("URINE CULTURE — gold standard; ≥50,000 CFU/mL of single organism from catheterized specimen OR suprapubic aspirate diagnostic; ≥100,000 CFU/mL from midstream + symptoms diagnostic.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CBC + blood culture if febrile + ill-appearing; consider procalcitonin/CRP.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BMP if pyelonephritis or pre-antibiotic; assess renal function.", citationIDs: ["specialty_peds_r38b"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity — ill vs well-appearing; pyelonephritis vs cystitis; need for hospitalization vs outpatient.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Etiology — first vs recurrent; underlying anatomic/functional abnormality (VUR, neurogenic bladder, constipation).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Imaging indications — first febrile UTI in <2 yr; recurrent UTI; suspected anatomic abnormality.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Long-term plan — voiding hygiene + constipation management + recurrence prevention.", citationIDs: ["specialty_peds_r38b"])
        ],
        commonInterventions: [
            AttributedBullet("OUTPATIENT (afebrile cystitis OR well-appearing pyelonephritis with reliable follow-up) — CEPHALEXIN 50-100 mg/kg/day divided QID × 7-10 days OR amoxicillin-clavulanate (40 mg/kg/day amox component divided BID) × 7-10 days OR cefdinir 14 mg/kg/day BID × 7-10 days; TMP-SMX 6-12 mg/kg TMP/day divided BID × 7-10 days IF E. coli sensitive (resistance increasing).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("INPATIENT (toxic, febrile <60 days, intolerable PO, complex history) — IV ceftriaxone 50-75 mg/kg/day OR ampicillin + gentamicin (neonates); transition to PO when clinically improved.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("DURATION — cystitis 5-7 days; pyelonephritis 10-14 days; complicated longer.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Hydration — encourage PO; IV if dehydrated.", citationIDs: ["openrn_peds_r38b"]),
            AttributedBullet("Antipyretics + analgesics — acetaminophen + ibuprofen for comfort + fever.", citationIDs: ["openrn_peds_r38b"]),
            AttributedBullet("FOLLOW-UP — culture review at 48-72 hr; clinical response; recurrence assessment.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Imaging — RENAL ULTRASOUND for first febrile UTI in <2 yr (assess for hydronephrosis, structural abnormality); VCUG (voiding cystourethrogram) if abnormal US OR recurrent UTI OR atypical clinical course OR family history of VUR.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Address constipation, voiding dysfunction (toilet training, scheduled voiding, biofeedback), perineal hygiene (front-to-back wiping), avoid bubble baths, cotton underwear.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Recurrent UTI prevention — depends on cause; antibiotic prophylaxis (TMP-SMX or nitrofurantoin) for high-grade VUR or frequent recurrence; cranberry inconclusive evidence.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Family education — full antibiotic course, recognize recurrence, prevent (hygiene, voiding, hydration, constipation management), follow-up.", citationIDs: ["openrn_peds_r38b"])
        ],
        watchFor: [
            AttributedBullet("PYELONEPHRITIS — fever + flank pain + CVA tenderness; renal scarring risk; longer antibiotic course + close monitoring.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RENAL SCARRING — from untreated/recurrent pyelonephritis; future HTN + ESRD; prompt treatment + recurrence prevention.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("VESICOURETERAL REFLUX (VUR) — graded I-V; high-grade increases recurrence + scarring risk; antibiotic prophylaxis vs surgical correction (Deflux injection, ureteral reimplantation).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RENAL ABSCESS — persistent fever despite antibiotics; CT diagnosis; drainage + extended antibiotics.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("UROSEPSIS — toxic appearance + hypotension; ICU + broad-spectrum antibiotics + fluid resuscitation.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Recurrent UTI evaluation — voiding dysfunction + constipation common contributors; address!", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Antimicrobial resistance — increasing E. coli resistance to TMP-SMX + ampicillin; check local antibiogram + tailor therapy.", citationIDs: ["specialty_peds_r38b"])
        ],
        citations: [openrnPedsR38B, cdcPedsR38B, specialtyPedsR38B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ForeignBodyAspirationSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "foreign-body-aspiration",
        title: "Pediatric foreign body aspiration",
        subtitle: "Toddler 1-3 yr peak · sudden choking + cough + decreased breath sounds + wheeze · CXR (often normal) · BRONCHOSCOPY definitive · prevent — small/round food + toys",
        nclexTags: pedsRespTagsR38B,
        definition: AttributedProse(
            "Foreign body aspiration (FBA) — inhaled object lodged in airway; affects ~17,000 children annually; peak age 1-3 years (oral exploration + dentition). Mortality ~1-3% from asphyxia. Common objects — peanuts, raw carrots, hot dogs, grapes, popcorn, beads, balloons, toy parts, button batteries (HIGH RISK — caustic). Time-critical — complete obstruction is FATAL within minutes; partial obstruction can persist + cause delayed symptoms (chronic cough, recurrent pneumonia) per primary source.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        pathophysiology: AttributedProse(
            "Aspirated object lodges in airway — most common in mainstem bronchi (right > left in older children due to less acute angle; equal in younger); can also be tracheal (life-threatening) or laryngeal (acute obstruction). Complete obstruction = no air exchange = asphyxia. Partial obstruction = air can pass but causes inflammation + edema + post-obstructive pneumonia + atelectasis + bronchiectasis if chronic.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        presentation: [
            AttributedBullet("CLASSIC TRIAD (only ~50% complete) — sudden coughing/choking + decreased breath sounds (unilateral) + wheeze (unilateral or focal); all three present in ~50% of cases.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ACUTE — sudden onset of choking, gagging, coughing, cyanosis during eating/playing; may resolve transiently then have ongoing intermittent symptoms.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("DELAYED (hours-days-weeks) — chronic cough, persistent wheeze, recurrent pneumonia (especially same lobe), unexplained dyspnea.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("LARYNGOTRACHEAL (object above carina) — biphasic stridor, severe respiratory distress, voice change, complete obstruction risk.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BRONCHIAL (most common location) — focal wheeze, decreased breath sounds, cough, +/- hypoxia.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BUTTON BATTERY ingestion (esophageal) — particularly dangerous — caustic injury within hours; emergency endoscopy <2 hr.", citationIDs: ["specialty_peds_r38b"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HIGH INDEX OF SUSPICION — witnessed choking event OR sudden respiratory symptoms in toddler should prompt evaluation.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CHEST X-RAY — usually NEGATIVE in FBA (most objects are radiolucent — food); may show hyperinflation (air trapping distal to obstruction) on EXPIRATORY film, atelectasis, post-obstructive pneumonia, mediastinal shift; LATERAL DECUBITUS may show non-collapse of dependent lung.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("INSPIRATORY + EXPIRATORY CXR (or bilateral lateral decubitus) — air trapping = positive sign of bronchial obstruction.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BRONCHOSCOPY — DEFINITIVE diagnosis + treatment; rigid bronchoscopy preferred for FBA in pediatrics (better visualization + extraction); flexible if equivocal.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Chest CT — if bronchoscopy not available + clinical suspicion high; better for radiolucent objects + chronic findings.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Esophageal foreign body — different from airway; CXR for radiopaque (coins, batteries); barium swallow + endoscopy if non-radiopaque.", citationIDs: ["specialty_peds_r38b"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway status — complete obstruction = ASPHYXIA in minutes; immediate Heimlich maneuver if witnessed acute choking.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Time of suspicion — recent vs delayed; affects bronchoscopy urgency.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Object type — button battery is emergency, organic objects (peanut) cause more inflammation, sharp objects more dangerous.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Pre-bronchoscopy preparation — NPO, IV access, anesthesia consultation.", citationIDs: ["specialty_peds_r38b"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE COMPLETE OBSTRUCTION (witnessed choking, can't speak/cough/breathe) — INFANT (<1 yr): 5 back blows + 5 chest thrusts (alternating); CHILD (>1 yr): Heimlich maneuver (abdominal thrusts); CALL 911; CPR if unresponsive.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("DO NOT do blind finger sweep — may push object deeper; only remove visible object.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ED management — supplemental O2, IV access, NPO, urgent bronchoscopy consultation; transfer to pediatric center if needed.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RIGID BRONCHOSCOPY under general anesthesia — definitive treatment; ENT or pediatric pulmonology + pediatric anesthesia.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BUTTON BATTERY in esophagus — emergency endoscopic removal <2 hr (caustic injury); honey 10 mL Q10 min × 3 doses can buffer (>1 yr) prior to scope (NOT for symptoms of perforation).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Post-bronchoscopy — observation for laryngospasm + bronchospasm + edema; nebulized racemic epinephrine if stridor; steroids selected; chest X-ray to confirm complete removal + no pneumothorax.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PREVENTION — age-appropriate foods (no whole grapes, hot dogs cut in halves/quarters, no nuts <4 yr, no popcorn <4 yr); supervise eating; sit while eating; small toys + button batteries out of reach; CPR + first aid training for caregivers.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Family education + counseling.", citationIDs: ["openrn_peds_r38b"])
        ],
        watchFor: [
            AttributedBullet("ASPHYXIA + DEATH — complete obstruction within minutes; immediate Heimlich + CPR.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("LARYNGOSPASM post-bronchoscopy — racemic epinephrine + supportive.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BUTTON BATTERY — esophageal injury within HOURS; surgical emergency.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PNEUMOTHORAX / PNEUMOMEDIASTINUM from bronchoscopy or air trapping.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CHRONIC COMPLICATIONS from delayed diagnosis — recurrent pneumonia, bronchiectasis, atelectasis, lung abscess.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("MISDIAGNOSIS as asthma + viral URI + bronchiolitis — high index of suspicion in toddler with sudden symptoms or recurrent pneumonia in same lobe.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ORGANIC FBA (peanut, popcorn) — more inflammation than inorganic; difficulty with extraction; longer ICU course.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RECURRENT — counsel family on prevention; some children chronically aspirate (neurologic conditions).", citationIDs: ["specialty_peds_r38b"])
        ],
        citations: [openrnPedsR38B, cdcPedsR38B, specialtyPedsR38B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricITPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-itp",
        title: "Pediatric immune thrombocytopenia (ITP)",
        subtitle: "Acute idiopathic thrombocytopenia in well child · post-viral · platelets <100K · most resolve in 6 mo · observation vs IVIG/steroids · WHO bleeding score",
        nclexTags: pedsHemeTagsR38B,
        definition: AttributedProse(
            "Pediatric immune thrombocytopenia (ITP) — autoimmune destruction of platelets resulting in isolated thrombocytopenia (platelets <100,000/μL) in otherwise well child. Acute onset, often post-viral (2-3 weeks after URI, varicella, mumps, COVID); >75% spontaneously resolve within 6 months. Distinct from adult ITP (more chronic, female-predominant, no infectious trigger). Management focused on bleeding prevention, NOT just platelet count per primary source.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        pathophysiology: AttributedProse(
            "Autoantibodies against platelet glycoproteins (GP IIb/IIIa most common) → reticuloendothelial system destruction (spleen, liver) + impaired megakaryocyte production → isolated thrombocytopenia; molecular mimicry from preceding viral infection postulated. Megakaryocytes increased in bone marrow (compensatory response); peripheral smear shows large platelets (early release).",
            citationIDs: ["specialty_peds_r38b"]
        ),
        presentation: [
            AttributedBullet("WELL-APPEARING child (NOT systemically ill) with sudden onset BLEEDING/BRUISING.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PETECHIAE — pinpoint non-blanching red dots; especially over pressure areas.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PURPURA — larger non-blanching purplish-blue patches.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ECCHYMOSIS — bruises out of proportion to trauma.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("MUCOSAL BLEEDING — gum bleeding, epistaxis, oral blood blisters; concerning for higher bleeding risk.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Severe — hematuria, hematemesis, melena, intracranial hemorrhage (rare ~0.5%; serious complication).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ABSENCE of — fever, weight loss, lymphadenopathy, hepatosplenomegaly, bone pain (these suggest leukemia + other systemic illness).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Recent viral illness (URI, varicella, mumps, EBV, hepatitis, COVID) within 2-3 weeks.", citationIDs: ["specialty_peds_r38b"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CBC — ISOLATED thrombocytopenia (platelets <100,000/μL, often <30,000); RBC + WBC normal; if abnormal → suggests other diagnosis (leukemia).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PERIPHERAL SMEAR — large platelets (early release from marrow); RULE OUT atypical cells (leukemia), schistocytes (TTP/HUS), spherocytes (hemolytic anemia).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Coagulation panel — PT/PTT NORMAL (excludes DIC + factor deficiency).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Direct antiglobulin test (DAT) — exclude Evans syndrome (ITP + autoimmune hemolytic anemia).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Bone marrow ASPIRATION — NOT routinely needed in classic pediatric ITP; CONSIDER if atypical features (anemia, leukopenia, organomegaly, suspected leukemia, planned splenectomy, persistent thrombocytopenia despite treatment).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Other workup — HIV, HCV, H. pylori (specific situations), antinuclear antibodies (older girls).", citationIDs: ["specialty_peds_r38b"])
        ],
        priorityAssessments: [
            AttributedBullet("WHO BLEEDING SCORE — Grade 0 (none), Grade 1 (petechiae/bruising), Grade 2 (mucosal), Grade 3 (gross bleeding requiring intervention), Grade 4 (severe/life-threatening).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Management is BLEEDING-DRIVEN, not platelet count alone — Grade 0-1 in well child can be observed regardless of count.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Risk factors for ICH — concurrent trauma, anticoagulation, AVM/aneurysm, severe thrombocytopenia + mucosal bleeding.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Activity restriction + safety — avoid contact sports, helmets for bike/skateboard, no aspirin/NSAIDs/anticoagulants.", citationIDs: ["specialty_peds_r38b"])
        ],
        commonInterventions: [
            AttributedBullet("OBSERVATION — appropriate for asymptomatic OR mild bleeding (WHO Grade 0-1) regardless of platelet count; >75% spontaneously resolve in 6 months; activity restriction + safety; close follow-up.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FIRST-LINE PHARMACOLOGIC (Grade 2+ bleeding OR severe count <10K + risk factors): IVIG 0.8-1 g/kg single dose (response 24-48 hr; works by RES blockade); CORTICOSTEROIDS — prednisone 1-2 mg/kg/day × 1-2 weeks taper OR dexamethasone 0.6 mg/kg × 4 days; ANTI-D IMMUNE GLOBULIN 50-75 mcg/kg IV (Rh-positive, non-splenectomized).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PLATELET TRANSFUSION — only for SEVERE BLEEDING (intracranial, GI, intractable mucosal); platelets quickly destroyed but provide temporary hemostasis; combine with IVIG + steroids.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("SECOND-LINE (chronic ITP, refractory, persistent) — TPO receptor agonists (eltrombopag, romiplostim — increasing use), rituximab, splenectomy (last resort, particularly in pediatrics due to long-term infection risk), immunosuppression.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("EMERGENT (life-threatening bleeding, ICH suspected) — IVIG + IV methylpred 30 mg/kg + platelet transfusion + neurosurgical consultation; high-dose steroids continue for several days.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("VACCINATIONS — live vaccines within 8 months of IVIG should be DELAYED (interferes with response); inactivated OK.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FAMILY EDUCATION — recognize bleeding signs, avoid aspirin/NSAIDs/antiplatelets, activity modification, when to seek emergency care, follow-up plan, importance of head injury vigilance.", citationIDs: ["openrn_peds_r38b"]),
            AttributedBullet("SCHOOL coordination — restrictions; teacher/nurse awareness; emergency action plan.", citationIDs: ["openrn_peds_r38b"])
        ],
        watchFor: [
            AttributedBullet("INTRACRANIAL HEMORRHAGE — rare (~0.5%) but most feared; head injury + severe count + mucosal bleeding = high risk; CT head at low threshold.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CHRONIC ITP (persistent >12 months) — ~25% of pediatric cases; second-line therapies; quality of life impact.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("RECURRENT ITP — relapse after initial resolution; same management approach.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("REFRACTORY ITP — failure to respond to first-line; second-line therapies; specialized hematology care.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("EVANS SYNDROME — ITP + autoimmune hemolytic anemia + neutropenia (variable); harder to treat; specialty management.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("DIFFERENTIAL — leukemia (anemia + WBC abnormalities + organomegaly + bone pain), infection (sepsis + DIC), hereditary thrombocytopenia, Wiskott-Aldrich syndrome, drug-induced; AVOID missing leukemia (pancytopenia + atypical cells).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Long-term — most pediatric ITP resolve spontaneously without chronic complications; family + child reassurance important during the acute period.", citationIDs: ["specialty_peds_r38b"])
        ],
        citations: [openrnPedsR38B, cdcPedsR38B, specialtyPedsR38B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricFUOSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-fuo",
        title: "Pediatric fever of unknown origin (FUO)",
        subtitle: "Fever ≥14 days without diagnosis after standard workup · infections (1/3) + autoimmune (1/3) + malignancy (1/4) + other · multidisciplinary workup",
        nclexTags: pedsIDTagsR38B,
        definition: AttributedProse(
            "Pediatric fever of unknown origin (FUO) — daily fevers ≥38.3°C (101°F) for ≥14 days without identifiable cause despite outpatient evaluation OR ≥1 week inpatient evaluation. Distinguished from fever without source (FWS — acute, age-stratified workup). FUO requires broader workup encompassing infections (1/3), autoimmune/inflammatory (1/3), malignancy (1/4), miscellaneous (factitious, drug, immunodeficiency, undiagnosed). Multidisciplinary approach + iterative workup + careful observation per primary source.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        pathophysiology: AttributedProse(
            "Variable per cause — INFECTIONS (TB, EBV, CMV, occult abscess, osteomyelitis, IE, Lyme, Bartonella) cause sustained fever via cytokine release; AUTOIMMUNE (JIA, SLE, vasculitis, IBD, periodic fever syndromes) via persistent inflammatory pathways; MALIGNANCY (leukemia, lymphoma, neuroblastoma) via tumor-related cytokines; FACTITIOUS via deception or thermometer manipulation.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        presentation: [
            AttributedBullet("Daily fever ≥38.3°C for ≥14 days; pattern matters — quotidian (daily spikes — JIA), tertian (every 3rd day — malaria), continuous (typhoid), Pel-Ebstein (cyclic 1-2 weeks — lymphoma), random (most causes).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CONSTITUTIONAL — fatigue, anorexia, weight loss, night sweats; non-specific.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("LOCALIZING symptoms emerge over time — joint pain (autoimmune), bone pain (malignancy/osteomyelitis), GI symptoms (IBD, abscess, typhoid), respiratory (TB, malignancy), skin findings (vasculitis, lupus, Lyme).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Detailed travel + exposure history — TB, malaria, parasites, zoonoses (Bartonella, brucellosis), insect-borne (Lyme, RMSF).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Systems review repeated frequently — symptoms may emerge late.", citationIDs: ["specialty_peds_r38b"])
        ],
        diagnosticCriteria: [
            AttributedBullet("First-line workup — repeat CBC + CRP + ESR + procalcitonin + comprehensive metabolic + LFTs + LDH + UA + cultures (blood, urine, stool); throat/nasopharyngeal cultures; PPD/IGRA; HIV; consider serology (EBV, CMV, Bartonella, Lyme, Brucella per exposure).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Imaging — CXR (TB, mass, pneumonia); abdominal ultrasound or CT (abscess, mass); ECHO (endocarditis); MRI as targeted.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Specialized testing per suspicion — ferritin (Still disease/JIA), ANA + complement (lupus), ANCA (vasculitis), bone marrow (malignancy), liver biopsy (granulomas, hepatitis), lymph node biopsy.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Infections workup — Quantiferon-Gold for TB, parasites if travel, CMV/EBV serology + PCR.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Autoimmune workup — RF, anti-CCP, ferritin (>10,000 → Still disease), complement, ANA, dsDNA, anti-Ro/La, anti-Sm, ANCA, complement, immunoglobulins.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Malignancy workup — peripheral smear, LDH, uric acid, CT/MRI, bone marrow biopsy.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Periodic fever syndromes (PFAPA, FMF, TRAPS, hyperIgD) — inherited; specialized rheumatology workup.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FACTITIOUS — observation + simultaneous oral/rectal temperatures + sometimes inpatient verification.", citationIDs: ["specialty_peds_r38b"])
        ],
        priorityAssessments: [
            AttributedBullet("Differential drives workup — infections + autoimmune + malignancy + miscellaneous.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Severity + ill appearance — sepsis vs stable; admission for ill, outpatient workup if stable.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Multidisciplinary consultation — infectious disease, rheumatology, hematology/oncology as warranted.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Iterative + patient-centered approach — re-history + re-examine + repeat tests as new information emerges.", citationIDs: ["specialty_peds_r38b"])
        ],
        commonInterventions: [
            AttributedBullet("ADMIT if ill-appearing, immunocompromised, infant <60 days, hemodynamic instability, severe symptoms.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("OUTPATIENT workup if stable + reliable family + close follow-up + clear escalation plan.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Iterative workup — first-line tests → reassess → second-line based on results + clinical evolution.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("AVOID empiric antibiotics or steroids without identified target — can mask diagnosis + cause harm.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Antipyretics for symptomatic relief; do NOT mask fever pattern (helpful diagnostic clue).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Hydration + nutrition + rest.", citationIDs: ["openrn_peds_r38b"]),
            AttributedBullet("Multidisciplinary — pediatric ID, rheumatology, hematology/oncology, gastroenterology, neurology as targeted.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Treatment per identified cause — antibiotics for infection, immunosuppressants for autoimmune, oncology protocol for malignancy.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FAMILY support — prolonged uncertainty + diagnostic process is stressful; clear communication + support.", citationIDs: ["openrn_peds_r38b"])
        ],
        watchFor: [
            AttributedBullet("MISSED MALIGNANCY — leukemia + lymphoma + neuroblastoma can present with fever before other findings; bone marrow biopsy if anemia + thrombocytopenia + leukocyte abnormalities.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("MISSED IE / abscess — repeat blood cultures + ECHO + targeted imaging; persistent bacteremia = endocarditis until proven otherwise.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Drug fever — review all medications including herbal/supplement; resolves with discontinuation.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FACTITIOUS FEVER — falsified by patient or caregiver (Munchausen by proxy); careful inpatient observation + simultaneous temperatures.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("TUBERCULOSIS — exposure history + CXR + PPD/IGRA + sputum/gastric aspirates; particularly in international travel + immigrant + immunocompromised.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PERIODIC FEVER SYNDROMES (PFAPA most common in pediatrics) — recurring fever every 3-8 weeks + aphthous ulcers + pharyngitis + adenitis; tonsillectomy curative.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("KAWASAKI / MIS-C — fever ≥5 days + characteristic features; aspirin + IVIG.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Many resolve without diagnosis (~25% of FUO); careful follow-up + patience.", citationIDs: ["specialty_peds_r38b"])
        ],
        citations: [openrnPedsR38B, cdcPedsR38B, specialtyPedsR38B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricGastroenteritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-gastroenteritis",
        title: "Pediatric viral gastroenteritis",
        subtitle: "Norovirus + rotavirus + adenovirus most common · acute vomiting + diarrhea · DEHYDRATION ASSESSMENT primary · ORAL REHYDRATION first-line · WHO ORS",
        nclexTags: pedsGITagsR38B,
        definition: AttributedProse(
            "Pediatric viral gastroenteritis — acute vomiting + diarrhea from viral infection; ~1.5 million ED visits annually in US children. Most common pathogens — NOROVIRUS (most common cause, all ages), ROTAVIRUS (peds <5 yr, vaccine-preventable), adenovirus, astrovirus. Dehydration is primary morbidity + mortality. ORAL REHYDRATION SOLUTION (ORS, WHO formula) first-line treatment + dramatically reduces hospitalization + mortality vs IV. Most cases self-limited 1-3 days per primary source.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        pathophysiology: AttributedProse(
            "Viral infection of intestinal epithelium → reduced absorption + secretion of fluid/electrolytes → osmotic + secretory diarrhea + vomiting → dehydration + electrolyte abnormalities. WHO ORS works via SGLT1 (sodium-glucose cotransporter) — facilitates intestinal Na + water absorption even with damaged epithelium. Rotavirus has been dramatically reduced by vaccine (Rotateq, Rotarix) since 2006.",
            citationIDs: ["specialty_peds_r38b"]
        ),
        presentation: [
            AttributedBullet("Sudden-onset vomiting → diarrhea (typically follows by hours-days); abdominal cramping; low-grade fever; non-specific malaise.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("WATERY (NON-bloody) diarrhea typical of viral; bloody/mucusy suggests bacterial (Shigella, Salmonella, EHEC, Campylobacter).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Symptoms typically 1-3 days; some persistent vomiting + diarrhea up to 5-7 days.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("DEHYDRATION assessment — Mild (<5% body weight) — slightly dry mucous membranes, normal vital signs, normal mental status; Moderate (5-10%) — dry mucous membranes, tachycardia, decreased UOP, sunken eyes/fontanelle, delayed cap refill 2-3 sec; Severe (>10%) — sunken eyes, tachycardia, weak pulse, hypotension, altered mental status, no UOP, very delayed cap refill.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Sick contacts + day care exposure + family clusters common (norovirus highly contagious — fecal-oral + airborne).", citationIDs: ["specialty_peds_r38b"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — acute vomiting + diarrhea + dehydration assessment.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Stool studies generally NOT needed for typical viral gastroenteritis; consider for bloody diarrhea, severe dehydration, immunocompromised, prolonged symptoms (>7 days), recent antibiotics (C. diff), recent travel, day care outbreaks.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Stool tests — culture (Salmonella, Shigella, Campylobacter, Yersinia, E. coli), PCR multiplex panel (faster + comprehensive), C. diff toxin (recent antibiotics + healthcare exposure), ova + parasite.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BMP — for moderate-severe dehydration; assess electrolytes (especially K, Na), HCO3 (acidosis), BUN/Cr (renal function).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Urinalysis — specific gravity (dehydration), ketones (starvation/dehydration).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("CBC — neutrophilic leukocytosis suggests bacterial; thrombocytopenia + anemia (HUS from EHEC).", citationIDs: ["specialty_peds_r38b"])
        ],
        priorityAssessments: [
            AttributedBullet("DEHYDRATION DEGREE — primary determinant of management + disposition.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ELECTROLYTE abnormalities — hypokalemia (vomiting + diarrhea), hyponatremia (with hypotonic fluid losses), hypoglycemia (in younger + prolonged), metabolic acidosis (HCO3 loss in stool).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Bacterial vs viral — bloody/mucousy diarrhea + high fever + ill appearance + bacterial workup.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Rule out alternative diagnoses — appendicitis, intussusception, malrotation, DKA, sepsis, increased ICP.", citationIDs: ["specialty_peds_r38b"])
        ],
        commonInterventions: [
            AttributedBullet("MILD-MODERATE DEHYDRATION (most patients) — ORAL REHYDRATION SOLUTION (WHO ORS — Pedialyte, Enfalyte) — give 50-100 mL/kg over 4 hours in small frequent sips (5-10 mL Q5-10 min); replaces deficit; continue ad lib + ongoing losses.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("AVOID — sports drinks (too much sugar, low electrolytes), juices (high sugar — osmotic diarrhea), water alone (hyponatremia, no glucose for SGLT1), broth alone (hypernatremia).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("BREASTFEEDING — continue uninterrupted; supplement with ORS for ongoing losses.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("FORMULA — continue normal formula; may dilute first 1-2 days if severe (then back to full strength); lactose-free if persistent diarrhea + intolerance suspected.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("OLDER CHILDREN — REGULAR DIET as soon as tolerated; BRAT diet (bananas, rice, applesauce, toast) is OUTDATED — too restrictive; encourage normal diet + adequate calories; avoid only fatty/spicy/very sweet foods initially.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ANTIEMETICS — ondansetron 0.15 mg/kg PO (single dose) for vomiting; reduces hospitalization + IV need; metoclopramide AVOID (EPS); promethazine AVOID <2 yr (respiratory depression).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ANTIDIARRHEALS — loperamide AVOID in pediatric gastroenteritis (potential worsening of bacterial + EHEC + paralytic ileus); bismuth + probiotics minimal evidence in pediatrics.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PROBIOTICS — Lactobacillus rhamnosus GG, Saccharomyces boulardii — modest reduction in diarrhea duration; reasonable adjunct.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("ZINC supplementation — 10-20 mg/day × 14 days reduces diarrhea duration (more effective in low-resource settings); WHO recommends.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("SEVERE DEHYDRATION OR PERSISTENT VOMITING — admission + IV fluids; bolus 20 mL/kg NS/LR (repeat as needed up to 60 mL/kg); maintenance with D5/0.45NS + KCl 20 mEq/L when voiding; correct electrolyte + acid-base abnormalities.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("HOSPITALIZATION criteria — severe dehydration, intractable vomiting, suspected serious diagnosis, age <3 months, immunocompromised, electrolyte abnormalities, no PO tolerance, social situation unsuitable.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("Family education — ORS technique (small frequent sips), recognize dehydration signs, when to return (signs of dehydration, blood, severe abdominal pain, persistent vomiting, decreased UOP, lethargy, fever >5 days).", citationIDs: ["openrn_peds_r38b"]),
            AttributedBullet("Hand hygiene + isolation precautions — norovirus highly contagious; handwashing with SOAP + WATER (alcohol less effective); contact precautions for hospitalization.", citationIDs: ["specialty_peds_r38b"])
        ],
        watchFor: [
            AttributedBullet("DEHYDRATION + SHOCK — primary cause of mortality globally; emergent IV fluids + ICU.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("HYPONATREMIA — hyponatremic dehydration from inadequate sodium replacement; seizures + altered mental status; correct slowly (avoid CPM).", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("HYPERNATREMIA — from inadequate water replacement; severe hypernatremia + cerebral edema risk with rapid correction; correct slowly.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("HEMOLYTIC UREMIC SYNDROME (HUS) — EHEC O157:H7; bloody diarrhea + AKI + microangiopathic hemolytic anemia + thrombocytopenia; AVOID antibiotics (worsens) + AVOID antimotility agents; supportive + dialysis.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("INTUSSUSCEPTION — currant jelly stool + sausage-shaped abdominal mass + intermittent severe pain; emergency.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("APPENDICITIS — fever + RLQ pain + N/V; differential from gastroenteritis particularly in young children.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("DIABETIC KETOACIDOSIS (DKA) — vomiting + abdominal pain + Kussmaul + altered mental status; check glucose + ketones.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("INCREASED ICP — projectile vomiting + morning HA + altered mental status; head imaging.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("PROLONGED diarrhea (>14 days) — consider lactose intolerance, IBD, parasitic infection, allergic, immunodeficiency.", citationIDs: ["specialty_peds_r38b"]),
            AttributedBullet("NUTRITIONAL — extended diarrhea + restricted diet causes growth faltering; nutrition consultation.", citationIDs: ["specialty_peds_r38b"])
        ],
        citations: [openrnPedsR38B, cdcPedsR38B, specialtyPedsR38B],
        lastSourceFidelityReview: "2026-05-13"
    )
}
