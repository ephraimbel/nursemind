import Foundation

// Curator-model procedures + reference (round 29 — endocrine depth: testing + transsphenoidal + IPSS + reference).

private let openrnPRR29 = CitationSource(
    id: "openrn_pr_round29",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR29 = CitationSource(
    id: "cdc_pr_round29",
    shortName: "CDC + NIH NIDDK endocrine concept citations",
    publisher: "CDC · NIH NIDDK",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/endocrine-diseases",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR29 = CitationSource(
    id: "specialty_pr_round29",
    shortName: "Endocrine Society + AACE + NOF + ATA concept citations",
    publisher: "Endocrine Society · AACE · NOF · ATA",
    license: .factCitationOnly,
    url: "https://www.endocrine.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-13"
)

private let procTagsR29 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .glucoseRegulation
)
private let refTagsR29 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .glucoseRegulation
)

public enum DexamethasoneSuppressionTestSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "dexamethasone-suppression-test",
        title: "Dexamethasone suppression test (DST)",
        subtitle: "Cushing workup · overnight low-dose screen → 48-hour confirmation → high-dose distinguishes pituitary from ectopic · interpret with 24h urine cortisol",
        nclexTags: procTagsR29,
        indications: AttributedProse(
            "Screening + workup of Cushing syndrome (cortisol excess) — distinguish from physiologic / pseudo-Cushing (depression, alcoholism, severe obesity). Three variants: overnight 1 mg DST (screening); low-dose 2-day 0.5 mg q6h (confirmation); high-dose 8 mg overnight or 2 mg q6h × 2 days (distinguishes pituitary Cushing disease from ectopic ACTH) per primary source.",
            citationIDs: ["specialty_pr_round29"]
        ),
        contraindications: AttributedProse(
            "Hypersensitivity to dexamethasone; acute severe psychiatric illness; concurrent strong CYP3A4 inducers (phenytoin, carbamazepine, rifampin) — false non-suppression.",
            citationIDs: ["specialty_pr_round29"]
        ),
        equipment: [
            AttributedBullet("Dexamethasone tablets (0.5 mg + 1 mg + 4 mg).", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Serum cortisol tubes; 24-hour urine collection containers (3 days); ACTH tube for differentiation.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Patient instructions handout; medication review.", citationIDs: ["openrn_pr_round29"])
        ],
        preProcedure: [
            AttributedBullet("MEDICATION REVIEW — discontinue interfering drugs × 4-6 weeks if possible: ESTROGEN (oral OCPs increase CBG → falsely elevated cortisol — discontinue or use bound-protein-corrected assay), CYP3A4 inducers (phenytoin, carbamazepine, rifampin, phenobarbital — false non-suppression), GLUCOCORTICOIDS (any exogenous steroid).", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Patient education — exact timing critical; no food/drink with steroid; sleep schedule; missed doses invalidate test.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Baseline cortisol + ACTH; 24-h urine free cortisol × 2-3 collections separately; late-night salivary cortisol × 2 nights as adjunct.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Rule out exogenous glucocorticoid use — inhaled, topical, joint injections, OTC creams, herbal remedies; some patients deny.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Pregnancy test for women of reproductive age.", citationIDs: ["openrn_pr_round29"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Overnight 1 mg DST (screen)", body: "Patient takes DEXAMETHASONE 1 mg PO at 11 PM (between 11 PM and midnight); serum cortisol drawn next morning 8-9 AM; normal suppression — cortisol <1.8 mcg/dL; failure to suppress (>1.8 mcg/dL) — suggests Cushing.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 2, title: "Low-dose 2-day DST (confirmation)", body: "DEXAMETHASONE 0.5 mg PO q6 hours × 8 doses (over 2 days); serum cortisol drawn 6 hours after final dose AND 24-h urine free cortisol on day 2; normal suppression — cortisol <1.8 mcg/dL + urinary free cortisol <10 mcg/24h; failure → Cushing confirmed.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 3, title: "High-dose 8 mg overnight DST", body: "DEXAMETHASONE 8 mg PO at 11 PM; serum cortisol drawn next morning 8 AM; >50% suppression from baseline → CUSHING DISEASE (pituitary ACTH-secreting adenoma — autonomous but partially suppressible); <50% suppression → ECTOPIC ACTH (lung NET, small cell, others) OR adrenal Cushing.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 4, title: "High-dose 2 mg q6h × 2 days", body: "Alternative high-dose; same interpretation; 24-h urine free cortisol day 2; >50% suppression from baseline → Cushing disease.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 5, title: "ACTH measurement", body: "Differentiates ACTH-dependent (pituitary OR ectopic) vs ACTH-independent (adrenal); LOW or suppressed ACTH (<5 pg/mL) → adrenal Cushing; HIGH or normal ACTH → ACTH-dependent (Cushing disease vs ectopic).", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 6, title: "Integration with other tests", body: "Late-night salivary cortisol (elevated in Cushing); 24-h urine free cortisol (×2-3 collections; >3× ULN diagnostic); MRI pituitary; chest CT for ectopic ACTH; inferior petrosal sinus sampling (IPSS) for pituitary localization.", citationIDs: ["specialty_pr_round29"])
        ],
        postProcedure: [
            AttributedBullet("Documentation — timing of dexamethasone administration, blood draws, missed doses, interfering medications, results.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Follow-up — interpret with full Cushing workup; endocrinology referral; multidisciplinary management.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("If Cushing confirmed — pituitary MRI, chest CT, adrenal CT, ACTH measurement, additional tests.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Counsel — long workup process; multiple tests; outcomes implications.", citationIDs: ["openrn_pr_round29"])
        ],
        documentation: [
            AttributedBullet("Exact timing of dexamethasone + blood draws + interfering medications.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Cortisol values pre + post; suppression percentage.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Clinical correlation + integration with other Cushing workup.", citationIDs: ["specialty_pr_round29"])
        ],
        watchFor: [
            AttributedBullet("ESTROGEN — oral OCPs increase CBG → falsely elevated total cortisol; discontinue 4-6 weeks before testing.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("CYP3A4 INDUCERS (phenytoin, carbamazepine, rifampin, phenobarbital) — rapid dexamethasone metabolism → false non-suppression.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("EXOGENOUS GLUCOCORTICOIDS — inhaled, topical, joint, OTC — Cushing mimics; thorough medication history.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("PSEUDO-CUSHING — depression, alcoholism, severe obesity, sleep apnea — can have false-positive cortisol elevation + non-suppression; differentiate with desmopressin stimulation test or DXM-CRH test.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("MIDNIGHT TIMING — sleep schedule + adherence critical; hospital admission may be necessary.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("CYCLIC CUSHING — intermittent secretion; multiple 24-h urine collections at different times needed.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("EXTRA-PITUITARY ACTH sources — small cell lung cancer, bronchial / thymic / pancreatic NETs, medullary thyroid cancer; imaging + DOTATATE PET.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("PREGNANCY + CRITICAL ILLNESS — cortisol naturally elevated; tests unreliable.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("INPATIENT alternative — sleep / timing controlled; medication interference minimized.", citationIDs: ["openrn_pr_round29"])
        ],
        citations: [openrnPRR29, cdcPRR29, specialtyPRR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IPSSSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "inferior-petrosal-sinus-sampling",
        title: "Inferior petrosal sinus sampling (IPSS)",
        subtitle: "Cushing localization · pituitary vs ectopic ACTH · interventional radiology · femoral venous access · CRH stimulation · central:peripheral ratio",
        nclexTags: procTagsR29,
        indications: AttributedProse(
            "Localization of ACTH source in confirmed Cushing syndrome — distinguishes Cushing disease (pituitary adenoma) from ectopic ACTH-secreting tumor (small cell lung cancer, bronchial NETs, etc.). Performed when biochemical testing + pituitary MRI are inconclusive (~30% of pituitary adenomas are <6 mm + may be missed on MRI). Gold standard for pituitary vs ectopic differentiation per primary source.",
            citationIDs: ["specialty_pr_round29"]
        ),
        contraindications: AttributedProse(
            "Severe coagulopathy / anticoagulation, contrast allergy (premedicate), pregnancy, severe renal impairment (contrast nephropathy), unable to tolerate supine.",
            citationIDs: ["specialty_pr_round29"]
        ),
        equipment: [
            AttributedBullet("Interventional radiology + experienced operator + specialized catheters (microcatheters to inferior petrosal sinus).", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Fluoroscopy + contrast.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Corticotropin-releasing hormone (CRH) for stimulation (100 mcg IV or 1 mcg/kg) OR desmopressin (DDAVP 10 mcg IV).", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Specimen tubes for ACTH from bilateral IPS + peripheral; freezer for samples.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Conscious sedation + monitoring; coagulation supplies; emergency airway.", citationIDs: ["openrn_pr_round29"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders + consent; review indication.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("LABS — CBC, INR/PT, BUN/Cr, type/screen; contrast allergy assessment; pregnancy test.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("DISCONTINUE anticoagulants per institutional protocol.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("NPO 6-8 hours.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("IV access bilateral; supplemental O2; conscious sedation prep.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Cushing workup confirmed first — biochemical + DST + pituitary MRI; IPSS only for inconclusive cases.", citationIDs: ["specialty_pr_round29"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Femoral venous access + setup", body: "Bilateral femoral vein access; sheath placement; sterile prep; conscious sedation; supine.", citationIDs: ["openrn_pr_round29"]),
            ProcedureStep(number: 2, title: "Catheter advancement", body: "Microcatheters advanced through femoral → IVC → SVC → internal jugular → inferior petrosal sinus bilaterally; fluoroscopy + contrast confirmation.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 3, title: "Baseline ACTH samples", body: "Simultaneous samples from bilateral IPS + peripheral vein (femoral or antecubital) at baseline (T0).", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 4, title: "CRH stimulation", body: "Corticotropin-releasing hormone (CRH) 100 mcg IV (or 1 mcg/kg) administered.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 5, title: "Post-stimulation samples", body: "Simultaneous samples from bilateral IPS + peripheral at 3, 5, 10 minutes post-CRH; some protocols additional times.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 6, title: "Interpretation criteria", body: "BASELINE central:peripheral ACTH ratio ≥2:1 → CUSHING DISEASE (pituitary source); POST-CRH ratio ≥3:1 → CUSHING DISEASE; <2:1 baseline + <3:1 post-CRH → ECTOPIC ACTH source. RIGHT vs LEFT lateralization helps surgical planning (~70% accurate for side of microadenoma) per primary source.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 7, title: "Catheter removal + recovery", body: "Catheters removed; femoral hemostasis (manual pressure 15-30 min); supine bed rest 2-4 hours; vital signs + groin assessment.", citationIDs: ["openrn_pr_round29"])
        ],
        postProcedure: [
            AttributedBullet("Bed rest supine × 2-4 hours; vital signs + groin checks for hematoma; pulse + sensation distal.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Resume diet + ambulation after 4-6 hours if stable.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Resume anticoagulation per protocol.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Endocrinology + neurosurgery follow-up; results in 1-3 days.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("If Cushing disease — transsphenoidal pituitary surgery; if ectopic — chest CT + somatostatin receptor imaging.", citationIDs: ["specialty_pr_round29"])
        ],
        documentation: [
            AttributedBullet("Indication, sedation, contrast volume, technical success of bilateral IPS catheterization, samples obtained, CRH administered, hemostasis.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("ACTH values bilateral IPS + peripheral at baseline + post-CRH; ratios.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Complications + follow-up.", citationIDs: ["openrn_pr_round29"])
        ],
        watchFor: [
            AttributedBullet("BRAINSTEM INFARCTION + CRANIAL NERVE injury — rare but devastating; experienced operator essential; thrombus from prolonged catheter.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("FEMORAL HEMATOMA / RETROPERITONEAL BLEEDING — femoral access; manual pressure + monitoring + ultrasound if suspected.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("CONTRAST NEPHROPATHY — hydration, monitor creatinine; pre-existing CKD higher risk.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("THROMBOEMBOLISM — DVT / PE from procedure; selective use.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("FALSE NEGATIVE — cyclic Cushing + small adenomas can give equivocal results; clinical correlation.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("FAILED CATHETERIZATION — anatomic variants; consider repeat or alternate technique.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("CONTROVERSIAL — desmopressin alternative to CRH in some protocols; CRH shortage occasionally.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("SURGICAL plan — Cushing disease → transsphenoidal pituitary surgery; lateralization guides surgeon.", citationIDs: ["specialty_pr_round29"])
        ],
        citations: [openrnPRR29, cdcPRR29, specialtyPRR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TranssphenoidalSurgerySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "transsphenoidal-pituitary-surgery-care",
        title: "Transsphenoidal pituitary surgery — perioperative care",
        subtitle: "Endoscopic endonasal pituitary surgery · DI + SIADH risk · CSF leak · hormone replacement · stress steroids · neuro + sodium monitoring",
        nclexTags: procTagsR29,
        indications: AttributedProse(
            "Pituitary surgery for adenomas — functioning (Cushing disease, acromegaly, prolactinoma refractory to medical, TSH-secreting) + non-functioning macroadenomas with mass effect (visual field defects, hypopituitarism). Microsurgical OR endoscopic endonasal approach through sphenoid sinus to sella turcica. Experienced pituitary surgeon + multidisciplinary team per primary source.",
            citationIDs: ["specialty_pr_round29"]
        ),
        contraindications: AttributedProse(
            "Active sinusitis / nasal infection; severe systemic illness; coagulopathy uncorrected; pregnancy (relative — defer if possible); severe cardiopulmonary disease.",
            citationIDs: ["specialty_pr_round29"]
        ),
        equipment: [
            AttributedBullet("OR with neurosurgery + ENT + anesthesia teams; endoscopic equipment; microscope; navigation system.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Hormone replacement medications — hydrocortisone, levothyroxine, desmopressin (DDAVP), sex hormones as needed.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Sodium + osmolality monitoring; strict I/O; urine specific gravity.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("CSF leak assessment supplies — beta-2 transferrin test if suspected.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Neurologic + visual field monitoring.", citationIDs: ["openrn_pr_round29"])
        ],
        preProcedure: [
            AttributedBullet("Comprehensive endocrine assessment — pituitary hormone panel; stress dose hydrocortisone if cortisol deficient OR planned during surgery.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("MRI pituitary + visual fields + neuroophthalmology evaluation.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Acromegaly — pre-op somatostatin analog × 3-6 months may shrink tumor + improve outcomes; airway evaluation (macroglossia, OSA).", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Cushing — pre-op metyrapone or ketoconazole to reduce cortisol; perioperative stress dosing.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Prolactinoma — usually medical (cabergoline first); surgery for refractory / apoplexy / acute visual.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Patient education — endoscopic endonasal; expected nasal discharge; possible CSF leak repair; hormone replacement timeline; sodium monitoring.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Pregnancy test; coagulation; multidisciplinary team coordination.", citationIDs: ["openrn_pr_round29"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Preoperative", body: "Stress-dose hydrocortisone (50-100 mg IV before induction); baseline neurologic + visual field + electrolytes + cortisol; surgical site marking; antibiotic prophylaxis.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 2, title: "Intraoperative monitoring", body: "Vital signs; ECG; neuromuscular blockade; hemodynamic + diuresis monitoring; intraoperative MRI / navigation for tumor location.", citationIDs: ["openrn_pr_round29"]),
            ProcedureStep(number: 3, title: "Endoscopic endonasal approach", body: "Sphenoid sinus through nasal cavity → sella turcica; tumor resection (selective in microadenoma vs debulking in macroadenoma); preserve normal gland; visual field protection.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 4, title: "Reconstruction + closure", body: "Sellar floor reconstruction (fat graft, fascia, nasoseptal flap, synthetic) — prevents CSF leak; nasal packing.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 5, title: "Immediate post-op care", body: "ICU or specialized stepdown × 24-48 hours; vital signs + neuro + visual q1-2 hours; I/O strict; urine specific gravity; sodium + osmolality q6 hours initially; supplemental O2; head of bed 30°.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 6, title: "Hormone replacement", body: "HYDROCORTISONE 50-100 mg IV q8 hours × 24-48 hours then taper to maintenance 15-25 mg/day if ACTH-deficient OR pre-op deficient; LEVOTHYROXINE after adrenal replacement; sex hormones gradually; DESMOPRESSIN for DI.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 7, title: "Monitoring for complications", body: "DIABETES INSIPIDUS (~25% transient, ~5% permanent) — polyuria + dilute urine + rising sodium; SIADH (post-op day 5-9 \"triphasic\" pattern) — hyponatremia; CSF LEAK — clear nasal discharge + beta-2 transferrin; ADRENAL CRISIS — hypotension + hypoglycemia.", citationIDs: ["specialty_pr_round29"]),
            ProcedureStep(number: 8, title: "Discharge planning", body: "Hormone replacement education + stress dose card + emergency injectable hydrocortisone; sodium + osmolality follow-up; pituitary MRI 3-6 months; visual fields; multidisciplinary follow-up.", citationIDs: ["specialty_pr_round29"])
        ],
        postProcedure: [
            AttributedBullet("Strict I/O monitoring + urine specific gravity + sodium + osmolality q6 hours × 48 hours, then q12 hours; transition to maintenance medication regimen.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Nasal hygiene — saline rinses; avoid nose blowing × 2 weeks (CSF leak); avoid straws; avoid heavy lifting × 6 weeks.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Hormone replacement — stress dose card + emergency injectable + medical alert.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Visual field re-evaluation, pituitary MRI at 3-6 months, comprehensive pituitary axis testing.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + neurosurgery + ENT + ophthalmology + neuroradiology.", citationIDs: ["specialty_pr_round29"])
        ],
        documentation: [
            AttributedBullet("Surgical procedure, tumor type + completeness of resection, complications, hormones administered, electrolytes, urine output, neurologic findings.", citationIDs: ["openrn_pr_round29"]),
            AttributedBullet("Discharge medications, stress dose card, follow-up plan, emergency contact info.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("Patient education completed.", citationIDs: ["openrn_pr_round29"])
        ],
        watchFor: [
            AttributedBullet("DIABETES INSIPIDUS — most common post-op endocrine complication (~25%, often transient); polyuria + dilute urine + rising sodium; DESMOPRESSIN (DDAVP) replacement; usually transient but can be permanent.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("SIADH — \"triphasic\" pattern post-op days 5-9; hyponatremia; FLUID RESTRICTION; can be life-threatening if severe.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("ADRENAL INSUFFICIENCY — pre-op or post-op deficient; cortisol replacement; STRESS DOSING for any illness / procedure; emergency injectable hydrocortisone.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("HYPOPITUITARISM — multiple anterior pituitary deficiencies; comprehensive replacement; lifelong management.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("CSF LEAK — clear rhinorrhea; meningitis risk; beta-2 transferrin confirms; possible lumbar drain or surgical repair; bed rest + head elevation.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("MENINGITIS — fever + headache + meningismus + altered mental status post-op; emergent LP + antibiotics.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("VISUAL FIELD changes — chiasm compression or injury; emergent eval.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("BLEEDING / HEMORRHAGE — pituitary apoplexy post-op; emergent.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("EPISTAXIS — nasal packing manages.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("CRANIAL NERVE injury — uncommon; visual + extraocular monitoring.", citationIDs: ["specialty_pr_round29"]),
            AttributedBullet("SODIUM dysregulation — close monitoring; sudden change → DI vs SIADH workup.", citationIDs: ["specialty_pr_round29"])
        ],
        citations: [openrnPRR29, cdcPRR29, specialtyPRR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CushingWorkupSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cushing-workup",
        title: "Cushing syndrome workup algorithm",
        subtitle: "3-step diagnosis · screening (24h UFC + DST + late-night salivary) → confirmation → localization (ACTH + DST high-dose + MRI + IPSS + chest CT)",
        eyebrow: "REFERENCE · ENDOCRINE",
        nclexTags: refTagsR29,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Cushing syndrome (hypercortisolism) workup follows three-step algorithm — (1) screening to identify hypercortisolism, (2) confirmation, (3) localization of source (pituitary vs ectopic vs adrenal). Endocrine Society 2008 guidelines + ongoing updates. Differentiate from pseudo-Cushing (depression, alcoholism, severe obesity). Treatment depends on etiology — pituitary surgery, adrenalectomy, ectopic tumor resection, medical management per primary source.",
                citationIDs: ["specialty_pr_round29"]
            )),
            .keyValueTable(title: "Step 1 — Screening (any 2 abnormal confirm)", [
                KeyValueRow(key: "24-h urine free cortisol (UFC)", value: ">3× ULN (typically >330 mcg/24h women, >265 mcg/24h men) — diagnostic; multiple collections (2-3) needed for cyclic / intermittent disease"),
                KeyValueRow(key: "Late-night salivary cortisol", value: ">100-200 ng/dL (~3-5 nmol/L) — loss of circadian rhythm; non-invasive home test × 2 nights"),
                KeyValueRow(key: "Overnight 1 mg dexamethasone suppression test (DST)", value: "Failure to suppress AM cortisol below 1.8 mcg/dL → suggests Cushing; consider 2-day low-dose DST for confirmation"),
                KeyValueRow(key: "Combined", value: "≥2 of 3 abnormal screens confirm Cushing syndrome")
            ]),
            .keyValueTable(title: "Step 2 — Confirmation + differentiate from pseudo-Cushing", [
                KeyValueRow(key: "Low-dose 2-day DST", value: "Dexamethasone 0.5 mg PO q6h × 8 doses; failure to suppress confirms; superior to overnight"),
                KeyValueRow(key: "Dex-CRH test", value: "After 2-day low-dose DST, administer CRH; suppression in pseudo-Cushing, persistent elevation in Cushing"),
                KeyValueRow(key: "Desmopressin (DDAVP) test", value: "Cushing disease may respond; pseudo-Cushing does not; investigational"),
                KeyValueRow(key: "Late-night salivary cortisol", value: "Most sensitive for cyclic + mild Cushing; multiple nights"),
                KeyValueRow(key: "Pseudo-Cushing causes", value: "Depression, alcoholism, severe obesity, sleep apnea, chronic kidney disease, critical illness — confounding cortisol elevation")
            ]),
            .keyValueTable(title: "Step 3 — Localization (ACTH-dependent vs independent)", [
                KeyValueRow(key: "ACTH measurement", value: "DETERMINES — SUPPRESSED ACTH (<5 pg/mL) → ACTH-INDEPENDENT (adrenal Cushing); ELEVATED OR NORMAL ACTH (>10-20 pg/mL) → ACTH-DEPENDENT (pituitary OR ectopic)"),
                KeyValueRow(key: "High-dose 8 mg DST (or 2 mg q6h × 2 days)", value: "ACTH-dependent: >50% suppression → CUSHING DISEASE (pituitary); <50% → ECTOPIC ACTH (lung NET, small cell, others)"),
                KeyValueRow(key: "Pituitary MRI with gadolinium", value: "Identifies adenoma in ~70-80% of Cushing disease; ~30% adenomas <6 mm + may be missed; macroadenoma vs microadenoma"),
                KeyValueRow(key: "Inferior petrosal sinus sampling (IPSS)", value: "GOLD STANDARD when MRI inconclusive + biochemical ACTH-dependent; central:peripheral ACTH ratio ≥2:1 baseline OR ≥3:1 post-CRH → Cushing disease"),
                KeyValueRow(key: "Chest + abdominal CT", value: "ECTOPIC ACTH source — lung NET (bronchial carcinoid), small cell, thymic + pancreatic NETs, medullary thyroid"),
                KeyValueRow(key: "DOTATATE PET-CT", value: "Somatostatin receptor imaging for ectopic ACTH NETs"),
                KeyValueRow(key: "Adrenal CT/MRI", value: "ACTH-independent (suppressed ACTH) — adenoma, carcinoma, bilateral hyperplasia, primary pigmented nodular adrenal disease")
            ]),
            .bullets(title: "Causes by category", [
                AttributedBullet("ACTH-DEPENDENT (~80%) — CUSHING DISEASE (pituitary ACTH-secreting adenoma, 70-80% of Cushing); ECTOPIC ACTH (10-15% — small cell lung cancer, bronchial / thymic / pancreatic NETs, medullary thyroid carcinoma).", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("ACTH-INDEPENDENT (~20%) — adrenal adenoma (10%), adrenal carcinoma (5%), bilateral macronodular adrenal hyperplasia, primary pigmented nodular adrenal disease.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("EXOGENOUS GLUCOCORTICOID — MOST COMMON CAUSE of Cushing syndrome overall; iatrogenic; history-based diagnosis.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("MEN-1 — sometimes associated with Cushing (pituitary + ACTH-secreting NET).", citationIDs: ["specialty_pr_round29"])
            ]),
            .bullets(title: "Common pitfalls + interferences", [
                AttributedBullet("ESTROGEN (oral OCPs, HRT) — increases cortisol-binding globulin (CBG) → falsely elevated total cortisol; discontinue 4-6 weeks before testing.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("CYP3A4 INDUCERS (phenytoin, carbamazepine, rifampin, phenobarbital) — rapid dexamethasone clearance → false non-suppression.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("EXOGENOUS GLUCOCORTICOIDS — inhaled, topical, joint injections, OTC creams — Cushing mimics + suppressed endogenous cortisol; thorough medication history.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("PSEUDO-CUSHING — depression, alcoholism, severe obesity, sleep apnea — false-positive cortisol elevation + non-suppression.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("CYCLIC CUSHING — intermittent secretion; multiple 24-h urine collections at different times; serial late-night salivary cortisol.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("MICROADENOMA missed on MRI (~30%) — IPSS gold standard.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("PREGNANCY + CRITICAL ILLNESS — cortisol naturally elevated; tests unreliable.", citationIDs: ["specialty_pr_round29"])
            ]),
            .bullets(title: "Treatment by etiology", [
                AttributedBullet("Cushing disease — TRANSSPHENOIDAL pituitary surgery (cure rate 70-90% microadenoma, 30-65% macroadenoma); residual / refractory → radiation, medical (cabergoline, somatostatin pasireotide, ketoconazole, metyrapone, mifepristone, osilodrostat), bilateral adrenalectomy.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Ectopic ACTH — surgical resection of source (lung NET, etc.); somatostatin analogs; chemotherapy if metastatic; medical management of cortisol excess.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Adrenal adenoma — UNILATERAL adrenalectomy; pre + post-op cortisol replacement until contralateral recovers.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Adrenal carcinoma — wide excision + mitotane + chemotherapy; poor prognosis.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Iatrogenic — taper glucocorticoid + replace if adrenal suppression.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Medical control of cortisol (bridging or non-surgical) — KETOCONAZOLE, METYRAPONE, OSILODROSTAT, MIFEPRISTONE (glucocorticoid receptor antagonist), MITOTANE; PASIREOTIDE (pituitary somatostatin agonist for Cushing disease); CABERGOLINE (dopamine agonist for Cushing disease).", citationIDs: ["specialty_pr_round29"])
            ]),
            .bullets(title: "Post-cure follow-up", [
                AttributedBullet("ADRENAL INSUFFICIENCY post-cure — months-years for HPA axis recovery; hydrocortisone replacement + stress dosing + emergency injectable.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("RECURRENCE — Cushing disease ~10-30%; long-term surveillance with 24-h UFC + late-night salivary q6 months × 5 years → annual.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Cushing comorbidities — diabetes, hypertension, osteoporosis, mood, cardiovascular — improve but may persist; comprehensive multidisciplinary management.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Quality of life — body image, depression, cognitive; counseling.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Family screening if MEN-1.", citationIDs: ["specialty_pr_round29"])
            ])
        ],
        citations: [openrnPRR29, cdcPRR29, specialtyPRR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MENOverviewSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "multiple-endocrine-neoplasia",
        title: "Multiple endocrine neoplasia (MEN) overview",
        subtitle: "MEN-1 (3 P's — parathyroid + pituitary + pancreatic NET) vs MEN-2A (medullary thyroid + pheo + HPT) vs MEN-2B (MTC + pheo + mucosal neuromas + marfanoid)",
        eyebrow: "REFERENCE · ENDOCRINE",
        nclexTags: refTagsR29,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Multiple endocrine neoplasia (MEN) syndromes — autosomal dominant familial tumor predisposition syndromes characterized by tumors of multiple endocrine glands. Three main types — MEN-1 (MEN1 gene, menin tumor suppressor), MEN-2A + MEN-2B (RET proto-oncogene), and the newer MEN-4 (CDKN1B). Genetic testing identifies + enables cascade family screening + surveillance + earlier intervention. Each type has characteristic tumor patterns + management strategies per primary source.",
                citationIDs: ["specialty_pr_round29"]
            )),
            .keyValueTable(title: "MEN-1 — \"3 P's\" (menin gene)", [
                KeyValueRow(key: "Gene + inheritance", value: "MEN1 gene (chromosome 11q13), autosomal dominant, high penetrance (>90% by age 50), ~10% de novo"),
                KeyValueRow(key: "Primary hyperparathyroidism", value: "~90% by age 50 (earliest manifestation, often <40 years), multigland, younger than sporadic, recurrence ~50% by 10 years; subtotal parathyroidectomy preferred"),
                KeyValueRow(key: "Pancreatic + duodenal NETs", value: "~70% — gastrinoma (Zollinger-Ellison), insulinoma, VIPoma, glucagonoma, non-functional; often multifocal + duodenal gastrinomas; MAJOR cause of mortality"),
                KeyValueRow(key: "Pituitary adenoma", value: "~30-40% — prolactinoma most common, GH/acromegaly, ACTH/Cushing, TSH, non-functional"),
                KeyValueRow(key: "Adrenal cortical tumors", value: "~30% — adenomas (functional or non-functional); aldosterone OR cortisol OR androgen"),
                KeyValueRow(key: "Bronchial + thymic NETs", value: "Uncommon but increased risk; thymic NETs aggressive in MEN-1"),
                KeyValueRow(key: "Cutaneous", value: "Angiofibromas, collagenomas, lipomas, café-au-lait spots"),
                KeyValueRow(key: "Screening (begin age 5-10)", value: "Annual calcium + PTH + prolactin + IGF-1 + ACTH + gastrin + insulin/C-peptide + chromogranin A; pituitary MRI q3-5 years; abdominal CT/MRI/EUS q1-3 years; chest CT q3-5 years"),
                KeyValueRow(key: "NOT FEATURES", value: "Pheochromocytoma (that's MEN-2), medullary thyroid (MEN-2), parathyroid carcinoma (rare)")
            ]),
            .keyValueTable(title: "MEN-2A (RET gene)", [
                KeyValueRow(key: "Gene + inheritance", value: "RET proto-oncogene (chromosome 10q11.2), autosomal dominant, codon-specific risk; ~10% de novo"),
                KeyValueRow(key: "Medullary thyroid carcinoma (MTC)", value: "~100% lifetime risk; calcitonin marker; aggressive variants in MEN-2B (early childhood); MEN-2A typically adolescent-adult onset"),
                KeyValueRow(key: "Pheochromocytoma", value: "~50% — bilateral common; presents 30-40s; alpha-blockade essential before surgery; cortical-sparing adrenalectomy"),
                KeyValueRow(key: "Primary hyperparathyroidism", value: "~30% — multigland; selective surgery; less recurrence than MEN-1"),
                KeyValueRow(key: "Cutaneous lichen amyloidosis", value: "MEN-2A specific marker; pruritic upper back patches"),
                KeyValueRow(key: "Hirschsprung disease", value: "~7% of MEN-2A; congenital aganglionosis"),
                KeyValueRow(key: "FMTC variant", value: "Familial MTC — MTC only, no pheo or HPT; specific RET codons"),
                KeyValueRow(key: "Prophylactic thyroidectomy", value: "Based on RET codon — codon 634 (high-risk) → before age 5; moderate-risk → before adolescence; ATA risk stratification per primary source")
            ]),
            .keyValueTable(title: "MEN-2B (RET gene — codon 918 typically)", [
                KeyValueRow(key: "Gene + inheritance", value: "RET proto-oncogene M918T mutation in ~95%; autosomal dominant; high de novo rate (~50%) — often new mutations"),
                KeyValueRow(key: "Medullary thyroid carcinoma (MTC)", value: "~100%, often AGGRESSIVE INFANTILE onset; prophylactic thyroidectomy in INFANCY ESSENTIAL"),
                KeyValueRow(key: "Pheochromocytoma", value: "~50%; bilateral common; same management as MEN-2A"),
                KeyValueRow(key: "Mucosal neuromas", value: "PATHOGNOMONIC — lips + tongue + buccal mucosa + GI tract neuromas"),
                KeyValueRow(key: "Marfanoid habitus", value: "Tall + long extremities + joint laxity; resembles Marfan without aortic involvement"),
                KeyValueRow(key: "Intestinal ganglioneuromatosis", value: "Megacolon, constipation, abdominal pain; sometimes pediatric diagnosis"),
                KeyValueRow(key: "Medullated corneal nerves", value: "Slit lamp finding"),
                KeyValueRow(key: "NO primary hyperparathyroidism (unlike MEN-2A)", value: "Distinguishing feature"),
                KeyValueRow(key: "Prophylactic thyroidectomy", value: "Infancy (within first year of life) — critical due to aggressive MTC")
            ]),
            .keyValueTable(title: "MEN-4 (CDKN1B gene — rare)", [
                KeyValueRow(key: "Gene", value: "CDKN1B (p27) tumor suppressor; less penetrant than MEN-1; autosomal dominant"),
                KeyValueRow(key: "Phenotype", value: "Primary hyperparathyroidism + pituitary adenoma + occasional NETs + uterine + breast tumors"),
                KeyValueRow(key: "Diagnosis", value: "MEN-1 phenotype but MEN1 gene negative → consider MEN-4"),
                KeyValueRow(key: "Management", value: "Similar to MEN-1; surveillance + family screening")
            ]),
            .bullets(title: "Differential considerations", [
                AttributedBullet("VON HIPPEL-LINDAU (VHL) — pheochromocytoma + paraganglioma + renal cell carcinoma + cerebellar hemangioblastoma + retinal hemangiomas + endolymphatic sac tumors + pancreatic NETs (non-functional) + cysts; VHL gene.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("NEUROFIBROMATOSIS TYPE 1 (NF-1) — café-au-lait spots + neurofibromas + pheochromocytoma (~5%) + optic glioma + Lisch nodules + skeletal; NF1 gene.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("FAMILIAL PARAGANGLIOMA SYNDROMES — SDHB, SDHC, SDHD, SDHAF2, TMEM127, MAX; sympathetic + parasympathetic paragangliomas; malignant risk varies by gene.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("CARNEY COMPLEX — Cushing + acromegaly + cardiac myxomas + skin pigmentation + Sertoli cell tumors; PRKAR1A gene.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("MCCUNE-ALBRIGHT SYNDROME — fibrous dysplasia + café-au-lait + multiple endocrinopathies; GNAS mosaic mutation.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("FAMILIAL ISOLATED PITUITARY ADENOMA (FIPA) — AIP gene; pituitary tumors only, often acromegaly.", citationIDs: ["specialty_pr_round29"])
            ]),
            .bullets(title: "Surveillance + management principles", [
                AttributedBullet("GENETIC TESTING + COUNSELING — confirm diagnosis + cascade family testing; insurance + legal implications.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("MULTIDISCIPLINARY MEN clinic — endocrinology + surgery + GI + radiology + oncology + genetics + nursing coordination; coordinated lifelong surveillance.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("BIOCHEMICAL surveillance — relevant hormones + tumor markers per syndrome; age-stratified protocols.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("IMAGING surveillance — pituitary MRI, abdominal CT/MRI/EUS, neck US, chest CT per protocol.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("PROPHYLACTIC SURGERY — MEN-2 thyroidectomy timing critical; MEN-1 timing of pancreatic surgery individualized.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("PHEOCHROMOCYTOMA workup BEFORE any thyroid or other surgery in MEN-2.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("PSYCHOSOCIAL support — chronic illness + lifelong surveillance + family implications + body image (children of affected); counseling + support groups.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("LIFELONG follow-up — surveillance burden but cancer mortality reduced + earlier intervention.", citationIDs: ["specialty_pr_round29"])
            ])
        ],
        citations: [openrnPRR29, cdcPRR29, specialtyPRR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NETClassificationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "neuroendocrine-tumor-classification",
        title: "Neuroendocrine tumor (NET) classification + management",
        subtitle: "WHO 2019 + ENETS · functional vs non-functional · GI/pancreas/lung primary · DOTATATE PET · somatostatin analogs + PRRT + targeted therapy",
        eyebrow: "REFERENCE · ENDOCRINE",
        nclexTags: refTagsR29,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Neuroendocrine tumors (NETs) — heterogeneous group of tumors arising from neuroendocrine cells throughout body. Most common sites — gastrointestinal (small bowel, pancreas, stomach, rectum, appendix), lung (bronchial / pulmonary), thymic, others. Classified by site, grade (Ki-67 proliferation), differentiation, functional status (hormone secretion). Treatment depends on stage, grade, location, function — surgery, somatostatin analogs, chemotherapy, targeted therapy (everolimus, sunitinib), PRRT (Lutetium-177 DOTATATE), liver-directed therapy per primary source.",
                citationIDs: ["specialty_pr_round29"]
            )),
            .keyValueTable(title: "WHO 2019 + ENETS classification by grade (Ki-67)", [
                KeyValueRow(key: "G1 (low grade)", value: "Ki-67 <3%; mitotic count <2/10 HPF; well-differentiated; indolent course; majority of GI NETs"),
                KeyValueRow(key: "G2 (intermediate)", value: "Ki-67 3-20%; mitotic count 2-20/10 HPF; well-differentiated; intermediate prognosis"),
                KeyValueRow(key: "G3 well-differentiated NET", value: "Ki-67 >20%; well-differentiated; better prognosis than NEC"),
                KeyValueRow(key: "NEC (neuroendocrine carcinoma)", value: "Ki-67 >20%; POORLY differentiated; small cell or large cell; aggressive; chemotherapy-responsive but recurrent"),
                KeyValueRow(key: "MANEC / MiNEN", value: "Mixed adenoneuroendocrine carcinoma; both components")
            ]),
            .keyValueTable(title: "Pancreatic NETs (functional)", [
                KeyValueRow(key: "Insulinoma", value: "Insulin → hypoglycemia (Whipple triad); 72-h fast diagnostic; surgical resection curative; ~90% benign + solitary"),
                KeyValueRow(key: "Gastrinoma (Zollinger-Ellison)", value: "Gastrin → refractory PUD + diarrhea; duodenum + pancreas \"gastrinoma triangle\"; high-dose PPI + surgical resection; 25% MEN-1"),
                KeyValueRow(key: "VIPoma (Verner-Morrison syndrome)", value: "VIP → secretory diarrhea + hypokalemia + achlorhydria (WDHA syndrome); octreotide + surgery"),
                KeyValueRow(key: "Glucagonoma", value: "Glucagon → necrolytic migratory erythema + diabetes + weight loss + DVT + 4Ds (diabetes, dermatitis, depression, DVT); octreotide + surgery"),
                KeyValueRow(key: "Somatostatinoma", value: "Somatostatin → diabetes + steatorrhea + cholelithiasis triad; surgery"),
                KeyValueRow(key: "Non-functional pancreatic NETs", value: "No hormone syndrome; mass effect or incidental; surgery if >2 cm; observation small; majority of pancreatic NETs")
            ]),
            .keyValueTable(title: "GI carcinoid (mid-gut + others)", [
                KeyValueRow(key: "Midgut carcinoid (ileal, appendiceal, cecal)", value: "Serotonin-secreting; CARCINOID SYNDROME with liver metastases (~50% of metastatic) — flushing, watery diarrhea, wheezing, abdominal pain, right-sided heart failure (carcinoid heart disease)"),
                KeyValueRow(key: "Foregut (gastric, duodenal, bronchial, thymic)", value: "Variable hormones; atypical carcinoid syndrome (histamine-mediated flushing)"),
                KeyValueRow(key: "Hindgut (rectal, sigmoid)", value: "Typically NON-functional; incidental finding; small <1 cm usually benign"),
                KeyValueRow(key: "Appendiceal", value: "Often incidental at appendectomy; <1 cm usually cured by appendectomy; >2 cm + invasive → right hemicolectomy"),
                KeyValueRow(key: "Carcinoid heart disease", value: "Right-sided valvular disease (tricuspid regurgitation + pulmonic stenosis); ~50% of serotonin-secreting metastatic; cardiac surgery + valve replacement")
            ]),
            .keyValueTable(title: "Pulmonary NETs", [
                KeyValueRow(key: "Typical carcinoid", value: "Low grade; central airway; cough, hemoptysis, wheeze, post-obstructive pneumonia; surgical resection curative often"),
                KeyValueRow(key: "Atypical carcinoid", value: "Higher grade than typical; more aggressive"),
                KeyValueRow(key: "Small cell lung cancer (SCLC)", value: "POORLY differentiated NEC; smoking-related; aggressive; chemotherapy + immunotherapy + radiation; often ectopic ACTH or SIADH"),
                KeyValueRow(key: "Large cell neuroendocrine carcinoma", value: "Aggressive NEC; similar treatment to SCLC")
            ]),
            .keyValueTable(title: "Biomarkers + imaging", [
                KeyValueRow(key: "Chromogranin A (CgA)", value: "General NET marker; ~70-90% sensitivity; PPI elevations + many false positives; trend useful for treatment response"),
                KeyValueRow(key: "24-h urine 5-HIAA", value: "Serotonin metabolite; carcinoid syndrome (mid-gut NETs); diet restriction × 3 days"),
                KeyValueRow(key: "Specific biomarkers", value: "Gastrin, insulin/C-peptide, glucagon, VIP, pancreatic polypeptide, calcitonin (medullary thyroid)"),
                KeyValueRow(key: "DOTATATE PET-CT", value: "GOLD STANDARD imaging for somatostatin-receptor-positive NETs (G1-G2); superior to octreotide scan; staging + selection for PRRT"),
                KeyValueRow(key: "FDG PET-CT", value: "For high-grade NEC + G3 NETs (loss of somatostatin receptors)"),
                KeyValueRow(key: "MRI / CT abdominal / pelvic", value: "Anatomic staging"),
                KeyValueRow(key: "EUS-FNA", value: "Pancreatic NETs + duodenal gastrinomas")
            ]),
            .bullets(title: "Treatment principles", [
                AttributedBullet("SURGERY — first-line for localized + curative when feasible; \"debulking\" sometimes helpful for metastatic.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("SOMATOSTATIN ANALOGS — octreotide LAR (Sandostatin LAR 20-40 mg IM q4 weeks) OR lanreotide (Somatuline 120 mg deep SC q4 weeks); first-line for symptomatic + advanced; tumor stabilization + symptom control.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("EVEROLIMUS (Afinitor) — mTOR inhibitor; pancreatic + GI NETs progressing on somatostatin; daily PO.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("SUNITINIB (Sutent) — multi-TKI; pancreatic NETs; daily PO.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("PRRT (Lutetium-177 DOTATATE — Lutathera) — transformative for somatostatin-receptor-positive metastatic NETs; specialized centers; significant survival benefit.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("CHEMOTHERAPY — high-grade NEC (cisplatin/carboplatin + etoposide); G3 NET (capecitabine + temozolomide; streptozocin + 5-FU); pancreatic NET responsive.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("LIVER-DIRECTED THERAPY — TACE (transarterial chemoembolization), radioembolization (Y-90), ablation (RFA, microwave), surgical resection of liver mets.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("INTERFERON-α — older; second-line; immunomodulation.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Symptomatic management — octreotide rescue for carcinoid crisis (prophylactic before procedures); niacin for pellagra; loop diuretics for carcinoid heart disease.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Multidisciplinary NET center — endocrinology + medical oncology + surgery + interventional radiology + nuclear medicine + nutritionist + specialty nursing.", citationIDs: ["specialty_pr_round29"])
            ])
        ],
        citations: [openrnPRR29, cdcPRR29, specialtyPRR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum OsteoporosisScreeningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "osteoporosis-screening-frax",
        title: "Osteoporosis screening + FRAX fracture risk + treatment",
        subtitle: "DEXA T-score · FRAX 10-year risk · bisphosphonate / denosumab / teriparatide / romosozumab · vertebral fracture detection · calcium + vitamin D",
        eyebrow: "REFERENCE · ENDOCRINE",
        nclexTags: refTagsR29,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Osteoporosis — skeletal disorder of compromised bone strength predisposing to fracture. Major morbidity + mortality in elderly. NOF + USPSTF + Endocrine Society guidelines for screening + diagnosis + treatment. DEXA + FRAX fracture risk assessment guide intervention. Multiple treatments — antiresorptives (bisphosphonates, denosumab) + anabolics (teriparatide, abaloparatide, romosozumab) per primary source.",
                citationIDs: ["specialty_pr_round29"]
            )),
            .keyValueTable(title: "Screening recommendations", [
                KeyValueRow(key: "Women ≥65 years", value: "Universal DEXA screening (USPSTF Grade B)"),
                KeyValueRow(key: "Men ≥70 years", value: "Universal DEXA screening (less consensus; NOF + Endo Society support)"),
                KeyValueRow(key: "Younger with risk factors", value: "Postmenopausal women + men 50-70 years with risk factors — FRAX-based; risk factors include low BMI, prior fragility fracture, parental hip fracture, smoking, alcohol >3/day, glucocorticoid use, RA, secondary osteoporosis (hypogonadism, hyperthyroidism, malabsorption)"),
                KeyValueRow(key: "Frequency", value: "Every 2 years if osteoporosis or osteopenia + risk; every 5 years if normal + low risk"),
                KeyValueRow(key: "Vertebral fracture assessment (VFA)", value: "Lateral spine imaging + DEXA; detects asymptomatic vertebral fractures (silent fractures predict future)")
            ]),
            .keyValueTable(title: "DEXA interpretation (T-score)", [
                KeyValueRow(key: "Normal", value: "T-score ≥ -1.0 standard deviations"),
                KeyValueRow(key: "Osteopenia (low bone mass)", value: "T-score -1.1 to -2.4"),
                KeyValueRow(key: "Osteoporosis", value: "T-score ≤ -2.5"),
                KeyValueRow(key: "Severe / established osteoporosis", value: "T-score ≤ -2.5 + fragility fracture history"),
                KeyValueRow(key: "Z-score", value: "Compares to age + sex matched; Z-score <-2.0 → SECONDARY OSTEOPOROSIS workup; particularly in young + premenopausal + men <50"),
                KeyValueRow(key: "Sites measured", value: "Lumbar spine (vertebral L1-L4), total hip, femoral neck — lowest T-score determines diagnosis")
            ]),
            .keyValueTable(title: "FRAX 10-year fracture risk", [
                KeyValueRow(key: "Calculator", value: "Online tool — frax.shef.ac.uk — country-specific; inputs age, sex, weight, height, prior fracture, parental hip fracture, smoking, glucocorticoids, RA, alcohol, secondary osteoporosis, femoral neck T-score (optional)"),
                KeyValueRow(key: "Outputs", value: "10-year probability of MAJOR osteoporotic fracture (hip/clinical spine/forearm/humerus) + HIP fracture"),
                KeyValueRow(key: "Treatment threshold (NOF)", value: "10-year MAJOR fracture risk ≥20% OR 10-year HIP fracture risk ≥3% — treatment indicated"),
                KeyValueRow(key: "Limitations", value: "Doesn't capture all risks (CKD, recent fracture); supplement with clinical judgment")
            ]),
            .keyValueTable(title: "Pharmacologic treatment indications", [
                KeyValueRow(key: "Indicated for treatment", value: "Hip OR spine fragility fracture; T-score ≤-2.5; FRAX ≥20% major OR ≥3% hip (in osteopenic)"),
                KeyValueRow(key: "Antiresorptives — bisphosphonates (oral)", value: "Alendronate (Fosamax) 70 mg weekly; risedronate (Actonel) 35 mg weekly OR 150 mg monthly; ibandronate (Boniva) 150 mg monthly; first-line; take fasting + sit upright 30-60 min + water"),
                KeyValueRow(key: "Antiresorptives — bisphosphonates (IV)", value: "Zoledronic acid (Reclast) 5 mg IV ANNUALLY; preferred adherence + GI intolerance; pre-treatment calcium + vitamin D + dental; flu-like syndrome first dose"),
                KeyValueRow(key: "Denosumab (Prolia)", value: "60 mg SC every 6 months; RANK ligand inhibitor; non-renal cleared (suitable CKD); REBOUND fractures on discontinuation (continue or transition to bisphosphonate)"),
                KeyValueRow(key: "Anabolic — teriparatide (Forteo)", value: "20 mcg SC daily × 2 years max lifetime; PTH 1-34; severe osteoporosis; black box rat osteosarcoma; follow with antiresorptive"),
                KeyValueRow(key: "Anabolic — abaloparatide (Tymlos)", value: "80 mcg SC daily × 2 years max; PTH 1-34 analog; postmenopausal women only"),
                KeyValueRow(key: "Anabolic — romosozumab (Evenity)", value: "210 mg SC monthly × 12 months; anti-sclerostin; SEVERE osteoporosis; BOXED CV events; follow with antiresorptive"),
                KeyValueRow(key: "Other — raloxifene (Evista)", value: "60 mg PO daily; SERM; postmenopausal women; reduces breast cancer; DVT/PE risk + hot flashes"),
                KeyValueRow(key: "Calcitonin", value: "Intranasal 200 IU daily; second-line; FDA cancer concerns")
            ]),
            .bullets(title: "Universal supplementation + lifestyle", [
                AttributedBullet("CALCIUM — 1000-1200 mg/day (combined diet + supplements); dietary first; supplements (calcium carbonate with food, calcium citrate without).", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("VITAMIN D — 800-2000 IU/day; check 25-OH vitamin D; target ≥30 ng/mL; particularly winter / latitudes / dark skin.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("WEIGHT-BEARING + RESISTANCE EXERCISE — 30 min most days; balance training for falls prevention.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("FALLS PREVENTION — home assessment, vision check, footwear, medication review, balance training, mobility aids.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("SMOKING CESSATION + ALCOHOL moderation (≤2/day men, ≤1/day women).", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Adequate PROTEIN intake — 1-1.2 g/kg/day; bone + muscle.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("SECONDARY OSTEOPOROSIS workup — TSH, parathyroid, vitamin D, calcium, 24-h urine calcium + cortisol screen, celiac (TTG), testosterone (men), tryptase, alkaline phosphatase, SPEP, kidney function.", citationIDs: ["specialty_pr_round29"])
            ]),
            .bullets(title: "Treatment monitoring + duration", [
                AttributedBullet("DEXA q2 years on treatment; BMD increase + stability = effective.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Bone turnover markers (CTX, P1NP) — assess adherence + response; q3-6 months.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("BISPHOSPHONATE drug holiday — consider after 3-5 years oral OR 3 years zoledronic acid in stable patients with adequate BMD response; resume if fracture or BMD loss.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("DENOSUMAB CANNOT be discontinued without transition — REBOUND vertebral fractures within months; transition to bisphosphonate.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("ANABOLIC SEQUENCING — teriparatide / abaloparatide × 2 years max → FOLLOW WITH antiresorptive (denosumab or bisphosphonate) to preserve gains; otherwise rapid loss; romosozumab × 12 months → follow with antiresorptive.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("Adherence — major issue with oral bisphosphonates; IV alternative; education + reminders.", citationIDs: ["specialty_pr_round29"])
            ]),
            .bullets(title: "Complications + special considerations", [
                AttributedBullet("OSTEONECROSIS OF JAW (ONJ) — rare with bisphosphonates + denosumab; pre-treatment dental clearance; good oral hygiene; avoid invasive dental procedures during.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("ATYPICAL FEMUR FRACTURES — rare bilateral; long-term bisphosphonate use; thigh / groin pain warrants imaging.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("UPPER GI side effects (oral bisphosphonates) — esophagitis, ulcers; correct technique (sit upright 30-60 min + water); IV alternative.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("HYPOCALCEMIA on antiresorptives — particularly denosumab; pre-treatment calcium + vitamin D; correct deficiency before.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("FLU-LIKE syndrome — first IV bisphosphonate dose; acetaminophen + hydration.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("ROMOSOZUMAB CV events — boxed warning; avoid prior 12-month MI / stroke; risk-benefit.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("TERIPARATIDE rat osteosarcoma — black box; 2-year lifetime maximum.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("MEN + PREMENOPAUSAL — secondary osteoporosis workup essential; idiopathic less common.", citationIDs: ["specialty_pr_round29"]),
                AttributedBullet("VERTEBRAL FRACTURE silent — VFA at DEXA detects; presence indicates HIGH future fracture risk.", citationIDs: ["specialty_pr_round29"])
            ])
        ],
        citations: [openrnPRR29, cdcPRR29, specialtyPRR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}
