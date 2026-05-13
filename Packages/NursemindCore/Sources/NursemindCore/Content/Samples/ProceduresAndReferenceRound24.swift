import Foundation

// Curator-model procedures + reference (round 24 — wound debridement + CGA + PAINAD + STOPP/START + EOL + dressing + opioid conversion).

private let openrnPRR24 = CitationSource(
    id: "openrn_pr_round24",
    shortName: "Open RN Nursing Skills + Gerontology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-12"
)
private let cdcPRR24 = CitationSource(
    id: "cdc_pr_round24",
    shortName: "CDC + AGS + AAHPM guidance",
    publisher: "CDC · AGS · AAHPM",
    license: .publicDomain,
    url: "https://www.americangeriatrics.org/publications-tools/clinical-practice-guidelines",
    lastRetrieved: "2026-05-12"
)
private let specialtyPRR24 = CitationSource(
    id: "specialty_pr_round24",
    shortName: "AGS + AAHPM + WOCN + ASPEN concept citations",
    publisher: "AGS · AAHPM · WOCN · ASPEN",
    license: .factCitationOnly,
    url: "https://www.aahpm.org/education/clinical-resources",
    lastRetrieved: "2026-05-12"
)

private let procTagsR24 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .basicCareAndComfort,
    priorityConcept: .safety
)
private let refTagsR24 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum WoundDebridementSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "wound-debridement",
        title: "Wound debridement (sharp / autolytic / enzymatic / biological)",
        subtitle: "Remove necrotic tissue + debris · 4 main methods · sharp = fastest · autolytic = gentlest · STAY in scope of practice · pain management",
        nclexTags: procTagsR24,
        indications: AttributedProse(
            "Wound containing necrotic tissue / slough / eschar / debris that impedes healing. Necrotic tissue is medium for bacterial growth + barrier to granulation. Debridement converts chronic wound to acute wound that can heal per WOCN per primary source.",
            citationIDs: ["specialty_pr_round24"]
        ),
        contraindications: AttributedProse(
            "DO NOT debride STABLE DRY ESCHAR on heels (acts as biological dressing; debriding exposes deeper tissue + slows healing). Caution with arterial / ischemic ulcers — debridement may extend tissue loss; perfusion required for healing. Anticoagulation = bleeding risk.",
            citationIDs: ["specialty_pr_round24"]
        ),
        equipment: [
            AttributedBullet("SHARP — sterile scalpel #15 blade, curette, scissors, forceps; sterile gloves, drape, irrigation supplies.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("AUTOLYTIC — moisture-retentive dressings (hydrocolloid, hydrogel, transparent film).", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("ENZYMATIC — collagenase (Santyl) ointment.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("BIOLOGICAL (maggot debridement therapy) — sterile medical-grade green-bottle blow fly larvae; specialty product.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("MECHANICAL (declining use) — wet-to-dry gauze (NOT recommended — non-selective + painful); pulsed lavage; whirlpool (for selected).", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Pain management — topical lidocaine, oral pre-medication, optional IV sedation for sharp.", citationIDs: ["openrn_pr_round24"])
        ],
        preProcedure: [
            AttributedBullet("Assess wound — location, depth, tissue type, exudate, peri-wound; photograph.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Identify necrotic tissue — slough (yellow, soft) vs eschar (black, hard).", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Vascular assessment — perfusion required for healing; ABI for lower extremity wounds.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Anticoagulation status — bleeding risk for sharp method.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Pain assessment + pre-medication 30 min prior.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Verify scope of practice — sharp debridement varies by state + role; advanced practice nurses + WOCN + physicians typically perform conservative sharp.", citationIDs: ["specialty_pr_round24"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Select method by wound + patient", body: "SHARP — fastest; eschar / extensive slough; perfused tissue; anticoagulation OK with caution. AUTOLYTIC — gentlest; small amounts of slough; intact peri-wound. ENZYMATIC — selective; refractory slough; chemical breakdown. BIOLOGICAL — refractory cases; maggot therapy, specialty.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 2, title: "Sharp debridement (within scope)", body: "Conservative sharp — remove only loose necrotic tissue at bedside; identify viable / non-viable boundary; gentle traction + scalpel cut at boundary; ASPIRATE / IRRIGATE blood / debris.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 3, title: "Autolytic debridement", body: "Apply moisture-retentive dressing (hydrocolloid OR hydrogel OR transparent film); body's enzymes liquefy necrotic tissue under occlusive dressing; change q3-7 days; SLOW (1-2 weeks) but gentle.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 4, title: "Enzymatic debridement", body: "Collagenase (Santyl) — apply directly to slough / eschar; cover with secondary dressing; daily change; selective enzymatic breakdown of denatured collagen; often combined with sharp + autolytic.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 5, title: "Biological (MDT)", body: "Apply sterile medical-grade larvae directly to wound; secure with cage / containment dressing; change q1-3 days; rapid + selective; for refractory infected / necrotic wounds.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 6, title: "Hemostasis (sharp)", body: "Direct pressure; silver nitrate stick for small bleeding; calcium alginate for moderate bleeding; sutures / cautery for significant; coordinate provider for surgical bleeding.", citationIDs: ["openrn_pr_round24"]),
            ProcedureStep(number: 7, title: "Apply appropriate dressing", body: "Match to wound bed + exudate level (see wound dressing reference); secondary cover.", citationIDs: ["specialty_pr_round24"])
        ],
        postProcedure: [
            AttributedBullet("Document — pre-debridement wound, method used, amount removed, complications, hemostasis, dressing applied, patient tolerance.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Pain assessment + medication.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Reassess at next dressing change for progression.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("WOCN consultation if extensive / refractory.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Return precautions — bleeding, infection signs, wound deterioration.", citationIDs: ["openrn_pr_round24"])
        ],
        documentation: [
            AttributedBullet("Pre-debridement wound assessment, method + extent, amount of tissue removed, hemostasis, complications, dressing applied, patient tolerance.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Photographs pre + post per facility wound-tracking protocol.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Plan for next debridement / follow-up.", citationIDs: ["specialty_pr_round24"])
        ],
        watchFor: [
            AttributedBullet("BLEEDING — sharp debridement; pressure + alginate + cautery; coordinate with surgeon for significant bleeding.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("INFECTION — exposed deep tissue; cellulitis; abx if signs.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("PAIN management essential — pre-medicate, topical lidocaine, technique gentle.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("ARTERIAL / ISCHEMIC wound — debridement may extend ischemia; vascular assessment + revascularization first.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("STABLE DRY ESCHAR ON HEEL — DO NOT debride; acts as biological dressing; if becomes unstable / boggy / fluctuant — then debride.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("WET-TO-DRY GAUZE — NO LONGER recommended; non-selective (removes healthy tissue + necrotic), painful, increases infection.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("OSTEOMYELITIS — debridement of bone requires surgical specialty.", citationIDs: ["specialty_pr_round24"])
        ],
        citations: [openrnPRR24, cdcPRR24, specialtyPRR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CGASample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "comprehensive-geriatric-assessment",
        title: "Comprehensive geriatric assessment (CGA)",
        subtitle: "Multidimensional · medical / functional / cognitive / mental / social / nutritional / medication · multidisciplinary · falls + frailty + dementia + caregiver",
        nclexTags: procTagsR24,
        indications: AttributedProse(
            "Multidimensional, multidisciplinary diagnostic + treatment process for elderly patients with complex needs. Identifies medical + functional + cognitive + mental + social + nutritional + medication issues. Evidence shows reduced hospitalization + functional decline + improved outcomes per AGS per primary source.",
            citationIDs: ["specialty_pr_round24"]
        ),
        contraindications: AttributedProse(
            "No contraindications; tailored to patient + setting; brief screening for those without complex needs.",
            citationIDs: ["specialty_pr_round24"]
        ),
        equipment: [
            AttributedBullet("Validated assessment tools — see Steps for individual tools.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Multidisciplinary team — geriatrician, NP, PT, OT, pharmacist, social worker, dietitian, chaplain (when indicated).", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Adequate time — typically 1-2 hours initial; follow-up briefer.", citationIDs: ["openrn_pr_round24"])
        ],
        preProcedure: [
            AttributedBullet("Identify patients who will benefit — age >75 with multimorbidity, frailty, geriatric syndromes (falls, delirium, FTT, polypharmacy, incontinence).", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Pre-visit information collection — meds, medical records, family / caregiver contact.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Consider involving family / caregiver in assessment.", citationIDs: ["specialty_pr_round24"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Medical assessment", body: "Comprehensive history + exam; chronic conditions; recent acute illnesses; cancer screening (risk-benefit per life expectancy); immunizations.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 2, title: "Functional assessment", body: "ADLs (Katz — bathing, dressing, toileting, transfer, continence, feeding); IADLs (Lawton — phone, shopping, food prep, housework, laundry, transport, meds, finances); gait speed (<0.8 m/s = vulnerability); hand grip strength.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 3, title: "Cognitive assessment", body: "MoCA preferred over MMSE (more sensitive for MCI); Mini-Cog brief screening (3-word recall + clock draw); depression screen affects cognitive performance.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 4, title: "Mental health assessment", body: "PHQ-9 or Geriatric Depression Scale (GDS); anxiety; substance use; sleep; social isolation; suicidality if depression positive.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 5, title: "Social + environmental assessment", body: "Living situation; caregiver; finances; advance directives; goals of care; isolation; abuse / neglect screen; access to transport + food + healthcare.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 6, title: "Nutritional assessment", body: "Mini Nutritional Assessment (MNA-SF); weight loss; albumin / prealbumin; food access; dental; swallowing; intake.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 7, title: "Medication review", body: "Brown bag review (all Rx + OTC + supplements); BEERS / STOPP-START criteria; adherence; affordability; deprescribing opportunities; pharmacist consult.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 8, title: "Geriatric syndromes assessment", body: "Falls (Morse, history of falls, Timed Up and Go); incontinence; pressure injury risk (Braden); polypharmacy; cognitive impairment; sensory deficits (vision + hearing); pain; sleep.", citationIDs: ["specialty_pr_round24"])
        ],
        postProcedure: [
            AttributedBullet("Synthesize findings into prioritized problem list.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Develop multidisciplinary care plan addressing identified problems.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Communicate with PCP + caregiver + patient.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Schedule follow-up + monitor implementation.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Coordinate referrals — PT/OT, pharmacy, mental health, nutrition, social work.", citationIDs: ["specialty_pr_round24"])
        ],
        documentation: [
            AttributedBullet("Domain-by-domain findings + scores + interpretation.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Prioritized problem list + care plan with specific recommendations.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Patient + family + caregiver involvement + preferences.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Follow-up plan + monitoring strategy.", citationIDs: ["specialty_pr_round24"])
        ],
        watchFor: [
            AttributedBullet("DEPRESSION — frequently masked as cognitive impairment / FTT / fatigue; treat aggressively.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("ELDER ABUSE / NEGLECT — screen routinely; mandatory reporting.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("CAREGIVER BURDEN — assess + support; respite resources.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("ADVANCE CARE PLANNING — opportune time during CGA; values, preferences, healthcare proxy.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("INTERVENTIONS proven effective — falls prevention (PT, vitamin D, home modifications), depression treatment, hearing aids, medication optimization, nutrition.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("LIMITED life expectancy — match interventions to prognosis; avoid screening + interventions unlikely to benefit; align with goals of care.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("HOSPITALIZED ELDERS — perform CGA in-hospital; reduces functional decline + LOS + hospital readmission per primary source.", citationIDs: ["specialty_pr_round24"])
        ],
        citations: [openrnPRR24, cdcPRR24, specialtyPRR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PAINADSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "painad",
        title: "PAINAD scale + cognitive impairment pain assessment",
        subtitle: "5-item observational scale for non-verbal patients with dementia · breathing / vocalization / facial / body / consolability · score 0-10",
        nclexTags: procTagsR24,
        indications: AttributedProse(
            "Pain assessment in adults with advanced dementia / cognitive impairment unable to self-report pain reliably. Up to 80% of older adults have undertreated pain; cognitively impaired at highest risk. PAINAD = Pain Assessment IN Advanced Dementia per primary source.",
            citationIDs: ["specialty_pr_round24"]
        ),
        contraindications: AttributedProse(
            "None; complementary to self-report when possible; useful in non-verbal patients, advanced dementia, intubated, post-stroke aphasia, intellectual disability.",
            citationIDs: ["specialty_pr_round24"]
        ),
        equipment: [
            AttributedBullet("PAINAD scoring sheet or EHR-integrated tool.", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Adequate observation time (minimum 5 min).", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Knowledge of patient baseline behavior.", citationIDs: ["openrn_pr_round24"])
        ],
        preProcedure: [
            AttributedBullet("ATTEMPT self-report first using simple verbal scale, faces scale, or yes/no questions.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Establish patient baseline behavior (caregiver / family help).", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Observe in different states (rest + activity + dressing change + transfers).", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Rule out other causes of behavioral changes (delirium, urinary retention, constipation, hunger, thirst).", citationIDs: ["specialty_pr_round24"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Breathing (independent of vocalization)", body: "0 = Normal. 1 = Occasional labored breathing OR short period of hyperventilation. 2 = Noisy labored breathing OR long period hyperventilation OR Cheyne-Stokes respirations.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 2, title: "Negative vocalization", body: "0 = None. 1 = Occasional moan or groan; low-level speech with negative or disapproving quality. 2 = Repeated troubled calling out; loud moaning or groaning; crying.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 3, title: "Facial expression", body: "0 = Smiling or inexpressive. 1 = Sad, frightened, or frown. 2 = Facial grimacing.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 4, title: "Body language", body: "0 = Relaxed. 1 = Tense, distressed pacing, or fidgeting. 2 = Rigid, fists clenched, knees pulled up, pulling or pushing away, striking out.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 5, title: "Consolability", body: "0 = No need to console. 1 = Distracted or reassured by voice or touch. 2 = Unable to console, distract, or reassure.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 6, title: "Total score (0-10)", body: "Sum 5 items: 0 = no pain; 1-3 mild pain; 4-6 moderate pain; 7-10 severe pain. Treat moderate-severe pain per primary source.", citationIDs: ["specialty_pr_round24"]),
            ProcedureStep(number: 7, title: "Reassess after intervention", body: "Pre + post analgesic to assess response; aim for ≤3 (mild) at minimum.", citationIDs: ["specialty_pr_round24"])
        ],
        postProcedure: [
            AttributedBullet("Document PAINAD score + observed behaviors + setting (rest vs activity).", citationIDs: ["openrn_pr_round24"]),
            AttributedBullet("Implement pain management — first try non-pharm (positioning, distraction, presence, music); then analgesics.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Reassess at expected peak of analgesic; document response.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Coordinate with team + family on plan.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Monitor for side effects of analgesics — sedation, constipation, urinary retention, falls.", citationIDs: ["specialty_pr_round24"])
        ],
        documentation: [
            AttributedBullet("Score + individual item descriptions + setting + intervention + reassessment.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Trend scores over time to evaluate response to interventions.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Communication with team + family about pain management plan + goals.", citationIDs: ["specialty_pr_round24"])
        ],
        watchFor: [
            AttributedBullet("UNDERTREATED PAIN often presents as agitation / behavioral symptoms in dementia — treat scheduled acetaminophen FIRST per primary source; many \"BPSD\" cases improve with adequate analgesia.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("OPIOID side effects — start low + go slow; constipation prophylaxis; falls + sedation monitoring.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("ANTICHOLINERGIC analgesics (TCAs) — caution in dementia; worsen cognition.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("DELIRIUM superimposed — sudden change in PAINAD score warrants medical workup.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("Other CAUSES of behavioral change — UTI, constipation, urinary retention, hunger, thirst, environmental discomfort, fear; address before assuming pain.", citationIDs: ["specialty_pr_round24"]),
            AttributedBullet("FAMILY education — reassure that observation tools accurately capture pain even when patient cannot verbalize.", citationIDs: ["specialty_pr_round24"])
        ],
        citations: [openrnPRR24, cdcPRR24, specialtyPRR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum STOPPSTARTSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "stopp-start",
        title: "STOPP/START criteria for prescribing in older adults",
        subtitle: "Screening Tool of Older Persons' Prescriptions (STOPP) + Screening Tool to Alert to Right Treatment (START) · 80+ STOPP rules · 34 START · explicit deprescribing",
        eyebrow: "REFERENCE · GERIATRICS",
        nclexTags: refTagsR24,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "STOPP (Screening Tool of Older Persons' Prescriptions) — list of potentially inappropriate medications in older adults. START (Screening Tool to Alert to Right Treatment) — list of medications that should be considered + are often missed in older adults. Complement to AGS Beers criteria. Updated v3 2023; ~190 rules total per primary source.",
                citationIDs: ["specialty_pr_round24"]
            )),
            .keyValueTable(title: "STOPP highlights — drugs to STOP", [
                KeyValueRow(key: "Long-acting benzodiazepines", value: "Diazepam, flurazepam — falls, delirium, dependence; if needed, prefer short-acting + low dose"),
                KeyValueRow(key: "Z-drugs (zolpidem, zaleplon)", value: "Falls, cognitive effects, dependence; non-pharm sleep first"),
                KeyValueRow(key: "Tricyclic antidepressants (amitriptyline, doxepin)", value: "Anticholinergic burden, falls, urinary retention, cognitive impairment"),
                KeyValueRow(key: "Anticholinergics (oxybutynin, diphenhydramine, hyoscyamine)", value: "Cumulative anticholinergic burden = cognitive decline, falls, urinary retention; safer alternatives (mirabegron for OAB)"),
                KeyValueRow(key: "First-generation antihistamines", value: "Diphenhydramine, chlorpheniramine — substitute cetirizine, loratadine"),
                KeyValueRow(key: "PPIs >8 weeks without indication", value: "Bone fracture, B12 deficiency, hypomagnesemia, C. diff, AKI"),
                KeyValueRow(key: "Aspirin for primary CV prevention age >70", value: "Bleeding risk outweighs benefit per USPSTF 2022"),
                KeyValueRow(key: "Glyburide", value: "Long-acting sulfonylurea = severe hypoglycemia in elderly; substitute glipizide"),
                KeyValueRow(key: "NSAIDs chronic in elderly + CKD + HF + GI ulcer history", value: "Substitute topical NSAID, acetaminophen, gabapentin"),
                KeyValueRow(key: "α-blockers for HTN as monotherapy", value: "Orthostatic hypotension; can use combined with other for BPH symptoms")
            ]),
            .keyValueTable(title: "START highlights — drugs often MISSING", [
                KeyValueRow(key: "Anticoagulant for atrial fibrillation", value: "DOAC (apixaban, rivaroxaban, edoxaban) preferred over warfarin in elderly; underuse common"),
                KeyValueRow(key: "Statin in established CV / cerebrovascular / PAD", value: "Secondary prevention regardless of age + lipid level (selected primary prevention)"),
                KeyValueRow(key: "ACE inhibitor / ARB in HFrEF or proteinuric CKD", value: "Mortality + morbidity benefit"),
                KeyValueRow(key: "β-blocker in HFrEF + post-MI", value: "Mortality benefit"),
                KeyValueRow(key: "MRA (spironolactone) in HFrEF NYHA III-IV with K+ <5 + adequate renal function", value: "Mortality benefit"),
                KeyValueRow(key: "SGLT2 inhibitor in HFrEF + DM", value: "Newer guideline-directed therapy"),
                KeyValueRow(key: "Vitamin D + calcium for osteoporosis", value: "Falls + fracture prevention; consider bisphosphonate / denosumab if T-score <-2.5"),
                KeyValueRow(key: "Influenza + pneumococcal + zoster + COVID-19 vaccines", value: "Per CDC ACIP schedule"),
                KeyValueRow(key: "L-DOPA in Parkinson disease with functional impairment", value: "Improves QOL; underused"),
                KeyValueRow(key: "Antidepressant in major depressive disorder", value: "SSRI (sertraline, citalopram, escitalopram) preferred")
            ]),
            .bullets(title: "Implementation principles", [
                AttributedBullet("USE WITH BEERS criteria — complementary; STOPP/START explicit recommendations + START catches MISSING drugs.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("PATIENT-CENTERED — incorporate goals + life expectancy + function + preferences.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("PHARMACIST consultation valuable for complex regimens.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("DEPRESCRIBING requires planning — taper gradually for many medications (benzodiazepines, antiepileptics, opioids, antidepressants, β-blockers, PPI).", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("MONITOR for return of symptoms vs withdrawal vs improvement.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("EHR-integrated alerts for STOPP/START — reduces inappropriate prescribing.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "When to use", [
                AttributedBullet("Annual review of patients on ≥5 medications.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Hospital admission + discharge — high-yield review.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Care transitions — between facilities, after surgery, with new diagnoses.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("After adverse drug reaction — comprehensive review.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("New geriatric syndrome (falls, delirium, FTT) — medication contributors.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Evidence base", [
                AttributedBullet("STOPP/START reduces adverse drug reactions in hospitalized elderly per primary source.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Reduces falls + drug-related hospital admissions when implemented.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Versions — STOPP/START v3 2023 latest; AGS Beers updated every 4 years; both should be referenced together.", citationIDs: ["specialty_pr_round24"])
            ])
        ],
        citations: [openrnPRR24, cdcPRR24, specialtyPRR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum EOLSymptomManagementSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "end-of-life-symptom-management",
        title: "End-of-life symptom management",
        subtitle: "Pain + dyspnea + secretions + delirium + nausea + anxiety · multimodal · oral / SC / IV / TD routes · family support · comfort goal",
        eyebrow: "REFERENCE · PALLIATIVE CARE",
        nclexTags: refTagsR24,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Aggressive symptom management for patients at end of life — pain, dyspnea, secretions, delirium, nausea, anxiety, fatigue, constipation. Goals — comfort, dignity, family support. Hospice + palliative care principles per primary source.",
                citationIDs: ["specialty_pr_round24"]
            )),
            .keyValueTable(title: "Common symptoms + first-line management", [
                KeyValueRow(key: "PAIN", value: "Morphine 5-10 mg PO/SC q3-4h PRN + scheduled when frequent; convert to long-acting oxycodone CR or fentanyl patch when stable; rotate opioids if tolerance / side effects"),
                KeyValueRow(key: "DYSPNEA", value: "Morphine 2-5 mg PO/SC q3-4h PRN (low-dose opioid reduces sensation); fan + cool air; positioning; oxygen if hypoxic; lorazepam adjunct for anxiety"),
                KeyValueRow(key: "TERMINAL SECRETIONS / RATTLE", value: "Glycopyrrolate 0.1-0.4 mg SC/IV q4-8h OR scopolamine patch 1.5 mg q72h OR atropine 1% drops 1-2 SL q4h; reposition; suction NOT recommended (distress without benefit)"),
                KeyValueRow(key: "DELIRIUM (terminal)", value: "Identify + treat reversible (constipation, urinary retention, pain, dehydration, hypoxia); non-pharm; haloperidol 0.5-2 mg PO/SC/IV q4-6h PRN; quetiapine 12.5-25 mg QHS; AVOID benzodiazepines as monotherapy (paradoxical worsening)"),
                KeyValueRow(key: "NAUSEA / VOMITING", value: "Identify cause; haloperidol 0.5-2 mg q6h (chemical), prochlorperazine 5-10 mg PO/PR q6h, ondansetron 4-8 mg PO/IV q8h, metoclopramide 5-10 mg PO/IV q6h (gastroparesis); steroids if intracranial cause"),
                KeyValueRow(key: "ANXIETY", value: "Lorazepam 0.5-1 mg PO/SL/SC q6h PRN; non-pharm (presence, music, family); SSRIs not useful in last weeks"),
                KeyValueRow(key: "FATIGUE", value: "Reduce demands + activities; methylphenidate 2.5-5 mg AM/midday for selected; corticosteroids short-term"),
                KeyValueRow(key: "CONSTIPATION", value: "Senna + docusate prophylactically with opioids; bisacodyl PRN; methylnaltrexone for refractory OIC"),
                KeyValueRow(key: "MOUTH CARE", value: "Oral swabs + lubrication; saline rinses; lip balm; symptomatic relief from xerostomia"),
                KeyValueRow(key: "PRESSURE INJURY", value: "Comfort positioning > q2h turns; specialty mattress; manage exudate / odor; not reverse course at EOL")
            ]),
            .bullets(title: "Final hours / days — clinical signs", [
                AttributedBullet("Decreased intake / appetite — natural; do not force feed; mouth care for comfort.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Cheyne-Stokes respirations — periods of apnea alternating with rapid shallow.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Mottling — cool + cyanotic extremities; warm with blankets; visual reassurance.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Loss of consciousness; sometimes \"surge\" of alertness shortly before death.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Terminal secretions / rattle — usually does NOT distress patient; can distress family; meds for family more than patient.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Decreased urine output; oliguria; anuria.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Decreased perfusion → mottling, cool extremities, weak pulses.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Communication + decisions", [
                AttributedBullet("Goals of care discussions — values + preferences + acceptable trade-offs; revisit as condition changes.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("DNR / DNI / POLST documentation — clarify + document; review with patient + family.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Withdrawal of life-sustaining treatments — extubation, withdrawing dialysis, stopping artificial nutrition / hydration when no longer beneficial; PALLIATIVE care + family support central.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Tube feeding in advanced dementia — does NOT improve survival, QOL, or aspiration risk per primary source; counsel + decision-making support.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("HOSPICE referral — Medicare benefit; eligibility prognosis ≤6 months; comprehensive interdisciplinary support.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Family support + caregiving", [
                AttributedBullet("Anticipatory grief support; acknowledge difficulty.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Cultural + religious / spiritual practices — respect + facilitate.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Family presence at bedside; private space; food + comfort items.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Education on what to expect — reduces distress; signs of imminent death; what to do when death occurs.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Children visiting — age-appropriate preparation + support; usually meaningful + not traumatic when supported.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Bereavement follow-up — hospice provides 13 months postdeath; offer resources.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Postmortem care", [
                AttributedBullet("Allow time for family + private goodbyes.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Cleansing + positioning + dressing per cultural / family preferences.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Documentation — time of death, family present, healthcare proxy notified, religious / cultural practices honored.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Coordinate with funeral home / mortuary.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Organ / tissue donation discussion if applicable + appropriate.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("Staff debriefing + self-care — emotional impact of patient deaths.", citationIDs: ["specialty_pr_round24"])
            ])
        ],
        citations: [openrnPRR24, cdcPRR24, specialtyPRR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum WoundDressingSelectionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "wound-dressing-selection",
        title: "Wound dressing selection guide",
        subtitle: "Match dressing to wound bed + exudate + tissue type · primary + secondary · moisture balance · cost-effective",
        eyebrow: "REFERENCE · WOUND CARE",
        nclexTags: refTagsR24,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Wound dressing selection guided by wound assessment — wound bed (granulation / slough / eschar), exudate level, depth, periwound condition, infection. Goal — moist wound healing environment, manage exudate, prevent infection, minimize pain at dressing change. WOCN + WUWHS guidance per primary source.",
                citationIDs: ["specialty_pr_round24"]
            )),
            .keyValueTable(title: "Dressings by wound bed type", [
                KeyValueRow(key: "GRANULATION (red, healthy)", value: "Maintain moist environment — hydrocolloid, hydrogel, transparent film, foam (low exudate); change q3-7 days"),
                KeyValueRow(key: "SLOUGH (yellow, soft)", value: "Promote autolytic debridement OR enzymatic — hydrogel, hydrocolloid, collagenase (Santyl); cover with secondary"),
                KeyValueRow(key: "ESCHAR (black, hard)", value: "Sharp debridement preferred OR autolytic with hydrogel; AVOID debriding stable dry heel eschar"),
                KeyValueRow(key: "EPITHELIALIZATION (pink, edge advancement)", value: "Protect — transparent film, hydrocolloid; minimal interference"),
                KeyValueRow(key: "INFECTED", value: "Antimicrobial — silver dressings (Mepilex Ag, Acticoat, Aquacel Ag), iodine (Iodosorb), honey (Medihoney), PHMB; ± systemic abx if cellulitis")
            ]),
            .keyValueTable(title: "Dressings by exudate level", [
                KeyValueRow(key: "DRY / minimal exudate", value: "Hydrogel, hydrocolloid, transparent film — donate moisture or maintain"),
                KeyValueRow(key: "MINIMAL-MODERATE exudate", value: "Foam, hydrocolloid — absorb modestly + maintain moist environment"),
                KeyValueRow(key: "MODERATE-HEAVY exudate", value: "Alginate (Kaltostat, Algicell), hydrofiber (Aquacel), foam (Mepilex, Allevyn); cover with absorbent secondary"),
                KeyValueRow(key: "HEAVY / saturated exudate", value: "Negative pressure wound therapy (wound vac); alginate + super-absorbent secondary; consider drainage management"),
                KeyValueRow(key: "EXUDATE WITH ODOR", value: "Charcoal-impregnated dressing (Carboflex); manage underlying infection")
            ]),
            .bullets(title: "Specific dressing categories", [
                AttributedBullet("HYDROGEL — water-based gel; donates moisture; for dry / minimal exudate / debridement; soothing for painful wounds; q3-day change.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("HYDROCOLLOID — wafer with absorbent inner layer + waterproof outer; minimal-moderate exudate; supports autolysis; opaque + difficult to monitor wound.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("TRANSPARENT FILM (Tegaderm) — semipermeable; allows visualization; minimal exudate; protects from external; no absorptive capacity; useful for IV sites + intact skin.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("ALGINATE — derived from seaweed; highly absorbent; for heavy exudate; converts to gel; requires secondary cover; not for dry wounds.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("HYDROFIBER (Aquacel) — like alginate but cellulose-based; very absorbent; converts to gel.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("FOAM — polyurethane; absorbs moderate-heavy exudate; cushioning; protects from pressure; q3-7 day change; many varieties.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("SILVER ANTIMICROBIAL — for infected / colonized; broad-spectrum; many forms (foam, alginate, hydrofiber).", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("HONEY (Medihoney) — antimicrobial + autolytic + anti-inflammatory; useful for infected + sloughy wounds.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("COLLAGEN — promotes granulation; for non-healing chronic wounds; specialty.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("NEGATIVE PRESSURE WOUND THERAPY (wound vac) — promotes granulation, manages exudate, contracts wound; for stage 3-4, dehisced surgical, complex wounds; specialist.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Wound vac (NPWT) considerations", [
                AttributedBullet("INDICATIONS — stage 3-4 pressure injury, dehisced surgical, traumatic, diabetic foot ulcer (after debridement), skin graft bolster.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("CONTRAINDICATIONS — exposed vasculature / nerves / organs, untreated osteomyelitis, malignancy in wound, necrotic tissue (debride first), unexplored fistulas.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("PRESSURE — typically 75-125 mmHg continuous (can be intermittent); custom per wound.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("DRESSING change q48-72 hrs; black foam (granuloFoam) most common.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("WOCN consultation for wound vac initiation + management.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Practical considerations", [
                AttributedBullet("PERIWOUND — protect from maceration with skin barrier (zinc oxide, dimethicone) for highly exudative wounds.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("PAIN at dressing change — pre-medicate; gentle technique; non-adherent dressings; soak before removal if stuck.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("FREQUENCY — too-frequent change disrupts healing; too-infrequent leads to maceration / infection; typical q3-7 days for stable wounds.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("COST — basic wound care often inexpensive; advanced / specialty dressings expensive; insurance coverage variable.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("EVIDENCE — many dressings have similar outcomes; choice based on wound + patient + provider experience + cost; WOCN consultation valuable.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("AVOID wet-to-dry gauze — non-selective debridement (removes healthy tissue), painful, increases infection per primary source.", citationIDs: ["specialty_pr_round24"])
            ])
        ],
        citations: [openrnPRR24, cdcPRR24, specialtyPRR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum OpioidConversionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "opioid-conversion",
        title: "Opioid conversion + equianalgesic dosing",
        subtitle: "Convert between opioids · oral morphine equivalent (MME) · INCOMPLETE cross-tolerance · reduce 25-50% when rotating · breakthrough 10-20% daily MME",
        eyebrow: "REFERENCE · PAIN MANAGEMENT",
        nclexTags: refTagsR24,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Opioid rotation / conversion calculations — when switching between opioids, routes (PO ↔ IV ↔ SC ↔ TD), or escalating chronic pain regimens. Equianalgesic tables provide approximate equivalence (oral morphine = oral morphine equivalent / MME). Account for INCOMPLETE CROSS-TOLERANCE — reduce calculated equivalent by 25-50% when rotating per primary source.",
                citationIDs: ["specialty_pr_round24"]
            )),
            .keyValueTable(title: "Common equianalgesic doses (oral)", [
                KeyValueRow(key: "Morphine 30 mg PO", value: "= 1 oral morphine equivalent unit (10 mg IV)"),
                KeyValueRow(key: "Hydromorphone 7.5 mg PO", value: "= 30 mg oral morphine (~4× more potent)"),
                KeyValueRow(key: "Oxycodone 20 mg PO", value: "= 30 mg oral morphine (~1.5× more potent)"),
                KeyValueRow(key: "Hydrocodone 30 mg PO", value: "= 30 mg oral morphine (~1:1)"),
                KeyValueRow(key: "Codeine 200 mg PO", value: "= 30 mg oral morphine (~7× less potent; CYP2D6 variability)"),
                KeyValueRow(key: "Tramadol 300 mg PO", value: "= ~30-60 mg oral morphine (variable; weak μ-opioid + SNRI)"),
                KeyValueRow(key: "Tapentadol 100 mg PO", value: "= ~30 mg oral morphine (similar potency)")
            ]),
            .keyValueTable(title: "Parenteral vs oral conversion", [
                KeyValueRow(key: "Morphine 10 mg IV/SC", value: "= 30 mg PO (3:1 oral:parenteral ratio)"),
                KeyValueRow(key: "Hydromorphone 1.5 mg IV/SC", value: "= 7.5 mg PO (5:1)"),
                KeyValueRow(key: "Oxycodone 10 mg IV", value: "= 20 mg PO (~2:1; less commonly IV used)"),
                KeyValueRow(key: "Fentanyl 100 mcg IV", value: "= 10 mg morphine IV; transdermal differs (see patch table)"),
                KeyValueRow(key: "Methadone PO ↔ IV", value: "Approximately 2:1 oral to IV; complex variable potency to morphine — specialty consult")
            ]),
            .keyValueTable(title: "Fentanyl transdermal patch conversion", [
                KeyValueRow(key: "12 mcg/hr patch", value: "≈ 30 mg/24 hr oral morphine"),
                KeyValueRow(key: "25 mcg/hr patch", value: "≈ 60 mg/24 hr oral morphine"),
                KeyValueRow(key: "50 mcg/hr patch", value: "≈ 120 mg/24 hr oral morphine"),
                KeyValueRow(key: "75 mcg/hr patch", value: "≈ 180 mg/24 hr oral morphine"),
                KeyValueRow(key: "100 mcg/hr patch", value: "≈ 240 mg/24 hr oral morphine")
            ]),
            .bullets(title: "Conversion principles", [
                AttributedBullet("CALCULATE total daily oral morphine equivalent (MME) of current regimen.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("CONVERT to MME of target opioid using equianalgesic table.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("REDUCE BY 25-50% to account for INCOMPLETE CROSS-TOLERANCE — patient may be more sensitive to new opioid; balance against under-treatment per primary source.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("REDUCE BY 75-90% if methadone (complex pharmacology + risk).", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("CONSIDER patient factors — opioid-naive vs opioid-tolerant, age, renal / hepatic impairment, comorbidities, previous opioid response.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("BREAKTHROUGH dose — 10-20% of total 24-hr oral MME, q1-2h PRN.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("REASSESS at next peak; titrate based on response + side effects.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("CONSULT pharmacy / palliative care for complex conversions, methadone, very high doses.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Why opioid rotation?", [
                AttributedBullet("INADEQUATE ANALGESIA despite escalating dose — switching may give better response.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("INTOLERABLE SIDE EFFECTS (sedation, nausea, hallucinations, myoclonus) — different opioid may be better tolerated.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("ROUTE CHANGE — needed when patient cannot tolerate oral (NPO, dysphagia, GI obstruction).", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("RENAL FAILURE — accumulation of metabolites (morphine M6G, hydromorphone H3G); switch to fentanyl, methadone, buprenorphine which are renally safer.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("HEPATIC IMPAIRMENT — most opioids hepatically metabolized; reduce dose; methadone particularly affected.", citationIDs: ["specialty_pr_round24"])
            ]),
            .bullets(title: "Special considerations", [
                AttributedBullet("METHADONE — variable potency to morphine; significantly higher than equianalgesic tables suggest at high doses; QT prolongation; long T1/2 (15-60 hrs) → accumulation; SPECIALTY consult required.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("BUPRENORPHINE — partial agonist; rotation in/out of buprenorphine complex; specialty.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("FENTANYL PATCH — opioid-tolerant only; slow onset (12-24 hrs); slow offset (2-3 days residual); BRIDGE with short-acting during initiation.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("CODEINE — CYP2D6 polymorphism causes variable conversion to morphine; ultra-rapid metabolizers (5-10% European, higher in some populations) → toxicity; poor metabolizers → no analgesia.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("TRAMADOL — weak μ-opioid + SNRI; serotonin syndrome risk with SSRI/SNRI; lowers seizure threshold.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("CO-PRESCRIBE NALOXONE for patients on chronic opioids per CDC guideline.", citationIDs: ["specialty_pr_round24"]),
                AttributedBullet("CO-PRESCRIBE LAXATIVES (senna + softener) for prophylactic opioid-induced constipation; methylnaltrexone for refractory.", citationIDs: ["specialty_pr_round24"])
            ])
        ],
        citations: [openrnPRR24, cdcPRR24, specialtyPRR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}
