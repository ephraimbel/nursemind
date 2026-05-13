import Foundation

// Curator-model diagnosis entries (round 17 — trauma + critical care + transfusion).

private let openrnDxR17 = CitationSource(
    id: "openrn_dx_round17",
    shortName: "Open RN Health Alterations + Critical Care",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=trauma+critical+care+transfusion",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR17 = CitationSource(
    id: "specialty_dx_round17",
    shortName: "ATLS / SCCM / AABB / ABA / ACEP concept citations",
    publisher: "ATLS · SCCM · AABB · ABA · ACEP",
    license: .factCitationOnly,
    url: "https://www.facs.org/quality-programs/trauma/atls/",
    lastRetrieved: "2026-05-04"
)

private let traumaR17 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .safety)
private let bloodR17 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .clottingHemostasis)
private let cardiopulmR17 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)

public enum MajorBurnSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "major-burn",
        title: "Major burn injury",
        subtitle: "TBSA + depth · Parkland fluid · airway + escharotomy · burn-center criteria",
        nclexTags: traumaR17,
        definition: AttributedProse(
            "Thermal, electrical, chemical, or radiation injury to skin + deeper tissue causing systemic inflammatory + metabolic response. Severity by total body surface area (TBSA), depth, age, location, comorbidities. ABA criteria define burn-center transfer per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Direct tissue injury → coagulation + inflammation → capillary leak (peak 24 hours) → massive fluid shifts → hypovolemic shock → multi-organ dysfunction. Hypermetabolic state lasts months. Inhalation injury + carboxyhemoglobinemia + cyanide + airway edema multiply mortality.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Depth — superficial (1°, sunburn-like, no blisters), partial-thickness (2°, blisters, pain), full-thickness (3°, dry leathery painless), 4° (extends to bone / muscle).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("TBSA — Rule of 9s (adults) or Lund-Browder (peds, more accurate); palm = 1% TBSA.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Airway compromise — facial / circumferential neck burns, singed nasal hair, soot in airway, hoarseness, stridor → emergent airway.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Inhalation injury — fire in enclosed space, hoarseness, soot, carboxyhemoglobinemia.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Compartment syndrome from circumferential full-thickness burns of extremities or torso.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Shock signs early — tachycardia, hypotension, oliguria, lactate elevation.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical TBSA + depth assessment using Rule of 9s / Lund-Browder.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Carboxyhemoglobin (CO-oximetry), lactate, ABG, lytes, glucose, CK (rhabdo), creatinine, type + screen.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Bronchoscopy if inhalation injury suspected; chest X-ray; ECG (especially electrical injuries).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("ABA burn-center transfer criteria — partial >10% TBSA, full-thickness any age, face/hands/feet/genitalia/perineum/major joints, electrical, chemical, inhalation, comorbidities, peds at non-peds center per primary source.", citationIDs: ["specialty_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("AIRWAY first — emergent intubation if compromised; do NOT wait for swelling progression.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Two large-bore IVs (avoid burned skin); arterial line for severe; foley for urine output target.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Tetanus status; carbon monoxide / cyanide co-exposure assessment.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Pain assessment + early multimodal analgesia; psychological support.", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("PARKLAND FORMULA — 4 mL × kg × %TBSA (partial + full only) of LR over 24 hours; HALF in first 8 hours from time of injury, HALF over remaining 16 hours per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("TITRATE FLUIDS to urine output 0.5 mL/kg/hr adult or 1 mL/kg/hr peds — Parkland is starting estimate, not target per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Inhalation injury — early intubation; CO poisoning treated with 100% O2 / HBO; cyanide treated with hydroxocobalamin.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("ESCHAROTOMY — circumferential full-thickness extremity / torso burns + impaired perfusion / ventilation.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Wound care — silver sulfadiazine (deep), bacitracin (superficial), silver dressings, biological dressings, eventual grafting.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Hypermetabolic management — early enteral nutrition, oxandrolone, propranolol, glucose control.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Pain — multimodal — opioids + ketamine + gabapentin + procedural anesthesia.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("DVT prophylaxis once stabilized; stress ulcer prophylaxis; tetanus.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Burn center transfer per ABA criteria.", citationIDs: ["specialty_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("AIRWAY EDEMA — progressive over 24 hours; intubate early if any concern.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("OVERRESUSCITATION — \"fluid creep\"; pulmonary edema, abdominal compartment syndrome; titrate to urine output.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("ABDOMINAL COMPARTMENT SYNDROME — bladder pressure >20 + organ dysfunction; emergent decompression.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("INFECTION / SEPSIS — leading cause of late mortality; aggressive surveillance + targeted abx.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Long-term — scarring + contractures + disfigurement + PTSD + need for reconstructive surgery.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum SCISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "spinal-cord-injury",
        title: "Acute spinal cord injury (SCI)",
        subtitle: "Mechanism + level + ASIA grade · neurogenic shock · airway level-dependent",
        nclexTags: traumaR17,
        definition: AttributedProse(
            "Damage to spinal cord from trauma (most common — MVC, falls, sports, violence) or non-traumatic causes. Severity classified by ASIA Impairment Scale (A complete to E normal). Level determines functional outcome + ventilation needs per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Primary injury — mechanical disruption. Secondary injury — ischemia + inflammation + edema + apoptosis over hours-days. Loss of sympathetic outflow below T6 → neurogenic shock (hypotension + bradycardia + warm extremities, distinct from hypovolemic shock).",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Loss of sensation / motor function below level of injury (per ASIA exam).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Cervical injuries — quadriplegia, respiratory compromise (C3–C5 affects diaphragm via phrenic nerve).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Thoracic / lumbar — paraplegia, varying autonomic involvement.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("NEUROGENIC SHOCK — bradycardia + hypotension + warm dry skin (T6 + above).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("SPINAL SHOCK — flaccid paralysis + areflexia + autonomic depression hours-weeks; resolves to spasticity + reflexes return.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Priapism (males with cord injury), bowel + bladder dysfunction.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ASIA neurologic exam — motor + sensory + level + impairment grade per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Imaging — CT C-spine + thoracolumbar; MRI for cord visualization + ligamentous injury per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("ABG, lactate, FAST exam (concurrent injury).", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Spine immobilization at scene — cervical collar + long board; logroll.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Airway — early intubation if cervical injury / bulbar dysfunction / declining respiratory effort.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Differentiate neurogenic from hypovolemic shock — bradycardia + warm extremities suggest neurogenic.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Concurrent traumatic injuries — pan-CT in major trauma.", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("MAINTAIN MAP 85–90 mmHg × 5–7 days post-injury (cord perfusion) — IV fluids + vasopressors; norepinephrine first-line per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Atropine for symptomatic bradycardia; pacing for refractory.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Surgical decompression / stabilization within 24 hours per current evidence.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Methylprednisolone (NASCIS) — controversial; not current routine standard per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Prevent secondary injury — oxygenation, perfusion, glucose, temperature, immobilization.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Foley catheter (urinary retention); bowel program; DVT prophylaxis (mechanical + pharmacologic when stable); PUD prophylaxis.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Skin care + frequent repositioning (paralyzed body, decreased sensation).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Multidisciplinary rehabilitation — PT, OT, speech, psych, vocational; spinal cord injury center transfer.", citationIDs: ["specialty_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("AUTONOMIC DYSREFLEXIA (T6 + above, post spinal shock) — severe HTN + headache from noxious stimulus below injury (full bladder, fecal impaction); EMERGENCY — sit upright, identify trigger, antihypertensive (nitrate, hydralazine, captopril).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Respiratory failure — high cervical injuries; ventilator dependence; tracheostomy planning.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("DVT / PE — mechanical + pharmacologic prophylaxis; high incidence.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("DEPRESSION / SUICIDE risk — long-term mental health support.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum RhabdomyolysisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "rhabdomyolysis",
        title: "Rhabdomyolysis",
        subtitle: "Muscle breakdown · CK + myoglobin · AGGRESSIVE IV fluids · prevent AKI",
        nclexTags: traumaR17,
        definition: AttributedProse(
            "Skeletal muscle injury → release of intracellular contents (CK, myoglobin, K+, phosphate, urate, LDH) into circulation. Severe — myoglobinuric AKI, hyperkalemic arrhythmia, compartment syndrome, DIC per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Muscle injury → loss of cell membrane integrity → Ca2+ influx → mitochondrial dysfunction → ATP depletion → cell lysis. Myoglobin filtered by glomerulus + nephrotoxic via heme-iron + tubular obstruction → AKI.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Triad — muscle pain + weakness + dark / tea-colored urine (positive dipstick blood without RBCs).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Many asymptomatic — recognized only on labs.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Risk factors — crush injury, trauma, prolonged immobilization, seizures, severe exertion, heat illness, drugs (statins, cocaine, ecstasy, alcohol), genetic myopathies, infections, malignant hyperthermia.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Compartment syndrome — pain out of proportion, paresthesias, pallor, paralysis, pulselessness — late.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Hyperkalemic arrhythmia, hypocalcemia, hyperphosphatemia early; rebound hypercalcemia later.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CK >5× normal (often >5000–50,000+) — diagnostic; trend q6h.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Urine — myoglobinuria (positive blood on dipstick, NO RBCs on micro); tea-colored.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Lytes — hyperkalemia, hyperphosphatemia, hypocalcemia, AGM acidosis.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Creatinine + BUN — track AKI; lactate; LDH; coags (DIC if severe).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Investigate cause — trauma, drug screen, exertion history, fever / sepsis, statin / fibrate use.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Volume status — often severely depleted; large IV resuscitation.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Cardiac monitoring — hyperkalemia + arrhythmia.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Compartment exam — circumferential injury / crush — measure pressures if suspected.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Identify + remove triggers (stop offending drug, treat seizure, cool heat illness).", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("AGGRESSIVE IV NORMAL SALINE — 1–2 L/hr initially, then titrate to urine output 200–300 mL/hr per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Continue IV fluids until CK trending toward normal (often <5000) per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Treat hyperkalemia — calcium gluconate (cardiac), insulin / dextrose, bicarbonate, β-agonists, kayexalate / patiromer; emergency dialysis if severe / refractory.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Avoid lactated Ringer's debate — small lactate / K+ load — most centers use NS first then transition.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Bicarbonate alkalinization — controversial; consider if urine pH <6.5 + severe acidosis per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Mannitol — controversial; may be considered for forced diuresis but not routine.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Renal replacement therapy — for severe AKI / hyperkalemia / fluid overload / acidosis refractory to medical therapy.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Compartment syndrome — emergent fasciotomy.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Treat underlying cause — discontinue statin / fibrate; treat sepsis / heat illness / NMS / serotonin syndrome / MH.", citationIDs: ["openrn_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("HYPERKALEMIC ARREST — early aggressive treatment.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("AKI requiring DIALYSIS — risk increases with CK >15,000–20,000 + AKI.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("DIC — fibrinogen, platelet, PT/PTT trends; treat underlying.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Volume overload — careful titration in elderly / HF.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AcutePericarditisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pericarditis-acute",
        title: "Acute pericarditis",
        subtitle: "Chest pain + friction rub + diffuse ST elevations · NSAIDs + colchicine · tamponade watch",
        nclexTags: cardiopulmR17,
        definition: AttributedProse(
            "Acute inflammation of pericardium. Causes — viral (most common, often presumed), idiopathic, autoimmune, post-MI (Dressler), post-cardiac surgery, uremia, malignancy, TB, radiation, drugs. Up to 30% recur per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Inflammatory response in pericardial tissue → fibrinous exudate + sometimes effusion → pain + friction rub + characteristic ECG changes. Tamponade if effusion compromises hemodynamics.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("PLEURITIC chest pain — sharp, worse with inspiration / lying flat / cough; relieved by leaning forward.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Pericardial friction rub — leathery scratching, best LL sternal border, leaning forward, end-expiration.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("DIFFUSE ST elevation + PR depression on ECG (vs MI which is regional); reciprocal changes in aVR + V1 only.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Fever, malaise, recent viral illness common.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Tamponade — Beck's triad (hypotension + JVD + muffled heart sounds); pulsus paradoxus.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("≥2 of 4 — pleuritic chest pain, friction rub, ECG changes (diffuse ST elevation + PR depression), new / worsening pericardial effusion per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("ECG — stage I (diffuse ST elevation + PR depression), stage II (normalization), stage III (T-wave inversion), stage IV (resolution).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Inflammatory markers — ESR / CRP elevated.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Echocardiogram — assess for effusion / tamponade.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Troponin elevation — myopericarditis (cardiology consultation).", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish from MI (regional ST elevation, troponin pattern), PE (pleuritic but lung perfusion), aortic dissection (severe tearing).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Tamponade signs — emergent echocardiogram + pericardiocentesis.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Etiology workup — recent illness, autoimmune history, uremia, malignancy, HIV / TB risk, drugs.", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("NSAIDs first-line — ibuprofen 600 mg PO TID or aspirin 750 mg TID × 1–2 weeks; taper per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("COLCHICINE 0.5–1 mg/day × 3 months for first episode; reduces recurrence per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("AVOID glucocorticoids first-line (increases recurrence); reserve for refractory or autoimmune cause per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Treat underlying cause — uremia (dialysis), TB (RIPE), malignancy, autoimmune.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Activity restriction — avoid strenuous exercise until resolution + 3+ months for athletes.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Hospitalization — fever, large effusion, tamponade signs, troponin elevation, oral therapy failure, immunocompromised.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Pericardiocentesis — tamponade; large symptomatic effusion; suspected purulent.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Recurrent — extended colchicine + low-dose steroid taper; rilonacept (IL-1 blocker) FDA-approved 2021 per primary source.", citationIDs: ["specialty_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC TAMPONADE — emergent pericardiocentesis; fluid bolus + vasopressor as bridge.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Constrictive pericarditis — chronic; ascites + dyspnea + JVD; pericardiectomy for refractory.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Recurrent — colchicine non-adherence; tapering steroids too quickly; persistent inflammation.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Myopericarditis — troponin elevation; cardiology referral; activity restriction more strict.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum HemothoraxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hemothorax",
        title: "Hemothorax",
        subtitle: "Blood in pleural space · trauma + iatrogenic · CHEST TUBE + transfusion · thoracotomy if massive",
        nclexTags: cardiopulmR17,
        definition: AttributedProse(
            "Accumulation of blood in pleural cavity, most commonly from blunt or penetrating thoracic trauma. Massive hemothorax = >1500 mL initial drainage OR >200 mL/hr for ≥4 hours = thoracotomy indication per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Bleeding from intercostal artery, internal mammary, lung parenchyma, great vessels, heart, diaphragm injury. Pleural blood compresses lung → hypoxia + ventilation impairment; hypovolemic shock if large volume.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Dyspnea, decreased breath sounds, dullness to percussion on affected side.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Hypotension, tachycardia, altered mental status (hypovolemic shock).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Tracheal deviation in tension hemothorax.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Mechanism — blunt (rib fracture / lung), penetrating (knife / GSW), iatrogenic (central line, biopsy).", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("FAST or e-FAST ultrasound — pleural fluid in trauma bay; portable CXR for less acute.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("CT chest — definitive volume + source assessment.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Type + cross; hemoglobin trend; coags + platelets for resuscitation planning.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — airway, breathing, circulation; large-bore IVs + balanced resuscitation.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Volume — initial chest tube output + ongoing trend determines surgical decision.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Concomitant injuries — pneumothorax, cardiac, abdominal in trauma.", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("CHEST TUBE 28–32 Fr (or larger) — primary intervention; allows drainage + lung re-expansion + monitoring per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Blood transfusion — type-specific or O-neg per protocol; activate massive transfusion if needed.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("AUTOTRANSFUSION — selected closed-system autotransfusion devices; volume <6 hours.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("THORACOTOMY indications — initial output >1500 mL OR >200 mL/hr × 4 hours OR >100 mL/hr × 8 hours OR hemodynamic instability + persistent bleeding per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("VATS for retained hemothorax — undrained collection >300–500 mL persisting >72 hours per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Treat coagulopathy — TXA, FFP, cryoprecipitate, platelets, factor concentrates per protocol.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("DVT prophylaxis once stabilized; pain management; antibiotics per surgical decision.", citationIDs: ["openrn_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("MASSIVE HEMOTHORAX — emergent surgical intervention; balanced resuscitation; do not over-crystalloid.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("RETAINED HEMOTHORAX — empyema risk → VATS within 72 hours.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Re-expansion pulmonary edema — monitor SpO2 + chest X-ray after large evacuation.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Coagulopathy of trauma — DIC; TXA within 3 hours; balanced resuscitation 1:1:1.", citationIDs: ["specialty_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TensionPneumothoraxSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "tension-pneumothorax",
        title: "Tension pneumothorax",
        subtitle: "Air trapped under pressure · clinical diagnosis · NEEDLE DECOMPRESSION before imaging",
        nclexTags: cardiopulmR17,
        definition: AttributedProse(
            "One-way valve mechanism allowing air into pleural space without escape → progressive intrathoracic pressure rise → mediastinal shift, decreased venous return, cardiovascular collapse. EMERGENT clinical diagnosis — do NOT delay for imaging per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Pleural air accumulates → ipsilateral lung collapse → mediastinum shifts to contralateral side → kinked great vessels → reduced venous return + cardiac output → obstructive shock.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Severe respiratory distress, hypoxia, decreased breath sounds + hyperresonance ipsilateral.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Hypotension, tachycardia, JVD.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Tracheal deviation AWAY from affected side (late finding).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Mechanism — penetrating chest trauma, blunt rib fracture, mechanical ventilation, central line, lung biopsy, asthma / COPD with high airway pressures.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — do NOT wait for chest X-ray in unstable patient per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Bedside ultrasound — absent lung sliding + lung point.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("CXR after decompression — confirms + evaluates re-expansion / catheter position.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Recognize quickly — combination of hypotension + decreased breath sounds + hyperresonance is enough to act.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Ensure adequate IV access for resuscitation; monitor SpO2 + cardiac rhythm continuously.", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT NEEDLE THORACOSTOMY — 14G angiocath in 2nd intercostal space midclavicular line OR 4th–5th ICS anterior axillary line per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Listen for hiss of air; immediate hemodynamic improvement expected.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("FOLLOW WITH TUBE THORACOSTOMY — definitive management; needle is bridge per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Volume resuscitation + supplemental oxygen / mechanical ventilation as needed.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Treat underlying cause — close penetrating wound, adjust ventilator settings, surgical consultation for persistent leak / large bullae.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Trauma center transfer if not at trauma center.", citationIDs: ["openrn_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("Persistent air leak after chest tube — bronchopleural fistula; thoracic surgery for VATS / pleurodesis / repair.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Re-expansion pulmonary edema — particularly if rapidly evacuated; supportive care.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Recurrence — primary spontaneous pneumothorax in tall thin young men; consider VATS for second event per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Iatrogenic — central line, biopsy; refine technique + monitor post-procedure.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum VaricealHemorrhageSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "variceal-hemorrhage",
        title: "Acute variceal hemorrhage",
        subtitle: "Cirrhotic GI bleed · OCTREOTIDE + CEFTRIAXONE + endoscopy + balloon tamponade · TIPS",
        nclexTags: cardiopulmR17,
        definition: AttributedProse(
            "Bleeding from gastroesophageal varices — life-threatening complication of portal hypertension (cirrhosis predominantly). Mortality 15–20% per episode; coordinated resuscitation + pharmacologic + endoscopic + interventional bridge to TIPS / transplant per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Portal hypertension (>10 mmHg gradient) → portosystemic collaterals form → varices in distal esophagus + gastric fundus → rupture from pressure / wall stress / coagulopathy. Bacterial translocation common during bleed → SBP risk.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Hematemesis (often massive), melena, hematochezia (large-volume), shock, AMS.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Underlying cirrhosis — jaundice, ascites, encephalopathy, spider angiomata, splenomegaly.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Concurrent SBP, hepatorenal syndrome, encephalopathy commonly precipitated.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Risk factors — Child-Pugh B/C, prior bleed, large varices, red wale signs on prior endoscopy.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — known cirrhosis + acute UGIB.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Endoscopy within 12 hours — confirms diagnosis + therapeutic.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Labs — CBC, coags, LFTs, lactate, type + cross, lytes, BUN/Cr, ammonia.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Two large-bore IVs; massive transfusion protocol if hemodynamically unstable.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Airway protection — intubate if AMS / vomiting + altered consciousness; aspiration risk.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Coordinate GI + IR + ICU + transplant team.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Identify precipitants — alcohol, infection, hepatocellular carcinoma, NSAID use, non-adherence to β-blocker.", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("OCTREOTIDE 50 mcg IV bolus + 50 mcg/hr × 3–5 days — reduces splanchnic blood flow per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("CEFTRIAXONE 1 g IV daily × 7 days — antibiotic prophylaxis reduces SBP + mortality per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Endoscopic VARICEAL BAND LIGATION (first-line) OR sclerotherapy within 12 hours per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("PRBC transfusion goal Hgb 7–8 (avoid over-transfusion which increases portal pressure) per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Reverse coagulopathy carefully — vitamin K, FFP / cryoprecipitate / platelets per balanced resuscitation; do NOT correct INR aggressively per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("BALLOON TAMPONADE (Sengstaken-Blakemore / Minnesota tube) — bridge to definitive therapy in massive uncontrolled bleed; ICU + airway protection; max 24 hours per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("TIPS — refractory bleeding OR Child-Pugh B with active bleeding (early TIPS strategy) per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Lactulose for hepatic encephalopathy prevention; treat SBP if confirmed.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Long-term — non-selective β-blocker (carvedilol or propranolol) + repeat banding; consider transplant evaluation.", citationIDs: ["specialty_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("REBLEEDING — peak first 5 days; plan repeat endoscopy; consider TIPS if persistent.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("ASPIRATION pneumonia — secure airway early in altered patients.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("HEPATORENAL SYNDROME — albumin + terlipressin (US — midodrine + octreotide + albumin); transplant evaluation.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("ENCEPHALOPATHY — lactulose + rifaximin; identify precipitants.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum MesentericIschemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mesenteric-ischemia",
        title: "Acute mesenteric ischemia",
        subtitle: "Pain out of proportion · embolic / thrombotic / non-occlusive · CT angio + emergent revasc",
        nclexTags: cardiopulmR17,
        definition: AttributedProse(
            "Acute compromise of intestinal blood flow → bowel ischemia + necrosis. Etiologies — arterial embolism (most common — afib), arterial thrombosis (atherosclerosis), venous thrombosis (hypercoagulable), non-occlusive (low-flow shock states). Mortality 50–80% — TIME-CRITICAL diagnosis per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Compromised mesenteric circulation (SMA most common) → intestinal hypoperfusion → mucosal ischemia → full-thickness necrosis (within hours-days) → bacterial translocation + sepsis + perforation if untreated.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("\"PAIN OUT OF PROPORTION\" to physical exam — severe abdominal pain with relatively unremarkable abdomen early on.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Risk factors — atrial fibrillation, recent MI, severe atherosclerosis, hypotension / shock, hypercoagulable state, post-cardiac surgery, dialysis.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Late — peritonitis (rebound, guarding), bloody stool, sepsis, lactic acidosis.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Chronic mesenteric ischemia — postprandial pain, weight loss, food fear (separate entity).", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT ANGIOGRAPHY — first-line; identifies vessel occlusion + bowel injury per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Lactate elevation — late finding; normal early.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Conventional angiography — therapeutic option (catheter-directed thrombolysis).", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Labs — CBC (leukocytosis), lactate, CMP, ABG, coags, lipase (rule out pancreatitis), troponin (concurrent ACS).", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Time from onset critical — survival drops rapidly after 12–24 hours.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Hemodynamic stability + perfusion; aggressive resuscitation.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Coordinate vascular surgery + IR + general surgery + critical care.", citationIDs: ["specialty_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT REVASCULARIZATION — endovascular (catheter-directed thrombolysis, mechanical thrombectomy, stent) OR surgical (embolectomy, bypass) per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Bowel resection — non-viable segments; second-look laparotomy in 24–48 hours per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Anticoagulation — unfractionated heparin during workup + post-revascularization per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Aggressive fluid resuscitation; broad-spectrum antibiotics; avoid vasoconstrictors when possible (worsen ischemia) — choose vasopressin or low-dose norepinephrine if needed.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("NPO + NG decompression; ICU monitoring.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Address etiology — afib (anticoag), atherosclerosis (lifestyle + statin + antiplatelet), hypercoagulable workup.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Non-occlusive (low-flow) — restore perfusion, treat shock state, papaverine vasodilation infusion via SMA in selected.", citationIDs: ["specialty_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("DELAYED DIAGNOSIS — primary cause of mortality; high index of suspicion in afib + sudden severe abdominal pain.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("SHORT GUT SYNDROME after extensive resection — TPN dependence, transplant evaluation.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("REPERFUSION INJURY — ischemia-reperfusion physiology; supportive care.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Recurrent — long-term anticoag + lifestyle modification.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DiabeticFootInfectionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "diabetic-foot-infection",
        title: "Diabetic foot infection",
        subtitle: "Polymicrobial · IDSA staging · OSTEO ruled out by probe-to-bone + MRI · multidisciplinary",
        nclexTags: cardiopulmR17,
        definition: AttributedProse(
            "Skin / soft tissue infection in a person with diabetes, often involving an underlying ulcer; high risk of progression to osteomyelitis + amputation. IDSA staging guides management. Vasculopathy + neuropathy + immunopathy combine — multidisciplinary care critical per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Loss of protective sensation (neuropathy) → unrecognized trauma → ulceration → bacterial colonization → infection (often polymicrobial — Staph, Strep, anaerobes, Pseudomonas in chronic). Compromised perfusion (PAD) impairs healing + drug delivery.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Local — ulcer + erythema + warmth + drainage + induration; offensive odor (anaerobes).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("IDSA staging — uninfected (1), mild (2 — local <2 cm erythema), moderate (3 — extensive cellulitis or deep tissue), severe (4 — SIRS / sepsis).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Charcot foot mimic — atraumatic warm swollen foot in neuropathic patient WITHOUT infection.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Necrotizing infection signs — pain out of proportion, gas in tissue, systemic toxicity.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Diabetic / glycemic instability worsens infection.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("PROBE-TO-BONE test — sterile probe touches bone through ulcer = highly predictive of osteomyelitis per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("X-ray — late osteomyelitis changes; MRI — gold standard for osteomyelitis per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Bone biopsy + culture — gold standard for organism + sensitivities; tissue (NOT swab) culture per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Vascular assessment — ABI, toe pressures, Doppler; arterial duplex / CTA / MRA if PAD suspected.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Inflammatory markers — ESR / CRP elevated; procalcitonin; WBC.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity (IDSA) + glycemic control + perfusion + osteomyelitis status.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Multidisciplinary team — endocrinology, vascular, infectious disease, podiatry, wound nursing.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Charcot foot vs infection — temperature differential, infection markers, MRI helps.", citationIDs: ["specialty_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("MILD — outpatient cephalexin / dicloxacillin / clindamycin; modify with culture per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("MODERATE — broader oral or IV — amoxicillin-clavulanate, ampicillin-sulbactam; add MRSA coverage if risk per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("SEVERE — admit, IV broad-spectrum (piperacillin-tazobactam, vanco, cefepime + metronidazole) per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("OSTEOMYELITIS — 4–6 weeks IV/PO targeted therapy; longer if hardware involved; surgical debridement / resection per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Surgical debridement of devitalized tissue; eschar removal; abscess drainage.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Off-loading — total contact casting / removable boot to redistribute pressure.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Vascular intervention if PAD limiting perfusion — endovascular / surgical revascularization.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Glycemic optimization — A1c <8 reduces healing time + amputation risk.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Wound care — moist environment, advanced dressings, NPWT for complex wounds.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Patient education — daily foot exam, proper footwear, podiatry follow-up, smoking cessation.", citationIDs: ["openrn_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("AMPUTATION — last resort but sometimes life-saving; multidisciplinary review.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("RECURRENT INFECTION — same patient + same site; ID consultation + long-term suppressive therapy in some.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("MRSA / MDR organisms — risk factors (recent abx, hospitalization, dialysis).", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("CHARCOT FOOT progression — irreversible deformity if unrecognized.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AnaphylaxisAcuteSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anaphylaxis-acute",
        title: "Anaphylaxis (acute management)",
        subtitle: "EPINEPHRINE IM first · airway + IV fluids + adjuncts · biphasic 1–24 hr · ED observation",
        nclexTags: traumaR17,
        definition: AttributedProse(
            "Severe systemic IgE-mediated (or non-IgE) hypersensitivity reaction with rapid onset + multi-system involvement. EPINEPHRINE IM is first + only first-line; antihistamines / steroids are adjuncts that DO NOT replace it per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Antigen exposure → IgE crosslinking on mast cells / basophils → massive release of histamine + tryptase + leukotrienes + cytokines → vasodilation + capillary leak + bronchospasm + mucosal edema. Onset minutes; biphasic reactions 1–24 hours later possible.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Skin — urticaria, flushing, angioedema (often early; can be absent in severe).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Respiratory — stridor, hoarseness, wheezing, chest tightness, dyspnea.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Cardiovascular — hypotension, tachycardia (or bradycardia in severe / Bezold-Jarisch), syncope, cardiac arrest.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("GI — nausea, vomiting, abdominal cramps, diarrhea.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Triggers — foods (top 9), insect venom, drugs (β-lactams, NSAIDs, IV contrast, biologics), latex, exercise-induced.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Acute (within minutes-hours) onset + skin/mucosal involvement + AT LEAST ONE of: respiratory compromise, hypotension, severe GI symptoms — OR — known trigger + hypotension OR severe respiratory.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Tryptase elevated 15 min – 3 hours post-onset (confirmatory); often missed in first hour or in food allergy per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Clinical diagnosis — DO NOT delay treatment for confirmation.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Airway — stridor / hoarseness; have intubation kit + cricothyrotomy backup.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Hemodynamics — IV fluid + vasopressors; recumbent + legs elevated unless dyspnea.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Trigger identification + removal (stop infusion, remove stinger).", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("EPINEPHRINE IM 0.3–0.5 mg (adult) or 0.01 mg/kg (peds, max 0.3 mg) into outer thigh — REPEAT EVERY 5–15 MIN AS NEEDED; FIRST + ONLY first-line per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("IV fluid bolus 1–2 L NS rapidly; repeat as needed.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("REFRACTORY hypotension — epinephrine IV infusion 0.05–2 mcg/kg/min.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Glucagon 1–5 mg IV for β-blocker patients refractory to epinephrine per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Adjuncts — H1 (diphenhydramine 25–50 mg IV) + H2 (famotidine 20 mg IV) for cutaneous; albuterol nebulized for bronchospasm; corticosteroid (methylprednisolone 125 mg IV).", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Position — supine + legs elevated unless respiratory distress (then sitting); avoid sudden upright position.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("ED observation 4–6 hours minimum for biphasic reaction; admit if severe / refractory.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("DISCHARGE — TWO epinephrine autoinjectors prescribed + emergency action plan + allergist referral + medical-alert ID.", citationIDs: ["specialty_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("BIPHASIC REACTION — 1–24 hours after initial; observation period; counsel return precautions.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("UPPER AIRWAY OBSTRUCTION — secure airway early; cricothyrotomy if needed.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("β-BLOCKER patients — refractory to epinephrine; glucagon rescue.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("AVOIDANCE failure — counsel on label reading, dining out, communication; immunotherapy for venom + select foods.", citationIDs: ["specialty_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TRALISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "trali",
        title: "Transfusion-related acute lung injury (TRALI)",
        subtitle: "Hypoxia within 6 hours of transfusion · non-cardiogenic pulm edema · supportive care",
        nclexTags: bloodR17,
        definition: AttributedProse(
            "Acute lung injury (PaO2/FiO2 <300 OR SpO2 <90%) developing within 6 hours of transfusion of plasma-containing blood product, with bilateral pulmonary infiltrates + no evidence of left atrial hypertension. Leading cause of transfusion-related mortality. Diagnosis of exclusion per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Two-hit model — recipient predisposing factor (recent surgery, sepsis, massive transfusion) + donor anti-HLA / anti-neutrophil antibodies → activated neutrophils sequester in pulmonary capillaries → endothelial injury + pulmonary edema. Plasma + platelet products higher risk than RBCs.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Sudden dyspnea, hypoxia, tachypnea, fever, hypotension during or within 6 hours of transfusion.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Bilateral pulmonary infiltrates on chest X-ray.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("No evidence of cardiogenic pulmonary edema (normal CVP, low BNP, normal echo).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Risk factors — recent surgery, sepsis, alcoholic liver disease, mechanical ventilation, massive transfusion.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Onset within 6 hours of transfusion + acute hypoxemia (PaO2/FiO2 <300 or SpO2 <90% on room air) + bilateral pulmonary infiltrates + no evidence of left atrial hypertension OR adequately explained by other cause per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Differentiate from TACO (volume overload — usually older, cardiac history, elevated BNP, responds to diuresis).", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Notify blood bank — investigation; donor unit lookback for HLA / HNA antibodies.", citationIDs: ["specialty_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("STOP TRANSFUSION immediately; maintain IV access with NS.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Oxygenation + airway — supplemental O2; mechanical ventilation often needed (~70%).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Distinguish TRALI from TACO; treat differently.", citationIDs: ["specialty_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("STOP TRANSFUSION; supportive care.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Supplemental O2 / non-invasive ventilation / intubation as needed; lung-protective ventilation if intubated.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Cautious fluid management — TRALI is permeability edema (NOT volume overload); diuretics generally NOT helpful + may worsen if hypotensive per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Vasopressors as needed for hypotension.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Steroids — not routinely indicated; controversial.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Notify blood bank for transfusion reaction workup; report to hemovigilance.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Most resolve in 48–96 hours; mortality ~5–25% depending on severity + comorbidities.", citationIDs: ["openrn_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("DIFFERENTIATE FROM TACO — older + cardiac history + elevated BNP + responds to diuretics; more common but less mortality.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("PROGRESSIVE HYPOXEMIA — be prepared for intubation + ARDS-like care.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Future transfusions — washed products / male-only plasma donors; coordinate with blood bank per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Mortality higher in critically ill + massive transfusion; balanced 1:1:1 protocols may reduce risk.", citationIDs: ["specialty_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TACOSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "taco",
        title: "Transfusion-associated circulatory overload (TACO)",
        subtitle: "Hypervolemia + pulmonary edema · within 6 hours · diuresis + slow transfusion",
        nclexTags: bloodR17,
        definition: AttributedProse(
            "Cardiogenic pulmonary edema from volume overload during or within 6 hours of transfusion. Most common serious transfusion reaction; underrecognized. Risk factors — elderly, cardiac / renal dysfunction, rapid transfusion rate per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Excess volume from transfusion + impaired cardiac / renal compensation → elevated pulmonary capillary pressure → pulmonary edema (hydrostatic, NOT permeability — distinct from TRALI).",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Dyspnea, orthopnea, tachypnea, hypoxia within 6 hours of transfusion.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("HYPERTENSION (vs hypotension in TRALI), JVD, S3 gallop, peripheral edema.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Risk factors — age >70, CHF, renal failure, low pre-transfusion albumin, multiple units, rapid rate.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Bilateral pulmonary infiltrates / Kerley B lines on chest X-ray; cephalization.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Within 6 hours of transfusion + acute respiratory distress + radiographic pulmonary edema + evidence of volume overload (elevated BNP, JVD, hypertension, weight gain) per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("BNP / NT-proBNP elevated (vs TRALI usually normal).", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Echocardiogram — elevated filling pressures (vs TRALI normal).", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Differentiate from TRALI quickly — TACO has elevated BP + BNP + responds to diuresis.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Volume status, cardiac function, renal function.", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("STOP TRANSFUSION; sit patient upright.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Supplemental oxygen; non-invasive ventilation if needed.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("DIURETICS — furosemide 20–40 mg IV; titrate to response per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Slow rate of subsequent transfusions — extend over 4 hours; consider split units; pre-transfusion diuretic in high-risk per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Notify blood bank for reaction workup + hemovigilance reporting.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Cardiac monitoring; NIV / intubation if respiratory failure.", citationIDs: ["openrn_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("DIFFERENTIATE FROM TRALI — TRALI has hypotension + normal BNP + does not respond to diuresis; coordinate carefully.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Cardiac decompensation — coordinate with cardiology if persistent.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Future transfusions — slow rate (e.g., 1 mL/kg/hr in CHF), pre-diuretic, consider whole-blood-equivalent products.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Underrecognized — high index of suspicion in vulnerable patients.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AcuteHemolyticTransfusionReactionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acute-hemolytic-transfusion",
        title: "Acute hemolytic transfusion reaction (AHTR)",
        subtitle: "ABO incompatibility · fever + chills + back pain · STOP transfusion + supportive care · usually clerical error",
        nclexTags: bloodR17,
        definition: AttributedProse(
            "Severe immune-mediated hemolysis from ABO-incompatible RBC transfusion (clerical / labeling error in most cases). Onset within 1 hour of transfusion. Mortality ~10–50%. Most preventable transfusion reaction per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Recipient anti-A or anti-B IgM antibodies bind donor RBC antigens → complement activation → intravascular hemolysis → hemoglobinemia / hemoglobinuria → AKI + DIC + hypotension + death.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Onset within minutes — first 50–100 mL of incompatible unit typically triggers.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Fever, chills, back / flank pain, chest pain, dyspnea, hypotension, tachycardia.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Hemoglobinuria (red / brown urine), oliguria, AKI.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("DIC signs — bleeding from IV sites, mucosa, surgical wounds.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Anesthetized patients — first sign may be hypotension + hemoglobinuria + DIC.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("STOP transfusion; recheck patient identity + unit label vs blood bank record per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Direct antiglobulin test (DAT / direct Coombs) positive; free hemoglobin in plasma + urine; haptoglobin low; LDH + indirect bilirubin elevated.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Repeat type + crossmatch on patient + bag; investigate clerical error.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Coags (DIC), creatinine (AKI), CBC.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("STOP TRANSFUSION; maintain IV access with NS.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Hemodynamics, renal function, coagulation, urine output trend.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Notify blood bank + supervisor immediately.", citationIDs: ["specialty_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("STOP TRANSFUSION immediately; maintain IV with NS; preserve unit + tubing for blood bank.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Aggressive IV NS; goal urine output >100 mL/hr; furosemide if oliguric.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Vasopressors for hypotension; ICU admission for severe.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Treat DIC — replace coagulation factors + platelets per consumption + bleeding.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Renal replacement therapy if AKI severe / refractory.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Send post-reaction labs — blood bank workup + investigation per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Root-cause analysis — most are clerical / wrong-patient errors; system improvement.", citationIDs: ["specialty_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("DIC + AKI — high mortality; aggressive supportive care.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("DELAYED hemolytic transfusion reaction (3–14 days) — milder, often Kidd / Duffy / Kell antibodies; positive DAT + falling Hgb + jaundice.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("PREVENTION — two-person verification at bedside; barcode scanning; never assume the unit is correct without verification.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Future — ensure phenotype-matched units if antibodies detected; lifelong antibody card.", citationIDs: ["specialty_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ElectricalInjurySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "electrical-injury",
        title: "Electrical injury",
        subtitle: "Iceberg injury · cardiac arrhythmia + rhabdo + compartment · ECG + telemetry observation",
        nclexTags: traumaR17,
        definition: AttributedProse(
            "Tissue damage from electrical current — low-voltage (<1000 V — household, occupational), high-voltage (≥1000 V — power lines, industrial, lightning). Injury extent often greatly underestimated from surface burn alone — \"iceberg\" effect with deep tissue damage per primary source.",
            citationIDs: ["openrn_dx_round17", "specialty_dx_round17"]
        ),
        pathophysiology: AttributedProse(
            "Electrical current flows through path of least resistance → thermal injury + electroporation + secondary trauma. Current passes through nerve, blood vessel, muscle preferentially. Cardiac involvement common (arrhythmias). Lightning — massive instantaneous DC current; flashover often spares deep tissue.",
            citationIDs: ["openrn_dx_round17"]
        ),
        presentation: [
            AttributedBullet("Entry / exit wounds — small surface burns, often mismatched with deep tissue damage.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Cardiac — arrhythmia (VF, asystole, ventricular ectopy), MI-like ECG changes, troponin elevation.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Neurologic — LOC, seizure, peripheral neuropathy, spinal cord injury, autonomic dysfunction.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Musculoskeletal — rhabdomyolysis, compartment syndrome, fractures (from tetanic contractions / falls).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Renal — myoglobinuric AKI.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Lightning specific — Lichtenberg figures (transient), TM rupture, cataracts (delayed), tympanic membrane rupture, keraunoparalysis.", citationIDs: ["openrn_dx_round17"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG + continuous cardiac monitoring 24 hours for high-voltage / symptomatic / cardiac symptoms / abnormal initial ECG per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Labs — CK, myoglobin, troponin, electrolytes, creatinine, urinalysis, ABG.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Imaging — CT spine + chest if mechanism suggests; ophthalmologic exam (especially lightning).", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Compartment exam — extremities at risk; pressure measurement if suspected.", citationIDs: ["openrn_dx_round17"])
        ],
        priorityAssessments: [
            AttributedBullet("Scene safety — disconnect power before approach; CPR + AED if cardiac arrest.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("ABCs; cardiac monitoring + serial ECGs.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Concomitant trauma from fall / blast (cervical spine, blunt injury).", citationIDs: ["openrn_dx_round17"])
        ],
        commonInterventions: [
            AttributedBullet("CARDIAC — ACLS for arrhythmia; observation 24 hours for asymptomatic high-voltage; discharge possible for low-voltage with normal ECG + asymptomatic per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("RHABDOMYOLYSIS — aggressive IV fluids + monitoring per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("COMPARTMENT SYNDROME — emergent fasciotomy + escharotomy if needed.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("BURN CARE — surface + deep tissue; transfer to burn center for high-voltage / extensive injuries.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Tetanus prophylaxis; analgesia.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Pediatric oral electrical injury — counsel about delayed labial artery bleeding 7–14 days post-injury.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("Lightning — \"reverse triage\" (treat appearing dead first because primary respiratory arrest, may recover with CPR); 24-hour observation per primary source.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("Long-term — neuropsychiatric sequelae (depression, PTSD, cognitive); cataracts (lightning); cardiac follow-up.", citationIDs: ["openrn_dx_round17"])
        ],
        watchFor: [
            AttributedBullet("DELAYED ARRHYTHMIA — 24-hour monitoring even if initial normal in high-voltage.", citationIDs: ["specialty_dx_round17"]),
            AttributedBullet("MISSED DEEP TISSUE INJURY — small entry / exit wounds may hide massive muscle / vascular damage; CT / MRI if suspected.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("RHABDOMYOLYSIS / AKI — aggressive fluids early.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("CATARACTS — develop weeks-months after lightning; ophtho follow-up.", citationIDs: ["openrn_dx_round17"]),
            AttributedBullet("DELAYED ORAL BLEEDING — pediatric mouth-cord injuries; counsel parents.", citationIDs: ["openrn_dx_round17"])
        ],
        citations: [openrnDxR17, specialtyDxR17],
        lastSourceFidelityReview: "2026-05-04"
    )
}
