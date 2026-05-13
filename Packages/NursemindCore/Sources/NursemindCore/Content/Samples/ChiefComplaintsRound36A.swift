import Foundation

// Curator-model references (round 36 part A — chief-complaint workup: cardiopulm + neuro evaluation frameworks).

private let openrnCC36A = CitationSource(
    id: "openrn_cc36a",
    shortName: "Open RN Health Alterations + Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcCC36A = CitationSource(
    id: "cdc_cc36a",
    shortName: "CDC + AHRQ + NIH concept citations",
    publisher: "CDC · AHRQ · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyCC36A = CitationSource(
    id: "specialty_cc36a",
    shortName: "ACEP + AHA + ACC + AAN + IDSA + ENA fact citations",
    publisher: "ACEP · AHA · ACC · AAN · IDSA · ENA",
    license: .factCitationOnly,
    url: "https://www.acep.org/",
    lastRetrieved: "2026-05-13"
)

private let ccTagsR36 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)

public enum ChestPainEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chest-pain-evaluation",
        title: "Chest pain evaluation",
        subtitle: "ACS · PE · aortic dissection · pneumothorax · pneumonia · pericarditis · esophageal · MSK · time-critical risk stratification + HEART score + workup",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Chest pain accounts for ~6.5M ED visits/year in US; ~10-20% have ACS, the rest range from benign to life-threatening non-cardiac causes. Approach prioritizes time-critical \"can't miss\" diagnoses — ACS, PE, aortic dissection, tension pneumothorax, esophageal rupture, cardiac tamponade. Risk stratification tools (HEART score, TIMI, GRACE) guide disposition. Quality improvement focus on door-to-ECG ≤10 minutes + door-to-balloon ≤90 minutes for STEMI per primary source.",
                citationIDs: ["specialty_cc36a"]
            )),
            .keyValueTable(title: "Life-threatening causes (\"can't miss\")", [
                KeyValueRow(key: "STEMI / ACS", value: "Pressure/tightness, radiation to jaw/arm, diaphoresis, dyspnea, nausea; ECG ST elevation/depression/T inversion; troponin elevated; HEART score risk stratification"),
                KeyValueRow(key: "PULMONARY EMBOLISM", value: "Sudden pleuritic CP + dyspnea + tachycardia, leg swelling/DVT signs, syncope; Wells/PERC; D-dimer + CT-PA"),
                KeyValueRow(key: "AORTIC DISSECTION", value: "Sudden tearing/ripping CP radiating to back, BP differential >20 mmHg between arms, pulse deficits, new aortic regurg murmur, syncope; CT-A or MRA aorta"),
                KeyValueRow(key: "TENSION PNEUMOTHORAX", value: "Sudden CP + dyspnea + hypoxia + JVD + tracheal deviation + absent breath sounds + hypotension; CLINICAL diagnosis — needle decompression at 2nd ICS midclavicular line BEFORE imaging"),
                KeyValueRow(key: "ESOPHAGEAL RUPTURE (Boerhaave)", value: "Severe CP after vomiting/instrumentation, subcutaneous emphysema, mediastinitis; CT chest with PO contrast or esophagram"),
                KeyValueRow(key: "CARDIAC TAMPONADE", value: "Beck triad (hypotension + JVD + muffled heart sounds), pulsus paradoxus >12 mmHg, electrical alternans on ECG; bedside ECHO + emergent pericardiocentesis")
            ]),
            .keyValueTable(title: "Other common causes", [
                KeyValueRow(key: "Pericarditis/myocarditis", value: "Sharp pleuritic CP, worse supine, better leaning forward, friction rub, diffuse ST elevation + PR depression; viral most common"),
                KeyValueRow(key: "Pneumonia", value: "Pleuritic CP + cough + fever + dyspnea; CXR infiltrate; CURB-65 severity"),
                KeyValueRow(key: "Stable angina", value: "Predictable exertional CP relieved by rest + nitro within 5 min; outpatient workup if stable"),
                KeyValueRow(key: "Esophageal/GERD", value: "Burning, postprandial, supine; PPI trial diagnostic + therapeutic; correlate"),
                KeyValueRow(key: "Esophageal spasm", value: "Severe CP responsive to nitroglycerin (mimics ACS); manometry diagnostic"),
                KeyValueRow(key: "MSK / costochondritis", value: "Reproducible with palpation, sharp + localized; diagnosis of exclusion after ruling out serious"),
                KeyValueRow(key: "Anxiety/panic", value: "CP with hyperventilation + paresthesias + circumoral numbness + sense of doom; diagnosis of exclusion"),
                KeyValueRow(key: "Herpes zoster", value: "Dermatomal CP that may precede vesicular rash by days; consider in unilateral pain + risk factors")
            ]),
            .bullets(title: "Initial workup priorities", [
                AttributedBullet("ECG within 10 minutes of arrival — identifies STEMI/NSTEMI for time-critical reperfusion.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Serial troponin (0 + 1-3 hr or 0 + 6 hr depending on assay) — high-sensitivity troponin standard.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("CXR — evaluates pneumothorax, pneumonia, mediastinal widening (dissection), cardiomegaly.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Vital signs (BP both arms, SpO2, HR, RR, temp), focused cardiopulm exam, leg DVT exam.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("CBC + BMP + lipase (if epigastric component) + coagulation; consider lactate if shock.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Wells score for PE → D-dimer (low pretest) or CT-PA (high pretest).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("HEART score for risk stratification: Low (0-3) → outpatient ok; Moderate (4-6) → observe + serial trop; High (7-10) → admit + cardiology.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Bedside ECHO if tamponade/dissection suspected; CT-A if dissection or PE.", citationIDs: ["specialty_cc36a"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("ABC + IV access (2 large-bore) + cardiac monitor + continuous SpO2 + supplemental O2 if hypoxic (target >90%).", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Nitroglycerin SL 0.4 mg q5 min × 3 if SBP >100 + no PDE5 inhibitor use within 24-48 hr (sildenafil 24 hr, tadalafil 48 hr).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Aspirin 162-325 mg chewed unless contraindicated; morphine for refractory pain (use sparingly — possibly worsens outcomes).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Pain reassessment Q5-10 min during acute presentation; document character + radiation + 0-10 scale + relieving/aggravating factors.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Anticipate cath lab activation for STEMI; door-to-balloon ≤90 min.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Reassess with vital signs after every intervention; deteriorating BP/SpO2/mental status → escalate immediately.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("DO NOT give nitroglycerin if SBP <90 OR right ventricular MI (worsens preload-dependent state) OR PDE5 inhibitor use.", citationIDs: ["specialty_cc36a"])
            ])
        ],
        citations: [openrnCC36A, cdcCC36A, specialtyCC36A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DyspneaEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "dyspnea-evaluation",
        title: "Dyspnea / shortness of breath evaluation",
        subtitle: "Cardiac vs pulm vs metabolic vs anxiety · acute vs chronic · workup · time-critical (PE, MI, asthma exacerbation, anaphylaxis, pneumothorax)",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Dyspnea — subjective sensation of breathing discomfort; complex symptom involving respiratory mechanics, gas exchange, and central perception. Acute dyspnea (minutes to hours) suggests time-critical etiology (PE, MI, anaphylaxis, asthma/COPD exacerbation, pneumothorax, pulmonary edema). Chronic dyspnea (weeks to months) suggests structural disease (COPD, ILD, heart failure, anemia, deconditioning). MRC + NYHA scales quantify impact. SpO2 + ABG + CXR are foundational; targeted advanced workup based on initial findings per primary source.",
                citationIDs: ["specialty_cc36a"]
            )),
            .keyValueTable(title: "Acute dyspnea — life-threatening etiologies", [
                KeyValueRow(key: "PULMONARY EMBOLISM", value: "Sudden + pleuritic CP + tachycardia + hypoxia; Wells score + D-dimer or CT-PA"),
                KeyValueRow(key: "TENSION PNEUMOTHORAX", value: "Sudden + unilateral absent breath sounds + tracheal deviation + JVD + hypotension; needle decompression IMMEDIATELY"),
                KeyValueRow(key: "ANAPHYLAXIS", value: "Stridor + wheezing + urticaria + angioedema + hypotension; epinephrine 0.3-0.5 mg IM IMMEDIATELY"),
                KeyValueRow(key: "ACUTE PULMONARY EDEMA", value: "Pink frothy sputum + crackles + S3 + JVD + LE edema; LMNOP — Lasix + Morphine + Nitrates + O2 + Position upright"),
                KeyValueRow(key: "ASTHMA / COPD EXACERBATION", value: "Wheezing + accessory muscles + prolonged expiration; bronchodilators + steroids; severe → consider intubation"),
                KeyValueRow(key: "PNEUMONIA WITH SEPSIS", value: "Fever + cough + sputum + crackles + hypoxia + hypotension; antibiotics + fluids + sepsis bundle"),
                KeyValueRow(key: "ARDS", value: "Severe hypoxia despite O2 + bilateral infiltrates + non-cardiogenic; intubation + low-tidal-volume vent + prone positioning")
            ]),
            .keyValueTable(title: "Subacute/chronic dyspnea causes", [
                KeyValueRow(key: "Heart failure", value: "Orthopnea + PND + LE edema + JVD; BNP, ECHO; treat per HFrEF/HFpEF guidelines"),
                KeyValueRow(key: "COPD/asthma chronic", value: "Cough + sputum + smoking history; PFTs (obstructive, FEV1/FVC <0.7); GOLD staging"),
                KeyValueRow(key: "Pleural effusion", value: "Dullness to percussion + decreased breath sounds; CXR/US; thoracentesis"),
                KeyValueRow(key: "Interstitial lung disease", value: "Dry cough + Velcro crackles + clubbing; HRCT + PFTs (restrictive)"),
                KeyValueRow(key: "Anemia", value: "Pallor + fatigue + tachycardia; CBC; treat underlying"),
                KeyValueRow(key: "Pulmonary HTN", value: "Loud P2 + RV heave + RV failure signs; ECHO + RHC"),
                KeyValueRow(key: "Deconditioning/obesity", value: "Diagnosis of exclusion; PFTs + ECHO normal; lifestyle interventions"),
                KeyValueRow(key: "Anxiety/hyperventilation", value: "Sense of suffocation + paresthesias + circumoral numbness; respiratory alkalosis on ABG; rule out organic cause first")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Vital signs + SpO2 on room air (severity); supplemental O2 to maintain SpO2 >90% (>88% in COPD).", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Targeted history — onset (sudden vs gradual), exacerbating factors, position-related (orthopnea = HF/effusion), associated CP/cough/fever/wheezing/leg swelling.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Focused exam — accessory muscle use, tripoding, work of breathing, breath sounds, JVD, leg edema, calf swelling.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("CXR — pneumothorax, infiltrate, effusion, edema, mass.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("ECG — MI, arrhythmia, PE pattern (S1Q3T3, RV strain), pericardial.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("ABG (hypoxia + acid-base + CO2 retention); CBC (anemia); BMP; troponin; BNP (HF); D-dimer (low PE pretest); lactate.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Bedside lung ultrasound (B-lines for pulm edema, pneumothorax); ECHO (HF, RV strain, tamponade).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("CT-PA if PE suspected with elevated D-dimer or high pretest probability.", citationIDs: ["specialty_cc36a"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Position upright (Fowler/high-Fowler) — reduces work of breathing + improves oxygenation in most.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Supplemental O2 titrated to SpO2 target; nasal cannula → simple mask → non-rebreather → BiPAP/CPAP → intubation.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("IV access + cardiac monitor + continuous SpO2 + frequent vital signs.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Anticipate need for advanced airway in deteriorating patient — call respiratory + ICU early.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Targeted treatment per likely etiology (bronchodilators, diuretics, antibiotics, anticoagulation, etc.).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Reassess after every intervention — improvement vs deterioration; escalate when not responding.", citationIDs: ["openrn_cc36a"])
            ])
        ],
        citations: [openrnCC36A, cdcCC36A, specialtyCC36A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SyncopeEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "syncope-evaluation",
        title: "Syncope evaluation",
        subtitle: "Cardiac vs orthostatic vs reflex (vasovagal) vs neuro mimics · risk stratification (San Francisco, OESIL) · ECG + workup · admission criteria",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Syncope — transient loss of consciousness due to global cerebral hypoperfusion with rapid spontaneous recovery. Lifetime prevalence ~40%; cardiac syncope carries 30% 1-year mortality if untreated vs <5% for vasovagal. Reflex (vasovagal, situational, carotid sinus) most common (~50%); orthostatic (~15%); cardiac (~10%); unknown (~25%). Distinguish from seizure (postictal state, tongue biting, incontinence) + stroke (focal deficits) + psychogenic per primary source.",
                citationIDs: ["specialty_cc36a"]
            )),
            .keyValueTable(title: "Etiology categories", [
                KeyValueRow(key: "REFLEX (neurally mediated)", value: "Vasovagal — emotional, prolonged standing; situational — micturition/defecation/cough; carotid sinus hypersensitivity; usually preceded by prodrome (warmth, nausea, lightheadedness, tunnel vision)"),
                KeyValueRow(key: "ORTHOSTATIC HYPOTENSION", value: "BP drop ≥20 mmHg systolic OR ≥10 mmHg diastolic within 3 min of standing; volume depletion, medications (diuretics, antihypertensives, alpha-blockers), autonomic dysfunction (Parkinson, diabetes), age"),
                KeyValueRow(key: "CARDIAC ARRHYTHMIA", value: "Bradycardia (sick sinus, AV block, pacemaker malfunction), tachyarrhythmia (VT, SVT with hypotension); often without prodrome; sudden onset"),
                KeyValueRow(key: "CARDIAC STRUCTURAL", value: "Aortic stenosis, HCM, PE, MI, tamponade, dissection, atrial myxoma; exertional syncope is RED FLAG"),
                KeyValueRow(key: "NEUROLOGICAL mimics", value: "Seizure (different — tonic-clonic, postictal), stroke (focal deficits), TIA, basilar migraine; not true syncope"),
                KeyValueRow(key: "PSYCHOGENIC / metabolic mimics", value: "Hypoglycemia, hypoxia, conversion disorder; rule out organic cause first")
            ]),
            .bullets(title: "Red flags suggesting cardiac etiology", [
                AttributedBullet("EXERTIONAL syncope (during activity, not after).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Family history of sudden cardiac death.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Structural heart disease (CHF, valvular, prior MI).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Abnormal ECG (Brugada, long QT, WPW, AV block, prior MI, ischemia).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Syncope with palpitations or preceded by chest pain.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Syncope without prodrome (sudden, unprovoked).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Syncope while supine.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Age >65, male sex, multiple syncopal episodes.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Severe injury from syncope (head trauma, fracture).", citationIDs: ["specialty_cc36a"])
            ]),
            .keyValueTable(title: "Risk stratification tools", [
                KeyValueRow(key: "San Francisco Syncope Rule (CHESS)", value: "C — CHF history, H — Hematocrit <30%, E — abnormal ECG, S — SOB, S — SBP <90 mmHg at triage; ANY positive → admit"),
                KeyValueRow(key: "OESIL score", value: "Age >65, CV disease history, syncope without prodrome, abnormal ECG; 0 = low risk, ≥2 = significant 1-year mortality"),
                KeyValueRow(key: "Canadian Syncope Risk Score", value: "Most validated; categorizes risk for serious arrhythmia within 30 days"),
                KeyValueRow(key: "Admission criteria", value: "Suspected cardiac etiology, abnormal ECG, severe injury, advanced age + comorbidities, persistent VS abnormalities")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Vital signs INCLUDING ORTHOSTATIC (lying, sitting, standing at 1 + 3 min) — BP drop + HR change.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("ECG — all syncope patients; look for arrhythmia, ischemia, conduction (WPW, long QT, Brugada), prior MI.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Glucose + electrolytes + CBC; pregnancy test if reproductive age woman.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Targeted further testing — ECHO if structural concern; head CT if focal neuro deficit or suspected ICH; cardiac monitoring (telemetry/Holter) if arrhythmia suspected.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Tilt-table testing for recurrent unexplained syncope (vasovagal vs orthostatic).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Implantable loop recorder for unexplained recurrent syncope.", citationIDs: ["specialty_cc36a"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Initial assessment — ABC + injury survey (head trauma especially); LOC; vital signs; orthostatics.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("ECG within 10 min; cardiac monitor if any cardiac concern.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("IV access + glucose check; treat hypoglycemia immediately.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Detailed history — what patient was doing, prodrome, witness account, duration, recovery time, prior episodes.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Fall precautions + safety + assist with first ambulation; recurrence prevention.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Education on triggers + prevention (hydration, leg crossing/squatting maneuvers for vasovagal, slow position changes for orthostatic, medication review).", citationIDs: ["specialty_cc36a"])
            ])
        ],
        citations: [openrnCC36A, cdcCC36A, specialtyCC36A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HeadacheEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "headache-evaluation",
        title: "Headache evaluation",
        subtitle: "Primary (migraine, tension, cluster) vs secondary (SAH, meningitis, GCA, increased ICP) · SNOOP red flags · imaging + LP · time-critical workup",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Headache is one of the most common chief complaints; >90% are primary (migraine, tension, cluster), <10% are secondary to serious pathology. Recognition of \"can't miss\" secondary headaches (SAH, meningitis, intracranial mass, GCA, dissection, idiopathic intracranial hypertension, CNS infection) is critical. SNOOP/SNOOPP mnemonic captures red flags; thunderclap onset (peak <1 min) requires emergent SAH workup per primary source.",
                citationIDs: ["specialty_cc36a"]
            )),
            .keyValueTable(title: "SNOOP red flags (secondary headache)", [
                KeyValueRow(key: "S — Systemic symptoms", value: "Fever, weight loss, immunocompromise, malignancy"),
                KeyValueRow(key: "N — Neurologic deficits", value: "Focal deficits, altered mental status, seizure, papilledema"),
                KeyValueRow(key: "O — Onset sudden (thunderclap)", value: "Peak intensity within 1 min — SAH until proven otherwise"),
                KeyValueRow(key: "O — Older age (>50 yr new headache)", value: "GCA, mass lesion, vascular event"),
                KeyValueRow(key: "P — Pattern change", value: "Different from prior headaches, progressive worsening, new headache type"),
                KeyValueRow(key: "P — Positional", value: "Worse supine (increased ICP), worse upright (CSF leak)"),
                KeyValueRow(key: "PRECIPITATED by Valsalva/exertion", value: "Possible mass lesion, vascular abnormality"),
                KeyValueRow(key: "PREGNANCY/postpartum", value: "Cerebral venous thrombosis, eclampsia, RCVS, pituitary apoplexy")
            ]),
            .keyValueTable(title: "Life-threatening secondary headaches", [
                KeyValueRow(key: "SUBARACHNOID HEMORRHAGE", value: "Thunderclap, \"worst HA of life,\" meningismus, focal deficits, decreased LOC; non-contrast CT head → if normal + high suspicion → LP for xanthochromia"),
                KeyValueRow(key: "MENINGITIS", value: "Fever + HA + neck stiffness + altered mental status (classic triad — present in only 50%); LP unless contraindicated; empiric antibiotics + dexamethasone"),
                KeyValueRow(key: "INCREASED ICP / mass", value: "Worse supine, worse with Valsalva, morning HA, vomiting, papilledema; CT/MRI; neurosurgery; mannitol/hypertonic saline; head of bed 30°"),
                KeyValueRow(key: "GIANT CELL ARTERITIS", value: "Age >50, temporal HA + scalp tenderness + jaw claudication + visual changes; ESR/CRP elevated; high-dose steroids EMPIRICALLY (do not wait for biopsy if suspicion); permanent vision loss risk"),
                KeyValueRow(key: "CAROTID/VERTEBRAL DISSECTION", value: "Neck pain + headache + Horner syndrome + focal deficits; CT-A or MRA neck"),
                KeyValueRow(key: "CEREBRAL VENOUS THROMBOSIS", value: "Subacute progressive HA, seizures, focal deficits, increased ICP; pregnancy/postpartum/OCP/thrombophilia risk; MRV"),
                KeyValueRow(key: "POSTERIOR REVERSIBLE ENCEPHALOPATHY (PRES)", value: "Severe HA + visual changes + seizures + altered mental status; HTN + immunosuppressives; MRI shows posterior edema"),
                KeyValueRow(key: "PITUITARY APOPLEXY", value: "Sudden HA + visual loss + cranial nerve palsies + adrenal crisis; MRI; neurosurgery + steroids"),
                KeyValueRow(key: "ACUTE ANGLE-CLOSURE GLAUCOMA", value: "HA + eye pain + halos + N/V + red eye + fixed mid-dilated pupil; emergent ophthalmology + IOP-lowering")
            ]),
            .keyValueTable(title: "Primary headaches", [
                KeyValueRow(key: "MIGRAINE without aura", value: "Unilateral pulsating, moderate-severe, 4-72 hr, photophobia/phonophobia, N/V, worse with activity; triptans + NSAIDs + antiemetics"),
                KeyValueRow(key: "MIGRAINE with aura", value: "Visual scotomata, scintillating zigzags, paresthesias, dysphasia preceding HA; same treatment + caution with triptans if prolonged aura"),
                KeyValueRow(key: "TENSION-TYPE", value: "Bilateral pressing/tightening, mild-moderate, no N/V, no photophobia/phonophobia, no aggravation by activity; NSAIDs + acetaminophen"),
                KeyValueRow(key: "CLUSTER", value: "Severe unilateral periorbital, 15-180 min duration, autonomic features (lacrimation, rhinorrhea, ptosis, miosis), restlessness; high-flow O2 + sumatriptan SQ"),
                KeyValueRow(key: "MEDICATION OVERUSE", value: "Daily HA from analgesic use ≥10-15 days/month; treatment is withdrawal of overused agent")
            ]),
            .bullets(title: "Initial workup approach", [
                AttributedBullet("Detailed history — onset (sudden vs gradual), location, character, severity, duration, associated symptoms, prior episodes, family history, recent injury, medications, immunocompromise.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Vital signs (BP for hypertensive emergency, fever for infection); neurologic exam (mental status, cranial nerves, motor, sensory, reflexes, gait, meningismus).", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Funduscopic exam — papilledema, hemorrhages, optic disc.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("If thunderclap → emergent non-contrast CT; if normal + high suspicion → LP within 6-12 hr.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("If meningismus + fever → LP + empiric antibiotics + dexamethasone (don't delay antibiotics for LP if can't perform within 30 min).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("If focal deficits → CT/MRI to evaluate for stroke, mass, hemorrhage.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("If age >50 + temporal HA → STAT ESR/CRP; high-dose steroids if GCA suspected.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("If pregnancy/postpartum → consider eclampsia, CVT, RCVS; BP + UA + MRV/CT-V.", citationIDs: ["specialty_cc36a"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Pain management while workup proceeds — IV ketorolac, metoclopramide, prochlorperazine often effective for migraine; sumatriptan SQ for cluster.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Quiet + dim environment for migraine + meningitis.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Reassess pain + neurologic status frequently; new focal deficits → escalate emergently.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Position head of bed 30° if increased ICP suspected.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Education — when to seek emergent care for headache; trigger identification + lifestyle modification.", citationIDs: ["openrn_cc36a"])
            ])
        ],
        citations: [openrnCC36A, cdcCC36A, specialtyCC36A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AlteredMentalStatusEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "altered-mental-status-evaluation",
        title: "Altered mental status (AMS) evaluation",
        subtitle: "AEIOU-TIPS mnemonic · delirium vs dementia vs depression vs psychiatric · structured workup · finger-stick + ABG + tox + imaging",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Altered mental status — broad term encompassing changes in arousal, attention, cognition, or behavior; common ED + inpatient presentation. Differential is wide; structured approach essential. AEIOU-TIPS mnemonic helps systematic workup. Finger-stick glucose + naloxone trial + ABG are early pivotal interventions. Distinguish DELIRIUM (acute, fluctuating, attentional deficit, often reversible) from DEMENTIA (chronic, progressive, intact attention until late) per primary source.",
                citationIDs: ["specialty_cc36a"]
            )),
            .keyValueTable(title: "AEIOU-TIPS mnemonic — etiologies", [
                KeyValueRow(key: "A — Alcohol / Acidosis / Arrhythmia", value: "Intoxication, withdrawal, DKA, lactic acidosis, cardiac arrhythmia causing hypoperfusion"),
                KeyValueRow(key: "E — Electrolytes / Encephalopathy / Endocrine", value: "Hypo/hyperNa, hypo/hyperCa, hypo/hyperglycemia, hepatic, uremic, hypertensive enceph; thyroid storm/myxedema"),
                KeyValueRow(key: "I — Infection / Increased ICP", value: "Sepsis, meningitis, encephalitis, UTI in elderly; mass, hemorrhage, edema"),
                KeyValueRow(key: "O — Overdose / Oxygen", value: "Drug overdose, opioid (naloxone trial), hypoxemia, hypercarbia, CO poisoning, methemoglobinemia"),
                KeyValueRow(key: "U — Uremia / Underdose", value: "Kidney failure, missed insulin (DKA), missed levothyroxine (myxedema), missed seizure meds"),
                KeyValueRow(key: "T — Trauma / Tumor / Toxin", value: "TBI, subdural, ICH, mass effect, chemical/medication toxicity, environmental"),
                KeyValueRow(key: "I — Infection (CNS or systemic)", value: "Meningitis, encephalitis, brain abscess, sepsis from any source"),
                KeyValueRow(key: "P — Psychiatric / Poisoning", value: "Catatonia, conversion disorder (diagnosis of exclusion); food/plant/medication poisoning"),
                KeyValueRow(key: "S — Stroke / Shock / Seizure (postictal)", value: "Ischemic/hemorrhagic stroke, hypotension/hypovolemia/cardiogenic, postictal state, NCSE")
            ]),
            .keyValueTable(title: "Delirium vs Dementia", [
                KeyValueRow(key: "Delirium", value: "ACUTE onset (hours-days), FLUCTUATING course, INATTENTION (cardinal feature), reversible if cause treated; DSM-5 criteria; CAM screening tool"),
                KeyValueRow(key: "Dementia", value: "GRADUAL onset (months-years), STABLE/progressive course, INTACT attention until late, irreversible (mostly); DSM-5 major neurocognitive disorder"),
                KeyValueRow(key: "Depression", value: "Pseudodementia presentation; SUBACUTE onset, intact orientation, motivational issues, mood; treatable with antidepressants"),
                KeyValueRow(key: "Psychiatric (acute)", value: "Younger age typical, history of psychiatric illness, organized hallucinations, intact orientation; rule out medical first")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("ABCs + IV access + cardiac monitor + continuous SpO2.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("FINGER-STICK GLUCOSE — first action; treat hypoglycemia <70 with D50 IV (or glucagon if no IV).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("NALOXONE 0.4 mg IV/IM/IN — empiric trial if opioid possible (pinpoint pupils, decreased RR); titrate up as needed.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("THIAMINE 100 mg IV before any glucose if alcohol use (Wernicke prevention).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Vital signs (fever for infection, BP for stroke/encephalopathy, RR/SpO2 for resp), focused neuro exam (LOC, GCS, pupils, motor symmetry).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Labs — CBC, BMP, LFTs, TSH, ammonia (hepatic encephalopathy), lactate, ABG, troponin, blood + urine cultures if sepsis, urinalysis, urine drug screen, BAL.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("ECG — arrhythmia, ischemia, drug toxicity (QT, QRS).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Head CT — non-contrast; emergent if focal deficit, trauma, anticoagulation, age + altered.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("LP — if meningitis suspected (after CT to rule out mass effect); empiric antibiotics + steroids first if delay.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("EEG if NCSE (non-convulsive status epilepticus) suspected (waxing-waning AMS, history of seizures).", citationIDs: ["specialty_cc36a"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Aspiration precautions — keep NPO until LOC adequate; suction available.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Continuous monitoring — VS, SpO2, telemetry; close observation Q15 min initially.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Safety — fall precautions, restraint alternatives (sitter, bed alarm, family presence), reorient frequently.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("CAM (Confusion Assessment Method) screening on admission + serial; ICU CAM-ICU for ventilated patients.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Address reversible causes — pain, dehydration, hypoxia, medications (deprescribe sedating), toilet, sleep-wake regulation.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Family education — delirium often distressing; explain expected course + interventions; involve in reorientation.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Avoid antipsychotics + benzodiazepines unless severe agitation + safety threat (worsen delirium); haloperidol low-dose if needed.", citationIDs: ["specialty_cc36a"])
            ])
        ],
        citations: [openrnCC36A, cdcCC36A, specialtyCC36A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AcuteConfusionDeliriumEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "acute-confusion-delirium-evaluation",
        title: "Delirium evaluation (CAM)",
        subtitle: "Hyperactive/hypoactive/mixed delirium · CAM + CAM-ICU screening · ICU delirium prevention bundle (ABCDEF) · medication review · multidisciplinary",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Delirium — acute confusional state with disturbed attention + cognition + arousal that fluctuates over hours to days. Affects 30% of hospitalized older adults + 80% of ICU patients. Increases mortality, length of stay, functional decline, long-term cognitive impairment. UNDER-RECOGNIZED — particularly hypoactive subtype which mimics depression. CAM (Confusion Assessment Method) is gold-standard screening tool; CAM-ICU adapted for ventilated patients per primary source.",
                citationIDs: ["specialty_cc36a"]
            )),
            .keyValueTable(title: "CAM (Confusion Assessment Method)", [
                KeyValueRow(key: "Feature 1: Acute onset + fluctuating course", value: "Has there been an acute change from baseline? Does the abnormal behavior fluctuate?"),
                KeyValueRow(key: "Feature 2: INATTENTION (required)", value: "Difficulty focusing attention; easily distractible; difficulty keeping track of conversation"),
                KeyValueRow(key: "Feature 3: Disorganized thinking", value: "Rambling, irrelevant conversation; unclear or illogical flow of ideas; switching topics"),
                KeyValueRow(key: "Feature 4: Altered level of consciousness", value: "Vigilant, lethargic, stuporous, or comatose"),
                KeyValueRow(key: "POSITIVE delirium screen", value: "Features 1 + 2 + (3 OR 4); >90% sensitivity + specificity")
            ]),
            .keyValueTable(title: "Subtypes", [
                KeyValueRow(key: "HYPERACTIVE (~25%)", value: "Agitation, restlessness, hallucinations, combativeness; OBVIOUS but only minority of cases"),
                KeyValueRow(key: "HYPOACTIVE (~50%)", value: "Lethargy, withdrawal, decreased responsiveness; OFTEN MISSED, mistaken for depression; worse prognosis"),
                KeyValueRow(key: "MIXED (~25%)", value: "Fluctuates between hyperactive + hypoactive states")
            ]),
            .keyValueTable(title: "Common reversible causes (DIMS-O)", [
                KeyValueRow(key: "D — DRUGS", value: "Anticholinergics, benzodiazepines, opioids, steroids, antipsychotics, antibiotics (fluoroquinolones, cephalosporins), GI/H2 blockers; deprescribe + replace with alternatives"),
                KeyValueRow(key: "I — INFECTION", value: "UTI (especially elderly), pneumonia, line infection, C. diff, SSI; targeted workup + treatment"),
                KeyValueRow(key: "M — METABOLIC", value: "Electrolytes (especially Na, Ca, glucose), renal failure, hepatic failure, hypoxia, hypercarbia, thyroid"),
                KeyValueRow(key: "S — STRUCTURAL", value: "Stroke, ICH, tumor, hydrocephalus, abscess, NCSE; head imaging + EEG"),
                KeyValueRow(key: "O — OTHER", value: "Pain (often undertreated), constipation, urinary retention, sleep deprivation, sensory deficits (no glasses/hearing aids), restraint use, environment")
            ]),
            .bullets(title: "ICU delirium prevention bundle (ABCDEF)", [
                AttributedBullet("A — ASSESS, prevent, manage PAIN — pain is major delirium contributor; treat adequately; use scales (CPOT, BPS in ventilated).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("B — BOTH spontaneous awakening + spontaneous breathing trials — daily sedation interruption + ventilator weaning trials.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("C — CHOICE of analgesia + sedation — avoid benzodiazepines (delirogenic); prefer dexmedetomidine + propofol; opioids for pain not sedation.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("D — DELIRIUM assess, prevent, manage — CAM-ICU Q shift; multidisciplinary intervention.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("E — EARLY mobility + exercise — out of bed even when ventilated; PT/OT consultation.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("F — FAMILY engagement + empowerment — presence at bedside, participation in care, advocacy.", citationIDs: ["specialty_cc36a"])
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Verify acute change from baseline (collateral history from family/caregiver/prior records).", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("CAM screening on admission + Q shift in high-risk patients (older, ICU, post-op, stroke).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Comprehensive medication review — deprescribe delirogenic agents (anticholinergics, BZDs, etc.).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Targeted workup — labs (BMP, glucose, ABG, lactate, TSH), urinalysis + culture, blood culture if febrile, ECG, CXR.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Head imaging if focal deficits, recent fall, anticoagulation, atypical features.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Address reversible contributors — pain, constipation, retention, hypoxia, infection, electrolyte.", citationIDs: ["openrn_cc36a"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Non-pharmacologic interventions PRIMARY — orient to time/place/person, familiar objects, family presence, sensory aids (glasses, hearing aids), normalize sleep-wake cycle, daytime activities, lighting, predictable routine, calm environment.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Reduce delirogenic medications + restraints (use restraint alternatives — sitter, bed alarm, low bed, family).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Address pain + comfort + toileting + nutrition + hydration; prevent constipation.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Pharmacologic — LAST resort for severe agitation + safety threat; haloperidol 0.5-1 mg PO/IV (avoid in Parkinson + LBD), quetiapine alternative; AVOID benzodiazepines (paradoxical + worsens delirium); dexmedetomidine in ICU.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Family + patient education — delirium is common + usually reversible; explain interventions + recovery; emotional support.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Discharge planning — outpatient cognitive assessment, medication review, fall prevention, caregiver support.", citationIDs: ["openrn_cc36a"])
            ])
        ],
        citations: [openrnCC36A, cdcCC36A, specialtyCC36A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum WeaknessEvaluationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "weakness-evaluation",
        title: "Weakness evaluation",
        subtitle: "Focal vs generalized · neuromuscular vs systemic · stroke + GBS + MG + electrolyte + sepsis · MRC scale · workup",
        eyebrow: "REFERENCE · CHIEF COMPLAINT WORKUP",
        nclexTags: ccTagsR36,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Weakness is a common but vague chief complaint requiring careful history + exam to distinguish TRUE WEAKNESS (muscle strength deficit) from FATIGUE (lack of energy with normal strength), DYSPNEA, BALANCE problems, or generalized illness. True weakness localizes the lesion — focal (CNS, peripheral nerve, NMJ, muscle) vs generalized (systemic, neuromuscular, electrolyte, endocrine). Time-critical etiologies — stroke, GBS, MG crisis, hyperkalemia, sepsis per primary source.",
                citationIDs: ["specialty_cc36a"]
            )),
            .keyValueTable(title: "Focal weakness — localization", [
                KeyValueRow(key: "UPPER MOTOR NEURON (CNS)", value: "Hemiparesis, hyperreflexia, spasticity, Babinski, no atrophy initially; STROKE, MS, mass, ICH, subdural"),
                KeyValueRow(key: "LOWER MOTOR NEURON (anterior horn/peripheral)", value: "Flaccid weakness, hyporeflexia, fasciculations, atrophy; ALS, polio (rare), peripheral nerve injury, radiculopathy"),
                KeyValueRow(key: "NEUROMUSCULAR JUNCTION", value: "Fluctuating, fatigable, ocular involvement (ptosis, diplopia), bulbar; MYASTHENIA GRAVIS, Lambert-Eaton, botulism"),
                KeyValueRow(key: "MUSCLE", value: "Proximal symmetric, normal sensation, normal reflexes initially; MYOSITIS (polymyositis, dermatomyositis), MUSCULAR DYSTROPHY, statin myopathy"),
                KeyValueRow(key: "PERIPHERAL NERVE", value: "Sensory + motor loss in nerve distribution, hyporeflexia; mononeuropathy (carpal tunnel, peroneal), polyneuropathy (diabetic, alcoholic, vitamin deficiency)")
            ]),
            .keyValueTable(title: "Generalized weakness — systemic causes", [
                KeyValueRow(key: "ELECTROLYTE", value: "HYPERKALEMIA (>6.5 → flaccid paralysis, peaked T, wide QRS); hypokalemia (<2.5); hypercalcemia; hypocalcemia; hypomagnesemia; hypophosphatemia"),
                KeyValueRow(key: "ENDOCRINE", value: "Hypothyroidism, hyperthyroidism (thyrotoxic periodic paralysis), adrenal insufficiency (Addisonian crisis), Cushing"),
                KeyValueRow(key: "METABOLIC", value: "Hypoglycemia, DKA, hepatic + uremic encephalopathy"),
                KeyValueRow(key: "SEPSIS / INFECTION", value: "Generalized weakness + altered mental status + fever; sepsis source workup"),
                KeyValueRow(key: "MEDICATIONS", value: "Statins, fibrates, steroids, neuromuscular blockers, anticonvulsants, antipsychotics; deprescribe"),
                KeyValueRow(key: "DEHYDRATION + DECONDITIONING", value: "Older adults; functional decline; volume + nutritional support"),
                KeyValueRow(key: "ANEMIA", value: "Pallor + fatigue; CBC; treat underlying"),
                KeyValueRow(key: "CARDIAC", value: "HF + arrhythmia + valve disease; ECHO + ECG")
            ]),
            .keyValueTable(title: "Time-critical neurologic causes", [
                KeyValueRow(key: "STROKE / TIA", value: "Acute focal weakness; LAST KNOWN WELL TIME critical; tPA window 4.5 hr, thrombectomy 6-24 hr; emergent imaging"),
                KeyValueRow(key: "GUILLAIN-BARRÉ SYNDROME", value: "Ascending symmetric weakness + areflexia, often after viral illness; respiratory + autonomic failure risk; admit + IVIG/plasmapheresis + monitor NIF/FVC"),
                KeyValueRow(key: "MYASTHENIC CRISIS", value: "Worsening MG with respiratory + bulbar failure; intubation if NIF <-20 OR FVC <15 mL/kg; IVIG/plasmapheresis + steroids + ICU"),
                KeyValueRow(key: "BOTULISM", value: "Descending weakness + cranial nerve palsies + dilated pupils; antitoxin + supportive ICU"),
                KeyValueRow(key: "TICK PARALYSIS", value: "Ascending paralysis from tick attached for days; remove tick → resolution"),
                KeyValueRow(key: "TRANSVERSE MYELITIS", value: "Acute spinal cord inflammation; bilateral weakness + sensory level + bowel/bladder dysfunction; MRI + steroids + plasmapheresis"),
                KeyValueRow(key: "PERIODIC PARALYSIS", value: "Hypo/hyperkalemic; episodic flaccid paralysis; familial or thyrotoxic; correct K + treat underlying"),
                KeyValueRow(key: "SPINAL CORD COMPRESSION", value: "Back pain + bilateral weakness + sensory level + bowel/bladder; emergent MRI + decompression + steroids")
            ]),
            .bullets(title: "Initial workup", [
                AttributedBullet("Detailed history — onset (sudden vs gradual), distribution (focal vs generalized, proximal vs distal), associated symptoms (sensory loss, pain, bowel/bladder, vision, swallowing), systemic symptoms, medications, recent illness.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Vital signs (sepsis, dehydration, RR + SpO2 for respiratory weakness); MRC strength scale (0-5) for each muscle group; reflexes; sensory exam; gait + coordination.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Stroke screen (FAST, NIH stroke scale) + emergent CT/MRI if focal acute.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Labs — BMP (electrolytes, glucose, BUN/Cr), CBC, magnesium, phosphate, TSH, CK (myositis), troponin if cardiac concern, ABG if respiratory.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Respiratory weakness — NIF (negative inspiratory force) + FVC + ABG; intubate if NIF <-20 OR FVC <15 mL/kg.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("EMG/NCS for neuromuscular localization (outpatient unless emergent).", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("LP + brain/spine imaging for selected (GBS, MS, transverse myelitis, infection).", citationIDs: ["specialty_cc36a"])
            ]),
            .bullets(title: "Nursing priorities", [
                AttributedBullet("Initial — ABCs + IV access + cardiac monitor + SpO2; aspiration precautions; positioning.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Stroke evaluation if focal — call code stroke; LAST KNOWN WELL time; door-to-CT ≤25 min.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Respiratory monitoring in neuromuscular weakness (GBS, MG, botulism) — NIF/FVC Q4-6h; intubate proactively.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Fall prevention + safety; assist with ambulation + transfers.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("Pressure injury prevention if immobilized — turning Q2H + pressure-redistribution surface.", citationIDs: ["openrn_cc36a"]),
                AttributedBullet("DVT prophylaxis (immobility risk) — SCDs + chemoprophylaxis when not bleeding.", citationIDs: ["specialty_cc36a"]),
                AttributedBullet("Nutritional support + bowel + bladder management for prolonged immobility.", citationIDs: ["openrn_cc36a"])
            ])
        ],
        citations: [openrnCC36A, cdcCC36A, specialtyCC36A],
        lastSourceFidelityReview: "2026-05-13"
    )
}
