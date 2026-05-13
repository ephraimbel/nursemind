import Foundation

// Curator-model procedure + reference entries (round 13 expansion).
// Sources: Open RN Skills + Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + AHA + AAP + Endocrine Society + ANA / APNA concept citations.

private let openrnSkR13p = CitationSource(
    id: "openrn_skills_round13",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=tPA+ICP+EVD+de-escalation",
    lastRetrieved: "2026-05-04"
)
private let openrnHar13 = CitationSource(
    id: "openrn_ha_round13_proc",
    shortName: "Open RN Health Alterations + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=stroke+ICP+pediatric+adrenal",
    lastRetrieved: "2026-05-04"
)
private let openstaxR13p = CitationSource(
    id: "openstax_round13_proc",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let ahaConceptR13p = CitationSource(
    id: "aha_round13",
    shortName: "AHA / ASA stroke + brain-injury guidelines (concept citation)",
    publisher: "American Heart Association · American Stroke Association",
    license: .factCitationOnly,
    url: "https://professional.heart.org/en/guidelines-and-statements",
    lastRetrieved: "2026-05-04"
)
private let aapConceptR13 = CitationSource(
    id: "aap_round13",
    shortName: "AAP / Holiday-Segar pediatric fluid + stress-dose steroid (concept citation)",
    publisher: "American Academy of Pediatrics · Endocrine Society",
    license: .factCitationOnly,
    url: "https://publications.aap.org/aapnews",
    lastRetrieved: "2026-05-04"
)
private let apnaConceptR13 = CitationSource(
    id: "apna_round13",
    shortName: "APNA / BETA / SAFER de-escalation (concept citation)",
    publisher: "American Psychiatric Nurses Association",
    license: .factCitationOnly,
    url: "https://www.apna.org/resources/",
    lastRetrieved: "2026-05-04"
)

private let safetyR13 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let perfusionProcR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)
private let neuroProcR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation)
private let psychSafetyR13 = NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety)
private let pedsRefR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes)
private let endoRefR13 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)

// MARK: - tPA / Alteplase Administration (Stroke)

