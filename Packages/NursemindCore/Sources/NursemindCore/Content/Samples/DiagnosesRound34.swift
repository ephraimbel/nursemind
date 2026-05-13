import Foundation

// Curator-model diagnoses (round 34 — Safe & Effective Care: safety events + iatrogenic + HAIs + occupational).

private let openrnDxR34 = CitationSource(
    id: "openrn_dx_round34",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR34 = CitationSource(
    id: "cdc_dx_round34",
    shortName: "CDC + NIOSH + OSHA + AHRQ concept citations",
    publisher: "CDC · NIOSH · OSHA · AHRQ",
    license: .publicDomain,
    url: "https://www.cdc.gov/infectioncontrol/",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR34 = CitationSource(
    id: "specialty_dx_round34",
    shortName: "ISMP + Joint Commission + ACR + ASA + IDSA + ENA fact citations",
    publisher: "ISMP · Joint Commission · ACR · ASA · IDSA · ENA",
    license: .factCitationOnly,
    url: "https://www.jointcommission.org/",
    lastRetrieved: "2026-05-13"
)

private let safetyEventTagsR34 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .safety
)
private let haiTagsR34 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .safetyAndInfectionControl,
    priorityConcept: .infection
)

public enum MedicationErrorHarmSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "medication-error-harm-event",
        title: "Medication error with patient harm",
        subtitle: "Adverse drug event from wrong drug/dose/route/patient/time · sentinel event categorization · just culture · system improvement · transparent disclosure",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Medication error causes ~7,000-9,000 deaths annually in US + $40B cost (JCAHO/ISMP). Categories — wrong drug/dose/route/patient/time/frequency, LASA confusion, omission, duplication, contraindication. Event types span sentinel event (death/permanent harm) → near-miss → no harm. Root causes are 60-80% SYSTEM failures (labeling, packaging, ordering, dispensing, administration, monitoring, communication); approach is JUST CULTURE — analyze + improve, not punish unless reckless; transparent disclosure to patient/family per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Errors arise from breakdowns at any step in the medication-use chain: prescribing (wrong drug/dose), transcription, dispensing, administration (wrong patient/route/timing/rate), monitoring (missed lab + interaction). System factors — inadequate technology (no CPOE/BCMA), labeling confusion (LASA), distraction, fatigue, short staffing, complex regimens — converge with human factors per Reason's Swiss cheese model.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Variable per drug + dose + patient — from no harm (near-miss) to fatal.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Unanticipated symptoms — hypotension, respiratory depression, altered mental status, allergic reaction, organ dysfunction.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Specific ADEs — anaphylaxis, hypoglycemia, hyperkalemia, bleeding, neurotoxicity, nephrotoxicity, cardiac arrhythmia, respiratory depression.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Discovery — clinical deterioration, unexpected labs, family complaints, near-miss intercepted by pharmacy/nursing.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Institutional incident reporting + investigation; chart review + interview team + medication chain reconstruction (ordering → dispensing → administration → monitoring).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("FDA MedWatch + ISMP MERP reporting for unique events; Joint Commission sentinel event reporting if criteria met (death, permanent harm, severe temporary).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Drug levels + organ function + electrolytes + ECG as clinically appropriate.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Risk stratification — degree of harm + sentinel event criteria.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Immediate clinical status + airway/breathing/circulation; signs of toxicity by drug class.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Reversibility — antidote available (naloxone, flumazenil, vitamin K, protamine, dexrazoxane, lipid emulsion)?", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Chronology — drug, dose, route, time, who administered, who prescribed, who dispensed.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Preserve evidence — original container, label, vials, syringes, IV bag, equipment.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("STOP offending agent + reverse if possible (antidote-specific); supportive care + monitoring + organ-specific management (ICU as needed).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Notify provider + risk management + nursing supervisor immediately; document chronology.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Disclosure to patient + family (with risk management coordination) — open, honest, supportive.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Incident report submission per institutional timeframe; FDA MedWatch + ISMP for unique events.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Cooperate with root cause analysis (RCA) + improvement action plan; engage in system-based prevention initiatives.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("PREVENTION systems — Smart pumps + BCMA + CPOE + clinical decision support + medication reconciliation + double-checks for high-alert + Tall Man lettering + 5 rights + bedside verification.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Just Culture — distinguish human error (slip) → coach + system redesign; at-risk behavior → coach + behavior change; reckless → discipline.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Emotional support for nurse + team (\"second victim\" syndrome) — counseling + peer support + institutional programs.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Permanent harm (organ failure, disability, death).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Legal action + malpractice claims + financial liability.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Loss of patient/family trust + reputational impact.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Staff burnout + second-victim psychological trauma.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Sentinel event reporting + Joint Commission requirements + accreditation impact.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum WrongSiteSurgerySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "wrong-site-surgery",
        title: "Wrong-site / wrong-procedure / wrong-patient surgery",
        subtitle: "NEVER EVENT · Universal Protocol failure · sentinel event · multidisciplinary review · system-level prevention",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Wrong-site, wrong-procedure, or wrong-patient surgery — preventable yet persistent sentinel event reported to Joint Commission; CMS NEVER EVENT (non-reimbursable). Frequency ~1 per 100,000 surgeries (likely underreported); 200-2,000 events/year in US. Categories — wrong site (correct procedure on wrong body part/laterality), wrong procedure (correct site but unintended procedure), wrong patient (procedure performed on wrong individual). Universal Protocol (Joint Commission) — three components: preoperative verification, surgical site marking, time-out per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Root causes — communication failures, inadequate preoperative verification, missing/missed surgical site marking, missing/missed time-out, distraction, time pressure, complex multi-procedure cases, emergency cases, organizational safety culture deficits. Universal Protocol designed to interrupt these failure modes at three points: verification of patient/procedure/site/consent; visible marking after positioning + draping; verbal time-out immediately before incision.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Intraoperative recognition — surgical team identifies discrepancy during procedure; STOP further intervention.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Postoperative recognition — imaging reveals wrong-site procedure; expected pain absent or in unexpected location; original problem persists.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Patient discovery — symptoms attributed to expected surgery actually from missed condition; patient awareness of discrepancy.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Intraoperative discrepancy noted between consent, marking, plan; team member questioning.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Postoperative imaging (CT, MRI, X-ray) to verify procedure performed; comparison with original consent + planned procedure.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Chart review of consent, H+P, surgical record, anesthesia record, OR notes; multidisciplinary review.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Joint Commission sentinel event report within 5 business days; state-required reporting; CMS adverse event.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Root cause analysis — Universal Protocol compliance assessment; system + process review.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Universal Protocol compliance — verification, marking, time-out completed + documented?", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Patient harm from wrong procedure — disability, complications, need for corrective surgery.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Missed treatment of original condition — delayed care + worsened outcomes.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Surgical team \"second victim\" psychological impact.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION — strict Universal Protocol compliance: preoperative verification, site marking, time-out participation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("SPEAK UP — STOP THE LINE if discrepancy noted; foster team culture of safety + escalation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Documentation — verification, marking, time-out completion + participants.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("If event occurs — STOP further intervention if intraoperative; supportive care; preserve evidence; notify risk management + leadership immediately.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Disclosure to patient + family — open, honest, supportive; apology + accountability.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Cooperate with RCA + improvement initiatives (universal protocol enhancement, simulation training, time-out compliance).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Psychological support for surgical team members — second-victim peer counseling.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Harm from wrong procedure — disability, complications, corrective surgery needed.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Missed treatment of original condition — delayed care + worse outcomes.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Legal action + malpractice settlements.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Joint Commission sentinel event reporting + accreditation impact.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Surgical team culpability + psychological trauma.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RetainedSurgicalItemSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "retained-surgical-item",
        title: "Retained surgical item (RSI)",
        subtitle: "NEVER EVENT · sponges, needles, instruments, sharps · sentinel event · count protocols + radiographic technology · disclosure + correction",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Retained surgical item — sponges (~60%), needles (~10%), instruments (~5%), guidewires/sharps/miscellaneous (~25%); ~1 per 5,500-10,000 surgeries (likely underreported); CMS NEVER EVENT + Joint Commission sentinel event. Risk factors — emergency surgery, unplanned procedure change, BMI >30, multiple teams/surgeons, prolonged procedure, blood loss, anesthesia changes, complex multi-cavity, distraction/interruption, time pressure. Consequences — pain, infection, abscess, fistula, bowel obstruction, organ damage, second surgery, prolonged hospitalization per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Foreign body retention triggers inflammatory response, can become infected, cause mechanical obstruction, fistula formation, or chronic granulomatous reaction (gossypiboma with retained sponges — months/years later, may calcify). Sponges most common because of count complexity + visual similarity to tissue.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Intraoperative — count discrepancy + radiographic discovery + visual identification.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Early postoperative — surgical site infection signs, fever, pain disproportionate to procedure, prolonged ileus.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Delayed — chronic pain, recurrent infection, fistula formation, palpable mass, incidental imaging finding.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Gossypiboma — months-years later; calcified or organized foreign body reaction.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("X-ray — sponges with radiopaque markers + metal items.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("CT — best for plastic, suture, smaller items; assesses inflammatory reaction + abscess.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("MRI + ultrasound — selected cases.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Intraoperative repeat count protocols when discrepancy + intraoperative X-ray to reconcile.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pathology when item identified.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Count protocol adherence — sponges, needles, instruments at multiple time points (initial, before closure, after closure, team change).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Risk factors for current case — emergency, BMI, complexity, team changes, blood loss.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Postoperative — fever, pain pattern, infection signs, prolonged ileus.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Imaging review when count discrepant or symptoms suspicious.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("Strict count protocols at all standard time points + when team changes + before closure.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Speak up + escalate when count discrepant; do not allow closure until reconciled or X-ray confirmed.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Documentation of counts + reconciliation + intraoperative X-rays in chart.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Technology adoption — RFID-tagged sponges + electronic counting systems (increasingly standard).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Intraoperative discovery — locate + remove item; verify count complete; document; X-ray confirm.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Postoperative discovery — return to OR for removal; supportive care + IV antibiotics if infection.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Disclosure to patient + family — open communication + plan for removal + risks.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Joint Commission sentinel event reporting + CMS adverse event + institutional RCA.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Surgical site infection + abscess + sepsis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Fistula formation + organ damage + bowel obstruction + perforation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Second surgery for removal — anesthesia + surgical risks.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Chronic pain + disability + legal action + sentinel event reporting.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Mortality (rare but documented in severe cases).", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PatientFallInjurySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "patient-fall-injury",
        title: "Patient fall with injury",
        subtitle: "Inpatient fall · risk stratification (Morse/Hendrich) · fall bundle prevention · post-fall assessment + injury management",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Inpatient falls — leading hospital-acquired condition; ~1M falls/year in US hospitals + nursing homes; 30-50% result in injury (laceration, fracture, head injury, death). CMS NEVER EVENT for serious-injury falls (non-reimbursable since 2008); Joint Commission requires tracking + reduction. Risk factors — age, cognitive impairment, mobility limitations, polypharmacy (sedatives, anti-hypertensives, diuretics), urinary urgency, orthostasis, fall history, gait disturbance, environmental hazards, post-procedure. Risk assessment tools — Morse Fall Scale, Hendrich II, STRATIFY, Tinetti, Hester Davis per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — combination of intrinsic (age-related sensory + motor decline, postural instability, dementia, weakness, polypharmacy effects on BP + cognition + balance) + extrinsic (environmental hazards, footwear, lighting, equipment, staffing) factors. Acute precipitants — UTI, dehydration, new medications, postural drop, syncope, seizure. Injuries result from impact forces + osteoporosis + bleeding risk (anticoagulants).",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Witnessed or unwitnessed fall.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Injuries — head (subdural/epidural/contusion/concussion), fractures (especially HIP, vertebra, wrist), lacerations, hematomas, soft tissue.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pain, deformity, swelling, inability to bear weight, neurologic changes.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Vital sign changes — hypotension, tachycardia, altered mental status.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Delayed symptoms — particularly delayed intracranial hemorrhage in anticoagulated; serial neuro assessments needed.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Post-fall assessment — vital signs, neurologic exam (LOC, GCS, pupils, focal deficits), pain assessment, injury location.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Imaging — CT head if head trauma or anticoagulated (LOW THRESHOLD); X-ray injured area; hip radiograph if suggestive.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("INR if anticoagulated; ECG if syncope or arrhythmia suspicion; CBC + comprehensive panel.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Mechanism — mechanical fall vs syncope vs seizure vs drug effect; witnessed event details.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Anticoagulation status + bleeding risk; particularly head injury.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Functional impact — ability to bear weight, transfer, ADLs.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Risk for additional falls — repeat assessment, medication review, environment.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("Fall risk assessment on admission + Q shift + after change in condition.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Fall bundle — yellow gown/socks/wristband, bed/chair alarm, low bed position, side rails, scheduled rounding + toileting, non-skid footwear, family presence, sitter if needed.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Medication review — sedatives, anti-hypertensives, diuretics, anticoagulants; consider alternatives.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Environmental safety — remove clutter, lighting, grab bars, bedside commode, accessible call light.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("POST-FALL — immediate assessment + vital signs + neuro exam + pain + injuries; do NOT move if injury suspected.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Call provider + rapid response if unstable; imaging + workup as indicated.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Document chronology + injury + interventions; incident report; disclose to family.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Q2-4H neuro checks after head injury × 24-48 hours.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Discharge — home safety assessment, PT/OT, follow-up, fall prevention program (tai chi, balance, exercise).", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Hip fracture — 25-30% 1-year mortality; surgical management + functional decline.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Intracranial hemorrhage — delayed presentation; anticoagulant reversal + neurosurgery.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Vertebral fractures + spinal cord injury.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Functional decline + disability + nursing home placement.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Mortality — direct injury or complications (PE from immobility, pneumonia).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Sentinel event reporting for serious-injury falls (CMS, JC).", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AirEmbolismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "air-embolism-iatrogenic",
        title: "Iatrogenic air embolism",
        subtitle: "Air entry into venous/arterial system from IV/central line/procedure · LEFT lateral Trendelenburg + 100% O2 + supportive · emergent",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Entry of air into the venous (or arterial) system; life-threatening when volume >50-100 mL or rapid entry. Sources — IV catheter insertion/removal (central > peripheral), open central line, syringe/tubing changes without bubble clearing, surgical procedures (open vascular, lung, brain), arterial line, dialysis, mechanical ventilation barotrauma. Venous air → right heart → pulmonary obstruction + pulmonary HTN + cardiac arrest. Paradoxical embolism through PFO → arterial → stroke + organ infarction per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Air entering venous circulation accumulates in right heart → mechanical airlock obstructs pulmonary outflow → acute right heart failure + cardiac arrest. Microbubbles cause pulmonary endothelial injury + capillary leak + ARDS. Through patent foramen ovale or other right-to-left shunt, bubbles bypass pulmonary filtration → arterial circulation → cerebral + coronary + retinal ischemia.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Sudden onset during/after procedure or IV manipulation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Venous — sudden dyspnea + chest pain + hypoxia + cough + cyanosis + hypotension; \"mill wheel\" cardiac murmur (classic auscultatable finding); JVD + right heart strain on ECG; cardiac arrest in massive embolism.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Arterial (paradoxical) — stroke symptoms, coronary symptoms (chest pain, ST changes, arrhythmia), retinal ischemia, mesenteric ischemia.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Neurologic — seizures, focal deficits, coma.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — sudden symptoms after procedure or IV access; auscultation for mill wheel murmur.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("ECHO — best (air seen as bubbles + right heart strain).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("CT chest (air in vessels), CT brain (cerebral air), transcranial Doppler (paradoxical detection).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("ABG — hypoxia + hypercapnia; D-dimer not useful.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Suspected event during procedure or IV manipulation; classic sudden symptoms.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Differentiate from thromboembolic PE — similar clinical presentation, distinct management.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Paradoxical embolism — neurologic + cardiac assessment; PFO history.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Stop further air entry — clamp catheter, occlude site.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION — clear air from tubing before connection; prime carefully; occlusive dressing during central line manipulation; Valsalva/breath hold during line manipulation; secure Luer-locks.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("EMERGENT — STOP further air entry; LEFT LATERAL DECUBITUS + TRENDELENBURG position (Durant maneuver) — traps air in right atrial apex; 100% OXYGEN (reduces nitrogen + accelerates resorption); IV fluids + vasopressors for hypotension; CPR if arrest.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Right heart aspiration — central line in right atrium → aspirate air bubble (intensivist + cardiology).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("HYPERBARIC OXYGEN THERAPY — best for arterial/cerebral; reduces bubble size + accelerates absorption; transfer to chamber-capable facility.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Supportive — ICU + monitoring + hemodynamic support + neurologic assessment + serial imaging.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Document chronology + intervention + outcomes; incident report + RCA participation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Family communication + disclosure with risk management.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Cardiac arrest + sudden death — massive embolism mortality 30-50%.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Stroke + neurologic deficits from paradoxical embolism.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Cardiac ischemia + arrhythmia.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pulmonary HTN + right heart failure.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Long-term neurologic disability + rehabilitation.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ContrastAnaphylaxisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "contrast-media-anaphylaxis",
        title: "Iodinated contrast media anaphylactoid + anaphylactic reaction",
        subtitle: "Radiocontrast acute reaction · IgE vs non-IgE · severity grading + management · ACR premedication protocols",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Iodinated radiocontrast media (RCM) reactions — allergic-like (anaphylactoid/non-IgE, ~90%) vs true allergic (IgE-mediated). Frequency — mild 1-3%, moderate 0.04-0.4%, severe 0.04%, fatal 1-3 per 100,000. Risk factors — prior RCM reaction (5-30% recurrence without premedication; <1% with), severe asthma + atopy, beta-blocker. NOT increased — \"shellfish allergy\" or iodine antiseptic allergy (misconceptions, no cross-reactivity). Gadolinium MRI contrast — different mechanism + lower frequency per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Most RCM reactions are anaphylactoid — direct mast cell + basophil activation by RCM (independent of IgE) → histamine + tryptase + leukotriene release → vasodilation + bronchospasm + capillary leak. True IgE-mediated allergy less common. High-osmolar ionic contrast historically worse; modern low-osmolar nonionic contrast significantly safer. Late reactions (3 h-7 days) — T-cell mediated; rare severe forms (SJS, DRESS, AGEP).",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Mild — flushing, urticaria, mild bronchospasm, nausea + vomiting, mild hypotension; self-resolves often.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Moderate — significant bronchospasm + hypotension + tachycardia + urticaria; supportive treatment needed.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Severe/anaphylactoid — cardiovascular collapse, severe bronchospasm, laryngeal edema, cyanosis, loss of consciousness, pulmonary edema, ARDS, cardiac arrest.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Late reactions (3 h-7 days) — delayed urticaria, maculopapular rash, fixed drug eruption; rare severe.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — symptoms immediately post-contrast; documentation of contrast received + dose + timing + severity.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Tryptase level (elevated in anaphylaxis), serum histamine (less useful); not routine in diagnosis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("ECG + cardiac assessment to rule out cardiac event mimics.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity grading — mild vs moderate vs severe vs anaphylaxis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Risk factor history — prior reaction, severe asthma, atopy, beta-blocker.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Differentiate vagovagal (bradycardia) vs anaphylaxis (tachycardia + flushing + warmth).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Biphasic reaction risk — recurrence 4-12 hours after initial; observe 6-24 hours.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("Mild — observe, oral diphenhydramine, fluids; supportive.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Moderate — IV fluids, IV diphenhydramine + steroids, IV albuterol nebulizer.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Severe/anaphylaxis — EPINEPHRINE 0.3-0.5 mg IM FIRST LINE; H1+H2 antihistamines + steroids + oxygen + IV fluids + vasopressors + intubation if airway compromise + ICU + ACLS if arrest.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Premedication for prior reaction — methylprednisolone 32 mg PO 12 h + 2 h pre + diphenhydramine 50 mg 1 h pre; emergent — IV methylprednisolone + diphenhydramine + ondansetron 1 h pre.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Verify allergy history + clarify nature; document prior reactions + premedication + alternative contrast type for future.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Bedside emergency supplies — epinephrine + H1/H2 + steroids + airway equipment + oxygen ready.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Q5 min vital signs during contrast + 30 min post; medical alert documentation; institutional + FDA MedWatch reporting.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Cardiac arrest + death (rare but documented).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Laryngeal edema + airway obstruction.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Severe bronchospasm + respiratory failure.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pulmonary edema + ARDS.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Biphasic reaction — recurrence 4-12 h after initial; observation 6-24 h.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Concurrent contrast-induced nephropathy — separate mechanism + management.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ExtravasationVesicantSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "extravasation-vesicant",
        title: "Vesicant chemotherapy extravasation",
        subtitle: "Tissue infiltration of vesicant chemo · severe local tissue damage + necrosis · STOP-aspirate-antidote protocol · drug-specific compress + antidote",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Inadvertent leakage of vesicant chemotherapy or irritating drug from vein into surrounding tissue; vesicants cause severe tissue damage + necrosis. Peripheral extravasation more common than central. Vesicant agents — anthracyclines (doxorubicin, daunorubicin, epirubicin, idarubicin), vinca alkaloids (vincristine, vinblastine, vinorelbine), mechlorethamine, mitomycin, paclitaxel/docetaxel (variable), platinum compounds (cisplatin variable). Risk factors — peripheral access, small distal veins, multiple punctures, prior treatment, fragile veins, patient movement per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Vesicant drugs cause direct cellular damage via DNA intercalation (anthracyclines), microtubule disruption (vincas), alkylation (mechlorethamine, mitomycin), or platinum chemistry. Extravasated drug binds to DNA/proteins in subcutaneous tissue → progressive cellular destruction over days-weeks → ulceration + necrosis + scarring. Central extravasation may involve mediastinum or neck — catastrophic.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("During infusion — pain, burning, stinging at IV site; sudden change in flow rate; resistance to flush; swelling at site.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Late (hours-days) — increasing redness, swelling, induration, blistering, ulceration, tissue necrosis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Severe — full-thickness skin necrosis + tendon/nerve injury + amputation potential.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pain often disproportionate; functional impairment.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — symptoms + history of vesicant infusion + site assessment.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Serial photographs of site for documentation + progression.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Ultrasound — fluid collection (selected).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Biopsy if uncertain etiology (rare).", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Drug identification — anthracycline vs vinca vs mechlorethamine vs platinum vs taxane (different antidotes + compresses).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Volume extravasated + concentration.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Site characteristics — depth, vasculature, proximity to tendons + nerves.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Function + neurovascular status of extremity.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION — central access preferred for vesicant chemo; freshly cannulated vein each cycle; AVOID dorsum of hand + small distal + previously punctured; secure; reduce patient movement.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Q5 min site assessment during vesicant infusion; patient empowered to report any discomfort.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Immediate protocol — STOP infusion; ASPIRATE residual drug from cannula (1-2 mL); REMOVE cannula carefully; ELEVATE; photograph site; notify provider + oncology pharmacy.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Anthracyclines — DEXRAZOXANE 1000 mg/m² IV × 3 days OR topical DMSO 50-99% TID × 7-14 days; COLD compresses (vasoconstriction).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Vinca alkaloids — HYALURONIDASE 150-300 units SC into site; WARM compresses (vasodilation, drug dilution + spread).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Mechlorethamine — SODIUM THIOSULFATE 0.16 mol/L SC into site; COLD compresses.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Plastic surgery referral early for severe extravasation — debridement + skin grafts + reconstruction; consultation 24-48 hours.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pain management + wound care + functional rehabilitation; supportive care.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Incident reporting + RCA + system improvement; family disclosure + emotional support.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Full-thickness skin necrosis + functional loss.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Compartment syndrome — surgical emergency.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Nerve injury + permanent functional deficit.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Amputation in severe cases.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Cellulitis + abscess + sepsis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Need for skin graft + reconstructive surgery + scarring; delay of cancer treatment.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Legal action + malpractice claims.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LASTToxicitySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "last-toxicity",
        title: "Local anesthetic systemic toxicity (LAST)",
        subtitle: "Bupivacaine/ropivacaine/lidocaine overdose · CNS + cardiovascular toxicity · LIPID EMULSION RESCUE first-line · ASRA protocol · prevention via dose + technique",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Adverse reaction to systemic absorption of local anesthetic; sodium channel blockade affects CNS + cardiovascular system. Culprit agents — BUPIVACAINE (most cardiotoxic), ropivacaine, lidocaine, mepivacaine, prilocaine. Frequency ~1 per 1,000-10,000 regional anesthesia cases. Risk factors — large volume + concentration, rapid absorption (intercostal > paravertebral > head/neck > peripheral nerve > epidural > spinal), accidental intravascular injection (>50% of severe cases), elderly + cardiac disease + pregnant + neonates per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Local anesthetics block sodium channels — at toxic systemic levels, this blockade affects neuronal + cardiac excitability. Initial CNS excitation (perioral numbness, tinnitus, seizures) from blockade of inhibitory neurons → CNS depression (coma, apnea). Cardiac toxicity — direct sodium channel blockade in conduction system → wide-complex tachycardia + arrhythmias; bupivacaine highly cardiotoxic (slow off-rate). Lipid emulsion mechanism — \"lipid sink\" theory + metabolic + ionotropic effects → reduces free drug + improves cardiac function.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("CNS — perioral numbness, tongue paresthesia, dizziness, tinnitus, metallic taste, agitation, confusion, slurred speech → seizures → CNS depression + coma.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Cardiovascular — bradycardia, conduction blocks, ventricular arrhythmias (wide complex, torsades, especially bupivacaine), hypotension, cardiac arrest.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Respiratory — apnea + hypoxia from CNS depression.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Insidious — bupivacaine can cause CV collapse without prior CNS warning.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Onset typically 1-5 min after injection; can be delayed up to 30-60 min.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — symptoms during/after local anesthetic administration with no other explanation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("ECG — arrhythmia, wide QRS; continuous monitor + serial.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Serum levels NOT useful (slow turnaround); no specific lab.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Maximum dose calculated by weight + drug + concentration before injection.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Technique — aspirate before injection; ultrasound guidance; incremental 5 mL aliquots.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Patient factors — elderly, cardiac disease, pregnancy, neonates, concurrent antiarrhythmics.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Bedside lipid emulsion 20% + dosing protocol immediately available.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION — max dose calculation; aspirate; ultrasound guidance; incremental injection; bedside emergency equipment.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Continuous monitoring during local anesthesia — ECG, BP, SpO2, sedation level.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Recognize early — perioral numbness, dizziness, tinnitus → STOP injection + call for help.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("EMERGENT — STOP injection; airway management (100% O2 + intubation as needed); hemodynamic support; CPR if arrest.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("LIPID EMULSION 20% RESCUE — FIRST-LINE per ASRA/AAGBI; BOLUS 1.5 mL/kg over 1 min; infusion 0.25 mL/kg/min × 30+ min; can REPEAT bolus + increase to 0.5 mL/kg/min for persistent CV collapse; CPR continued during.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("AVOID — vasopressin (worsens), large doses epinephrine (use <1 mcg/kg boluses), CCBs, beta-blockers, local anesthetic antiarrhythmics (procainamide/lidocaine — worsen).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Seizures — benzodiazepines (midazolam 1-2 mg IV); AVOID propofol (large doses contribute to CV collapse).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Prolonged CPR + ECMO consideration — bupivacaine cardiotoxicity prolonged; continue CPR + lipid + transfer to ECMO-capable facility.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Document + incident report + RCA participation + system improvement; family disclosure.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Cardiac arrest + death — rare but documented, especially bupivacaine.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Prolonged CPR + anoxic brain injury.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Drug-induced cardiomyopathy.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("ECMO complications when used as rescue.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Psychological trauma + medical PTSD.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NeedlestickExposureSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "needlestick-bloodborne-exposure",
        title: "Occupational needlestick + bloodborne pathogen exposure",
        subtitle: "Percutaneous injury · HBV/HCV/HIV transmission risk · post-exposure prophylaxis (PEP) · OSHA + CDC protocols · counseling + follow-up",
        nclexTags: haiTagsR34,
        definition: AttributedProse(
            "Occupational exposure to bloodborne pathogens — needlestick (60%), sharps (25%), mucocutaneous splash (15%); ~600-800K needlesticks/year in US healthcare workers. Transmission risk after percutaneous from infected source — HBV 6-30% (vaccinated workers protected), HCV 1.8%, HIV 0.3%. Higher risk — deep injury, visible blood, terminal illness in source, hollow-bore needle, large volume blood. OSHA Bloodborne Pathogens Standard (29 CFR 1910.1030) mandates employer prevention + post-exposure management per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Direct inoculation of contaminated blood into healthcare worker via percutaneous or mucocutaneous route; volume + viral load + pathogen susceptibility determine transmission risk. HBV is most transmissible bloodborne pathogen (DNA virus, stable in environment). HCV — RNA virus, intermediate transmissibility. HIV — RNA retrovirus, lowest transmissibility but no vaccine + lifelong infection if seroconvert.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Acute — pain + bleeding at exposure site; psychological distress + anxiety.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Mucocutaneous splash to mucous membrane or non-intact skin.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Infection — variable timeline (HBV 6 weeks-6 months; HCV 2 weeks-6 months; HIV 2-4 weeks acute illness, lifelong if chronic).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Chronic exposure-related anxiety + PTSD-like symptoms.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Baseline testing (within 24 hours) — HIV antibody/antigen, HBsAg + anti-HBs + anti-HBc, anti-HCV, HCV RNA (some centers).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Source patient testing — HIV, HBV, HCV; same-day when possible (consent typically required; emergent without consent permitted in some states).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Seroconversion testing — 6 weeks, 3 months, 6 months for HCV/HIV; HBV after vaccination if not previously immune.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Exposure mechanism — percutaneous depth, hollow-bore vs solid, blood volume, time since exposure.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Source patient — known infection status, behaviors, terminal illness, viral load.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Worker — vaccination status (HBV), prior PEP, pregnancy, comorbidities.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("PEP decision — within 1-2 hours (max 72 h) for HIV; HBIG + vaccine for HBV; no PEP for HCV.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION — safe needle devices (engineering controls per OSHA), safe handling, point-of-use sharps disposal, NEVER RECAP needles (recapping causes ~40% of needlesticks), gloves/PPE.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("IMMEDIATE management — wash site with soap + water (do NOT squeeze to provoke bleeding); flush mucous membrane with copious saline × 15+ min; NO bleach or caustic.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Institutional reporting IMMEDIATELY — employee health + supervisor + incident report; OSHA-required documentation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Source patient testing facilitation + consent navigation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("HIV PEP — within 1-2 hours; 3-drug regimen × 28 days (tenofovir-emtricitabine + raltegravir/dolutegravir); CDC + DHHS guidelines; ID specialty consult.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("HBV PEP — nonimmune worker — HBIG + hepatitis B vaccine series; immune worker — booster if anti-HBs unknown.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("HCV — no PEP available; serial monitoring + treatment if seroconversion (DAAs curative).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Counseling + emotional support + EAP + ID specialist follow-up + workers' compensation filing.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Sexual + work practice modifications during 6-month follow-up.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("HBV seroconversion — 6-30% if not vaccinated; PEP + immune globulin effective; chronic infection risk.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("HCV seroconversion — 1.8%; PEP not available; DAAs curative.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("HIV seroconversion — 0.3%; PEP reduces by 80-95%; lifelong ART if seroconvert.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Psychological — anxiety, depression, PTSD; counseling support.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("PEP adverse effects — GI upset, fatigue, kidney + bone effects.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Career impact — emotional + risk perception + practice changes.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LatexAllergySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "latex-allergy",
        title: "Latex allergy + sensitization",
        subtitle: "Type I IgE-mediated · contact dermatitis to anaphylaxis · spina bifida + HCW + frequent procedures · latex-free environment · cross-reactive foods",
        nclexTags: safetyEventTagsR34,
        definition: AttributedProse(
            "Type I IgE-mediated hypersensitivity to natural rubber latex (Hevea brasiliensis) proteins; spectrum from contact dermatitis (irritant or Type IV) to immediate anaphylaxis. Frequency — 1-6% general population; 9-17% healthcare workers; 15-65% spina bifida (multiple surgical exposures since infancy); operating room workers, food service, atopic individuals. Cross-reactive foods — banana, kiwi, avocado, chestnut. Prevention via latex-FREE environment + alternative materials (nitrile, vinyl) per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Type I IgE-mediated — sensitization via repeated exposure; subsequent re-exposure → IgE-FcεRI cross-linking on mast cells → degranulation → histamine, tryptase, leukotrienes → vasodilation + bronchospasm + capillary leak + anaphylaxis. Type IV — T-cell mediated contact dermatitis from chemical accelerators in rubber (delayed 24-48 h, eczematous). Cross-reactivity with certain plant proteins (latex-food syndrome).",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Immediate Type I — pruritus, urticaria, rhinoconjunctivitis, bronchospasm, anaphylaxis (cardiovascular collapse, severe respiratory distress); onset minutes after exposure.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Type IV contact dermatitis — eczematous reaction at contact site; delayed 24-48 hours; chemical accelerator allergy.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Irritant contact dermatitis — non-allergic; cumulative; resembles eczema.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Intraoperative — unexpected anaphylaxis during surgery in latex-allergic patient.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Cross-reactive food reactions — banana, kiwi, avocado, chestnut.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical history — exposure pattern + reaction pattern + cross-reactive foods.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Skin prick test (commercial latex extract).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("RAST / specific IgE for latex.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Patch testing for Type IV contact (chemical accelerators).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("AVOID in vivo provocation for Type I — anaphylaxis risk.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Pre-screen — history of latex reactions, spina bifida, multiple surgeries, frequent catheters, healthcare worker, atopic.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Document allergy + medical alert + chart prominently + medical alert ID.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Identify cross-reactive foods + dietary modification.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Perioperative + procedural environments — latex-free preparation.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION (primary) — latex-FREE environment for diagnosed + high-risk; alternative materials (nitrile, vinyl, polyisoprene gloves); latex-free medical devices + supplies + tape.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Latex-free OR + first surgical case of day + dedicated room + supplies cart + signage.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Acute anaphylaxis — epinephrine 0.3-0.5 mg IM, H1+H2 antihistamines + steroids + airway + IV fluids + vasopressors.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Contact dermatitis — symptomatic topical steroids + moisturizers + avoid trigger; investigate chemical vs latex protein.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Patient + family + caregiver education + medical alert ID + EpiPen carry + emergency action plan.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Future medical care + dental + surgery + ER — verify latex-free preparation.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Document + report severe reactions; institutional + manufacturer reporting.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Anaphylaxis + cardiovascular collapse + death.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Recurrent occupational dermatitis + career impact for healthcare workers.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Limited employment + occupational disability.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Surgical delays + complications when not pre-screened.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Dietary restrictions from cross-reactive foods.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CAUTISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cauti",
        title: "Catheter-associated urinary tract infection (CAUTI)",
        subtitle: "Indwelling urinary catheter UTI · HAI · CDC NHSN reportable · CMS NEVER EVENT · prevention bundle: appropriate use, aseptic insertion, daily review, early removal",
        nclexTags: haiTagsR34,
        definition: AttributedProse(
            "UTI occurring in a patient with indwelling urinary catheter (≥2 days) or within 48 hours of catheter removal; most common HAI (~30-40%); CDC NHSN reportable; CMS NEVER EVENT (non-reimbursable since 2008). Frequency — bacteriuria 3-7% per catheter-day; ~25-50% of catheter-days progress to symptomatic infection. Risk factors — prolonged catheterization (>5-7 days), female sex, age, diabetes, immunocompromised, breaks in closed system. Pathogens — E. coli (most), Klebsiella, Proteus, Pseudomonas, Candida, Enterococcus per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Bacteria ascend along catheter lumen (intraluminal) or outer surface (periurethral) from skin + perineum + drainage bag; form biofilm on catheter; urine stasis enables proliferation. Indwelling catheter bypasses normal defenses (urine flow + epithelial integrity + mechanical clearance). Bacteremia from urosepsis common in CAUTI.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Classic UTI symptoms (dysuria, frequency, urgency, suprapubic pain) — OFTEN ABSENT in catheterized patients.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Catheterized — fever, chills, mental status change (elderly), hematuria, cloudy + foul urine, suprapubic + flank pain, CVA tenderness.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Sepsis — fever, hypotension, tachycardia, tachypnea, altered mental status, organ dysfunction; bacteremia common.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Asymptomatic bacteriuria — positive culture without symptoms; NO TREATMENT in most catheterized.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Urine — straight catheterized OR freshly removed sample (NOT drainage bag); urinalysis + culture; ≥10⁵ CFU/mL OR ≥10³ CFU/mL with symptoms.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pyuria + nitrites + LE may help; sensitivity-guided therapy.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Blood cultures if sepsis suspected; CBC + comprehensive panel; lactate if sepsis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Imaging — ultrasound or CT if pyelonephritis/abscess (renal, perinephric, prostatic).", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Catheter necessity — daily review; remove when no longer indicated.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Sepsis surveillance — fever, hypotension, mental status, organ function.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Asymptomatic bacteriuria vs symptomatic CAUTI distinction.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Alternative methods — condom catheter, intermittent catheterization, bedside commode, scheduled toileting.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("CAUTI BUNDLE — appropriate use (avoid catheter unless indicated); aseptic insertion + closed drainage; daily review of need + EARLY REMOVAL; secure positioning; bag below bladder; perineal hygiene.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Aseptic insertion technique + sterile setup + sterile gloves + drape.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Monitor for signs of infection — fever, hematuria, suprapubic pain, mental status change.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Treatment — REMOVE catheter if possible (often single most important); culture-guided antibiotics; empiric — fluoroquinolone or ceftriaxone (healthcare-associated); Pseudomonas coverage in high-risk; supportive + sepsis management.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Duration — 7 days cystitis, 10-14 days pyelonephritis, 14-21 days prostatitis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Documentation of catheter insertion + maintenance + removal date.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Education — patient + family + multidisciplinary team + system improvement.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Bacteremia + sepsis + mortality — particularly elderly + immunocompromised.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Pyelonephritis + renal abscess.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Prostatitis + epididymitis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Antibiotic resistance — increasing concern.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Prolonged hospitalization + increased costs + CMS reimbursement impact + Joint Commission reportable.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CLABSISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "clabsi",
        title: "Central line-associated bloodstream infection (CLABSI)",
        subtitle: "Central venous catheter bloodstream infection · HAI · CDC NHSN reportable · CMS NEVER EVENT · prevention bundle: hand hygiene, full barrier, chlorhexidine, optimal site, daily review",
        nclexTags: haiTagsR34,
        definition: AttributedProse(
            "Bloodstream infection in a patient with central venous catheter (within 48 hours of insertion or after) without identifiable alternative source; CDC NHSN reportable; CMS NEVER EVENT. Historically 5-10 per 1,000 catheter-days; reduced to 1-2 with bundle implementation. ICU + dialysis catheters highest risk. Pathogens — coag-negative staph + Staph aureus + Enterococcus > gram-negatives > Candida; MRSA + VRE + carbapenem-resistant common. Risk factors — prolonged catheterization, femoral/jugular > subclavian site, multiple lumens, parenteral nutrition, hemodialysis, multiple manipulations per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Bacteria gain entry via insertion (skin organisms migrating along catheter), hub contamination (most common after first 7 days), hematogenous seeding, or contaminated infusates. Biofilm formation on catheter material protects bacteria from antibiotics + host immunity. Catheter functions as persistent source → recurrent bacteremia until removed or sterilized via antibiotic lock therapy.",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Fever + chills + tachycardia + hypotension (sepsis presentation).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Local — purulence at insertion site, redness, induration, tenderness; OFTEN ABSENT in CLABSI.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Sepsis — fever + hemodynamic instability + organ dysfunction + altered mental status.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Metastatic infection — endocarditis, septic emboli (especially Staph aureus), epidural abscess, distant joint + visceral.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Persistent bacteremia despite antibiotics — suggests line as source.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Paired blood cultures — peripheral AND central line; differential time to positivity (line earlier than peripheral by ≥2 hours) OR colony count ratio ≥3:1 from line:peripheral.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Catheter tip culture after removal (≥15 CFU/mL).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Supportive — CBC, lactate, electrolytes, organ function, urinalysis, chest imaging.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Sepsis assessment — fever + hemodynamics + organ function + lactate.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Catheter necessity + daily review + early removal.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Site assessment — daily evaluation for redness, drainage, induration.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Metastatic infection screening — ECHO for Staph aureus + persistent bacteremia.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("CLABSI BUNDLE — hand hygiene; max barrier precautions (full gown + mask + sterile gloves + drape) for insertion; chlorhexidine 2% + alcohol 70% skin prep (15+ sec contact + 30 sec dry); optimal site (subclavian > IJ > femoral); daily review of necessity + EARLY REMOVAL.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Hub scrubbing with alcoholic chlorhexidine 15 seconds before EVERY access.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Chlorhexidine biopatch + sterile dressing change Q7 days + immediately if compromised.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Chlorhexidine bathing daily — institutional protocol (selected ICU + high-risk).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Treatment — blood cultures from multiple sites; empiric broad-spectrum (vancomycin + cefepime OR antipseudomonal beta-lactam); catheter removal preferred (or salvage with antibiotic lock); culture-guided narrowing.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Duration — uncomplicated 7-14 days; complicated (endocarditis, septic thrombus) 4-6 weeks.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Metastatic infection workup — ECHO + MRI + joint aspiration as indicated.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Documentation + education + multidisciplinary CLABSI prevention initiatives + audits.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Sepsis + septic shock + mortality 12-25% in CLABSI.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Endocarditis — particularly Staph aureus + persistent bacteremia; valve surgery often.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Metastatic abscess — epidural, joint, visceral, brain.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Septic thrombosis + thrombotic complications.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Antibiotic resistance + treatment difficulty.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Prolonged hospitalization + ICU readmission + CMS reimbursement impact + Joint Commission reportable.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SSISurgicalSiteInfectionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ssi-surgical-site-infection",
        title: "Surgical site infection (SSI)",
        subtitle: "Post-operative wound infection · superficial/deep/organ-space · HAI · CDC NHSN reportable · CMS NEVER EVENT for select procedures · prevention bundle",
        nclexTags: haiTagsR34,
        definition: AttributedProse(
            "Infection at site of surgical procedure within 30 days (90 days for prosthesis implantation); CDC NHSN classification — superficial (skin + subcutaneous), deep (fascia + muscle), organ-space. CDC reportable; CMS NEVER EVENT for select procedures (CABG, bariatric, orthopedic). Frequency 2-5% of all surgeries; ~20% of HAIs. Risk factors — patient (diabetes, smoking, obesity, malnutrition, immunocompromise, age), surgical (procedure type, duration, sterility, blood loss, drains, foreign body), contamination class, perioperative (antibiotic timing, glucose, temperature, oxygenation, skin prep) per primary source.",
            citationIDs: ["specialty_dx_round34"]
        ),
        pathophysiology: AttributedProse(
            "Bacterial contamination at surgery — endogenous (patient skin + GI flora) or exogenous (OR environment + team + instruments) — establishes infection when host defenses overwhelmed. Risk multiplied by tissue trauma, foreign body, ischemia, hematoma + seroma, immunocompromise, prolonged duration. Modern bundle interventions target each pathway — antibiotic prophylaxis (bacterial load), normothermia + oxygenation (tissue defenses), glucose control (immune function), aseptic technique (contamination).",
            citationIDs: ["specialty_dx_round34"]
        ),
        presentation: [
            AttributedBullet("Local — pain, redness, induration, swelling, warmth, purulent drainage, dehiscence, fluctuance.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Systemic — fever, chills, leukocytosis, tachycardia, hypotension if sepsis.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Deep/organ-space — same plus organ-specific (peritonitis, abscess, joint effusion).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Onset typically 5-10 days post-op (superficial); deep + organ-space may be later.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Necrotizing fasciitis — rapid progression + severe pain + crepitus + systemic toxicity; SURGICAL EMERGENCY.", citationIDs: ["specialty_dx_round34"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Wound assessment + culture (Gram stain + aerobic/anaerobic culture).", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Blood cultures if systemic; CBC + comprehensive panel.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Imaging if deep/organ-space (ultrasound, CT) + abscess.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Surgical exploration in selected; biopsy if necrotizing fasciitis suspected.", citationIDs: ["specialty_dx_round34"])
        ],
        priorityAssessments: [
            AttributedBullet("Patient risk factors — diabetes, smoking, obesity, malnutrition, immunocompromise.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Procedure factors — type, duration, contamination class, foreign body, drains.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Bundle compliance — antibiotic timing, glucose control, normothermia, skin prep, hair removal.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Wound assessment + serial monitoring + recognition of early infection.", citationIDs: ["specialty_dx_round34"])
        ],
        commonInterventions: [
            AttributedBullet("SSI BUNDLE — antibiotic prophylaxis (cefazolin 2 g IV 30-60 min before incision; vancomycin for MRSA risk; redose for long procedures); CLIPPED hair removal (NOT shaving); skin prep with alcohol + chlorhexidine; glucose <200 mg/dL perioperative; normothermia (warming); FiO2 ≥0.8 selected.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Postoperative — sterile dressing + serial monitoring for infection signs.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Recognize SSI early — redness, drainage, fever, increasing pain.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Treatment — incision + drainage for superficial; antibiotics culture-guided; ALWAYS surgical drainage of deep/organ-space abscess; source control for seroma/hematoma.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Necrotizing — emergent surgical debridement + IV antibiotics + ICU + ongoing fasciectomy.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Wound care + dressing changes + drain management + nutrition support + glucose management.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Hand hygiene + dressing technique + family + patient education + discharge teaching.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Participate in SSI prevention initiatives + audits + improvement.", citationIDs: ["specialty_dx_round34"])
        ],
        watchFor: [
            AttributedBullet("Sepsis + bloodstream infection.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Wound dehiscence + evisceration.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Abscess + need for surgical drainage.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Necrotizing fasciitis + soft tissue infection.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Prosthetic infection — explantation often needed.", citationIDs: ["specialty_dx_round34"]),
            AttributedBullet("Prolonged hospitalization + readmission + antibiotic resistance + scarring + functional impairment.", citationIDs: ["specialty_dx_round34"])
        ],
        citations: [openrnDxR34, cdcDxR34, specialtyDxR34],
        lastSourceFidelityReview: "2026-05-13"
    )
}
