import Foundation

// Curator-model procedures + references (round 37 part B — pain management procedures + pain references).

private let openrnP37B = CitationSource(
    id: "openrn_p37b",
    shortName: "Open RN Nursing Skills + Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcP37B = CitationSource(
    id: "cdc_p37b",
    shortName: "CDC + AHRQ + NIH concept citations",
    publisher: "CDC · AHRQ · NIH",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyP37B = CitationSource(
    id: "specialty_p37b",
    shortName: "ASA + ASRA + APS + IASP + AAP + ICSI fact citations",
    publisher: "ASA · ASRA · APS · IASP · AAP",
    license: .factCitationOnly,
    url: "https://www.asahq.org/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR37B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let painRefTagsR37B = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .basicCareAndComfort,
    priorityConcept: .painComfort
)

public enum PCAPumpManagementSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pca-pump-management",
        title: "PCA (patient-controlled analgesia) pump management",
        subtitle: "Self-administered IV opioid · loading + demand + lockout + 1-hour limit · respiratory monitoring · ONLY THE PATIENT pushes button (PCA-by-proxy is dangerous)",
        nclexTags: procTagsR37B,
        indications: AttributedProse(
            "Patient-controlled analgesia (PCA) — IV opioid delivery system allowing patient to self-administer pre-set doses within safety parameters. Indications — postoperative pain (especially major surgery), cancer pain, sickle cell crisis, trauma, severe acute pain. Provides better pain control + patient satisfaction + lower total opioid use than nurse-administered PRN; safety depends on appropriate patient selection + monitoring per primary source.",
            citationIDs: ["specialty_p37b"]
        ),
        contraindications: AttributedProse(
            "Patient unable to understand or unable to physically push button (cognitive impairment, severe dementia, ESRD encephalopathy); allergy to opioid being used; severe respiratory disease (CO2 retention); sleep apnea (relative — close monitoring needed); pediatric patient unable to participate in concept (alternative — nurse-controlled analgesia by trained nurse, NCA).",
            citationIDs: ["specialty_p37b"]
        ),
        equipment: [
            AttributedBullet("PCA pump (Smart Pump with drug library) + tubing + bag/cassette of opioid; orange-locked tamper-evident bag.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Pre-mixed standard concentrations — morphine 1 mg/mL, hydromorphone 0.2 mg/mL, fentanyl 10 mcg/mL.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("PCA button + cord — for patient self-administration; reachable + comfortable.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Naloxone 0.4 mg pre-drawn at bedside; bag-mask ventilation available; capnography preferred for high-risk patients.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Continuous SpO2 monitor + RR monitoring; sedation scale (Pasero Opioid-induced Sedation Scale — POSS).", citationIDs: ["specialty_p37b"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order — opioid + concentration + loading dose + demand dose + lockout interval + 1- and 4-hour maximum.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Verify patient can understand + use PCA — cognitive assessment + practice button push.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Patient teaching — \"PUSH BUTTON when you feel pain — only YOU should push\"; explain lockout safety + reassessment.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Family teaching — \"PCA-BY-PROXY IS DANGEROUS — only the patient should push\"; signs of overdose; do not administer when patient sleeping.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Two-RN check at programming + medication change; smart pump library verification.", citationIDs: ["specialty_p37b"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Initial setup + programming", body: "Two-RN verification of: drug + concentration + loading dose + demand (typical morphine 1 mg, hydromorphone 0.2 mg, fentanyl 25-50 mcg) + lockout interval (typical 6-15 min) + 1-hr max + 4-hr max + continuous basal rate (RARELY indicated, increases sedation risk). Smart pump drug library verification.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 2, title: "Loading dose by RN", body: "Loading dose given by RN to establish initial pain control before patient self-administration; typical morphine 2-4 mg IV, hydromorphone 0.4-0.8 mg IV; titrate based on response.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 3, title: "Patient activation + monitoring", body: "Patient pushes button when pain — pump delivers demand dose if within parameters; if outside lockout → no dose; LED indicator shows successful vs locked attempt; pump records all attempts (analyze).", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 4, title: "Frequent assessment Q1-2H first 24 hours", body: "Sedation level (Pasero POSS — S, 1, 2, 3, 4, S=sleep), respiratory rate (RR), SpO2, end-tidal CO2 if capnography, pain score 0-10, total opioid delivered + attempts vs successful doses.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 5, title: "Adjust per response", body: "If pain not controlled → increase demand dose or decrease lockout; if oversedated → decrease demand or hold pump; if respiratory depression → STOP pump, naloxone, support; coordinate with prescriber.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 6, title: "Bag/cassette change + documentation", body: "Replace bag every 24 hours OR when empty; two-RN check at change; document time, drug, amount given, amount remaining, total dose since start, sedation/respiratory/pain assessment.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 7, title: "Discontinuation + tapering", body: "Transition to oral analgesia when patient tolerating PO + pain controlled; gradual taper to avoid acute pain rebound; may need scheduled long-acting + PRN short-acting opioid.", citationIDs: ["specialty_p37b"])
        ],
        postProcedure: [
            AttributedBullet("Continued sedation + respiratory monitoring during transition.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Transition to oral analgesia + outpatient regimen.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Patient education + safety counseling for outpatient opioid use.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Long-term plan + multimodal pain management + non-pharm interventions.", citationIDs: ["specialty_p37b"])
        ],
        documentation: [
            AttributedBullet("Time, drug, concentration, demand, lockout, basal (if any), 1+4 hour limits.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Q1-2H — pain, sedation, RR, SpO2, total dose, attempts vs successful, intervention.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Programming changes + provider notification + interventions.", citationIDs: ["openrn_p37b"])
        ],
        watchFor: [
            AttributedBullet("PCA-BY-PROXY — family member or staff pushing button → SEVERE OVERDOSE risk; sentinel event in some institutions; clear signage + education + safety.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("RESPIRATORY DEPRESSION — RR <10 OR SpO2 <90 OR rising EtCO2 OR sedation level 3-4 → STOP pump + ABG + naloxone if severe + close monitoring; risk peaks 4-6 hours after start + after dose increases.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("OVERSEDATION — POSS 3-4 (frequent drowsy or unresponsive) → decrease dose; hold pump if needed.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("PRURITUS, NAUSEA, CONSTIPATION — opioid side effects; antihistamines + antiemetics + bowel regimen + opioid rotation.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("HIGH ATTEMPT vs LOW SUCCESSFUL ratio — patient under-dosing; consider demand dose increase OR shorten lockout (provider decision).", citationIDs: ["specialty_p37b"]),
            AttributedBullet("PROGRAMMING ERROR — wrong drug + concentration + dose → severe consequences; smart pump libraries + two-RN check + verification.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("BASAL RATE PCA — increases respiratory depression risk; rarely indicated; close monitoring if used.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Sleep apnea + obesity + age >65 + opioid-naïve + concurrent sedatives → high-risk; capnography + closer monitoring.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Naloxone 0.4 mg IV/IM/IN at bedside; titrate to RR + LOC, not full reversal (rebound severe pain + withdrawal); repeat dose may be needed (naloxone half-life shorter than opioid).", citationIDs: ["specialty_p37b"])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EpiduralCatheterManagementSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "epidural-catheter-management",
        title: "Epidural catheter management",
        subtitle: "Continuous OR PCEA · LA + opioid · motor + sensory + hemodynamic monitoring · level testing · complications (epidural hematoma, infection, total spinal) · removal coagulation timing",
        nclexTags: procTagsR37B,
        indications: AttributedProse(
            "Epidural analgesia — catheter placement in epidural space delivering local anesthetic + opioid; superior pain control + reduced systemic opioid + better recovery vs systemic alone. Indications — labor analgesia, post-operative pain (thoracotomy, abdominal surgery, joint replacement, trauma), cancer pain. Continuous infusion OR patient-controlled epidural analgesia (PCEA) per primary source.",
            citationIDs: ["specialty_p37b"]
        ),
        contraindications: AttributedProse(
            "Patient refusal, infection at insertion site, sepsis, severe coagulopathy (INR >1.5, platelets <80,000), hypovolemia/hemodynamic instability, increased ICP, anatomic abnormality, allergy to local anesthetic. Anticoagulation timing critical — see ASRA guidelines for hold times before placement/removal.",
            citationIDs: ["specialty_p37b"]
        ),
        equipment: [
            AttributedBullet("Pre-filled epidural infusion bag with bupivacaine 0.0625-0.125% + fentanyl 2-5 mcg/mL (typical labor mix) OR ropivacaine + fentanyl/hydromorphone for post-op.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Dedicated epidural infusion pump (CANNOT be confused with IV pump — yellow tubing convention; epidural-only labels).", citationIDs: ["specialty_p37b"]),
            AttributedBullet("PCEA button if patient-controlled; programming per provider order.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Sterile dressing supplies; chlorhexidine prep; transparent dressing over insertion site.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Naloxone + ephedrine + emergency airway equipment + 20% lipid emulsion (LAST rescue) at bedside.", citationIDs: ["specialty_p37b"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order, infusion mix, rate, PCEA parameters; two-RN check.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Baseline vital signs, sensory level, motor strength (Bromage scale), pain assessment.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Coagulation status verification + anticoagulation timing review (ASRA 2018 guidelines: low-dose UFH hold 4-6 hr, LMWH prophylactic 12 hr, therapeutic 24 hr, fondaparinux 3-4 days, DOACs 24-48 hr).", citationIDs: ["specialty_p37b"]),
            AttributedBullet("IV access maintained (volume bolus may be needed for hypotension).", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Patient teaching — sensory + motor changes expected; report HA, back pain, weakness, severe headache, fever.", citationIDs: ["openrn_p37b"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Catheter placement (anesthesia provider)", body: "Anesthesiologist or CRNA places under sterile technique; level appropriate to surgery (T4-T8 thoracic, T10-L2 abdominal, L2-L4 lower extremity, L3-L5 labor); test dose (lidocaine 1.5% with epinephrine) to rule out intrathecal (rapid spinal) or intravascular (tachycardia) placement.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 2, title: "Initiate infusion", body: "Pump-controlled rate per provider order (typical 6-12 mL/hr labor, 4-8 mL/hr post-op); PCEA bolus + lockout if patient-controlled; observe for hypotension, sensory level changes, motor block.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 3, title: "Hourly assessment first 4-6 hours", body: "Vital signs (especially BP), pain score, sensory level (cold/touch/pin), motor strength (Bromage), urine output (autonomic effects), respiratory status, sedation; thereafter Q2-4 hours.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 4, title: "Sensory level testing", body: "Use ice or cold spray to test dermatomal level — patient identifies first cold sensation; document highest level (T4 = nipple, T6 = xiphoid, T10 = umbilicus, L1 = inguinal). Aim for level appropriate to procedure; level too high → respiratory + hemodynamic concern.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 5, title: "Bromage motor block scale", body: "0 — full motor power, 1 — unable to raise extended leg, 2 — unable to flex knee, 3 — unable to flex ankle/foot. Score 2-3 → reduce concentration or rate (motor block delays mobility + falls risk).", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 6, title: "Site assessment + dressing", body: "Daily site check — leakage, redness, swelling, drainage; transparent dressing change Q5-7 days OR when compromised; chlorhexidine site care; document.", citationIDs: ["openrn_p37b"]),
            ProcedureStep(number: 7, title: "Removal — coagulation timing", body: "Verify anticoagulation status BEFORE removal (same hold times as placement per ASRA); withdraw catheter slowly + steadily; inspect tip for completeness; document; observe site for 24 hours; notify provider for any neurologic changes (epidural hematoma!).", citationIDs: ["specialty_p37b"])
        ],
        postProcedure: [
            AttributedBullet("Continued neurologic + vital sign monitoring 24 hours after removal.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Sensory + motor return assessment; expect full return within hours.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Site assessment for hematoma + infection; report back pain, weakness, urinary retention.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Transition to systemic analgesia per provider order.", citationIDs: ["specialty_p37b"])
        ],
        documentation: [
            AttributedBullet("Catheter level, infusion mix, rate, PCEA parameters.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Hourly — vital signs, sensory level, motor (Bromage), pain, sedation.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Site assessment, complications, interventions, removal date + condition.", citationIDs: ["specialty_p37b"])
        ],
        watchFor: [
            AttributedBullet("EPIDURAL HEMATOMA — EMERGENCY; back pain + new motor/sensory deficit + urinary retention + tenderness; emergent MRI + neurosurgical decompression within 8 hours to preserve function; coagulation timing critical for placement + removal.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("EPIDURAL ABSCESS — fever + back pain + neurologic deficits + delayed onset; emergent MRI + antibiotics + neurosurgery.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("TOTAL SPINAL — accidental intrathecal injection of high-dose local; rapidly ascending block + respiratory failure + hypotension + bradycardia + LOC; emergent intubation + IV fluids + vasopressors + supportive.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("LOCAL ANESTHETIC SYSTEMIC TOXICITY (LAST) — intravascular catheter migration; CNS symptoms (perioral numbness, tinnitus, seizure) → CV (arrhythmia, arrest); LIPID EMULSION 20% (Intralipid) bolus + infusion + supportive.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("HYPOTENSION — sympathetic blockade → vasodilation; ephedrine 5-10 mg IV + IV fluid bolus + repositioning; particularly with thoracic + high lumbar levels.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("URINARY RETENTION — autonomic block; intermittent catheterization typical; foley if prolonged.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("PRURITUS — opioid component; antihistamines (diphenhydramine, hydroxyzine).", citationIDs: ["specialty_p37b"]),
            AttributedBullet("INADEQUATE ANALGESIA — patchy block, missed segment, catheter dislodgement; assess + adjust + consider replacement.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Catheter MIGRATION — into vessel (LAST risk) or intrathecal (total spinal risk); test dose + serial assessment.", citationIDs: ["specialty_p37b"])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LumbarDrainManagementSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "lumbar-drain-management",
        title: "Lumbar drain management",
        subtitle: "External lumbar CSF drainage · cardiothoracic surgery (aortic) · normal pressure hydrocephalus · CSF leak · meticulous level + flow + monitoring",
        nclexTags: procTagsR37B,
        indications: AttributedProse(
            "External lumbar drain (ELD) — temporary CSF drainage from lumbar subarachnoid space; preserves spinal cord perfusion during thoracoabdominal aortic surgery (TAAA repair), reduces ICP/CSF pressure post-operatively in selected, treats CSF leak after dural breach, evaluates normal pressure hydrocephalus (response to drainage). Critical-care nursing skill with significant patient safety implications per primary source.",
            citationIDs: ["specialty_p37b"]
        ),
        contraindications: AttributedProse(
            "Increased ICP from mass lesion (herniation risk); coagulopathy uncorrected; infection at site; severe spinal anatomy abnormality.",
            citationIDs: ["specialty_p37b"]
        ),
        equipment: [
            AttributedBullet("Lumbar drain catheter (closed system); transducer + fluid-filled tubing; pole + leveling system; collection bag.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Sterile gloves + dressing supplies.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Sterile sample collection tubes.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Continuous BP monitor + neurologic exam tools.", citationIDs: ["openrn_p37b"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order — drainage parameters (mL/hr OR mm Hg), level, sampling protocol.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Baseline neurologic exam + vital signs + ICP if also has external ventricular drain (EVD).", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Verify level — patient-zero reference at tragus of ear (foramen of Monro level for combined ICP); for lumbar drain, may reference iliac crest OR external auditory meatus per institutional protocol.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Patient teaching — keep head of bed at ordered position, do NOT adjust drain, report headache + visual changes + numbness immediately.", citationIDs: ["openrn_p37b"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Initial setup + leveling", body: "Provider places catheter at L2-L3 or L3-L4; secured + sterile dressing; transducer leveled at reference point per institutional protocol; calibration; initial pressure reading.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 2, title: "Set drainage rate per protocol", body: "TYPICAL TAAA — 5-15 mL/hr; height of drip chamber relative to reference point determines drainage; lower chamber → MORE drainage; raise chamber → LESS drainage; clamp + reassess hourly.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 3, title: "Hourly assessment", body: "Drainage volume + character (clear/bloody/cloudy), patient neurologic status (LOC, motor, sensory, cranial nerves), vital signs, signs of overdrainage (HA, nausea, sleepiness, photophobia) OR underdrainage (HTN, neurologic decline).", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 4, title: "Manage drain position changes", body: "When patient repositions OR ambulates → CLAMP drain BEFORE movement → reposition → re-level transducer → unclamp; brief clamping safer than uncontrolled drainage.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 5, title: "Sampling per protocol", body: "Sterile technique; collect from designated port; document amount + appearance; deliver to lab promptly; cell count, glucose, protein, Gram stain, culture.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 6, title: "Site assessment + dressing", body: "Daily — bleeding, leakage, infection signs; sterile dressing change as ordered; document.", citationIDs: ["openrn_p37b"]),
            ProcedureStep(number: 7, title: "Removal", body: "Provider removes when no longer indicated; sterile technique; pressure dressing × 24 hours; observe for CSF leak + headache; close monitoring.", citationIDs: ["specialty_p37b"])
        ],
        postProcedure: [
            AttributedBullet("Position supine + slow ambulation; monitor for post-drain headache.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Continued neurologic monitoring + drainage site assessment.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Document removal date + condition + any complications.", citationIDs: ["openrn_p37b"])
        ],
        documentation: [
            AttributedBullet("Drainage volume Q1H + appearance + interventions.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Patient neurologic status + vital signs.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Drain position + level + adjustments.", citationIDs: ["specialty_p37b"])
        ],
        watchFor: [
            AttributedBullet("OVERDRAINAGE — HA + nausea + photophobia + decreased LOC + intracranial hypotension; CLAMP drain + LOWER head of bed (reverse Trendelenburg); reassess.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("UNDERDRAINAGE — HTN + neurologic decline + CSF leak around catheter; verify clamp open + level correct; provider notification.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("SUDDEN INCREASE in drainage — possible catheter migration into intrathecal vs subdural; STOP drainage + clamp + provider notification + imaging.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("BLOODY drainage — CSF blood from procedure (xanthochromia clears) vs new bleeding (concerning); notify provider; coagulation labs.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("INFECTION — meningitis from procedure; fever + neck stiffness + cloudy CSF; cultures + antibiotics; remove catheter.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Catheter DISLODGEMENT or KINK — verify drainage flow; provider replacement if needed.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("DURAL TEAR / persistent CSF leak — at insertion or removal; surgical patch sometimes needed.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Cerebral HERNIATION (rare) — particularly with mass lesion + overdrainage; emergent imaging + neurosurgery.", citationIDs: ["specialty_p37b"])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MidlineCatheterSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "midline-catheter-care",
        title: "Midline catheter insertion + care",
        subtitle: "Peripheral venous access · forearm/upper arm · 1-4 weeks dwell · CONTRAINDICATED for vesicants/TPN/pH<5/pH>9 · CLABSI prevention bundle adapted",
        nclexTags: procTagsR37B,
        indications: AttributedProse(
            "Midline catheter — 8-25 cm peripheral venous catheter inserted in upper arm (basilic, cephalic, brachial vein) with tip in axillary vein (NOT central). Indications — IV therapy 1-4 weeks duration when difficult peripheral access OR avoiding central line risks. CONTRAINDICATED for vesicants (chemotherapy, vasopressors), TPN, drugs with pH <5 or >9, hyperosmolar solutions per primary source.",
            citationIDs: ["specialty_p37b"]
        ),
        contraindications: AttributedProse(
            "Vesicant chemotherapy or vasopressors (require central access); TPN with osmolality >900 mOsm/L; drugs with pH <5 or >9; severe coagulopathy; cellulitis/skin breakdown at site; prior axillary lymph node dissection (relative — same side mastectomy); severe peripheral vascular disease.",
            citationIDs: ["specialty_p37b"]
        ),
        equipment: [
            AttributedBullet("Midline catheter kit (4-5 Fr typically, 8-25 cm long); ultrasound-guided typically.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Sterile insertion kit — chlorhexidine prep, sterile drape, sterile gloves, ultrasound probe cover, syringes for flushing.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Heparin lock or saline lock per institutional protocol.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Sterile dressing supplies + chlorhexidine biopatch (if used) + transparent dressing.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Securement device (StatLock or similar).", citationIDs: ["openrn_p37b"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order + indication; ensure NOT for vesicants/TPN/pH-restricted.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Patient consent + teaching about expected dwell + care.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Site selection — basilic preferred (deeper, less mobile); cephalic OR brachial alternatives; assess vein with ultrasound; AVOID antecubital (joint flexion + occlusion); AVOID side of mastectomy or AV fistula.", citationIDs: ["specialty_p37b"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Sterile insertion (PICC-trained nurse or provider)", body: "Maximum sterile barrier (full gown + mask + sterile gloves + sterile drape); chlorhexidine prep + 30 sec dry; ultrasound-guided needle insertion; advance catheter through insertion needle; remove needle; secure catheter with StatLock; apply biopatch + transparent dressing; verify no resistance, blood return present.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 2, title: "Verify position", body: "Tip should reach axillary vein but NOT into subclavian/SVC (would be PICC); typically 20-25 cm in average adult; mark external length at insertion site.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 3, title: "Daily site assessment + dressing change", body: "Inspect for redness, swelling, drainage, leakage, securement; transparent dressing change Q5-7 days OR sooner if compromised; biopatch change with dressing.", citationIDs: ["openrn_p37b"]),
            ProcedureStep(number: 4, title: "Hub scrubbing + access", body: "Alcoholic chlorhexidine 15 seconds before EVERY access; flush 10 mL saline before + after each medication or fluid; saline lock between uses; heparin lock per institutional protocol.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 5, title: "Daily review of necessity", body: "Remove when no longer needed OR when complications develop OR at 4 weeks max dwell; transition to PO when feasible.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 6, title: "Removal", body: "Verify no contraindications (anticoagulation timing not as critical as central); remove dressing; gently remove catheter while observing for resistance; pressure to site × 5 min; sterile dressing; assess site for bleeding, hematoma; document length removed.", citationIDs: ["openrn_p37b"])
        ],
        postProcedure: [
            AttributedBullet("Site assessment for bleeding, hematoma, infection.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Document removal date + length + condition.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Patient education — site care + signs of infection/thrombosis to report.", citationIDs: ["openrn_p37b"])
        ],
        documentation: [
            AttributedBullet("Insertion date, location, length, French size, ultrasound use, sterile technique.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Daily — site assessment, dressing condition, function (blood return, no resistance).", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Each access — flushing, medication, complications.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Removal date + length + condition.", citationIDs: ["openrn_p37b"])
        ],
        watchFor: [
            AttributedBullet("VESICANT / TPN / pH-restricted DRUGS contraindicated — verify each medication before administering; consult pharmacy.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("INFECTION — though lower than central line, still significant; site assessment + clean technique + minimize manipulation.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("THROMBOSIS — DVT in upper extremity; arm swelling, pain, dilated chest veins; ultrasound + anticoagulation + remove catheter.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("OCCLUSION — flush + reposition arm + tPA (if confirmed thrombotic) per protocol; replace if persistent.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("MIGRATION — if catheter advances → could become central line (risk for arrhythmia from RA placement); verify with imaging if concern.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("EXTRAVASATION — particularly with vesicants (which should NOT be running through midline anyway); STOP infusion + aspirate + cold/warm compress + antidote per drug.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("PHLEBITIS — chemical (irritating drugs) or mechanical (catheter material); slow rate, dilute, consider catheter removal.", citationIDs: ["specialty_p37b"])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FoleyManagementSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "foley-catheter-management",
        title: "Foley (indwelling urinary) catheter management",
        subtitle: "Daily review of need · CAUTI prevention bundle · perineal care · troubleshooting (occlusion, leakage, bladder spasm) · removal protocol · post-removal monitoring",
        nclexTags: procTagsR37B,
        indications: AttributedProse(
            "Indwelling urinary (Foley) catheter — narrow indications per CDC + Joint Commission to reduce CAUTI: acute urinary retention, accurate UOP measurement in critically ill, perioperative for selected surgeries, healing of sacral/perineal wounds in incontinent, end-of-life comfort, immobilization for trauma. AVOID for incontinence alone (use external catheters, scheduled toileting, behavioral interventions). Daily review of necessity + EARLY REMOVAL central to bundle compliance per primary source.",
            citationIDs: ["specialty_p37b"]
        ),
        contraindications: AttributedProse(
            "Suspected urethral injury (blood at meatus, perineal hematoma — get retrograde urethrogram first); severe urethral stricture; recent urethral surgery without provider direction.",
            citationIDs: ["specialty_p37b"]
        ),
        equipment: [
            AttributedBullet("Closed drainage system pre-attached; collection bag with anti-reflux valve.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Catheter securement device — leg strap (StatLock) reduces movement + tension.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Perineal care supplies — soap + water + gentle wipes; chlorhexidine NOT routine for perineal care.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Sterile gloves + supplies for catheter change if needed.", citationIDs: ["openrn_p37b"])
        ],
        preProcedure: [
            AttributedBullet("Verify catheter still indicated daily — bladder scan if unsure of retention; remove if no longer needed.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Patient education — keep bag below bladder, don't kink, signs of CAUTI to report (fever, hematuria, suprapubic pain).", citationIDs: ["openrn_p37b"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Daily perineal care + catheter care", body: "Perineal care daily + after BM with mild soap + water + gentle pat dry; clean catheter from meatus outward; do NOT use antibiotic ointments; secure to thigh with leg strap.", citationIDs: ["openrn_p37b"]),
            ProcedureStep(number: 2, title: "Closed drainage system maintenance", body: "Keep collection bag BELOW bladder level (gravity drainage + reflux prevention); secure to bed/chair to prevent floor contact; change collection bag using sterile technique only when full or per protocol; do NOT routinely change catheter on schedule (only for clinical need).", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 3, title: "Daily review of necessity", body: "Use institutional checklist; remove when indication resolved; consider alternatives (external condom catheter for males, intermittent catheterization, scheduled toileting); track CAUTI metrics.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 4, title: "Bladder spasm management", body: "Common — feels like need to void around catheter; check kink/clot first; B+O suppository (belladonna + opium) PRN; oxybutynin for chronic; scheduled bladder training when long-term.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 5, title: "Occlusion troubleshooting", body: "No urine output + distended bladder → check for kinks + clamping; gentle bladder scan; if catheter occluded → sterile irrigation with 30 mL saline IF specifically ordered; replace catheter if persistent.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 6, title: "Specimen collection", body: "Collect from designated port (NOT drainage bag) using sterile technique; clamp distal to port for 15-30 min if needed; aspirate with sterile syringe.", citationIDs: ["specialty_p37b"]),
            ProcedureStep(number: 7, title: "Removal", body: "Verify provider order; deflate balloon (10 mL or per stamping on inflation port — don't withdraw if resistance, may indicate ruptured balloon retained); gentle traction to remove; document urine output + assessment of bladder scan after; observe for retention 4-6 hours; first void within 4-6 hours typical.", citationIDs: ["openrn_p37b"])
        ],
        postProcedure: [
            AttributedBullet("Bladder scan 4-6 hours post-removal if not voided + assess for retention.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Monitor for dysuria, frequency, urgency (transient post-Foley); educate.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Prevent retention with scheduled voiding + adequate hydration.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Patient teaching for home — good hygiene + voiding habits.", citationIDs: ["openrn_p37b"])
        ],
        documentation: [
            AttributedBullet("Insertion date, indication, French size, balloon volume.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Daily — UOP, drainage character, perineal care, indication assessment.", citationIDs: ["openrn_p37b"]),
            AttributedBullet("Removal date + post-removal voiding + complications.", citationIDs: ["openrn_p37b"])
        ],
        watchFor: [
            AttributedBullet("CAUTI — fever + cloudy urine + suprapubic pain + flank pain + hematuria + altered mental status (especially elderly); urinalysis + culture; antibiotics; REMOVE catheter if possible.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("URETHRAL TRAUMA — pain on insertion + blood at meatus + difficulty advancing; STOP + provider; urology consult; retrograde urethrogram before any further attempts.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("BALLOON RUPTURE on removal — cannot withdraw fully; do NOT force; provider assessment; cystoscopy may be needed to retrieve fragments.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("BLADDER SPASMS — common; check obstruction first; antispasmodics PRN.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("OCCLUSION from clots/sediment — gentle irrigation if ordered; replacement if persistent.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("LEAKAGE around catheter — bladder spasm + occlusion + balloon malfunction; assess + troubleshoot + replace if needed.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Post-removal RETENTION — bladder scan + recatheterization if needed; prevent with scheduled voiding + hydration.", citationIDs: ["specialty_p37b"]),
            AttributedBullet("Long-term catheter (>30 days) — UTI risk significant; consider intermittent catheterization, suprapubic catheter, or alternative; plan for de-catheterization.", citationIDs: ["specialty_p37b"])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

// MARK: - REFERENCES

public enum RegionalAnesthesiaReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "regional-anesthesia-epidural-reference",
        title: "Regional anesthesia + epidural reference",
        subtitle: "Spinal vs epidural vs nerve block · indications + complications · ASRA anticoagulation timing · LAST recognition + treatment · multimodal analgesia",
        eyebrow: "REFERENCE · PAIN MANAGEMENT",
        nclexTags: painRefTagsR37B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Regional anesthesia — local anesthetic blockade of nerve(s) supplying surgical or painful area; alternative or adjunct to general anesthesia + systemic opioids. Reduces opioid consumption, improves recovery, decreases PONV, may improve cancer outcomes. Major techniques — spinal, epidural, peripheral nerve blocks (single-shot or continuous). Specific complications include LAST, hematoma, infection, total spinal, transient neurologic symptoms per primary source.",
                citationIDs: ["specialty_p37b"]
            )),
            .keyValueTable(title: "Spinal vs Epidural anesthesia", [
                KeyValueRow(key: "SPINAL (subarachnoid)", value: "Single injection of local + opioid into CSF; rapid onset (5-10 min); dense block; lasts 1-4 hours; T6-L1 typical for surgery; simpler than epidural; risks — post-spinal HA (10-30%), hypotension, bradycardia, urinary retention"),
                KeyValueRow(key: "EPIDURAL", value: "Catheter in epidural space delivers continuous local + opioid; slower onset (15-20 min); titratable; weeks of analgesia possible; risks — patchy block, accidental dural puncture (post-LP HA), epidural hematoma + abscess, total spinal if intrathecal injection, LAST"),
                KeyValueRow(key: "COMBINED SPINAL-EPIDURAL (CSE)", value: "Best of both — rapid spinal onset + continuous epidural; common in labor"),
                KeyValueRow(key: "PERIPHERAL NERVE BLOCKS", value: "Brachial plexus, femoral, sciatic, TAP block, paravertebral, etc.; ultrasound-guided; single-shot (8-24 hr) or continuous catheter; site-specific surgery analgesia")
            ]),
            .keyValueTable(title: "ASRA anticoagulation guidelines (placement + removal timing)", [
                KeyValueRow(key: "Aspirin (low + standard dose)", value: "No restriction; safe to proceed"),
                KeyValueRow(key: "Clopidogrel", value: "Hold 5-7 days before placement"),
                KeyValueRow(key: "Heparin SC prophylactic (5000 units BID-TID)", value: "Hold 4-6 hours; check aPTT if recent dose"),
                KeyValueRow(key: "Heparin therapeutic IV", value: "Hold 4-6 hours + verify aPTT normal"),
                KeyValueRow(key: "LMWH prophylactic (enoxaparin 30-40 mg)", value: "Hold 12 hours; resume 12 hours post-procedure"),
                KeyValueRow(key: "LMWH therapeutic (enoxaparin 1 mg/kg BID)", value: "Hold 24 hours; resume 24 hours post-procedure"),
                KeyValueRow(key: "Fondaparinux", value: "Hold 36-48 hours (longer for therapeutic)"),
                KeyValueRow(key: "Apixaban / Rivaroxaban", value: "Hold 24-48 hours depending on renal function + dose"),
                KeyValueRow(key: "Dabigatran", value: "Hold 24-72 hours depending on renal function"),
                KeyValueRow(key: "Warfarin", value: "INR <1.5 acceptable; verify before procedure")
            ]),
            .keyValueTable(title: "LAST (local anesthetic systemic toxicity) — recognition + treatment", [
                KeyValueRow(key: "Risk factors", value: "Bupivacaine (most cardiotoxic), large volume + concentration, accidental intravascular injection, elderly + cardiac disease, neonates"),
                KeyValueRow(key: "EARLY signs (CNS)", value: "Perioral numbness, tongue paresthesia, dizziness, tinnitus, metallic taste, agitation; STOP injection + call for help"),
                KeyValueRow(key: "ADVANCED signs", value: "Seizures → CNS depression + coma + cardiovascular collapse (especially bupivacaine)"),
                KeyValueRow(key: "Treatment", value: "STOP injection; airway management (100% O2 + intubation if needed); CPR if arrest; LIPID EMULSION 20% (Intralipid) — bolus 1.5 mL/kg over 1 min + infusion 0.25 mL/kg/min × 30+ min (rescue from cardiotoxicity); benzodiazepines for seizures (NOT propofol — large doses contribute to CV collapse); AVOID vasopressin + large epinephrine doses"),
                KeyValueRow(key: "Prevention", value: "Calculate max dose by weight + concentration; aspirate before injection (check for blood); incremental injection (5 mL aliquots); ultrasound guidance; bedside lipid emulsion + dosing protocol")
            ]),
            .bullets(title: "Nursing care for patient with regional anesthesia", [
                AttributedBullet("Verify ASRA timing for anticoagulation hold/restart; coordinate with anesthesia + surgical team.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Pre-procedure baseline — vital signs, neurologic exam (sensory, motor, cranial nerves), pain assessment.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Post-procedure — vital signs Q15 min × 1 hr, then Q30 min × 2 hr, then Q1 hr; sensory + motor monitoring per anesthetic; check for hypotension, bradycardia, respiratory depression.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Sensory level testing (cold/touch); document highest level of block.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Motor block assessment (Bromage scale 0-3); fall + safety precautions.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Hypotension management — IV fluids + ephedrine 5-10 mg IV + position changes.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Urinary retention common; intermittent catheterization or Foley if prolonged.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Post-spinal headache — supine 1-2 hours, hydration, caffeine; blood patch if severe + refractory >72 hours.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Watch for epidural hematoma signs — back pain + new motor/sensory deficit + urinary retention; emergent MRI + neurosurgery within 8 hours.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Bedside emergency supplies — lipid emulsion 20% + dosing protocol + airway equipment + naloxone + ephedrine.", citationIDs: ["specialty_p37b"])
            ])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NonPharmPainSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "non-pharmacologic-pain-management",
        title: "Non-pharmacologic pain management",
        subtitle: "Heat/cold · positioning · TENS · massage · mindfulness + meditation · music · distraction · biofeedback · CBT · physical therapy · multimodal approach",
        eyebrow: "REFERENCE · PAIN MANAGEMENT",
        nclexTags: painRefTagsR37B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Non-pharmacologic pain management — physical, behavioral, cognitive interventions used as adjunct or alternative to medications. Especially valuable in opioid-sparing strategies, chronic pain, pediatrics, pregnancy, opioid-tolerant patients, end-of-life care. Multimodal combinations more effective than single intervention. Evidence ranges from strong (PT, CBT, mindfulness for chronic pain) to moderate (heat/cold, TENS, music) to mixed (acupuncture); patient preference + accessibility important per primary source.",
                citationIDs: ["specialty_p37b"]
            )),
            .keyValueTable(title: "Physical interventions", [
                KeyValueRow(key: "HEAT therapy", value: "Vasodilation, muscle relaxation, increased blood flow; for muscle spasm, chronic pain, arthritis; AVOID acute injury <48 hr (worsens edema), open wounds, decreased sensation, peripheral vascular disease, malignancy at site; max 20-30 min; assess skin"),
                KeyValueRow(key: "COLD therapy (cryotherapy)", value: "Vasoconstriction, decreased inflammation + edema, numbing; for ACUTE injury, post-op edema, fever, headache; AVOID Raynaud, decreased sensation, peripheral vascular disease; protect skin (towel barrier); 15-20 min cycles"),
                KeyValueRow(key: "Positioning", value: "Pain-relieving positions — semi-Fowler for cardiac, knees flexed for abdominal, side-lying with pillow for back, head-of-bed up for dyspnea; elevation for swelling; turning + repositioning Q2H for pressure relief"),
                KeyValueRow(key: "MASSAGE / therapeutic touch", value: "Manual manipulation of soft tissue; gate control theory + relaxation; effective for chronic back pain, fibromyalgia, anxiety + pain combination; AVOID over malignancy + acute injury + DVT"),
                KeyValueRow(key: "TENS (transcutaneous electrical nerve stimulation)", value: "Low-voltage electrical stimulation through electrodes; gate control theory; effective for chronic pain, post-op, dysmenorrhea, labor; AVOID pacemaker, pregnancy abdomen, head/neck, broken skin"),
                KeyValueRow(key: "Acupuncture / acupressure", value: "Traditional Chinese medicine; needle or pressure stimulation of meridian points; moderate evidence for chronic back pain, headache, knee OA, postoperative N/V; specialized practitioner for needle"),
                KeyValueRow(key: "Physical therapy + exercise", value: "Active + passive ROM + strengthening + stretching; TIER 1 for chronic musculoskeletal pain (back, knee, hip, shoulder); reduces opioid need; PT consultation"),
                KeyValueRow(key: "Aromatherapy", value: "Essential oils — lavender (anxiety, sleep), peppermint (nausea, headache), ginger (nausea); AVOID in respiratory disease, pregnancy (some), skin sensitivity; topical OR diffused")
            ]),
            .keyValueTable(title: "Cognitive-behavioral interventions", [
                KeyValueRow(key: "Mindfulness + meditation", value: "Body scan, breath awareness, present-moment focus; reduces pain catastrophizing + anxiety; effective chronic pain, fibromyalgia, headache; apps + group programs (MBSR — Mindfulness-Based Stress Reduction)"),
                KeyValueRow(key: "GUIDED IMAGERY", value: "Mental visualization of safe place, healing, pain reduction; useful for procedural pain, chronic, pediatric"),
                KeyValueRow(key: "Cognitive-behavioral therapy (CBT)", value: "Restructure pain-related thoughts + behaviors; high-quality evidence for chronic pain; identify pain catastrophizing + replace with coping strategies"),
                KeyValueRow(key: "DISTRACTION", value: "Music, TV, video games, conversation, art; especially effective in pediatric procedural + post-op pain; child life specialist"),
                KeyValueRow(key: "BIOFEEDBACK", value: "Real-time monitoring of physiologic functions (heart rate, muscle tension); patient learns to control; effective tension headache + migraine + back pain"),
                KeyValueRow(key: "MUSIC therapy", value: "Patient-selected music reduces pain perception + anxiety + need for sedation; effective procedural + post-op + chronic"),
                KeyValueRow(key: "HYPNOSIS", value: "Trained therapist; effective for chronic pain, IBS, procedural; less commonly available"),
                KeyValueRow(key: "Therapeutic communication", value: "Active listening + validation + presence; reduces anxiety + pain perception; nursing fundamental")
            ]),
            .keyValueTable(title: "Pediatric-specific non-pharm pain", [
                KeyValueRow(key: "Infants", value: "Sucrose 24% PO (2 mL on pacifier or syringe) for procedures; non-nutritive sucking; swaddling; skin-to-skin contact; breastfeeding during procedures"),
                KeyValueRow(key: "Toddlers + preschool", value: "Distraction (bubbles, video, story, parental presence); choice when possible; honest preparation; comfort positioning (parent holding)"),
                KeyValueRow(key: "School-age", value: "Information + control (\"You can hold my hand\" or \"squeeze\"); coping plan + practice; rewards"),
                KeyValueRow(key: "Adolescents", value: "Privacy + dignity; involvement in decision-making; CBT + distraction; mindfulness; peer support"),
                KeyValueRow(key: "Topical anesthetics for procedures", value: "EMLA (lidocaine + prilocaine 2.5%) or LMX (lidocaine 4%) — apply 30-60 min before; reduces injection + LP + IV pain in pediatrics + adults")
            ]),
            .bullets(title: "Implementation principles", [
                AttributedBullet("Combine multiple interventions for synergy — multimodal more effective than single.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Patient preference + cultural background shape choice; assess + offer options.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Pediatric — child life specialists are invaluable resources.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Time-limited use; reassess effectiveness; switch if not helping.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Document pain scores + intervention + response; share what works in handoff.", citationIDs: ["openrn_p37b"]),
                AttributedBullet("Family + caregiver involvement — many techniques can be applied at home.", citationIDs: ["openrn_p37b"]),
                AttributedBullet("Combine with appropriate pharmacotherapy — non-pharm rarely sufficient alone for severe acute pain.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Address pain-related anxiety + sleep disturbance + depression — common comorbidities affecting pain experience.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Long-term pain — refer to multidisciplinary pain clinic; PT, psychologist, primary care, specialty.", citationIDs: ["specialty_p37b"])
            ])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ChronicPainFrameworkSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chronic-pain-management-framework",
        title: "Chronic pain management framework",
        subtitle: "CDC 2022 guidelines · biopsychosocial model · multimodal · WHO step ladder · opioid use principles · pain neuroplasticity · multidisciplinary clinic",
        eyebrow: "REFERENCE · PAIN MANAGEMENT",
        nclexTags: painRefTagsR37B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Chronic pain (>3 months) affects ~50 million US adults; major cause of disability + opioid use disorder. CDC 2022 Guideline for Prescribing Opioids updates 2016 framework — emphasizes multimodal + non-opioid first; opioids for chronic pain ONLY when alternatives inadequate + benefits outweigh risks; START LOW + GO SLOW; reassess; consider ICS-style risk mitigation. Biopsychosocial model recognizes pain involves biology + psychology + social factors; multidisciplinary care typically needed per primary source.",
                citationIDs: ["specialty_p37b"]
            )),
            .keyValueTable(title: "WHO Pain Ladder (originally cancer pain, broadly applied)", [
                KeyValueRow(key: "Step 1: Mild pain (1-3/10)", value: "Non-opioids — acetaminophen, NSAIDs (consider GI/cardio/renal risks); adjuvants (anticonvulsants for neuropathic, antidepressants); non-pharm interventions"),
                KeyValueRow(key: "Step 2: Moderate pain (4-6/10)", value: "Weak opioids — codeine, tramadol, low-dose hydrocodone; PLUS Step 1 medications + adjuvants"),
                KeyValueRow(key: "Step 3: Severe pain (7-10/10)", value: "Strong opioids — morphine, oxycodone, hydromorphone, fentanyl, methadone; PLUS Step 1 medications + adjuvants; titrate to effect"),
                KeyValueRow(key: "Bypass step ladder", value: "Severe pain at presentation — start with Step 3; cancer pain often Step 3; trauma + post-op acute often Step 2-3"),
                KeyValueRow(key: "Adjuvants throughout all steps", value: "Anticonvulsants (gabapentin, pregabalin) for neuropathic; antidepressants (TCA, duloxetine) for chronic + neuropathic; muscle relaxants for spasm; corticosteroids for inflammatory; bisphosphonates for bone pain")
            ]),
            .keyValueTable(title: "CDC 2022 Opioid Prescribing Recommendations (highlights)", [
                KeyValueRow(key: "First-line", value: "Non-pharm therapies + non-opioid pharmacotherapy (NSAIDs, acetaminophen, anticonvulsants for neuropathic) preferred over opioids for chronic pain"),
                KeyValueRow(key: "Opioid initiation", value: "If opioid started — discuss known risks + benefits + alternatives; treatment goals + plan; review prescription drug monitoring program (PDMP); urine drug testing baseline + periodic"),
                KeyValueRow(key: "Dose limits", value: "Opioid-naïve patients — START LOW (≤50 morphine milligram equivalents [MME]/day); doses ≥50 MME/day risk doubles; ≥90 MME/day risk increases significantly; AVOID >90 MME/day or carefully justify"),
                KeyValueRow(key: "Duration", value: "Acute pain — 3-day prescription typically sufficient (rarely >7 days); chronic pain — periodic reassessment + tapering when possible"),
                KeyValueRow(key: "Concurrent risks", value: "AVOID concurrent opioid + benzodiazepine; AVOID concurrent opioid + alcohol; AVOID prescribing opioids + extended-release/long-acting in opioid-naïve"),
                KeyValueRow(key: "Tapering", value: "Gradual taper (5-20% per 4 weeks for chronic users) to avoid withdrawal + acute pain rebound; faster taper for acute use; never abruptly discontinue chronic opioids without taper plan"),
                KeyValueRow(key: "Naloxone co-prescription", value: "For patients on ≥50 MME OR with overdose risk (sleep apnea, COPD, hepatic/renal impairment, history of OD, mental health, substance use); educate family + patient")
            ]),
            .keyValueTable(title: "Opioid risk assessment + mitigation", [
                KeyValueRow(key: "Risk assessment", value: "ORT (Opioid Risk Tool), SOAPP-R (Screener and Opioid Assessment for Patients with Pain), DIRE; consider mental health, substance use, family history, social factors"),
                KeyValueRow(key: "Patient agreement", value: "Treatment agreement outlining expectations, single prescriber + pharmacy, urine drug testing, no early refills, no sharing/diverting"),
                KeyValueRow(key: "PDMP review", value: "Required in most states; review at initiation + periodically; identifies multiple prescribers + pharmacies + benzo concomitant"),
                KeyValueRow(key: "Urine drug testing", value: "Baseline + periodic; confirms compliance + identifies illicit substances + discrepancies; trauma-informed approach"),
                KeyValueRow(key: "Naloxone access", value: "Co-prescribe with opioids in high-risk; educate patient + family; pharmacist standing order in many states"),
                KeyValueRow(key: "Multidisciplinary care", value: "Pain medicine + psychology + PT + addiction medicine + primary care; group + individual models; comprehensive approach")
            ]),
            .bullets(title: "Pain neuroplasticity + chronicity", [
                AttributedBullet("CHRONIC PAIN is not just prolonged acute — pain pathways become sensitized + restructured (peripheral + central sensitization).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Wind-up phenomenon — repeated noxious stimuli amplify pain transmission; prevention is best treatment (early adequate analgesia).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Pain catastrophizing — magnification + helplessness + rumination; predicts worse outcomes; CBT addresses.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Sleep + mood + activity — bidirectional with pain; improvement in one improves others; address all.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Fear-avoidance behavior — kinesiophobia (fear of movement); leads to deconditioning + worse function; PT to overcome.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("ACCEPTANCE-based approaches (ACT — Acceptance + Commitment Therapy) — focus on values + function over pain elimination.", citationIDs: ["specialty_p37b"])
            ]),
            .bullets(title: "Multidisciplinary chronic pain clinic model", [
                AttributedBullet("Pain medicine specialist (interventional procedures + medication management).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Psychology / mental health (CBT, ACT, mindfulness, depression treatment).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Physical therapy (movement, exercise, postural training).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Occupational therapy (function + activities of daily living).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Addiction medicine / SUD treatment as needed.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Pharmacist (multimodal + interaction + tapering).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Nurse coordinator (education, follow-up, advocacy).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Primary care (continuity, referrals, follow-up).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Complementary practitioners (acupuncture, massage, biofeedback).", citationIDs: ["specialty_p37b"])
            ])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum OpioidTaperingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "opioid-tapering-protocol",
        title: "Opioid tapering protocol",
        subtitle: "Gradual reduction · withdrawal recognition · 5-20% reduction per 4 weeks for chronic users · COWS scale · MAT options · pain rebound management",
        eyebrow: "REFERENCE · PAIN MANAGEMENT",
        nclexTags: painRefTagsR37B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Opioid tapering — gradual dose reduction to discontinue opioids while minimizing withdrawal + acute pain + relapse + suicidality risk. Indications — long-term opioid use without ongoing benefit, side effects outweigh benefit, addiction, transitioning to alternative pain management, completion of acute course. CDC + HHS guidance — INDIVIDUALIZED + GRADUAL approach; abrupt discontinuation causes withdrawal + can be dangerous + ethically problematic per primary source.",
                citationIDs: ["specialty_p37b"]
            )),
            .keyValueTable(title: "Taper rate by duration of use", [
                KeyValueRow(key: "Short-term use (<2 weeks)", value: "May discontinue without taper or 50% reduction Q3-7 days; minimal withdrawal expected"),
                KeyValueRow(key: "Subacute (2 weeks-3 months)", value: "10-25% dose reduction Q1-2 weeks; closer monitoring"),
                KeyValueRow(key: "Long-term / chronic (>3 months)", value: "5-20% reduction Q4 weeks (slower for high-dose, longer-duration use); some require months-years for complete taper"),
                KeyValueRow(key: "High-dose (>90 MME)", value: "Slower taper (5-10% per month); priority is reducing overdose risk + improving function, NOT necessarily complete discontinuation"),
                KeyValueRow(key: "Pregnancy", value: "Maternal opioid use disorder — DO NOT taper during pregnancy (fetal withdrawal risk); methadone or buprenorphine MAT preferred"),
                KeyValueRow(key: "Older adults", value: "Slower taper; assess function + falls + cognition more frequently"),
                KeyValueRow(key: "After acute pain (post-op, trauma)", value: "Discontinue when pain resolved; no taper if <2 weeks; transitions to non-opioid")
            ]),
            .keyValueTable(title: "Withdrawal recognition (COWS scale)", [
                KeyValueRow(key: "EARLY (6-12 hours after last dose)", value: "Lacrimation, rhinorrhea, sweating, yawning, restlessness, anxiety; mild"),
                KeyValueRow(key: "PEAK (24-72 hours, 3-7 days for methadone)", value: "Dilated pupils, GI distress (cramping, diarrhea, nausea, vomiting), goosebumps, muscle aches, fever, tachycardia, hypertension, severe craving"),
                KeyValueRow(key: "LATE (5-14 days)", value: "Fatigue, sleep disturbance, anhedonia, persistent dysphoria; protracted withdrawal can last weeks-months"),
                KeyValueRow(key: "COWS (Clinical Opioid Withdrawal Scale)", value: "11 items (HR, sweating, restlessness, pupil size, bone/joint aches, runny nose, GI upset, tremor, yawning, anxiety, gooseflesh); 0-48; <12 mild, 13-24 moderate, 25-36 moderately severe, >36 severe"),
                KeyValueRow(key: "DEATH from withdrawal RARE", value: "Dehydration + electrolyte issues + cardiac in severe; not directly fatal like alcohol withdrawal; supportive care + symptomatic management")
            ]),
            .keyValueTable(title: "Tapering strategies + adjuncts", [
                KeyValueRow(key: "Direct taper", value: "Reduce same opioid by % at intervals; simplest"),
                KeyValueRow(key: "Cross-taper (rotation)", value: "Switch to longer-acting opioid (methadone) then taper; smooths peaks/troughs; complex pharmacokinetics"),
                KeyValueRow(key: "Buprenorphine MAT", value: "Partial agonist + antagonist properties; reduces craving + withdrawal + overdose risk; can be initiated during withdrawal (precipitates withdrawal in opioid-tolerant if too soon — wait until COWS >12); X-waiver removed as of 2023 — any prescriber can prescribe"),
                KeyValueRow(key: "Methadone MAT", value: "Long-acting full agonist; reduces craving + withdrawal; only via licensed methadone clinic (federal regulations); QT prolongation risk"),
                KeyValueRow(key: "NALTREXONE (Vivitrol)", value: "Long-acting opioid antagonist after detox; blocks opioid effects; once-monthly IM injection; requires complete withdrawal first (otherwise precipitates severe withdrawal)"),
                KeyValueRow(key: "Symptom management", value: "Clonidine (sympathomimetic symptoms — sweating, anxiety, hypertension), loperamide (diarrhea), ondansetron (nausea), trazodone (sleep), benzodiazepines (cautious + short-term for severe anxiety + seizure risk)")
            ]),
            .bullets(title: "Best practices", [
                AttributedBullet("INDIVIDUALIZE — patient + provider partnership; shared decision-making about goals + pace.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("INFORMED CONSENT — risks + benefits + alternatives + plan; document.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("MULTIMODAL pain management throughout — non-pharm + non-opioid; CBT + PT + mindfulness; address depression + anxiety + sleep.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("FREQUENT FOLLOW-UP — at least monthly during taper; reassess pain + function + mood + craving + adherence.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("NALOXONE access throughout taper — overdose risk if relapse to higher dose; family education.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("MAT (medication-assisted treatment) consideration — for opioid use disorder; reduces overdose mortality 40-60%; buprenorphine + methadone + naltrexone.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("PAUSE or REVERSE taper if withdrawal severe OR pain uncontrolled OR depression worsening OR suicidality OR function declining; not failure.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("ADDRESS comorbid mental health + substance use; depression + anxiety + PTSD common + impact tapering.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("PEER SUPPORT + 12-step + recovery community resources; not just medical model.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("FAMILY + caregiver education — recognize withdrawal + overdose; how to administer naloxone; emotional support.", citationIDs: ["specialty_p37b"])
            ]),
            .bullets(title: "Avoid these errors", [
                AttributedBullet("ABRUPT DISCONTINUATION of chronic opioids — withdrawal + acute pain rebound + suicidality + emergency room utilization + relapse to illicit (overdose risk).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("MANDATING TAPER without patient agreement — partnership not coercion.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("RIGID rate without individualization — needs vary widely.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("STIGMA + judgment — opioid use disorder is medical condition; harm reduction approach.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Failing to ADDRESS PAIN underlying chronic opioid use — multimodal pain management essential.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Failing to OFFER MAT for opioid use disorder — most effective treatment by far.", citationIDs: ["specialty_p37b"])
            ])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricPainSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pediatric-pain-management",
        title: "Pediatric pain management",
        subtitle: "Age-appropriate scales (FLACC, FACES, NRS) · weight-based dosing · non-pharm primary · sucrose for infants · topical anesthetics · parental involvement",
        eyebrow: "REFERENCE · PAIN MANAGEMENT",
        nclexTags: painRefTagsR37B,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Pediatric pain management requires age-appropriate assessment + intervention. Children's pain has been historically undertreated due to misconceptions (\"infants don't feel pain,\" \"opioids dangerous in children\") — both proven false. Untreated pain has long-term consequences (heightened pain response, chronic pain risk, anxiety). Multimodal + family-centered + age-appropriate non-pharm interventions PRIMARY; pharmacotherapy when indicated with weight-based dosing per primary source.",
                citationIDs: ["specialty_p37b"]
            )),
            .keyValueTable(title: "Age-appropriate pain assessment scales", [
                KeyValueRow(key: "Neonatal (term/preterm)", value: "NIPS (Neonatal Infant Pain Scale, 0-7), CRIES (postoperative neonatal), PIPP (preterm infant pain)"),
                KeyValueRow(key: "Infant + toddler (2 mo - 7 yr) OR nonverbal", value: "FLACC scale (Face, Legs, Activity, Cry, Consolability) 0-10; observe behavior; validated for infants + children + cognitively impaired"),
                KeyValueRow(key: "School-age (3-7+ yr)", value: "FACES Pain Scale-Revised — happy to crying faces 0-10; Wong-Baker FACES variant for younger kids"),
                KeyValueRow(key: "School-age + adolescent (≥7 yr)", value: "Numeric Rating Scale (NRS) 0-10 same as adults; verbal pain descriptor scales"),
                KeyValueRow(key: "Cognitive impairment / nonverbal", value: "FLACC-R (revised for cognitive impairment), individualized scales (caregiver knows baseline behaviors), NCCPC-R"),
                KeyValueRow(key: "Critical care + ventilated", value: "FLACC; physiologic indicators (HR, BP, dilated pupils); difficult assessment in deeply sedated")
            ]),
            .keyValueTable(title: "Procedural pain interventions by age", [
                KeyValueRow(key: "Neonatal procedures", value: "SUCROSE 24% PO (0.5-1 mL on pacifier or syringe, 2 min before procedure; max effect 5-10 min); non-nutritive sucking; swaddling; skin-to-skin contact; breastfeeding during procedure (multiple analgesic mechanisms)"),
                KeyValueRow(key: "Infant + toddler", value: "Distraction (bubbles, video, toy), parental holding (\"comfort hold\" — chest-to-chest), swaddling, sucrose for very young, topical anesthetic for needles"),
                KeyValueRow(key: "Preschool + school-age", value: "Honest preparation (\"It will pinch like a mosquito\"), choice (\"Which arm?\"), parental presence, distraction (story, video, song), positive coping language, rewards (stickers, certificates)"),
                KeyValueRow(key: "Adolescent", value: "Privacy + dignity, information + control, peer presence sometimes helpful, music/headphones, deep breathing, mindfulness"),
                KeyValueRow(key: "TOPICAL ANESTHETICS", value: "EMLA (lidocaine + prilocaine 2.5%) — apply 30-60 min before; LMX (lidocaine 4%) — apply 30 min before; J-tip (jet injection of lidocaine) — immediate; VAPOCOOLANT (ethyl chloride spray) — immediate but transient; reduces injection + LP + IV pain")
            ]),
            .keyValueTable(title: "Weight-based pharmacotherapy", [
                KeyValueRow(key: "Acetaminophen", value: "10-15 mg/kg PO/PR Q4-6h; max 75 mg/kg/day OR 4000 mg adult max; first-line mild-moderate; safe in most"),
                KeyValueRow(key: "Ibuprofen", value: "5-10 mg/kg PO Q6-8h; max 40 mg/kg/day OR 2400 mg adult max; >6 months age; with food; AVOID in dehydrated, varicella (Reye), aspirin allergy"),
                KeyValueRow(key: "Codeine", value: "AVOID in <12 years (CYP2D6 ultra-rapid metabolizers cause fatal overdose); FDA contraindication in pediatric tonsillectomy"),
                KeyValueRow(key: "Tramadol", value: "AVOID in <12 years (FDA contraindication post-tonsillectomy + adenoidectomy <18 yr); CYP2D6 metabolism concerns"),
                KeyValueRow(key: "Morphine", value: "0.05-0.1 mg/kg IV Q3-4h OR 0.2-0.5 mg/kg PO Q4-6h; nuanced for opioid-naïve; close monitoring"),
                KeyValueRow(key: "Hydromorphone (Dilaudid)", value: "0.015 mg/kg IV Q3-4h; potent opioid — close monitoring"),
                KeyValueRow(key: "Fentanyl", value: "1-2 mcg/kg IV/IN Q1-2h; fastest onset; INTRANASAL effective for pre-procedural"),
                KeyValueRow(key: "Naloxone (reversal)", value: "0.01 mg/kg IV/IM/IN; bedside available wherever opioids given")
            ]),
            .bullets(title: "Specific clinical situations", [
                AttributedBullet("Sickle cell crisis — multimodal + IV opioid + IV fluids + heat + non-pharm; do NOT undertreat; aggressive pain control + sickle-cell-specific protocols.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Cancer pain — WHO ladder + opioid titration + adjuvants; NOT undertreated due to opioid concern; multidisciplinary + palliative + child life.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Post-operative — multimodal + scheduled (not PRN) + non-pharm + parental involvement; PCA possible age 6+ with appropriate cognitive ability.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Burns — significant + prolonged pain; multimodal + procedural sedation for dressing changes + non-pharm + child life specialist.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Recurrent abdominal pain (functional) — common chronic pediatric pain; CBT + family education + symptom management; rule out organic.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Headache (migraine, tension) — pediatric migraine common; abortive (NSAIDs, triptans for older kids), prophylactic (riboflavin, magnesium, propranolol), non-pharm (sleep, hydration, trigger avoidance, biofeedback).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Procedural sedation — pediatric anesthesiologist OR sedation-credentialed; ASA classification + NPO + monitoring; ketamine + dexmedetomidine commonly used for pediatric procedural sedation.", citationIDs: ["specialty_p37b"])
            ]),
            .bullets(title: "Family-centered care", [
                AttributedBullet("Parental presence during procedures whenever possible — reduces child anxiety + pain perception (NOT for behavioral mgmt OR if parent too anxious).", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Educate parents — pain assessment + intervention + when to call provider; empower as advocate.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Address parental anxiety — affects child experience; honest information + reassurance.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Cultural competence — pain expression + family decision-making vary; respect cultural norms while ensuring adequate analgesia.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Child life specialist — invaluable for procedural preparation, distraction, age-appropriate explanation; available in pediatric centers.", citationIDs: ["specialty_p37b"]),
                AttributedBullet("Honest communication with child — age-appropriate explanation of procedures + sensations + plans; do NOT lie (\"this won't hurt\" if it will).", citationIDs: ["specialty_p37b"])
            ])
        ],
        citations: [openrnP37B, cdcP37B, specialtyP37B],
        lastSourceFidelityReview: "2026-05-13"
    )
}
