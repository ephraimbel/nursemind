import Foundation

// Curator-model diagnosis entries (v1.5 expansion — GI, hepatic, neuro, heme, infectious).
// Sources: Open RN Med-Surg / Health Alterations (CC BY 4.0), CDC (public domain).

private let openrnMedSurg4 = CitationSource(
    id: "openrn_medsurg4",
    shortName: "Open RN Health Alterations / Medical-Surgical Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=neurology+gastrointestinal+infectious",
    lastRetrieved: "2026-05-04"
)
private let openstaxMedSurg2 = CitationSource(
    id: "openstax_medsurg2",
    shortName: "OpenStax Medical-Surgical Nursing",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/medical-surgical-nursing",
    lastRetrieved: "2026-05-04"
)
private let cdcDx2 = CitationSource(
    id: "cdc_dx2",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)

private let physiologicTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)

// MARK: - Cholecystitis

public enum CholecystitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cholecystitis",
        title: "Acute Cholecystitis",
        subtitle: "Gallbladder inflammation · cystic duct obstruction",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Inflammation of the gallbladder, most often from cystic duct obstruction by gallstones (calculous, 90%) or rare acalculous (critically ill, post-op, sepsis). Can lead to gangrene, perforation, sepsis if untreated.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Stone obstructs cystic duct → bile stasis, gallbladder distention → mucosal inflammation → bacterial superinfection (E. coli, Klebsiella, Enterococcus) → wall ischemia, gangrene, perforation.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Right upper quadrant or epigastric pain, often radiating to right shoulder/scapula; postprandial (especially fatty meals).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pain lasting >6 hours distinguishes cholecystitis from biliary colic (which resolves in <6 hr).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Nausea, vomiting, anorexia.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Fever, leukocytosis.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("MURPHY SIGN — RUQ tenderness with inspiration that causes patient to halt breath.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Mild jaundice possible (more if common bile duct stone — cholangitis).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CHARCOT TRIAD (fever + jaundice + RUQ pain) → cholangitis (biliary tree infection); REYNOLDS PENTAD adds shock + AMS.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Ultrasound — gallbladder wall thickening (>3 mm), pericholecystic fluid, sonographic Murphy, stones.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CBC, CMP — leukocytosis, mild LFT elevation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("HIDA scan — non-visualization of gallbladder confirms cystic duct obstruction.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Lipase to rule out concurrent pancreatitis (gallstone pancreatitis).", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain pattern, duration, radiation, relationship to meals.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Vital signs — sepsis criteria; jaundice; mental status.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Abdominal exam — Murphy, peritoneal signs (perforation).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pre-op assessment as indicated.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("NPO; IV fluids; pain control (NSAIDs or opioids — meperidine historically preferred but morphine is fine; avoid avoid morphine in some practices though sphincter-of-Oddi spasm myth — current evidence supports any opioid).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("IV antibiotics covering enteric gram-negatives and anaerobes (piperacillin-tazobactam, or ceftriaxone + metronidazole).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Antiemetic.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Laparoscopic cholecystectomy — preferably within 24–72 hours (early cholecystectomy improves outcomes vs delayed).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Percutaneous cholecystostomy for poor surgical candidates or to bridge to surgery.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("ERCP for concurrent common bile duct stone or cholangitis.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("Cholangitis (Charcot triad) — biliary tree infection, urgent ERCP for decompression.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Gangrenous/perforated gallbladder — peritonitis, sepsis; emergent surgery.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Gallstone pancreatitis — severe; ERCP if obstructing stone.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Post-op: bile leak, common bile duct injury, retained stone.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - C. difficile Colitis

public enum CDiffColitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "c-diff-colitis",
        title: "C. difficile Colitis",
        subtitle: "Toxin-mediated colitis · antibiotic-associated diarrhea",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Colitis caused by toxin-producing Clostridioides difficile, typically following disruption of normal gut flora by antibiotics. Spectrum from mild diarrhea to fulminant pseudomembranous colitis with toxic megacolon, perforation, and death.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Antibiotics (especially clindamycin, fluoroquinolones, cephalosporins, β-lactams) disrupt normal flora → C. diff overgrowth → toxin A and B production → mucosal damage, pseudomembrane formation, inflammation.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Watery diarrhea (≥3 loose stools/24 hr) — characteristic foul odor.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Crampy abdominal pain, distention.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Fever, leukocytosis (often markedly elevated).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Recent antibiotic use (within 8 weeks usually) — but can occur without antibiotics.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("FULMINANT: ileus (paradoxically NO diarrhea), toxic megacolon, hypotension, shock; high mortality.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Recurrent disease (15–25%) — within 8 weeks of completing therapy.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Stool C. diff toxin EIA, GDH antigen, and/or NAAT (PCR) — only test patients with diarrhea (≥3 unformed stools).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("WBC >15K and creatinine >1.5× baseline = severe disease.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CT/imaging for severe — colonic wall thickening, megacolon, perforation.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Stool frequency, character, volume.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hydration, electrolytes — diarrhea causes K, bicarbonate losses.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Vital signs — fever, hypotension; sepsis criteria.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Abdominal exam — distention, peritoneal signs (megacolon, perforation).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CONTACT precautions with soap-and-water hand hygiene.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("CONTACT PRECAUTIONS — single room (or cohort), soap and water (alcohol does NOT kill spores), bleach for environmental cleaning.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("DISCONTINUE inciting antibiotic if possible.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Fluid resuscitation, electrolyte replacement.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("First episode: oral vancomycin 125 mg PO QID × 10 days OR fidaxomicin 200 mg PO BID × 10 days (per IDSA 2021 guidance, concept).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("AVOID anti-motility agents (loperamide) — risk of toxic megacolon.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Recurrent: fidaxomicin, taper-pulse vancomycin, fecal microbiota transplant (FMT) for multiply recurrent.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Fulminant: oral vancomycin 500 mg PO QID + IV metronidazole; surgery (colectomy) for toxic megacolon, perforation, refractory shock.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("Toxic megacolon — colonic dilation >6 cm, sepsis, peritoneal signs; surgical emergency.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Recurrence — 15–25% after first episode; rises to 40–60% after each subsequent.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Severe dehydration, AKI from diarrhea losses.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Test of cure NOT recommended — patient may shed toxin/DNA after symptom resolution.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2, cdcDx2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hepatic Encephalopathy

public enum HepaticEncephalopathySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hepatic-encephalopathy",
        title: "Hepatic Encephalopathy",
        subtitle: "Cirrhosis · ammonia · altered mental status",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
        definition: AttributedProse(
            "Neuropsychiatric syndrome in advanced liver disease characterized by altered mental status ranging from subtle cognitive changes to coma. Caused by failure of liver to clear neurotoxins (notably ammonia) from systemic circulation.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Cirrhosis or acute liver failure → impaired urea cycle, portosystemic shunting → ammonia and other toxins (false neurotransmitters, GABA) cross BBB → neuronal dysfunction. Often precipitated by GI bleed, infection (especially SBP), constipation, sedatives, electrolyte derangement, dietary protein excess.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("West Haven grades: 0 (subclinical), 1 (mild confusion, irritability), 2 (lethargy, asterixis), 3 (somnolence, marked confusion), 4 (coma).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Asterixis — flapping tremor with wrists dorsiflexed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Reversed sleep-wake cycle, personality changes, irritability.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Fetor hepaticus — sweet musty breath odor.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Stigmata of cirrhosis — jaundice, ascites, spider angiomata, palmar erythema, gynecomastia.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — altered mental status in patient with liver disease + identification of precipitant.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Ammonia level supportive but does not always correlate with severity; clinical assessment is more important.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Rule out other causes of AMS — head CT, glucose, electrolytes, toxicology.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status, level of consciousness, asterixis, fall risk.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Aspiration precautions — high risk in obtunded patients.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Identify and treat PRECIPITANT — GI bleed, SBP (paracentesis if ascites), constipation, infection, electrolyte derangement, sedatives, dehydration, dietary protein excess.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Daily weights, abdominal girth (ascites), I&O.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("LACTULOSE — titrate to 2–3 soft stools/day (PO, NG, or rectal in obtunded). Acidifies colon, traps ammonia as ammonium for excretion.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("RIFAXIMIN as adjunct — reduces gut bacteria producing ammonia; effective for recurrence prevention.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Treat precipitating cause: paracentesis with diagnostic for SBP, antibiotics, GI bleed management, correct electrolyte abnormalities, hold sedatives/opioids.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Adequate but not excessive protein intake — moderate protein restriction historical; current evidence supports normal protein with lactulose.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Aspiration precautions — HOB elevated, NPO if severely obtunded with consideration of NG/PEG for nutrition and lactulose delivery.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Liver transplant evaluation for chronic refractory HE.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("Cerebral edema — fulminant hepatic failure with ammonia >150 has high risk; ICP monitoring may be needed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("SBP — fever, abdominal pain, ascites; diagnostic paracentesis if ascites and any clinical deterioration.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("GI bleed — even small bleed precipitates HE; check stool occult, daily Hgb.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Falls — high fall risk; institute precautions.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Increased ICP

public enum IncreasedICPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "increased-icp",
        title: "Increased Intracranial Pressure",
        subtitle: "TBI · stroke · tumor · hemorrhage · cerebral edema",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
        definition: AttributedProse(
            "Sustained ICP >20 mmHg in a closed cranial vault (Monroe-Kellie doctrine: brain + blood + CSF). Sustained elevation reduces cerebral perfusion pressure (CPP = MAP − ICP) and risks brain herniation. Normal ICP <15 mmHg.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Causes: traumatic brain injury, intracranial hemorrhage, ischemic stroke with edema, tumor, hydrocephalus, meningitis/encephalitis, cerebral edema (hyponatremia, fulminant hepatic failure). As ICP rises, CPP falls → ischemia → more edema → vicious cycle. Herniation = mass effect displacing brain across compartments → death.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Headache, nausea, vomiting (often projectile).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Decreased level of consciousness (most sensitive sign — track GCS or RASS).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Papilledema on fundoscopy.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pupillary changes — unilateral dilation/non-reactivity is herniation sign.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Cushing triad (LATE): hypertension (widening pulse pressure), bradycardia, abnormal respirations — impending herniation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Posturing — decorticate (flexion) or decerebrate (extension); decerebrate is worse.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Focal deficits depending on location.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT or MRI for imaging.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("ICP monitoring (intraventricular catheter — gold standard, also therapeutic CSF drainage; intraparenchymal monitor) — for severe TBI or selected cases.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CPP target ≥60 mmHg (CPP = MAP − ICP).", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Neuro checks every 1–4 hours per acuity — GCS, pupils, motor, ICP if monitored.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Vital signs trending — Cushing triad is LATE.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("HOB position, neck position (avoid jugular compression), avoid Valsalva.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Identify precipitant — bleeding, hyponatremia, fever, seizure.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("HOB 30°, neutral neck position to facilitate cerebral venous drainage.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Avoid noxious stimuli — cluster care, minimize suctioning, treat fever/pain/agitation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hyperosmolar therapy — mannitol 0.25–1 g/kg IV bolus OR 3% hypertonic saline (per protocol; check serum Na, osmolality).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Sedation and analgesia — propofol or dexmedetomidine; opioids for pain (cautious for hypotension).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CSF drainage via EVD if catheter in place.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Maintain MAP for CPP ≥60 — vasopressors as needed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Normothermia (avoid fever); selective hypothermia controversial.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Seizure prophylaxis with levetiracetam or phenytoin in severe TBI.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hyperventilation to PaCO2 30–35 ONLY for impending herniation as bridge to definitive therapy (vasoconstriction reduces ICP transiently but reduces CBF).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Surgery — decompressive craniectomy, hematoma evacuation, tumor resection per neurosurgery.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("HERNIATION — fixed dilated pupil, posturing, hemodynamic changes; emergent intervention.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Cushing triad — late sign of impending herniation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hyponatremia worsens cerebral edema — keep Na 140–145 in severe TBI.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Seizures dramatically increase ICP and metabolic demand.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Status Epilepticus

public enum StatusEpilepticusSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "status-epilepticus",
        title: "Status Epilepticus",
        subtitle: "≥5 min seizure or repeated seizures without recovery",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
        definition: AttributedProse(
            "Continuous seizure activity ≥5 minutes OR two or more discrete seizures without full recovery between. Generalized convulsive status is most life-threatening; non-convulsive forms exist (suspected with persistent altered mental status). Mortality ~20%.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Failure of normal seizure-terminating mechanisms or initiation of mechanisms perpetuating seizures. Causes: anti-epileptic non-adherence, withdrawal (alcohol/benzo), stroke, infection (meningitis/encephalitis), metabolic (hypoglycemia, hyponatremia), hypoxia, drug toxicity, brain injury. Prolonged seizures cause neuronal death, lactic acidosis, hyperthermia, rhabdomyolysis.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Generalized tonic-clonic seizure activity ≥5 minutes OR repeated without recovery.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Loss of consciousness, tonic stiffening followed by clonic jerking.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Tongue biting (lateral), urinary/fecal incontinence, post-ictal confusion (typically 5–30 min).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Cyanosis, hypoxia from impaired ventilation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hyperthermia, lactic acidosis, rhabdomyolysis, AKI.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Non-convulsive: persistent AMS without obvious motor activity — suspect in unexplained coma; EEG diagnostic.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — seizure activity ≥5 minutes or repeated without recovery.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("EEG essential for non-convulsive forms.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Search for cause — fingerstick glucose, electrolytes, AED levels, toxicology, head imaging, possible LP.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — airway patency, oxygenation, hemodynamics.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Time the seizure — count from onset.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Glucose immediately (correct hypoglycemia rapidly).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("IV access (or IO if no IV); BMP, AED levels, toxicology, urine.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("Position safely on side; protect head; do NOT restrain or place objects in mouth.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Oxygen via mask; suction available; intubate if airway compromised or refractory.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("FIRST-LINE: BENZODIAZEPINE — lorazepam 4 mg IV (or midazolam 10 mg IM if no IV); may repeat × 1.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("SECOND-LINE: ADD an AED — fosphenytoin 20 mg PE/kg IV, levetiracetam 60 mg/kg IV, or valproate 40 mg/kg IV.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("THIRD-LINE (refractory after first two lines): continuous infusion — propofol, midazolam, or pentobarbital with continuous EEG monitoring.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Treat reversible causes — glucose, hyponatremia, eclampsia (magnesium), pyridoxine for INH overdose.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Continuous EEG for monitoring response and detecting non-convulsive status.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("Hypoxia, aspiration, hyperthermia, rhabdomyolysis, AKI — supportive care critical.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Refractory status epilepticus — failure of two appropriate therapies; mortality climbs significantly.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Non-convulsive status — suspect in any unexplained AMS, especially in elderly or post-arrest; EEG diagnostic.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Eclampsia — pregnant or postpartum patient; magnesium first-line, not benzo.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Meningitis

public enum MeningitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "meningitis",
        title: "Meningitis",
        subtitle: "Bacterial · viral · fungal — meningeal inflammation",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Inflammation of the meninges (pia, arachnoid, dura) by infection (bacterial, viral, fungal, TB) or other causes (drug, autoimmune). Bacterial meningitis is a medical emergency with high mortality if treatment delayed.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Pathogens reach CNS via bloodstream (most common — pneumococcus, meningococcus), direct extension (sinusitis, otitis), trauma, or surgery. Bacterial meningitis: cytokine cascade, BBB breakdown, cerebral edema, vasculitis, increased ICP. Viral meningitis usually milder, self-limited.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Classic triad (only 50% of cases): fever, neck stiffness, altered mental status.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Severe headache, photophobia, nausea/vomiting.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Meningeal signs — Brudzinski (neck flexion → hip/knee flexion), Kernig (extension of knee from flexed hip causes pain).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Petechial/purpuric rash with meningococcemia — hallmark of N. meningitidis; often progresses rapidly.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Seizures, focal deficits, increased ICP signs.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Atypical: elderly may present without fever or stiff neck — just AMS.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Lumbar puncture — definitive; CSF analysis: opening pressure, cell count and differential, protein, glucose, Gram stain, culture.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Bacterial CSF: cloudy, ↑ neutrophils (>1000), ↑ protein, ↓ glucose (<40% of serum), positive Gram stain/culture.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Viral CSF: clear, ↑ lymphocytes, normal/mild ↑ protein, normal glucose.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Head CT before LP if focal deficits, papilledema, immunocompromise, history of CNS disease — rule out mass effect.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Blood cultures × 2.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs, mental status, neuro exam frequently.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Meningeal signs (Brudzinski, Kernig), petechial rash.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Seizure precautions.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Increased ICP signs.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Sepsis criteria — hemodynamic instability common, especially meningococcemia.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("DROPLET PRECAUTIONS for suspected meningococcal until 24 hours of effective antibiotics.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("EMPIRIC ANTIBIOTICS within 1 hour of suspicion — DO NOT delay for LP/CT. Adult regimen: ceftriaxone 2 g IV + vancomycin 15–20 mg/kg + dexamethasone 0.15 mg/kg (if pneumococcal suspected). Add ampicillin if >50 yr, immunocompromised, or pregnant (Listeria coverage).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Dexamethasone 15 min before or with first antibiotic dose if pneumococcal suspected (reduces neuro complications, mortality).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("ICU monitoring; manage increased ICP, seizures, hemodynamics.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Source control — sinusitis drainage, ear infection treatment.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Chemoprophylaxis for close contacts of meningococcal (rifampin, ciprofloxacin, ceftriaxone).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Reportable to public health.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("Septic shock from meningococcemia — purpura fulminans, DIC, adrenal crisis (Waterhouse-Friderichsen syndrome).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Increased ICP, herniation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Seizures.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Long-term: hearing loss, cognitive impairment, hydrocephalus — pediatric and elderly especially.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2, cdcDx2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Delirium

public enum DeliriumSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "delirium",
        title: "Delirium",
        subtitle: "Acute, fluctuating altered mental status · medical emergency",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition),
        definition: AttributedProse(
            "Acute disturbance of attention and awareness with cognitive change, developing over hours to days, fluctuating throughout the day. Caused by an underlying medical condition. Distinct from dementia (chronic, progressive) and depression. Hyperactive (agitated), hypoactive (lethargic, often missed), and mixed types.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial: underlying acute illness, drugs (anticholinergics, opioids, benzodiazepines), metabolic derangement (electrolyte, glucose), infection (UTI, pneumonia, sepsis), pain, sleep deprivation, sensory deprivation, environmental change. Predisposing: age, baseline cognitive impairment, multiple comorbidities, polypharmacy.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("ACUTE onset (hours to days) — distinguishes from dementia.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("FLUCTUATING course — clear periods alternating with confusion.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Inattention — cannot follow conversation, easily distracted.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Disorganized thinking — incoherent speech, illogical flow.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Altered level of consciousness — hyperalert/agitated OR drowsy/lethargic.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Perceptual disturbances — visual hallucinations more common than in psychiatric disease.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Disoriented to time and place; sleep-wake cycle disrupted (sundowning).", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CAM (Confusion Assessment Method) — gold standard screening tool.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CAM positive = (1) acute onset & fluctuating + (2) inattention + EITHER (3) disorganized thinking OR (4) altered LOC.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Identify and reverse cause — workup based on context.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("CAM screening every shift in at-risk patients (elderly, ICU, post-op).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Vital signs, glucose, sat — identify hypoxia, sepsis, hypoglycemia rapidly.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Medication review — STOP/REDUCE deliriogenic agents (benzos, anticholinergics, sedating antihistamines, opioids if possible).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Search for cause: UA/culture, CXR, BMP, glucose, drug levels, withdrawal screening.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("FIRST-LINE: NON-PHARMACOLOGIC. Reorientation (clock, calendar, family present). Glasses, hearing aids ON. Promote normal sleep-wake cycle. Mobility. Adequate hydration and nutrition. Pain control (non-opioid when possible). Hydrate. Address constipation, urinary retention. Continuity of staff.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Treat underlying cause — antibiotics for infection, correct electrolytes, etc.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Deliriogenic medication review — Beers Criteria; reduce or stop.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pharmacologic ONLY when patient at risk of harm to self/others — low-dose haloperidol or atypical antipsychotic; AVOID benzodiazepines except for alcohol/benzodiazepine withdrawal.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Family involvement — familiar voices, photos, home objects.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Restraints are LAST RESORT — they worsen delirium; consider sitter first.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("Hypoactive delirium — frequently missed; flat, lethargic patients are NOT just 'sleeping'; CAM screen.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Underlying cause — sepsis, MI, stroke, intracranial hemorrhage may present as delirium in elderly.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Long-term cognitive decline — even brief ICU delirium associated with long-term decline.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Falls, pressure injuries, aspiration, withdrawal of cooperation with care — significant morbidity.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Alcohol Withdrawal / CIWA

public enum AlcoholWithdrawalSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "alcohol-withdrawal",
        title: "Alcohol Withdrawal Syndrome",
        subtitle: "CIWA-Ar protocol · DTs prevention",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
        definition: AttributedProse(
            "Constellation of symptoms developing in dependent drinkers within hours of last drink. Spectrum from minor (tremor, anxiety, sweating) → withdrawal seizures → alcoholic hallucinosis → delirium tremens (DTs). DTs has 1–4% mortality if untreated.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Chronic alcohol use suppresses CNS via GABA agonism and NMDA antagonism. Withdrawal removes this depressant tone, leading to hyperexcitable state — autonomic instability, tremor, seizures, hallucinations.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("6–12 hours: minor — tremor, anxiety, nausea, insomnia, mild HTN/tachycardia.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("12–24 hours: alcoholic hallucinosis — visual/auditory/tactile hallucinations with intact orientation and vital signs.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("24–48 hours: WITHDRAWAL SEIZURES — generalized tonic-clonic, single or brief cluster.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("48–96 hours: DELIRIUM TREMENS — severe agitation, confusion, hallucinations, autonomic instability (tachycardia, HTN, hyperthermia, diaphoresis).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Wernicke encephalopathy (concurrent thiamine deficiency): confusion + ataxia + ophthalmoplegia.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Korsakoff syndrome: chronic memory deficit (anterograde amnesia, confabulation) — irreversible.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — recent decreased/stopped alcohol use + symptoms.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CIWA-Ar score — 10 items (nausea, tremor, anxiety, agitation, paroxysmal sweats, orientation, tactile/visual/auditory disturbances, headache); guides treatment dose.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Score interpretation: <8 mild, 8–15 moderate, >15 severe.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("CIWA-Ar score every 1–4 hours per protocol; vital signs.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Mental status, hallucinations, orientation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Wernicke triad — give thiamine even if subtle.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Glucose, electrolytes — alcohol use disorder commonly has hypoglycemia, hypoMg, hypoK, hypoPhos.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Co-existing illness — pneumonia, GI bleed, pancreatitis, head trauma.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("THIAMINE 100 mg IV/IM BEFORE glucose — prevents Wernicke encephalopathy precipitation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Folate, multivitamin; magnesium, potassium, phosphorus replacement as needed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("BENZODIAZEPINES (mainstay) — symptom-triggered dosing per CIWA: lorazepam (preferred in liver disease), diazepam, or chlordiazepoxide. Front-load with high doses for severe withdrawal/DTs.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Severe DTs: ICU; benzo drip if refractory; phenobarbital or propofol second-line; intubation may be required.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Seizure: usually self-limited; benzo for active seizure; long-term AED rarely needed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Quiet, well-lit room; reorient; avoid restraints if possible.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hydration; assess for occult trauma, infection, GI bleed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Discharge planning — addiction counseling, MAT (naltrexone, acamprosate, disulfiram), AA, social work.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("DTs mortality 1–4% with treatment, 15–20% without — recognize and treat early.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Wernicke encephalopathy — give thiamine BEFORE dextrose; reversible if treated, becomes Korsakoff if not.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Co-existing illness commonly missed — high index for pneumonia, head injury, GI bleed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Aspiration during seizure or DTs — airway management.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - DIC

public enum DICSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "dic",
        title: "Disseminated Intravascular Coagulation (DIC)",
        subtitle: "Consumptive coagulopathy · simultaneous bleeding and clotting",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis),
        definition: AttributedProse(
            "Acquired syndrome of widespread intravascular activation of coagulation, depleting clotting factors and platelets, leading to simultaneous microvascular thrombosis (organ ischemia) and bleeding. Always secondary to an underlying cause — sepsis, malignancy, OB complication (placental abruption, amniotic fluid embolism), trauma, transfusion reaction.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Trigger releases tissue factor or activates coagulation cascade systemically → fibrin deposition in microvasculature (microthrombi → end-organ ischemia) → consumption of clotting factors and platelets → bleeding. Fibrinolysis activates simultaneously, generating D-dimer and fibrin split products.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Bleeding — IV sites, mucous membranes, surgical wounds; petechiae, purpura, ecchymoses.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Thrombosis — microvascular ischemia of skin (acrocyanosis), kidneys (AKI), lungs (ARDS), brain (AMS).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Multi-organ dysfunction.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Underlying cause apparent — sepsis, OB emergency, trauma, leukemia (especially APL), heat stroke, transfusion reaction.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ISTH score uses platelet count, PT, fibrinogen, D-dimer/fibrin split products to grade.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Typical pattern: low platelets (<100K, falling), prolonged PT and aPTT, low fibrinogen (<150), elevated D-dimer (markedly), schistocytes on smear.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Bleeding sites — head-to-toe; track output of any drains.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Vital signs, perfusion, mental status — multi-organ involvement common.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Trend coag panel, platelets, fibrinogen, lactate.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Identify and treat underlying cause — sepsis bundle, OB intervention, etc.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("TREAT THE UNDERLYING CAUSE — most important intervention. DIC will resolve when trigger is removed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Replace blood products as needed: PRBCs for bleeding, platelets if <50K and bleeding, FFP for elevated INR with bleeding, cryoprecipitate for fibrinogen <100.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Heparin (controversial) — only in chronic DIC with predominant thrombosis (rare).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Supportive — hemodynamic support, oxygen, dialysis, mechanical ventilation as needed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Avoid IM injections, arterial sticks, unnecessary line placement.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("High mortality — depends on underlying cause; sepsis-related DIC has very high mortality.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Catastrophic bleeding — intracranial hemorrhage, GI bleed.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Organ failure from microthrombi — AKI, ARDS, hepatic dysfunction.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Acute promyelocytic leukemia (APL) is one of the few oncologic DIC causes for which specific treatment (ATRA) reverses DIC quickly.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sickle Cell Crisis

public enum SickleCellCrisisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sickle-cell-crisis",
        title: "Sickle Cell Vaso-occlusive Crisis",
        subtitle: "Severe pain · hypoxia and dehydration triggers",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Acute episode of sickling-induced microvascular occlusion in a patient with sickle cell disease, causing severe pain, tissue ischemia, and end-organ damage. Triggers include hypoxia, dehydration, infection, cold, stress, alcohol.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "HbS polymerizes when deoxygenated → RBC sickles → adheres to endothelium → microvascular occlusion → ischemia → pain. Repeated crises cause cumulative end-organ damage (renal, splenic, pulmonary, neurologic).",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("SEVERE pain — bones (long bones, spine, pelvis, sternum), abdomen, chest. Pain pattern often familiar to patient.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Mild fever (low grade — unless infected), tachycardia, tachypnea.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Acute chest syndrome: chest pain + new infiltrate + hypoxia — life-threatening; needs aggressive treatment, possible exchange transfusion.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Splenic sequestration (peds) — sudden splenomegaly + drop in Hgb; transfusion emergency.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Aplastic crisis — sudden Hgb drop without reticulocyte response; often parvovirus B19.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Stroke — children with SCD high risk; new neuro deficit warrants urgent imaging.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Priapism — painful prolonged erection; requires urgent urology.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Known sickle cell disease + clinical pain crisis.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Workup: CBC, retic count (decreased in aplastic), CMP, LDH, CXR (acute chest), cultures, type & screen for transfusion.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain assessment — patient self-report is gold standard; trust the patient.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Vital signs, SpO2; hemodynamic status.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Identify trigger — infection, dehydration, cold, hypoxia.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Assess for serious complications — acute chest, stroke, splenic sequestration, priapism.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("AGGRESSIVE pain control — IV opioids; PCA often appropriate; do NOT under-treat (well-documented bias against SCD patients).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("IV fluids (NS or LR at maintenance) — correct dehydration; avoid over-resuscitation (worsens acute chest).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Supplemental oxygen if SpO2 <95%.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Treat infection — empiric antibiotics if febrile/septic.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Acute chest syndrome: oxygen, antibiotics (cover atypicals), incentive spirometry, possible transfusion or exchange transfusion.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hydroxyurea for chronic disease management — increases HbF, reduces crisis frequency.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pneumococcal vaccination, penicillin prophylaxis (children) — prevent infection in functionally asplenic patients.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Incentive spirometry to prevent acute chest syndrome.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("ACUTE CHEST SYNDROME — leading cause of mortality; new infiltrate + chest pain + hypoxia; aggressive treatment.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Stroke — new neuro deficit; urgent imaging and exchange transfusion.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Splenic sequestration — sudden severe anemia; volume + transfusion.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Avascular necrosis (especially femoral head) — chronic complication.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Implicit bias and undertreatment — believe and treat the patient's pain.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Burns

public enum BurnsSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "burns",
        title: "Burns",
        subtitle: "Thermal · chemical · electrical · radiation · TBSA estimation",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Tissue injury from heat, chemicals, electricity, or radiation. Severity by depth (superficial / partial-thickness / full-thickness) and extent (% Total Body Surface Area). Major burns (≥20% TBSA) cause systemic inflammatory response, massive fluid shifts, and multi-organ effects.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Burn destroys skin barrier → fluid loss, infection risk. Local cytokines and burn shock produce systemic capillary leak — massive third-spacing in first 24 hours. Inhalation injury, hypovolemia, sepsis are leading causes of death.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Superficial (1st degree): erythematous, painful, no blisters (sunburn).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Superficial partial-thickness (2nd, superficial): blistering, weeping, very painful.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Deep partial-thickness (2nd, deep): mottled red/white, less pain (some nerve damage).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Full-thickness (3rd degree): leathery white/charred/black; PAINLESS (nerves destroyed); requires grafting.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("4th degree: extends into muscle/bone.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Inhalation injury signs: facial burns, singed nasal hair, soot in mouth/sputum, hoarseness, stridor, history of enclosed-space fire.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Carbon monoxide poisoning: cherry-red skin (rare), cherry-red mucosa, headache, confusion; SpO2 unreliable — get co-oximetry.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("TBSA estimation: Rule of 9s (adults), Lund-Browder (peds — adjusts for body proportions).", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical depth and TBSA assessment.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Carboxyhemoglobin, methemoglobin (smoke inhalation).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CK and urine myoglobin (electrical, deep burns) — rhabdomyolysis risk.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("AIRWAY — early intubation if any inhalation injury signs (airway swells rapidly).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hemodynamics, urine output (resuscitation guide — 30–50 mL/hr adult, 1 mL/kg/hr pediatric).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("TBSA, depth, location (face, hands, feet, genitalia, joints — special considerations).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Circumferential burns — assess distal pulses; risk of compartment syndrome → escharotomy.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pain, hypothermia (heat loss through burn).", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("AIRWAY first — early intubation for inhalation injury before edema closes airway.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Stop the burning process — remove clothing, jewelry; cool with water (NOT ice) for thermal; brush off dry chemical, irrigate copiously.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Fluid resuscitation: PARKLAND formula 4 mL × kg × % TBSA (LR), half in first 8 hours from burn time, half over next 16 hours; titrate to urine output.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Two large-bore IVs (or central if needed), foley for accurate output.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pain — IV opioids (IM unreliable absorption from edematous tissue).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Wound care — gentle cleansing; topical antimicrobial (silver sulfadiazine, mafenide); cover loosely with dry sterile dressing for transport.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Tetanus immunization update.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Maintain warmth — hypothermia worsens outcomes.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("NG tube for ileus; high-protein high-calorie nutrition (catabolic state).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Transfer to burn center per ABA criteria (>10% TBSA partial-thickness, full-thickness any size, face/hands/feet/genitals, electrical, chemical, inhalation, comorbidities).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Excision and grafting for deep wounds within first weeks.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("Inhalation injury — leading cause of early death; intubate early.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Burn shock — under-resuscitation in first 24 hours leads to AKI, multi-organ failure.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Compartment syndrome — circumferential burns; escharotomy.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Sepsis — leading cause of late mortality; meticulous wound care, surveillance.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Curling ulcer — stress GI ulceration; PPI prophylaxis.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CO poisoning — SpO2 falsely high; treat with high-flow O2; hyperbaric for severe.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Electrical: rhabdomyolysis, arrhythmias, occult deep tissue damage.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Active TB

public enum TuberculosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tuberculosis",
        title: "Active Tuberculosis (TB)",
        subtitle: "Mycobacterium tuberculosis · airborne · public health priority",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Active infection with Mycobacterium tuberculosis. Transmitted via airborne droplet nuclei. Pulmonary TB is most common; extrapulmonary forms include lymphatic, pleural, GU, bone/joint, miliary (disseminated), CNS (meningitis). Latent TB is non-contagious and asymptomatic.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Inhaled bacilli reach alveoli, are engulfed by macrophages, form granulomas (usually contained — latent infection). Active disease occurs when host immune response fails (HIV, immunosuppression, malnutrition, age extremes) → caseating granulomas, cavitation, hematogenous spread.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("Productive cough >2–3 weeks, often with hemoptysis.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Chest pain, dyspnea.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Constitutional: night sweats, weight loss, anorexia, fatigue, low-grade fever.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Risk factors: HIV, homelessness, incarceration, immigration from endemic area, healthcare exposure, immunosuppression.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Extrapulmonary: site-specific (e.g., scrofula = cervical lymphadenitis, Pott disease = vertebral TB).", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Sputum AFB smear × 3 (consecutive days; first morning samples best); culture (gold standard, takes 2–6 weeks); NAAT (PCR, faster).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CXR — upper lobe infiltrates, cavitation; miliary pattern in disseminated.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Tuberculin skin test (PPD) or interferon-gamma release assay (IGRA, e.g., QuantiFERON) — diagnose LATENT (cannot distinguish from active in symptomatic patient).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Drug susceptibility testing on positive cultures — rules out MDR/XDR-TB.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("AIRBORNE PRECAUTIONS immediately on suspicion — N95, negative pressure room.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Contact tracing — public health notification; identify household and close contacts.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Adherence to therapy — typically directly observed therapy (DOT).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Adverse drug reaction monitoring — especially hepatotoxicity (RIPE drugs).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Nutritional status, comorbidities (HIV testing recommended).", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("AIRBORNE precautions — single negative pressure room, N95 for all entering, patient wears surgical mask if leaving room. Continue until 3 negative AFB smears + clinical improvement + on therapy ≥2 weeks.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("STANDARD INITIAL THERAPY (4-drug RIPE): Rifampin + Isoniazid + Pyrazinamide + Ethambutol × 2 months, then Isoniazid + Rifampin × 4 months (total 6 months).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Add pyridoxine (vitamin B6) with isoniazid to prevent peripheral neuropathy.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Directly observed therapy (DOT) recommended to ensure adherence.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Monitor LFTs monthly (RIPE drugs hepatotoxic); discontinue if marked elevation.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Visual acuity and color vision baseline + monthly for ethambutol (optic neuritis).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("HIV testing for all new TB diagnoses.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Public health reporting (mandatory).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Latent TB: 9 months isoniazid OR 4 months rifampin OR 12-week isoniazid+rifapentine weekly; reduces progression to active disease.", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("MDR-TB (resistant to INH + rifampin) and XDR-TB — require longer, more toxic regimens; specialist management.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Drug hepatotoxicity — INH > rifampin > pyrazinamide; monitor LFTs.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Optic neuritis with ethambutol — monitor color vision.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Rifampin causes orange-red discoloration of urine, sweat, tears (harmless but startles patient).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Drug interactions — rifampin is a potent CYP inducer; affects warfarin, OCPs, antiretrovirals, many others.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Healthcare worker TB exposure — annual screening per facility; post-exposure evaluation.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2, cdcDx2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Compartment Syndrome

public enum CompartmentSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "compartment-syndrome",
        title: "Acute Compartment Syndrome",
        subtitle: "Surgical emergency · 6 P's · fasciotomy",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Increased pressure within a closed muscle compartment compromises perfusion, leading to ischemia, necrosis, rhabdomyolysis, and limb loss if not decompressed urgently. Most commonly leg or forearm. Causes: fracture, crush injury, reperfusion, tight cast/dressing, prolonged compression, burns, IV infiltration of vesicants.",
            citationIDs: ["openrn_medsurg4"]
        ),
        pathophysiology: AttributedProse(
            "Pressure rises within fascial compartment → venous outflow obstructed → arterial inflow compromised → tissue ischemia → necrosis. Irreversible muscle damage occurs after 4–6 hours of severe ischemia. Late presentation = amputation.",
            citationIDs: ["openrn_medsurg4", "openstax_medsurg2"]
        ),
        presentation: [
            AttributedBullet("PAIN out of proportion to injury — earliest and most reliable sign; severe, deep, unrelenting; worse with passive stretch of compartment muscles.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("PRESSURE — tense, swollen, firm compartment.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("PARESTHESIA — early sensory deficit (nerves are sensitive to ischemia).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("PALLOR (LATE) — distal extremity pale, cool.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("PARALYSIS (LATE) — motor deficit.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("PULSELESSNESS (LATEST and INCONSISTENT) — pulses often present until very late; do NOT wait for absent pulse to act.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Compartment pressure measurement >30 mmHg or within 30 of diastolic = surgical indication.", citationIDs: ["openrn_medsurg4"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — high index of suspicion; do not wait for late signs.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Compartment pressure measurement (Stryker monitor) — >30 mmHg or delta pressure (DBP − compartment) <30 mmHg = fasciotomy.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("CK, urine myoglobin — rhabdomyolysis develops rapidly.", citationIDs: ["openrn_medsurg4"])
        ],
        priorityAssessments: [
            AttributedBullet("Neurovascular checks every 1–2 hours in at-risk patients (post-fracture, cast, post-vascular surgery, crush injury).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Pain assessment — pain disproportionate to injury or unresponsive to escalating opioids = red flag.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Compartment palpation — tense, board-like.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Passive stretch test — pain on passive stretch is sensitive early sign.", citationIDs: ["openrn_medsurg4"])
        ],
        commonInterventions: [
            AttributedBullet("Loosen any constricting cast or dressing IMMEDIATELY — bivalve cast.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Position limb at HEART LEVEL — not elevated (reduces arterial inflow further) and not dependent (worsens edema).", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("STAT orthopedic surgery consult.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("FASCIOTOMY — definitive treatment; release fascia to decompress; left open and closed in 2–3 days when swelling subsides.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("IV fluids — adequate hydration to prevent rhabdomyolysis-induced AKI.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Opioids for pain (do NOT use as substitute for decompression — pain control alone does not save the limb).", citationIDs: ["openrn_medsurg4"])
        ],
        watchFor: [
            AttributedBullet("DELAY = AMPUTATION. 4–6 hour window of irreversible muscle ischemia.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Rhabdomyolysis — CK >5000, dark urine, AKI; aggressive IV fluids, urine output goal >100 mL/hr, alkalinize urine per protocol.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Hyperkalemia from rhabdo — cardiac monitoring, treat per protocol.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("Late signs (pallor, paralysis, pulselessness) indicate irreversible damage — DO NOT WAIT for them.", citationIDs: ["openrn_medsurg4"]),
            AttributedBullet("IV infiltration of vesicants (vasopressors, hyperosmolar fluids) can cause compartment syndrome — assess sites frequently.", citationIDs: ["openrn_medsurg4"])
        ],
        citations: [openrnMedSurg4, openstaxMedSurg2],
        lastSourceFidelityReview: "2026-05-04"
    )
}
