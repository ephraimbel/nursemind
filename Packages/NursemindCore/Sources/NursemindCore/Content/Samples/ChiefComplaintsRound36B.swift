import Foundation

// Curator-model references (round 36 part B — chief-complaint workup: abdominal + general medical chief complaints).

private let openrnCC36B = CitationSource(
    id: "openrn_cc36b",
    shortName: "Open RN Health Alterations + Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcCC36B = CitationSource(
    id: "cdc_cc36b",
    shortName: "CDC + AHRQ + NIH concept citations",
    publisher: "CDC · AHRQ · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyCC36B = CitationSource(
    id: "specialty_cc36b",
    shortName: "ACEP + IDSA + ACG + AAOS + ENA fact citations",
    publisher: "ACEP · IDSA · ACG · AAOS · ENA",
    license: .factCitationOnly,
    url: "https://www.acep.org/",
    lastRetrieved: "2026-05-13"
)

private let ccTagsR36B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)

public enum AbdominalPainEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "abdominal-pain-evaluation",
        title: "Abdominal pain evaluation",
        subtitle: "Surgical vs medical · quadrant differential · time-critical (AAA, mesenteric ischemia, perforation, ectopic, MI) · serial exams · imaging strategy",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Abdominal pain — ~8M ED visits/year; spectrum from benign to life-threatening. Surgical abdomen (peritonitis, obstruction, ischemia, perforation, AAA) requires emergent intervention. Medical causes (gastroenteritis, IBS, gastritis, functional) are more common but exclusion of surgical etiologies essential. Older adults + immunocompromised present atypically; serial abdominal exams + reassessment are foundational; imaging strategy varies by location, age, pregnancy, severity per primary source.",
                citationIDs: ["specialty_cc36b"]
            )),
            .keyValueTable(title: "Quadrant-based differential", [
                KeyValueRow(key: "RIGHT UPPER QUADRANT", value: "Cholecystitis, cholangitis, hepatitis, hepatic abscess, RLL pneumonia, Fitz-Hugh-Curtis (PID), right kidney/ureter, AAA"),
                KeyValueRow(key: "LEFT UPPER QUADRANT", value: "Splenic infarct/rupture, gastritis, peptic ulcer, pancreatitis, LLL pneumonia, MI (referred), left kidney/ureter, AAA"),
                KeyValueRow(key: "RIGHT LOWER QUADRANT", value: "Appendicitis, ovarian (ectopic, torsion, cyst rupture, PID), Meckel diverticulum, ileitis, mesenteric adenitis, hernia, ureteral colic"),
                KeyValueRow(key: "LEFT LOWER QUADRANT", value: "Diverticulitis, ovarian (ectopic, torsion, cyst rupture, PID), hernia, ureteral colic, sigmoid volvulus, IBD"),
                KeyValueRow(key: "EPIGASTRIC", value: "Peptic ulcer, pancreatitis, gastritis, MI (inferior), AAA, esophagitis, biliary, hepatic"),
                KeyValueRow(key: "PERIUMBILICAL / DIFFUSE", value: "Early appendicitis, mesenteric ischemia, bowel obstruction, gastroenteritis, IBD, peritonitis, DKA, sickle cell crisis, lead poisoning"),
                KeyValueRow(key: "SUPRAPUBIC / PELVIC", value: "Cystitis, urinary retention, pelvic (ovarian, ectopic, PID, endometriosis), uterine (fibroid, malignancy), prostatitis, hernia")
            ]),
            .keyValueTable(title: "Time-critical \"can't miss\"", [
                KeyValueRow(key: "ABDOMINAL AORTIC ANEURYSM (RUPTURED)", value: "Older male smoker + back/flank pain + hypotension + pulsatile mass; bedside US + emergent vascular surgery; 80% mortality if rupture"),
                KeyValueRow(key: "AORTIC DISSECTION", value: "Tearing pain radiating to back, BP differential, pulse deficits; CT-A; emergent surgery"),
                KeyValueRow(key: "MESENTERIC ISCHEMIA", value: "Pain OUT OF PROPORTION to exam, lactic acidosis, AF/CV disease risk; CT-A mesenteric; emergent endovascular or surgery; high mortality"),
                KeyValueRow(key: "PERFORATED VISCUS", value: "Sudden severe pain + peritoneal signs (rigid, guarding, rebound) + free air on CXR/CT; emergent surgery"),
                KeyValueRow(key: "ECTOPIC PREGNANCY (RUPTURED)", value: "Reproductive-age female + amenorrhea + abdominal pain + hypotension; β-hCG + transvaginal US; emergent surgery if rupture"),
                KeyValueRow(key: "OVARIAN TORSION", value: "Sudden severe unilateral pain + N/V; pelvic US with Doppler; emergent gyne surgery (preserve ovary)"),
                KeyValueRow(key: "TESTICULAR TORSION", value: "Sudden testicular pain + N/V + high-riding testicle + absent cremasteric reflex; emergent urology + detorsion <6 hr to preserve testis"),
                KeyValueRow(key: "BOWEL OBSTRUCTION (STRANGULATED)", value: "Distension + N/V + obstipation + fever + leukocytosis; emergent surgery for strangulation"),
                KeyValueRow(key: "ATYPICAL MI", value: "Inferior MI may present as epigastric pain; ECG + troponin in age >50 + risk factors"),
                KeyValueRow(key: "DKA / DIABETIC EMERGENCY", value: "Abdominal pain + N/V + Kussmaul respirations + altered mental status; glucose + ABG + ketones; fluids + insulin")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Vital signs + serial exams; reassess Q1-2H during evaluation; pain + abdominal exam + bowel sounds.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Pregnancy test (β-hCG) in ALL reproductive-age females.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Labs — CBC (leukocytosis, anemia), CMP (electrolytes, renal, hepatic), lipase (pancreatitis), lactate (ischemia), UA (UTI, hematuria, ketones), troponin if cardiac concern, type + screen if surgical.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("ECG — inferior MI presenting as epigastric pain, AF (mesenteric ischemia risk).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Imaging strategy — CT abdomen/pelvis with IV contrast is workhorse (sensitivity ~95% for surgical causes); ultrasound first-line for RUQ (biliary), pelvic, pregnancy, pediatric appendicitis; MRI for pregnancy when needed.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Upright CXR — free air under diaphragm = perforation; emergent.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Bedside ultrasound — biliary, AAA, free fluid (FAST), pelvic, IVC volume status.", citationIDs: ["specialty_cc36b"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("IV access (2 large-bore if surgical/unstable); fluid resuscitation as ordered; NPO until surgical decision.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Pain assessment + management — do NOT withhold analgesia for fear of masking diagnosis (proven safe); IV opioids titrated; reassess.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Antiemetics for N/V (ondansetron, metoclopramide); NG tube if obstruction.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Sepsis surveillance + antibiotics if intra-abdominal infection (after blood cultures).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Surgical readiness — pre-op labs, type + screen, consent, NPO, preop antibiotics.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Serial abdominal exams + vital signs — deterioration triggers escalation.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("DOCUMENT pain character + location + radiation + onset + relieving/aggravating + associated symptoms; updated after each reassessment.", citationIDs: ["openrn_cc36b"])
            ])
        ],
        citations: [openrnCC36B, cdcCC36B, specialtyCC36B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FeverEvaluationAdultSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "fever-evaluation-adult",
        title: "Fever evaluation (adult)",
        subtitle: "Source identification · sepsis screen · neutropenic fever (oncologic emergency) · returned traveler · drug fever · noninfectious mimics",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Fever (T ≥38.0°C / 100.4°F oral or 38.3°C / 101°F if FUO criteria) — body's response to infection, inflammation, neoplasm, or drug. Source identification is critical: pneumonia, UTI, intra-abdominal, skin/soft tissue, line/catheter, endocarditis, meningitis, viral, fungal, parasitic. Sepsis screening + bundle implementation foundational. NEUTROPENIC FEVER (ANC <500 + T ≥38.3 OR sustained ≥38.0) is oncologic emergency requiring antibiotics within 60 min per primary source.",
                citationIDs: ["specialty_cc36b"]
            )),
            .keyValueTable(title: "Source identification — major categories", [
                KeyValueRow(key: "PULMONARY", value: "Pneumonia (CAP, HAP, VAP, aspiration), TB, fungal, viral; cough + sputum + dyspnea; CXR + sputum culture"),
                KeyValueRow(key: "URINARY", value: "Pyelonephritis, complicated UTI, prostatitis; dysuria + flank pain + CVA tenderness; UA + urine culture"),
                KeyValueRow(key: "INTRA-ABDOMINAL", value: "Cholecystitis, cholangitis, diverticulitis, appendicitis, peritonitis, abscess, C. diff; abdominal pain + N/V/D; imaging + cultures"),
                KeyValueRow(key: "SKIN / SOFT TISSUE", value: "Cellulitis, abscess, necrotizing fasciitis, surgical site; redness + warmth + purulence; clinical + culture if drainage"),
                KeyValueRow(key: "BLOODSTREAM", value: "CLABSI, endocarditis, occult bacteremia; chills + rigors + line site signs; blood cultures × 2-3 + ECHO if endocarditis"),
                KeyValueRow(key: "CNS", value: "Meningitis, encephalitis, brain abscess; HA + altered mental status + meningismus; LP + imaging"),
                KeyValueRow(key: "MUSCULOSKELETAL", value: "Osteomyelitis, septic arthritis, prosthetic joint infection; localized pain + warmth + swelling; imaging + culture/aspiration"),
                KeyValueRow(key: "GENITAL / PELVIC", value: "PID, prostatitis, endometritis, postpartum fever; pelvic pain + discharge; STI workup + imaging"),
                KeyValueRow(key: "VIRAL syndromes", value: "Influenza, COVID, viral URI, gastroenteritis, infectious mononucleosis; supportive + isolation; targeted antivirals selected")
            ]),
            .keyValueTable(title: "Special situations", [
                KeyValueRow(key: "NEUTROPENIC FEVER", value: "ANC <500 + T ≥38.3 OR sustained ≥38.0; ONCOLOGIC EMERGENCY; broad-spectrum antibiotics within 60 min (cefepime, ceftazidime, pip-tazo, meropenem); add vancomycin if line/skin/mucositis/MRSA risk; MASCC score for risk stratification"),
                KeyValueRow(key: "RETURNED TRAVELER", value: "Malaria + dengue + typhoid + leptospirosis + rickettsial; detailed travel history + thick + thin smears + serology + ID consultation"),
                KeyValueRow(key: "IMMUNOCOMPROMISED (HIV/transplant/biologic)", value: "Opportunistic infections (PCP, CMV, mycobacterial, fungal); broader workup + ID consultation; lower threshold for empiric treatment"),
                KeyValueRow(key: "ENDOCARDITIS", value: "Persistent fever + bacteremia + IV drug use/valve risk; Duke criteria + ECHO + multiple blood cultures + ID + cardiology"),
                KeyValueRow(key: "FEVER OF UNKNOWN ORIGIN (FUO)", value: "≥3 weeks duration + ≥3 outpatient visits OR ≥3 inpatient days without diagnosis; infectious (1/3) + malignancy (1/3) + autoimmune (1/3); systematic workup"),
                KeyValueRow(key: "DRUG FEVER", value: "Onset 1-3 weeks after starting drug, no other cause; β-lactams, sulfa, anticonvulsants, allopurinol common; resolves with discontinuation"),
                KeyValueRow(key: "NEUROLEPTIC MALIGNANT / MALIGNANT HYPERTHERMIA / SEROTONIN syndrome", value: "Drug-induced hyperthermia + autonomic + neurologic; specific antidotes (dantrolene, cyproheptadine, benzodiazepines)")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Vital signs + qSOFA/SIRS criteria + sepsis screen on arrival.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("History — fever pattern, duration, exposures, travel, sick contacts, immunizations, medications, immunosuppression, prior infections.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Comprehensive exam — head-to-toe; skin lesions, lines, joints, oropharynx, ears, lungs, abdomen, GU, neuro.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Labs — CBC with differential (neutropenia, leukocytosis, eosinophilia), CMP, lactate, CRP, procalcitonin (bacterial vs viral), liver enzymes, urinalysis + urine culture, blood cultures × 2 BEFORE antibiotics.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Imaging — CXR (PNA, TB, mediastinitis); CT abd/pelvis if intra-abdominal; ECHO if endocarditis.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("LP if meningitis suspected (after CT if focal deficits or papilledema).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Source-specific cultures + studies — sputum, urine, blood, CSF, joint fluid, wound, stool.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Sepsis bundle (Hour-1) — measure lactate, blood cultures + broad-spectrum antibiotics, 30 mL/kg crystalloid for hypotension/lactate >4, vasopressors for refractory hypotension.", citationIDs: ["specialty_cc36b"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Vital signs + sepsis screen; IV access; cardiac monitor; supplemental O2.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Cultures BEFORE antibiotics when possible — but do NOT delay antibiotics for severe sepsis/neutropenic fever (60-min target).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Antipyretics — acetaminophen 650-1000 mg PO/PR or ibuprofen for comfort; not for fever suppression alone (may help diagnosis); cooling measures for hyperthermia >40°C.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Isolation precautions — droplet/contact/airborne based on suspected pathogen; private room for suspected TB/measles/varicella.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Hydration + electrolyte management; assess UOP + I/O.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Neutropenic precautions — private room, no fresh fruits/flowers, sick visitor screening, prompt hygiene.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Reassess + escalate — sepsis can progress rapidly; CALL rapid response/code for septic shock.", citationIDs: ["openrn_cc36b"])
            ])
        ],
        citations: [openrnCC36B, cdcCC36B, specialtyCC36B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VomitingAcuteEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "vomiting-acute-evaluation",
        title: "Acute vomiting evaluation",
        subtitle: "GI vs CNS vs metabolic vs pregnancy vs medication · time-critical (bowel obstruction, increased ICP, DKA, MI) · dehydration assessment · antiemetic selection",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Acute vomiting — common chief complaint with wide differential from benign (viral gastroenteritis) to life-threatening (bowel obstruction, increased ICP, DKA, MI, ectopic pregnancy). Distinguishing characteristics — character (projectile, bilious, bloody, feculent), timing (early morning = ICP/pregnancy, post-prandial = gastric outlet obstruction, late post-prandial = obstruction), associated symptoms guide differential per primary source.",
                citationIDs: ["specialty_cc36b"]
            )),
            .keyValueTable(title: "Etiology categories", [
                KeyValueRow(key: "GASTROINTESTINAL", value: "Gastroenteritis (viral most common), gastritis, peptic ulcer, gastroparesis, BOWEL OBSTRUCTION (especially bilious + abdominal distension), cholecystitis, pancreatitis, appendicitis, ileus, hepatitis"),
                KeyValueRow(key: "CNS", value: "Increased ICP (mass, hemorrhage, hydrocephalus) — projectile + morning + HA + papilledema; migraine; meningitis; vertigo (BPPV, Meniere); CVA"),
                KeyValueRow(key: "METABOLIC", value: "DKA, uremia, adrenal insufficiency, hypercalcemia, hyponatremia, thyroid storm, Addisonian crisis"),
                KeyValueRow(key: "PREGNANCY", value: "Hyperemesis gravidarum, ectopic pregnancy, eclampsia + HELLP syndrome"),
                KeyValueRow(key: "CARDIAC", value: "Inferior MI (vagal stimulation), CHF; consider in elderly + diabetic + risk factors"),
                KeyValueRow(key: "MEDICATION", value: "Chemotherapy (CINV), opioids, antibiotics, digoxin toxicity, NSAIDs, aspirin, theophylline, lithium, iron"),
                KeyValueRow(key: "TOXIC INGESTION", value: "Mushroom poisoning, food poisoning, heavy metals, organophosphate, methanol/ethylene glycol; CO poisoning"),
                KeyValueRow(key: "PSYCHIATRIC / FUNCTIONAL", value: "Cyclic vomiting syndrome, bulimia nervosa, anxiety; diagnosis of exclusion"),
                KeyValueRow(key: "POST-OPERATIVE", value: "PONV from anesthesia; opioid-induced; ileus")
            ]),
            .keyValueTable(title: "Time-critical \"can't miss\"", [
                KeyValueRow(key: "BOWEL OBSTRUCTION", value: "Distension + obstipation + bilious vomiting + tinkling/absent bowel sounds; CT or upright KUB (air-fluid levels); strangulation = surgical emergency"),
                KeyValueRow(key: "INCREASED ICP", value: "Morning HA + projectile vomiting + papilledema + altered mental status + focal deficits; emergent CT/MRI; mannitol + head of bed 30°; neurosurgery"),
                KeyValueRow(key: "DKA", value: "Polyuria + polydipsia + Kussmaul + abdominal pain + altered mental status; glucose + ABG + ketones; fluids + insulin + K"),
                KeyValueRow(key: "INFERIOR MI", value: "Atypical presentation with N/V + diaphoresis + lightheadedness; ECG + troponin; age >50 + risk factors"),
                KeyValueRow(key: "ECTOPIC PREGNANCY", value: "Reproductive-age female + amenorrhea + abdominal pain; β-hCG + transvaginal US"),
                KeyValueRow(key: "ADRENAL CRISIS", value: "Vomiting + hypotension + hyponatremia + hyperkalemia + hypoglycemia; AM cortisol + ACTH; hydrocortisone + fluids + glucose"),
                KeyValueRow(key: "MENINGITIS / ENCEPHALITIS", value: "Fever + HA + neck stiffness + altered mental status; LP + empiric antibiotics + steroids"),
                KeyValueRow(key: "PYLORIC STENOSIS (peds)", value: "Projectile non-bilious vomiting in infant 2-8 weeks; olive mass + visible peristalsis; ultrasound + surgical correction"),
                KeyValueRow(key: "CANNABIS HYPEREMESIS SYNDROME", value: "Cyclic vomiting + chronic heavy cannabis use + hot shower relief; supportive + cannabis cessation")
            ]),
            .keyValueTable(title: "Antiemetic selection", [
                KeyValueRow(key: "5HT3 antagonists", value: "Ondansetron 4-8 mg IV/PO/ODT — first-line for most; chemotherapy + post-op + general; QTc prolongation caution"),
                KeyValueRow(key: "Dopamine antagonists", value: "Metoclopramide 10 mg IV/PO — gastroparesis + chemo + opioid-induced; EPS + tardive dyskinesia risk (especially long-term); avoid in Parkinson"),
                KeyValueRow(key: "Phenothiazines", value: "Prochlorperazine 5-10 mg IV/PO/PR — general; promethazine 12.5-25 mg IV/PO/PR; EPS + tissue necrosis with extravasation; not <2 years (respiratory depression)"),
                KeyValueRow(key: "NK1 antagonists", value: "Aprepitant + fosaprepitant — chemotherapy-induced nausea + vomiting (acute + delayed)"),
                KeyValueRow(key: "Antihistamines", value: "Meclizine, diphenhydramine — vestibular nausea (vertigo, motion sickness); sedation"),
                KeyValueRow(key: "Corticosteroids", value: "Dexamethasone — antiemetic adjunct; chemotherapy; immune-related; bowel obstruction palliation"),
                KeyValueRow(key: "Cannabinoids", value: "Dronabinol, nabilone — refractory chemotherapy-induced; appetite stimulation"),
                KeyValueRow(key: "Benzodiazepines", value: "Lorazepam — anticipatory chemotherapy nausea; anxiety component"),
                KeyValueRow(key: "PYRIDOXINE + DOXYLAMINE", value: "Hyperemesis gravidarum — first-line; B6 + Unisom; ginger adjunct")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Vital signs + orthostatics + assess dehydration (mucous membranes, skin turgor, urine output, mental status).", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Pregnancy test (β-hCG) in ALL reproductive-age females.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Glucose check (DKA, hypoglycemia, adrenal); ECG (cardiac etiology, electrolyte effects).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Labs — CBC, BMP (electrolytes, BUN/Cr — dehydration, AKI), LFTs, lipase, magnesium, urinalysis; ABG + ketones if DKA suspected.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Imaging based on differential — KUB or CT abdomen/pelvis for obstruction, head CT for ICP, US for biliary or pelvic.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Medication review — recently started, dose changes, OTC + supplements.", citationIDs: ["openrn_cc36b"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("IV fluids (NS or LR) for dehydration; bolus 20 mL/kg → reassess; correct electrolyte abnormalities (especially K, Mg, Cl/HCO3).", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Antiemetic selection per suspected etiology + safety profile; ondansetron first-line for most.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("NG tube for refractory vomiting + obstruction + ileus — decompression + symptom relief.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("NPO until tolerating PO; gradual advancement (clear liquids → BRAT → regular); avoid forcing.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Aspiration precautions — head of bed up + suction available + monitor LOC.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Pain management — coordinate with antiemetics; opioids worsen N/V.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Discharge teaching — when to return (worsening, dehydration signs, can't keep fluids down), hydration plan, BRAT diet, antiemetic use.", citationIDs: ["openrn_cc36b"])
            ])
        ],
        citations: [openrnCC36B, cdcCC36B, specialtyCC36B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DiarrheaAcuteEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "diarrhea-acute-evaluation",
        title: "Acute diarrhea evaluation",
        subtitle: "Inflammatory vs non-inflammatory · viral vs bacterial vs parasitic · C. diff · traveler's · dehydration assessment · oral rehydration vs IV",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Acute diarrhea (<14 days) — most common cause of GI clinic visits; usually self-limited but significant cause of dehydration + mortality (especially pediatric + elderly). Distinguish INFLAMMATORY (bloody, mucus, fever, leukocytes — invasive bacteria, IBD flare) from NON-INFLAMMATORY (watery, large volume — viral, toxin-mediated, secretory). Most acute self-limited; targeted antibiotics for severe + immunocompromised + traveler's per primary source.",
                citationIDs: ["specialty_cc36b"]
            )),
            .keyValueTable(title: "Etiology categories", [
                KeyValueRow(key: "VIRAL (most common)", value: "Norovirus (most common adult), rotavirus (peds), adenovirus, astrovirus; self-limited 1-3 days; supportive"),
                KeyValueRow(key: "BACTERIAL (inflammatory)", value: "Salmonella, Shigella, Campylobacter, E. coli (especially EHEC O157:H7 — HUS risk; AVOID antibiotics), Yersinia, Vibrio; antibiotics for severe + traveler's"),
                KeyValueRow(key: "BACTERIAL (toxin-mediated, non-inflammatory)", value: "Cholera, ETEC (traveler's), Staph aureus food poisoning, Bacillus cereus, Clostridium perfringens; supportive + rehydration"),
                KeyValueRow(key: "C. DIFFICILE", value: "Antibiotic + healthcare-associated; toxin A/B; severe colitis; fidaxomicin or vancomycin oral; bezlotoxumab for recurrence prevention"),
                KeyValueRow(key: "PARASITIC", value: "Giardia (travel, day care, hikers), Cryptosporidium (immunocompromised, AIDS), Entamoeba histolytica (developing countries); stool O&P + antigen"),
                KeyValueRow(key: "INFLAMMATORY BOWEL DISEASE", value: "Crohn + UC flare; chronic but acute exacerbations; CT/colonoscopy; steroids + immunomodulators"),
                KeyValueRow(key: "MEDICATION-INDUCED", value: "Antibiotics (any), metformin, colchicine, magnesium, PPI, chemotherapy, laxative abuse"),
                KeyValueRow(key: "ENDOCRINE", value: "Hyperthyroidism, diabetic autonomic neuropathy, carcinoid syndrome, VIPoma, gastrinoma; chronic"),
                KeyValueRow(key: "ISCHEMIC COLITIS", value: "Older + vascular disease; bloody diarrhea + abdominal pain; CT + colonoscopy"),
                KeyValueRow(key: "FOOD INTOLERANCE / MALABSORPTION", value: "Lactose, fructose, celiac, fat malabsorption; chronic; specific workup"),
                KeyValueRow(key: "RUNNER'S DIARRHEA", value: "Exercise-related; lifestyle modification")
            ]),
            .keyValueTable(title: "Red flags + when to test", [
                KeyValueRow(key: "BLOODY diarrhea", value: "Stool culture, C. diff toxin, O&P; consider EHEC (DO NOT use antibiotics — HUS risk); IBD workup if recurrent"),
                KeyValueRow(key: "FEVER ≥38.5°C", value: "Suggests invasive bacterial; culture + treat"),
                KeyValueRow(key: "Severe abdominal pain / peritoneal signs", value: "Rule out toxic megacolon (C. diff, UC), ischemic colitis, perforation; imaging"),
                KeyValueRow(key: "Severe dehydration / hypotension", value: "IV fluids + ICU; lactate; electrolytes; consider sepsis"),
                KeyValueRow(key: "Immunocompromise (HIV, transplant, chemotherapy)", value: "Broader infectious workup including parasites + CMV; lower threshold for treatment"),
                KeyValueRow(key: "Antibiotic use within 3 months", value: "C. diff testing — toxin EIA + GDH + PCR; treat presumptively if severe"),
                KeyValueRow(key: "Healthcare exposure", value: "C. diff + nosocomial pathogens"),
                KeyValueRow(key: "Travel history", value: "Traveler's diarrhea — ETEC most common; consider Shigella, Salmonella, parasites; targeted antibiotics for severe (azithro, fluoroquinolone)"),
                KeyValueRow(key: "Age >70 or <5", value: "Higher dehydration + complication risk; lower threshold for workup")
            ]),
            .keyValueTable(title: "Dehydration assessment + rehydration", [
                KeyValueRow(key: "Mild (3-5%)", value: "Slightly dry mucous membranes, normal vital signs, normal mental status; ORS or oral hydration outpatient"),
                KeyValueRow(key: "Moderate (6-9%)", value: "Dry mucous membranes, tachycardia, delayed capillary refill, decreased urine output; aggressive ORS + IV if not tolerating PO"),
                KeyValueRow(key: "Severe (≥10%)", value: "Sunken eyes/fontanelle, very dry, weak pulse, hypotension, altered mental status; IV bolus 20 mL/kg NS → reassess → repeat"),
                KeyValueRow(key: "ORS composition", value: "Glucose 75 mmol/L + Na 75 mmol/L (WHO formula); promotes Na + water absorption via SGLT1; superior to sports drinks for replacement"),
                KeyValueRow(key: "Continue normal diet", value: "BRAT not necessary; continue regular age-appropriate diet during diarrhea (resolves faster); breastfeeding continues + supplementary ORS")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("History — duration, frequency, character (bloody, mucus, watery, large volume), associated symptoms (fever, abdominal pain, N/V), exposures (food, water, travel, day care, hospital, sick contacts), medications + antibiotics.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Vital signs + dehydration assessment + abdominal exam.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Stool studies for severe + persistent + red flags — culture (Salmonella, Shigella, Campylobacter, Yersinia, E. coli), C. diff toxin EIA + GDH + PCR, O&P (parasites), Giardia + Cryptosporidium antigen, occult blood, fecal lactoferrin/calprotectin (inflammatory).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Labs — BMP (electrolytes, BUN/Cr — dehydration, AKI), CBC (anemia, leukocytosis), CRP (inflammatory).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Imaging if peritoneal signs, severe pain, suspected toxic megacolon — CT abdomen/pelvis.", citationIDs: ["specialty_cc36b"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Rehydration is priority — ORS for mild-moderate; IV fluids for severe; assess + reassess hydration status.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Antidiarrheals — loperamide 4 mg initial then 2 mg after each loose stool (max 16 mg/day) FOR NON-INVASIVE; DO NOT use in bloody diarrhea OR suspected C. diff OR febrile inflammatory diarrhea (worsens).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Bismuth subsalicylate — adjunct for traveler's; multiple doses per day.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Targeted antibiotics — severe traveler's (azithromycin 1g single dose), severe shigellosis, persistent giardiasis (metronidazole), C. diff (fidaxomicin or vancomycin oral).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Contact + enteric precautions for known/suspected infectious diarrhea; private room for C. diff (soap + water, not just alcohol); dedicated equipment.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Probiotics — adjunct for antibiotic-associated diarrhea; mixed evidence; some benefit for C. diff prevention.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Discharge teaching — hand hygiene, food safety, hydration, when to return (blood, severe dehydration, fever, severe pain).", citationIDs: ["openrn_cc36b"])
            ])
        ],
        citations: [openrnCC36B, cdcCC36B, specialtyCC36B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RashEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "rash-evaluation",
        title: "Rash evaluation",
        subtitle: "Time-critical (SJS/TEN, DRESS, meningococcemia, RMSF, necrotizing fasciitis, anaphylaxis) · morphology + distribution · drug-induced · contagious vs non",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Rash — common chief complaint with broad differential from benign to life-threatening. Recognition of EMERGENCY rashes critical: SJS/TEN (drug-induced skin death), DRESS syndrome, meningococcemia, RMSF, necrotizing fasciitis, toxic shock syndrome, anaphylaxis, erythroderma. Morphology (macule, papule, vesicle, bulla, pustule, plaque, wheal, petechiae, purpura) + distribution + associated symptoms guide differential per primary source.",
                citationIDs: ["specialty_cc36b"]
            )),
            .keyValueTable(title: "Dermatologic emergencies (\"can't miss\")", [
                KeyValueRow(key: "STEVENS-JOHNSON / TOXIC EPIDERMAL NECROLYSIS", value: "Drug-induced (sulfa, anticonvulsants, allopurinol, nevirapine, lamotrigine); painful skin/mucous membrane shedding; <10% BSA = SJS, >30% = TEN; STOP DRUG; ICU/burn unit; supportive; IVIG/cyclosporine"),
                KeyValueRow(key: "DRESS SYNDROME", value: "Drug Reaction with Eosinophilia + Systemic Symptoms; 2-8 weeks after starting drug; rash + fever + lymphadenopathy + facial swelling + organ involvement (hepatitis, nephritis, myocarditis); stop drug + systemic steroids"),
                KeyValueRow(key: "MENINGOCOCCEMIA", value: "Petechiae + purpura (purpura fulminans) + fever + altered mental status; sepsis + meningitis; EMERGENT antibiotics (ceftriaxone) + dexamethasone + droplet isolation"),
                KeyValueRow(key: "ROCKY MOUNTAIN SPOTTED FEVER", value: "Fever + HA + rash starting on wrists/ankles spreading centrally (centripetal); tick exposure; doxycycline EMPIRICALLY (do not delay for confirmation)"),
                KeyValueRow(key: "NECROTIZING FASCIITIS", value: "Severe pain out of proportion + erythema + crepitus + systemic toxicity + rapid progression; surgical emergency + broad-spectrum antibiotics + ICU"),
                KeyValueRow(key: "TOXIC SHOCK SYNDROME", value: "Fever + hypotension + diffuse macular rash with desquamation (palms/soles); staph or strep; identify + remove source (tampon, packing, wound); antibiotics + IVIG + supportive"),
                KeyValueRow(key: "ANAPHYLAXIS", value: "Urticaria + angioedema + bronchospasm + hypotension; EPINEPHRINE IM FIRST LINE + supportive"),
                KeyValueRow(key: "ERYTHRODERMA / EXFOLIATIVE DERMATITIS", value: "Generalized erythema + scaling >90% BSA; underlying psoriasis, eczema, drug, lymphoma; hospitalization + fluid + electrolyte + temperature + protein + skin care"),
                KeyValueRow(key: "STAPHYLOCOCCAL SCALDED SKIN", value: "Pediatric + immunocompromised; bullae + desquamation; toxin-mediated; antibiotics + supportive"),
                KeyValueRow(key: "PURPURA FULMINANS", value: "Acute hemorrhagic skin necrosis from DIC (sepsis, protein C/S deficiency); ICU + treat underlying + replacement")
            ]),
            .keyValueTable(title: "Morphology + differential", [
                KeyValueRow(key: "Macular", value: "Flat color change; drug eruption, viral exanthem, secondary syphilis, tinea versicolor"),
                KeyValueRow(key: "Papular / maculopapular", value: "Drug eruption, viral exanthem (measles, rubella, fifth disease, roseola), scabies, syphilis, pityriasis rosea, eczema"),
                KeyValueRow(key: "Vesicular / bullous", value: "HSV, varicella/zoster, hand-foot-mouth (Coxsackie), bullous pemphigoid, pemphigus vulgaris, drug-induced, contact dermatitis, friction blister"),
                KeyValueRow(key: "Pustular", value: "Acne, folliculitis, furuncle, impetigo (bullous + non-bullous), psoriasis (pustular), AGEP (drug)"),
                KeyValueRow(key: "Plaque", value: "Psoriasis, eczema, lichen planus, mycosis fungoides"),
                KeyValueRow(key: "Petechiae / purpura", value: "Thrombocytopenia, vasculitis (HSP, ANCA), septic emboli, meningococcemia, RMSF, DIC, leukemia"),
                KeyValueRow(key: "Urticaria (wheals)", value: "Allergic (IgE), idiopathic, autoimmune, physical (cold, pressure, dermatographic), urticarial vasculitis"),
                KeyValueRow(key: "Angioedema", value: "Allergic, ACE-inhibitor (bradykinin), hereditary (C1 inhibitor), idiopathic; airway compromise risk")
            ]),
            .keyValueTable(title: "Drug-induced rashes", [
                KeyValueRow(key: "Maculopapular (most common, 5-10% of drug reactions)", value: "Penicillin, sulfa, anticonvulsants; benign typically; stop drug; antihistamines"),
                KeyValueRow(key: "Urticaria / angioedema", value: "Penicillin, NSAIDs, ACE-I (angioedema specifically); IgE OR direct mast cell; epinephrine if severe"),
                KeyValueRow(key: "Fixed drug eruption", value: "Same site every drug exposure; sulfa, NSAIDs, doxycycline, TMP-SMX; pigmentation persists"),
                KeyValueRow(key: "Photosensitivity", value: "Tetracyclines, fluoroquinolones, thiazides, sulfa; sun-exposed areas"),
                KeyValueRow(key: "SJS / TEN", value: "Sulfa, anticonvulsants (lamotrigine, carbamazepine, phenytoin), allopurinol, nevirapine; 1-4 weeks after start; emergency"),
                KeyValueRow(key: "DRESS", value: "Anticonvulsants, allopurinol, sulfa, dapsone, abacavir; 2-8 weeks after start; emergency"),
                KeyValueRow(key: "AGEP (acute generalized exanthematous pustulosis)", value: "Pustular reaction days after starting; β-lactams, macrolides, antifungals; supportive"),
                KeyValueRow(key: "DRUG INDUCED LUPUS", value: "Hydralazine, procainamide, isoniazid; ANA + anti-histone; reversible")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("History — duration, onset, distribution, evolution, associated symptoms (fever, joint pain, mucosal involvement, organ symptoms), medications + recent additions, exposures (sick contacts, travel, occupational, sexual, pets, ticks), allergies, prior rashes.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Comprehensive skin exam — total body including mucous membranes (oral, conjunctival, genital — SJS/TEN), nail beds, scalp, palms/soles (syphilis, RMSF), photograph for documentation.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Vital signs + systemic exam — fever, lymphadenopathy, organomegaly, joint involvement.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Labs based on suspicion — CBC (eosinophilia DRESS), CMP (hepatitis, nephritis DRESS), CRP, blood cultures if febrile + ill, skin biopsy + DIF for unclear/severe.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Mucosal involvement (eyes, mouth, genitals) — alarming sign for SJS/TEN; ophthalmology consult.", citationIDs: ["specialty_cc36b"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Recognize EMERGENCY rashes — mucosal involvement, petechiae, severe pain out of proportion, fever, hypotension, systemic illness → escalate immediately.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("STOP suspected offending medication; medication reconciliation + allergy update.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Isolation precautions — droplet (varicella, meningococcus pending), contact (scabies, severe lesions), airborne (varicella, measles).", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Topical care — appropriate to morphology (occlusive, drying, soothing); avoid further irritation.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Pain + pruritus management — antihistamines, topical steroids per protocol, opioids for severe (SJS/TEN, necrotizing).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Burn unit / ICU referral for SJS/TEN — fluid + electrolyte + temperature + nutritional + skin care.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Patient + family education — diagnosis, contagion (if applicable), follow-up, when to return, drug allergies + medical alert ID.", citationIDs: ["openrn_cc36b"])
            ])
        ],
        citations: [openrnCC36B, cdcCC36B, specialtyCC36B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AcuteBackPainEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "acute-back-pain-evaluation",
        title: "Acute back pain evaluation",
        subtitle: "Red flags · cauda equina + epidural abscess + spinal cord compression + AAA · MSK vs visceral · imaging when warranted · conservative management primary",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Low back pain — affects 80% of adults during lifetime; usually MSK + self-limited (resolves 4-6 weeks). Red flag screening identifies serious underlying pathology — fracture, cancer, infection, cauda equina, AAA, visceral disease. Imaging NOT indicated for acute uncomplicated back pain — conservative management first-line. Time-critical conditions (cauda equina, epidural abscess, spinal cord compression, AAA) require emergent workup + treatment per primary source.",
                citationIDs: ["specialty_cc36b"]
            )),
            .keyValueTable(title: "RED FLAGS — emergent imaging + workup", [
                KeyValueRow(key: "CAUDA EQUINA SYNDROME", value: "Saddle anesthesia + bilateral leg weakness + urinary retention/incontinence + fecal incontinence + decreased anal tone; EMERGENT MRI + neurosurgery; surgical decompression within 24-48 hr to prevent permanent deficits"),
                KeyValueRow(key: "EPIDURAL ABSCESS", value: "IV drug use + recent spine procedure + immunosuppression + fever + severe localized back pain + neurologic deficits; emergent MRI + antibiotics + neurosurgery"),
                KeyValueRow(key: "MALIGNANCY", value: "Age >50 + history of cancer + unexplained weight loss + night pain + progressive symptoms + no improvement with conservative; imaging + oncology"),
                KeyValueRow(key: "FRACTURE", value: "Trauma + osteoporosis + steroid use + minor trauma in elderly; vertebral body height loss; imaging (X-ray + CT/MRI)"),
                KeyValueRow(key: "SPINAL CORD COMPRESSION", value: "Cancer history + new back pain + neurologic deficits; emergent MRI + dexamethasone + radiation/surgery; ambulatory status at diagnosis predicts outcome"),
                KeyValueRow(key: "ABDOMINAL AORTIC ANEURYSM", value: "Older male smoker + sudden severe back/flank pain + hypotension + pulsatile abdominal mass; bedside US + emergent vascular surgery"),
                KeyValueRow(key: "INFECTION (osteomyelitis, discitis)", value: "Fever + IVDU + immunosuppression + diabetic + chronic; ESR/CRP elevated; MRI + cultures + antibiotics"),
                KeyValueRow(key: "PYELONEPHRITIS / NEPHROLITHIASIS", value: "Flank pain + costovertebral angle tenderness + dysuria/fever + hematuria; UA + culture + imaging + antibiotics/stones management")
            ]),
            .keyValueTable(title: "Common causes (NON-emergent)", [
                KeyValueRow(key: "MUSCULOSKELETAL strain / sprain", value: "Most common; activity-related, no neurologic deficits, no red flags; conservative management"),
                KeyValueRow(key: "DEGENERATIVE DISC DISEASE", value: "Chronic with acute flares; age-related; conservative + epidural injections for selected"),
                KeyValueRow(key: "HERNIATED DISC", value: "Radicular pain (sciatica), positive straight-leg raise, dermatomal sensory loss + weakness; usually resolves 4-6 weeks; surgery for severe/persistent"),
                KeyValueRow(key: "SPINAL STENOSIS", value: "Pseudoclaudication — pain with walking, relieved by sitting/forward flexion; older adults; conservative + epidural + surgery"),
                KeyValueRow(key: "FACET JOINT", value: "Localized + worse with extension; facet injections diagnostic + therapeutic"),
                KeyValueRow(key: "SPONDYLOLISTHESIS", value: "Mechanical low back pain + radicular; X-ray flexion-extension views"),
                KeyValueRow(key: "ANKYLOSING SPONDYLITIS", value: "Inflammatory back pain in young adult, morning stiffness, improvement with exercise; HLA-B27; rheumatology"),
                KeyValueRow(key: "FIBROMYALGIA", value: "Diffuse pain + multiple tender points + fatigue + sleep disturbance; clinical diagnosis")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Detailed history — onset, character, radiation, severity, exacerbating/relieving factors, neurologic symptoms, bowel/bladder, prior episodes, trauma, work, age + medical history, cancer history, IVDU, immunosuppression.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Comprehensive exam — inspection, palpation (tenderness, paraspinal muscles), ROM, neurologic (motor, sensory, reflexes, gait, straight-leg raise), perianal sensation + rectal tone if red flags.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Cardiovascular exam if AAA suspected; abdominal exam for pulsatile mass.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("NO IMAGING for uncomplicated acute back pain in first 4-6 weeks without red flags; high false positive rate, doesn't improve outcomes, exposes radiation.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Imaging with red flags — X-ray for fracture, MRI for cauda equina/epidural abscess/cord compression/severe radiculopathy; CT for trauma + when MRI contraindicated.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Labs if red flags — CBC, ESR/CRP (infection, malignancy), UA + urine culture, electrolytes + Cr (NSAID safety).", citationIDs: ["specialty_cc36b"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Pain assessment + management — NSAIDs first-line if no contraindications; acetaminophen as adjunct; muscle relaxants short-term (cyclobenzaprine); opioids LIMITED + short course only when needed.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Conservative management first-line — RELATIVE rest (NOT bed rest — worsens outcomes), early mobilization, heat/cold, position changes, PT referral.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Patient education — natural history (90% resolve 4-6 weeks), red flags to return, activity modification, ergonomics, posture, exercises.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Avoid prolonged bed rest — early activity + return to function improve outcomes.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("RED FLAG SCREENING at every encounter — escalate immediately if cauda equina/abscess/cord compression/AAA suspected.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Chronic pain transition — non-pharm (PT, yoga, tai chi, CBT, mindfulness) primary; avoid long-term opioids; multidisciplinary pain management.", citationIDs: ["specialty_cc36b"])
            ])
        ],
        citations: [openrnCC36B, cdcCC36B, specialtyCC36B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DizzinessVertigoEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "dizziness-vertigo-evaluation",
        title: "Dizziness / vertigo evaluation",
        subtitle: "Peripheral vs central · BPPV + Meniere + vestibular neuritis + cerebellar stroke · HINTS exam · Dix-Hallpike · time-critical stroke screening",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Dizziness — vague chief complaint encompassing vertigo (spinning sensation, vestibular), pre-syncope (faintness, cardiovascular), disequilibrium (imbalance, neurologic), and lightheadedness (anxiety, metabolic). Approach focuses on distinguishing peripheral (inner ear) from central (brain, cerebellum) causes — central etiologies include stroke + carrying significant morbidity/mortality. HINTS exam (Head Impulse, Nystagmus, Test of Skew) more sensitive than MRI in acute vestibular syndrome for distinguishing peripheral vs central per primary source.",
                citationIDs: ["specialty_cc36b"]
            )),
            .keyValueTable(title: "Categorize first — type of dizziness", [
                KeyValueRow(key: "VERTIGO (spinning)", value: "Vestibular origin — peripheral (BPPV, vestibular neuritis, Meniere, labyrinthitis) vs central (stroke, MS, migraine, brainstem)"),
                KeyValueRow(key: "PRE-SYNCOPE (faintness)", value: "Cardiovascular — orthostatic hypotension, arrhythmia, valvular, anemia; ECG + orthostatics + workup"),
                KeyValueRow(key: "DISEQUILIBRIUM (imbalance)", value: "Neurologic — cerebellar dysfunction, Parkinson, peripheral neuropathy, vestibular hypofunction, vision/proprioception issues"),
                KeyValueRow(key: "LIGHTHEADEDNESS (vague)", value: "Anxiety, hyperventilation, hypoglycemia, medication side effect, vague + hard to characterize")
            ]),
            .keyValueTable(title: "Peripheral vs central vertigo", [
                KeyValueRow(key: "PERIPHERAL features", value: "Sudden onset, intermittent, severe spinning, horizontal/torsional nystagmus (suppressed by fixation), N/V severe, no neurologic deficits, hearing loss/tinnitus may be present (Meniere); usually fatigable + position-dependent"),
                KeyValueRow(key: "CENTRAL features", value: "Gradual onset, continuous, mild-moderate spinning, vertical/multidirectional nystagmus (NOT suppressed by fixation), N/V mild, neurologic deficits (diplopia, dysarthria, dysphagia, weakness, ataxia, cranial nerve palsies), age + vascular risk factors"),
                KeyValueRow(key: "HINTS exam", value: "Head Impulse normal/Nystagmus direction-changing/Test of Skew positive — CENTRAL; opposite findings — peripheral; in acute continuous vertigo more sensitive than MRI in first 24-48 hours")
            ]),
            .keyValueTable(title: "Specific peripheral causes", [
                KeyValueRow(key: "BPPV (most common)", value: "Brief episodes (<1 min) triggered by head position changes (rolling over, looking up); Dix-Hallpike positive (rotational nystagmus); EPLEY maneuver therapeutic"),
                KeyValueRow(key: "VESTIBULAR NEURITIS", value: "Sudden severe continuous vertigo + N/V, recent viral illness, no hearing loss; HINTS suggests peripheral; supportive + steroids + meclizine/diphenhydramine short course"),
                KeyValueRow(key: "LABYRINTHITIS", value: "Vestibular neuritis + hearing loss + tinnitus; viral; supportive + antibiotics if bacterial"),
                KeyValueRow(key: "MENIERE DISEASE", value: "Episodic vertigo + fluctuating hearing loss + tinnitus + ear fullness; weeks-hours; salt restriction + diuretics + intratympanic steroids"),
                KeyValueRow(key: "ACOUSTIC NEUROMA", value: "Gradual unilateral hearing loss + tinnitus + imbalance; MRI brain; surgical/radiation")
            ]),
            .keyValueTable(title: "Specific central causes — time-critical", [
                KeyValueRow(key: "CEREBELLAR / BRAINSTEM STROKE", value: "Vascular risk factors + sudden onset + central HINTS + neurologic deficits + headache + sometimes only vertigo; emergent imaging (MRI + DWI more sensitive than CT for posterior circulation); tPA + thrombectomy candidates"),
                KeyValueRow(key: "VERTEBROBASILAR INSUFFICIENCY / TIA", value: "Transient episodes + diplopia + dysarthria + ataxia + drop attacks; MRA + treat risk factors"),
                KeyValueRow(key: "MS", value: "Young adults + episodic neurologic symptoms + relapsing-remitting; MRI brain + spine + LP"),
                KeyValueRow(key: "MIGRAINE-ASSOCIATED VERTIGO", value: "Migraine history + episodic vertigo + photophobia/phonophobia; migraine prophylaxis"),
                KeyValueRow(key: "POSTERIOR CIRCULATION TUMOR", value: "Progressive; imaging diagnostic")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("History — categorize type (spinning vs faint vs imbalance vs vague), onset (sudden vs gradual), duration (seconds vs minutes vs hours vs continuous), triggers (position, exertion, stress), associated symptoms (hearing, neurologic, cardiac).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Vital signs + orthostatics; cardiac exam + neurologic exam (cranial nerves, cerebellar, gait); HINTS exam if acute continuous vertigo.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Dix-Hallpike maneuver if positional intermittent vertigo (BPPV).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Audiometry if hearing loss + Meniere/acoustic neuroma suspected.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Imaging — MRI brain with DWI if central features OR HINTS positive (CT poor for posterior circulation); MRA neck if vertebrobasilar concern.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("ECG + orthostatics if pre-syncope; glucose if hypoglycemia possible; medication review.", citationIDs: ["specialty_cc36b"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Fall prevention + safety; assist with ambulation; bedside commode.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Symptomatic treatment — meclizine + dimenhydrinate for severe; SHORT TERM (vestibular suppressants delay recovery if used chronically).", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Antiemetics for severe N/V — ondansetron + promethazine.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Epley maneuver for BPPV — performed at bedside; teach patient self-Epley for recurrence.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Hydration — vertigo with severe N/V may cause dehydration.", citationIDs: ["openrn_cc36b"]),
                AttributedBullet("Posterior circulation stroke vigilance — central features OR unable to rule out CALL STROKE/NEURO; do not delay imaging.", citationIDs: ["specialty_cc36b"]),
                AttributedBullet("Vestibular rehabilitation referral for chronic/persistent; CBT for chronic dizziness/anxiety component.", citationIDs: ["specialty_cc36b"])
            ])
        ],
        citations: [openrnCC36B, cdcCC36B, specialtyCC36B],
        lastSourceFidelityReview: "2026-05-13"
    )
}
