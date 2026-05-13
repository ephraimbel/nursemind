import Foundation

// Curator-model diagnosis entries (round 21 — shock + ICU complications).

private let openrnDxR21 = CitationSource(
    id: "openrn_dx_round21",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-12"
)
private let cdcDxR21 = CitationSource(
    id: "cdc_dx_round21",
    shortName: "CDC / NIH concept citations",
    publisher: "CDC · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/sepsis/clinicaltools/index.html",
    lastRetrieved: "2026-05-12"
)
private let specialtyDxR21 = CitationSource(
    id: "specialty_dx_round21",
    shortName: "SCCM SSC 2021 + ADA + AHA + Berlin ARDS concept citations",
    publisher: "SCCM · ADA · AHA · ATS / ESICM",
    license: .factCitationOnly,
    url: "https://www.sccm.org/SurvivingSepsisCampaign/Guidelines",
    lastRetrieved: "2026-05-12"
)

private let shockR21 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let icuR21 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .safety)
private let endoR21 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .glucoseRegulation)
private let electrolytesR21 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes)
private let respR21 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)

public enum SepticShockSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "septic-shock",
        title: "Septic shock",
        subtitle: "Sepsis-3 · vasopressor + lactate >2 despite fluid · 30 mL/kg crystalloid · norepi first · 1-hr bundle",
        nclexTags: shockR21,
        definition: AttributedProse(
            "Subset of sepsis with circulatory + cellular / metabolic dysfunction sufficient to substantially increase mortality. Sepsis-3 criteria — sepsis with vasopressor requirement to maintain MAP ≥65 PLUS serum lactate >2 mmol/L despite adequate fluid resuscitation. Mortality 30–40% per primary source.",
            citationIDs: ["specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Dysregulated host response to infection → endothelial dysfunction + vasodilation + capillary leak + maldistribution of blood flow → tissue hypoperfusion + cellular dysfunction. Mediators: cytokines (TNF, IL-1, IL-6), complement activation, NO overproduction, microthrombi.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Hypotension (MAP <65) despite ≥30 mL/kg crystalloid; vasopressor-dependent.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Lactate >2 mmol/L (often >4) — tissue hypoperfusion marker.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Fever / hypothermia, leukocytosis / leukopenia, altered mental status, oliguria, mottled skin, prolonged capillary refill.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Warm shock early (vasodilation, bounding pulses, flushed) → cold shock late (vasoconstriction, weak pulses, cyanosis).", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Source — pneumonia (most common), abdominal, urinary, skin/soft tissue, line-associated, meningitis.", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Sepsis-3 — life-threatening organ dysfunction caused by dysregulated host response to infection; SOFA score ≥2 from baseline.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Septic shock — sepsis + vasopressor requirement + lactate >2 despite fluid resuscitation.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("qSOFA (bedside) — RR ≥22, SBP ≤100, altered mentation; ≥2 = higher mortality risk; NOT for diagnosis alone.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Workup — blood cultures × 2 (before abx), lactate, CBC, CMP, coag, urinalysis + culture, imaging per source, procalcitonin.", citationIDs: ["openrn_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Source identification — clinical exam + imaging + cultures; source control essential.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Hemodynamics — MAP, lactate trend, urine output, mental status, capillary refill.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("End-organ damage — AKI, hepatic dysfunction, coagulopathy / DIC, ARDS, encephalopathy.", citationIDs: ["openrn_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("1-HR BUNDLE — measure lactate; blood cultures BEFORE abx; broad-spectrum abx within 1 hr; 30 mL/kg crystalloid for hypotension or lactate ≥4; vasopressors for MAP ≥65 per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("BROAD-SPECTRUM ABX within 1 hr — coverage based on suspected source; de-escalate after cultures.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("FLUID — 30 mL/kg balanced crystalloid (LR / plasmalyte preferred over normal saline); reassess for further fluid responsiveness (passive leg raise, ultrasound).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("NOREPINEPHRINE first-line vasopressor; vasopressin second-line at 0.03 units/min; epinephrine third-line per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("SOURCE CONTROL — drain abscess, remove infected line, debride necrotic tissue, surgical intervention within 6–12 hrs.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("HYDROCORTISONE 200 mg/day IV — for vasopressor-dependent septic shock with refractory hypotension per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Stress dose insulin (target 140–180), VTE prophylaxis, stress ulcer prophylaxis, early enteral nutrition.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Daily reassessment for de-escalation of abx, fluids, vasopressors.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("MULTI-ORGAN DYSFUNCTION (MODS) — progressive failure of ≥2 organs; high mortality.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("AKI — common; consider RRT for refractory acidosis / volume / electrolyte derangements.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ARDS — develops in significant minority; lung-protective ventilation + prone positioning.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DIC — bleeding + thrombosis simultaneously; transfusion support; treat underlying.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("POST-SEPSIS SYNDROME — cognitive, functional, immune impairment lasting months; counsel survivors + family.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum HypovolemicShockSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypovolemic-shock",
        title: "Hypovolemic shock",
        subtitle: "Volume loss · hemorrhagic vs non-hemorrhagic · Class I-IV · MTP for severe · stop the bleed",
        nclexTags: shockR21,
        definition: AttributedProse(
            "Shock from inadequate circulating volume — hemorrhagic (trauma, GI bleed, postpartum) or non-hemorrhagic (vomiting, diarrhea, burns, third-spacing). Tissue hypoperfusion → cellular dysfunction → multi-organ failure if uncorrected per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Volume loss → reduced preload → reduced cardiac output → compensatory vasoconstriction + tachycardia → eventual decompensation when compensation exhausted (>30–40% volume loss). Sympathetic surge maintains BP early; hypotension is late + ominous.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Class I (<15% loss) — minimal symptoms; HR <100; BP normal.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Class II (15–30%) — tachycardia >100, narrow pulse pressure, slight anxiety, RR slightly up.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Class III (30–40%) — significant tachycardia, hypotension, marked anxiety / confusion, oliguria, RR markedly up.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Class IV (>40%) — extreme tachycardia + hypotension, lethargy / unresponsive, negligible urine output, agonal breathing; imminent cardiac arrest.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Cold, pale, mottled skin; weak / thready pulses; flat neck veins; prolonged capillary refill.", citationIDs: ["openrn_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical + history of volume loss + hemodynamic instability.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("CBC, CMP, lactate, ABG, coag, type + crossmatch, beta-hCG, FAST exam in trauma.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Hgb / Hct lag in acute hemorrhage — initially normal; serial measurements.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Source workup — endoscopy for GI bleed, imaging for occult bleed, surgical consult for trauma.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("ABC + control hemorrhage; estimate volume loss + class.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Source identification — visible vs occult; imaging.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Anticoagulation history — modifies bleeding + reversal needs.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("CONTROL BLEEDING FIRST — direct pressure, tourniquet, surgical / endoscopic / IR intervention per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VOLUME RESUSCITATION — 2 large-bore IV / IO; warmed isotonic crystalloid 1–2 L bolus + reassess; balanced crystalloid (LR) preferred over NS per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("BLOOD PRODUCTS for hemorrhagic shock — pRBC + FFP + platelets in 1:1:1 ratio (MTP); avoid crystalloid dilution if hemorrhage continuing.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("TXA 1 g IV over 10 min + 1 g over 8 hrs — within 3 hrs of trauma per CRASH-2 per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("REVERSE anticoagulation — vitamin K + PCC for warfarin; idarucizumab for dabigatran; andexanet for Xa inhibitors; protamine for heparin.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VASOPRESSORS reserved for refractory shock with adequate volume — norepi first; vasopressors before adequate volume worsens.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Warming — hypothermia + coagulopathy + acidosis = lethal triad in hemorrhage; warm fluids + bear hugger + room temp.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Target hemodynamics — MAP ≥65; HR <100; urine output ≥0.5 mL/kg/h; lactate clearance.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("LETHAL TRIAD — hypothermia + acidosis + coagulopathy; aggressive prevention.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MASSIVE TRANSFUSION COMPLICATIONS — hypocalcemia (citrate), hyperkalemia, dilutional thrombocytopenia, TRALI.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ACUTE KIDNEY INJURY from prolonged hypoperfusion; recovery may take weeks.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("RECURRENT BLEED — source control may need re-intervention; serial assessments.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ABDOMINAL COMPARTMENT SYNDROME — over-resuscitation; bladder pressure monitoring.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum NeurogenicShockSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neurogenic-shock",
        title: "Neurogenic shock",
        subtitle: "Spinal cord injury above T6 · BRADYCARDIA + hypotension + warm dry skin · norepi / atropine",
        nclexTags: shockR21,
        definition: AttributedProse(
            "Form of distributive shock from disruption of sympathetic outflow — typically traumatic spinal cord injury above T6 (rarely brainstem injury, severe regional anesthesia). Characterized by HYPOTENSION + BRADYCARDIA + warm dry skin (unique combination distinguishing from other shock states) per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Disruption of sympathetic outflow at / above T6 → loss of vascular tone (venous + arterial vasodilation) + unopposed vagal tone (bradycardia). Reduced SVR + preload → hypotension. Skin warm + dry due to vasodilation + loss of sympathetic sweating.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("HYPOTENSION + BRADYCARDIA — classic combination (other shock states have tachycardia).", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Warm, dry, flushed skin (peripheral vasodilation) — sometimes called \"warm shock\".", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Hypothermia common — heat loss from vasodilation; impaired thermoregulation.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Associated motor / sensory deficits below level of injury — paraplegia / quadriplegia depending on level.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Distinct from SPINAL SHOCK (areflexia / flaccid paralysis temporarily after SCI — neurologic phenomenon, not hemodynamic).", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — hypotension + bradycardia + warm dry skin + neurologic injury above T6.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Spinal imaging — CT / MRI confirms level + mechanism.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("ATLS protocol — concurrent assessment for other shock + injuries.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Rule out hemorrhagic shock — multi-trauma common; treat both.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Spinal precautions — log roll, c-collar; neuro exam; SCI level determination.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Associated injuries — neurogenic shock OFTEN co-exists with hemorrhagic in trauma.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Bladder + bowel function; autonomic dysreflexia risk for T6+ injury.", citationIDs: ["openrn_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("AIRWAY — high cervical injuries (C3-5) → diaphragm paralysis; intubate prophylactically.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CRYSTALLOID resuscitation cautiously — over-resuscitation worsens spinal cord edema; isotonic fluids to MAP ≥85 (improves spinal perfusion) per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VASOPRESSOR — NOREPINEPHRINE first-line; phenylephrine inadequate (need β1 for bradycardia + α for vasoconstriction); dopamine alternative.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("BRADYCARDIA — atropine 0.5–1 mg IV PRN; pacing if refractory; sometimes glycopyrrolate.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MAP target 85–90 for 5–7 days post-acute SCI — improves spinal perfusion + may improve neurological recovery per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("WARMING — passive + active rewarming; warmed blankets, fluid warmer.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Spinal stabilization + neurosurgical consult — possible decompression.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VTE prophylaxis — mechanical immediately; pharmacologic per neurosurgery clearance.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("AUTONOMIC DYSREFLEXIA — T6+ injuries; trigger (full bladder, fecal impaction, skin lesion) → severe HTN + headache + bradycardia + flushing above injury, pallor below; emergency.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("RESPIRATORY FAILURE — high cervical injury; ventilatory support.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("UNRECOGNIZED HEMORRHAGIC SHOCK — co-existing; bradycardia may mask hemorrhagic tachycardia.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DVT / PE — high risk; aggressive prophylaxis.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PRESSURE INJURIES — sensory loss; q2h turns, specialty mattress.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("NEUROGENIC BLADDER + BOWEL — intermittent cath, bowel program.", citationIDs: ["openrn_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ObstructiveShockSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "obstructive-shock",
        title: "Obstructive shock",
        subtitle: "Mechanical obstruction to flow · tamponade · tension pneumo · massive PE · treat the obstruction",
        nclexTags: shockR21,
        definition: AttributedProse(
            "Shock from physical obstruction to cardiac filling or output — cardiac tamponade, tension pneumothorax, massive pulmonary embolism, aortic dissection, severe pulmonary hypertension. Treatment requires reversing the mechanical obstruction; volume + vasopressors temporize per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Mechanical impedance to ventricular filling (tamponade, tension pneumothorax) OR output (massive PE, severe pulmonary HTN, AS) → reduced cardiac output → hypoperfusion. Often presents with hypotension + tachycardia + signs specific to underlying cause.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("CARDIAC TAMPONADE — Beck's triad (hypotension + muffled heart sounds + JVD); pulsus paradoxus; echocardiogram diagnostic.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("TENSION PNEUMOTHORAX — hypotension + tracheal deviation + absent breath sounds + hyperresonance + distended neck veins; needle decompression emergency.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("MASSIVE PE — sudden hypotension + hypoxemia + S1Q3T3 + RV strain on echo / CT angio.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Common — hypotension, tachycardia, JVD (distinguishing feature from hypovolemic), oliguria, AMS.", citationIDs: ["openrn_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical exam + bedside ultrasound (RUSH protocol, FAST) per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Echocardiogram — tamponade, RV strain in massive PE; pericardial effusion + diastolic collapse.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CT angio for PE; chest X-ray / CT for pneumothorax; aortic CT angio for dissection.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Troponin + BNP — RV strain in PE; absent in pure obstructive shock from other causes.", citationIDs: ["openrn_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify underlying cause RAPIDLY — different definitive treatment for each.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Hemodynamics; bedside ultrasound; serial echo / imaging.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Differential — concurrent cardiogenic shock complicating massive PE.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("TAMPONADE — emergent pericardiocentesis (US-guided) or surgical pericardial window per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("TENSION PNEUMOTHORAX — immediate needle decompression (2nd ICS midclavicular OR 5th ICS anterior axillary) + chest tube per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MASSIVE PE — systemic thrombolytic (alteplase 100 mg IV over 2 hrs OR weight-based) OR catheter-directed; surgical embolectomy if contraindicated per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("AORTIC DISSECTION — control HR + BP first (esmolol / labetalol to HR <60 + SBP <120); urgent surgical / endovascular for Type A or complicated Type B.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VOLUME — cautious in tamponade + massive PE (preload-dependent); generous in tension pneumo before decompression.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VASOPRESSORS — norepinephrine while definitive treatment arranged; dobutamine added in massive PE for RV support.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ECMO consideration — refractory massive PE, post-cardiac surgery tamponade.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("DELAYED DIAGNOSIS — high mortality without prompt mechanical relief; have low threshold for bedside US.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("REACCUMULATION — tamponade after pericardiocentesis; recurrent pneumothorax; recurrent PE; serial assessment.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CONCURRENT shock states — common in trauma + post-arrest.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DIASTOLIC DYSFUNCTION post-tamponade — gradual recovery.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("THROMBOLYTIC BLEEDING — major bleeding in 10–15% of systemic thrombolysis; consider catheter-directed if bleeding risk high.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ICUDeliriumSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "icu-delirium",
        title: "ICU delirium",
        subtitle: "CAM-ICU screening · ABCDEF bundle · non-pharm first · QUETIAPINE not haldol routinely",
        nclexTags: icuR21,
        definition: AttributedProse(
            "Acute fluctuating disturbance in attention + awareness + cognition occurring in critically ill patients. Affects 50-80% of ICU patients. Independently increases mortality, length of stay, long-term cognitive impairment per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — neurotransmitter imbalance (acetylcholine deficit, dopamine excess), neuroinflammation, sleep disruption, sedation effects, illness severity, immobility, sensory deprivation / overload.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Acute onset; fluctuating throughout day; impaired attention + altered consciousness.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Hyperactive (agitation, hallucinations) — 25%; Hypoactive (lethargy, withdrawal) — 50%; Mixed — 25%.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("HYPOACTIVE underdiagnosed — confused for sedation / fatigue; worse outcomes than hyperactive.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Risk factors — age >65, dementia, severity of illness, sepsis, mechanical ventilation, benzodiazepines, restraints, sleep deprivation.", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CAM-ICU — acute onset + inattention + (disorganized thinking OR altered consciousness) per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ICDSC — 8-item scoring tool alternative.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("RASS score for sedation — paired with CAM-ICU; target RASS -2 to 0 for awake assessable.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Rule out reversible causes — hypoxia, hypoglycemia, infection, electrolytes, drug effects, alcohol / benzo withdrawal.", citationIDs: ["openrn_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("CAM-ICU q shift + PRN; document RASS + CAM-ICU result.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Identify + treat underlying causes — sepsis, hypoxia, pain, withdrawal.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Sedation review — minimize benzodiazepines; daily SAT (spontaneous awakening trial).", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("ABCDEF BUNDLE — Assess + manage Pain; Both SAT + SBT; Choice of analgesia / sedation; Delirium assess + manage; Early mobility; Family engagement per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("NON-PHARMACOLOGIC FIRST — orientation, family at bedside, sleep hygiene, glasses / hearing aids, early mobilization, reduce noise / lights at night per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MINIMIZE BENZODIAZEPINES — strongest modifiable risk factor; use dexmedetomidine + propofol over midazolam where possible.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Pain management — fentanyl, acetaminophen scheduled; pain often presents as agitation.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Dexmedetomidine vs midazolam — reduces delirium in mechanically ventilated patients.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("HALOPERIDOL / QUETIAPINE / OLANZAPINE — REACTIVE only for severe agitation or hyperactive delirium; quetiapine often preferred (less EPS); PROPHYLACTIC antipsychotic NOT recommended per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Avoid restraints when possible — increase delirium + injury; use sitters + family.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Early mobilization — even ventilated; PT/OT consult; reduces ICUAW + delirium duration.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("LONG-TERM COGNITIVE IMPAIRMENT — proportional to delirium duration; can persist months to years.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("POST-ICU SYNDROME — physical, cognitive, mental health sequelae; family counsel + post-ICU clinic referral.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("FALLS + SELF-EXTUBATION — vigilance; environment + sitters.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ANTIPSYCHOTIC ADVERSE EFFECTS — QT prolongation; EPS; consider continuing only short-term.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ALCOHOL / BENZO / OPIOID WITHDRAWAL — common precipitant; CIWA / COWS scoring + treatment.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ICUAWSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "icu-acquired-weakness",
        title: "ICU-acquired weakness (ICUAW)",
        subtitle: "Critical illness polyneuropathy / myopathy · diffuse weakness · prolonged ventilation · early mobility prevention",
        nclexTags: icuR21,
        definition: AttributedProse(
            "Generalized symmetric weakness acquired during critical illness — encompasses critical illness polyneuropathy (CIP), critical illness myopathy (CIM), or combined. Affects 25–80% of ICU patients; major cause of failure to wean from ventilator + long-term disability per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — sepsis-induced neuromuscular failure, immobility, hyperglycemia, neuromuscular blockade exposure, corticosteroids, deconditioning. Axonal degeneration (CIP) + myofibril atrophy / necrosis (CIM).",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Symmetric flaccid weakness — proximal > distal; usually after several days critical illness.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Failure to wean from mechanical ventilator despite improvement in primary illness.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Decreased reflexes; preserved facial muscles + sensation (mostly).", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("MRC sum score (manual muscle test) <48/60 — common criterion.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Risk factors — sepsis, SIRS, multi-organ failure, prolonged ventilation, neuromuscular blockers, corticosteroids, hyperglycemia, immobility.", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis primarily — MRC sum score <48 + symmetric weakness + critical illness context.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("EMG/NCS — distinguishes CIP from CIM; CIM has CK elevation, CIP has reduced sensory + motor amplitudes.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Rule out GBS, myasthenic crisis, neuromuscular blocker residual.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Diaphragm dysfunction common — ventilator-induced diaphragm dysfunction (VIDD).", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Daily strength assessment when patient cooperative — sedation interruption first.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Family / patient education — expected slow recovery.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("PT/OT consult early — even ventilated patients can participate.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION is primary — early mobilization within 24–48 hrs of admission per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ABCDEF BUNDLE implementation — see ICU delirium reference.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MINIMIZE NMBA + corticosteroids when possible.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Glycemic control — target 140–180; avoid hyperglycemia + hypoglycemia.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Adequate nutrition — early enteral; protein 1.2-2.0 g/kg/day per ASPEN.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Active + passive ROM; sitting up, dangling, ambulating as soon as feasible.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("In-bed cycling, transcutaneous electrical nerve stimulation — adjunctive PT.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Rehabilitation post-ICU — PT/OT/SLP; inpatient rehab; outpatient continuation.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("PROLONGED VENTILATION + tracheostomy — failure to wean despite improvement.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DYSPHAGIA / aspiration — diaphragm + bulbar weakness; SLP eval.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("FALL RISK + DECONDITIONING — ongoing rehab needs; physical activity counseling.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("DEPRESSION / PTSD — common in ICU survivors; mental health support.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("INCOMPLETE RECOVERY — some functional deficits persist; counsel.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PostCardiacArrestSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "post-cardiac-arrest-syndrome",
        title: "Post-cardiac-arrest syndrome",
        subtitle: "TTM 32-36°C · brain + myocardial dysfunction + systemic IRI · multidisciplinary · prognosticate carefully",
        nclexTags: icuR21,
        definition: AttributedProse(
            "Complex pathophysiologic state after return of spontaneous circulation (ROSC) — anoxic brain injury, post-arrest myocardial dysfunction, systemic ischemia-reperfusion injury, persistent precipitating pathology. Major determinant of long-term outcome after cardiac arrest per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Anoxic brain injury (selective vulnerability of neurons); stunned myocardium (transient post-arrest LV dysfunction); systemic inflammation + capillary leak resembling sepsis; persistent underlying cause (MI, PE, etc.).",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Coma — variable depth + duration; serial neuro exams essential.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Hemodynamic instability — myocardial stunning + vasoplegia; vasopressor / inotrope support.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Hypoxemia, ARDS-like picture; possible aspiration pneumonia.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Multi-organ dysfunction — AKI, hepatic dysfunction, coagulopathy.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Seizures (15–30%); myoclonic status epilepticus = poor prognosis.", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("History of cardiac arrest + ROSC + persistent neuro / hemodynamic compromise.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Cause workup — ECG, troponin, echocardiogram, CT chest (PE), coronary angiography if STEMI / refractory shock per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Neuro — CT head, EEG (seizures, status), MRI brain at 3-5 days for prognostication.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Neuron-specific enolase (NSE), brainstem reflexes, SSEPs — prognostication tools.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamics, neurologic status, ventilation, identify + treat cause.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Family counseling — outcome uncertain; defer prognostication 72 hrs post-TTM.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Goals of care discussion — ongoing through ICU stay.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("TARGETED TEMPERATURE MANAGEMENT — 32-36°C × 24 hrs in comatose patients post-ROSC per AHA 2020 (range, single best target debated) per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MEAN ARTERIAL PRESSURE target ≥65-80 (some advocate higher for cerebral perfusion).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("OXYGENATION — avoid hyperoxia (SpO2 92-98%); avoid hypoxia.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VENTILATION — normocapnia PaCO2 35-45; avoid hyperventilation (cerebral vasoconstriction).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("GLYCEMIC control 140-180; avoid hypoglycemia.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("EARLY coronary angiography for STEMI; consider for shockable rhythm + suspected cardiac cause even without STEMI.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("SEIZURE control — continuous EEG monitoring; treat with levetiracetam, valproate per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("NEUROPROGNOSTICATION — defer ≥72 hrs after TTM rewarming + off sedation; multimodal (exam + EEG + imaging + biomarkers); avoid early withdrawal.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CRRT / RRT for AKI as needed; nutrition + DVT / GI prophylaxis.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("MYOCLONIC STATUS EPILEPTICUS — historically poor prognosis but not universally; treat + reassess.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("REBOUND HYPERTHERMIA — fever during rewarming worsens outcomes; maintain ≤37.5 × 72 hrs.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ELECTROLYTE SHIFTS during TTM + rewarming — K+, Mg, phos.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("INFECTION — pneumonia from aspiration; broad-spectrum until cultures.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("FAMILY DISTRESS — clear communication; defer prognostic statements; involve palliative care.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum AdultDKASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "adult-dka",
        title: "Adult diabetic ketoacidosis (DKA)",
        subtitle: "Anion-gap acidosis + ketones + hyperglycemia · K+ first if <3.3 · transition SQ when gap closed",
        nclexTags: endoR21,
        definition: AttributedProse(
            "Severe insulin deficiency → uncontrolled lipolysis + ketogenesis → high anion gap metabolic acidosis + hyperglycemia + ketonemia. Defined by glucose >250 mg/dL, anion gap >12, pH <7.3, bicarbonate <18, positive ketones per ADA criteria per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Insulin deficiency + counter-regulatory hormones (glucagon, cortisol, GH, catecholamines) → hyperglycemia (osmotic diuresis + electrolyte loss) + ketogenesis (β-hydroxybutyrate + acetoacetate) → anion-gap metabolic acidosis. Total body K+ depleted despite normal / high serum K+.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Polyuria + polydipsia + weight loss + weakness; nausea, vomiting, abdominal pain.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Kussmaul breathing (deep + rapid); fruity / acetone breath odor.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Dehydration — dry mucous membranes, tachycardia, hypotension; volume deficit ~6 L typical.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Altered mental status — proportional to osmolality + acidosis; coma ominous.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Precipitants — infection (most common), new T1DM presentation, insulin omission, MI, pancreatitis, SGLT2 inhibitors (euglycemic DKA).", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Glucose >250 mg/dL (euglycemic DKA on SGLT2i — glucose may be near normal).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Anion gap >12 (Na − Cl − HCO3).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("pH <7.3, bicarbonate <18 (severe = pH <7.0, HCO3 <10).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Positive serum ketones — β-hydroxybutyrate preferred (acetoacetate test misses early DKA + improves first when treated).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Distinguish HHS — glucose typically >600, osmolality >320, mild / absent ketosis, mental status more affected.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Volume status; precipitant; mental status; severity (mild / moderate / severe by pH + HCO3 + mentation).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Workup precipitant — infection (UA, CXR, blood / urine cultures), troponin, lipase.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Pregnancy — euglycemic DKA more common; lower threshold to test.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("FLUID FIRST — 1 L NS bolus + 500 mL/hr × 2 hrs; transition to 0.45% NS when corrected sodium normal / high; add D5 when glucose <200-250 per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("INSULIN AFTER K+ ≥3.3 — 0.1 units/kg IV bolus + 0.1 units/kg/h infusion; target glucose drop 50-100 mg/dL/hr; reduce rate when glucose <200.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("POTASSIUM REPLACEMENT — replete to keep K+ 4-5; HOLD insulin if K+ <3.3, REPLACE first.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("BICARBONATE — only if pH <6.9 (controversial); not routine; can worsen intracellular acidosis + hypokalemia.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PHOSPHATE replacement — if PO4 <1 + respiratory weakness; not routine.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MAGNESIUM replacement — typical 1-2 g IV q24h during DKA management.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("TRANSITION TO SQ — when anion gap closed + bicarbonate >18 + patient eating; overlap SQ + IV × 2 hrs to prevent rebound DKA.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Treat precipitant — abx for infection, ACS workup, pancreatitis support.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DIABETIC EDUCATION before discharge — sick-day rules, ketone testing, when to call.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("HYPOGLYCEMIA from insulin — q1h glucose; switch to D5 fluid when glucose <200.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("HYPOKALEMIA — insulin drives K+ intracellular; q2h K+ check; replace aggressively.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CEREBRAL EDEMA — RARE in adults but possible; suspect with new headache, lethargy, papilledema, bradycardia; mannitol + hypertonic saline.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("EUGLYCEMIC DKA on SGLT2 inhibitors — glucose may be 200-250; check ketones if acidotic.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VTE — DKA is prothrombotic; consider prophylaxis.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("RECURRENT DKA — frequent presentations suggest insulin omission; address barriers; psychiatric / social.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SevereHyperkalemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "severe-hyperkalemia",
        title: "Severe hyperkalemia",
        subtitle: "K+ >6.5 with ECG changes · CALCIUM stabilize myocardium FIRST · then SHIFT + REMOVE",
        nclexTags: electrolytesR21,
        definition: AttributedProse(
            "Serum K+ ≥6.5 mEq/L or with ECG changes regardless of level. Most common in CKD / ESRD, AKI, medications (RAAS inhibitors, K-sparing diuretics, TMP-SMX), hemolysis, tumor lysis, rhabdomyolysis. Emergency — can cause life-threatening arrhythmia per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Elevated extracellular K+ → decreased resting membrane potential gradient → impaired repolarization + cardiac conduction → progressive ECG changes → ventricular arrhythmia → asystole.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic until cardiac manifestations.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Muscle weakness, paresthesias, cramping; ascending paralysis at very high levels.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("ECG SEQUENCE — peaked T waves → PR prolongation → P wave flattening → wide QRS → sine wave → asystole / VF.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Causes — CKD / AKI, RAAS inhibitors (ACEi, ARBs, spironolactone, eplerenone), K-sparing diuretics, TMP-SMX, beta-blockers, tumor lysis, rhabdomyolysis, hemolysis, ACEi + spironolactone combo, NSAIDS contributing.", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum K+ ≥6.5 OR any K+ with ECG changes.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PSEUDOHYPERKALEMIA — hemolyzed sample, prolonged tourniquet, high WBC / platelets; repeat if asymptomatic with no risk factors.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Workup cause — CMP / BUN / Cr, ABG (acidosis), CK (rhabdo), LDH / haptoglobin (hemolysis), TLS labs.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Medication review — discontinue contributors.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("ECG IMMEDIATELY — guides urgency; continuous telemetry until resolved.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Identify cause; medication review; renal function.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Volume status; pH; concurrent electrolyte disturbances.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("CALCIUM GLUCONATE 1 g IV (or calcium chloride 500-1000 mg through central line) — STABILIZE MYOCARDIUM; onset minutes; lasts 30-60 min; REPEAT if ECG changes persist per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("SHIFT K+ INTRACELLULAR — INSULIN 10 units IV + DEXTROSE 25 g (D50 50 mL) IV; onset 15 min; lasts 4-6 hrs per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Albuterol nebulized 10-20 mg (high dose) — additional intracellular shift; useful adjunct.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("SODIUM BICARBONATE — for concurrent metabolic acidosis; not first-line for hyperkalemia alone.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("REMOVE K+ FROM BODY — diuretics (furosemide if volume-tolerant); cation-exchange resins (sodium polystyrene sulfonate / Kayexalate — concerning for bowel necrosis, often AVOIDED); newer agents (PATIROMER, ZIRCONIUM CYCLOSILICATE) preferred per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("HEMODIALYSIS — definitive for severe / refractory hyperkalemia, especially ESRD / AKI; arrange urgently.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DISCONTINUE OFFENDING MEDS — RAAS inhibitors, K-sparing diuretics, TMP-SMX.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Q1H K+ during treatment; ECG monitoring; goal K+ <6.0 then <5.5.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("REBOUND HYPERKALEMIA — shift therapy is temporary; must remove K+ if cause persists.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VENTRICULAR ARRHYTHMIA / ASYSTOLE — emergent calcium + dialysis; ACLS.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("HYPOGLYCEMIA from insulin without enough dextrose; check glucose at 30 + 60 min.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("BOWEL NECROSIS from Kayexalate — particularly with sorbitol; newer agents safer.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Recurrent hyperkalemia on RAAS inhibitors — patiromer / lokelma allows continuation in HF / CKD patients.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SevereHyponatremiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "severe-hyponatremia",
        title: "Severe hyponatremia",
        subtitle: "Na+ <120 or symptomatic · slow correction · ODS risk if too fast · 3% NaCl for seizures",
        nclexTags: electrolytesR21,
        definition: AttributedProse(
            "Serum Na+ <135 mEq/L; severe defined as <120 OR symptomatic (seizures, coma) at any level. Most common electrolyte disturbance. Acute (<48 hrs) vs chronic (>48 hrs) determines correction rate per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Excess body water relative to sodium → hypotonic state → cerebral edema (acute) or adaptive cerebral solute loss (chronic). Rapid correction of chronic hyponatremia → osmotic demyelination syndrome (ODS).",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Mild — nausea, malaise; Moderate — headache, confusion, gait instability; Severe — vomiting, seizures, obtundation, coma, brainstem herniation.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Causes — hypovolemic (diuretics, GI losses, adrenal insufficiency); euvolemic (SIADH, hypothyroidism, primary polydipsia, MDMA); hypervolemic (HF, cirrhosis, nephrotic, AKI).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Acute (<48h) — usually post-op or marathon hyponatremia; cerebral edema more concerning.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Chronic (>48h) — adapted brain; rapid correction more dangerous (ODS).", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Serum Na+ <135; <120 + symptomatic = severe.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Serum osmolality — distinguishes hypotonic (true) from isotonic (hyperglycemia, mannitol) + hypertonic.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Urine osmolality + urine sodium + volume status — determine etiology.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("TSH, cortisol — rule out hypothyroidism + adrenal insufficiency.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Acute vs chronic determination — duration of hyponatremia drives correction rate.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Symptoms severity — guides urgency of correction.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Volume status + cause — drives long-term management.", citationIDs: ["openrn_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE SYMPTOMATIC (seizures, coma) — HYPERTONIC SALINE 3% NaCl 100-150 mL IV over 10-20 min; repeat × up to 3 doses to raise Na+ 4-6 mEq/L acutely per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CHRONIC asymptomatic — slow correction; MAX 8-10 mEq/L in 24 hrs to avoid ODS per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CAUSE-SPECIFIC — hypovolemic: isotonic saline; euvolemic SIADH: fluid restriction + salt tablets + vaptan (selected); hypervolemic: diuretics + treatment of underlying.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DESMOPRESSIN CLAMP — for chronic hyponatremia correction; gives DDAVP to fix urine output then allows controlled rise in Na+; prevents over-correction.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VAPTAN (tolvaptan) — for SIADH-induced hyponatremia + euvolemic / hypervolemic; expensive + risk of hepatotoxicity in cirrhosis.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("FLUID RESTRICTION — for SIADH 800-1200 mL/day.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Q2H Na+ during acute correction; q6h during slower correction.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Stop offending meds — SSRIs, thiazides, carbamazepine, MDMA, NSAIDs.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("OSMOTIC DEMYELINATION SYNDROME (ODS) — too-rapid correction; dysarthria, dysphagia, paraparesis days-week after correction; supportive care; usually irreversible.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("OVER-CORRECTION — if >8 mEq in 24 hrs, give D5W + DDAVP to lower Na+ back; high-risk patients (alcoholics, malnourished, hypokalemic) extra caution.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CEREBRAL EDEMA / HERNIATION — acute severe; 3% saline emergent.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("SIADH source — paraneoplastic (small cell lung), CNS pathology, pulmonary, medication; workup once hemodynamically stable.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("RECURRENT HYPONATREMIA — addressed underlying cause; fluid balance education.", citationIDs: ["openrn_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum RefractoryHypoxemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "refractory-hypoxemia",
        title: "Refractory hypoxemia in ARDS",
        subtitle: "PaO2/FiO2 <100 despite optimization · prone · NMBA · ECMO consideration · lung-protective",
        nclexTags: respR21,
        definition: AttributedProse(
            "Persistent severe hypoxemia (PaO2/FiO2 ≤100 on PEEP ≥5) despite optimized lung-protective ventilation in ARDS. Indication for advanced rescue therapies — prone positioning, neuromuscular blockade, ECMO. Berlin criteria severe ARDS per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "ARDS = diffuse alveolar damage from direct (pneumonia, aspiration) or indirect (sepsis, pancreatitis, transfusion) insult → V/Q mismatch + shunt + decreased compliance + atelectasis. Severe hypoxemia from refractory shunt physiology.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("SpO2 <88% on FiO2 1.0 or PaO2/FiO2 <100 on PEEP ≥5.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Tachypnea, increased work of breathing despite mechanical ventilation.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Bilateral infiltrates on imaging not explained by HF / volume overload.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Hemodynamic compromise — high airway pressures + reduced venous return → hypotension.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("Causes — severe pneumonia, COVID-19, aspiration, sepsis, pancreatitis, multiple transfusions.", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BERLIN ARDS criteria — acute onset (≤1 week); bilateral infiltrates; not fully explained by HF; PaO2/FiO2 ≤300 (mild) / ≤200 (moderate) / ≤100 (severe).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Refractory — PaO2/FiO2 persistently ≤100 despite optimized vent settings.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Echo — rule out cardiogenic; ECMO candidacy assessment.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Underlying cause workup — cultures, autoimmune, etc.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Ventilator settings — confirm lung-protective; PEEP optimization.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Hemodynamics — vasopressor needs; right heart function.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ECMO candidacy — age, comorbidity, reversibility, center capability.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("LUNG-PROTECTIVE — Vt 6 mL/kg ideal body weight + plateau ≤30 cmH2O; permissive hypercapnia per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PEEP titration — open lung; ARDSnet table OR esophageal manometry; transpulmonary pressure positive.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PRONE POSITIONING ≥16 hrs/day — single best mortality intervention in severe ARDS per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("NEUROMUSCULAR BLOCKADE × 48 hrs — for severe ARDS; reduces ventilator dyssynchrony.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CONSERVATIVE FLUID — net negative once hemodynamically stable.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ECMO — V-V ECMO for severe refractory; transfer to ECMO center promptly; LIFE-supportive not therapeutic.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("INHALED PULMONARY VASODILATORS — inhaled NO / epoprostenol (Flolan) — temporary improvement; bridge to other therapies.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("RECRUITMENT MANEUVERS — controversial, may improve some; not for routine use.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Treat underlying cause — abx for pneumonia, sepsis source control, etc.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("VILI / ventilator-induced lung injury — volutrauma, barotrauma, atelectotrauma, biotrauma; vigilant lung-protective.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("BAROTRAUMA — pneumothorax / pneumomediastinum / SQ emphysema; chest tube; reduce pressures.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("RIGHT HEART FAILURE from PEEP + ARDS — assess with echo; minimize PEEP if RV failing.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PRONE COMPLICATIONS — pressure injuries (face, chest), tube dislodgement, line malposition; specialty team.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ECMO complications — bleeding, hemolysis, infection, thrombosis, neuro events.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MODSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mods",
        title: "Multi-organ dysfunction syndrome (MODS)",
        subtitle: "≥2 organ systems failing · SOFA score · supportive · address inciting cause · poor prognosis",
        nclexTags: icuR21,
        definition: AttributedProse(
            "Progressive dysfunction of two or more organ systems following acute critical illness — sepsis, trauma, pancreatitis, post-cardiac arrest, etc. Implies systemic inflammatory response with widespread endothelial + organ injury. Mortality increases substantially with each additional organ failed per primary source.",
            citationIDs: ["openrn_dx_round21", "specialty_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Inciting insult → systemic inflammatory response + endothelial dysfunction + capillary leak + microcirculatory failure + cellular dysoxia → progressive organ failure. SIRS / sepsis pathways central; can also arise from severe trauma, pancreatitis, burns, anaphylaxis.",
            citationIDs: ["openrn_dx_round21"]
        ),
        presentation: [
            AttributedBullet("RESPIRATORY — ARDS / hypoxic respiratory failure (most common).", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("CARDIOVASCULAR — distributive shock, myocardial dysfunction.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("RENAL — AKI with need for RRT.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("HEPATIC — transaminitis, cholestasis, hepatic encephalopathy.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("HEMATOLOGIC — DIC, thrombocytopenia, anemia.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("NEUROLOGIC — encephalopathy, ICU delirium.", citationIDs: ["openrn_dx_round21"]),
            AttributedBullet("GI — ileus, mucosal breakdown, bacterial translocation.", citationIDs: ["openrn_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Sequential Organ Failure Assessment (SOFA) — 6 organ systems scored 0-4; total predicts mortality.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Clinical — ≥2 organ systems with acute dysfunction in critically ill patient.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Workup — ABG, CBC, CMP, lactate, coag, imaging per affected system.", citationIDs: ["openrn_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify + treat inciting cause — sepsis, hemorrhage, ischemia, toxic.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Daily SOFA scoring; trends matter more than single values.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Family communication — prognosis, goals of care, palliative integration.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("ORGAN-SPECIFIC SUPPORT — mechanical ventilation (lung-protective), vasopressors + inotropes, RRT, blood products, sedation / pain management per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ADDRESS UNDERLYING CAUSE — abx + source control for sepsis, hemorrhage control, ischemia reperfusion, etc.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("AVOID FURTHER HARM — minimize sedation, lung-protective vent, conservative fluids, early mobility.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("NUTRITION — early enteral; trophic feeds initially; advance as tolerated.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("GLYCEMIC control 140-180.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("VTE + stress ulcer prophylaxis per protocol.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Palliative consult early for severe MODS — symptom management + family support.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Family meetings + goals of care; align interventions with patient values.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("ESCALATING ORGAN FAILURE — each new organ failure increases mortality ~15-20%.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("INFECTION + SECONDARY INFECTION — CLABSI, VAP, CAUTI, C. diff; bundles to prevent.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ICU-ACQUIRED WEAKNESS + PROLONGED VENTILATION — long-term morbidity.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("POST-ICU SYNDROME — cognitive, physical, mental health sequelae; post-ICU clinic.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("MORALLY DISTRESSING — high mortality; team support; debrief; ethics consultation if conflict.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PRISSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "propofol-infusion-syndrome",
        title: "Propofol infusion syndrome (PRIS)",
        subtitle: "Prolonged high-dose propofol · metabolic acidosis + rhabdo + cardiac failure · STOP infusion · supportive",
        nclexTags: icuR21,
        definition: AttributedProse(
            "Rare but life-threatening complication of prolonged (>48 hrs) high-dose (>4-5 mg/kg/hr) propofol sedation — characterized by metabolic acidosis, rhabdomyolysis, hyperkalemia, hepatomegaly, cardiac failure, renal failure. Mortality ~30-50%. Diagnosis requires high clinical suspicion per primary source.",
            citationIDs: ["specialty_dx_round21", "openrn_dx_round21"]
        ),
        pathophysiology: AttributedProse(
            "Impaired mitochondrial fatty acid oxidation + impaired ETC function from prolonged propofol → cellular energy failure → multi-organ dysfunction. Catecholamine + steroid use, age (peds more vulnerable), critical illness contribute.",
            citationIDs: ["specialty_dx_round21"]
        ),
        presentation: [
            AttributedBullet("Unexplained metabolic acidosis (often with high anion gap, elevated lactate) — first clue.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Rhabdomyolysis — markedly elevated CK; myoglobinuria; can precipitate AKI.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Hyperkalemia, hypertriglyceridemia, lipemia (visibly cloudy serum).", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Cardiac dysfunction — bradycardia refractory to atropine / inotropes; Brugada-like ECG; cardiac failure.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Hepatomegaly, renal failure.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Risk factors — propofol >4-5 mg/kg/hr × >48 hrs; pediatric > adult; concurrent catecholamines + steroids; head injury; critical illness.", citationIDs: ["specialty_dx_round21"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis + propofol exposure pattern; no specific test.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Labs — metabolic acidosis with elevated anion gap, lactate, CK, troponin, K+, lipids, LFTs, renal function.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Differential — sepsis, ischemic insult, other metabolic acidoses.", citationIDs: ["specialty_dx_round21"])
        ],
        priorityAssessments: [
            AttributedBullet("Propofol dose + duration — high index of suspicion for any sedation >48 hrs at high dose.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Trend daily labs — anion gap, lactate, CK, K+, troponin, lipids.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("Cardiac monitoring — bradycardia, conduction abnormalities.", citationIDs: ["specialty_dx_round21"])
        ],
        commonInterventions: [
            AttributedBullet("STOP PROPOFOL IMMEDIATELY — switch to alternate sedation (dexmedetomidine, midazolam, ketamine) per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("SUPPORTIVE CARE — vasopressors, mechanical ventilation, RRT for AKI / hyperkalemia / acidosis, transfusion as needed.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ECMO — for refractory cardiac failure; case reports of successful recovery.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PACING — for bradyarrhythmia refractory to atropine.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("AGGRESSIVE FLUID + RHABDO CARE — alkalinize urine; replace electrolytes; protect kidneys.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("LIPID REMOVAL — limited evidence; not standard.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("PREVENTION — avoid propofol >5 mg/kg/hr × >48 hrs; if needed, monitor closely; use combination sedation; rotate to other agents.", citationIDs: ["specialty_dx_round21"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC ARREST — refractory bradycardia + asystole; consider PRIS in any sedated patient with unexplained acidosis.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("CHILDREN — particularly susceptible; AVOID prolonged propofol in pediatric ICU sedation per primary source.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("AKI from rhabdo — RRT may be needed; recovery slow.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("DELAYED RECOVERY — multi-organ failure may take weeks; supportive care + nutrition.", citationIDs: ["specialty_dx_round21"]),
            AttributedBullet("ROOT CAUSE ANALYSIS — review sedation protocol + prevention strategies.", citationIDs: ["specialty_dx_round21"])
        ],
        citations: [openrnDxR21, cdcDxR21, specialtyDxR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}
