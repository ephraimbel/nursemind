import Foundation

// Curator-model procedures + reference (round 18 — heme/onc + pediatrics + safety bundles).

private let openrnPRR18 = CitationSource(
    id: "openrn_pr_round18",
    shortName: "Open RN Critical Care + Pediatrics + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyPRR18 = CitationSource(
    id: "specialty_pr_round18",
    shortName: "ASCO / NCCN / AAP / ONS concept citations",
    publisher: "ASCO · NCCN · AAP · ONS",
    license: .factCitationOnly,
    url: "https://www.ons.org/clinical-practice-resources",
    lastRetrieved: "2026-05-04"
)

private let procTagsR18 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR18 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum BoneMarrowBiopsySample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "bone-marrow-biopsy",
        title: "Bone marrow aspiration + biopsy",
        subtitle: "Posterior iliac crest · sterile · hematology workup · sedation considered",
        nclexTags: procTagsR18,
        indications: AttributedProse(
            "Diagnosis + staging of hematologic malignancies (leukemia, lymphoma, myeloma); workup of unexplained pancytopenia / cytopenias; suspected aplastic anemia / MDS; suspected metastatic cancer involving marrow; tumor lysis evaluation; fever of unknown origin in selected per primary source.",
            citationIDs: ["specialty_pr_round18"]
        ),
        contraindications: AttributedProse(
            "Severe coagulopathy (correctable); local infection at site; uncooperative patient (consider sedation / GA); severe anatomic distortion of pelvis per primary source.",
            citationIDs: ["specialty_pr_round18"]
        ),
        equipment: [
            AttributedBullet("Bone marrow biopsy kit — Jamshidi needle (11–13G), aspiration syringe, slides, EDTA + heparin tubes, formalin container.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Chlorhexidine prep, sterile drape + gloves + gown, 1% lidocaine + 25-gauge needle for skin + 22-gauge for periosteum.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Conscious sedation supplies (midazolam, fentanyl) or local-only depending on patient + facility.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Sterile gauze + pressure dressing post-procedure.", citationIDs: ["openrn_pr_round18"])
        ],
        preProcedure: [
            AttributedBullet("Informed consent — risks (bleeding, infection, pain, fracture rare, organ injury rare).", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Verify INR / platelets / coagulopathy correction; hold anticoagulants per protocol.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Position prone or lateral decubitus; identify posterior superior iliac spine (PSIS).", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Sedation if needed — midazolam + fentanyl; pediatric requires deeper sedation / GA typically.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Pre-medicate analgesic + anxiolytic; explain procedure step-by-step.", citationIDs: ["openrn_pr_round18"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Sterile prep + drape", body: "Chlorhexidine × 30 sec dry; full sterile drape over PSIS area.", citationIDs: ["openrn_pr_round18"]),
            ProcedureStep(number: 2, title: "Local anesthesia", body: "Infiltrate skin → subcutaneous → periosteum with 1% lidocaine; allow ~5 min for adequate anesthesia of periosteum (most painful structure).", citationIDs: ["openrn_pr_round18"]),
            ProcedureStep(number: 3, title: "Aspiration", body: "Insert biopsy needle through PSIS cortex with rotating motion; remove stylet; attach syringe; aspirate 1–3 mL marrow rapidly (warn — \"momentary deep pressure / pain\"). Make slide smears immediately while assistant tubes the rest.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 4, title: "Biopsy core", body: "Reinsert stylet, advance needle 2 cm with rotating motion, rock to break core, withdraw with rotating motion. Place core in formalin or fresh tissue depending on study.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 5, title: "Confirm specimen quality", body: "Inspect aspirate smear (\"spicules\"); core ≥1.5–2 cm length adequate.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 6, title: "Pressure + dressing", body: "Pressure 5–10 minutes; pressure dressing; observe site post-procedure.", citationIDs: ["openrn_pr_round18"])
        ],
        postProcedure: [
            AttributedBullet("Patient supine on bed for ~30 min applying back pressure to site.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Inspect dressing in 30 min for bleeding; instruct patient to lie supine for several hours.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Acetaminophen / ibuprofen for soreness 24–48 hours; counsel return for fever / increasing pain / drainage / large hematoma.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Clear liquid diet → regular as tolerated post-sedation.", citationIDs: ["openrn_pr_round18"])
        ],
        documentation: [
            AttributedBullet("Indication, site, sedation given, specimens obtained (aspirate + biopsy core length), complications, post-procedure status.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Specimens sent — pathology, flow cytometry, cytogenetics, molecular as ordered.", citationIDs: ["openrn_pr_round18"])
        ],
        watchFor: [
            AttributedBullet("BLEEDING — most common complication; correct coagulopathy + hold anticoagulants pre-procedure.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("INFECTION — rare with sterile technique; counsel signs of infection at site.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("RETROPERITONEAL HEMORRHAGE — rare; severe back / abdominal pain, hypotension, falling Hgb.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("DRY TAP — myelofibrosis / packed marrow / aspirate technique; biopsy still diagnostic.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Vasovagal — supportive care; lay flat + IV fluids.", citationIDs: ["openrn_pr_round18"])
        ],
        citations: [openrnPRR18, specialtyPRR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PediatricLPSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "lp-pediatric",
        title: "Pediatric lumbar puncture",
        subtitle: "Newborn fontanelle window + intrathecal chemo · sedation + smaller needles · age-appropriate landmarks",
        nclexTags: procTagsR18,
        indications: AttributedProse(
            "Pediatric meningitis / encephalitis workup; intrathecal chemotherapy administration in pediatric leukemia; idiopathic intracranial hypertension; CSF analysis for inborn errors of metabolism / metabolic conditions per primary source.",
            citationIDs: ["specialty_pr_round18"]
        ),
        contraindications: AttributedProse(
            "Increased ICP from mass lesion / focal deficits (herniation risk — emergent CT first); severe coagulopathy; local infection at puncture site; cardiopulmonary instability per primary source.",
            citationIDs: ["specialty_pr_round18"]
        ),
        equipment: [
            AttributedBullet("Age-appropriate spinal needle — neonate 22G ¾–1.5 inch; infant 22G 1.5 inch; older child 22G 2.5 inch; 22G atraumatic preferred (reduces post-LP headache).", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("EMLA cream / lidocaine local anesthesia; chlorhexidine prep; sterile drape + gloves.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("4 collection tubes + manometer (older children — opening pressure only valid in lateral decubitus).", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Sedation supplies — sucrose 24% for neonates; midazolam / ketamine / propofol for older children depending on facility.", citationIDs: ["specialty_pr_round18"])
        ],
        preProcedure: [
            AttributedBullet("Informed consent; explain in age-appropriate language; child-life specialist involvement when possible.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("EMLA cream 30–60 min before; topical lidocaine spray; preprocedural sucrose 24% PO for neonates.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Pre-procedure imaging — selective; CT before LP if focal deficits / increased ICP signs / immunocompromised.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Position — lateral decubitus (back arched, knees to chest with assistant holding) OR sitting; AVOID excessive flexion in neonates (airway compromise).", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Continuous SpO2 + cardiac monitoring; emergency airway equipment ready.", citationIDs: ["openrn_pr_round18"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Identify level", body: "Tuffier's line — iliac crests at L4 in older children; in infants L3-L4 (cord ends at L3 in newborns) or L4-L5; midline.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 2, title: "Sterile prep + local anesthesia", body: "Chlorhexidine prep × 30 sec dry; sterile drape; lidocaine infiltration (skin + deeper).", citationIDs: ["openrn_pr_round18"]),
            ProcedureStep(number: 3, title: "Insert spinal needle", body: "Advance midline at slight cephalad angle (toward umbilicus) bevel parallel to spinal fibers; pop through ligamentum flavum + dura → CSF return.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 4, title: "Opening pressure (older children)", body: "Attach manometer; lateral decubitus only; relax.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 5, title: "Collect CSF", body: "Collect 1–2 mL into each of 4 numbered tubes (less in neonates); observe clarity.", citationIDs: ["openrn_pr_round18"]),
            ProcedureStep(number: 6, title: "Intrathecal chemo (oncology)", body: "Pre-treat IV access; verify drug + dose with double-check; slow administration; monitor for arachnoiditis per primary source.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 7, title: "Removal + dressing", body: "Replace stylet (some prefer); withdraw needle; sterile dressing.", citationIDs: ["openrn_pr_round18"])
        ],
        postProcedure: [
            AttributedBullet("Continuous monitoring per facility; observe for respiratory compromise from positioning especially neonates.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Hydration; analgesia.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Send specimens — cell count + diff, glucose / protein, Gram stain + culture, special studies per indication; intrathecal chemo follow-up.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Counsel parents return for fever, severe headache, irritability, persistent drainage.", citationIDs: ["openrn_pr_round18"])
        ],
        documentation: [
            AttributedBullet("Indication, position, opening pressure (if obtained), CSF appearance, complications, sedation used, intrathecal drugs given.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Patient response + neurologic exam post-procedure.", citationIDs: ["openrn_pr_round18"])
        ],
        watchFor: [
            AttributedBullet("RESPIRATORY COMPROMISE — especially infants in flexed lateral position; release flexion if SpO2 drops.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("POST-LP HEADACHE — older children; positional; hydration + caffeine + analgesics; rare blood patch in adolescents.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("INTRATHECAL CHEMO ARACHNOIDITIS — hours after; back / leg pain, fever; supportive care.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("HEMATOMA / SPINAL EPIDURAL — back pain + neurologic deficit → MRI; coagulopathy correction emphasized.", citationIDs: ["openrn_pr_round18"])
        ],
        citations: [openrnPRR18, specialtyPRR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum GTubeCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "g-tube-care",
        title: "Gastrostomy tube (G-tube) care + management",
        subtitle: "PEG / surgical / button · daily care · feeding administration · troubleshooting",
        nclexTags: procTagsR18,
        indications: AttributedProse(
            "Long-term enteral nutrition for patients unable to safely take adequate PO — neurologic dysphagia (stroke, ALS, dementia, CP), head/neck cancer, severe failure to thrive in pediatrics, complex GI conditions per primary source.",
            citationIDs: ["specialty_pr_round18"]
        ),
        contraindications: AttributedProse(
            "Active peritonitis; severe ascites without drainage; coagulopathy uncorrected; impending death (consider goals of care); functional GI obstruction below tube level per primary source.",
            citationIDs: ["specialty_pr_round18"]
        ),
        equipment: [
            AttributedBullet("Gauze, mild soap + water OR saline, dry dressing supplies; barrier cream.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Catheter-tipped syringe (60 mL); enteral feeding pump or gravity bag; flush water.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Replacement low-profile button if dislodged.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("pH paper for tube placement verification (gastric pH <5.5 typical).", citationIDs: ["specialty_pr_round18"])
        ],
        preProcedure: [
            AttributedBullet("Verify tube placement before any feed — gastric aspirate pH <5.5 OR observe markings at skin level OR X-ray confirmation if doubt per primary source.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Patient education + caregiver training before discharge — daily site care, feeding, troubleshooting.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("HOB 30° during + 1 hour after feeds — aspiration prevention.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Wash hands; clean technique not sterile.", citationIDs: ["openrn_pr_round18"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Site care daily", body: "Clean stoma + tube with mild soap + water OR saline; rotate tube 360° (PEG only, NOT button); dry thoroughly; barrier cream around stoma; gauze dressing first 1–2 weeks then optional.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 2, title: "Verify placement before feeds", body: "Check gastric pH (<5.5 typical); check tube markings at skin (consistent with insertion length); aspirate gastric contents.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 3, title: "Pre-feed flush", body: "30 mL water flush; verify patency.", citationIDs: ["openrn_pr_round18"]),
            ProcedureStep(number: 4, title: "Administer feed", body: "Bolus (gravity or syringe) OR continuous via pump; rate per dietitian; monitor tolerance (residuals, distension, vomiting).", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 5, title: "Post-feed flush", body: "30 mL water flush; helps prevent clogging.", citationIDs: ["openrn_pr_round18"]),
            ProcedureStep(number: 6, title: "Medications", body: "Crush + dissolve tablets that allow; AVOID extended-release / enteric-coated; flush before + between + after each med per primary source.", citationIDs: ["specialty_pr_round18"]),
            ProcedureStep(number: 7, title: "Troubleshoot", body: "Clogged — warm water + gentle pressure; pancreatic enzymes (Viokase) + bicarbonate solution; do NOT use Coke / cranberry juice (acidic — worsens). Dislodged — replace within hours (stoma can close); call provider; never force.", citationIDs: ["specialty_pr_round18"])
        ],
        postProcedure: [
            AttributedBullet("HOB 30° during feed + 1 hour after.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Monitor feed tolerance — residuals, distension, vomiting, diarrhea, weight, hydration.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Skin assessment daily — granulation tissue (silver nitrate); leakage (tube fit); infection.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("Family education — home + emergency response.", citationIDs: ["openrn_pr_round18"])
        ],
        documentation: [
            AttributedBullet("Site condition, tube position, feed type + volume + tolerance, medications given, output.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("Education provided + return demonstration completed.", citationIDs: ["openrn_pr_round18"])
        ],
        watchFor: [
            AttributedBullet("DISLODGEMENT — fresh PEG <4 weeks → emergent surgical reinsertion (peritoneal contamination risk); mature stoma → replace within 4–6 hours before stoma narrows per primary source.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("BURIED BUMPER — internal bumper migrates into gastric wall; abdominal pain, leakage, feeding resistance; emergent endoscopic / surgical removal.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("PERISTOMAL INFECTION / cellulitis — local care + topical or systemic abx.", citationIDs: ["openrn_pr_round18"]),
            AttributedBullet("LEAKAGE — granulation, balloon underinflated, weight loss / fit issue; troubleshoot per primary source.", citationIDs: ["specialty_pr_round18"]),
            AttributedBullet("ASPIRATION — HOB elevation + feed tolerance + residual checks; high-risk patients consider J-tube (post-pyloric).", citationIDs: ["specialty_pr_round18"])
        ],
        citations: [openrnPRR18, specialtyPRR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum NeutropenicPrecautionsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "neutropenic-precautions",
        title: "Neutropenic precautions + febrile neutropenia",
        subtitle: "ANC <500 high-risk · prevention bundle · 1-hour empiric abx for fever",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: refTagsR18,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Severe neutropenia (ANC <500) — high infection risk. Prevention bundle minimizes pathogen exposure; febrile neutropenia (T ≥38.3°C OR sustained ≥38.0°C with ANC <500) is medical emergency requiring empiric antibiotics within 1 hour per primary source.",
                citationIDs: ["specialty_pr_round18"]
            )),
            .bullets(title: "Risk stratification (ANC = absolute neutrophil count)", [
                AttributedBullet("ANC 1000–1500 — mild risk; routine precautions.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("ANC 500–1000 — moderate risk; enhanced infection prevention.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("ANC <500 — SEVERE neutropenia; full neutropenic precautions.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("ANC <100 — PROFOUND; HSCT-level isolation considerations.", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Prevention bundle (private room — protective)", [
                AttributedBullet("Private room; positive-pressure / HEPA filtration for HSCT.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Strict hand hygiene by staff + visitors.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Mask for visitors / staff with respiratory symptoms; restrict ill visitors.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("No fresh flowers, fruits, or vegetables (raw); cooked foods only.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Daily skin care + oral hygiene (soft brush + alcohol-free rinses).", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Avoid invasive procedures unless necessary; minimize line / catheter days.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("AVOID rectal temperatures + suppositories + enemas (mucosal trauma).", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Antimicrobial prophylaxis", [
                AttributedBullet("Fluoroquinolone (levofloxacin / ciprofloxacin) for high-risk anticipated severe neutropenia >7 days per primary source.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("PJP prophylaxis (TMP-SMX) for chronic immunosuppression / steroid use.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Antifungal (fluconazole / posaconazole) for high-risk leukemia / HSCT.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Antiviral (acyclovir / valacyclovir) for HSV / VZV-seropositive HSCT.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Pneumococcal vaccination + influenza (inactivated) — coordinate with treatment timing.", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Febrile neutropenia management", [
                AttributedBullet("Definition — single oral T ≥38.3°C OR ≥38.0°C sustained ≥1 hour + ANC <500 (or expected drop) per primary source.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("EMERGENCY — empiric broad-spectrum antibiotics within 1 hour of recognition (do not wait for cultures) per primary source.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Cultures FIRST — blood (×2 sets including line + peripheral), urine, sputum, wound, stool — then start abx.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Empiric coverage — antipseudomonal β-lactam (cefepime, piperacillin-tazobactam, meropenem); add vancomycin if line / pneumonia / skin / soft-tissue / hemodynamic instability per primary source.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Hemodynamically unstable — pip-tazo + vanco + amikacin OR meropenem + vanco; ICU.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("MASCC score — risk-stratify outpatient vs inpatient; low-risk may receive oral abx + close follow-up per primary source.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Reassess at 48–72 hours — modify based on cultures + response; consider adding antifungal at day 4–7 if persistent fever.", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Patient + family education", [
                AttributedBullet("CALL FOR FEVER ≥38.0°C / 100.4°F (or symptoms — chills, sweats, malaise, sore throat, cough, urinary symptoms, diarrhea).", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Avoid crowds, sick contacts; mask in public.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Hand hygiene; oral care; skin care; perineal care after BMs.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("No raw foods (sushi, undercooked meat / eggs, unpasteurized dairy).", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Pet hygiene — wash hands after contact; avoid cleaning litter / bird cages.", citationIDs: ["specialty_pr_round18"])
            ])
        ],
        citations: [openrnPRR18, specialtyPRR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ChemoExtravasationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chemo-extravasation",
        title: "Chemotherapy extravasation management",
        subtitle: "Vesicant vs irritant · STOP infusion · agent-specific antidotes · plastic surgery if severe",
        eyebrow: "REFERENCE · ONCOLOGY SAFETY",
        nclexTags: refTagsR18,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Extravasation = inadvertent leakage of vesicant chemotherapy into surrounding tissue → tissue injury ranging from inflammation to necrosis requiring grafting / amputation. Prevention via central access + careful peripheral monitoring; recognition + agent-specific intervention preserves function per primary source.",
                citationIDs: ["specialty_pr_round18"]
            )),
            .keyValueTable(title: "Drug type · examples · risk", [
                KeyValueRow(key: "Vesicants — DNA-binding", value: "Doxorubicin, daunorubicin, idarubicin, mitomycin, dactinomycin (severe necrosis)"),
                KeyValueRow(key: "Vesicants — non-DNA-binding", value: "Vincristine, vinblastine, vinorelbine, paclitaxel, oxaliplatin, mechlorethamine"),
                KeyValueRow(key: "Irritants", value: "Bleomycin, cisplatin, carboplatin, etoposide, ifosfamide, fluorouracil, methotrexate (less severe than vesicants)"),
                KeyValueRow(key: "Non-irritant non-vesicant", value: "Asparaginase, bevacizumab, rituximab, cytarabine (low risk)")
            ]),
            .bullets(title: "Prevention", [
                AttributedBullet("Central venous access (port, PICC, tunneled CVC) preferred for VESICANTS.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("If peripheral, use NEW IV with reliable blood return; AVOID joints / hands / feet / arm with mastectomy.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Verify blood return + flush before + during infusion.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Continuous patient observation during vesicant infusion.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Slow IV push over established line with continuous saline drip.", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Recognition (STOP infusion immediately)", [
                AttributedBullet("Pain, burning, swelling, induration, redness at IV site.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Resistance to flow / loss of blood return.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Patient complaint of new sensation — ALWAYS take seriously.", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Initial response (universal)", [
                AttributedBullet("STOP infusion immediately; LEAVE catheter in place — use it to aspirate residual drug.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Aspirate as much drug as possible via the catheter.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Notify oncology / surgical team; mark area; photograph for tracking.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Elevate extremity; counsel patient.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Document — drug, time, estimated volume, intervention, photo.", citationIDs: ["specialty_pr_round18"])
            ]),
            .keyValueTable(title: "Agent-specific antidote · technique", [
                KeyValueRow(key: "Anthracyclines (doxorubicin, daunorubicin)", value: "DEXRAZOXANE IV × 3 days (start within 6 hr) PLUS cold compress 15 min QID × 3 days"),
                KeyValueRow(key: "Vinca alkaloids (vincristine, vinblastine)", value: "HYALURONIDASE 150–900 units in 1 mL NS, multiple SC injections around extravasation; WARM compress 20 min QID × 24–48 hr"),
                KeyValueRow(key: "Mechlorethamine, mitomycin", value: "SODIUM THIOSULFATE 2 mL of 1/6 M IV/SC infiltration into area"),
                KeyValueRow(key: "Oxaliplatin (cold-related)", value: "WARM compress 20 min QID × 1–2 days; AVOID cold (worsens neuropathy)"),
                KeyValueRow(key: "Paclitaxel", value: "Hyaluronidase + cold compress (alternating evidence)"),
                KeyValueRow(key: "Vesicant non-chemo (norepinephrine, dopamine, phenylephrine)", value: "PHENTOLAMINE 5–10 mg in 10 mL NS infiltrated SC around site within 12 hours"),
                KeyValueRow(key: "Vasopressin extravasation", value: "TERBUTALINE / PHENTOLAMINE per primary source"),
                KeyValueRow(key: "Calcium IV", value: "Hyaluronidase + warm compress")
            ]),
            .bullets(title: "Long-term management", [
                AttributedBullet("Plastic surgery / wound care consultation for vesicant extravasations.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Daily / serial photography to track progression / regression.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Surgical debridement / grafting if necrosis develops (typically 1–4 weeks post-extravasation).", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Document + report institutional incident reporting.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Patient education — cold/warm compress technique + signs to call.", citationIDs: ["openrn_pr_round18"])
            ])
        ],
        citations: [openrnPRR18, specialtyPRR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PediatricDevelopmentalMilestonesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pediatric-developmental-milestones",
        title: "Pediatric developmental milestones",
        subtitle: "CDC Learn the Signs · age-by-age + red flags · early referral",
        eyebrow: "REFERENCE · PEDIATRICS",
        nclexTags: refTagsR18,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Pediatric developmental milestones — gross motor, fine motor, language / cognitive, social-emotional. CDC \"Learn the Signs. Act Early.\" framework. Red flags warrant immediate evaluation; early intervention improves outcomes substantially per primary source.",
                citationIDs: ["specialty_pr_round18"]
            )),
            .keyValueTable(title: "2 months", [
                KeyValueRow(key: "Gross motor", value: "Holds head up briefly during tummy time; movements smoother"),
                KeyValueRow(key: "Fine motor", value: "Hands open or fisted; brings to mouth"),
                KeyValueRow(key: "Language", value: "Coos, gurgles, makes sounds beyond crying"),
                KeyValueRow(key: "Social", value: "Smiles when you talk; calms when picked up"),
                KeyValueRow(key: "Red flag", value: "Doesn't respond to loud sounds; doesn't watch faces; doesn't smile by 2 months")
            ]),
            .keyValueTable(title: "6 months", [
                KeyValueRow(key: "Gross motor", value: "Rolls both ways; sits with support; pushes up on arms during tummy time"),
                KeyValueRow(key: "Fine motor", value: "Reaches + grasps objects; transfers between hands; mouths objects"),
                KeyValueRow(key: "Language", value: "Babbles consonants (\"ba-ba-ba\"); responds to name"),
                KeyValueRow(key: "Social", value: "Recognizes familiar faces; shows curiosity"),
                KeyValueRow(key: "Red flag", value: "Doesn't laugh / squeal; doesn't reach for objects; persistent head lag; doesn't follow with eyes")
            ]),
            .keyValueTable(title: "12 months (1 year)", [
                KeyValueRow(key: "Gross motor", value: "Pulls to stand; cruises; some walk independently"),
                KeyValueRow(key: "Fine motor", value: "Pincer grasp; bangs objects together; releases objects intentionally"),
                KeyValueRow(key: "Language", value: "Says \"mama / dada\" + 1–2 other words; understands simple instructions"),
                KeyValueRow(key: "Social", value: "Plays peek-a-boo; waves bye-bye; separation anxiety"),
                KeyValueRow(key: "Red flag", value: "No babbling; doesn't point or wave; doesn't recognize own name; loss of skills")
            ]),
            .keyValueTable(title: "18 months", [
                KeyValueRow(key: "Gross motor", value: "Walks well; runs stiffly; climbs furniture"),
                KeyValueRow(key: "Fine motor", value: "Stacks 2–4 cubes; uses spoon imperfectly; scribbles"),
                KeyValueRow(key: "Language", value: "10–20 single words; points to body parts; 1-step commands"),
                KeyValueRow(key: "Social", value: "Pretend play emerges; parallel play; tantrums"),
                KeyValueRow(key: "Red flag", value: "<5 single words; doesn't point; no pretend play; M-CHAT-R/F screen at 18 + 24 months")
            ]),
            .keyValueTable(title: "2 years", [
                KeyValueRow(key: "Gross motor", value: "Runs well; jumps in place; climbs stairs holding rail"),
                KeyValueRow(key: "Fine motor", value: "Stacks 6 cubes; turns book pages; horizontal line stroke"),
                KeyValueRow(key: "Language", value: "2-word phrases; ~50-word vocabulary; follows 2-step commands"),
                KeyValueRow(key: "Social", value: "Begins to recognize emotions in others; plays alongside others"),
                KeyValueRow(key: "Red flag", value: "<25 words; no 2-word phrases; loss of skills; not interested in others")
            ]),
            .keyValueTable(title: "3 years", [
                KeyValueRow(key: "Gross motor", value: "Pedals tricycle; jumps with both feet; alternates feet on stairs"),
                KeyValueRow(key: "Fine motor", value: "Builds 9-cube tower; copies circle; threads beads; uses spoon well"),
                KeyValueRow(key: "Language", value: "3-word sentences; intelligible to strangers ~75%"),
                KeyValueRow(key: "Social", value: "Plays cooperatively with others; takes turns; shows affection"),
                KeyValueRow(key: "Red flag", value: "Speech mostly unintelligible to strangers; cannot stack 6 blocks; cannot copy a circle")
            ]),
            .keyValueTable(title: "4 years", [
                KeyValueRow(key: "Gross motor", value: "Hops on one foot; throws ball overhand; balances on one foot 2–3 sec"),
                KeyValueRow(key: "Fine motor", value: "Copies cross + square; draws person 3+ parts; uses scissors"),
                KeyValueRow(key: "Language", value: "Tells stories; understands counting + concept of time"),
                KeyValueRow(key: "Social", value: "Tells \"tall tales\"; cooperates with other kids; gender awareness"),
                KeyValueRow(key: "Red flag", value: "Cannot recall favorite story; unable to grasp \"same / different\"; cannot use \"me\" / \"you\" correctly")
            ]),
            .keyValueTable(title: "5 years", [
                KeyValueRow(key: "Gross motor", value: "Skips alternating feet; balances on one foot 10 sec; somersault"),
                KeyValueRow(key: "Fine motor", value: "Copies triangle; prints letters; uses utensils properly"),
                KeyValueRow(key: "Language", value: "Tells longer stories; counts to 10; rhymes"),
                KeyValueRow(key: "Social", value: "More agreement with rules; awareness of gender; complex play"),
                KeyValueRow(key: "Red flag", value: "Cannot brush teeth / dress with help; very withdrawn or aggressive; loss of acquired skills")
            ]),
            .bullets(title: "Surveillance + screening", [
                AttributedBullet("Developmental surveillance every well-child visit (AAP).", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Standardized screening 9, 18, 30 months (or 24).", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("M-CHAT-R/F autism screen 18 + 24 months.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Ages and Stages Questionnaire (ASQ-3) — caregiver-completed; widely used.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Hearing + vision screening at recommended ages.", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Early intervention pathway", [
                AttributedBullet("Refer for evaluation at any concern — no \"wait and see\".", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Birth – 3 years — Early Intervention (Part C IDEA).", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("3+ years — Special education preschool (Part B IDEA) + IEP.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Multidisciplinary — developmental pediatrician, SLP, OT, PT, audiology, ophthalmology, genetics as needed.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Family education + advocacy + connection to community resources.", citationIDs: ["openrn_pr_round18"])
            ])
        ],
        citations: [openrnPRR18, specialtyPRR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CancerScreeningBundleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cancer-screening-bundle",
        title: "Cancer screening bundle (USPSTF + ACS)",
        subtitle: "Breast · cervical · colorectal · lung · prostate · skin · age + risk-based",
        eyebrow: "REFERENCE · PRIMARY CARE",
        nclexTags: refTagsR18,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Cancer screening reduces mortality from common cancers when based on age + risk + life expectancy. USPSTF / ACS / NCCN guidelines align in most areas with some variation. Shared decision making + benefits / harms discussion central per primary source.",
                citationIDs: ["specialty_pr_round18"]
            )),
            .keyValueTable(title: "Breast cancer", [
                KeyValueRow(key: "USPSTF (2024)", value: "Mammography every 2 years for ages 40–74 (Grade B); individualize 75+"),
                KeyValueRow(key: "ACS", value: "Annual 45–54, then biennial; can start at 40 if patient prefers"),
                KeyValueRow(key: "High risk (BRCA, family hx, prior chest RT)", value: "Annual MRI + mammography starting age 30"),
                KeyValueRow(key: "Practical", value: "Counsel benefits (reduced mortality) + harms (false positives, overdiagnosis); shared decision")
            ]),
            .keyValueTable(title: "Cervical cancer", [
                KeyValueRow(key: "USPSTF / ACS", value: "Cytology every 3 years OR HPV every 5 years OR co-test every 5 years for ages 21–65"),
                KeyValueRow(key: "Updated ACS 2020", value: "Primary HPV every 5 years for ages 25–65 (preferred)"),
                KeyValueRow(key: "Stop screening", value: "Age >65 with adequate prior negative screens; total hysterectomy without history of CIN2+"),
                KeyValueRow(key: "HPV vaccination", value: "Routine ages 9–26; up to 45 with shared decision making")
            ]),
            .keyValueTable(title: "Colorectal cancer", [
                KeyValueRow(key: "USPSTF / ACS (2021)", value: "Begin screening at AGE 45 (lowered from 50)"),
                KeyValueRow(key: "Options", value: "Colonoscopy every 10 years, OR FIT annually, OR FIT-DNA (Cologuard) every 1–3 years, OR CT colonography every 5 years, OR sigmoidoscopy every 5 years"),
                KeyValueRow(key: "High risk (1st-degree relative + Lynch + IBD)", value: "Earlier age + more frequent + colonoscopy preferred"),
                KeyValueRow(key: "Stop", value: "Age >75 individualized; >85 generally not recommended")
            ]),
            .keyValueTable(title: "Lung cancer", [
                KeyValueRow(key: "USPSTF (2021)", value: "Annual low-dose CT for ages 50–80 with 20+ pack-year history + currently smoke or quit within 15 years"),
                KeyValueRow(key: "Shared decision", value: "Discuss benefits + harms; counsel smoking cessation alongside"),
                KeyValueRow(key: "Stop", value: "Quit ≥15 years OR >15-year life-limiting comorbidity OR unable / unwilling for curative therapy")
            ]),
            .keyValueTable(title: "Prostate cancer", [
                KeyValueRow(key: "USPSTF", value: "Individual decision PSA ages 55–69; do NOT screen ≥70 (Grade D)"),
                KeyValueRow(key: "ACS", value: "Discussion at age 50 (avg risk), 45 (Black + family hx), 40 (multiple family hx)"),
                KeyValueRow(key: "Approach", value: "Shared decision making; PSA ± DRE; biopsy decisions per urology / multiparametric MRI"),
                KeyValueRow(key: "Active surveillance", value: "Low-risk localized cancer often watchful")
            ]),
            .keyValueTable(title: "Skin cancer", [
                KeyValueRow(key: "USPSTF", value: "Insufficient evidence to recommend routine total-body skin exam in average risk"),
                KeyValueRow(key: "Targeted screening", value: "High-risk (fair skin, prior melanoma, family hx, immunosuppression, organ transplant) → annual dermatologist exam"),
                KeyValueRow(key: "Self-skin exam", value: "Monthly; ABCDE rule for melanoma — Asymmetry, Border, Color, Diameter, Evolution"),
                KeyValueRow(key: "Sun protection", value: "Counsel for all — primary prevention better than screening")
            ]),
            .bullets(title: "Cervical / breast / CRC catch-up considerations", [
                AttributedBullet("Address health-equity barriers — uninsured / underinsured + transportation + language + cultural beliefs.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Population-based outreach — patient navigators + reminders + mobile mammography vans + FIT mailings improve uptake.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Document screening status + due dates in EHR with reminders.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("Discuss benefits + harms (false positives, overdiagnosis, biopsy / surgical risks) — informed shared decision making.", citationIDs: ["specialty_pr_round18"])
            ]),
            .bullets(title: "Other cancers — selective", [
                AttributedBullet("OVARIAN — no screening recommended in average-risk; BRCA carriers consider risk-reducing surgery.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("PANCREATIC — no general screening; high-risk genetics (BRCA / Lynch / FAP) endoscopic ultrasound + MRI per primary source.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("GASTRIC — no general; family / Asian / H. pylori — endoscopy individualized.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("HEPATOCELLULAR (HCC) — semiannual ultrasound + AFP for cirrhosis + chronic HBV per primary source.", citationIDs: ["specialty_pr_round18"]),
                AttributedBullet("THYROID — no general; if suspicious neck mass / nodule found.", citationIDs: ["specialty_pr_round18"])
            ])
        ],
        citations: [openrnPRR18, specialtyPRR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}
