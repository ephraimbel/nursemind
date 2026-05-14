import Foundation

// Curator-model references (round 39 part A — lab panel interpretation references).

private let openrnLI39A = CitationSource(
    id: "openrn_li39a",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcLI39A = CitationSource(
    id: "cdc_li39a",
    shortName: "CDC + NIH + AHRQ concept citations",
    publisher: "CDC · NIH · AHRQ",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLI39A = CitationSource(
    id: "specialty_li39a",
    shortName: "ASH + NKF + AASLD + ATS + AHA + AACE fact citations",
    publisher: "ASH · NKF · AASLD · ATS · AHA · AACE",
    license: .factCitationOnly,
    url: "https://www.hematology.org/",
    lastRetrieved: "2026-05-13"
)

private let labRefTagsR39A = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)

public enum CBCInterpretationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cbc-interpretation-comprehensive",
        title: "CBC interpretation",
        subtitle: "WBC + diff + RBC + indices (MCV, MCH, MCHC, RDW) + platelets · anemia workup (microcytic/normocytic/macrocytic) · leukocytosis differential · thrombocytopenia approach",
        eyebrow: "REFERENCE · LAB INTERPRETATION",
        nclexTags: labRefTagsR39A,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Complete blood count (CBC) — most commonly ordered lab; provides info on three cell lines (RBC, WBC, platelets). Systematic interpretation involves reviewing each cell line + indices + correlating with clinical context. Approach to specific abnormalities — anemia by MCV (microcytic <80 vs normocytic 80-100 vs macrocytic >100), leukocytosis by differential (neutrophilia vs lymphocytosis vs eosinophilia), thrombocytopenia by mechanism (production vs destruction vs sequestration) per primary source.",
                citationIDs: ["specialty_li39a"]
            )),
            .keyValueTable(title: "Reference ranges (adult)", [
                KeyValueRow(key: "WBC", value: "4.5-11 × 10⁹/L (4500-11000/μL)"),
                KeyValueRow(key: "RBC", value: "M: 4.7-6.1 × 10¹²/L; F: 4.2-5.4 × 10¹²/L"),
                KeyValueRow(key: "Hemoglobin", value: "M: 13.5-17.5 g/dL; F: 12.0-15.5 g/dL"),
                KeyValueRow(key: "Hematocrit", value: "M: 41-53%; F: 36-46%"),
                KeyValueRow(key: "MCV (mean cell volume)", value: "80-100 fL"),
                KeyValueRow(key: "MCH (mean cell hemoglobin)", value: "27-33 pg"),
                KeyValueRow(key: "MCHC", value: "32-36 g/dL"),
                KeyValueRow(key: "RDW (red cell distribution width)", value: "11.5-14.5%"),
                KeyValueRow(key: "Platelets", value: "150-450 × 10⁹/L")
            ]),
            .keyValueTable(title: "Anemia by MCV — workup approach", [
                KeyValueRow(key: "MICROCYTIC (MCV <80)", value: "IRON DEFICIENCY (most common — low ferritin, high TIBC, low transferrin sat); thalassemia (low MCV out of proportion to anemia, high RBC, RDW normal); chronic disease (mild microcytosis, normal/high ferritin, low TIBC); sideroblastic; lead poisoning"),
                KeyValueRow(key: "NORMOCYTIC (MCV 80-100)", value: "ACUTE BLOOD LOSS, hemolysis (high LDH + bilirubin, low haptoglobin, high reticulocytes), chronic disease (most common), CKD (low erythropoietin), bone marrow failure (low retics + multi-lineage cytopenias), early iron/B12/folate deficiency"),
                KeyValueRow(key: "MACROCYTIC (MCV >100)", value: "MEGALOBLASTIC — B12 deficiency (low B12, high MMA + homocysteine; pernicious anemia, malabsorption, vegan), folate deficiency (low folate, normal MMA, high homocysteine; alcoholism, malnutrition); NON-MEGALOBLASTIC — alcoholism, hypothyroidism, liver disease, MDS, drug-induced (methotrexate, hydroxyurea, AZT, TMP-SMX)"),
                KeyValueRow(key: "RDW — high vs low", value: "HIGH RDW = mixed cell sizes (mixed deficiencies, recovering hemolysis, early treatment); LOW/NORMAL RDW = uniform (thalassemia, anemia of chronic disease)")
            ]),
            .keyValueTable(title: "Leukocytosis differential", [
                KeyValueRow(key: "NEUTROPHILIA (>7,500)", value: "Bacterial infection, inflammation, stress (cortisol, exercise), corticosteroids, lithium, post-splenectomy, CML (chronic myeloid leukemia), polycythemia vera; LEFT SHIFT (immature bands + metamyelocytes) suggests bacterial infection"),
                KeyValueRow(key: "LYMPHOCYTOSIS (>4,000)", value: "Viral infections (especially EBV mononucleosis with atypical lymphocytes), CLL (chronic lymphocytic leukemia, smudge cells), pertussis, ALL"),
                KeyValueRow(key: "EOSINOPHILIA (>500)", value: "Allergy/asthma (mild), parasitic infection, drug reaction (DRESS, eosinophilic pneumonia), eosinophilic disorders, malignancy (Hodgkin), adrenal insufficiency"),
                KeyValueRow(key: "BASOPHILIA (>200)", value: "Chronic myeloid leukemia (CML, often only finding), polycythemia vera, hypothyroidism, allergy"),
                KeyValueRow(key: "MONOCYTOSIS (>800)", value: "Chronic infections (TB, endocarditis, syphilis), inflammatory conditions, recovery from neutropenia, CMML")
            ]),
            .keyValueTable(title: "Leukopenia (<4,500)", [
                KeyValueRow(key: "NEUTROPENIA (<1,500)", value: "MILD 1000-1500, MODERATE 500-1000, SEVERE <500 (febrile neutropenia = oncologic emergency); causes — chemotherapy, radiation, viral, autoimmune (lupus, Felty), drug-induced (clozapine, methimazole, sulfa, dapsone), aplastic anemia, leukemia, B12/folate deficiency"),
                KeyValueRow(key: "LYMPHOPENIA (<1,000)", value: "HIV (CD4 monitoring), corticosteroids, chemotherapy, radiation, sepsis, lymphoma, immunodeficiency"),
                KeyValueRow(key: "Pancytopenia", value: "Bone marrow failure (aplastic anemia, MDS, leukemia, fibrosis, infection, infiltration), B12/folate severe deficiency, hypersplenism")
            ]),
            .keyValueTable(title: "Thrombocytopenia (<150) approach", [
                KeyValueRow(key: "Mechanism categorization", value: "DECREASED PRODUCTION (bone marrow — aplastic, leukemia, MDS, chemo, B12/folate), INCREASED DESTRUCTION (immune — ITP, drug-induced, HIT, lupus; non-immune — DIC, TTP, HUS, mechanical valves), SEQUESTRATION (splenomegaly), DILUTION (massive transfusion)"),
                KeyValueRow(key: "Bleeding risk", value: ">100K — minimal; 50-100K — mild bleeding with surgery/trauma; 20-50K — moderate; <20K — high bleeding; <10K — spontaneous bleeding + ICH risk; need transfusion in many cases"),
                KeyValueRow(key: "Smear findings", value: "Schistocytes (TTP, HUS, DIC, mechanical valve); spherocytes (autoimmune hemolytic); platelet clumps (pseudothrombocytopenia from EDTA — repeat in citrate tube); large platelets (early release suggests destruction)"),
                KeyValueRow(key: "Workup", value: "Repeat in citrate tube (rule out clumping), peripheral smear, coagulation panel (DIC), LDH + haptoglobin + bilirubin (hemolysis), liver function (sequestration), HIT 4Ts score if heparin, ANA if autoimmune, viral testing")
            ]),
            .keyValueTable(title: "Polycythemia (high RBC/Hgb)", [
                KeyValueRow(key: "Primary (polycythemia vera)", value: "JAK2 mutation, low erythropoietin, often with thrombocytosis + leukocytosis; thrombosis risk; phlebotomy + hydroxyurea + low-dose aspirin"),
                KeyValueRow(key: "Secondary", value: "Hypoxia (COPD, sleep apnea, high altitude, R-to-L shunt), erythropoietin-producing tumor (RCC, hepatoma, hemangioma), exogenous EPO/testosterone, dehydration (relative)"),
                KeyValueRow(key: "Workup", value: "Erythropoietin level (low = polycythemia vera, high = secondary), JAK2 V617F mutation, ABG (hypoxia), imaging (tumor)")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Verify lab not affected by collection — hemolyzed sample (high K, LDH falsely), inadequate volume, EDTA clumping (pseudothrombocytopenia).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Trends > absolute values for many parameters — compare to baseline + serial.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Critical results — call provider per institutional protocol; common critical values: Hgb <7, platelets <20K, WBC >30K or <1K, ANC <500.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Severe anemia — assess for symptoms (dyspnea, chest pain, syncope, AMS); transfusion threshold typically Hgb <7 (8-9 in cardiac/elderly).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Severe thrombocytopenia — bleeding precautions (no IM, soft toothbrush, fall prevention, no NSAIDs/anticoagulation).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Neutropenia — neutropenic precautions (private room, no fresh fruit/flowers, sick contact screening, hand hygiene); fever = oncologic emergency, antibiotics within 60 min.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Trending recovery (rising counts) after chemo/blood loss — reticulocyte response 5-7 days; serial CBC.", citationIDs: ["specialty_li39a"])
            ])
        ],
        citations: [openrnLI39A, cdcLI39A, specialtyLI39A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BMPCMPInterpretationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "bmp-cmp-interpretation",
        title: "BMP / CMP interpretation",
        subtitle: "Electrolytes (Na, K, Cl, HCO3) + glucose + BUN/Cr + Ca · CMP adds liver enzymes + total protein + albumin · anion gap + acid-base · renal function",
        eyebrow: "REFERENCE · LAB INTERPRETATION",
        nclexTags: labRefTagsR39A,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Basic metabolic panel (BMP) — Na, K, Cl, HCO3, BUN, Cr, glucose, calcium; comprehensive metabolic panel (CMP) adds AST, ALT, alkaline phosphatase, total bilirubin, total protein, albumin. Provides info on electrolyte balance, acid-base, renal function, glucose, hepatic function. Systematic interpretation requires correlating with clinical context, recent changes, and trends per primary source.",
                citationIDs: ["specialty_li39a"]
            )),
            .keyValueTable(title: "Reference ranges (adult)", [
                KeyValueRow(key: "Sodium (Na)", value: "135-145 mEq/L"),
                KeyValueRow(key: "Potassium (K)", value: "3.5-5.0 mEq/L"),
                KeyValueRow(key: "Chloride (Cl)", value: "98-107 mEq/L"),
                KeyValueRow(key: "Bicarbonate (HCO3)", value: "22-26 mEq/L"),
                KeyValueRow(key: "BUN", value: "8-20 mg/dL"),
                KeyValueRow(key: "Creatinine", value: "M: 0.7-1.3 mg/dL; F: 0.6-1.1 mg/dL"),
                KeyValueRow(key: "Glucose (fasting)", value: "70-99 mg/dL; random <140; postprandial <180"),
                KeyValueRow(key: "Calcium total", value: "8.5-10.5 mg/dL; ionized 4.5-5.3 mg/dL"),
                KeyValueRow(key: "Anion gap (CMP)", value: "Na − (Cl + HCO3) = 8-12 mEq/L"),
                KeyValueRow(key: "Albumin", value: "3.5-5.0 g/dL"),
                KeyValueRow(key: "AST/ALT", value: "10-40 U/L"),
                KeyValueRow(key: "Alkaline phosphatase", value: "44-147 U/L"),
                KeyValueRow(key: "Total bilirubin", value: "0.1-1.2 mg/dL")
            ]),
            .keyValueTable(title: "Hyponatremia (Na <135) approach", [
                KeyValueRow(key: "First — assess volume status", value: "Hypovolemic, euvolemic, hypervolemic"),
                KeyValueRow(key: "HYPOVOLEMIC HYPONATREMIA", value: "Volume depletion (vomiting, diarrhea, diuretics, third-spacing); urine Na <20 (extrarenal loss) vs >20 (renal loss); treat with isotonic saline"),
                KeyValueRow(key: "EUVOLEMIC HYPONATREMIA", value: "SIADH (most common — cancer, CNS, drugs — SSRIs, lung disease), hypothyroidism, adrenal insufficiency, primary polydipsia, MDMA; urine Na typically >40, urine osm >100"),
                KeyValueRow(key: "HYPERVOLEMIC HYPONATREMIA", value: "Heart failure, cirrhosis, nephrotic syndrome, CKD; urine Na <20 (HF, cirrhosis with effective volume depletion), >20 (CKD); fluid restriction + diuretics"),
                KeyValueRow(key: "Severe symptomatic (Na <120 + neuro symptoms)", value: "3% saline 100-150 mL bolus; goal +4-6 mEq/L in 1 hour to relieve symptoms; max 8-12 mEq/L per 24 hours TOTAL correction (avoid osmotic demyelination)"),
                KeyValueRow(key: "PSEUDOhyponatremia", value: "Hyperglycemia (corrected Na = measured Na + 1.6 × [(glucose−100)/100]), hypertriglyceridemia, hyperproteinemia (multiple myeloma)")
            ]),
            .keyValueTable(title: "Hypernatremia (Na >145)", [
                KeyValueRow(key: "Causes", value: "Volume depletion (water loss > Na loss — diarrhea, sweating, diabetes insipidus), inadequate water intake (elderly, NPO, comatose), iatrogenic (hypertonic saline, sodium bicarbonate), salt poisoning"),
                KeyValueRow(key: "DI workup", value: "Diabetes insipidus — central (low ADH, treat with desmopressin) vs nephrogenic (resistant to ADH, treat underlying cause + thiazide); water deprivation test"),
                KeyValueRow(key: "Treatment", value: "Slow correction <8-10 mEq/L per 24 hours (cerebral edema risk if too rapid); free water deficit calculation; oral water + D5W IV; treat underlying cause")
            ]),
            .keyValueTable(title: "Hyperkalemia (K >5.5) management", [
                KeyValueRow(key: "Severity by K + EKG", value: "MILD 5.5-6.0 (often no EKG changes); MODERATE 6.0-6.5 (peaked T waves); SEVERE >6.5 (wide QRS, sine wave); CRITICAL >7.0 OR any EKG changes"),
                KeyValueRow(key: "EMERGENCY treatment", value: "1. CALCIUM (gluconate 1g IV OR chloride 1g IV via central) — STABILIZES MEMBRANE (does not lower K); onset minutes, lasts 30-60 min. 2. SHIFT — insulin 10 units IV + dextrose 25g (D50W 50 mL) — onset 15-30 min, lasts 4-6 hr; albuterol nebulizer 10-20 mg; sodium bicarbonate if acidosis. 3. REMOVAL — loop diuretic (furosemide if euvolemic + functioning kidneys), K binders (sodium polystyrene sulfonate slow, patiromer + sodium zirconium cyclosilicate faster), DIALYSIS for severe + AKI"),
                KeyValueRow(key: "Causes", value: "Renal failure, K-sparing diuretics (spironolactone), ACE-I/ARB, NSAIDs, heparin, tacrolimus, cyclosporine, hemolysis (in tube), rhabdomyolysis, tumor lysis, acidosis, exercise, succinylcholine, massive transfusion"),
                KeyValueRow(key: "PSEUDOhyperkalemia", value: "Hemolyzed sample (most common), tourniquet too long, fist clenching, marked thrombocytosis or leukocytosis (release in tube); REPEAT")
            ]),
            .keyValueTable(title: "Hypokalemia (K <3.5)", [
                KeyValueRow(key: "Causes", value: "GI loss (vomiting, diarrhea), renal loss (diuretics, hyperaldosteronism, RTA), shift (insulin, beta-agonists, alkalosis), inadequate intake"),
                KeyValueRow(key: "EKG", value: "U waves, flattened T, ST depression, arrhythmias (especially with concomitant digitalis); torsades de pointes if severe"),
                KeyValueRow(key: "Treatment", value: "Replace per severity: oral KCl 40-100 mEq/day for mild-moderate; IV KCl 10-20 mEq/hr peripheral OR 20-40 mEq/hr central with cardiac monitoring; ALWAYS check + replace MAGNESIUM (refractory hypokalemia + arrhythmia from concurrent hypoMg)")
            ]),
            .keyValueTable(title: "Acid-base interpretation", [
                KeyValueRow(key: "Anion gap", value: "Na − (Cl + HCO3) = 8-12 normal; ELEVATED — MUDPILES (Methanol, Uremia, DKA, Propylene glycol, Iron/Isoniazid, Lactic acidosis, Ethylene glycol, Salicylates); NON-ANION-GAP — HARDUPS / diarrhea, RTA, ureteroenterostomy, post-hypocapnia, spironolactone"),
                KeyValueRow(key: "Delta-delta", value: "ΔAG ÷ ΔHCO3 — assesses mixed acid-base; <1 = mixed AG + non-AG metabolic acidosis; >2 = mixed metabolic acidosis + metabolic alkalosis; 1-2 = pure AG metabolic acidosis"),
                KeyValueRow(key: "Winters formula", value: "Expected pCO2 = 1.5 × HCO3 + 8 ± 2 — assesses respiratory compensation in metabolic acidosis"),
                KeyValueRow(key: "Metabolic alkalosis", value: "Vomiting, diuretics, hyperaldosteronism, milk-alkali, refeeding; correct underlying + saline-responsive (urine Cl <20) vs saline-unresponsive (urine Cl >20)")
            ]),
            .keyValueTable(title: "Renal function (BUN/Cr)", [
                KeyValueRow(key: "BUN/Cr ratio", value: ">20 = prerenal (volume depletion, GI bleed, high-protein diet, steroids, tetracyclines); 10-20 normal/intrarenal; <10 = postrenal/intrarenal"),
                KeyValueRow(key: "AKI staging (KDIGO)", value: "Stage 1 — Cr increase ≥0.3 mg/dL or 1.5-1.9× baseline; Stage 2 — 2-2.9× baseline; Stage 3 — ≥3× baseline OR ≥4 mg/dL OR RRT"),
                KeyValueRow(key: "Cr trends", value: "Rising Cr = AKI (over hours-days); falling Cr in CKD = improvement OR muscle loss/cachexia (false improvement)"),
                KeyValueRow(key: "GFR estimation", value: "CKD-EPI 2021 (race-free) — preferred; Cockcroft-Gault for drug dosing; varies with age + sex + Cr")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Critical results call protocol — Na <120 or >155, K <2.5 or >6.5, glucose <50 or >500, Cr rapid rise, Ca <6.5 or >12.5.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Trending — daily BMP for hospitalized; assess change from baseline + after interventions.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Correlate with clinical — symptoms (lethargy, weakness, palpitations, edema, urine output), medications (diuretics, K-sparing, ACE-I, NSAIDs).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("EKG monitoring for K abnormalities; cardiac monitor for severe.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Hyperkalemia is medical emergency — calcium first to stabilize membrane.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Specimen handling — hemolysis falsely elevates K; tourniquet duration, fist clenching, sample handling all affect.", citationIDs: ["specialty_li39a"])
            ])
        ],
        citations: [openrnLI39A, cdcLI39A, specialtyLI39A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LFTInterpretationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "lft-liver-function-interpretation",
        title: "LFT (liver function tests) interpretation",
        subtitle: "AST + ALT (hepatocellular injury) · ALP + GGT + bilirubin (cholestatic) · INR + albumin (synthetic function) · pattern recognition · differential by ratios + magnitude",
        eyebrow: "REFERENCE · LAB INTERPRETATION",
        nclexTags: labRefTagsR39A,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Liver function tests (LFTs) — misnomer (most are liver enzymes, not function tests); pattern of elevation distinguishes hepatocellular (hepatitis) from cholestatic (biliary obstruction) from infiltrative (granuloma, cancer). True functional tests — INR, albumin, bilirubin reflect synthetic + excretory capacity. Magnitude + ratio guide differential per primary source.",
                citationIDs: ["specialty_li39a"]
            )),
            .keyValueTable(title: "Pattern recognition", [
                KeyValueRow(key: "HEPATOCELLULAR", value: "AST + ALT >> ALP; AST/ALT ratio variable; viral hepatitis, drug-induced (acetaminophen), ischemic, autoimmune, hereditary"),
                KeyValueRow(key: "CHOLESTATIC", value: "ALP > AST/ALT; GGT confirms hepatic origin; bile duct obstruction (gallstones, malignancy, PSC, PBC), drug-induced, infiltrative"),
                KeyValueRow(key: "MIXED", value: "Both patterns; complex; targeted workup needed"),
                KeyValueRow(key: "ISOLATED hyperbilirubinemia", value: "Direct (conjugated) >2 OR >20% TSB → cholestasis or cholestatic disease; Indirect (unconjugated) → hemolysis, Gilbert syndrome, Crigler-Najjar"),
                KeyValueRow(key: "Synthetic dysfunction", value: "INR elevated (vitamin K-dependent factors II, VII, IX, X), low albumin (hepatic synthesis impaired); reflects severity")
            ]),
            .keyValueTable(title: "AST + ALT — magnitude + ratio interpretation", [
                KeyValueRow(key: ">1000 IU/L", value: "VIRAL HEPATITIS (acute), TOXIC (acetaminophen overdose, mushroom poisoning), ISCHEMIC HEPATITIS (shock liver — sepsis, MI, hypovolemia), AUTOIMMUNE HEPATITIS, BILIARY OBSTRUCTION (acute), Wilson disease (acute presentation)"),
                KeyValueRow(key: "200-1000 IU/L", value: "Viral hepatitis, alcohol (less elevated), drug-induced, NAFLD/NASH, autoimmune, hemochromatosis"),
                KeyValueRow(key: "<200 IU/L (mild)", value: "NAFLD/NASH (most common in US), chronic viral hepatitis, alcohol, medications (statins, isoniazid, methotrexate), hemochromatosis, Wilson, alpha-1 antitrypsin deficiency"),
                KeyValueRow(key: "AST/ALT >2:1", value: "ALCOHOLIC liver disease (typically AST <500); cirrhosis (any cause); ischemic hepatitis"),
                KeyValueRow(key: "AST/ALT <1 (ALT > AST)", value: "VIRAL HEPATITIS, NAFLD/NASH (often asymptomatic with mild elevation), autoimmune"),
                KeyValueRow(key: "Acetaminophen overdose", value: "AST + ALT in 1000s; characteristic delayed pattern (24-72 h post-ingestion); Rumack-Matthew nomogram + N-acetylcysteine antidote")
            ]),
            .keyValueTable(title: "ALP + GGT — cholestatic differential", [
                KeyValueRow(key: "ALP elevated alone", value: "Bone source (Paget disease, malignancy, fracture, growing children, hyperparathyroidism); confirm with GGT (normal in bone) or ALP fractionation"),
                KeyValueRow(key: "ALP + GGT both elevated", value: "Hepatic origin → biliary obstruction (stones, malignancy, PSC, PBC, ductal disease) OR drug-induced cholestasis OR infiltrative disease (granuloma, lymphoma, sarcoid, amyloid)"),
                KeyValueRow(key: "GGT elevated alone", value: "Alcohol use (sensitive marker), drug-induced, NAFLD; can be subclinical biliary disease"),
                KeyValueRow(key: "Workup of cholestatic pattern", value: "Right upper quadrant ultrasound (gallstones, ductal dilation), MRCP if ductal dilation, ERCP for therapy if obstruction, AMA (PBC), liver biopsy")
            ]),
            .keyValueTable(title: "Bilirubin — direct vs indirect", [
                KeyValueRow(key: "INDIRECT (unconjugated)", value: "INCREASED PRODUCTION — hemolysis (hemolytic anemia, sickle cell, transfusion, prosthetic valve, microangiopathic), absorption of large hematoma, ineffective erythropoiesis. DECREASED CONJUGATION — Gilbert syndrome (mild, common, fasting/illness/exercise), Crigler-Najjar, neonatal physiologic, breast milk jaundice, hypothyroidism"),
                KeyValueRow(key: "DIRECT (conjugated, >2 or >20% TSB)", value: "DECREASED EXCRETION — biliary obstruction (intrahepatic — drugs/PBC/PSC/sepsis; extrahepatic — stones, stricture, malignancy), hepatocellular dysfunction (severe hepatitis, cirrhosis), Dubin-Johnson, Rotor"),
                KeyValueRow(key: "Workup of conjugated", value: "RUQ ultrasound first; cholestatic pattern with ALP/GGT; MRCP/ERCP if dilation"),
                KeyValueRow(key: "NEONATAL conjugated >2", value: "RULE OUT BILIARY ATRESIA (Kasai window <60 days)")
            ]),
            .keyValueTable(title: "Synthetic dysfunction (severity markers)", [
                KeyValueRow(key: "INR elevated", value: "Decreased synthesis of vitamin K-dependent factors II, VII, IX, X (vitamin K most labile, half-life ~6 hours; INR rises early); cirrhosis, fulminant hepatic failure, vitamin K deficiency, warfarin"),
                KeyValueRow(key: "Albumin low", value: "Hepatic synthesis impaired (cirrhosis, malnutrition); also urine loss (nephrotic), GI loss (protein-losing enteropathy), inflammation (negative acute phase reactant — false low)"),
                KeyValueRow(key: "MELD score", value: "INR + bilirubin + Cr + Na — calculated severity in cirrhosis; transplant priority; >15 generally considered for transplant evaluation"),
                KeyValueRow(key: "Child-Pugh", value: "Albumin + bilirubin + INR + ascites + encephalopathy; cirrhosis severity classification A/B/C; survival prediction")
            ]),
            .bullets(title: "Specific causes — focused workup", [
                AttributedBullet("VIRAL HEPATITIS — Hep A IgM, Hep B (HBsAg, anti-HBc IgM, anti-HBs), Hep C (anti-HCV antibody, HCV RNA), Hep E (rare in US), CMV, EBV, HSV, varicella.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("AUTOIMMUNE — ANA, anti-smooth muscle (AIH), anti-mitochondrial (PBC), p-ANCA (PSC), IgG4.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("METABOLIC — ferritin + transferrin saturation (hemochromatosis), ceruloplasmin + 24-hr urine copper (Wilson disease), alpha-1 antitrypsin level + phenotype.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("DRUG-INDUCED — most common cause of acute liver failure in US (acetaminophen #1); review medications + supplements + herbs (kava, comfrey).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("NAFLD/NASH — most common chronic liver disease; metabolic syndrome; ultrasound + FIB-4 score + transient elastography.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("ISCHEMIC — \"shock liver\" — massive AST/ALT in shock; rapid resolution with hemodynamic recovery.", citationIDs: ["specialty_li39a"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Critical results — INR >5, bilirubin >15-20, ALT/AST >1000.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Acute liver failure (INR >1.5 + encephalopathy in patient without prior liver disease) — transplant evaluation; specialty hepatology consultation.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Acetaminophen toxicity — NAC (N-acetylcysteine) within 8 hours optimal; continues for 21 hours IV protocol; can give later if clear acetaminophen toxicity even without level.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Hepatic encephalopathy — lactulose + rifaximin; bridge therapies; assess for triggers (GI bleed, infection, electrolyte, medications).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Variceal bleeding — emergent endoscopy + octreotide + antibiotics + transfusion + ICU.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Patient education — alcohol cessation, hepatotoxic drug avoidance (acetaminophen <2g/day in cirrhosis), vaccination (Hep A/B), follow-up.", citationIDs: ["openrn_li39a"])
            ])
        ],
        citations: [openrnLI39A, cdcLI39A, specialtyLI39A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CoagulationInterpretationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "coagulation-panel-interpretation",
        title: "Coagulation panel interpretation",
        subtitle: "PT/INR + aPTT + fibrinogen + D-dimer · pathway-based differential · DIC vs liver vs warfarin vs heparin · factor assays · DOAC monitoring",
        eyebrow: "REFERENCE · LAB INTERPRETATION",
        nclexTags: labRefTagsR39A,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Coagulation panel — assesses extrinsic (PT/INR), intrinsic (aPTT), and common (fibrinogen) pathways + fibrinolysis (D-dimer). Pattern recognition guides differential — isolated PT (warfarin, factor VII deficiency), isolated aPTT (heparin, hemophilia, lupus anticoagulant), both elevated (liver disease, DIC, vitamin K deficiency, supratherapeutic warfarin/heparin) per primary source.",
                citationIDs: ["specialty_li39a"]
            )),
            .keyValueTable(title: "Reference ranges (adult)", [
                KeyValueRow(key: "PT (prothrombin time)", value: "11-13.5 seconds (varies by lab + reagent)"),
                KeyValueRow(key: "INR (international normalized ratio)", value: "0.8-1.2 (normal); 2-3 (warfarin DVT/PE/AFib); 2.5-3.5 (mechanical mitral valve)"),
                KeyValueRow(key: "aPTT (activated partial thromboplastin time)", value: "25-35 seconds; therapeutic on UFH 1.5-2.5× control"),
                KeyValueRow(key: "Fibrinogen", value: "200-400 mg/dL"),
                KeyValueRow(key: "D-dimer", value: "<500 ng/mL (varies by assay); age-adjusted in elderly (age × 10)"),
                KeyValueRow(key: "Anti-Xa (LMWH monitoring)", value: "Enoxaparin therapeutic 0.5-1.0 IU/mL (1 mg/kg BID); prophylactic 0.2-0.4")
            ]),
            .keyValueTable(title: "Coagulation pathway pattern", [
                KeyValueRow(key: "PROLONGED PT (INR ↑) ALONE", value: "WARFARIN (most common), Factor VII deficiency (rare), early vitamin K deficiency (factor VII has shortest half-life), early liver disease, DIC (early)"),
                KeyValueRow(key: "PROLONGED aPTT ALONE", value: "HEPARIN (UFH most common), hemophilia A (Factor VIII deficiency), hemophilia B (Factor IX deficiency), Von Willebrand disease, lupus anticoagulant (paradoxically thrombotic), Factor XI/XII deficiency"),
                KeyValueRow(key: "BOTH PROLONGED", value: "DIC (consumption), severe liver disease, supratherapeutic warfarin, vitamin K deficiency advanced, massive transfusion, supratherapeutic heparin (rare effect on PT), Factor X/V/II deficiency"),
                KeyValueRow(key: "Mixing study", value: "1:1 mix patient + normal plasma — CORRECTS = factor deficiency; DOES NOT CORRECT = inhibitor (lupus anticoagulant, factor inhibitor)")
            ]),
            .keyValueTable(title: "Disseminated intravascular coagulation (DIC)", [
                KeyValueRow(key: "Definition", value: "Pathologic activation of coagulation cascade → thrombi + consumption of factors + platelets + fibrinogen → bleeding + thrombosis simultaneously"),
                KeyValueRow(key: "Causes", value: "Sepsis (most common), trauma, malignancy (acute promyelocytic leukemia → DIC pathognomonic), obstetric (abruption, amniotic fluid embolism, retained dead fetus), envenomation, severe hemolysis"),
                KeyValueRow(key: "Lab findings", value: "↑ PT, ↑ aPTT, ↓ fibrinogen, ↑ D-dimer, ↓ platelets, schistocytes on smear; ISTH overt DIC score"),
                KeyValueRow(key: "Treatment", value: "TREAT UNDERLYING cause (e.g., antibiotics for sepsis, ATRA for APL); supportive — FFP for INR >1.5, cryoprecipitate for fibrinogen <100, platelets if <20K (50K if bleeding), heparin selected for predominant thrombosis (controversial)")
            ]),
            .keyValueTable(title: "Anticoagulant monitoring", [
                KeyValueRow(key: "Warfarin (vitamin K antagonist)", value: "INR Q1-2 weeks during initiation, monthly when stable; goal 2-3 (most), 2.5-3.5 (mechanical mitral valve); reverse with vitamin K + 4F-PCC"),
                KeyValueRow(key: "UFH (unfractionated heparin)", value: "aPTT Q4-6 hours during titration; goal 1.5-2.5× control; reverse with protamine"),
                KeyValueRow(key: "LMWH (enoxaparin/dalteparin)", value: "Anti-Xa monitoring NOT routine; use in pregnancy, obesity, renal impairment, pediatric; partial reversal with protamine"),
                KeyValueRow(key: "Apixaban / rivaroxaban (Xa inhibitors)", value: "Routine monitoring NOT needed; anti-Xa assay if uncertain; reverse with andexanet alfa OR 4F-PCC; CrCl-based dosing"),
                KeyValueRow(key: "Dabigatran (direct thrombin inhibitor)", value: "Routine monitoring NOT needed; ecarin clotting time or thrombin time if uncertain; reverse with idarucizumab; CrCl-based dosing"),
                KeyValueRow(key: "Argatroban / bivalirudin", value: "aPTT 1.5-3× control; HIT alternative")
            ]),
            .bullets(title: "D-dimer interpretation", [
                AttributedBullet("ELEVATED D-dimer — fibrin breakdown product; sensitive but NOT specific.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Used to RULE OUT venous thromboembolism (PE, DVT) when LOW pretest probability — negative D-dimer rules out.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("AGE-ADJUSTED cutoff (age × 10 ng/mL for >50 yr) — improves specificity in elderly.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Elevated in many conditions — VTE, DIC, sepsis, trauma, surgery, malignancy, pregnancy, postpartum, severe liver disease, COVID — limited specificity.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Not useful in HIGH pretest probability — proceed to CT-PA or ultrasound regardless.", citationIDs: ["specialty_li39a"])
            ]),
            .bullets(title: "Specific bleeding disorders", [
                AttributedBullet("HEMOPHILIA A (Factor VIII) — X-linked recessive; aPTT ↑, factor assay confirms; replacement with recombinant Factor VIII; emergency joint/CNS bleeding.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("HEMOPHILIA B (Factor IX) — same pattern; factor assay; recombinant Factor IX.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("VON WILLEBRAND DISEASE — most common inherited bleeding disorder; vWF antigen + activity + Factor VIII; mild forms with desmopressin (DDAVP), severe with vWF concentrate.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("LUPUS ANTICOAGULANT — paradoxical THROMBOTIC despite ↑ aPTT; DRVVT + lupus PTT + mixing study + cardiolipin antibodies; lifelong anticoagulation if VTE.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("HIT (heparin-induced thrombocytopenia) — 4Ts score + heparin antibody + serotonin release assay; STOP heparin; START argatroban/bivalirudin/fondaparinux.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("TTP (thrombotic thrombocytopenic purpura) — pentad (FARMS — fever, anemia, renal, mental, schistocytes); ADAMTS13 deficiency; emergent plasmapheresis + steroids + caplacizumab.", citationIDs: ["specialty_li39a"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Critical results — INR >5 (high bleed risk), aPTT >100 (massive bleed risk), platelets <20K, fibrinogen <100.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Bleeding precautions — soft toothbrush, electric razor, no IM injections, no NSAIDs, fall prevention, monitor for occult bleeding (urine, stool, headache, abdominal pain).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Reversal agent timing — coordinate with provider + pharmacy; stock + emergency access.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Patient education on anticoagulation — adherence, drug interactions (especially warfarin — many), dietary considerations (warfarin + vitamin K consistency), bleeding signs, when to seek emergency care.", citationIDs: ["openrn_li39a"]),
                AttributedBullet("Document INR + interventions + bleeding events + medication changes; communication with anticoagulation clinic.", citationIDs: ["openrn_li39a"])
            ])
        ],
        citations: [openrnLI39A, cdcLI39A, specialtyLI39A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LipidPanelInterpretationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "lipid-panel-interpretation",
        title: "Lipid panel interpretation",
        subtitle: "TC + LDL + HDL + TG + non-HDL · ASCVD risk stratification (10-yr risk calculator) · primary vs secondary prevention · 2018 AHA/ACC + 2022 update treatment thresholds",
        eyebrow: "REFERENCE · LAB INTERPRETATION",
        nclexTags: labRefTagsR39A,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Lipid panel — fundamental cardiovascular risk assessment; total cholesterol (TC), LDL-C, HDL-C, triglycerides (TG), non-HDL-C (TC − HDL). LDL-C is primary therapeutic target. ASCVD risk stratification (Pooled Cohort Equations 10-year risk + risk enhancers) guides treatment intensity. AHA/ACC 2018 cholesterol guideline + 2022 ACC/AHA update for non-statin therapy provide framework per primary source.",
                citationIDs: ["specialty_li39a"]
            )),
            .keyValueTable(title: "Lipid panel components + targets", [
                KeyValueRow(key: "Total cholesterol (TC)", value: "<200 mg/dL desirable; 200-239 borderline; ≥240 high"),
                KeyValueRow(key: "LDL-C", value: "<100 mg/dL optimal; 100-129 near-optimal; 130-159 borderline; 160-189 high; ≥190 very high (familial hypercholesterolemia consideration)"),
                KeyValueRow(key: "HDL-C", value: "<40 (men) OR <50 (women) low → CV risk factor; ≥60 protective"),
                KeyValueRow(key: "Triglycerides (TG)", value: "<150 normal; 150-199 borderline; 200-499 high; ≥500 very high (pancreatitis risk)"),
                KeyValueRow(key: "Non-HDL-C (TC − HDL)", value: "Includes all atherogenic lipoproteins; <130 desirable; equivalent target = LDL + 30"),
                KeyValueRow(key: "Apolipoprotein B (apoB)", value: "Marker of total atherogenic particle number; <90 mg/dL desirable; useful in metabolic syndrome + DM + insulin resistance"),
                KeyValueRow(key: "Lipoprotein(a) — Lp(a)", value: "Genetic cardiovascular risk factor; <50 mg/dL preferable; treatment options limited (statins minimal effect, PCSK9 some, niacin limited evidence)"),
                KeyValueRow(key: "Friedewald LDL calculation", value: "LDL = TC − HDL − (TG/5); valid only if TG <400; for higher TG → direct LDL measurement OR use non-HDL")
            ]),
            .keyValueTable(title: "ASCVD 10-year risk-based treatment (AHA/ACC 2018 + 2022 update)", [
                KeyValueRow(key: "Primary prevention — calculate 10-yr ASCVD risk", value: "Pooled Cohort Equations (age 40-79, ASCVD-free); risk categories — low <5%, borderline 5-7.5%, intermediate 7.5-20%, high ≥20%"),
                KeyValueRow(key: "10-yr risk ≥20% (high)", value: "HIGH-INTENSITY STATIN to reduce LDL ≥50%; recommended"),
                KeyValueRow(key: "10-yr risk 7.5-20% (intermediate)", value: "Moderate-intensity statin; consider risk enhancers (family hx premature ASCVD, persistent LDL ≥160, CKD, metabolic syndrome, inflammatory disease, ethnic considerations) + CAC if uncertain"),
                KeyValueRow(key: "10-yr risk 5-7.5% (borderline)", value: "Risk enhancers + CAC may shift recommendation; lifestyle therapy primary"),
                KeyValueRow(key: "10-yr risk <5% (low)", value: "Lifestyle therapy"),
                KeyValueRow(key: "Diabetes 40-75 yr", value: "Moderate-intensity statin regardless of risk; high-intensity if ASCVD risk factors or risk ≥20%"),
                KeyValueRow(key: "LDL ≥190 mg/dL (severe)", value: "HIGH-INTENSITY STATIN regardless of risk; consider familial hypercholesterolemia + family screening"),
                KeyValueRow(key: "Established ASCVD (secondary prevention)", value: "HIGH-INTENSITY STATIN; LDL goal <70 (very-high-risk <55); add ezetimibe + PCSK9 inhibitor if not at goal")
            ]),
            .keyValueTable(title: "Statin intensity classification", [
                KeyValueRow(key: "HIGH-INTENSITY (>50% LDL reduction)", value: "Atorvastatin 40-80 mg; rosuvastatin 20-40 mg"),
                KeyValueRow(key: "MODERATE-INTENSITY (30-50% LDL reduction)", value: "Atorvastatin 10-20 mg; rosuvastatin 5-10 mg; simvastatin 20-40 mg; pravastatin 40-80 mg; lovastatin 40 mg; pitavastatin 1-4 mg"),
                KeyValueRow(key: "LOW-INTENSITY (<30% reduction)", value: "Simvastatin 10 mg; pravastatin 10-20 mg; lovastatin 20 mg; rare use")
            ]),
            .keyValueTable(title: "Hypertriglyceridemia management", [
                KeyValueRow(key: "TG <150", value: "Lifestyle (low refined carb, omega-3, weight loss, alcohol moderation)"),
                KeyValueRow(key: "TG 150-499 + ASCVD risk", value: "Statin (treats LDL + somewhat TG); icosapent ethyl 4g/day if persistent + ASCVD/diabetes (REDUCE-IT)"),
                KeyValueRow(key: "TG ≥500", value: "PANCREATITIS RISK; very-low-fat diet + fibrate (fenofibrate, gemfibrozil) + omega-3 (icosapent OR omega-3 4 g/day) + niacin; emergency if pancreatitis"),
                KeyValueRow(key: "FAMILIAL CHYLOMICRONEMIA SYNDROME", value: "TG often >1000 + recurrent pancreatitis; volanesorsen/olezarsen (ASO therapy); strict dietary fat restriction"),
                KeyValueRow(key: "Avoid in TG-only treatment", value: "Statin alone insufficient; avoid niacin if liver disease (hepatotoxicity); fibrate + statin caution (rhabdo risk, especially gemfibrozil + statin)")
            ]),
            .keyValueTable(title: "Secondary causes of dyslipidemia (rule out)", [
                KeyValueRow(key: "Hypothyroidism", value: "Hypercholesterolemia; check TSH"),
                KeyValueRow(key: "Diabetes", value: "Hypertriglyceridemia + low HDL + small dense LDL; control glycemia"),
                KeyValueRow(key: "Nephrotic syndrome", value: "Mixed dyslipidemia; treat underlying"),
                KeyValueRow(key: "Liver disease (chronic)", value: "Mixed; cholestasis → high cholesterol; cirrhosis → low"),
                KeyValueRow(key: "Cushing syndrome / steroids", value: "Hypercholesterolemia"),
                KeyValueRow(key: "Excessive alcohol", value: "Hypertriglyceridemia"),
                KeyValueRow(key: "Medications", value: "Beta-blockers (mild), thiazides (hypercholesterolemia), corticosteroids, oral estrogens, atypical antipsychotics, retinoids, protease inhibitors, immunosuppressants (cyclosporine), tamoxifen")
            ]),
            .bullets(title: "Lifestyle therapy (foundation of all treatment)", [
                AttributedBullet("DIETARY — Mediterranean OR DASH diet; limit saturated fat <6% of calories; eliminate trans fats; emphasize fruits + vegetables + whole grains + legumes + nuts + fish; limit refined sugar + processed foods.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("EXERCISE — 150+ min/week moderate-intensity OR 75+ min vigorous-intensity aerobic; resistance training 2x/week.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("WEIGHT LOSS — 5-10% body weight if overweight/obese; modest improvement in lipids + significant ASCVD risk reduction.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("SMOKING CESSATION — bigger CV benefit than any pharmacotherapy; counsel + nicotine replacement + varenicline + bupropion.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("ALCOHOL moderation — ≤1 drink/day women, ≤2 drinks/day men; avoid binge.", citationIDs: ["specialty_li39a"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Patient education — lipid goals, statin compliance, lifestyle interventions, side effect awareness (myalgia, hepatic).", citationIDs: ["openrn_li39a"]),
                AttributedBullet("Monitor LFTs at baseline; routine periodic monitoring NOT recommended unless symptomatic; CK only if myalgia.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Address concerns about statin side effects — NOCEBO effect common; rechallenge with same or different statin if intolerance; ezetimibe + PCSK9 alternatives.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Coordinate with primary care for ASCVD risk calculation + treatment escalation.", citationIDs: ["openrn_li39a"]),
                AttributedBullet("Familial hypercholesterolemia (LDL ≥190 mg/dL young, family hx) — refer to lipid clinic + family screening (cascade screening).", citationIDs: ["specialty_li39a"])
            ])
        ],
        citations: [openrnLI39A, cdcLI39A, specialtyLI39A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum UrinalysisInterpretationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "urinalysis-interpretation",
        title: "Urinalysis interpretation",
        subtitle: "Macroscopic + dipstick + microscopy · proteinuria + hematuria + pyuria + glucosuria · culture vs colonization · catheter contamination",
        eyebrow: "REFERENCE · LAB INTERPRETATION",
        nclexTags: labRefTagsR39A,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Urinalysis (UA) — quick + inexpensive screen for renal + metabolic + urinary tract abnormalities. Three components: MACROSCOPIC (color, clarity, specific gravity), DIPSTICK (pH, protein, glucose, ketones, bilirubin, urobilinogen, leukocyte esterase, nitrites, blood), MICROSCOPIC (cells, casts, crystals, bacteria, epithelial cells). Interpretation requires correlation with clinical context + other labs per primary source.",
                citationIDs: ["specialty_li39a"]
            )),
            .keyValueTable(title: "Macroscopic findings", [
                KeyValueRow(key: "COLOR", value: "Yellow normal; orange (B vitamins, pyridium, rifampin); red/pink (hematuria, beets, rifampin, rhabdomyolysis); brown (rhabdo, Pseudomonas, melanoma); blue/green (Pseudomonas, methylene blue, propofol); milky (chyluria, severe pyuria)"),
                KeyValueRow(key: "CLARITY", value: "Clear normal; cloudy (UTI, crystals, chyluria, vaginal contamination)"),
                KeyValueRow(key: "SPECIFIC GRAVITY", value: "1.005-1.030 normal; <1.005 dilute (DI, polydipsia, diuretic); >1.030 concentrated (dehydration, nephrotic, glucosuria)"),
                KeyValueRow(key: "ODOR", value: "Aromatic normal; foul (UTI, sulfa); fruity (DKA, ketones); maple syrup (MSUD); sweaty feet (isovaleric acidemia)")
            ]),
            .keyValueTable(title: "Dipstick — sensitivity + interpretation", [
                KeyValueRow(key: "pH (4.5-8)", value: "Acidic (<5.5) — meat-protein diet, acidosis, RTA type 1; alkaline (>8) — vegetarian, UTI (urea-splitting Proteus, Klebsiella, Pseudomonas), RTA type 2"),
                KeyValueRow(key: "PROTEIN", value: "Trace 30 mg/dL, 1+ 100 mg/dL, 2+ 300 mg/dL, 3+ 1g/dL, 4+ ≥2g/dL; persistent >300 mg/day = nephropathy; nephrotic >3.5 g/day; tests albumin primarily; Bence-Jones protein NOT detected (need sulfosalicylic acid OR immunofixation)"),
                KeyValueRow(key: "GLUCOSE", value: "Negative normal; positive = diabetes (renal threshold ~180 mg/dL serum), pregnancy, Fanconi syndrome, SGLT2 inhibitors"),
                KeyValueRow(key: "KETONES", value: "Negative normal; positive in DKA, starvation, vomiting, alcoholism, ketogenic diet, post-bariatric surgery"),
                KeyValueRow(key: "BLOOD", value: "Positive — RBCs, free hemoglobin (intravascular hemolysis), myoglobin (rhabdomyolysis); follow with microscopy to differentiate; positive without RBCs = hemolysis or rhabdo"),
                KeyValueRow(key: "BILIRUBIN", value: "Positive — conjugated hyperbilirubinemia (cholestasis, biliary obstruction); not from hemolysis"),
                KeyValueRow(key: "UROBILINOGEN", value: "Mild present normally; increased in hemolysis or hepatic disease; absent in complete biliary obstruction"),
                KeyValueRow(key: "LEUKOCYTE ESTERASE (LE)", value: "Positive — neutrophils present (UTI, sterile pyuria, vaginal contamination); sensitive but not specific"),
                KeyValueRow(key: "NITRITES", value: "Positive — bacteria converting nitrate to nitrite (E. coli, Klebsiella, Proteus); sensitive ~50% but specific ~90% for UTI; needs urine in bladder >4 hr; misses Staph saprophyticus + Pseudomonas (don't reduce nitrate)")
            ]),
            .keyValueTable(title: "Microscopic findings", [
                KeyValueRow(key: "RBCs", value: "Normal <2/hpf; >5 = hematuria; dysmorphic + RBC casts → glomerular origin; isomorphic → bladder/ureter/kidney source; gross hematuria + clots → urology"),
                KeyValueRow(key: "WBCs", value: "Normal <5/hpf; >5 = pyuria → UTI most common, sterile pyuria (PCN, NSAIDs, TB, fungus, viral, glomerulonephritis)"),
                KeyValueRow(key: "EPITHELIAL CELLS — squamous", value: "Many = vaginal contamination → repeat with proper collection"),
                KeyValueRow(key: "EPITHELIAL CELLS — renal tubular", value: "Increased in acute tubular necrosis (ATN) + interstitial nephritis"),
                KeyValueRow(key: "BACTERIA", value: "Variable; correlate with culture; without symptoms = colonization (don't treat in most cases except pregnancy + pre-procedure)"),
                KeyValueRow(key: "CASTS — RBC", value: "Glomerulonephritis (post-strep, IgA, lupus, vasculitis)"),
                KeyValueRow(key: "CASTS — WBC", value: "Acute pyelonephritis, interstitial nephritis"),
                KeyValueRow(key: "CASTS — granular muddy brown", value: "Acute tubular necrosis (ATN)"),
                KeyValueRow(key: "CASTS — hyaline", value: "Concentrated urine, post-exercise, dehydration; non-specific"),
                KeyValueRow(key: "CASTS — broad waxy", value: "Chronic kidney disease"),
                KeyValueRow(key: "CASTS — fatty", value: "Nephrotic syndrome (lipiduria; oval fat bodies)"),
                KeyValueRow(key: "CRYSTALS", value: "Calcium oxalate (most common; ethylene glycol — \"envelope\" or \"dumbbell\"); uric acid (gout, tumor lysis); struvite (UTI with urea-splitting); cystine (cystinuria); medication crystals (sulfa, indinavir, atazanavir, methotrexate, acyclovir)")
            ]),
            .keyValueTable(title: "Differential by pattern", [
                KeyValueRow(key: "PYURIA + nitrite + bacteriuria + symptoms", value: "UTI; treat with empiric antibiotics + culture-guided"),
                KeyValueRow(key: "PYURIA + sterile (no bacteria)", value: "Sterile pyuria — TB, fungal, gonorrhea, chlamydia, viral, PKD/cysts, recent antibiotics, interstitial nephritis, urolithiasis"),
                KeyValueRow(key: "HEMATURIA + RBC casts + dysmorphic RBCs + proteinuria", value: "GLOMERULONEPHRITIS — workup ASO, complement, ANA, ANCA, anti-GBM"),
                KeyValueRow(key: "HEMATURIA + isolated (no proteinuria/casts)", value: "Bladder/ureter/kidney source — URINARY TRACT MALIGNANCY, stones, infection, BPH; cystoscopy + CT urogram + cytology"),
                KeyValueRow(key: "PROTEINURIA + edema + hypoalbuminemia + hyperlipidemia", value: "NEPHROTIC SYNDROME — biopsy + workup of secondary causes"),
                KeyValueRow(key: "RBC + WBC + bacteria + symptoms", value: "Pyelonephritis (with fever + flank pain) vs cystitis"),
                KeyValueRow(key: "GLUCOSE + KETONES + dehydration", value: "DKA")
            ]),
            .bullets(title: "Collection technique critical", [
                AttributedBullet("MIDSTREAM CLEAN CATCH — preferred for routine; clean perineum, allow first urine to flush, collect mid-stream; minimizes contamination.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("CATHETERIZED — sterile method for ill, infants, immunocompromised, when contamination concerns; less contamination than clean catch.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("SUPRAPUBIC ASPIRATION — most accurate for diagnosis in newborns; sterile.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("BAG specimen (newborns/infants) — high false positive rate from skin contamination; SCREENING ONLY (negative rules out, positive needs confirmation).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Process within 1-2 hours OR refrigerate (cell lysis + bacterial overgrowth + crystallization with delay).", citationIDs: ["specialty_li39a"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Critical results — high glucose with ketones (DKA), positive blood + bilirubin (rhabdomyolysis or biliary), positive bacteria/leukocytes + symptoms (UTI), proteinuria + hematuria (glomerulonephritis).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Asymptomatic bacteriuria — DO NOT TREAT in most patients (only pregnancy, pre-urologic procedure with mucosal trauma); avoid unnecessary antibiotics.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Trends — 24-hour urine protein quantification + GFR over time.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Patient education on collection technique; importance of antibiotic completion; recurrent UTI prevention.", citationIDs: ["openrn_li39a"]),
                AttributedBullet("Hematuria workup — urology + nephrology; AVOID delays + missed bladder cancer (smoker, occupational exposure, family hx).", citationIDs: ["specialty_li39a"])
            ])
        ],
        citations: [openrnLI39A, cdcLI39A, specialtyLI39A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ABGInterpretationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "abg-vbg-interpretation",
        title: "ABG / VBG interpretation",
        subtitle: "pH + pCO2 + HCO3 + PaO2/SpO2 + lactate · acidosis vs alkalosis · respiratory vs metabolic · compensation · mixed disorders · oxygenation",
        eyebrow: "REFERENCE · LAB INTERPRETATION",
        nclexTags: labRefTagsR39A,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Arterial blood gas (ABG) — gold standard for acid-base + oxygenation + ventilation assessment. Venous blood gas (VBG) — surrogate for pH + pCO2 + HCO3 with reasonable correlation in stable patients (less invasive, central or peripheral). Systematic interpretation: 1) acidemia vs alkalemia (pH); 2) primary respiratory or metabolic; 3) compensation appropriate; 4) mixed disorders if indicated; 5) oxygenation (PaO2 + A-a gradient + P/F ratio) per primary source.",
                citationIDs: ["specialty_li39a"]
            )),
            .keyValueTable(title: "Reference ranges", [
                KeyValueRow(key: "pH", value: "7.35-7.45 (life-compatible 6.8-7.8)"),
                KeyValueRow(key: "pCO2", value: "35-45 mmHg (PaCO2)"),
                KeyValueRow(key: "HCO3", value: "22-26 mEq/L"),
                KeyValueRow(key: "PaO2", value: "80-100 mmHg (room air)"),
                KeyValueRow(key: "SaO2", value: "≥95% (room air)"),
                KeyValueRow(key: "BASE excess", value: "−2 to +2 mEq/L (calculated)"),
                KeyValueRow(key: "Lactate", value: "<2 mmol/L (>4 = severe lactic acidosis)"),
                KeyValueRow(key: "VBG vs ABG", value: "Venous pH ~0.04 lower than arterial; pCO2 ~5-7 mmHg higher; HCO3 nearly equal; not interchangeable for PaO2 (must be arterial)")
            ]),
            .keyValueTable(title: "Step-by-step interpretation", [
                KeyValueRow(key: "STEP 1: pH — acidemia or alkalemia", value: "pH <7.35 = acidemia; pH >7.45 = alkalemia; if pH normal but pCO2/HCO3 abnormal → mixed disorder OR fully compensated"),
                KeyValueRow(key: "STEP 2: Identify primary disorder", value: "Look at pCO2 + HCO3; if pH ↓ + pCO2 ↑ → respiratory acidosis (primary); if pH ↓ + HCO3 ↓ → metabolic acidosis (primary); if pH ↑ + pCO2 ↓ → respiratory alkalosis (primary); if pH ↑ + HCO3 ↑ → metabolic alkalosis (primary)"),
                KeyValueRow(key: "STEP 3: Assess compensation", value: "Body compensates to bring pH toward normal. Acute respiratory acidosis — HCO3 rises 1 per 10 ↑ pCO2. Chronic respiratory acidosis — HCO3 rises 4 per 10 ↑ pCO2. Acute respiratory alkalosis — HCO3 falls 2 per 10 ↓ pCO2. Chronic respiratory alkalosis — HCO3 falls 5 per 10 ↓ pCO2. Metabolic acidosis — Winters formula: expected pCO2 = 1.5 × HCO3 + 8 ± 2"),
                KeyValueRow(key: "STEP 4: If metabolic acidosis — anion gap", value: "Calculate AG = Na − (Cl + HCO3); normal 8-12; elevated → MUDPILES; non-AG → HARDUPS / GI loss / RTA"),
                KeyValueRow(key: "STEP 5: If anion gap metabolic acidosis — delta-delta", value: "ΔAG ÷ ΔHCO3 — assesses concurrent disorders; <1 = mixed AG + non-AG metabolic acidosis; 1-2 = pure AG; >2 = mixed AG metabolic acidosis + metabolic alkalosis")
            ]),
            .keyValueTable(title: "Acid-base disorder differential", [
                KeyValueRow(key: "RESPIRATORY ACIDOSIS (pCO2 ↑)", value: "Hypoventilation — COPD, asthma exacerbation, opioid overdose, neuromuscular disease (Guillain-Barré, myasthenia, ALS), upper airway obstruction, central depression (sedatives, brainstem), chest wall trauma, severe obesity hypoventilation"),
                KeyValueRow(key: "RESPIRATORY ALKALOSIS (pCO2 ↓)", value: "Hyperventilation — anxiety/pain, hypoxia (early), pulmonary embolism, sepsis (early), salicylate toxicity, fever, hyperthyroidism, pregnancy (progesterone), high altitude, mechanical overventilation"),
                KeyValueRow(key: "METABOLIC ACIDOSIS — anion gap", value: "MUDPILES — Methanol, Uremia, DKA + alcoholic + starvation ketoacidosis, Propylene glycol (continuous lorazepam infusion), Iron + Isoniazid, Lactic acidosis (sepsis, hypoperfusion, cyanide, MELAS, metformin), Ethylene glycol, Salicylates (also respiratory alkalosis — mixed)"),
                KeyValueRow(key: "METABOLIC ACIDOSIS — non-anion gap", value: "Diarrhea (most common), renal tubular acidosis (RTA — types 1 distal, 2 proximal/Fanconi, 4 hyporenin/hypoaldost), ureteroenterostomy, addison disease, post-hypocapnia, dilutional, hyperalimentation, spironolactone"),
                KeyValueRow(key: "METABOLIC ALKALOSIS", value: "VOMITING (most common), nasogastric suction, diuretics (loop + thiazide), hyperaldosteronism, milk-alkali, severe hypokalemia, refeeding, antacid OD; saline-responsive (urine Cl <20) vs saline-unresponsive (urine Cl >20)")
            ]),
            .keyValueTable(title: "Oxygenation assessment", [
                KeyValueRow(key: "P/F ratio (PaO2/FiO2)", value: "Berlin ARDS criteria — Mild 200-300, Moderate 100-200, Severe <100; calculated PaO2 ÷ decimal FiO2"),
                KeyValueRow(key: "A-a gradient", value: "PAO2 − PaO2; PAO2 = (FiO2 × (atmospheric pressure − water vapor)) − pCO2/RQ; normal age + 4 (e.g., 20 yr ~24, 60 yr ~30); WIDE A-a → V/Q mismatch (PE, pneumonia, atelectasis), shunt (R-to-L), diffusion impairment; NORMAL A-a → hypoventilation (high pCO2), low FiO2"),
                KeyValueRow(key: "Pulse oximetry vs SaO2 vs PaO2", value: "Approximate relationship — SaO2 100% = PaO2 ~150; SaO2 95% = PaO2 ~80; SaO2 90% = PaO2 ~60 (steep portion of curve below); SaO2 80% = PaO2 ~50; SaO2 70% = PaO2 ~38"),
                KeyValueRow(key: "Pulse ox limitations", value: "Carbon monoxide poisoning (false normal — read as SpO2 100% but tissue hypoxia), methemoglobinemia (always reads ~85%), poor perfusion, dark nail polish, intense ambient light, motion artifact, anemia (still reports % saturated)")
            ]),
            .keyValueTable(title: "Common bedside scenarios", [
                KeyValueRow(key: "DKA", value: "pH ↓, HCO3 ↓, anion gap elevated, glucose ↑, ketones ↑; treat with insulin + fluids + K"),
                KeyValueRow(key: "Septic shock", value: "Lactic acidosis (pH ↓, HCO3 ↓, AG ↑, lactate ↑); treat sepsis + fluids; lactate clearance marker of resuscitation"),
                KeyValueRow(key: "ARDS", value: "PaO2 low, P/F <300, A-a gradient wide; respiratory acidosis if hypoventilation"),
                KeyValueRow(key: "COPD exacerbation", value: "Respiratory acidosis (acute on chronic); chronic compensated alkalosis baseline; permissive hypercapnia in mechanical ventilation"),
                KeyValueRow(key: "Salicylate toxicity", value: "MIXED — respiratory alkalosis (early hyperventilation) + metabolic acidosis (later); pH variable"),
                KeyValueRow(key: "Vomiting (severe)", value: "Metabolic alkalosis + hypokalemia + hypochloremia (Cl loss in HCl); replace fluids + KCl + correct underlying"),
                KeyValueRow(key: "Diarrhea", value: "Non-AG metabolic acidosis + hypokalemia + dehydration; ORS + replacement")
            ]),
            .bullets(title: "VBG vs ABG considerations", [
                AttributedBullet("VBG can SCREEN for acid-base abnormalities; if pH normal + pCO2 normal + HCO3 normal, often no need for ABG.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("VBG NOT reliable for: PaO2 (oxygenation), severe shock (poor correlation), hypothermia.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("ABG required for: confirmed oxygenation status (PaO2), acute setting where precise pH/pCO2 matters (intubation decisions), arterial line monitoring.", citationIDs: ["specialty_li39a"])
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Critical values — pH <7.20 OR >7.60, PaO2 <50, PaCO2 >60 acutely, lactate >4.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Specimen handling — heparinized syringe, on ice if not analyzed within 15 min, expel air bubbles (cause false high O2 + low CO2).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Allen test before radial puncture — verify ulnar collateral circulation.", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Site assessment post-puncture — pressure × 5 min (longer if anticoagulated); assess for hematoma, distal perfusion.", citationIDs: ["openrn_li39a"]),
                AttributedBullet("Trending — serial ABGs to track improvement/deterioration; correlate with clinical interventions (changing O2, ventilator settings, IV fluids, insulin).", citationIDs: ["specialty_li39a"]),
                AttributedBullet("Communication — clear ABG report to provider with interpretation summary; mixed disorders flag.", citationIDs: ["openrn_li39a"])
            ])
        ],
        citations: [openrnLI39A, cdcLI39A, specialtyLI39A],
        lastSourceFidelityReview: "2026-05-13"
    )
}
