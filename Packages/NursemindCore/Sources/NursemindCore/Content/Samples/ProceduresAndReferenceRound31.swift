import Foundation

// Curator-model procedures + reference (round 31 — neurology depth: IVIG + thrombectomy + brain death + MS DMT + PD med strategy + AED + headache).

private let openrnPRR31 = CitationSource(
    id: "openrn_pr_round31",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR31 = CitationSource(
    id: "cdc_pr_round31",
    shortName: "CDC + NINDS + AAN concept citations",
    publisher: "CDC · NINDS · AAN",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR31 = CitationSource(
    id: "specialty_pr_round31",
    shortName: "AAN + AHS + MS Society + MDS + ILAE + UDDA concept citations",
    publisher: "AAN · AHS · MS Society · MDS · ILAE · UDDA",
    license: .factCitationOnly,
    url: "https://www.aan.com/Guidelines/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR31 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .neurologicalRegulation
)
private let refTagsR31 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .neurologicalRegulation
)

public enum IVIGInfusionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ivig-infusion-care",
        title: "IV immunoglobulin (IVIG) infusion nursing care",
        subtitle: "Pooled human Ig · neurology immune-mediated (GBS + MG + CIDP + autoimmune encephalitis) · slow infusion + hydration · headache + AKI + thrombosis · 2 g/kg",
        nclexTags: procTagsR31,
        indications: AttributedProse(
            "Immune-mediated neurologic disorders — GBS, CIDP, myasthenia gravis crisis, autoimmune encephalitis, multifocal motor neuropathy, stiff-person syndrome, ADEM, NMOSD relapse; immune deficiencies (primary humoral immunodeficiency, hypogammaglobulinemia); ITP + autoimmune hematologic disease. Typical neurologic dose 2 g/kg total over 2-5 days per primary source.",
            citationIDs: ["specialty_pr_round31"]
        ),
        contraindications: AttributedProse(
            "IgA deficiency with anti-IgA antibodies (anaphylaxis); hypersensitivity to immunoglobulin; severe heart failure (volume); severe renal impairment (relative); thrombosis history (relative); pregnancy is generally safe but coordinate.",
            citationIDs: ["specialty_pr_round31"]
        ),
        equipment: [
            AttributedBullet("IVIG product — multiple brands (Gamunex, Privigen, Octagam, Gammagard, Carimune); some have stabilizer differences (sucrose vs glycine) → AKI risk; concentration 5-10%.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("IV access — peripheral large gauge OR central line; infusion pump.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Premedication — diphenhydramine 25-50 mg PO/IV + acetaminophen 1000 mg PO 30 minutes before initial; subsequent based on prior reactions.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Continuous monitoring — vitals q15-30 min initial, then q1-2 hours.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Emergency supplies — epinephrine, diphenhydramine, IV fluids, suction, oxygen.", citationIDs: ["openrn_pr_round31"])
        ],
        preProcedure: [
            AttributedBullet("Baseline labs — CBC, CMP (Cr, electrolytes), IgA level (rule out IgA deficiency), urinalysis (proteinuria), coagulation if planned.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Premedication — diphenhydramine + acetaminophen for first dose + as needed for prior reactions; corticosteroid pre-medication for severe reactors.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Hydration — 500 mL NS pre-infusion + during; reduces AKI + headache + thrombosis risk especially in elderly + hypovolemic.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Verify product, lot, dose, patient identity per institutional protocol.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Patient education — expected duration (4-6 hours per day × 2-5 days), side effects, when to report.", citationIDs: ["openrn_pr_round31"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Infusion initiation", body: "Start at SLOW initial rate (0.5 mg/kg/min OR per product label); first 30 minutes critical for reaction surveillance; vital signs q15 minutes.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 2, title: "Titration", body: "If tolerated, increase rate q30 minutes to maintenance (typically 4-8 mg/kg/min for 10% concentration); maximum rate depends on product + patient; SLOWER in older patients + cardiac/renal compromise.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 3, title: "Monitoring", body: "Vital signs q1-2 hours throughout; assess for symptoms — headache, fever, chills, nausea, dyspnea, chest pain, hypotension, rash, urticaria.", citationIDs: ["openrn_pr_round31"]),
            ProcedureStep(number: 4, title: "Reaction management", body: "Slow OR stop infusion if mild reactions; antihistamine + analgesic + observe; restart at slower rate if tolerable; STOP + emergent management if severe (anaphylaxis, hypotension, respiratory distress).", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 5, title: "Hydration", body: "Continuous IV NS during infusion + 6-12 hours after; minimum 1.5-2 L/day fluid; reduces AKI risk.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 6, title: "Post-infusion", body: "Observe 1-2 hours; vital signs; assess for delayed reactions (headache, nausea up to 24-72 hours later); discharge instructions.", citationIDs: ["openrn_pr_round31"]),
            ProcedureStep(number: 7, title: "Daily or alternate-day dosing", body: "2 g/kg total typically divided over 2-5 days; rest days for severe reactions or fluid concerns.", citationIDs: ["specialty_pr_round31"])
        ],
        postProcedure: [
            AttributedBullet("Continue hydration 1.5-2 L/day × 24-72 hours post-infusion.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Counsel on delayed reactions — headache, nausea, fatigue can last days; usually self-limited; severe headache + neurologic + AKI signs → seek care.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Follow-up labs — Cr at 48-72 hours; CBC + electrolytes.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Schedule subsequent doses + assess response.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Avoid LIVE VACCINES × 3 months post-IVIG (passive antibodies interfere).", citationIDs: ["specialty_pr_round31"])
        ],
        documentation: [
            AttributedBullet("Product, lot, dose, rate, vital signs trends, reactions, premedication, fluid balance, response.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Adverse reactions + interventions + outcomes.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Patient education + follow-up plan.", citationIDs: ["openrn_pr_round31"])
        ],
        watchFor: [
            AttributedBullet("ANAPHYLAXIS / SEVERE HYPERSENSITIVITY — emergent epinephrine + supportive; risk factors include IgA deficiency with anti-IgA antibodies (test IgA level pre-treatment).", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("ACUTE KIDNEY INJURY (AKI) — sucrose-containing products + dehydration + elderly + diabetic + renal impairment risk; HYDRATION + glycine-stabilized products preferred + Cr monitoring.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("THROMBOSIS — increased viscosity; CVA + DVT + MI + PE reported especially elderly + hyperviscosity + thrombophilia; SLOW infusion + hydration; some give prophylactic ASA + LMWH in high-risk.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("ASEPTIC MENINGITIS — severe headache + neck stiffness + photophobia + nausea; usually post-infusion 24-72 hours; supportive care + hydration; not infectious.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("HEADACHE — common (~50%); hydrate + analgesics; severe headache may indicate aseptic meningitis.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("HEMOLYTIC ANEMIA — uncommon; passive anti-A + anti-B antibodies; CBC monitoring.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("TRANSFUSION-RELATED ACUTE LUNG INJURY (TRALI) — rare; sudden dyspnea + bilateral pulmonary edema; supportive.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("INFECTIOUS TRANSMISSION risk — extremely low (pooled product processing); historic concern.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("LIVE VACCINES — avoid × 3 months post-IVIG; antibodies interfere.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Cost + insurance — expensive specialty product; pharmacy coordination + ongoing approval.", citationIDs: ["specialty_pr_round31"])
        ],
        citations: [openrnPRR31, cdcPRR31, specialtyPRR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MechanicalThrombectomyCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "mechanical-thrombectomy-care",
        title: "Mechanical thrombectomy nursing care (acute ischemic stroke)",
        subtitle: "Endovascular clot retrieval · large vessel occlusion (LVO) within 24h window · post-procedure neuro + BP + groin · neurocritical care unit",
        nclexTags: procTagsR31,
        indications: AttributedProse(
            "Acute ischemic stroke with large vessel occlusion (LVO — internal carotid, M1/M2 middle cerebral artery, vertebral, basilar, posterior cerebral) within 24-hour window (extended window 6-24 hours per DAWN + DEFUSE-3 trials in patients with imaging-clinical mismatch). Stent retriever + aspiration techniques. Reduces disability dramatically when successful per primary source.",
            citationIDs: ["specialty_pr_round31"]
        ),
        contraindications: AttributedProse(
            "Active hemorrhage (intracranial or significant systemic), large established infarct (>1/3 MCA territory by CT criteria), severe coagulopathy uncorrected, life expectancy <6 months from comorbidities, premorbid severe disability (mRS ≥3).",
            citationIDs: ["specialty_pr_round31"]
        ),
        equipment: [
            AttributedBullet("Neuroangiographic suite — biplane fluoroscopy, contrast injectors.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Catheters — guide catheter + intermediate catheter; aspiration catheter; stent retrievers (Solitaire, Trevo); microwires.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Conscious sedation OR general anesthesia equipment; anesthesia personnel + airway.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Continuous monitoring — ECG + BP + SpO2; ART line if GA + ICU.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Post-procedure ICU bed + neurocritical care.", citationIDs: ["specialty_pr_round31"])
        ],
        preProcedure: [
            AttributedBullet("Door-to-puncture time goal — <60 minutes for emergent transfer; CT/CTA confirms LVO; ASPECTS score (>5 typically).", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Extended window (6-24h) — perfusion imaging (CT perfusion or MRI) with mismatch + small core + large penumbra.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("NIHSS — baseline + before procedure.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("BP management — target <180/105 (if tPA given) OR <220/120 (no tPA); titrate with labetalol or nicardipine.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Labs — INR, PTT, platelets, BMP; review tPA administration; coagulopathy correction.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Consent + family discussion; explain procedure + risks; time-critical.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Anesthesia decision — conscious sedation vs general anesthesia; consider patient tolerability + airway risk.", citationIDs: ["specialty_pr_round31"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Vascular access", body: "Femoral arterial access (radial alternative); large-bore guide catheter advanced to extracranial carotid or vertebral.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 2, title: "Angiography + occlusion localization", body: "Cervical + intracranial angiogram; identify LVO + collateral circulation; ASPECTS + collateral score.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 3, title: "Thrombectomy", body: "Microcatheter advancement past occlusion; stent retriever deployed (~3-5 minutes) → withdraw with thrombus; OR aspiration catheter at proximal face of clot with continuous aspiration; multiple passes if needed; TICI grading (Thrombolysis In Cerebral Infarction).", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 4, title: "Recanalization confirmation", body: "Post-thrombectomy angiogram; TICI 2b/3 = successful (50%+ reperfusion); TICI 0-1 = failed; mortality + outcome correlate strongly with recanalization.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 5, title: "Hemostasis", body: "Femoral closure device OR manual compression 15-30 minutes; bed rest 4-6 hours.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 6, title: "Post-procedure transfer", body: "ICU OR neurocritical care; serial neuro assessments; BP control.", citationIDs: ["specialty_pr_round31"])
        ],
        postProcedure: [
            AttributedBullet("ICU / neurocritical care × 24 hours minimum; NIHSS q1 hour × 6 hours → q2 hours × 12 hours → q4 hours; report decline.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("BP MANAGEMENT — target <180/105 × 24 hours; nicardipine OR labetalol infusion; avoid hypotension (penumbra-dependent on perfusion); reassess after 24 hours.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("GROIN CHECK — site assessment + pulse + sensation q15 min × 1 hour → q30 min × 2 hours → q1 hour × 4 hours → q4 hours; hematoma + bleeding + pseudoaneurysm.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("HEAD-OF-BED — flat × 4-6 hours if femoral access; gradually elevate per protocol.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("CT BRAIN at 24 hours OR sooner if neuro decline — rule out hemorrhage (intracerebral, subarachnoid, intraventricular); reperfusion edema.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("SECONDARY PREVENTION — start aspirin within 24-48 hours; statin; assess for cardioembolic source (TTE, telemetry, hypercoagulable workup); hypertension management; diabetes; smoking cessation.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("DYSPHAGIA screen + speech therapy; NPO until passed swallow.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("DVT PROPHYLAXIS — pneumatic compression initially; chemical after 24-48 hours if no hemorrhage.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Rehabilitation — early PT/OT/speech assessment; transfer to acute rehabilitation when stable.", citationIDs: ["specialty_pr_round31"])
        ],
        documentation: [
            AttributedBullet("Pre + post-procedure NIHSS, time stamps, TICI grade, complications, procedural details.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Vital signs + neuro assessments + groin status + medication management.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Discharge planning + rehabilitation + secondary prevention.", citationIDs: ["openrn_pr_round31"])
        ],
        watchFor: [
            AttributedBullet("INTRACRANIAL HEMORRHAGE — most feared complication; ~5-10% post-thrombectomy; emergent CT for neuro decline; neurosurgery + reversal of any anticoagulation.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("REPERFUSION INJURY — edema + hemorrhage in reperfused infarct; BP management critical.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("MALIGNANT MCA EDEMA — large hemispheric infarct; emergent decompressive hemicraniectomy improves outcomes in selected (<60 years preferred).", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("VESSEL DISSECTION OR PERFORATION — rare but serious; emergent endovascular OR surgical management.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("GROIN COMPLICATIONS — hematoma, pseudoaneurysm, retroperitoneal bleed; serial monitoring; ultrasound + IR.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("CONTRAST NEPHROPATHY — particularly diabetic + CKD + dehydrated; hydration; pre-procedural metformin hold per institutional protocol.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("DYSPHAGIA + ASPIRATION — common post-stroke; NPO + screen + speech therapy + modified diet.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("RECURRENT STROKE — etiology workup; ASA + statin + atrial fibrillation anticoagulation; high-risk plaque carotid intervention.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("DEPRESSION + ANXIETY post-stroke — common; screen + treat.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("FUNCTIONAL OUTCOME — successful thrombectomy (TICI 2b/3) within early window strongly correlates with 90-day mRS 0-2; delayed treatment + failed recanalization worse.", citationIDs: ["specialty_pr_round31"])
        ],
        citations: [openrnPRR31, cdcPRR31, specialtyPRR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BrainDeathDeterminationSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "brain-death-determination",
        title: "Brain death (death by neurologic criteria) determination",
        subtitle: "Irreversible cessation of all brain functions · UDDA legal definition · clinical exam + APNEA TEST + ancillary if needed · 2 examiners + waiting period · organ donation",
        nclexTags: procTagsR31,
        indications: AttributedProse(
            "Determination of death by neurologic criteria in patients with catastrophic irreversible brain injury when cessation of brain function suspected. Legal definition per Uniform Determination of Death Act (UDDA) — irreversible cessation of all functions of entire brain including brainstem. Equivalent to cardiopulmonary death legally. Allows withdrawal of support + organ donation discussion per primary source.",
            citationIDs: ["specialty_pr_round31"]
        ),
        contraindications: AttributedProse(
            "Prerequisites not met — must EXCLUDE confounding factors: severe hypothermia (<36°C / 96.8°F), severe metabolic disturbance (severe electrolyte, glucose, acid-base, endocrine, organ failure causing CNS dysfunction), drug intoxication (sedatives, analgesics, paralytics — clear or measure levels), recent anesthesia not cleared.",
            citationIDs: ["specialty_pr_round31"]
        ),
        equipment: [
            AttributedBullet("Clinical examination tools — ophthalmoscope (for pupillary), cold water for caloric testing, cotton swab for corneal, tongue depressor for gag.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("APNEA TEST equipment — ventilator + apnea testing protocol + ABG capability + supplemental oxygen via T-piece OR endotracheal cannula.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Continuous monitoring — ECG, BP, pulse oximetry, capnography, temperature.", citationIDs: ["openrn_pr_round31"]),
            AttributedBullet("Ancillary tests if needed — EEG, cerebral angiography (gold standard), nuclear flow study (Tc-99m HMPAO), transcranial Doppler.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Documentation forms per institutional protocol; legal compliance.", citationIDs: ["openrn_pr_round31"])
        ],
        preProcedure: [
            AttributedBullet("ESTABLISH irreversible catastrophic brain injury — clinical history + neuroimaging confirming devastating injury without potential for recovery.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("PREREQUISITES MET — temperature ≥36°C, SBP ≥100 mm Hg, no severe metabolic disturbance, no confounding drugs (specifically check sedatives, analgesics, neuromuscular blockers + clearance time), absence of paralytics (train-of-four 4/4), no recent anesthesia.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Waiting period — 24 hours minimum for hypoxic-ischemic injury per AAN guidelines; shorter for primary brain injury per institutional protocol.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Two examiners typically — attending physician + another qualified physician (often neurology, neurosurgery, critical care); separate exams + apnea tests; some institutions require single examiner + observer.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Family communication — explain that brain death is legal death; discussions about organ donation through approved organ procurement organization (OPO).", citationIDs: ["specialty_pr_round31"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Coma assessment", body: "GCS 3 + no purposeful movement + no response to painful stimuli (sternal rub, supraorbital pressure, nail bed pressure); only spinal reflexes acceptable (e.g., triple flexion).", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 2, title: "Brainstem reflexes — all absent", body: "PUPILLARY response (no constriction to light bilaterally — fixed mid-position 4-9 mm); CORNEAL reflex absent; OCULOCEPHALIC (\"doll's eyes\") absent — eyes don't move opposite head turn; OCULOVESTIBULAR (cold caloric) — 50 mL cold water in each ear, hold ≥1 minute each, observe 5 minutes — NO eye movement toward stimulus; FACIAL motor response absent (no grimace to painful stimuli); GAG + COUGH absent (tongue depressor + endotracheal tube suction); PHARYNGEAL absent.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 3, title: "Apnea test", body: "Pre-oxygenate 100% × 10 minutes → baseline ABG → disconnect ventilator → oxygen via T-piece or endotracheal cannula at 6 L/min → OBSERVE for spontaneous respirations × 8-10 minutes (or until CO2 ≥60 mm Hg OR 20 above baseline) → ABG at end → if no respirations AND CO2 ≥60 → APNEA confirmed → return to ventilator; if respirations seen OR cardiopulmonary instability → ABORT.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 4, title: "Ancillary tests if needed", body: "Required when clinical exam OR apnea test inconclusive — cervical spinal cord injury limiting motor exam, severe facial trauma, drug effects not fully cleared, severe pulmonary disease precluding apnea test; CT/MR angiography or DSA cerebral angiography (no intracranial flow); EEG (electrocerebral silence ≥30 minutes); nuclear medicine cerebral blood flow study (Tc-99m HMPAO); transcranial Doppler ultrasound.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 5, title: "Documentation", body: "Time of death = first examination confirming brain death meeting all criteria; institutional documentation form; medical record + death certificate.", citationIDs: ["specialty_pr_round31"]),
            ProcedureStep(number: 6, title: "Organ donation discussion", body: "REFERRAL to organ procurement organization (OPO) BEFORE family notification of brain death — required by federal law; trained OPO professionals approach family; medical team continues supportive care + manages donor physiology if pursued.", citationIDs: ["specialty_pr_round31"])
        ],
        postProcedure: [
            AttributedBullet("Time of death documented at first qualifying examination meeting all criteria.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Family support + counseling; explain that brain death is legal death; allow time for understanding before discussing withdrawal of support or organ donation.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("If pursuing organ donation — continue supportive care + donor management protocols (hemodynamics, hormonal replacement, ventilator settings) per OPO direction.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("If not donating — discontinue mechanical support after family ready; document.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Notification — death certificate, autopsy considerations, social work, palliative care, chaplaincy.", citationIDs: ["specialty_pr_round31"])
        ],
        documentation: [
            AttributedBullet("Prerequisites + clinical exam + brainstem reflexes + apnea test + ancillary tests + time of death + examiner credentials.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Family communication + organ donation discussions.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("Institutional brain death determination form per UDDA + state law.", citationIDs: ["specialty_pr_round31"])
        ],
        watchFor: [
            AttributedBullet("CONFOUNDING FACTORS — drug effects, severe hypothermia, severe metabolic disturbance, paralytics; MUST EXCLUDE before declaration; if uncertainty → ancillary testing.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("FAMILY ACCEPTANCE — variable; some families have difficulty accepting brain death = legal death; cultural + religious considerations; chaplaincy + social work + palliative care.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("SPINAL REFLEXES — triple flexion + other spinal cord responses can occur in brain-dead patients (Lazarus sign); do NOT indicate cerebral function.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("APNEA TEST RISKS — hypoxemia, hypotension, arrhythmias; abort if unstable; ancillary testing alternative.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("PEDIATRIC BRAIN DEATH — different criteria for children + neonates per AAP; specialized determination.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("ORGAN DONATION OPPORTUNITIES — donation after brain death (DBD) and donation after circulatory death (DCD); OPO determines eligibility.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("LEGAL + INSTITUTIONAL VARIATIONS — UDDA accepted in all 50 US states; specific protocols vary; awareness of local requirements.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("INTERNATIONAL VARIATIONS — \"brain death\" criteria + procedures differ across countries.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("ETHICAL CONSIDERATIONS — withdrawal of life support, organ donation, family wishes, advance directives.", citationIDs: ["specialty_pr_round31"]),
            AttributedBullet("NEUROCRITICAL CARE — multidisciplinary team approach + clear communication essential.", citationIDs: ["specialty_pr_round31"])
        ],
        citations: [openrnPRR31, cdcPRR31, specialtyPRR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MSDMTSelectionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ms-dmt-selection",
        title: "MS disease-modifying therapy (DMT) selection",
        subtitle: "Platform → high-efficacy escalation OR initial high-efficacy · injectable + oral + infusion · risk-benefit + monitoring + pregnancy + comorbidities + age + access",
        eyebrow: "REFERENCE · NEUROLOGY",
        nclexTags: refTagsR31,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Disease-modifying therapy (DMT) selection in MS — increasingly favors HIGH-EFFICACY treatment EARLY rather than ESCALATION from platform agents. Selection considers — disease activity, MRI burden, prognostic markers, prior DMT response, pregnancy planning, comorbidities, age, monitoring requirements, patient preference, access + cost. Multidisciplinary MS center care with regular reassessment per primary source.",
                citationIDs: ["specialty_pr_round31"]
            )),
            .keyValueTable(title: "Platform / lower-efficacy DMTs (older + injectable + oral)", [
                KeyValueRow(key: "Interferon-β-1a/1b (Avonex, Rebif, Betaseron, Plegridy)", value: "SC or IM weekly to several times weekly; reduces relapses ~30%; flu-like symptoms + injection site reactions + depression; LFT monitoring"),
                KeyValueRow(key: "Glatiramer acetate (Copaxone)", value: "SC daily or 3x/week; well-tolerated; injection site reactions + immediate post-injection reaction (chest pain, flushing); safe in pregnancy"),
                KeyValueRow(key: "Teriflunomide (Aubagio)", value: "Oral daily; teratogen (Category X) + long half-life — cholestyramine washout for pregnancy; hepatotoxicity"),
                KeyValueRow(key: "Dimethyl fumarate (Tecfidera) + diroximel (Vumerity)", value: "Oral BID; flushing + GI; lymphopenia + PML risk; widely used"),
                KeyValueRow(key: "Efficacy", value: "Moderate (~30% relapse reduction); often initial DMT for milder disease")
            ]),
            .keyValueTable(title: "Higher-efficacy DMTs (oral + infusion + injection)", [
                KeyValueRow(key: "S1P modulators (fingolimod, siponimod, ozanimod, ponesimod)", value: "Oral daily; lymphocyte sequestration; first-dose monitoring (fingolimod), VZV serology, ophthalmology (macular edema), LFTs; PML rare; rebound disease on discontinuation"),
                KeyValueRow(key: "Cladribine (Mavenclad)", value: "Oral; selective lymphocyte depletion; 2-year course; lymphopenia + infection + malignancy risk + contraception"),
                KeyValueRow(key: "Natalizumab (Tysabri)", value: "IV monthly; α4-integrin antagonist; highly effective but BOXED PML; JCV antibody stratification + REMS (TOUCH); rebound on discontinuation"),
                KeyValueRow(key: "Ocrelizumab (Ocrevus)", value: "IV every 6 months; anti-CD20 B-cell depletion; ONLY FDA-approved for primary progressive MS; HBV reactivation + infections + hypogammaglobulinemia + malignancy surveillance"),
                KeyValueRow(key: "Ofatumumab (Kesimpta)", value: "SC monthly; anti-CD20 self-administered; similar efficacy to ocrelizumab; HBV reactivation + infections"),
                KeyValueRow(key: "Ublituximab (Briumvi)", value: "IV q6 months; anti-CD20; newer; similar profile to ocrelizumab"),
                KeyValueRow(key: "Alemtuzumab (Lemtrada)", value: "IV pulse therapy 5 days then 3 days yearly; severe autoimmune side effects (ITP, thyroid, glomerulonephritis); reserved for refractory; REMS"),
                KeyValueRow(key: "Efficacy", value: "High (~60-80% relapse reduction); preferred for active or aggressive MS")
            ]),
            .keyValueTable(title: "Selection considerations by clinical scenario", [
                KeyValueRow(key: "Mild relapsing MS (low MRI burden + infrequent relapses)", value: "Platform DMT (interferon, glatiramer, dimethyl fumarate, teriflunomide) reasonable initial choice"),
                KeyValueRow(key: "Active relapsing MS (frequent relapses + new MRI lesions)", value: "High-efficacy DMT initial (ocrelizumab, ofatumumab, natalizumab) increasingly preferred to escalation"),
                KeyValueRow(key: "Aggressive MS (multiple relapses + active MRI + early disability)", value: "High-efficacy DMT immediately"),
                KeyValueRow(key: "Primary progressive MS (PPMS)", value: "Ocrelizumab is ONLY FDA-approved DMT for PPMS; emphasis on symptom management + rehabilitation"),
                KeyValueRow(key: "Secondary progressive MS (SPMS) with relapses", value: "Continue relapsing therapies effective for relapses; siponimod approved for active SPMS"),
                KeyValueRow(key: "Pregnancy planning", value: "Glatiramer + interferon-β + natalizumab (continue late pregnancy if active disease) safer; teriflunomide + mycophenolate teratogenic; coordinate with MS specialist + OB"),
                KeyValueRow(key: "Elderly (>50-60)", value: "Higher comorbidity + infection risk + lower DMT efficacy in progressive forms; consider de-escalation in stable disease"),
                KeyValueRow(key: "JCV antibody positive + high index", value: "Avoid natalizumab; alternatives — fingolimod/S1P modulators, ocrelizumab, ofatumumab, alemtuzumab")
            ]),
            .bullets(title: "Treatment approach principles", [
                AttributedBullet("EARLY TREATMENT — initiate DMT shortly after diagnosis to reduce relapses + disability progression.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("HIGH-EFFICACY FIRST — increasingly favored over platform escalation for active disease.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("REGULAR REASSESSMENT — annual MRI + clinical reassessment; switch if breakthrough relapses or new MRI lesions despite adherence.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("ADHERENCE — major issue with injectable + complex regimens; psychosocial support + ongoing.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("PREGNANCY PLANNING — discuss + coordinate; some DMTs continue or restart immediately postpartum; close monitoring perinatal.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("VACCINATIONS — complete LIVE vaccines BEFORE high-efficacy DMT initiation; inactivated OK but reduced response.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("INFECTION SCREENING — TB, HBV, HCV, HIV, VZV before high-efficacy DMTs; ongoing surveillance.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("REHABILITATION + symptom management — physical therapy + occupational therapy + speech + cognitive + bladder/bowel + sexual + spasticity + neuropathic pain + fatigue management.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("MULTIDISCIPLINARY MS center — neurology + neuroimmunology + nursing + PT/OT + speech + psychology + social work + neuropsychology.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("COST + INSURANCE — high-cost specialty drugs; financial assistance programs + advocacy.", citationIDs: ["specialty_pr_round31"])
            ]),
            .bullets(title: "Special considerations", [
                AttributedBullet("PROGRESSIVE FORMS — ocrelizumab for PPMS; rehabilitation + symptom management primary; other DMTs less effective.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("DISCONTINUATION CONSIDERATIONS — stable inactive disease in older adults; rebound risk with fingolimod + natalizumab.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("BREAKTHROUGH DISEASE — relapse + new MRI on treatment → switch to higher-efficacy.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("ACUTE RELAPSE TREATMENT — high-dose corticosteroids (methylprednisolone 1 g IV × 3-5 days), plasma exchange for refractory or severe.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("SYMPTOMATIC TREATMENT — spasticity (baclofen, tizanidine), neuropathic pain (gabapentin, pregabalin), fatigue (amantadine, modafinil), bladder (anticholinergics, mirabegron), sexual dysfunction.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("MENTAL HEALTH — depression + cognitive impairment common; screen + treat.", citationIDs: ["specialty_pr_round31"])
            ])
        ],
        citations: [openrnPRR31, cdcPRR31, specialtyPRR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ParkinsonMedicationStrategySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "parkinson-medication-strategy",
        title: "Parkinson disease medication strategy",
        subtitle: "Levodopa anchor + adjuncts · early symptomatic vs advanced motor fluctuations · ICDs + augmentation · off-time + dyskinesia management · DBS · multidisciplinary",
        eyebrow: "REFERENCE · NEUROLOGY",
        nclexTags: refTagsR31,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Parkinson disease (PD) medication strategy evolves with disease progression — early symptomatic monotherapy → combination therapy + adjuncts for motor fluctuations + dyskinesia → advanced therapies (DBS, infusion therapies, focused ultrasound) for refractory disease. Levodopa remains gold standard. Multidisciplinary care + symptom management beyond medications. Individualize based on age + symptoms + comorbidities + lifestyle + employment + fall risk + cognition per primary source.",
                citationIDs: ["specialty_pr_round31"]
            )),
            .keyValueTable(title: "Levodopa (LDOPA) — gold standard", [
                KeyValueRow(key: "Levodopa/carbidopa (Sinemet)", value: "Most effective symptomatic therapy; carbidopa prevents peripheral conversion + reduces nausea + orthostasis; immediate-release standard; extended-release for nighttime; controlled-release options"),
                KeyValueRow(key: "Levodopa/carbidopa/entacapone (Stalevo)", value: "Combination including COMT inhibitor; reduces off-time + smoother control"),
                KeyValueRow(key: "Inhaled levodopa (Inbrija)", value: "On-demand for off-episodes; rapid onset"),
                KeyValueRow(key: "Levodopa/carbidopa intestinal gel (Duopa)", value: "Continuous intestinal infusion via PEG-J tube; advanced PD with severe motor fluctuations"),
                KeyValueRow(key: "Initial dosing", value: "25/100 mg TID (carbidopa/levodopa) → titrate based on response + side effects"),
                KeyValueRow(key: "Side effects", value: "Nausea (carbidopa mitigates), orthostatic hypotension, hallucinations (especially elderly + dementia), dyskinesia (long-term + dose-related), motor fluctuations (wearing-off, on-off), impulse control disorders, sleep disturbance, REM sleep behavior disorder")
            ]),
            .keyValueTable(title: "Dopamine agonists (DAs)", [
                KeyValueRow(key: "Pramipexole (Mirapex)", value: "Oral; ER once daily or IR TID; tremor + early disease + adjunct; titration over weeks"),
                KeyValueRow(key: "Ropinirole (Requip)", value: "Oral; ER once daily or IR TID; similar to pramipexole"),
                KeyValueRow(key: "Rotigotine (Neupro)", value: "Transdermal patch 24-hour; useful when oral difficult; rotation of sites"),
                KeyValueRow(key: "Apomorphine (Apokyn)", value: "SC injection for rescue of off-episodes; pen device; emergent on-demand"),
                KeyValueRow(key: "Apomorphine SL (Kynmobi)", value: "Sublingual for on-demand off-episodes"),
                KeyValueRow(key: "Side effects", value: "IMPULSE CONTROL DISORDERS (gambling, hypersexuality, binge eating, compulsive shopping) — significant; somnolence + sudden sleep attacks; nausea (worse than levodopa) + hallucinations + orthostatic hypotension + leg edema; dyskinesia less than levodopa; sometimes augmentation in RLS"),
                KeyValueRow(key: "Role", value: "Sometimes used initially in younger patients to delay levodopa-induced dyskinesia; adjunct to levodopa in advanced; declining first-line role due to side effects")
            ]),
            .keyValueTable(title: "MAO-B inhibitors", [
                KeyValueRow(key: "Selegiline (Eldepryl)", value: "Older; BID dosing (NOT evening — insomnia); amphetamine metabolite"),
                KeyValueRow(key: "Rasagiline (Azilect)", value: "Newer; once daily; selective; possibly neuroprotective (debated)"),
                KeyValueRow(key: "Safinamide (Xadago)", value: "Newer; also reduces dyskinesia; adjunct to levodopa"),
                KeyValueRow(key: "Side effects", value: "Generally well-tolerated; tyramine restrictions less stringent than non-selective MAOIs; serotonin syndrome with SSRIs/SNRIs/TCAs/meperidine/tramadol (rare at selective doses); orthostatic hypotension; insomnia; dyskinesia (with levodopa); melanoma surveillance in PD"),
                KeyValueRow(key: "Role", value: "Early monotherapy mild benefit OR adjunct to levodopa for fluctuations")
            ]),
            .keyValueTable(title: "COMT inhibitors", [
                KeyValueRow(key: "Entacapone (Comtan)", value: "With each levodopa dose; brown-orange urine; diarrhea common"),
                KeyValueRow(key: "Opicapone (Ongentys)", value: "Once daily at bedtime; better tolerated than entacapone"),
                KeyValueRow(key: "Tolcapone (Tasmar)", value: "Rare due to fatal hepatotoxicity; LFT monitoring; reserved"),
                KeyValueRow(key: "Role", value: "Adjunct to levodopa; reduces off-time + smoother on-time; reduce levodopa dose 25-30% when adding")
            ]),
            .keyValueTable(title: "NMDA antagonist + miscellaneous", [
                KeyValueRow(key: "Amantadine immediate-release", value: "Mild tremor + parkinsonism; livedo reticularis + anticholinergic effects + hallucinations elderly; renal dose adjust"),
                KeyValueRow(key: "Amantadine ER (Gocovri)", value: "FDA-approved specifically for LEVODOPA-INDUCED DYSKINESIA + off-episodes; bedtime"),
                KeyValueRow(key: "Anticholinergics (trihexyphenidyl, benztropine)", value: "Tremor-predominant younger patients; AVOID in elderly + cognitive impairment + autonomic disorders"),
                KeyValueRow(key: "Istradefylline (Nourianz)", value: "Adenosine A2A receptor antagonist; adjunct for off-time")
            ]),
            .keyValueTable(title: "Advanced therapies", [
                KeyValueRow(key: "Deep brain stimulation (DBS)", value: "Subthalamic nucleus (STN) or internal globus pallidus (GPi); for advanced PD with motor fluctuations + dyskinesia + medication-responsive symptoms; cognitive screening + psychiatric stable; significant motor benefit but doesn't cure or slow progression"),
                KeyValueRow(key: "MR-guided focused ultrasound", value: "Unilateral non-invasive ablation; alternative to DBS; emerging technology"),
                KeyValueRow(key: "Levodopa/carbidopa intestinal gel (Duopa)", value: "Continuous PEG-J infusion; advanced with severe fluctuations"),
                KeyValueRow(key: "Apomorphine continuous SC infusion", value: "Continuous pump for severe fluctuations"),
                KeyValueRow(key: "Patient selection", value: "Medication-responsive symptoms + advanced motor fluctuations + dyskinesia + cognitively intact + supportive caregivers; multidisciplinary movement disorder center evaluation")
            ]),
            .bullets(title: "Strategy by disease stage", [
                AttributedBullet("EARLY MILD — symptomatic treatment if functional impairment; choices include levodopa, dopamine agonists, MAO-B inhibitors; individualize.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("MODERATE — combination therapy emerging; levodopa core; add MAO-B inhibitor or dopamine agonist for fluctuations.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("ADVANCED with WEARING-OFF — increase levodopa frequency + COMT inhibitor + MAO-B inhibitor + extended-release formulations + on-demand inhaled levodopa or apomorphine.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("DYSKINESIA — reduce levodopa dose (if feasible) + add amantadine ER + consider DBS or focused ultrasound.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("LATE STAGE — frequent doses + multiple adjuncts + advanced therapies (DBS, infusion, focused ultrasound).", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("HALLUCINATIONS + PSYCHOSIS — first reduce / discontinue anticholinergics → amantadine → dopamine agonists → MAO-B → reduce levodopa as feasible; antipsychotic if persistent (PIMAVANSERIN — Parkinson's psychosis-specific; clozapine; quetiapine); AVOID typical antipsychotics + risperidone + olanzapine (worsen PD).", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("DEMENTIA + cognitive decline — RIVASTIGMINE FDA-approved for PD dementia; reduce + discontinue anticholinergics.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("ORTHOSTATIC HYPOTENSION — droxidopa, midodrine, fludrocortisone, salt + fluid; compression stockings; non-pharmacologic.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("REM SLEEP BEHAVIOR DISORDER — melatonin or clonazepam.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("CONSTIPATION + bladder dysfunction + sexual dysfunction + sialorrhea — symptomatic management.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("Multidisciplinary care — neurology (movement disorder specialist) + PT/OT/speech + nutrition + social work + nursing + neuropsychology + psychiatry; PARKINSON's FOUNDATION + AMERICAN PARKINSON DISEASE ASSOCIATION resources.", citationIDs: ["specialty_pr_round31"])
            ])
        ],
        citations: [openrnPRR31, cdcPRR31, specialtyPRR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SeizureAEDSelectionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "seizure-aed-selection",
        title: "Seizure classification + AED selection",
        subtitle: "ILAE 2017 classification · focal vs generalized vs unknown onset · syndromic + broad-spectrum + narrow-spectrum AEDs · pregnancy + comorbidities + drug interactions",
        eyebrow: "REFERENCE · NEUROLOGY",
        nclexTags: refTagsR31,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Seizure classification per ILAE 2017 framework — based on onset (focal, generalized, unknown), awareness (focal), and motor vs non-motor features. AED selection considers — seizure type, epilepsy syndrome, comorbidities, age, sex (especially pregnancy planning), drug interactions, side effect profile, monitoring requirements, cost. Goal — seizure freedom on monotherapy when possible; rational polytherapy for refractory per primary source.",
                citationIDs: ["specialty_pr_round31"]
            )),
            .keyValueTable(title: "ILAE 2017 seizure classification", [
                KeyValueRow(key: "FOCAL ONSET", value: "Onset in one cerebral hemisphere; FOCAL AWARE (formerly simple partial — consciousness intact) vs FOCAL IMPAIRED AWARENESS (formerly complex partial); motor (clonic, atonic, automatisms) vs non-motor (sensory, cognitive, emotional, autonomic, behavior arrest); MAY EVOLVE TO BILATERAL TONIC-CLONIC (formerly secondary generalization)"),
                KeyValueRow(key: "GENERALIZED ONSET", value: "Simultaneous bilateral cerebral involvement at onset; impaired awareness typically; subtypes — tonic-clonic, absence (typical + atypical), myoclonic, tonic, clonic, atonic, eyelid myoclonia"),
                KeyValueRow(key: "UNKNOWN ONSET", value: "Cannot determine onset from history + investigations; may be classified as motor vs non-motor or unclassified"),
                KeyValueRow(key: "Status epilepticus", value: "≥5 minutes of continuous seizure OR ≥2 seizures without recovery between; CONVULSIVE (motor) + NON-CONVULSIVE (decreased awareness)")
            ]),
            .keyValueTable(title: "First-line AEDs by seizure type", [
                KeyValueRow(key: "FOCAL seizures", value: "Carbamazepine, oxcarbazepine, lamotrigine, lacosamide, levetiracetam, brivaracetam, eslicarbazepine, gabapentin (adjunct); MANY options; lamotrigine + levetiracetam most commonly used due to tolerability"),
                KeyValueRow(key: "GENERALIZED TONIC-CLONIC", value: "Valproate (first-line if not pregnancy-relevant), lamotrigine, levetiracetam, topiramate, zonisamide"),
                KeyValueRow(key: "ABSENCE seizures", value: "Ethosuximide (childhood absence first-line) OR valproate; lamotrigine alternative; AVOID Na+ channel blockers (worsen absence)"),
                KeyValueRow(key: "MYOCLONIC", value: "Valproate, levetiracetam, lamotrigine (caution — can worsen myoclonic), zonisamide, clonazepam"),
                KeyValueRow(key: "JUVENILE MYOCLONIC EPILEPSY (JME)", value: "Valproate (most effective), levetiracetam, lamotrigine, topiramate, zonisamide; AVOID Na+ channel blockers (carbamazepine, oxcarbazepine, phenytoin — worsen myoclonic)"),
                KeyValueRow(key: "LENNOX-GASTAUT SYNDROME", value: "Multidrug; valproate + lamotrigine + topiramate + rufinamide + clobazam + cannabidiol (Epidiolex) + felbamate"),
                KeyValueRow(key: "INFANTILE SPASMS / WEST SYNDROME", value: "ACTH (Acthar Gel) OR oral prednisolone; vigabatrin alternative; specialized pediatric neurology")
            ]),
            .keyValueTable(title: "Broad-spectrum vs narrow-spectrum AEDs", [
                KeyValueRow(key: "Broad-spectrum (focal + generalized)", value: "Valproate, lamotrigine, levetiracetam, brivaracetam, topiramate, zonisamide, lacosamide (some), perampanel, clonazepam, cannabidiol"),
                KeyValueRow(key: "Narrow-spectrum (focal mainly)", value: "Carbamazepine, oxcarbazepine, eslicarbazepine, phenytoin, gabapentin, pregabalin, lacosamide"),
                KeyValueRow(key: "Worsens generalized (especially absence + myoclonic)", value: "Carbamazepine, oxcarbazepine, phenytoin, gabapentin, pregabalin, eslicarbazepine, lacosamide, vigabatrin"),
                KeyValueRow(key: "Pregnancy considerations", value: "VALPROATE — major teratogen + cognitive teratogenicity; AVOID in women of childbearing potential UNLESS no alternative; lamotrigine + levetiracetam + oxcarbazepine safer; folic acid 1-5 mg daily; pregnancy registry enrollment"),
                KeyValueRow(key: "DRUG INTERACTIONS", value: "ENZYME INDUCERS (carbamazepine, phenytoin, phenobarbital, oxcarbazepine, topiramate >200, lamotrigine, valproate inhibits some) — reduce hormonal contraceptive efficacy + other drugs; LEVETIRACETAM + LACOSAMIDE + BRIVARACETAM minimal interactions")
            ]),
            .keyValueTable(title: "Status epilepticus protocol", [
                KeyValueRow(key: "Stage 1 (initial 5-20 minutes)", value: "BENZODIAZEPINE — lorazepam 0.1 mg/kg IV (max 4 mg) OR midazolam 10 mg IM (autoinjector) OR diazepam 0.15 mg/kg IV; repeat if needed"),
                KeyValueRow(key: "Stage 2 (20-40 minutes — established SE)", value: "Second-line — FOSPHENYTOIN 20 mg PE/kg IV OR VALPROATE 40 mg/kg IV OR LEVETIRACETAM 60 mg/kg IV OR LACOSAMIDE 200-400 mg IV; ESETT trial showed similar efficacy"),
                KeyValueRow(key: "Stage 3 (>40 minutes — refractory)", value: "Continuous infusion — MIDAZOLAM, PROPOFOL, or PENTOBARBITAL; intubation + continuous EEG monitoring + ICU"),
                KeyValueRow(key: "Stage 4 (>24 hours — super-refractory)", value: "Continued anesthetic + adjuncts (ketamine, magnesium, lidocaine, ketogenic diet, immunotherapy, surgical); specialized centers"),
                KeyValueRow(key: "Etiology workup", value: "Glucose, electrolytes, magnesium, calcium, ABG, BUN/Cr, LFTs, drug screen, AED levels (if applicable), CBC, imaging, LP if infection suspected")
            ]),
            .bullets(title: "AED selection principles", [
                AttributedBullet("SEIZURE TYPE + EPILEPSY SYNDROME — primary determinant; correct classification critical.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("TOLERABILITY + SIDE EFFECTS — match to patient comorbidities + lifestyle; LAMOTRIGINE + LEVETIRACETAM widely first-line due to tolerability.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("DRUG INTERACTIONS — enzyme-inducing AEDs reduce oral contraceptive + DOAC + immunosuppressant + warfarin + other drug levels; lacosamide + levetiracetam + brivaracetam minimal interactions.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("PREGNANCY PLANNING — VALPROATE avoided in women of childbearing potential; folic acid 1-5 mg pre-conception + 1st trimester; pregnancy registries; coordinate epilepsy + OB.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("MONOTHERAPY when possible; sequential trials if breakthrough; rational polytherapy for refractory.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("DRUG-RESISTANT EPILEPSY — failure of 2 appropriate tolerated AEDs at adequate doses; refer to epilepsy center for diagnostic re-evaluation + surgical assessment + advanced therapies.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("EPILEPSY SURGERY — for refractory focal epilepsy with identifiable seizure focus; significant cure rates in selected; specialized centers; presurgical evaluation (long-term video-EEG, MRI, neuropsychology, Wada, possibly invasive monitoring).", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("NEUROMODULATION — vagal nerve stimulation (VNS), deep brain stimulation (DBS — anterior thalamus), responsive neurostimulation (RNS) for refractory not surgical candidates.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("KETOGENIC DIET — children + some adults; modified Atkins; nutritionist + clinical follow-up.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("SUDEP RISK — uncontrolled epilepsy + nocturnal seizures + young adults; counsel + optimize control + safety interventions.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("DRIVING RESTRICTIONS — state-specific; typical 3-12 months seizure-free; counsel + report; medical exemption for some.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("BONE HEALTH — long-term enzyme-inducing AEDs reduce vitamin D + bone density; calcium + vitamin D supplementation + DEXA in chronic.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("MOOD + COGNITIVE — many AEDs affect; suicidal ideation FDA class warning; screen + monitor.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("PHARMACOGENOMICS — HLA-B*1502 for carbamazepine/oxcarbazepine/phenytoin in Asian patients (SJS/TEN risk); test before prescribing.", citationIDs: ["specialty_pr_round31"])
            ])
        ],
        citations: [openrnPRR31, cdcPRR31, specialtyPRR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HeadacheTherapySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "headache-acute-prophylactic-therapy",
        title: "Migraine + headache acute + prophylactic therapy",
        subtitle: "Acute — triptans + gepants + ditans + DHE · prophylaxis — oral preventives + CGRP-MABs + Botox · medication overuse prevention · lifestyle + behavioral therapies",
        eyebrow: "REFERENCE · NEUROLOGY",
        nclexTags: refTagsR31,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Headache treatment — acute (abortive) for individual attacks + prophylactic (preventive) for frequent/severe headaches. Migraine + tension-type headache most common; cluster + other primary headaches less common. Approach individualized based on frequency, severity, comorbidities, pregnancy, response. Medication-overuse headache (MOH) prevention essential per primary source.",
                citationIDs: ["specialty_pr_round31"]
            )),
            .keyValueTable(title: "Acute migraine treatment by severity", [
                KeyValueRow(key: "Mild-moderate", value: "OTC NSAIDs (ibuprofen 400-800 mg, naproxen 500 mg), acetaminophen 1000 mg, combination acetaminophen + caffeine + aspirin (Excedrin); early treatment more effective"),
                KeyValueRow(key: "Moderate-severe (1st-line specific)", value: "TRIPTANS — sumatriptan (most studied, SC + nasal + PO), rizatriptan, zolmitriptan, naratriptan, eletriptan, almotriptan, frovatriptan (longer half-life); GEPANTS (CGRP receptor antagonists) — ubrogepant, rimegepant, zavegepant (nasal); DITANS — lasmiditan (5-HT1F agonist; sedating)"),
                KeyValueRow(key: "Severe or refractory", value: "DHE — dihydroergotamine SC + IM + IV + intranasal; IV antiemetic + magnesium + ketorolac + lidocaine; PEDIATRIC use prochlorperazine + metoclopramide + dexamethasone"),
                KeyValueRow(key: "Status migrainosus (>72 hours)", value: "ER protocol — IV fluids + IV antiemetic (prochlorperazine, metoclopramide) + IV ketorolac + IV magnesium + IV DHE + IV steroids; consider IV valproate"),
                KeyValueRow(key: "Pregnancy + lactation", value: "Acetaminophen first-line; consider triptans (sumatriptan has most safety data) + metoclopramide for second-line; AVOID NSAIDs in 3rd trimester + ergots + valproate + topiramate"),
                KeyValueRow(key: "Special populations", value: "Cardiovascular disease — AVOID triptans + ergots (vasoconstriction); use NSAIDs + gepants (CGRP antagonists) + antiemetics")
            ]),
            .keyValueTable(title: "Migraine prophylaxis indications + agents", [
                KeyValueRow(key: "Indications", value: "≥4 migraine days/month OR significant disability OR contraindications to acute medications OR overuse of acute medications OR specific subtypes (hemiplegic, basilar, frequent aura, prolonged aura, migrainous infarction); chronic migraine (≥15 headache days/month with ≥8 migraine features)"),
                KeyValueRow(key: "Beta-blockers", value: "Propranolol 80-240 mg/day, metoprolol 100-200 mg/day; first-line preventive; reduce migraine 50% in many; contraindications — asthma, heart block, severe diabetes"),
                KeyValueRow(key: "TCAs", value: "Amitriptyline 25-150 mg PO at bedtime, nortriptyline (less anticholinergic); useful with comorbid tension HA + depression + insomnia; anticholinergic + sedation + weight gain side effects"),
                KeyValueRow(key: "Antiepileptics", value: "Topiramate 50-200 mg PO BID (paresthesias + cognitive + weight loss + kidney stones); valproate 500-1500 mg/day (teratogenic; AVOID childbearing)"),
                KeyValueRow(key: "SNRIs", value: "Venlafaxine 75-150 mg/day (chronic migraine + depression comorbidity)"),
                KeyValueRow(key: "ARBs/ACE inhibitors", value: "Candesartan 16 mg/day; modest benefit"),
                KeyValueRow(key: "Calcium channel blockers", value: "Flunarizine (not US), verapamil (cluster more than migraine)"),
                KeyValueRow(key: "CGRP-MABs (newer)", value: "ERENUMAB (anti-CGRP-R) 70-140 mg SC monthly; FREMANEZUMAB (anti-CGRP) 225 mg SC monthly OR 675 mg q3 months; GALCANEZUMAB 240 mg SC load → 120 mg monthly; EPTINEZUMAB 100-300 mg IV q3 months; expensive but effective for episodic + chronic migraine"),
                KeyValueRow(key: "Botox (chronic migraine only)", value: "OnabotulinumtoxinA 155 units IM q3 months (PREEMPT protocol); for CHRONIC migraine only (≥15 HA days/month); not for episodic"),
                KeyValueRow(key: "Atogepant (oral gepant prophylaxis)", value: "10-60 mg PO daily; newer oral CGRP antagonist for prophylaxis"),
                KeyValueRow(key: "Rimegepant (oral gepant)", value: "75 mg PO every other day for prophylaxis (also acute therapy)"),
                KeyValueRow(key: "Nutraceuticals (modest evidence)", value: "Magnesium 400-600 mg/day, riboflavin 400 mg/day, coenzyme Q10 100 mg TID, butterbur (hepatotoxicity concerns), feverfew")
            ]),
            .keyValueTable(title: "Cluster + other primary headaches", [
                KeyValueRow(key: "Cluster ACUTE", value: "100% oxygen 12-15 L/min via non-rebreather × 15-20 min; sumatriptan 6 mg SC; zolmitriptan nasal; intranasal lidocaine"),
                KeyValueRow(key: "Cluster PREVENTIVE", value: "Verapamil 240-960 mg/day divided (ECG monitoring); galcanezumab 300 mg SC monthly (FDA-approved); transitional steroids; occipital nerve blocks"),
                KeyValueRow(key: "Paroxysmal hemicrania", value: "Indomethacin 25-75 mg TID (responds completely — pathognomonic); same for hemicrania continua"),
                KeyValueRow(key: "SUNCT/SUNA", value: "Lamotrigine, topiramate, gabapentin; injection blocks"),
                KeyValueRow(key: "Hypnic headache", value: "Caffeine, lithium, indomethacin")
            ]),
            .bullets(title: "Medication-overuse headache (MOH) prevention", [
                AttributedBullet("LIMIT ACUTE MEDICATIONS — triptans/ergots/opioids/butalbital ≤10 days/month; simple analgesics ≤15 days/month; otherwise risk MOH conversion.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("OPIOIDS + BUTALBITAL — highest MOH risk; AVOID except rare rescue.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("PREVENTIVE THERAPY — when meeting indications; reduces acute medication use.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("MOH withdrawal — discontinue overused medication + bridge therapy + preventive initiation + behavioral therapy.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("Patient EDUCATION — recognize MOH risk + commit to acute medication limits; rescue therapy planning.", citationIDs: ["specialty_pr_round31"])
            ]),
            .bullets(title: "Lifestyle + behavioral therapies", [
                AttributedBullet("REGULAR SLEEP — consistent schedule + adequate sleep (7-8 hours); both insufficient + excessive sleep trigger.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("REGULAR MEALS — avoid skipping + hypoglycemia.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("HYDRATION — adequate 2 L/day fluid.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("EXERCISE — regular moderate aerobic (caution — exercise can trigger acute attack initially).", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("STRESS management — relaxation training + biofeedback + CBT for migraine + mindfulness.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("TRIGGER IDENTIFICATION — headache diary; common triggers — alcohol (red wine especially), aged cheese, processed meats (nitrites), MSG, chocolate, citrus, dehydration, weather changes, hormonal (menstrual), bright lights, strong odors, lack of sleep, stress.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("CAFFEINE — moderation; both undertreatment + overuse trigger; ≤200 mg/day usually OK.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("HORMONAL — menstrual migraine triggers; consider prophylactic miniprophylaxis (frovatriptan or naratriptan around menses); continuous contraceptive use; magnesium.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("WEIGHT — obesity associated with chronic migraine; weight loss can reduce.", citationIDs: ["specialty_pr_round31"]),
                AttributedBullet("Mental health — depression + anxiety comorbidity; integrated care.", citationIDs: ["specialty_pr_round31"])
            ])
        ],
        citations: [openrnPRR31, cdcPRR31, specialtyPRR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}
