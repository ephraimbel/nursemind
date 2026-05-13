import Foundation

// Curator-model procedures + reference (round 33 — oncology: radiation care + ICI monitoring + implanted port care + CINV + hereditary cancer + irAE algorithm + oncologic emergencies).

private let openrnPRR33 = CitationSource(
    id: "openrn_pr_round33",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcPRR33 = CitationSource(
    id: "cdc_pr_round33",
    shortName: "CDC + NCI + NIH oncology concept citations",
    publisher: "CDC · NCI · NIH",
    license: .publicDomain,
    url: "https://www.cancer.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyPRR33 = CitationSource(
    id: "specialty_pr_round33",
    shortName: "NCCN + ASCO + ONS + ESMO concept citations",
    publisher: "NCCN · ASCO · ONS · ESMO",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR33 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .cellularRegulation
)
private let refTagsR33 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .cellularRegulation
)

public enum RadiationTherapyCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "radiation-therapy-nursing-care",
        title: "Radiation therapy nursing care",
        subtitle: "External beam + brachytherapy + radiopharmaceuticals · site-specific skin care + fatigue + organ-specific toxicity · simulation + treatment planning + delivery + survivorship",
        nclexTags: procTagsR33,
        indications: AttributedProse(
            "Definitive treatment (curative — radical radiation; primary or with chemotherapy), adjuvant (post-surgery to reduce recurrence — breast, head/neck, gynecologic, brain, prostate), neoadjuvant (pre-surgery — rectal, esophageal, head/neck), palliative (bone metastases, brain metastases, SVC syndrome, spinal cord compression, hemoptysis, bleeding tumors, symptomatic mass). Modalities — EXTERNAL BEAM (IMRT, VMAT, SBRT, proton therapy), BRACHYTHERAPY (internal — cervical + prostate + breast), RADIOPHARMACEUTICAL (radium-223, lutetium-177-PSMA, I-131, samarium-153, strontium-89) per primary source.",
            citationIDs: ["specialty_pr_round33"]
        ),
        contraindications: AttributedProse(
            "Severe radiation-sensitivity syndromes (ataxia telangiectasia, Fanconi anemia — relative); pregnancy (most fetal harm); prior overlapping high-dose radiation (cumulative limits); active connective tissue disease (relative); severe untreated infections (deferred); patient unable to cooperate without sedation (some scenarios).",
            citationIDs: ["specialty_pr_round33"]
        ),
        equipment: [
            AttributedBullet("Linear accelerator (LINAC) — most common external beam delivery; IMRT, VMAT, SBRT modalities; advanced delivery + planning systems.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Proton therapy facility — heavy charged particles; selective advantages (pediatric, brain, ocular, prostate selected); fewer facilities.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Brachytherapy applicators — site-specific (cervical, prostate, breast, lung, GI, skin); high-dose-rate (HDR) afterloaders + low-dose-rate (LDR).", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Immobilization devices — masks, breast boards, alpha cradle, vacuum bags; site-specific.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Imaging for treatment planning + verification — simulation CT, MRI (selected), PET-CT, cone-beam CT (CBCT) during treatment.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Skin care supplies — moisturizers, sun protection, gentle cleansers, topical preparations.", citationIDs: ["openrn_pr_round33"])
        ],
        preProcedure: [
            AttributedBullet("Multidisciplinary planning — radiation oncologist + dosimetrist + medical physicist + radiation therapist; tumor board.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("SIMULATION — CT-based planning scan in treatment position; immobilization devices + tattoos OR markings; sometimes contrast for visualization.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("TREATMENT PLANNING — 2D, 3D-conformal, IMRT, VMAT, SBRT planning; target volumes (GTV, CTV, ITV, PTV); organ-at-risk constraints; physicist quality assurance.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Patient education — process, schedule (daily treatments × 5-8 weeks for definitive, hypofractionated for some, single-fraction for palliative), side effects, what to expect, skin care, comfort measures.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Skin marking + immobilization — daily setup ensures accurate delivery; permanent tattoos OR sometimes temporary markings.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Dietary + medication review — particular concerns for head/neck + chest radiation.", citationIDs: ["openrn_pr_round33"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Treatment session — setup", body: "Position on treatment table identical to simulation; immobilization in place; imaging verification (CBCT, ports) before treatment; physicist + therapist verify; patient remains still during treatment.", citationIDs: ["openrn_pr_round33"]),
            ProcedureStep(number: 2, title: "Treatment delivery", body: "Typically 5-30 minutes total session (1-3 min actual beam time); patient alone in shielded vault during beam-on time; intercom communication; daily treatments Mon-Fri typically.", citationIDs: ["openrn_pr_round33"]),
            ProcedureStep(number: 3, title: "Weekly review", body: "Weekly visit with radiation oncologist + RN; assess side effects, weight, hydration, skin reactions, performance status; intervene early.", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 4, title: "Site-specific care + monitoring", body: "Skin care, mucositis management (head/neck), esophagitis (chest), GI (abdomen/pelvis), neurologic (brain), bone marrow (large fields); supportive care interventions.", citationIDs: ["openrn_pr_round33"]),
            ProcedureStep(number: 5, title: "Post-treatment follow-up", body: "1-2 weeks post-treatment for late acute toxicities; 6-week comprehensive + tumor response assessment; long-term surveillance for late effects.", citationIDs: ["specialty_pr_round33"])
        ],
        postProcedure: [
            AttributedBullet("Acute side effect resolution typically 2-6 weeks post-treatment; some persist or develop later (late effects).", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Skin care — continued moisturizers, sun protection, gentle care of treated area × 6-12 months; areas of permanent skin change possible.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Site-specific late effects monitoring — fibrosis, second malignancy (decades later), organ-specific (cardiac after chest, pulmonary fibrosis, xerostomia + dental, lymphedema, neurologic + cognitive, infertility, bone necrosis).", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Survivorship — comprehensive follow-up including treatment summary + late effects monitoring + lifestyle.", citationIDs: ["specialty_pr_round33"])
        ],
        documentation: [
            AttributedBullet("Treatment plan + dose + fractionation + organ-at-risk doses + delivered fractions + skin/site reactions + interventions + tolerability.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Symptom assessment at weekly review + supportive care interventions.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Late effects + follow-up plan.", citationIDs: ["specialty_pr_round33"])
        ],
        watchFor: [
            AttributedBullet("RADIATION DERMATITIS — common (~70-90%); erythema → desquamation → moist desquamation in severe; ANY radiation field; site-specific severity (head/neck, breast, perineum highest); MOISTURIZERS (urea-based, aloe vera, hydrogel dressings), AVOID sun + heat + abrasion, GENTLE CLEANSING, MILD SOAPS only, SILVER SULFADIAZINE for severe moist desquamation.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("FATIGUE — universal in most patients; multifactorial; counsel + pacing + exercise + nutrition + sleep; addressed throughout treatment.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("MUCOSITIS (head/neck + esophageal + gastric/intestinal radiation) — painful inflammation + ulceration; ORAL CARE protocols (rinses, ice chips, magic mouthwash); analgesics (acetaminophen → opioids); nutrition support; sometimes G-tube + parenteral.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("XEROSTOMIA + DENTAL CARIES (head/neck) — permanent dry mouth common; saliva substitutes + pilocarpine + dental fluoride + sugar-free gum; dental work BEFORE radiation + lifelong dental care; osteoradionecrosis prevention.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("DIARRHEA + radiation enteritis (abdominal/pelvic) — loperamide, hydration, dietary modifications (low residue), sometimes electrolyte replacement.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("URINARY frequency + dysuria (pelvic) — symptomatic; phenazopyridine; bladder irritant avoidance.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("RADIATION PNEUMONITIS (chest) — cough + dyspnea + low-grade fever 4-12 weeks post-radiation; steroids (prednisone 60 mg/day tapered) for symptomatic; pulmonary fibrosis is late effect.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("CARDIAC effects (chest radiation, especially left-sided breast) — accelerated atherosclerosis, valvular disease, pericarditis, cardiomyopathy; long-term surveillance + risk reduction.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("NEUROLOGIC effects (brain radiation) — short-term — headache, edema; long-term — cognitive impairment, memory + executive function decline, leukoencephalopathy; rehabilitation + pharmacotherapy (donepezil + memantine in select).", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("LYMPHEDEMA — particularly axillary + groin radiation; chronic; lymphedema therapy + compression + manual drainage.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("INFERTILITY — pelvic radiation; fertility preservation pre-treatment in younger patients.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("SECOND MALIGNANCY — small but real risk decades later; long-term surveillance.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("EMERGENCIES during treatment — radiation reactions in radiopharmaceutical therapy + radioembolization; specialty management.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("PSYCHOSOCIAL — anxiety, depression, body image; counseling + support; ANXIOLYTICS for treatment-related anxiety.", citationIDs: ["specialty_pr_round33"])
        ],
        citations: [openrnPRR33, cdcPRR33, specialtyPRR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ICIMonitoringSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ici-monitoring",
        title: "Immune checkpoint inhibitor (ICI) monitoring + irAE assessment",
        subtitle: "Pre-treatment + cyclic monitoring + irAE recognition + management algorithm · multidisciplinary team · wallet card · emergency action plan · CTCAE grading",
        nclexTags: procTagsR33,
        indications: AttributedProse(
            "Comprehensive monitoring and management of patients receiving immune checkpoint inhibitor therapy — pembrolizumab, nivolumab, atezolizumab, durvalumab, cemiplimab, ipilimumab, dostarlimab + emerging agents; addresses pre-treatment evaluation, treatment-cycle monitoring, irAE identification + grading + management, multidisciplinary coordination, patient education + emergency action planning per primary source.",
            citationIDs: ["specialty_pr_round33"]
        ),
        contraindications: AttributedProse(
            "Active autoimmune disease (relative — case-by-case); prior severe irAE requiring permanent discontinuation; pregnancy; severe immunodeficiency; concurrent immunosuppression that conflicts with ICI mechanism.",
            citationIDs: ["specialty_pr_round33"]
        ),
        equipment: [
            AttributedBullet("Comprehensive metabolic panel + CBC + LFTs + TSH + cortisol + glucose laboratory access.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Imaging — chest x-ray + chest CT for pneumonitis; abdomen + pelvis CT for visceral assessment + colitis evaluation.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("ECG + troponin + echocardiography — cardiac assessment + myocarditis surveillance.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Wallet card / medical alert ID — \"I am receiving immunotherapy + risk of severe inflammatory reactions in any organ system\" + emergency contacts.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Endocrine workup tools (cortisol stim, TSH, free T4, free T3, AM cortisol, ACTH for hypophysitis evaluation).", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Communication tools — emergency hotline + symptom diary + telemedicine + multidisciplinary access.", citationIDs: ["specialty_pr_round33"])
        ],
        preProcedure: [
            AttributedBullet("BASELINE comprehensive — CBC + CMP (Cr + LFTs) + TSH + free T4 + cortisol + AM cortisol + ACTH + lipase + amylase + glucose + ECG + troponin + ECHO; chest CT (or recent), comprehensive autoimmune screen if history; comprehensive medications + autoimmune history + organ transplant + active infections.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("INFECTION screening — TB + HBV + HCV + HIV; treat any active infection before ICI.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("AUTOIMMUNE assessment — controlled IBD, RA, lupus generally OK with ICI; high-grade active disease relative contraindication.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("VACCINATIONS — update inactivated vaccines (influenza, pneumococcal, hepatitis B, COVID); AVOID live vaccines (yellow fever, MMR, varicella, oral typhoid) during ICI + after.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Patient + family education — irAE concept, all organ systems can be affected, recognition + reporting + emergency action plan + wallet card; identifies emergency room + specialty contact.", citationIDs: ["specialty_pr_round33"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Pre-cycle assessment", body: "Before each cycle — clinical assessment, comprehensive labs (CBC + CMP + LFTs + TSH/T4 + cortisol + lipase/amylase + troponin), symptom inventory, performance status, weight, vital signs.", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 2, title: "Symptom assessment + irAE screening", body: "Comprehensive systems review — pulmonary (cough/dyspnea/oxygen requirements), GI (diarrhea/abdominal pain/blood in stool), hepatic (jaundice/abdominal pain/dark urine), endocrine (fatigue/polyuria/cold intolerance/symptoms), dermatologic (rash/pruritus), cardiac (palpitations/chest pain/dyspnea), neurologic (weakness/sensory changes/cognition), renal (changes in UOP), musculoskeletal (myalgia/arthralgia/inflammatory arthritis).", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 3, title: "Cyclic laboratory monitoring", body: "Each cycle — CBC + CMP (Cr + LFTs) + TSH + cortisol + lipase + amylase + glucose; ECG + troponin (cardiac surveillance); more frequent if abnormal trends.", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 4, title: "irAE recognition + grading", body: "CTCAE grading; clinical + laboratory + imaging assessment; rule out alternative causes (infection, progression, drug effects); multidisciplinary specialist consultation as needed.", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 5, title: "irAE management", body: "Per organ-specific irAE protocol — Grade 1 (continue ICI + monitor); Grade 2 (hold ICI + steroids 0.5-1 mg/kg/day + symptom-specific care); Grade 3 (hold + IV steroids 1-2 mg/kg/day + supportive); Grade 4 (permanent discontinuation + high-dose steroids + immunosuppressants + ICU); MULTIDISCIPLINARY (organ-specific specialist + ID + critical care if severe).", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 6, title: "Hormone replacement for endocrine irAEs", body: "Hypothyroidism — levothyroxine; adrenal insufficiency — hydrocortisone (lifelong typically); T1DM — insulin; hypophysitis — multiple hormone replacement; permanent in many cases.", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 7, title: "ICI rechallenge decision", body: "Grade 1-2 resolved — often resume; Grade 3-4 — usually permanent discontinuation; counsel risk-benefit; some patients benefit from alternative immunotherapy class; multidisciplinary review.", citationIDs: ["specialty_pr_round33"])
        ],
        postProcedure: [
            AttributedBullet("Long-term irAE surveillance + management even after ICI discontinuation; some irAEs develop weeks-months after stopping.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Cancer-directed surveillance + treatment continuation per cancer-specific protocols.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Hormone replacement adherence + adjustments for chronic endocrinopathies.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Survivorship + late effects monitoring + lifestyle.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Comprehensive multidisciplinary follow-up + emotional support.", citationIDs: ["specialty_pr_round33"])
        ],
        documentation: [
            AttributedBullet("Pre + per cycle assessments + irAE identification + grading + management + response.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Cyclic labs + imaging + multidisciplinary consultations + interventions.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Patient education + emergency action plan + wallet card.", citationIDs: ["specialty_pr_round33"])
        ],
        watchFor: [
            AttributedBullet("ANY organ system can be affected — comprehensive surveillance + early intervention; new symptoms warrant evaluation.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("CARDIAC IRAES — myocarditis rare but FATAL in 25-50%; troponin + ECG at every cycle; new chest pain/dyspnea/arrhythmia — emergent.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("HYPOPHYSITIS + DKA — endocrine emergencies; severe headache + visual changes + altered mental status emergent; T1DM with DKA risk especially elderly.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("PNEUMONITIS + COLITIS + HEPATITIS — most common irAEs; algorithm-based management; multidisciplinary.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("RARE irAEs — Guillain-Barré, encephalitis, transverse myelitis, peripheral neuropathy, vasculitis, dermatomyositis, hemolytic anemia, thrombocytopenia, nephritis; vigilance + specialty consultation.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("INFECTION as alternative cause — rule out infectious etiology for symptoms before attributing to irAE.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Pseudoprogression on imaging — apparent disease growth before response; not always treatment failure; reimage 4-6 weeks.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("OPPORTUNISTIC INFECTIONS during prolonged steroid treatment — PCP prophylaxis (TMP-SMX) for >4 weeks of moderate-high dose steroids.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("MEDICATION ADHERENCE — hormone replacements + steroids + symptom medications.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("MULTIDISCIPLINARY coordination — oncology + endocrinology + GI + pulmonology + hepatology + neurology + cardiology + ID + critical care; specialty centers excel.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("PATIENT + family education + wallet card + emergency action plan + symptom reporting + 24/7 access to multidisciplinary care.", citationIDs: ["specialty_pr_round33"])
        ],
        citations: [openrnPRR33, cdcPRR33, specialtyPRR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ImplantedPortCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "implanted-port-care",
        title: "Implanted vascular access port (port-a-cath) care",
        subtitle: "Subcutaneous reservoir + IV catheter · long-term cancer therapy access · ACCESS with non-coring Huber needle · monthly flush + lock · CLABSI prevention · imaging confirmation",
        nclexTags: procTagsR33,
        indications: AttributedProse(
            "Long-term venous access for cancer chemotherapy + TPN + frequent blood draws + repeated IV access for any chronic condition + poor peripheral access; advantages over PICC + central lines — implanted (less infection risk, less restriction of activities, swimmable when accessed); disadvantages — surgical implantation procedure, more complex access (need port needle), can be more difficult to use in emergencies per primary source.",
            citationIDs: ["specialty_pr_round33"]
        ),
        contraindications: AttributedProse(
            "Active local skin infection over implantation site; severe coagulopathy uncorrected; cellulitis at port site; patient with thrombocytopenia and bleeding (relative); patient inability to cooperate with care (sedation required).",
            citationIDs: ["specialty_pr_round33"]
        ),
        equipment: [
            AttributedBullet("STERILE field — chlorhexidine prep + drape + mask + gown + sterile gloves; HAND HYGIENE.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("HUBER (non-coring) needle — typically 20-22 gauge × 0.75-1.5 inches; pre-attached extension tubing + clamp + connector; PROPER LENGTH (depends on patient body habitus + port depth); standard 19-22 gauge most common.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Sterile saline flushes (10 mL syringes typical); HEPARIN LOCK solution per institutional protocol (10-100 U/mL); needleless connectors; transparent sterile dressing; chlorhexidine biopatch (chlorhexidine-impregnated disc).", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Lab supplies — vacuum tubes, transfer device, blood culture bottles when needed.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Imaging — chest X-ray immediately post-insertion to confirm tip position + rule out pneumothorax.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Topical anesthetic — LMX cream (lidocaine 4%) OR EMLA (lidocaine + prilocaine 2.5%) applied 30-60 minutes before access for patient comfort; pediatric particularly.", citationIDs: ["openrn_pr_round33"])
        ],
        preProcedure: [
            AttributedBullet("Verify patient identity + indication + orders; review prior access difficulties + complications.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Palpate port — locate reservoir; identify septum (top, smooth, central) vs subcutaneous tissue; assess overlying skin integrity, infection, hematoma.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Topical anesthetic — apply 30-60 minutes before access; counsel patient on technique + comfort.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("HAND HYGIENE + sterile prep with chlorhexidine 30+ seconds wet contact; allow to dry × 30 seconds; sterile drape if accessing for first time of cycle.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Position — supine or sitting upright; port typically right or left upper chest (subclavian/cephalic vein access most common); pediatric variants.", citationIDs: ["openrn_pr_round33"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Access — find + stabilize", body: "Locate port + center palpation between thumb + index finger (\"O\" grip); stabilize port firmly against chest wall; identify center of reservoir (sometimes with dimple in skin); maintain orientation throughout.", citationIDs: ["openrn_pr_round33"]),
            ProcedureStep(number: 2, title: "Needle insertion", body: "HUBER NEEDLE — perpendicular to port surface (90°); pass through skin then subcutaneous tissue then port silicone diaphragm; advance until needle bottoms out on metal floor of port (\"hits floor\"); REMOVE PROTECTIVE COVER + immediately occlude needle hub to prevent air embolism if extension tubing not pre-attached.", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 3, title: "Verification + initial flush", body: "ASPIRATE 5-10 mL of blood — confirms intravascular position; discard waste; FLUSH 10-20 mL sterile saline with pulsatile (push-pause) technique to clear blood + verify patency.", citationIDs: ["specialty_pr_round33"]),
            ProcedureStep(number: 4, title: "Securement + dressing", body: "Place gauze pad under needle hub for cushioning if rigid; SECURE needle with tape or transparent dressing to prevent dislodgement; transparent sterile dressing OVER + BIOPATCH (chlorhexidine disc) at insertion site + change weekly OR sooner if compromised.", citationIDs: ["openrn_pr_round33"]),
            ProcedureStep(number: 5, title: "Use + maintenance", body: "Administer IV fluids, medications, blood products as ordered; flush 10-20 mL saline before + after each medication + blood product; observe for swelling, pain, leakage during infusion.", citationIDs: ["openrn_pr_round33"]),
            ProcedureStep(number: 6, title: "De-access + locking", body: "FLUSH thoroughly with 10-20 mL saline; LOCK with HEPARIN solution (3-5 mL of 100 U/mL OR 10 U/mL per institutional protocol); FORWARD-PUSH disconnect technique; remove needle slowly perpendicular; apply gauze + pressure × 1 minute; sterile bandage.", citationIDs: ["openrn_pr_round33"]),
            ProcedureStep(number: 7, title: "Monthly maintenance access", body: "WHEN NOT IN ACTIVE USE — access monthly for FLUSH + LOCK; alternatively per institutional protocol q6 weeks; some protocols accept q3 months in stable patients; document each access.", citationIDs: ["specialty_pr_round33"])
        ],
        postProcedure: [
            AttributedBullet("Document — patient tolerance, access difficulty, needle gauge + length, fluids/medications + flush volumes + lock solution + complications.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Counsel patient — sign + symptom reporting (pain, swelling, redness, fever), keep dressing dry, avoid heavy lifting affecting port site (after recent placement), maintenance schedule.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("MONTHLY MAINTENANCE — port flush + lock; patient self-management options for chronic situations.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Remove port when no longer needed — outpatient surgical procedure.", citationIDs: ["specialty_pr_round33"])
        ],
        documentation: [
            AttributedBullet("Insertion details + tip position + complications + healing.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Each access — date, indication, fluids/medications, flush volumes, complications.", citationIDs: ["openrn_pr_round33"]),
            AttributedBullet("Maintenance schedule + adherence.", citationIDs: ["openrn_pr_round33"])
        ],
        watchFor: [
            AttributedBullet("INSERTION COMPLICATIONS — pneumothorax (subclavian + cephalic vein access; chest X-ray immediately post + at 1-2 hours for delayed), hemothorax, arterial puncture, malposition (need fluoroscopy or repositioning), air embolism (improper handling).", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("INFECTION (CLABSI) — fever, chills, port pocket infection (swelling, redness, drainage, pain); blood cultures + line cultures; antibiotics; salvage attempt with antibiotic lock therapy; sometimes port removal if persistent infection.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("CATHETER OCCLUSION — fibrin sheath, thrombus, drug precipitate, mechanical kink; tPA (alteplase) 2-2.5 mg in 2-3 mL saline for thrombotic; saline + change technique for mechanical; surgical revision if persistent.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("CATHETER FRACTURE + EMBOLISM — broken catheter pieces can embolize; rare but emergent; CXR + IR + endovascular retrieval.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("PINCH-OFF SYNDROME — subclavian-clavicle compression of catheter at insertion site; causes intermittent occlusion, eventual catheter fracture; CXR ratio + clinical signs; replace catheter.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("EXTRAVASATION — particularly vesicant chemotherapy; pain + swelling at access site during infusion; STOP infusion + aspirate + attempt to remove vesicant + antidote-specific (cold compress + dexrazoxane for anthracyclines + warm + hyaluronidase for vinca alkaloids + cold compress + sodium thiosulfate for cisplatin/mechlorethamine); document + plastic surgery consultation if severe.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("VEIN THROMBOSIS — symptomatic (arm swelling, pain, dilated chest veins) or asymptomatic; ultrasound + anticoagulation (heparin → DOAC/warfarin); usually keep port unless functional issue.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("PORT POCKET HEMATOMA / INFECTION — post-insertion or after access; cleanse + observe; antibiotics if cellulitis.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("AIR EMBOLISM — emergent (Trendelenburg + left lateral + 100% oxygen + emergent treatment).", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("LATE COMPLICATIONS — port erosion through skin (replace), port flipping (Twiddler syndrome — patient manipulation; rotate or replace), allergic reaction to materials.", citationIDs: ["specialty_pr_round33"]),
            AttributedBullet("Patient teaching — sign + symptom reporting + emergency contact + maintenance schedule + self-care.", citationIDs: ["specialty_pr_round33"])
        ],
        citations: [openrnPRR33, cdcPRR33, specialtyPRR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CINVManagementSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cinv-management",
        title: "Chemotherapy-induced nausea + vomiting (CINV) management",
        subtitle: "Emetogenic risk classification (HIGH/MODERATE/LOW/MINIMAL) · acute vs delayed CINV · NCCN + ASCO + ESMO protocols · combination antiemetics · breakthrough management",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: refTagsR33,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Chemotherapy-induced nausea + vomiting (CINV) significantly impacts QoL + treatment adherence + sometimes leads to dose modification or discontinuation. Modern antiemetic protocols (NCCN, ASCO, ESMO, MASCC) classify chemotherapy by EMETOGENIC RISK (high, moderate, low, minimal) + treat with combinations of agents targeting different pathways. ACUTE CINV (within 24 hours) + DELAYED CINV (24-120 hours post-chemo) + BREAKTHROUGH (despite antiemetics) + REFRACTORY (failed multiple antiemetic regimens) + ANTICIPATORY (conditioned response before chemo) — different management approaches per primary source.",
                citationIDs: ["specialty_pr_round33"]
            )),
            .keyValueTable(title: "Emetogenic risk classification", [
                KeyValueRow(key: "HIGH (>90% emesis without prophylaxis)", value: "Cisplatin (especially ≥50 mg/m²), AC (doxorubicin + cyclophosphamide) regimen, carmustine, dacarbazine, ifosfamide ≥10 g/m², mechlorethamine, melphalan IV, streptozocin, cyclophosphamide ≥1500 mg/m²"),
                KeyValueRow(key: "MODERATE (30-90% emesis)", value: "Carboplatin, doxorubicin, daunorubicin, epirubicin, idarubicin, cyclophosphamide <1500 mg/m², oxaliplatin, ifosfamide <10 g/m², methotrexate ≥250 mg/m², irinotecan, bendamustine, melphalan oral, romidepsin, trabectedin"),
                KeyValueRow(key: "LOW (10-30% emesis)", value: "5-FU, gemcitabine, paclitaxel, docetaxel, etoposide (PO), pemetrexed, methotrexate (low/mid-dose), capecitabine, mitomycin, mitoxantrone, cabazitaxel, eribulin, ixabepilone, bortezomib, carfilzomib, cetuximab, panitumumab"),
                KeyValueRow(key: "MINIMAL (<10% emesis)", value: "Bevacizumab, bleomycin, vincristine, vinorelbine, rituximab, trastuzumab, fludarabine, asparaginase, hormonal therapy (tamoxifen, AI, fulvestrant), targeted oral agents (most TKIs)"),
                KeyValueRow(key: "Oral chemo", value: "Separate classifications; most TKIs minimal-low; capecitabine moderate-low; temozolomide moderate")
            ]),
            .keyValueTable(title: "HIGH-risk emetogenic — prophylaxis", [
                KeyValueRow(key: "Day 1 (acute)", value: "NK-1 INHIBITOR — aprepitant 125 mg PO OR fosaprepitant 150 mg IV OR rolapitant 180 mg PO OR netupitant-palonosetron (Akynzeo) PO; PLUS 5HT3 ANTAGONIST — palonosetron 0.25 mg IV OR ondansetron 8-16 mg IV OR granisetron 1 mg IV; PLUS DEXAMETHASONE 12 mg PO/IV; PLUS OLANZAPINE 5-10 mg PO BID (some protocols)"),
                KeyValueRow(key: "Days 2-4 (delayed)", value: "APREPITANT 80 mg PO daily × 2-3 days; DEXAMETHASONE 8 mg PO daily × 2-3 days; OLANZAPINE 5-10 mg PO daily × 3 days (if used Day 1)"),
                KeyValueRow(key: "Breakthrough", value: "PROCHLORPERAZINE, METOCLOPRAMIDE, LORAZEPAM, DRONABINOL (cannabinoid), OLANZAPINE rescue 5-10 mg PO PRN")
            ]),
            .keyValueTable(title: "MODERATE-risk emetogenic", [
                KeyValueRow(key: "Day 1 (acute)", value: "5HT3 ANTAGONIST (palonosetron preferred); DEXAMETHASONE 12 mg; CONSIDER NK-1 inhibitor (for high-moderate risk like carboplatin + AC regimens); olanzapine optional"),
                KeyValueRow(key: "Days 2-3", value: "DEXAMETHASONE 8 mg daily × 2 days; sometimes 5HT3 continuation"),
                KeyValueRow(key: "Breakthrough", value: "Same as high-risk")
            ]),
            .keyValueTable(title: "LOW-risk + MINIMAL-risk", [
                KeyValueRow(key: "LOW", value: "Single antiemetic — 5HT3 OR dexamethasone OR prochlorperazine OR metoclopramide for acute; usually no scheduled delayed prophylaxis"),
                KeyValueRow(key: "MINIMAL", value: "Usually NO routine prophylaxis; PRN antiemetic if symptoms develop"),
                KeyValueRow(key: "Breakthrough", value: "PRN antiemetics — same options as high/moderate")
            ]),
            .keyValueTable(title: "Special situations", [
                KeyValueRow(key: "Multi-day chemotherapy (e.g., BEP, ABVD, R-CHOP)", value: "Daily dexamethasone + 5HT3 + NK-1 inhibitor; protocol-specific"),
                KeyValueRow(key: "Highly emetogenic + non-emetogenic combinations", value: "Use highest level appropriate"),
                KeyValueRow(key: "Patients with breakthrough CINV", value: "Add olanzapine if not used; escalate to higher class; switch 5HT3 (palonosetron has long half-life advantage)"),
                KeyValueRow(key: "Refractory CINV", value: "Multidisciplinary, palliative consultation, alternative routes (PR, IV continuous), supportive care intensification"),
                KeyValueRow(key: "Anticipatory CINV", value: "Behavioral therapy (relaxation, guided imagery, cognitive-behavioral), benzodiazepines (lorazepam 0.5-2 mg PO before chemo + day before); prevention with adequate first cycle control"),
                KeyValueRow(key: "Radiation-induced nausea", value: "5HT3 prophylaxis for high-emetogenic radiation (total body, total abdomen, upper abdomen); supportive for less emetogenic")
            ]),
            .bullets(title: "Antiemetic classes + agents", [
                AttributedBullet("5HT3 ANTAGONISTS — ondansetron (oral + IV + IM + ODT), granisetron (oral + IV + patch), palonosetron (IV — long half-life ~40 hours, particularly effective for delayed CINV), dolasetron (PO).", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("NK-1 RECEPTOR ANTAGONISTS — aprepitant (oral) + fosaprepitant (IV) + rolapitant (oral) + netupitant (in Akynzeo combination); inhibit substance P signaling.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("CORTICOSTEROIDS — dexamethasone primary; mechanism complex; potent antiemetic at standard doses; concurrent immunosuppression considered.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("OLANZAPINE — atypical antipsychotic; 5-10 mg PO daily; covers acute + delayed; particularly effective for breakthrough; sedation main side effect.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("BENZODIAZEPINES — lorazepam for anticipatory + breakthrough + anxiety component; supplementary.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("DOPAMINE ANTAGONISTS — metoclopramide (D2 + 5HT3), prochlorperazine (phenothiazine D2), haloperidol; breakthrough + supplementary; risk of extrapyramidal symptoms (especially metoclopramide).", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("CANNABINOIDS — dronabinol + nabilone; alternative or supplementary; particular utility in refractory + appetite stimulation.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("OTHERS — emerging — rolapitant + amisulpride + clinical trials of various neurotransmitter system targets.", citationIDs: ["specialty_pr_round33"])
            ]),
            .bullets(title: "Nursing care + patient education", [
                AttributedBullet("Pre-chemotherapy — comprehensive emetogenic assessment + appropriate prophylaxis selection.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("Patient education — expected symptoms, take antiemetics on schedule (NOT as needed only), avoid triggers (strong smells, fried foods, large meals), small frequent meals, ginger + acupressure + complementary, hydration, electrolyte monitoring.", citationIDs: ["openrn_pr_round33"]),
                AttributedBullet("Symptom diary — track timing, severity, response to medications; guides adjustments.", citationIDs: ["openrn_pr_round33"]),
                AttributedBullet("Multidisciplinary — oncology + pharmacy + nutrition + supportive care + palliative care for refractory.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("Hydration + electrolyte monitoring — fluid balance, weight, vital signs; IV hydration when severe.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("Anticipatory CINV PREVENTION — adequate first cycle control + behavioral support + benzodiazepines if anxiety component.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("Dose modifications + delays — for refractory CINV impacting treatment adherence.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("Survivorship — long-term emesis-conditioned responses possible; counseling.", citationIDs: ["specialty_pr_round33"])
            ])
        ],
        citations: [openrnPRR33, cdcPRR33, specialtyPRR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HereditaryCancerSyndromesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "hereditary-cancer-syndromes",
        title: "Hereditary cancer syndromes",
        subtitle: "BRCA1/2 + Lynch syndrome + Li-Fraumeni + Cowden + FAP + MEN + VHL · germline testing + cascade family screening + risk-reduction surgery + intensified surveillance",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: refTagsR33,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Hereditary cancer syndromes — germline mutations significantly increase cancer risk + characterize 5-10% of all cancers. EARLY IDENTIFICATION enables intensified screening + risk-reduction surgery + cascade family testing + tailored treatment (targeted therapies in mutated cancers). GENETIC COUNSELING + multidisciplinary care + family communication central. Most common — BRCA1/2 + Lynch syndrome + Li-Fraumeni + Cowden + FAP + MEN1/2 + VHL + many others. Recognition + management transformative for affected families per primary source.",
                citationIDs: ["specialty_pr_round33"]
            )),
            .keyValueTable(title: "BRCA1/2 (hereditary breast + ovarian cancer)", [
                KeyValueRow(key: "Gene + inheritance", value: "BRCA1 (17q21) + BRCA2 (13q12); autosomal dominant; tumor suppressor — HRR deficient cancers"),
                KeyValueRow(key: "Cancers", value: "BREAST 50-85% lifetime, OVARIAN 15-45%, prostate (BRCA2 30%), pancreatic (BRCA2 5-10%), melanoma (BRCA2), male breast"),
                KeyValueRow(key: "Surveillance", value: "Breast — MRI annually + mammography annually starting age 25-30; ovarian — CA-125 + transvaginal ultrasound q6 months from age 30-35 (but suboptimal sensitivity); prostate — PSA + digital exam annually from age 40-45 (BRCA2); pancreatic — high-risk EUS + MRCP in selected; risk-reduction discussion"),
                KeyValueRow(key: "Risk-reduction surgery", value: "Bilateral prophylactic mastectomy (>90% breast cancer risk reduction); bilateral salpingo-oophorectomy (BSO) by age 35-40 (BRCA1) or 40-45 (BRCA2) — reduces ovarian risk + breast cancer risk if pre-menopausal"),
                KeyValueRow(key: "Tamoxifen + AI", value: "Chemoprevention discussed; complex risk-benefit"),
                KeyValueRow(key: "Treatment implications", value: "PARP inhibitors (olaparib + talazoparib) for BRCA-mutated breast + ovarian + prostate + pancreatic cancers"),
                KeyValueRow(key: "Testing indications", value: "Age <45 breast cancer, triple-negative breast <60, male breast cancer, ovarian cancer at any age, pancreatic cancer, family history, Ashkenazi Jewish ethnicity, founder mutations")
            ]),
            .keyValueTable(title: "Lynch syndrome (hereditary nonpolyposis CRC)", [
                KeyValueRow(key: "Gene + inheritance", value: "MLH1 + MSH2 + MSH6 + PMS2 + EPCAM (deletion); autosomal dominant; mismatch repair deficiency"),
                KeyValueRow(key: "Cancers", value: "COLORECTAL 50-80%, ENDOMETRIAL 30-60%, ovarian 8-20%, urothelial 5-10%, gastric 5-15%, small bowel 4-12%, hepatobiliary 1-3%, brain 1-3% (Turcot syndrome variant), pancreas, sebaceous (Muir-Torre variant)"),
                KeyValueRow(key: "Surveillance", value: "Colonoscopy annually starting age 20-25 (or 5 years before youngest affected); transvaginal ultrasound + endometrial biopsy annually from age 30-35; urinalysis + urine cytology annually from age 30-35; gastric + small bowel + brain surveillance per family history; dermatologic for sebaceous"),
                KeyValueRow(key: "Risk-reduction surgery", value: "Prophylactic hysterectomy + BSO after childbearing complete; sometimes prophylactic colectomy considered (controversial)"),
                KeyValueRow(key: "Daily aspirin", value: "Reduces CRC by ~50% in carriers (CAPP2 trial); 600 mg daily × 2 years recommended for Lynch by some societies"),
                KeyValueRow(key: "Treatment implications", value: "MSI-high tumors — pembrolizumab + other immunotherapy; FOLFOX/FOLFIRI suitable; FU + cisplatin + leucovorin standard"),
                KeyValueRow(key: "Testing", value: "Universal MSI/MMR testing of colorectal + endometrial cancers; family history evaluation; Amsterdam II + revised Bethesda criteria historic")
            ]),
            .keyValueTable(title: "Li-Fraumeni syndrome", [
                KeyValueRow(key: "Gene + inheritance", value: "TP53; autosomal dominant; near-complete penetrance"),
                KeyValueRow(key: "Cancers", value: "Multiple primaries — sarcomas (osteosarcoma, soft tissue, rhabdomyosarcoma), breast (young — <30), brain (glioma, astrocytoma, choroid plexus), adrenocortical, leukemia, lymphoma; lifetime risk >90%; childhood + young adult cancers common"),
                KeyValueRow(key: "Surveillance", value: "TORONTO PROTOCOL — comprehensive yearly clinical exam + brain MRI + body MRI + ultrasound + breast MRI (women) starting at birth; intensive ongoing"),
                KeyValueRow(key: "Treatment", value: "Avoid radiation when possible (induces secondary cancers); aggressive multimodal treatment; clinical trials"),
                KeyValueRow(key: "Testing", value: "Family history of multiple cancers + early-onset; classic + Chompret criteria; suspect with childhood sarcoma + adrenocortical + glioma + multiple primaries")
            ]),
            .keyValueTable(title: "Familial adenomatous polyposis (FAP)", [
                KeyValueRow(key: "Gene + inheritance", value: "APC gene; autosomal dominant; near-complete penetrance"),
                KeyValueRow(key: "Cancers", value: "Hundreds-thousands of colorectal polyps starting age 10-15 + COLORECTAL CANCER inevitable by age 35-40 without treatment; duodenal adenomas + cancer common; desmoid tumors; thyroid (cribriform-morular variant of papillary), hepatoblastoma in children, brain (Turcot variant), gastric"),
                KeyValueRow(key: "ATTENUATED FAP", value: "Fewer polyps (20-100); right-sided + delayed onset; APC mutations in different regions"),
                KeyValueRow(key: "Surveillance", value: "Annual flex sigmoidoscopy + colonoscopy starting age 10-15; upper GI endoscopy starting age 25-30 + every 1-5 years"),
                KeyValueRow(key: "Prophylactic surgery", value: "TOTAL COLECTOMY with ileorectal anastomosis OR proctocolectomy with ileoanal pouch by late teens-early 20s — essentially eliminates CRC risk"),
                KeyValueRow(key: "Chemoprevention", value: "Celecoxib + sulindac (NSAIDs) reduce polyps; cardiac + renal risks; controversial"),
                KeyValueRow(key: "Testing", value: "Family history + clinical phenotype (multiple polyps); pediatric genetic counseling")
            ]),
            .keyValueTable(title: "Other important syndromes", [
                KeyValueRow(key: "Cowden syndrome (PTEN hamartoma)", value: "PTEN gene; breast 85% + thyroid 35% + endometrial + renal + colon cancers + benign hamartomas; surveillance + risk-reduction surgery"),
                KeyValueRow(key: "Hereditary diffuse gastric cancer", value: "CDH1 gene; diffuse gastric cancer 70% + lobular breast 40% in carriers; prophylactic gastrectomy + breast surveillance"),
                KeyValueRow(key: "Multiple endocrine neoplasia type 1 (MEN1)", value: "MEN1 gene (menin); parathyroid + pituitary + pancreatic NETs (3 P's); surveillance + tumor-specific management"),
                KeyValueRow(key: "MEN type 2A + 2B", value: "RET gene; medullary thyroid cancer (MTC) + pheochromocytoma + parathyroid (2A); MTC + mucosal neuromas + marfanoid (2B); prophylactic thyroidectomy in childhood + lifelong screening"),
                KeyValueRow(key: "Von Hippel-Lindau (VHL)", value: "VHL gene; renal cell carcinoma + pheochromocytoma + hemangioblastomas (CNS + retinal) + pancreatic NETs + cysts + endolymphatic sac tumors; surveillance + tumor-specific management"),
                KeyValueRow(key: "Neurofibromatosis 1 (NF1)", value: "NF1 gene; neurofibromas + optic gliomas + pheochromocytoma + breast (younger women) + leukemia; surveillance + symptom management"),
                KeyValueRow(key: "Peutz-Jeghers syndrome", value: "STK11/LKB1; hamartomatous polyposis + mucocutaneous pigmentation; GI cancers + breast + ovarian + pancreatic + lung; surveillance"),
                KeyValueRow(key: "Familial atypical multiple mole melanoma (FAMMM)", value: "CDKN2A; melanoma + pancreatic cancer; surveillance"),
                KeyValueRow(key: "Hereditary papillary renal cell carcinoma", value: "MET gene; papillary type 1 RCC; surveillance"),
                KeyValueRow(key: "Birt-Hogg-Dubé syndrome", value: "FLCN gene; renal cancer (various subtypes) + skin lesions + lung cysts + pneumothorax"),
                KeyValueRow(key: "Hereditary leiomyomatosis + RCC (HLRCC)", value: "FH gene; cutaneous + uterine leiomyomas + RCC (Type 2 papillary)")
            ]),
            .bullets(title: "Management principles", [
                AttributedBullet("GENETIC COUNSELING + INFORMED CONSENT — pre + post testing; psychosocial + family implications + insurance considerations (GINA protects employment + health insurance, not life/disability).", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PANEL TESTING — comprehensive multi-gene panels now standard (vs single gene); identifies broader spectrum + cost-effective.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("CASCADE TESTING — first-degree relatives + extended family; counseling + testing decisions; reproductive implications.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("INTENSIFIED SURVEILLANCE — early + frequent + multimodal screening per syndrome guidelines; multidisciplinary specialty care.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("RISK-REDUCTION SURGERY — depending on syndrome + risk + patient preference; informed consent + reproductive implications + psychological support.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("CHEMOPREVENTION — selected syndromes (NSAIDs for FAP, tamoxifen/aspirin discussion for BRCA); risk-benefit individualized.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("REPRODUCTIVE OPTIONS — preimplantation genetic diagnosis (PGD), prenatal testing, adoption, donor gametes; reproductive endocrinology + genetic counseling.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("INSURANCE + DISCRIMINATION — GINA protects employment + health insurance; counseling about implications; life + disability + long-term care + military service NOT protected.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PSYCHOSOCIAL support — counseling + support groups + family communication + decision-making; significant emotional impact.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("EVOLVING field — new syndromes + improved testing + treatment + surveillance; ongoing reclassification of variants of uncertain significance; lifelong follow-up + reassessment.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("Multidisciplinary care — genetics + oncology + surgery + gynecology + GI + endocrinology + dermatology + radiology + mental health + reproductive medicine + nursing leadership.", citationIDs: ["specialty_pr_round33"])
            ])
        ],
        citations: [openrnPRR33, cdcPRR33, specialtyPRR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IrAEAlgorithmSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "immune-related-ae-algorithm",
        title: "Immune-related adverse events (irAE) management algorithm",
        subtitle: "Comprehensive irAE recognition + grading + treatment by organ system · early steroid + advanced immunosuppression · ICI rechallenge decisions · multidisciplinary",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: refTagsR33,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Immune checkpoint inhibitor (ICI) therapy revolutionized cancer treatment but causes immune-related adverse events (irAEs) in 50-80% of patients (any grade); 10-30% Grade 3-4 with combination therapy. ALL ORGAN SYSTEMS can be affected. EARLY RECOGNITION + appropriate management essential to prevent severe/fatal outcomes. CTCAE grading guides treatment intensity. CORTICOSTEROIDS first-line for Grade 2+; SECOND-LINE IMMUNOSUPPRESSION for steroid-refractory. Cancer treatment must balance benefit vs irAE risk; multidisciplinary management essential per primary source.",
                citationIDs: ["specialty_pr_round33"]
            )),
            .keyValueTable(title: "General irAE management principles", [
                KeyValueRow(key: "GRADE 1 (asymptomatic/mild)", value: "Continue ICI + symptomatic treatment + close monitoring + serial labs"),
                KeyValueRow(key: "GRADE 2 (moderate)", value: "HOLD ICI + start corticosteroids (prednisone 0.5-1 mg/kg/day OR equivalent); reassess in 48-72 hours; if responding, slow taper over 4-6 weeks + consider rechallenge"),
                KeyValueRow(key: "GRADE 3 (severe)", value: "HOLD ICI + IV corticosteroids (methylprednisolone 1-2 mg/kg/day OR dexamethasone equivalent); hospitalize; multidisciplinary specialist consultation; often PERMANENT discontinuation; slow taper over 6-12 weeks"),
                KeyValueRow(key: "GRADE 4 (life-threatening)", value: "HOSPITALIZATION; HIGH-DOSE IV STEROIDS (methylprednisolone 1 g IV × 3 days OR 1-2 mg/kg/day OR pulse therapy); PERMANENT discontinuation; consider second-line immunosuppression early; ICU as needed"),
                KeyValueRow(key: "STEROID-REFRACTORY", value: "After 48-72 hours of high-dose steroids with no improvement OR worsening; ADD SECOND-LINE — depends on organ — infliximab, vedolizumab, mycophenolate, tacrolimus, ATG, IVIG, plasmapheresis, others"),
                KeyValueRow(key: "STEROID TAPERING", value: "Gradual over 4-8 weeks (Grade 2-3) to 12-16 weeks (Grade 4) — avoid abrupt + risk recurrence; close follow-up")
            ]),
            .keyValueTable(title: "Common irAEs by organ system (frequency varies by ICI class)", [
                KeyValueRow(key: "Dermatologic (~40%)", value: "Rash, pruritus, vitiligo, lichenoid reactions, psoriasiform, severe Stevens-Johnson/TEN rare; topical/oral steroids based on severity; usually mild-moderate"),
                KeyValueRow(key: "Endocrine (10-15%)", value: "THYROIDITIS (most common — hyperthyroid → hypothyroid usually permanent; levothyroxine replacement); HYPOPHYSITIS (especially CTLA-4; cortisol + thyroid + sex hormone replacement; permanent often); ADRENAL INSUFFICIENCY (hydrocortisone + fludrocortisone); T1DM with DKA (insulin emergency); SIADH"),
                KeyValueRow(key: "GI/Colitis (5-25%)", value: "Diarrhea, abdominal pain, blood in stool; CT + colonoscopy in Grade 2+; steroids + infliximab/vedolizumab for steroid-refractory; perforation rare but emergent"),
                KeyValueRow(key: "Hepatitis (5-20%)", value: "Elevated LFTs; rule out other causes; steroids + mycophenolate for steroid-refractory; rarely transplant for fulminant"),
                KeyValueRow(key: "Pulmonary/Pneumonitis (3-10%)", value: "Cough, dyspnea, hypoxia; chest CT; steroids + immunosuppressants for severe; fatal in 10-15% of Grade 3-4"),
                KeyValueRow(key: "Renal/Nephritis (~2%)", value: "Acute interstitial nephritis; rising Cr; steroids; renal biopsy in some"),
                KeyValueRow(key: "Cardiac/Myocarditis (~1%)", value: "Troponin elevation + ECG changes + symptoms; FATAL in 25-50%; troponin at every cycle; high-dose steroids + ATG + plasmapheresis for severe"),
                KeyValueRow(key: "Neurologic (~1%)", value: "Guillain-Barré-like, myasthenia gravis-like, encephalitis, transverse myelitis, peripheral neuropathy; steroids + IVIG/plasmapheresis; ICU for severe; emergent")
            ]),
            .keyValueTable(title: "Organ-specific management approach", [
                KeyValueRow(key: "Colitis Grade 2+", value: "Stool studies (rule out C. difficile), steroids 1-2 mg/kg; persistent → infliximab 5 mg/kg IV; vedolizumab 300 mg IV; flexible sigmoidoscopy/colonoscopy if needed; multidisciplinary GI"),
                KeyValueRow(key: "Hepatitis Grade 2+", value: "Steroids 1-2 mg/kg; refractory → mycophenolate, azathioprine; AVOID infliximab (hepatotoxic); GI/hepatology"),
                KeyValueRow(key: "Pneumonitis Grade 2+", value: "Steroids 1-2 mg/kg; refractory → infliximab + IVIG + mycophenolate + cyclophosphamide; pulmonology"),
                KeyValueRow(key: "Endocrine — thyroiditis", value: "Hyperthyroid phase — beta-blockers, sometimes steroids; hypothyroid — levothyroxine replacement (usually permanent); CONTINUE ICI (unlike most irAEs)"),
                KeyValueRow(key: "Endocrine — hypophysitis", value: "Replace cortisol FIRST (hydrocortisone) before levothyroxine to avoid adrenal crisis; sex hormones if affected; lifelong replacement"),
                KeyValueRow(key: "T1DM with DKA", value: "Emergency — insulin + fluids + electrolytes; lifelong insulin; CONTINUE ICI"),
                KeyValueRow(key: "Myocarditis", value: "Emergent troponin + ECG + ECHO; high-dose steroids + ATG + plasmapheresis for severe; ICU"),
                KeyValueRow(key: "Encephalitis + GBS-like", value: "Steroids + IVIG + plasmapheresis; ICU + supportive care + ventilation if respiratory")
            ]),
            .bullets(title: "Critical considerations", [
                AttributedBullet("INFECTION must be ruled out as alternative cause for symptoms before attributing to irAE — particularly important for pneumonitis (PCP, viral, bacterial) + colitis (C. difficile) + meningitis/encephalitis (viral, bacterial).", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("STEROID side effects — bone density loss + diabetes (especially with T1DM) + opportunistic infections (PCP prophylaxis for >4 weeks of moderate-high dose); long-term comprehensive monitoring.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("ICI RECHALLENGE — usually OK for Grade 1-2 resolved; usually permanent discontinuation for Grade 3-4; some Grade 3 colitis or hepatitis can be rechallenged carefully; CTLA-4 → switch to anti-PD-1 alone often safer; multidisciplinary review.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PERMANENT DISCONTINUATION — Grade 4 myocarditis, severe pneumonitis, severe Stevens-Johnson, GBS + encephalitis usually; cardiovascular events; balance benefit + risk.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("MULTIDISCIPLINARY care — oncology + organ-specific specialist (GI, pulmonology, endocrine, cardiology, neurology, dermatology) + ID + critical care + multidisciplinary tumor board; specialty centers excel.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PATIENT + FAMILY education — irAE awareness + emergency action plan + wallet card + 24/7 access to multidisciplinary team; symptom reporting + early intervention critical.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("VACCINATIONS — AVOID live vaccines (yellow fever, MMR, varicella, oral typhoid) during ICI + ≥3 months after; inactivated OK + recommended (annual influenza, pneumococcal, COVID).", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PREGNANCY — Category C; counsel + avoid; contraception during + ≥4 months after.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("AUTOIMMUNE history — controlled rheumatologic + IBD generally OK; high-grade active flare relative contraindication; case-by-case decision with rheumatology + GI.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("CANCER RESPONSE often continues despite need for immunosuppression — discuss with patient + family + plan for cancer continuation after irAE resolution if possible.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("EVOLVING field — new combinations + biomarkers + management strategies; ongoing clinical research; multidisciplinary tumor board for complex cases.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("OUTCOMES — most irAEs reversible with appropriate management; some endocrinopathies permanent (often manageable); rare fatal events; majority of patients can continue ICI therapy successfully.", citationIDs: ["specialty_pr_round33"])
            ])
        ],
        citations: [openrnPRR33, cdcPRR33, specialtyPRR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum OncologicEmergenciesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "oncologic-emergencies",
        title: "Oncologic emergencies overview",
        subtitle: "TLS + spinal cord compression + SVC syndrome + hypercalcemia + neutropenic fever + cardiac tamponade + brain mets + DIC + leukostasis · rapid recognition + treatment",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: refTagsR33,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Oncologic emergencies — life-threatening complications of cancer or treatment requiring rapid recognition + emergent intervention. Mechanical (SVC syndrome, spinal cord compression, malignant pericardial effusion + tamponade, brain mass + herniation, intestinal/biliary obstruction, urinary obstruction), metabolic (TLS, hypercalcemia, SIADH, hyperviscosity), hematologic (neutropenic fever, DIC, leukostasis, severe thrombocytopenia + bleeding), infection (septic shock, opportunistic), treatment-related (anaphylaxis, cytokine release syndrome). Multidisciplinary urgent care essential per primary source.",
                citationIDs: ["specialty_pr_round33"]
            )),
            .keyValueTable(title: "Tumor lysis syndrome (TLS)", [
                KeyValueRow(key: "Pathophysiology", value: "Rapid tumor cell breakdown — hyperuricemia + hyperkalemia + hyperphosphatemia + hypocalcemia (secondary to phosphate); AKI + cardiac arrhythmia + seizures + cardiac arrest"),
                KeyValueRow(key: "Risk factors", value: "High-burden tumors (acute leukemias — ALL, AML, blast crisis; high-grade lymphomas — Burkitt, DLBCL; CLL), tumor lysis-sensitive regimens (carboplatin, cisplatin, etoposide, paclitaxel, methotrexate, daunorubicin, vincristine, rituximab + obinutuzumab, glucocorticoids), elevated baseline uric acid + LDH + creatinine"),
                KeyValueRow(key: "Prevention", value: "IDENTIFY HIGH-RISK + start AGGRESSIVE HYDRATION (2-3 L/day NS), ALLOPURINOL 300-600 mg/day PO (or IV) for moderate risk OR RASBURICASE (recombinant urate oxidase) 0.15-0.2 mg/kg IV daily × 5-7 days for HIGH RISK; sodium bicarbonate controversial; AVOID phosphate-containing IV fluids"),
                KeyValueRow(key: "Management of established TLS", value: "AGGRESSIVE HYDRATION + RASBURICASE (rapidly reduces uric acid); HEMODIALYSIS for refractory hyperkalemia or severe hyperphosphatemia + AKI; cardiac monitoring + electrolyte management; calcium for hypocalcemia AFTER phosphate corrected; ICU"),
                KeyValueRow(key: "Cairo-Bishop criteria", value: "Laboratory TLS (any 2 of: uric acid ≥8 mg/dL, K ≥6 mEq/L, phosphate ≥4.5 mg/dL, Ca ≤7 mg/dL within 3 days of treatment start) + Clinical TLS (adding renal failure, arrhythmia, seizures)")
            ]),
            .keyValueTable(title: "Malignant spinal cord compression (MSCC)", [
                KeyValueRow(key: "Etiology", value: "Vertebral metastases compressing spinal cord; most common in breast, prostate, lung, MM, lymphoma + sarcoma; thoracic > lumbar > cervical"),
                KeyValueRow(key: "Presentation", value: "Back pain (90%) — focal + worse at night + worse with movement; weakness + sensory level + bowel/bladder dysfunction (often late); URGENCY to prevent permanent deficits — earlier diagnosis better outcomes"),
                KeyValueRow(key: "Workup", value: "Emergent MRI WHOLE SPINE (multiple level common); CT myelogram if MRI contraindicated"),
                KeyValueRow(key: "Treatment", value: "EMERGENT DEXAMETHASONE 10 mg IV bolus + 4-6 mg q6h (reduces edema + pain); RADIATION THERAPY first-line for most (palliative + reduces cord edema); SURGERY (decompressive laminectomy + fixation) for selected — single level, radiosensitive tumor previously irradiated, mechanical instability, neurologic decline despite radiation, prior radiation to area; recovery related to neurologic status at diagnosis"),
                KeyValueRow(key: "Outcomes", value: "AMBULATORY status at diagnosis — best predictor of outcomes; non-ambulatory at diagnosis — significant permanent deficits more common")
            ]),
            .keyValueTable(title: "Superior vena cava (SVC) syndrome", [
                KeyValueRow(key: "Etiology", value: "Compression/obstruction of SVC — most common — lung cancer (NSCLC + SCLC), lymphoma; metastases (breast, GI), thrombosis from indwelling central catheter or hypercoagulable state"),
                KeyValueRow(key: "Presentation", value: "FACE + NECK + UPPER EXTREMITY SWELLING — bilateral arm + facial + neck edema; dilated chest wall + neck veins; headache + cognitive changes (cerebral edema); cough + dyspnea + dysphagia (mediastinal mass effect); CRITICAL airway compromise rare but emergent"),
                KeyValueRow(key: "Workup", value: "CT chest with contrast (mass + thrombus + collaterals); biopsy if not previously diagnosed (especially in lymphoma → chemoresponsive)"),
                KeyValueRow(key: "Treatment", value: "ELEVATE head of bed; oxygen + diuretics for symptomatic relief (controversial in some); RADIATION THERAPY for malignant cause + chemo if chemosensitive (lymphoma, SCLC); STENT placement (endovascular) for rapid relief in severe + cancer-related; ANTICOAGULATION for thrombotic SVC; high-dose corticosteroids if neurologic emergency"),
                KeyValueRow(key: "Outcomes", value: "Significant symptom improvement with appropriate treatment; underlying cancer determines long-term outcome")
            ]),
            .keyValueTable(title: "Hypercalcemia of malignancy", [
                KeyValueRow(key: "Etiology", value: "Most common in BREAST + LUNG + MM + others; PTHrP secretion (humoral hypercalcemia), bone metastases (osteolytic — breast, MM, lung), 1,25-OH vitamin D production (lymphomas, granulomatous), ectopic PTH (rare)"),
                KeyValueRow(key: "Presentation", value: "MILD (<12) — fatigue + constipation + polyuria; MODERATE (12-14) — nausea + altered mental status + dehydration; SEVERE (>14) — seizures + coma + cardiac arrhythmia + DEATH"),
                KeyValueRow(key: "Workup", value: "Total + ionized calcium + albumin (correct for albumin), PTH (suppressed in malignancy), PTHrP, 1,25-OH vitamin D, BUN/Cr, EKG (shortened QT)"),
                KeyValueRow(key: "Treatment", value: "AGGRESSIVE IV HYDRATION (normal saline 2-4 L/day OR more); CALCITONIN 4-8 IU/kg IM/SC q12h (rapid onset 4-6 hours, but tachyphylaxis within 48 hours); BISPHOSPHONATES — ZOLEDRONIC ACID 4 mg IV (onset 24-48 hours, lasts weeks); DENOSUMAB 120 mg SC for refractory or renal-impaired (no nephrotoxicity); LOOP DIURETICS only after rehydration; calcitonin + bisphosphonate combination most effective; HEMODIALYSIS for refractory + AKI"),
                KeyValueRow(key: "Treat underlying", value: "Cancer-directed therapy + bisphosphonate maintenance + denosumab if recurrent")
            ]),
            .keyValueTable(title: "Neutropenic fever (febrile neutropenia)", [
                KeyValueRow(key: "Definition + management", value: "Already covered in dedicated R33 diagnosis entry; ANC <500 + fever ≥38.3°C; empiric broad-spectrum within 1 hour; MASCC risk stratification; antifungal coverage for prolonged neutropenia")
            ]),
            .keyValueTable(title: "Cardiac tamponade (malignant pericardial effusion)", [
                KeyValueRow(key: "Etiology", value: "Lung + breast cancer + lymphoma + melanoma metastases; chemotherapy-induced (anthracyclines), radiation-induced, infection"),
                KeyValueRow(key: "Presentation", value: "Beck's triad (hypotension + JVD + muffled heart sounds), pulsus paradoxus >12 mmHg, electrical alternans on ECG; emergent"),
                KeyValueRow(key: "Workup", value: "Bedside ECHO + chest X-ray (water bottle heart); cardiology consultation"),
                KeyValueRow(key: "Treatment", value: "EMERGENT PERICARDIOCENTESIS for cardiogenic shock; pericardial window for recurrent; cancer-directed therapy")
            ]),
            .keyValueTable(title: "Brain metastases + increased ICP", [
                KeyValueRow(key: "Etiology", value: "Most common — lung, breast, melanoma, kidney, colon"),
                KeyValueRow(key: "Presentation", value: "Headache (often worst in morning), nausea/vomiting, focal deficits, seizures, altered mental status, papilledema, Cushing triad late"),
                KeyValueRow(key: "Workup", value: "Emergent CT/MRI brain; LP contraindicated if mass effect"),
                KeyValueRow(key: "Treatment", value: "DEXAMETHASONE 10 mg IV bolus + 4 mg q6h; ANTICONVULSANTS if seizures; emergent NEUROSURGERY for herniation or selected; RADIATION (SRS for limited, WBRT for extensive); chemotherapy + targeted therapy + immunotherapy depending on tumor + brain penetration; supportive care")
            ]),
            .keyValueTable(title: "Disseminated intravascular coagulation (DIC)", [
                KeyValueRow(key: "Etiology in cancer", value: "Promyelocytic leukemia (APL — most common cause + ATRA reverses), other acute leukemias, mucin-producing adenocarcinomas (pancreatic, ovarian, GI), prostate cancer, sepsis"),
                KeyValueRow(key: "Presentation", value: "Bleeding (mucosal, IV sites, intracranial) + thrombosis (less common); coagulopathy; multi-organ dysfunction"),
                KeyValueRow(key: "Workup", value: "PT/INR + aPTT (prolonged), platelets (low), fibrinogen (low), D-dimer (high), peripheral smear (schistocytes, low platelets), ISTH scoring"),
                KeyValueRow(key: "Treatment", value: "TREAT UNDERLYING CAUSE — ATRA for APL (transforms outcome); supportive — FFP + cryoprecipitate (fibrinogen <100) + platelets (bleeding + <20K); heparin if predominant thrombosis (controversial); supportive care + ICU")
            ]),
            .keyValueTable(title: "Leukostasis", [
                KeyValueRow(key: "Etiology", value: "WBC >100K (AML particularly) + symptomatic — pulmonary (dyspnea, hypoxia, infiltrates), CNS (confusion, headache, focal deficits), hematologic complications; emergent"),
                KeyValueRow(key: "Treatment", value: "EMERGENT — leukapheresis OR cytoreductive chemo + hydroxyurea + aggressive hydration + AVOID red blood cell transfusion (worsens viscosity); ICU + supportive")
            ]),
            .bullets(title: "Approach principles", [
                AttributedBullet("EARLY RECOGNITION + RAPID INTERVENTION — every minute matters in oncologic emergencies; high index of suspicion in cancer patients.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("MULTIDISCIPLINARY care — oncology + emergency medicine + critical care + relevant specialists (radiation oncology + surgery + cardiology + neurology + hematology) + intensivist.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("DIAGNOSTIC workup parallel with treatment — don't delay treatment for confirmatory testing in life-threatening situations.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PREVENTION strategies — TLS prevention with hydration + rasburicase/allopurinol; bone-protective agents (bisphosphonates, denosumab) for hypercalcemia + skeletal events; vaccination + prophylaxis to prevent neutropenic fever; surveillance imaging.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("CANCER-DIRECTED therapy concurrent with emergency management — treat underlying disease for long-term outcome improvement.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PALLIATIVE CARE integration — for advanced or unresponsive disease; symptom management + quality of life + goals of care + advance directives.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("FAMILY communication + decision-making — emergent situations + life-threatening; informed decisions about aggressive intervention vs comfort care.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("ONCOLOGY EMERGENCY guidelines — NCCN + ASCO + others; specialty consultation; institutional protocols.", citationIDs: ["specialty_pr_round33"]),
                AttributedBullet("PATIENT + caregiver education — recognize warning signs + emergency contact + ED visit triggers + symptom action plan.", citationIDs: ["specialty_pr_round33"])
            ])
        ],
        citations: [openrnPRR33, cdcPRR33, specialtyPRR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}
