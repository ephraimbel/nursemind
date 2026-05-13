import Foundation

// Curator-model cardiac diagnosis entries (v1.5 expansion).
// Sources: Open RN Med-Surg / Health Alterations (CC BY 4.0), AHA / ACC concept citations.

private let openrnCardio = CitationSource(
    id: "openrn_cardio_dx",
    shortName: "Open RN Health Alterations / Med-Surg — Cardiovascular",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cardiac+heart+arrhythmia",
    lastRetrieved: "2026-05-04"
)
private let ahaConcept = CitationSource(
    id: "aha_concept",
    shortName: "AHA / ACC clinical guidelines (concept citation)",
    publisher: "American Heart Association · American College of Cardiology",
    license: .factCitationOnly,
    url: "https://www.acc.org/guidelines",
    lastRetrieved: "2026-05-04"
)

private let perfusionDx2 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)

// MARK: - Cardiac Tamponade

public enum CardiacTamponadeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cardiac-tamponade",
        title: "Cardiac Tamponade",
        subtitle: "Pericardial fluid impairs ventricular filling · obstructive shock",
        nclexTags: perfusionDx2,
        definition: AttributedProse(
            "Life-threatening accumulation of fluid (blood, effusion) in the pericardial space causing increased intrapericardial pressure that impairs cardiac filling → reduced cardiac output → obstructive shock. Rate of accumulation matters more than volume — rapid accumulation of even small volumes can be fatal.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        pathophysiology: AttributedProse(
            "Causes: trauma (blunt or penetrating chest), cardiac surgery/procedure complication, malignancy (lung, breast, lymphoma), aortic dissection rupture, post-MI free wall rupture, uremic pericarditis, infection, anticoagulation. Increased intrapericardial pressure → equalization of diastolic pressures across heart chambers → impaired filling → cardiac output falls.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        presentation: [
            AttributedBullet("BECK'S TRIAD: hypotension + muffled heart sounds + JVD (only in ~30% of cases — absence does not exclude).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Tachycardia, dyspnea, anxiety.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("PULSUS PARADOXUS — exaggerated drop in SBP >10 mmHg with inspiration.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Narrow pulse pressure.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Distended neck veins (may be absent if hypovolemic).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Cool extremities, oliguria, AMS as shock progresses.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("PEA arrest can be the presenting feature.", citationIDs: ["openrn_cardio_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BEDSIDE ECHOCARDIOGRAPHY — gold standard; pericardial effusion + RV/RA collapse during diastole + IVC plethora.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("ECG: low voltage QRS, electrical alternans (alternating QRS amplitudes — heart swinging in fluid).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("CXR: globular ('water-bottle') heart if effusion large; clear lung fields.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("CLINICAL diagnosis with shock + suspicious history (trauma, malignancy, post-procedure) → do NOT delay treatment for imaging in extremis.", citationIDs: ["openrn_cardio_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous BP, ECG, SpO₂; arterial line if available.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pulsus paradoxus measurement (manual cuff or arterial line waveform).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Frequent reassessment — tamponade can decompensate suddenly.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("IV access (large-bore × 2); type and crossmatch.", citationIDs: ["openrn_cardio_dx"])
        ],
        commonInterventions: [
            AttributedBullet("IMMEDIATE PERICARDIOCENTESIS — definitive treatment; ultrasound-guided when possible; subxiphoid approach.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Surgical pericardial window for traumatic, post-surgical, or recurrent tamponade.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("IV FLUID BOLUS as TEMPORIZING measure to maintain preload (caution in over-resuscitation).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("AVOID positive pressure ventilation if possible (decreases venous return) — but secure airway if necessary.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("AVOID negative inotropes and vasodilators (nitroglycerin, beta-blockers) — worsen shock.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Treat underlying cause (anticoagulation reversal for hemopericardium, oncologic management for malignant effusion, antibiotics for infectious).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Monitor post-pericardiocentesis for re-accumulation; consider drain.", citationIDs: ["openrn_cardio_dx"])
        ],
        watchFor: [
            AttributedBullet("PEA arrest — true cardiac emergency.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Re-accumulation after drainage — leave drain or repeat.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Coronary artery laceration during pericardiocentesis — rare but can be fatal.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pericardial decompression syndrome — rare; pulmonary edema or LV dysfunction after rapid drainage.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Aortic dissection rupture into pericardium — type A; cardiothoracic surgery emergency.", citationIDs: ["openrn_cardio_dx"])
        ],
        citations: [openrnCardio, ahaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pericarditis

public enum PericarditisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pericarditis",
        title: "Acute Pericarditis",
        subtitle: "Pleuritic chest pain · friction rub · diffuse ST elevation + PR depression",
        nclexTags: perfusionDx2,
        definition: AttributedProse(
            "Inflammation of the pericardium causing pleuritic chest pain, with characteristic ECG changes and possible pericardial effusion. Most cases viral (idiopathic) and self-limited; other causes include autoimmune, post-MI (Dressler syndrome), uremic, malignant, infectious (TB, bacterial), post-cardiac surgery.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        pathophysiology: AttributedProse(
            "Inflammatory process of pericardial layers → exudation, fibrin deposition, possible effusion. Friction between inflamed layers produces audible rub.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        presentation: [
            AttributedBullet("Sharp, pleuritic chest pain — worse with deep breath, cough, lying flat; RELIEVED by sitting up and leaning forward.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pain may radiate to trapezius ridge (specific for pericarditis — phrenic nerve referral).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pericardial friction rub on auscultation — scratchy/grating, best heard at left lower sternal border with patient leaning forward.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Low-grade fever, malaise; preceded by viral URI in many.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Dyspnea if effusion.", citationIDs: ["openrn_cardio_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Two of: typical chest pain, pericardial friction rub, ECG changes, new/worsening pericardial effusion.", citationIDs: ["aha_concept"]),
            AttributedBullet("ECG: DIFFUSE ST ELEVATION (concave up) + PR DEPRESSION (specific) — distinguishes from MI (focal ST elevation, reciprocal changes).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Stages over days: ST elevation/PR depression → ST normalizes → T-wave inversion → normalization.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Echocardiogram for effusion assessment.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Labs: troponin (mildly elevated suggests myopericarditis), CRP/ESR, CBC, BUN/Cr, ANA if autoimmune suspected.", citationIDs: ["openrn_cardio_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain — character, position-related, response to treatment.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Vitals — assess for tamponade if hemodynamic compromise.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Auscultation for rub (changes with respiration and position).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Underlying cause — recent illness, MI, surgery, autoimmune disease, malignancy, dialysis.", citationIDs: ["openrn_cardio_dx"])
        ],
        commonInterventions: [
            AttributedBullet("First-line: NSAIDs (ibuprofen 600–800 mg TID or aspirin 750–1000 mg TID) PLUS COLCHICINE 0.5 mg BID × 3 months — reduces recurrence.", citationIDs: ["aha_concept"]),
            AttributedBullet("Avoid NSAIDs in post-MI pericarditis (other than aspirin) and in renal failure.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Corticosteroids only if NSAID contraindicated, refractory, or specific autoimmune cause; can increase recurrence rate.", citationIDs: ["aha_concept"]),
            AttributedBullet("Treat underlying cause (dialysis for uremic, antibiotics for bacterial, etc.).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Restrict strenuous exercise during active inflammation (esp. athletes — myocarditis risk).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pericardiocentesis for hemodynamically significant effusion or tamponade.", citationIDs: ["openrn_cardio_dx"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC TAMPONADE — assess for hypotension, JVD, pulsus paradoxus.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("MYOPERICARDITIS — concurrent myocardial involvement; troponin elevated; risk of arrhythmia, heart failure; admit and monitor.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Recurrent pericarditis (15–30%) — colchicine reduces.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Constrictive pericarditis — late chronic complication; pericardiectomy may be needed.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Bacterial (purulent) pericarditis — sepsis emergency; surgical drainage and IV antibiotics.", citationIDs: ["openrn_cardio_dx"])
        ],
        citations: [openrnCardio, ahaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Endocarditis

public enum EndocarditisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "endocarditis",
        title: "Infective Endocarditis (IE)",
        subtitle: "Valve infection · IV drug use risk factor · long-course IV antibiotics",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: AttributedProse(
            "Microbial infection of the endocardial surface, typically heart valves. Acute (typically S. aureus — rapid course, high mortality) vs subacute (typically viridans strep — indolent course, weeks of fevers). Major risk factors: prosthetic valves, congenital/structural heart disease, IV drug use (right-sided), prior IE, dialysis catheters, immunosuppression.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        pathophysiology: AttributedProse(
            "Bacteremia → adherence to abnormal endothelium (damaged valve, prosthetic material, jet lesions) → vegetation (platelet-fibrin-bacteria) → valve destruction, embolization, abscess. Right-sided IE often from IV drug use → tricuspid valve, septic pulmonary emboli.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        presentation: [
            AttributedBullet("Fever (most common — present in ~90%); chills, night sweats, fatigue, weight loss, anorexia (subacute).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("New or worsening heart murmur.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Embolic phenomena: stroke, splenic infarct, renal infarct, septic pulmonary emboli (right-sided).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Peripheral stigmata (less common in modern practice): Janeway lesions (painless macules palms/soles), Osler nodes (painful nodules pulp of fingers/toes), splinter hemorrhages, Roth spots (retinal), petechiae.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Heart failure from valvular destruction.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Septic pulmonary emboli in right-sided IE: dyspnea, pleuritic chest pain, infiltrates.", citationIDs: ["openrn_cardio_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DUKE CRITERIA (modified) — major: positive blood cultures (2 sets typical pathogen, persistently positive), evidence of endocardial involvement (echo: vegetation, abscess, new dehiscence; new regurgitation murmur).", citationIDs: ["aha_concept"]),
            AttributedBullet("Minor: fever, predisposition (IV drug use, valve disease), vascular phenomena, immunologic phenomena, microbiologic evidence not meeting major.", citationIDs: ["aha_concept"]),
            AttributedBullet("Definite IE: 2 major OR 1 major + 3 minor OR 5 minor.", citationIDs: ["aha_concept"]),
            AttributedBullet("Three sets of blood cultures from different sites at least 1 hour apart BEFORE antibiotics.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Echocardiography: TTE first; TEE more sensitive (especially for prosthetic valves, abscess).", citationIDs: ["openrn_cardio_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Vital signs — sepsis criteria.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Cardiac exam — new/changing murmur, signs of heart failure.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Neuro exam — embolic stroke is common and high-mortality.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Skin exam for stigmata; eye exam for Roth spots.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("IV access — long-course antibiotics; PICC after blood cultures.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Substance use history — opioid/IV drug use is a leading risk; harm reduction counseling and MOUD.", citationIDs: ["openrn_cardio_dx"])
        ],
        commonInterventions: [
            AttributedBullet("BLOOD CULTURES BEFORE ANTIBIOTICS — three sets from different sites.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Empiric IV antibiotics targeting most likely pathogens; tailored to culture/sensitivity (typical 4–6 weeks IV).", citationIDs: ["aha_concept"]),
            AttributedBullet("Native valve, acute: vancomycin + ceftriaxone (or anti-pseudomonal if at risk).", citationIDs: ["aha_concept"]),
            AttributedBullet("Prosthetic valve: vancomycin + gentamicin + rifampin.", citationIDs: ["aha_concept"]),
            AttributedBullet("PICC for prolonged IV antibiotic course; OPAT (outpatient parenteral antibiotic therapy) once stable.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Surgical valve replacement indications: heart failure from valve destruction, abscess, persistent bacteremia despite appropriate antibiotics, large vegetation with embolic events, fungal endocarditis, certain organisms (S. aureus on prosthetic).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Heart failure management as needed.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Substance use disorder treatment if relevant — MOUD, harm reduction.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("ENDOCARDITIS PROPHYLAXIS for high-risk patients (prosthetic valve, prior IE, certain congenital, transplant valvulopathy) before high-risk dental/respiratory procedures (per AHA): amoxicillin 2 g 30–60 min before; clindamycin if penicillin allergy.", citationIDs: ["aha_concept"])
        ],
        watchFor: [
            AttributedBullet("Heart failure from valve destruction — most common cause of death.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Embolic stroke — devastating; high mortality if hemorrhagic conversion of septic embolus.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Mycotic aneurysm — septic emboli to vessel wall; can rupture catastrophically.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Persistent fever despite appropriate antibiotics — rule out abscess, drug fever, secondary infection.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Septic emboli to lungs in right-sided (IV drug use) — dyspnea, infiltrates, hypoxia.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Recurrence in IV drug use — integrate addiction treatment.", citationIDs: ["openrn_cardio_dx"])
        ],
        citations: [openrnCardio, ahaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Aortic Dissection

public enum AorticDissectionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "aortic-dissection",
        title: "Aortic Dissection",
        subtitle: "Tearing chest/back pain · BP differential · time-critical",
        nclexTags: perfusionDx2,
        definition: AttributedProse(
            "Tear in aortic intima allowing blood to track between layers, creating a false lumen. Stanford TYPE A involves ascending aorta (surgical emergency); TYPE B involves descending aorta only (typically medical management). Hour-by-hour mortality ~1%/hour for type A if untreated.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        pathophysiology: AttributedProse(
            "Hypertension is the leading risk factor (along with connective tissue disease — Marfan, Ehlers-Danlos; bicuspid aortic valve; family history; cocaine use; pregnancy; trauma). Intimal tear → blood enters media → propagates → can rupture, occlude branches, or cause aortic regurgitation/tamponade.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        presentation: [
            AttributedBullet("SUDDEN, SEVERE, TEARING chest or back pain — maximal at onset (vs MI typically crescendo); often migratory.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Type A: anterior chest pain, radiating to neck/jaw.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Type B: interscapular back pain, may radiate to abdomen.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("BP differential between arms (>20 mmHg) — classic; absent or asymmetric pulses.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("New aortic regurgitation murmur (type A involvement of aortic root).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Neuro deficits if dissection involves carotid arteries.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Hemodynamic instability — rupture, tamponade, severe AR.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Diaphoresis, anxiety, syncope.", citationIDs: ["openrn_cardio_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT angiography of chest/abdomen/pelvis — gold standard; rapid, available.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("TEE (transesophageal echo) — at bedside in unstable patients.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("MRI — high accuracy but slow; less useful in acute setting.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("CXR: widened mediastinum (sensitive but not specific).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("D-dimer often elevated; not diagnostic but can support.", citationIDs: ["openrn_cardio_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("BILATERAL BP — discrepancy >20 mmHg suspicious.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pulses in all four extremities; femoral pulses.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Neuro exam — focal deficits, AMS suggest carotid involvement.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Heart sounds — new diastolic murmur of AR.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Peripheral perfusion, pain, urine output.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Risk factors — HTN history, connective tissue disease, family history, cocaine.", citationIDs: ["openrn_cardio_dx"])
        ],
        commonInterventions: [
            AttributedBullet("AGGRESSIVE BP CONTROL FIRST — target SBP 100–120 and HR <60 to reduce shear stress (dP/dt).", citationIDs: ["aha_concept"]),
            AttributedBullet("First: IV BETA-BLOCKER (esmolol or labetalol) for rate AND BP.", citationIDs: ["aha_concept"]),
            AttributedBullet("Second (if SBP still elevated): vasodilator (nicardipine, nitroprusside) AFTER beta-blockade — never give vasodilator alone (reflex tachycardia worsens shear).", citationIDs: ["aha_concept"]),
            AttributedBullet("Pain control: IV opioid (morphine, fentanyl).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("TYPE A: emergent CARDIOTHORACIC SURGERY — mortality 1%/hour without surgery.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("TYPE B uncomplicated: medical management with BP control; ICU monitoring.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("TYPE B complicated (rupture, malperfusion, refractory pain or HTN): TEVAR (endovascular repair) or open surgery.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Avoid anticoagulants and thrombolytics — would worsen.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("ICU admission for serial imaging, hemodynamic monitoring.", citationIDs: ["openrn_cardio_dx"])
        ],
        watchFor: [
            AttributedBullet("RUPTURE — sudden severe pain, hemodynamic collapse, tamponade (type A), exsanguination.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("End-organ MALPERFUSION — stroke, MI, mesenteric/renal/limb ischemia from dissection involving branches.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Aortic regurgitation, cardiac tamponade (type A complications).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Lifelong BP control after recovery; surveillance imaging; family screening for connective tissue disease.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Misdiagnosis as MI — giving thrombolytic to undiagnosed dissection is catastrophic; review BP differential and history.", citationIDs: ["openrn_cardio_dx"])
        ],
        citations: [openrnCardio, ahaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cardiogenic Shock

public enum CardiogenicShockSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cardiogenic-shock",
        title: "Cardiogenic Shock",
        subtitle: "Pump failure with inadequate tissue perfusion · high mortality",
        nclexTags: perfusionDx2,
        definition: AttributedProse(
            "Shock state caused by primary cardiac failure — heart cannot deliver adequate cardiac output despite adequate intravascular volume. Most commonly post-MI (LV pump failure or mechanical complication). High mortality (~30–50%).",
            citationIDs: ["openrn_cardio_dx"]
        ),
        pathophysiology: AttributedProse(
            "Causes: acute MI (LV pump failure most common; mechanical complications — papillary muscle rupture, VSR, free wall rupture); decompensated chronic HF; myocarditis; arrhythmia; valve dysfunction; cardiac tamponade (technically obstructive but mechanism overlaps); medication overdose (beta-blocker, CCB).",
            citationIDs: ["openrn_cardio_dx"]
        ),
        presentation: [
            AttributedBullet("HYPOTENSION (SBP <90 sustained) DESPITE adequate volume.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Signs of HYPOPERFUSION: cool/mottled extremities, prolonged cap refill, oliguria (UO <0.5 mL/kg/hr), AMS, lactic acidosis.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Signs of CONGESTION: pulmonary edema (crackles, dyspnea, hypoxia), JVD, hepatomegaly, peripheral edema.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Tachycardia (compensatory) or bradycardia (drug overdose, conduction).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("S3 gallop, new murmur (mechanical complication).", citationIDs: ["openrn_cardio_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("SBP <90 sustained ≥30 min OR vasopressors needed to maintain SBP ≥90 + signs of hypoperfusion + cardiac index <2.2 L/min/m² + PCWP >15 mmHg (when measured).", citationIDs: ["aha_concept"]),
            AttributedBullet("ECG, troponin, BNP, lactate, ABG, BMP, CBC, coags.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Echocardiography — assess LV/RV function, valves, mechanical complications.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Coronary angiography if ACS suspected.", citationIDs: ["openrn_cardio_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Continuous ECG, BP (arterial line), SpO₂; central line for vasopressors and CVP.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Hourly urine output (Foley).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Mental status, peripheral perfusion, lactate trend.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pulmonary status — pulmonary edema severity.", citationIDs: ["openrn_cardio_dx"])
        ],
        commonInterventions: [
            AttributedBullet("REVERSE THE CAUSE — ACS: emergent PCI; mechanical complication: surgery; arrhythmia: rhythm correction; tamponade: pericardiocentesis.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("INOTROPES (improve contractility): dobutamine first-line if BP marginal; milrinone (caution in hypotension; prolonged half-life).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("VASOPRESSORS (improve afterload/MAP) when severe hypotension: NOREPINEPHRINE first-line; avoid pure alpha agents that increase afterload.", citationIDs: ["aha_concept"]),
            AttributedBullet("Cautious diuresis (loop diuretic) if pulmonary congestion AND adequate perfusion — fluid balance is delicate.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Avoid β-blockers and ACE inhibitors acutely.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("MECHANICAL CIRCULATORY SUPPORT for refractory: intra-aortic balloon pump (IABP), Impella (percutaneous LV assist), VA-ECMO, surgical LVAD.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Mechanical ventilation as needed.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Cardiac transplant evaluation in select chronic HF patients.", citationIDs: ["openrn_cardio_dx"])
        ],
        watchFor: [
            AttributedBullet("Refractory shock and multi-organ failure.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Mechanical complications post-MI: papillary muscle rupture (acute MR), VSR (new harsh murmur), free wall rupture (PEA).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Arrhythmias — VT/VF; treat per ACLS.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Prognosis: PCI for cardiogenic shock from MI substantially improves outcome.", citationIDs: ["openrn_cardio_dx"])
        ],
        citations: [openrnCardio, ahaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Aortic Stenosis

public enum AorticStenosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "aortic-stenosis",
        title: "Aortic Stenosis (AS)",
        subtitle: "Crescendo-decrescendo SEM · syncope, angina, HF · valve replacement",
        nclexTags: perfusionDx2,
        definition: AttributedProse(
            "Narrowing of the aortic valve causing obstruction to LV outflow → LV hypertrophy → eventually heart failure. Most common in elderly (calcific degeneration) and bicuspid aortic valve patients (presents earlier). Severe AS with symptoms is a class I indication for valve replacement.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        pathophysiology: AttributedProse(
            "Progressive valve calcification/fibrosis → reduced valve area → pressure gradient across valve → LV concentric hypertrophy → diastolic dysfunction → eventual systolic dysfunction. Once symptomatic, prognosis declines rapidly without valve replacement.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        presentation: [
            AttributedBullet("CLASSIC TRIAD (predicts mortality): SYNCOPE (especially exertional), ANGINA, DYSPNEA on exertion (heart failure).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Syncope with exertion — failure to augment cardiac output through fixed obstruction.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("CRESCENDO-DECRESCENDO (diamond-shaped) systolic ejection murmur best heard right 2nd intercostal space, radiating to carotids.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pulsus parvus et tardus (slow-rising, weak carotid pulse).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Sustained PMI; S4 gallop (LVH); paradoxical splitting of S2 (severe).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Heart failure signs (late) — pulmonary edema, fatigue.", citationIDs: ["openrn_cardio_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECHOCARDIOGRAPHY — aortic valve area, mean pressure gradient, peak velocity. Severe AS: AVA <1.0 cm² OR mean gradient >40 mmHg OR peak velocity >4 m/s.", citationIDs: ["aha_concept"]),
            AttributedBullet("ECG: LVH, possible LBBB.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("CT for procedural planning (TAVR sizing).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Cardiac catheterization to assess CAD before surgery.", citationIDs: ["openrn_cardio_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom onset — once symptomatic, average survival <3 years without intervention.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Functional capacity — NYHA class.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pre-procedural assessment for TAVR vs SAVR.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Concurrent CAD, AFib, other valve disease.", citationIDs: ["openrn_cardio_dx"])
        ],
        commonInterventions: [
            AttributedBullet("VALVE REPLACEMENT — definitive treatment for symptomatic severe AS. Options: SAVR (surgical aortic valve replacement) or TAVR (transcatheter — increasingly used for intermediate/high surgical risk and now low-risk).", citationIDs: ["aha_concept"]),
            AttributedBullet("AVOID nitrates, ACE inhibitors, vasodilators in severe AS — preload-dependent; can precipitate hypotension/syncope.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("AVOID strenuous activity in severe AS until valve replaced.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Treat HF symptoms: cautious diuretic, careful with afterload reducers.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Treat AFib if present; rate control.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Endocarditis prophylaxis NOT recommended for native AS (per current AHA); IS recommended for prosthetic valve.", citationIDs: ["aha_concept"]),
            AttributedBullet("Post-TAVR/SAVR: anticoagulation per type (mechanical = warfarin lifelong; bioprosthetic = aspirin or short-term anticoagulation).", citationIDs: ["openrn_cardio_dx"])
        ],
        watchFor: [
            AttributedBullet("Exertional syncope or angina — high mortality if untreated; expedite valve replacement.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Sudden cardiac death — risk increased with severe AS, exertional symptoms.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Atrial fibrillation poorly tolerated — depends on atrial kick for filling stiff hypertrophied LV.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Heyde syndrome — AS + GI bleeding (acquired von Willebrand from shear destruction); treat AS to resolve.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Post-TAVR: stroke, vascular complications, paravalvular leak, conduction blocks (may need pacemaker).", citationIDs: ["openrn_cardio_dx"])
        ],
        citations: [openrnCardio, ahaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mitral Regurgitation

public enum MitralRegurgitationSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mitral-regurgitation",
        title: "Mitral Regurgitation (MR)",
        subtitle: "Holosystolic murmur · acute vs chronic · valve repair preferred",
        nclexTags: perfusionDx2,
        definition: AttributedProse(
            "Backflow of blood from LV to LA during systole due to incompetent mitral valve. Acute (papillary muscle rupture from MI, endocarditis, chordae rupture) vs chronic (mitral valve prolapse, rheumatic, functional from LV dilation). Acute severe MR is hemodynamic emergency; chronic MR slowly progressive.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        pathophysiology: AttributedProse(
            "Acute: sudden regurgitant volume → LA pressure rises rapidly (small/non-compliant LA) → pulmonary edema, cardiogenic shock. Chronic: gradual LA dilation accommodates regurgitation; eventual LV volume overload → dilation → systolic dysfunction.",
            citationIDs: ["openrn_cardio_dx"]
        ),
        presentation: [
            AttributedBullet("ACUTE: sudden severe pulmonary edema, dyspnea, hypotension, cardiogenic shock; new HOLOSYSTOLIC MURMUR at apex radiating to axilla.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("CHRONIC: gradual dyspnea on exertion, fatigue, orthopnea, palpitations (AFib), eventual right HF.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Holosystolic blowing murmur best at apex, radiating to axilla; S3 in severe.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Mitral valve prolapse: mid-systolic click ± late systolic murmur.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Atrial fibrillation common (LA enlargement).", citationIDs: ["openrn_cardio_dx"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECHOCARDIOGRAPHY — quantify regurgitant fraction, regurgitant volume, EROA; assess LV/LA size and function; identify mechanism (prolapse, flail, functional).", citationIDs: ["aha_concept"]),
            AttributedBullet("TEE for detailed valve anatomy, especially before repair.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("ECG: LA enlargement (P-mitrale — broad notched P in lead II); AFib common.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("CXR: cardiomegaly, LA enlargement; pulmonary edema in acute.", citationIDs: ["openrn_cardio_dx"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamic stability — ACUTE MR: assess for pulmonary edema, hypotension, shock.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Chronic: NYHA class, exercise tolerance, AFib status.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Underlying cause (post-MI, endocarditis, MVP, rheumatic).", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pre-procedural assessment for valve repair vs replacement.", citationIDs: ["openrn_cardio_dx"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE severe MR: urgent surgical evaluation; afterload reduction (IV nitroprusside, IABP) to reduce regurgitant fraction; treat pulmonary edema; treat underlying cause.", citationIDs: ["aha_concept"]),
            AttributedBullet("CHRONIC severe MR: VALVE REPAIR PREFERRED over replacement when feasible (better outcomes, no anticoagulation).", citationIDs: ["aha_concept"]),
            AttributedBullet("Indications for surgery: symptomatic, LVEF 30–60%, LV end-systolic diameter ≥40 mm, new AFib, pulmonary HTN.", citationIDs: ["aha_concept"]),
            AttributedBullet("Transcatheter edge-to-edge repair (MitraClip) for high-surgical-risk patients.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("MEDICAL: ACE inhibitor/ARB/ARNI in functional MR; beta-blocker for HF and rate control; diuretic for congestion; anticoagulation for AFib.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Endocarditis prophylaxis NOT recommended for native MR (per AHA); IS recommended for prosthetic valve or prior IE.", citationIDs: ["aha_concept"])
        ],
        watchFor: [
            AttributedBullet("Acute MR from papillary muscle rupture post-MI — surgical emergency; high mortality.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Pulmonary hypertension and right HF from chronic severe MR.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Atrial fibrillation — rate control and anticoagulation.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Endocarditis — prosthetic valve or damaged native valve; new murmur change + fever workup.", citationIDs: ["openrn_cardio_dx"]),
            AttributedBullet("Mechanical valve patients — lifelong warfarin (DOACs not approved); INR target 2.5–3.5 for mitral.", citationIDs: ["openrn_cardio_dx"])
        ],
        citations: [openrnCardio, ahaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}