public enum TPAStrokeAdminSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "tpa-stroke-admin",
        title: "Alteplase / tenecteplase administration for ischemic stroke",
        subtitle: "≤4.5-hour window · BP <185/110 · 10% bolus + 90% over 1 hr · 24-hour monitoring",
        nclexTags: perfusionProcR13,
        indications: AttributedProse(
            "Acute ischemic stroke within 4.5 hours of symptom onset (last known well) per AHA/ASA guidelines; tenecteplase increasingly used as alternative single-bolus per primary source.",
            citationIDs: ["openrn_skills_round13", "aha_round13"]
        ),
        contraindications: AttributedProse(
            "Active hemorrhage; intracranial hemorrhage on CT; recent stroke / TBI <3 months; recent major surgery / GI bleed <21 days; history of intracranial neoplasm / AVM; severe HTN >185/110 unresponsive to treatment; current anticoagulation (INR >1.7, DOAC <48 hr); platelets <100; glucose <50; symptoms minor or rapidly improving; full ineligibility list per AHA per primary source.",
            citationIDs: ["openrn_skills_round13"]
        ),
        equipment: [
            AttributedBullet("Alteplase 0.9 mg/kg (max 90 mg total); reconstitution per pharmacy.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Two large-bore IVs (one for tPA, one for IV access); BP cuff with frequent measurement; cardiac monitor.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Antihypertensives ready (labetalol, nicardipine drip).", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Foley catheter + NG tube ONLY before tPA initiation (reduce bleeding risk during 24-hour post-tPA period).", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Stroke-unit / ICU bed.", citationIDs: ["openrn_skills_round13"])
        ],
        preProcedure: [
            AttributedBullet("Verify last-known-well time + NIHSS + non-contrast CT excludes hemorrhage; provider verifies eligibility.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("BP must be <185/110 BEFORE tPA; treat with labetalol or nicardipine if higher per primary source.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("CBC + INR + PTT + glucose; verify weight (kg) for accurate dosing.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Informed consent (document if patient unable / family).", citationIDs: ["openrn_skills_round13"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Calculate dose", body: "Alteplase 0.9 mg/kg (max 90 mg). 10% as IV BOLUS over 1 minute. Remaining 90% as IV INFUSION over 60 minutes per primary source.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 2, title: "Administer bolus", body: "Push 10% of total dose IV over 1 minute via dedicated line; flush with NS.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 3, title: "Continuous infusion", body: "Begin 90% via infusion pump over 60 minutes; document start time.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 4, title: "Monitor q15 min × 2 hr", body: "Vital signs + neuro exam (NIHSS) every 15 minutes during infusion + first 2 hours; then q30 min × 6 hr; then q1 hr × 16 hr per primary source.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 5, title: "BP target post-tPA", body: "Maintain BP <180/105 × 24 hours; titrate antihypertensive per protocol.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 6, title: "Avoid antithrombotic for 24 hr", body: "NO aspirin / heparin / DVT prophylaxis × 24 hours per primary source.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 7, title: "24-hour CT", body: "Repeat CT to rule out hemorrhagic transformation BEFORE starting antiplatelet / anticoagulation per primary source.", citationIDs: ["openrn_skills_round13"])
        ],
        postProcedure: [
            AttributedBullet("Continue stroke-unit care; swallow eval BEFORE PO; DVT prophylaxis (mechanical until 24 hr, then pharmacologic if no hemorrhage).", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Initiate aspirin 81–325 mg after 24-hour CT clears hemorrhage.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Workup etiology — echo, carotid US, telemetry for AFib, A1c, lipids; coordinate secondary prevention.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Rehab consult (PT, OT, speech) within 24 hours.", citationIDs: ["openrn_skills_round13"])
        ],
        documentation: [
            AttributedBullet("Last-known-well time, NIHSS, BP, dose / weight, infusion start + end, neuro exam serial, complications, post-CT findings.", citationIDs: ["openrn_skills_round13"])
        ],
        watchFor: [
            AttributedBullet("HEMORRHAGIC TRANSFORMATION — sudden neuro decline, HTN, headache, vomiting; STOP infusion if running, emergent CT, give CRYOPRECIPITATE 10 units + TXA 1 g IV per primary source.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("ANGIOEDEMA — orolingual swelling, often unilateral; STOP, intubation-ready; epinephrine + steroid + antihistamine per primary source.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Major systemic hemorrhage — GI / GU / retroperitoneal; transfusion + reversal.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Reperfusion injury / cerebral edema — monitor; consider hyperosmolar therapy.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Door-to-needle goal <60 minutes; faster correlates with better outcomes per primary source.", citationIDs: ["openrn_skills_round13"])
        ],
        citations: [openrnSkR13p, openstaxR13p, ahaConceptR13p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ICP / EVD Management

public enum ICPEVDSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "icp-evd-management",
        title: "ICP monitoring + EVD management",
        subtitle: "Bolt vs ventricular catheter · zero / level · CSF drainage · ICP / CPP targets",
        nclexTags: neuroProcR13,
        indications: AttributedProse(
            "Severe traumatic brain injury (GCS ≤8 with abnormal CT), hydrocephalus from SAH / IVH / mass / aqueductal stenosis, cerebellar / brainstem hemorrhage with neurologic decline; allows ICP measurement AND CSF drainage per primary source.",
            citationIDs: ["openrn_skills_round13", "openstax_round13_proc"]
        ),
        contraindications: AttributedProse(
            "Severe coagulopathy (correct first); skin infection at planned site; midline shift sufficient to compress ventricles (relative — provider judgment); patient refusal in non-emergent setting.",
            citationIDs: ["openrn_skills_round13"]
        ),
        equipment: [
            AttributedBullet("EVD kit — ventriculostomy catheter, drainage chamber, transducer system; sterile attire.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("OR alternative — fiberoptic / strain-gauge ICP bolt (intraparenchymal — measures ICP only, no CSF drainage).", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Pressure transducer; level marker; sterile ICU gown.", citationIDs: ["openrn_skills_round13"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order; coag panel (correct if needed); informed consent.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Position — supine, HOB 30°, head midline.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Continuous monitoring; sedation / analgesia per provider.", citationIDs: ["openrn_skills_round13"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Provider insertion", body: "Sterile prep + drape; small skin incision; drilled twist-drill burr hole; catheter passed into lateral ventricle (typically right Kocher's point — 1 cm anterior to coronal suture, 3 cm lateral to midline) per primary source.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 2, title: "Connect drainage system", body: "Connect to closed drainage chamber; transducer.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 3, title: "ZERO + LEVEL", body: "ZERO transducer at TRAGUS (foramen of Monro) — must re-zero with any HOB change. LEVEL drainage chamber to provider-specified height (typically 10–15 cm above tragus initially) per primary source.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 4, title: "Monitor + drain", body: "ICP continuous waveform; CSF drainage CONTINUOUS or INTERMITTENT per order. Drainage = ICP minus desired pressure (clamping for higher targets, opening for lower).", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 5, title: "Assess ICP + CPP", body: "ICP target <22 mmHg (severe TBI per BTF); CPP target 60–70 mmHg (CPP = MAP − ICP) per primary source.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 6, title: "Sterile manipulation only", body: "EVD is high-infection-risk; access only with sterile technique; minimize disconnections.", citationIDs: ["openrn_skills_round13"])
        ],
        postProcedure: [
            AttributedBullet("Continuous ICP / CPP / waveform monitoring; document hourly.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Daily CSF studies (cell count, glucose, protein, culture) per primary source — surveillance for ventriculitis.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Sterile dressing changes; assess insertion site for redness / drainage.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Discontinuation when ICP normalized — CLAMP TRIAL × 24 hours; if ICP stable, remove EVD per primary source.", citationIDs: ["openrn_skills_round13"])
        ],
        documentation: [
            AttributedBullet("ICP, CPP, waveform character (good / dampened), drainage volume per shift, color, level setting, complications.", citationIDs: ["openrn_skills_round13"])
        ],
        watchFor: [
            AttributedBullet("VENTRICULITIS — fever, increased ICP, change in CSF (cloudy, leukocytosis); cultures + IV antibiotics per primary source.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("OVER-DRAINAGE → subdural hematoma; check level after every position / HOB change.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("UNDER-DRAINAGE → ICP rise; check for kinks, blockage; troubleshoot per protocol.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Hemorrhage / catheter migration — if ICP rises suddenly, image.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("CPP <60 → cerebral ischemia; raise MAP with vasopressors; lower ICP with osmotic therapy / drainage.", citationIDs: ["openrn_skills_round13"])
        ],
        citations: [openrnSkR13p, openstaxR13p, ahaConceptR13p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - De-escalation

public enum DeescalationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "de-escalation",
        title: "De-escalation of behavioral emergency",
        subtitle: "Verbal first · BETA / SAFER framework · environment · least restrictive",
        nclexTags: psychSafetyR13,
        indications: AttributedProse(
            "Patient with escalating agitation / aggression / behavioral crisis where verbal de-escalation may prevent restraint or seclusion. Applies across psychiatric, ED, medical-surgical, ICU settings. THIS IS A CONCEPT REFERENCE per primary source.",
            citationIDs: ["openrn_skills_round13", "apna_round13"]
        ),
        contraindications: AttributedProse(
            "Imminent danger to self / others (move to physical containment / chemical as needed); medical / metabolic cause requiring immediate treatment.",
            citationIDs: ["openrn_skills_round13"]
        ),
        equipment: [
            AttributedBullet("Trained staff; security if needed and immediately accessible.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Quiet space free of weapons / objects; clear exits for staff and patient.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Oral PRN medications available (lorazepam, olanzapine, haloperidol per provider) for early offering.", citationIDs: ["openrn_skills_round13"])
        ],
        preProcedure: [
            AttributedBullet("Recognize early warning signs — pacing, raised voice, clenched fists, increased agitation, verbal threats, physical proximity.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Activate team early — preventive huddle if you anticipate.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Move other patients / family to safety; reduce environmental triggers (noise, lights).", citationIDs: ["openrn_skills_round13"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Respect personal space", body: "Maintain ~2 arm-lengths distance; allow patient room to move; do not corner patient or block exits per primary source.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 2, title: "Don't be provocative", body: "Open, calm body language; hands visible; quiet voice; no sudden movements; avoid pointing fingers, crossing arms, prolonged eye contact.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 3, title: "Establish verbal contact", body: "ONE speaker (avoid multiple voices). Use the patient's name. Identify yourself. \"My name is _____, I'm a nurse here. I want to help you.\"", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 4, title: "Be concise + simple", body: "Short sentences, simple words; allow time for processing; reset baseline before re-asking.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 5, title: "Identify wants + feelings", body: "\"What are you feeling right now?\" \"What do you need?\" Active listening; reflect feelings back without judgment.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 6, title: "Listen actively + validate", body: "Avoid arguing about facts; validate feelings (not behavior). \"I can see this is really upsetting.\"", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 7, title: "Set clear limits + offer choices", body: "Clearly state limits without threats. Offer options: \"You can take this medication by mouth or by injection — which would you prefer?\" Empowerment reduces escalation.", citationIDs: ["openrn_skills_round13"]),
            ProcedureStep(number: 8, title: "Debrief team after", body: "Document what happened; debrief team about what worked / didn't; assess for staff support needs and patient follow-up.", citationIDs: ["openrn_skills_round13"])
        ],
        postProcedure: [
            AttributedBullet("Document — what triggered, what was tried, what worked, medications offered, time, witnesses.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Patient debrief once calm — acknowledge feelings, problem-solve, identify safer expression methods.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Staff debrief — emotional support, lessons learned.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Review for patterns; behavioral plan update.", citationIDs: ["openrn_skills_round13"])
        ],
        documentation: [
            AttributedBullet("Trigger, behavior, intervention, response, time, medications, restraints if used, debrief notes.", citationIDs: ["openrn_skills_round13"])
        ],
        watchFor: [
            AttributedBullet("MEDICAL CAUSE — hypoxia, hypoglycemia, intoxication, withdrawal, infection (UTI in older adult), encephalopathy — TREAT first; behavioral management alone fails for these.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Imminent danger → physical / chemical intervention with appropriate trained team; LEAST restrictive option for shortest time per primary source.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Restraints / seclusion are last-resort; require provider order + frequent reassessment; document Q15 minutes per facility / Joint Commission per primary source.", citationIDs: ["openrn_skills_round13"]),
            AttributedBullet("Patient + staff safety EQUAL priority — call security / police if violence imminent.", citationIDs: ["openrn_skills_round13"])
        ],
        citations: [openrnSkR13p, apnaConceptR13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ICP / CPP Reference

public enum ICPCPPSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "icp-cpp-reference",
        title: "ICP / CPP / cerebral physiology reference",
        subtitle: "Monro-Kellie · ICP / CPP / waveforms · tier-1 / tier-2 management",
        eyebrow: "REFERENCE · NEUROCRITICAL",
        nclexTags: neuroProcR13,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Cerebral physiology obeys the Monro-Kellie doctrine: the cranial vault contains brain (~80%), blood (~10%), CSF (~10%); fixed total volume. Increases in any compartment must be compensated, or ICP rises. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["aha_round13"]
            )),
            .keyValueTable(title: "Normal values", [
                KeyValueRow(key: "Adult ICP", value: "5–15 mmHg (sustained >22 = action threshold per BTF)"),
                KeyValueRow(key: "Pediatric ICP", value: "Children 3–7; infants 1.5–6 mmHg"),
                KeyValueRow(key: "CPP (cerebral perfusion pressure)", value: "MAP − ICP; goal 60–70 mmHg adult"),
                KeyValueRow(key: "CBF (cerebral blood flow)", value: "~50 mL/100 g/min; autoregulated MAP 50–150 mmHg in healthy brain")
            ]),
            .keyValueTable(title: "ICP waveform components (P1 / P2 / P3)", [
                KeyValueRow(key: "P1 — Percussion", value: "Reflects arterial pulse; tallest in normal compliance"),
                KeyValueRow(key: "P2 — Tidal", value: "Reflects intracranial compliance; if P2 > P1 → DECREASED COMPLIANCE / increased ICP risk"),
                KeyValueRow(key: "P3 — Dicrotic", value: "Reflects aortic-valve closure; usually smallest")
            ]),
            .keyValueTable(title: "Lundberg waves", [
                KeyValueRow(key: "A waves (plateau, 5–20 min)", value: "ICP 50–100 mmHg sustained — IMPENDING HERNIATION; emergent treatment per primary source"),
                KeyValueRow(key: "B waves (every 0.5–2 min)", value: "Brief peaks 20–50 mmHg; abnormal autoregulation; concerning"),
                KeyValueRow(key: "C waves", value: "4–8/min, low amplitude; clinical significance unclear")
            ]),
            .keyValueTable(title: "Tier-1 ICP management (severe TBI per BTF)", [
                KeyValueRow(key: "Position", value: "HOB 30°, head midline neutral, no neck flexion / extension"),
                KeyValueRow(key: "Pain / agitation control", value: "Sedation (propofol, fentanyl) + analgesia"),
                KeyValueRow(key: "CSF drainage", value: "Via EVD if available"),
                KeyValueRow(key: "Osmotic therapy", value: "Mannitol 0.25–1 g/kg IV bolus OR hypertonic saline 3% (250 mL) per provider"),
                KeyValueRow(key: "Ventilation", value: "PaCO2 35–40 mmHg; AVOID hyperventilation as first-line"),
                KeyValueRow(key: "Seizure prophylaxis", value: "Levetiracetam × 7 days post-injury per primary source"),
                KeyValueRow(key: "Hyperthermia", value: "Antipyretics + cooling — hyperthermia worsens secondary injury"),
                KeyValueRow(key: "Glucose", value: "Avoid hyperglycemia + hypoglycemia")
            ]),
            .keyValueTable(title: "Tier-2 / refractory measures", [
                KeyValueRow(key: "Moderate hyperventilation", value: "PaCO2 30–35 brief — temporary measure"),
                KeyValueRow(key: "Pentobarbital coma", value: "Reduces cerebral metabolism; ICU-level monitoring"),
                KeyValueRow(key: "Decompressive craniectomy", value: "Surgical option; controversial outcomes per RESCUEicp"),
                KeyValueRow(key: "Hypothermia", value: "Limited evidence; not routinely recommended per BTF"),
                KeyValueRow(key: "Goal of all", value: "ICP <22 mmHg + CPP 60–70 mmHg")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("MINIMIZE STIMULATION — cluster cares; avoid simultaneous painful procedures (suctioning + repositioning).", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("AVOID Valsalva — straining, coughing, vomiting; bowel regimen, antiemetics, pretreat suction.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("HOB 30° AND head MIDLINE — neck flexion / rotation impairs venous drainage.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Maintain CPP — hypotension is the enemy; treat aggressively; avoid hypovolemia, sedation-induced hypotension.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("CUSHING'S TRIAD (HTN + bradycardia + irregular respirations) = imminent herniation; emergent osmotic therapy + CSF drainage + neurosurgery per primary source.", citationIDs: ["openrn_ha_round13_proc"])
            ])
        ],
        citations: [ahaConceptR13p, openrnHar13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric Fluid + Dose Calculation

public enum PedsFluidsRefSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pediatric-fluid-dose",
        title: "Pediatric IV fluid + dose calculation reference",
        subtitle: "Holiday-Segar 4-2-1 · weight-based · Broselow tape",
        eyebrow: "REFERENCE · PEDIATRICS",
        nclexTags: pedsRefR13,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Pediatric medication dosing is WEIGHT-BASED (mg/kg). Pediatric fluid maintenance uses Holiday-Segar 4-2-1 rule. Use Broselow tape for emergencies. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["aap_round13"]
            )),
            .keyValueTable(title: "Holiday-Segar maintenance fluid (4-2-1 rule)", [
                KeyValueRow(key: "First 10 kg", value: "100 mL/kg/24 hr OR 4 mL/kg/hr"),
                KeyValueRow(key: "Next 10 kg (10–20)", value: "Add 50 mL/kg/24 hr OR 2 mL/kg/hr"),
                KeyValueRow(key: ">20 kg", value: "Add 20 mL/kg/24 hr OR 1 mL/kg/hr"),
                KeyValueRow(key: "Example: 25 kg child", value: "(10×4) + (10×2) + (5×1) = 65 mL/hr")
            ]),
            .keyValueTable(title: "Maintenance fluid composition", [
                KeyValueRow(key: "Standard", value: "D5 1/2 NS + 20 mEq KCl/L (after urine output established) per primary source"),
                KeyValueRow(key: "Avoid hypotonic in severe illness", value: "Use isotonic (LR or NS) per AAP 2018 update — reduces hyponatremia risk per primary source"),
                KeyValueRow(key: "Newborns", value: "Often D10 in first days for hypoglycemia risk")
            ]),
            .keyValueTable(title: "Resuscitation fluid", [
                KeyValueRow(key: "Pediatric shock", value: "10–20 mL/kg NS or LR bolus over 5–20 min; reassess; repeat per primary source"),
                KeyValueRow(key: "Trauma / massive bleeding", value: "10 mL/kg PRBC bolus once cross-matched"),
                KeyValueRow(key: "DKA", value: "10 mL/kg NS bolus initially; SLOW subsequent fluid to avoid cerebral edema per primary source")
            ]),
            .keyValueTable(title: "Common pediatric medication weight-based doses", [
                KeyValueRow(key: "Acetaminophen", value: "10–15 mg/kg PO/PR every 4–6 hours; max 75 mg/kg/24 hr or 4 g/24 hr"),
                KeyValueRow(key: "Ibuprofen (≥6 mo)", value: "5–10 mg/kg PO every 6–8 hours; max 40 mg/kg/24 hr"),
                KeyValueRow(key: "Amoxicillin (AOM, sinusitis)", value: "80–90 mg/kg/day divided BID per primary source"),
                KeyValueRow(key: "Amoxicillin-clavulanate", value: "Dose by amoxicillin component"),
                KeyValueRow(key: "Cefdinir", value: "14 mg/kg/day divided BID"),
                KeyValueRow(key: "Albuterol nebulizer", value: "0.15 mg/kg per dose (min 2.5 mg, max 5 mg)"),
                KeyValueRow(key: "Levetiracetam (status)", value: "60 mg/kg IV load (max 4500 mg) per primary source"),
                KeyValueRow(key: "Epinephrine (cardiac arrest)", value: "0.01 mg/kg IV/IO of 1:10,000; 0.1 mg/kg ETT"),
                KeyValueRow(key: "Atropine", value: "0.02 mg/kg IV/IO; min 0.1 mg, max 0.5 mg child"),
                KeyValueRow(key: "Adenosine (SVT)", value: "0.1 mg/kg IV first dose (max 6 mg); 0.2 mg/kg second (max 12 mg)")
            ]),
            .bullets(title: "Calculation safety", [
                AttributedBullet("ALWAYS use weight-based dosing in kg for pediatric patients; reconcile weight at every encounter.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Use BROSELOW TAPE for emergency drug + equipment dosing in unweighed pediatric patients.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Independent double-check all pediatric medications, especially high-alert (insulin, opioids, anticoagulants).", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Smart-pump dose-error reduction with hard limits.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Trend pediatric vital signs by AGE-APPROPRIATE norms — what's bradycardia in adults may be normal in adolescents and vice versa.", citationIDs: ["openrn_ha_round13_proc"])
            ])
        ],
        citations: [aapConceptR13, openrnHar13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - BETA / SAFER De-escalation Reference

public enum BETAFrameworkSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "beta-safer-deescalation",
        title: "BETA / SAFER de-escalation framework",
        subtitle: "Behavioral emergency · 10 domains · least restrictive intervention",
        eyebrow: "REFERENCE · PSYCHIATRIC",
        nclexTags: psychSafetyR13,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "BETA (Best Practices in Evaluation and Treatment of Agitation) is the AAEP-endorsed de-escalation framework. SAFER (Specialized Aggression Foundation for Evaluation and Response) is a similar tool. Both emphasize VERBAL de-escalation as first-line, least restrictive intervention, and team-based response. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["apna_round13"]
            )),
            .keyValueTable(title: "BETA 10 Domains of De-escalation", [
                KeyValueRow(key: "1. Respect personal space", value: "Maintain 2 arm-lengths distance"),
                KeyValueRow(key: "2. Do not be provocative", value: "Open body language; non-threatening"),
                KeyValueRow(key: "3. Establish verbal contact", value: "ONE speaker; introduce yourself by name + role"),
                KeyValueRow(key: "4. Be concise", value: "Short sentences; allow processing time"),
                KeyValueRow(key: "5. Identify wants and feelings", value: "\"What are you feeling?\" \"What do you need?\""),
                KeyValueRow(key: "6. Listen closely to what the patient is saying", value: "Active listening; reflect feelings back"),
                KeyValueRow(key: "7. Agree or agree to disagree", value: "Validate without arguing facts; \"You're right that we should have...\""),
                KeyValueRow(key: "8. Lay down the law and set clear limits", value: "Clear behavioral expectations + consequences without threats"),
                KeyValueRow(key: "9. Offer choices and optimism", value: "Empower patient with options; preserve dignity"),
                KeyValueRow(key: "10. Debrief patient + staff", value: "Process the event; extract lessons for prevention")
            ]),
            .keyValueTable(title: "Severity ladder (intervention by escalation level)", [
                KeyValueRow(key: "Level 1 — Anxious / agitated", value: "Verbal de-escalation; reassurance; reduce stimuli; offer water / food / phone call"),
                KeyValueRow(key: "Level 2 — Verbally aggressive", value: "Continue verbal; offer PRN PO medication (lorazepam / olanzapine / haloperidol)"),
                KeyValueRow(key: "Level 3 — Physically threatening", value: "Add team / security; offer IM medication if PO declined; safety planning"),
                KeyValueRow(key: "Level 4 — Imminent violence", value: "Physical containment by trained team; chemical restraint; SECLUSION / RESTRAINTS LAST RESORT"),
                KeyValueRow(key: "Level 5 — Active assault", value: "Code response per facility; police if needed; protect staff and other patients")
            ]),
            .keyValueTable(title: "Pharmacologic options (oral first, IM if needed)", [
                KeyValueRow(key: "Anxiety / mild agitation", value: "Lorazepam 1–2 mg PO/SL (preferred when alcohol withdrawal suspected)"),
                KeyValueRow(key: "Psychosis / agitation NOS", value: "Olanzapine 5–10 mg ODT/IM; risperidone 1–2 mg PO; haloperidol 5–10 mg IM (avoid IV per QT)"),
                KeyValueRow(key: "Combination (severe)", value: "Haloperidol + lorazepam + diphenhydramine (\"B-52\") IM — common ED protocol; assess QT, anticholinergic risk"),
                KeyValueRow(key: "AVOID combination IM olanzapine + parenteral benzo", value: "Hypotension / over-sedation per FDA labeling"),
                KeyValueRow(key: "Reassessment", value: "Vital signs, mental status every 15 min × 1 hour after dose")
            ]),
            .bullets(title: "Restraint / seclusion principles (Joint Commission)", [
                AttributedBullet("LEAST RESTRICTIVE intervention for SHORTEST DURATION possible per primary source.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Provider order required within ~1 hour (face-to-face evaluation); time-limited orders (4 hr adult, 2 hr adolescent, 1 hr child) per Joint Commission per primary source.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Reassessment Q15 min minimum (more frequent in some facilities); document behavior, alternatives tried, plan for release.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Continuous staff observation if seclusion or 4-point restraints.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("DEBRIEF patient + staff within 24 hours; document.", citationIDs: ["openrn_ha_round13_proc"])
            ]),
            .bullets(title: "Special populations", [
                AttributedBullet("ELDERLY — first rule out medical cause (UTI, hypoxia, hypoglycemia, intoxication, CO2 retention, electrolytes, encephalopathy); haloperidol low-dose 0.25–0.5 mg preferred.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("PEDIATRIC — non-pharmacologic + parental involvement first; medications weight-based; restraints rarely indicated.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("DEMENTIA — avoid antipsychotics if possible (mortality boxed warning); environmental modification + caregiver coaching first.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("INTOXICATION — supportive care + benzo for alcohol, antipsychotic for stimulant; AVOID mixing benzo + opioid in opioid intoxication.", citationIDs: ["openrn_ha_round13_proc"])
            ])
        ],
        citations: [apnaConceptR13, openrnHar13],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Stress-Dose Steroid Reference

public enum StressDoseSteroidSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "stress-dose-steroid",
        title: "Adrenal insufficiency stress-dose steroid reference",
        subtitle: "Hydrocortisone schedule · illness / surgery · prevent adrenal crisis",
        eyebrow: "REFERENCE · ENDOCRINE",
        nclexTags: endoRefR13,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Patients with adrenal insufficiency (primary — Addison's; secondary — pituitary; tertiary — chronic exogenous steroid suppression) cannot mount an endogenous cortisol response to stress. Stress-dose steroid is critical for illness, surgery, trauma to prevent adrenal crisis (life-threatening). THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["aap_round13"]
            )),
            .keyValueTable(title: "Maintenance dose (typical adult)", [
                KeyValueRow(key: "Hydrocortisone", value: "15–25 mg/day in 2–3 divided doses (largest in morning to mimic diurnal rhythm)"),
                KeyValueRow(key: "Mineralocorticoid (primary AI)", value: "Fludrocortisone 0.05–0.2 mg/day"),
                KeyValueRow(key: "Alternative GC", value: "Prednisone 3–5 mg/day OR dexamethasone 0.5 mg/day (longer-acting; less physiologic mimicry)")
            ]),
            .keyValueTable(title: "MINOR illness — \"sick day rules\"", [
                KeyValueRow(key: "Definition", value: "Fever, vomiting, diarrhea, infection without hypotension"),
                KeyValueRow(key: "Action", value: "DOUBLE or TRIPLE the maintenance hydrocortisone dose for 2–3 days; resume normal dose when better per primary source"),
                KeyValueRow(key: "If unable to keep down PO", value: "Use IM hydrocortisone (Solu-Cortef Act-O-Vial 100 mg) and seek medical care")
            ]),
            .keyValueTable(title: "MAJOR illness / surgery", [
                KeyValueRow(key: "Major surgery (general anesthesia / longer)", value: "Hydrocortisone 100 mg IV pre-op, then 50–100 mg IV every 8 hours × 24 hours; taper to maintenance over 24–72 hours per primary source"),
                KeyValueRow(key: "Minor surgery (LA / brief GA)", value: "Hydrocortisone 50–100 mg IV pre-op single dose"),
                KeyValueRow(key: "Childbirth", value: "Hydrocortisone 100 mg IV at active labor onset, then 50 mg every 6 hours × 24 hours; resume maintenance day 2")
            ]),
            .keyValueTable(title: "ADRENAL CRISIS — emergency", [
                KeyValueRow(key: "Recognition", value: "Severe weakness, hypotension, vomiting, abdominal pain, hyperkalemia, hyponatremia, hypoglycemia, AMS, fever"),
                KeyValueRow(key: "Treatment", value: "Hydrocortisone 100 mg IV bolus immediately, then 200 mg/24 hr continuous infusion or 50 mg IV every 6 hours per primary source"),
                KeyValueRow(key: "Fluid resuscitation", value: "Normal saline + dextrose; correct electrolytes"),
                KeyValueRow(key: "Identify precipitant", value: "Infection, surgery, trauma, missed steroid dose"),
                KeyValueRow(key: "Disposition", value: "ICU / step-down for monitoring; taper to maintenance over 2–3 days")
            ]),
            .bullets(title: "Patient education essentials", [
                AttributedBullet("Carry medical-alert ID (bracelet or wallet card) listing adrenal insufficiency + need for stress dose.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Carry INJECTABLE hydrocortisone (Solu-Cortef Act-O-Vial 100 mg) at all times — for emergency self / family use; teach injection technique.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("\"Sick day rules\" written down — DOUBLE or TRIPLE oral hydrocortisone for fever / vomiting / diarrhea / infection.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Tell EVERY provider about adrenal insufficiency before any procedure / dental / surgery; they may need to give stress dose.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Anticipate dose adjustment — hot weather (more sweating → fluid loss), exercise, stress; consult endocrinologist.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Annual review with endocrinology; bone density, glucose, electrolytes monitored.", citationIDs: ["openrn_ha_round13_proc"])
            ]),
            .bullets(title: "Patients who NEED stress-dose protocols", [
                AttributedBullet("Primary adrenal insufficiency (Addison's) — always.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Secondary AI (pituitary disease).", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Chronic prednisone ≥5 mg/day for ≥3 weeks (or equivalent) — assume HPA suppression for 6–12 months after stopping per primary source.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Inhaled / topical / intra-articular steroid users with high cumulative dose — possible suppression in select cases.", citationIDs: ["openrn_ha_round13_proc"]),
                AttributedBullet("Bilateral adrenalectomy.", citationIDs: ["openrn_ha_round13_proc"])
            ])
        ],
        citations: [aapConceptR13, openrnHar13],
        lastSourceFidelityReview: "2026-05-04"
    )
}
