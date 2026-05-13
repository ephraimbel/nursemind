import Foundation

private let openrnMedSurg = CitationSource(
    id: "openrn_medsurg",
    shortName: "Open RN Health Alterations — relevant chapter",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
    lastRetrieved: "2026-05-03"
)
private let aha = CitationSource(
    id: "aha_guidelines",
    shortName: "AHA Guidelines (paraphrased + cited)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://professional.heart.org/en/guidelines-and-statements",
    lastRetrieved: "2026-05-03"
)
private let cdc = CitationSource(
    id: "cdc_clinical",
    shortName: "CDC clinical guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-03"
)

// MARK: - Stroke

public enum StrokeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "stroke",
        title: "Stroke (CVA)",
        subtitle: "Ischemic and hemorrhagic stroke",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Acute neurologic dysfunction caused by ischemia (87%) or hemorrhage (13%) in the brain. Ischemic from arterial occlusion (large-vessel, small-vessel, cardioembolic). Hemorrhagic from intracerebral or subarachnoid bleeding.",
            citationIDs: ["openrn_medsurg", "aha_guidelines"]
        ),
        pathophysiology: AttributedProse(
            "Ischemic: arterial occlusion → cessation of blood flow → infarction. Penumbra (salvageable tissue) surrounds core; the goal of acute treatment is to restore flow before penumbra dies. Hemorrhagic: rupture of vessel → mass effect, compression, ICP elevation.",
            citationIDs: ["openrn_medsurg"]
        ),
        presentation: [
            AttributedBullet("Sudden weakness or numbness on one side of body, face, arm, or leg.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Sudden confusion, trouble speaking, slurred speech, comprehension difficulty (aphasia).", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Sudden vision changes — diplopia, monocular blindness, hemianopia.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Sudden severe headache (especially in subarachnoid hemorrhage — 'thunderclap').", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Sudden dizziness, ataxia, loss of balance/coordination.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("BE-FAST mnemonic: Balance, Eyes, Face, Arms, Speech, Time.", citationIDs: ["aha_guidelines"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Non-contrast head CT immediately — rules out hemorrhage (must be done before tPA).", citationIDs: ["aha_guidelines"]),
            AttributedBullet("CTA or MRA to identify large-vessel occlusion (candidate for thrombectomy).", citationIDs: ["aha_guidelines"]),
            AttributedBullet("NIH Stroke Scale (NIHSS) — quantifies severity.", citationIDs: ["aha_guidelines"])
        ],
        priorityAssessments: [
            AttributedBullet("Time of last known well — drives tPA eligibility (within 3–4.5 hours) and thrombectomy eligibility (up to 24 hours in selected cases).", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Continuous neuro checks: NIHSS, GCS, pupils, motor symmetry, swallow assessment.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Frequent BP monitoring — pre-tPA goal <185/110, post-tPA goal <180/105.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Glucose check — hypoglycemia and hyperglycemia mimic and worsen stroke.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("NPO until swallow assessed — aspiration risk is high.", citationIDs: ["openrn_medsurg"])
        ],
        commonInterventions: [
            AttributedBullet("Door-to-CT ≤25 min, door-to-needle ≤45 min for tPA candidates.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("IV alteplase (tPA) within 3 (sometimes 4.5) hours for ischemic stroke without contraindications.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Mechanical thrombectomy for large-vessel occlusion within 24 hours (selected patients).", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Permissive hypertension in ischemic stroke unless tPA candidate — don't lower BP unless >220/120 or end-organ damage.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Hemorrhagic: aggressive BP control (<140 SBP), reverse anticoagulants, neurosurgery consult.", citationIDs: ["aha_guidelines"])
        ],
        watchFor: [
            AttributedBullet("Post-tPA bleeding — head CT for any neuro decline; check coags, fibrinogen.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Cerebral edema and herniation — worsening LOC, fixed pupil, posturing.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Aspiration pneumonia — strict NPO until swallow eval clears.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Seizures — possible during/after stroke; have seizure precautions.", citationIDs: ["openrn_medsurg"])
        ],
        citations: [openrnMedSurg, aha],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Heart Failure Exacerbation

public enum HeartFailureSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "heart-failure",
        title: "Acute decompensated heart failure",
        subtitle: "ADHF · CHF exacerbation",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Sudden worsening of heart failure signs and symptoms, leading to hospitalization. Categorized by ejection fraction: HFrEF (≤40%), HFmrEF (41–49%), HFpEF (≥50%).",
            citationIDs: ["openrn_medsurg", "aha_guidelines"]
        ),
        pathophysiology: AttributedProse(
            "Inability of the heart to pump enough to meet demand; activation of RAAS and SNS leads to volume overload and vasoconstriction; pulmonary congestion (left HF) and/or systemic congestion (right HF).",
            citationIDs: ["openrn_medsurg"]
        ),
        presentation: [
            AttributedBullet("Dyspnea on exertion, orthopnea, paroxysmal nocturnal dyspnea (PND).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Bilateral lower extremity edema, ascites, weight gain.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Crackles (pulmonary edema), S3 gallop, JVD, hepatojugular reflux.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Fatigue, decreased exercise tolerance, decreased urine output.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("In severe cases: pink frothy sputum, cardiogenic shock (hypotension, oliguria, mental status changes).", citationIDs: ["openrn_medsurg"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Elevated BNP or NT-proBNP supporting clinical diagnosis.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("CXR: pulmonary edema, cardiomegaly, cephalization, Kerley B lines, pleural effusions.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Echocardiogram: EF, wall motion, valves, pericardial effusion.", citationIDs: ["aha_guidelines"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous SpO2; respiratory effort and rate; lung auscultation.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Strict I&O; daily weights at the same time, same scale, same clothes.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Telemetry — arrhythmias common (AFib triggers exacerbations).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Mental status, perfusion (cool extremities, mottling), capillary refill.", citationIDs: ["openrn_medsurg"])
        ],
        commonInterventions: [
            AttributedBullet("LMNOP mnemonic: Lasix (IV), Morphine (controversial — for symptom relief and afterload reduction), Nitrates (NTG SL/IV), Oxygen, Position upright.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("IV loop diuretic (typically furosemide) — bolus or continuous infusion.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Vasodilators (NTG, hydralazine) for hypertensive ADHF.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Inotropes (dobutamine, milrinone) only for cardiogenic shock or severe low-output state.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Continue/optimize GDMT: ACE-I/ARB/ARNI, beta-blocker, MRA (spironolactone), SGLT2 inhibitor.", citationIDs: ["aha_guidelines"]),
            AttributedBullet("Fluid restriction (often 1.5–2 L/day) and sodium restriction (<2 g/day).", citationIDs: ["openrn_medsurg"])
        ],
        watchFor: [
            AttributedBullet("Cardiogenic shock — hypotension despite afterload reduction, oliguria, lactic acidosis.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Diuretic-induced AKI and electrolyte derangements (hypokalemia, hypomagnesemia).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Atrial fibrillation with RVR — can both cause and worsen HF; rate control or rhythm control per provider.", citationIDs: ["openrn_medsurg"])
        ],
        citations: [openrnMedSurg, aha],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Pneumonia

public enum PneumoniaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pneumonia",
        title: "Pneumonia",
        subtitle: "Community-acquired (CAP) and hospital-acquired (HAP/VAP)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        definition: AttributedProse(
            "Infection of the lung parenchyma. Classified by setting: community-acquired (CAP), hospital-acquired (HAP, ≥48 hours after admission), ventilator-associated (VAP, ≥48 hours after intubation), and aspiration pneumonia.",
            citationIDs: ["openrn_medsurg", "cdc_clinical"]
        ),
        pathophysiology: AttributedProse(
            "Inhalation, aspiration, or hematogenous spread of pathogens (bacterial, viral, fungal) → alveolar inflammation, exudate, impaired gas exchange.",
            citationIDs: ["openrn_medsurg"]
        ),
        presentation: [
            AttributedBullet("Cough (productive or dry), purulent or rust-colored sputum.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Fever, chills, rigors.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Pleuritic chest pain, dyspnea, tachypnea.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Crackles or bronchial breath sounds on auscultation; dullness to percussion.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Atypical: confusion (especially in older adults — may be only sign), fatigue, hypotension.", citationIDs: ["openrn_medsurg"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Chest imaging (CXR, CT) demonstrating infiltrate.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Clinical: cough, fever, abnormal breath sounds.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("WBC elevation (or leukopenia in severe sepsis).", citationIDs: ["openrn_medsurg"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs every 4 hours minimum (more often if unstable); SpO2 continuous.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Lung auscultation; cough quality and sputum characteristics.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Mental status (sepsis screening — confusion can be earliest sign in older adults).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Sepsis assessment (lactate, qSOFA, blood cultures BEFORE antibiotics).", citationIDs: ["openrn_medsurg"])
        ],
        commonInterventions: [
            AttributedBullet("Empiric antibiotics within 1 hour of severe sepsis recognition; per facility protocol for CAP/HAP/VAP.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Oxygen therapy to maintain SpO2 ≥92% (88–92% in COPD).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Pulmonary hygiene: cough/deep breathe, incentive spirometry, ambulation, head of bed elevated.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Fluids and antipyretics; hold if fluid-overloaded.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("VAP prevention bundle: HOB 30–45°, oral chlorhexidine, daily SAT/SBT, peptic ulcer + DVT prophylaxis.", citationIDs: ["cdc_clinical"])
        ],
        watchFor: [
            AttributedBullet("Sepsis and septic shock — pneumonia is a common source.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("ARDS in severe pneumonia — refractory hypoxemia, bilateral infiltrates, P/F ≤300.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Empyema or parapneumonic effusion — needs drainage.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Older adults with pneumonia: confusion, falls, dehydration as primary presentation; high mortality.", citationIDs: ["openrn_medsurg"])
        ],
        citations: [openrnMedSurg, cdc],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Pulmonary Embolism

public enum PESample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pulmonary-embolism",
        title: "Pulmonary embolism (PE)",
        subtitle: "Acute thromboembolism of the pulmonary circulation",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        definition: AttributedProse(
            "Blockage of one or more pulmonary arteries by a thrombus, typically embolized from a deep vein thrombosis. Severity ranges from small subsegmental PE to massive PE with hemodynamic collapse.",
            citationIDs: ["openrn_medsurg"]
        ),
        pathophysiology: AttributedProse(
            "Embolism → reduced pulmonary blood flow → V/Q mismatch, hypoxia, increased pulmonary vascular resistance, right ventricular strain. Massive PE causes RV failure, decreased preload to LV, hemodynamic collapse.",
            citationIDs: ["openrn_medsurg"]
        ),
        presentation: [
            AttributedBullet("Sudden-onset dyspnea, tachypnea (most common signs).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Pleuritic chest pain, hemoptysis (with infarction).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Tachycardia, hypoxemia, anxiety/sense of impending doom.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Massive PE: hypotension, syncope, cardiac arrest (PEA).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Asymmetric calf swelling/tenderness suggests DVT source.", citationIDs: ["openrn_medsurg"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT pulmonary angiogram (CTPA) — gold standard.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("V/Q scan — alternative when CTPA contraindicated (CKD, contrast allergy).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("D-dimer (rule out in low-pretest-probability patients).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Wells' criteria or PERC rule for pretest probability.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("EKG: sinus tachycardia (most common); S1Q3T3 pattern (classic but uncommon); T-wave inversion in V1-V4 (RV strain).", citationIDs: ["openrn_medsurg"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous SpO2, cardiac monitoring; vital signs every 15 min initially.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Mental status, perfusion (signs of obstructive shock).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Bleeding precautions and risk assessment before anticoagulation.", citationIDs: ["openrn_medsurg"])
        ],
        commonInterventions: [
            AttributedBullet("Supplemental oxygen to maintain SpO2 ≥92%.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Anticoagulation: IV heparin drip, LMWH (enoxaparin), or DOAC per provider.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Massive PE (hypotension, RV failure): thrombolysis (tPA) if no contraindications, or surgical/catheter embolectomy.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("IVC filter only in patients with contraindication to anticoagulation.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Bed rest initially; gradual mobilization once anticoagulated.", citationIDs: ["openrn_medsurg"])
        ],
        watchFor: [
            AttributedBullet("Hemodynamic decompensation — RV failure, obstructive shock, cardiac arrest (PEA most common).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Anticoagulation bleeding; signs of HIT if on heparin.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Recurrent PE despite therapy — workup for malignancy, thrombophilia, IVC filter.", citationIDs: ["openrn_medsurg"])
        ],
        citations: [openrnMedSurg],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Anaphylaxis

public enum AnaphylaxisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anaphylaxis",
        title: "Anaphylaxis",
        subtitle: "Acute, life-threatening systemic hypersensitivity reaction",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        definition: AttributedProse(
            "A serious systemic hypersensitivity reaction characterized by rapid onset of life-threatening airway, breathing, and/or circulatory compromise; usually IgE-mediated mast cell and basophil degranulation.",
            citationIDs: ["openrn_medsurg"]
        ),
        pathophysiology: AttributedProse(
            "Antigen exposure → IgE crosslinking on mast cells/basophils → release of histamine, tryptase, leukotrienes → vasodilation, capillary leak, bronchospasm, mucosal edema. Onset within minutes; biphasic reactions possible 4–8 hours later.",
            citationIDs: ["openrn_medsurg"]
        ),
        presentation: [
            AttributedBullet("Skin: hives, flushing, itching, angioedema (face, lips, tongue, throat).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Respiratory: stridor, wheezing, dyspnea, throat tightness, hoarseness.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Cardiovascular: tachycardia, hypotension, syncope, shock.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("GI: cramping, vomiting, diarrhea.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Sense of impending doom, confusion in severe reactions.", citationIDs: ["openrn_medsurg"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis: acute onset (minutes–hours) PLUS skin/mucosal symptoms PLUS at least one of (respiratory compromise OR hypotension/end-organ dysfunction).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("OR two or more of: skin/mucosal, respiratory, BP drop, GI symptoms after exposure to likely allergen.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("OR isolated hypotension after known allergen exposure.", citationIDs: ["openrn_medsurg"])
        ],
        priorityAssessments: [
            AttributedBullet("ABC continuously — airway is the priority assessment.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Vital signs every 5 minutes during acute phase; continuous monitoring.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("IV access × 2 large bore.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Identify trigger: medication, food, contrast, latex, insect, blood product.", citationIDs: ["openrn_medsurg"])
        ],
        commonInterventions: [
            AttributedBullet("EPINEPHRINE IM 0.3–0.5 mg in mid-outer thigh — FIRST and most important intervention. May repeat every 5–15 minutes.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Position supine with legs elevated (unless airway compromised → sitting).", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("High-flow oxygen.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("IV fluid resuscitation — large-volume NS bolus for hypotension.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Adjuncts (AFTER epinephrine): H1 blocker (diphenhydramine), H2 blocker (famotidine), corticosteroids, albuterol for bronchospasm.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("If refractory: epinephrine drip, glucagon (if on β-blocker), vasopressors.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Observation 4–6 hours minimum after resolution — biphasic reactions occur in up to 20%.", citationIDs: ["openrn_medsurg"])
        ],
        watchFor: [
            AttributedBullet("Biphasic anaphylaxis 4–12 hours after initial reaction — observe in hospital.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Loss of airway from angioedema — anticipate and prepare for emergent intubation.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("Cardiac arrest from refractory hypotension or hypoxemia.", citationIDs: ["openrn_medsurg"]),
            AttributedBullet("β-blocker therapy makes anaphylaxis epinephrine-resistant — glucagon may be needed.", citationIDs: ["openrn_medsurg"])
        ],
        citations: [openrnMedSurg],
        lastSourceFidelityReview: "2026-05-03"
    )
}
