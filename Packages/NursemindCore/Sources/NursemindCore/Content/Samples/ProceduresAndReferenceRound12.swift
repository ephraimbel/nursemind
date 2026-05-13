import Foundation

// Curator-model procedure + reference entries (round 12 expansion).
// Sources: Open RN Skills + Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// CDC + ASCO + ONS + USPSTF + NCSBN concept citations.

private let openrnSkR12p = CitationSource(
    id: "openrn_skills_round12",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/?s=PA+catheter+CRRT+TPN",
    lastRetrieved: "2026-05-04"
)
private let openrnHar12 = CitationSource(
    id: "openrn_ha_round12_proc",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=cancer+staging+chemo+screening",
    lastRetrieved: "2026-05-04"
)
private let openstaxR12p = CitationSource(
    id: "openstax_round12_proc",
    shortName: "OpenStax Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/clinical-nursing-skills",
    lastRetrieved: "2026-05-04"
)
private let onsConceptR12 = CitationSource(
    id: "ons_round12",
    shortName: "ONS / ASCO chemotherapy administration safety standards (concept citation)",
    publisher: "Oncology Nursing Society · ASCO",
    license: .factCitationOnly,
    url: "https://www.ons.org/practice-resources/standards-and-guidelines",
    lastRetrieved: "2026-05-04"
)
private let nccnConceptR12 = CitationSource(
    id: "nccn_round12_ref",
    shortName: "NCCN cancer-staging + screening guidelines (concept citation)",
    publisher: "NCCN",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/",
    lastRetrieved: "2026-05-04"
)
private let ngnConceptR12 = CitationSource(
    id: "ngn_round12",
    shortName: "NCSBN Next Generation NCLEX item formats (concept citation)",
    publisher: "NCSBN",
    license: .factCitationOnly,
    url: "https://www.ncsbn.org/exams/next-generation-nclex.page",
    lastRetrieved: "2026-05-04"
)

private let safetyR12 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let perfusionProcR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)
private let renalProcR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes)
private let nutritionProcR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .nutrition)
private let oncRefR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let cancerScreenRefR12 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .cellularRegulation)
private let cjmmRefR12 = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety)

// MARK: - PA Catheter Management

public enum PACatheterSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pa-catheter-management",
        title: "Pulmonary artery (Swan-Ganz) catheter management",
        subtitle: "Right-heart hemodynamic monitoring · CO / PAP / PCWP · waveform identification",
        nclexTags: perfusionProcR12,
        indications: AttributedProse(
            "Hemodynamic monitoring in selected ICU patients — refractory shock when CVP / clinical assessment inadequate; pulmonary HTN evaluation; complex congenital heart; perioperative high-risk cardiac surgery. Use has DECREASED with non-invasive monitoring; current evidence does not show mortality benefit per primary source.",
            citationIDs: ["openrn_skills_round12", "openstax_round12_proc"]
        ),
        contraindications: AttributedProse(
            "Tricuspid / pulmonic valve mechanical prosthesis (catheter cannot pass); right-heart mass / thrombus; severe coagulopathy (correct first); LBBB (relative — risk of complete heart block during insertion); severe sepsis with profound thrombocytopenia.",
            citationIDs: ["openrn_skills_round12"]
        ),
        equipment: [
            AttributedBullet("Swan-Ganz catheter (typically 7.5 Fr); introducer (8.5 Fr) typically in IJ or subclavian; ±VIP (venous infusion port) for medications.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Pressure transducers + zeroed at phlebostatic axis (4th intercostal space, mid-axillary); flush bag (3 mL/hr), monitor with hemodynamic display.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Sterile attire for insertion; chlorhexidine; ultrasound guidance preferred.", citationIDs: ["openrn_skills_round12"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order; informed consent; coagulation status; CXR for baseline.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Cardiac monitoring; typically supine or slight Trendelenburg.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Zero transducers + level at phlebostatic axis BEFORE insertion.", citationIDs: ["openrn_skills_round12"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Provider insertion", body: "Provider places introducer (typically right IJ); inserts Swan through introducer; advances catheter while watching characteristic pressure waveform changes — RA → RV → PA → PCWP (wedge).", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 2, title: "Identify waveforms", body: "RA — low waves a/c/v ~0–8 mmHg; RV — sharp upstroke ~25/0 mmHg; PA — slight downstroke + dicrotic notch ~25/10 mmHg; PCWP — left-atrial-like waveform ~6–12 mmHg per primary source.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 3, title: "Wedge maneuver", body: "Inflate balloon (1.5 mL air) to wedge in pulmonary arteriole; record PCWP; deflate balloon immediately. Wedge for ≤15 sec only — risk pulmonary infarct / rupture per primary source.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 4, title: "Cardiac output measurement", body: "Thermodilution — inject 10 mL of 0–4°C NS into proximal port; computer calculates CO from temperature change at distal thermistor; average 3 measurements.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 5, title: "Calculate hemodynamics", body: "CI = CO/BSA (normal 2.5–4.0 L/min/m²); SVR = 80×(MAP−CVP)/CO (800–1200 dynes·s/cm⁵); PVR = 80×(MPAP−PCWP)/CO (<250 dynes·s/cm⁵).", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 6, title: "Post-insertion CXR", body: "Confirm catheter tip in main PA (NOT distal — risk infarct); rule out pneumothorax.", citationIDs: ["openrn_skills_round12"])
        ],
        postProcedure: [
            AttributedBullet("Continuous waveform monitoring; document hemodynamic values per protocol.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Sterile dressing changes; CLABSI prevention bundle.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Limit duration — typically remove within 72 hours per primary source.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Coordinate with provider for trends, fluid management, vasoactive drug titration based on hemodynamics.", citationIDs: ["openrn_skills_round12"])
        ],
        documentation: [
            AttributedBullet("Insertion site, depth at skin, baseline + serial hemodynamic values, dressing condition, complications, removal time.", citationIDs: ["openrn_skills_round12"])
        ],
        watchFor: [
            AttributedBullet("ARRHYTHMIA (RBBB, complete heart block) during insertion — usually transient; provider may withdraw or pause; have transcutaneous pacing ready.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("PULMONARY ARTERY RUPTURE — sudden hemoptysis + hemodynamic collapse; rare but fatal; balloon inflation should be brief and gentle per primary source.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("PULMONARY INFARCT — distal catheter tip migration + persistent wedge; IMMEDIATE deflation; pull back per primary source.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("CLABSI — line-related bloodstream infection; remove ASAP when hemodynamics no longer needed.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Air embolism, knotting, balloon rupture (rare).", citationIDs: ["openrn_skills_round12"])
        ],
        citations: [openrnSkR12p, openstaxR12p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CRRT Setup

public enum CRRTSetupSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "crrt-setup",
        title: "Continuous renal replacement therapy (CRRT) setup",
        subtitle: "CVVH / CVVHD / CVVHDF · slow continuous · hemodynamically unstable AKI",
        nclexTags: renalProcR12,
        indications: AttributedProse(
            "Acute kidney injury in hemodynamically UNSTABLE patients (intermittent hemodialysis poorly tolerated); fluid overload refractory to diuretics; severe electrolyte / acid-base derangement; toxin removal; hepatorenal syndrome per primary source.",
            citationIDs: ["openrn_skills_round12", "openstax_round12_proc"]
        ),
        contraindications: AttributedProse(
            "Inability to anticoagulate AND inability to use citrate (no alternative for circuit clotting prevention is rare); patient refusal; futility (goals-of-care discussion).",
            citationIDs: ["openrn_skills_round12"]
        ),
        equipment: [
            AttributedBullet("Dialysis catheter (large dual-lumen — internal jugular preferred over femoral, both over subclavian per primary source).", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("CRRT machine (e.g., PrismaFlex, NxStage); appropriate filter / cartridge.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Replacement fluids (HCO3-buffered or citrate); dialysate (per modality); anticoagulation (heparin, citrate, or none in selected cases).", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Warming device (significant fluid volume); strict I&O; specialized nursing trained per facility.", citationIDs: ["openrn_skills_round12"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider / nephrology order — modality (CVVH / CVVHD / CVVHDF), filtration / dialysate flow rates, anticoagulation, replacement-fluid composition, fluid removal goal per hour.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Verify catheter placement, patency; aspirate per facility protocol.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Baseline labs — BMP, ionized calcium (especially with citrate), magnesium, phosphorus, ABG.", citationIDs: ["openrn_skills_round12"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prime + connect", body: "Specialized CRRT-trained nurse primes circuit per machine instructions; connects to patient catheter; starts blood pump at low rate (50 mL/min) per primary source.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 2, title: "Initiate flow rates", body: "Typical CVVHDF — blood flow 150–250 mL/min; effluent dose 20–25 mL/kg/hr per primary source; titrate fluid removal per hemodynamic tolerance.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 3, title: "Anticoagulation", body: "REGIONAL CITRATE — added pre-filter; calcium replaced post-filter to patient (citrate binds Ca → prevents clotting in circuit only). HEPARIN — systemic anticoagulation; not used in active bleeding. None — high risk of circuit clotting per primary source.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 4, title: "Hourly assessment", body: "Hemodynamics + I&O + circuit pressures + ionized calcium (citrate ratio) every 4–6 hours; hold and adjust per protocol.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 5, title: "Trend labs", body: "BMP every 6–12 hours; ABG, ionized calcium, magnesium, phosphorus per protocol; replace electrolytes (especially phosphorus) per primary source.", citationIDs: ["openrn_skills_round12"])
        ],
        postProcedure: [
            AttributedBullet("Continuous monitoring; trend hemodynamics + electrolytes; coordinate medication doses with pharmacy (CRRT-specific dosing).", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Discontinuation when underlying AKI resolves OR transition to intermittent HD when stable enough.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Catheter care + line removal when no longer needed (CLABSI prevention).", citationIDs: ["openrn_skills_round12"])
        ],
        documentation: [
            AttributedBullet("Modality, flow rates, anticoagulation, fluid balance hourly + cumulative, circuit pressures, complications, lab trends, vital signs.", citationIDs: ["openrn_skills_round12"])
        ],
        watchFor: [
            AttributedBullet("HYPOTENSION during fluid removal — reduce removal rate; bolus fluid; vasopressor.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("CITRATE TOXICITY — accumulation in liver failure → hypocalcemia + metabolic alkalosis + elevated total Ca / ionized Ca ratio (>2.5); hold or reduce citrate per primary source.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("HEMORRHAGE on systemic heparin — assess; consider citrate or no anticoagulation.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("HYPOTHERMIA — circuit cools blood; warming required.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("CIRCUIT CLOTTING — common; if no anticoag, change circuit per protocol; may need increased anticoag.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("MEDICATION DOSING — CRRT clears many drugs differently than IHD; pharmacy CRRT-specific dosing critical.", citationIDs: ["openrn_skills_round12"])
        ],
        citations: [openrnSkR12p, openstaxR12p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - TPN Administration

public enum TPNSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "tpn-administration",
        title: "Total parenteral nutrition (TPN) administration",
        subtitle: "Central line · refeeding-syndrome risk · daily lab monitoring",
        nclexTags: nutritionProcR12,
        indications: AttributedProse(
            "Patients unable to use GI tract for nutrition for ≥7 days — bowel obstruction, severe Crohn's flare with fistula, short-gut syndrome, severe malnutrition before major surgery, prolonged critical illness with NPO status. Enteral nutrition is preferred whenever GI tract is functional per primary source.",
            citationIDs: ["openrn_skills_round12", "openstax_round12_proc"]
        ),
        contraindications: AttributedProse(
            "Functional GI tract (use enteral); short-term NPO (typically <7 days unless severely malnourished); patient refusal; futility / palliative-only care.",
            citationIDs: ["openrn_skills_round12"]
        ),
        equipment: [
            AttributedBullet("CENTRAL line (PICC, tunneled, or non-tunneled CVC) — TPN is hyperosmolar and damages peripheral veins; PPN can be peripheral but limited concentration.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("TPN bag (compounded by pharmacy with specific patient prescription — dextrose, amino acids, lipid, electrolytes, vitamins, trace elements).", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Infusion pump; in-line filter (1.2 micron for 3-in-1 with lipids; 0.22 micron for 2-in-1).", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Glucometer, lab tubes, dressing supplies.", citationIDs: ["openrn_skills_round12"])
        ],
        preProcedure: [
            AttributedBullet("Verify TPN order against pharmacy label — patient identifiers, components, concentration, rate, additives.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Verify central-line placement (CXR confirmation); patency of dedicated line / lumen for TPN.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Baseline labs — BMP, magnesium, phosphorus, ionized calcium, glucose, triglycerides, LFTs, prealbumin per primary source.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Identify refeeding-syndrome risk — chronic alcoholism, anorexia, prolonged starvation (>7 days), severely malnourished cancer patient per primary source.", citationIDs: ["openrn_skills_round12"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Hand hygiene + sterile technique", body: "Hub disinfection with chlorhexidine for 15 sec, allow to dry; CLABSI prevention bundle.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 2, title: "Connect to central line", body: "Connect TPN tubing to dedicated central-line lumen — DO NOT use TPN line for medications, blood draws, or pressure monitoring per primary source.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 3, title: "Start at low rate", body: "Initiate at 50% goal rate first 24 hours, then advance to goal — REDUCES refeeding syndrome and hyperglycemia per primary source.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 4, title: "Hang time", body: "Change TPN bag + tubing every 24 hours; lipids alone every 12 hours per primary source — bacterial growth risk.", citationIDs: ["openrn_skills_round12"]),
            ProcedureStep(number: 5, title: "Wean before stopping", body: "Taper rate over 1–2 hours before stopping to prevent rebound hypoglycemia; if abruptly stopped, give D10W at same rate per primary source.", citationIDs: ["openrn_skills_round12"])
        ],
        postProcedure: [
            AttributedBullet("Monitor glucose every 4–6 hours initially; every 6 hours stable; sliding scale insulin or insulin in TPN per primary source.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Daily BMP, Mg, phos, ionized Ca first week; weekly trace elements, prealbumin, LFTs, triglycerides.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Daily weights, strict I&O.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("Mouth care — TPN patients miss oral stimulation; dental hygiene; risk of parotitis.", citationIDs: ["openrn_skills_round12"])
        ],
        documentation: [
            AttributedBullet("TPN composition, rate, infusion time, glucose, weight, intake / output, line site, complications.", citationIDs: ["openrn_skills_round12"])
        ],
        watchFor: [
            AttributedBullet("REFEEDING SYNDROME — hypophosphatemia + hypokalemia + hypomagnesemia + thiamine deficiency in malnourished patients with rapid carbohydrate refeeding; risk of cardiac dysrhythmia + respiratory failure + cardiovascular collapse; START LOW, ADVANCE SLOW + replete electrolytes BEFORE initiation per primary source.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("HYPERGLYCEMIA — common; insulin in TPN or sliding scale; trend.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("HYPOGLYCEMIA — abrupt cessation; taper or use D10W.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("CLABSI — central-line bloodstream infection; STERILE technique; remove TPN line ASAP when EN possible.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("HEPATIC steatosis / cholestasis with prolonged TPN — cycle TPN if possible; transition to EN.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("AIR EMBOLISM — disconnect during normal respirations; clamp before disconnecting.", citationIDs: ["openrn_skills_round12"]),
            AttributedBullet("HYPERTRIGLYCERIDEMIA — pancreatitis risk; check triglycerides; reduce / hold lipids if >400 per primary source.", citationIDs: ["openrn_skills_round12"])
        ],
        citations: [openrnSkR12p, openstaxR12p],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - TNM Cancer Staging Reference

public enum TNMStagingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "tnm-staging",
        title: "TNM cancer staging overview",
        subtitle: "T (tumor) · N (nodes) · M (metastasis) · prognostic + treatment driver",
        eyebrow: "REFERENCE · ONCOLOGY",
        nclexTags: oncRefR12,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Most adult solid tumors are staged with the AJCC TNM (Tumor / Node / Metastasis) classification. Stage drives treatment and prognosis. Each tumor type has detailed criteria; this is a CONCEPT REFERENCE per primary source.",
                citationIDs: ["nccn_round12_ref"]
            )),
            .keyValueTable(title: "T — Primary tumor", [
                KeyValueRow(key: "TX", value: "Cannot be assessed"),
                KeyValueRow(key: "T0", value: "No evidence of primary tumor"),
                KeyValueRow(key: "Tis", value: "Carcinoma in situ — preinvasive"),
                KeyValueRow(key: "T1–T4", value: "Increasing tumor size and/or local extent (cancer-type specific definitions)")
            ]),
            .keyValueTable(title: "N — Regional nodes", [
                KeyValueRow(key: "NX", value: "Cannot be assessed"),
                KeyValueRow(key: "N0", value: "No regional lymph-node metastasis"),
                KeyValueRow(key: "N1–N3", value: "Increasing involvement of regional nodes")
            ]),
            .keyValueTable(title: "M — Distant metastasis", [
                KeyValueRow(key: "M0", value: "No distant metastasis"),
                KeyValueRow(key: "M1", value: "Distant metastasis present (often subcategorized M1a, M1b by site)")
            ]),
            .keyValueTable(title: "Stage groupings (general framework)", [
                KeyValueRow(key: "Stage I", value: "Small localized tumor, no nodes (T1–2 N0 M0)"),
                KeyValueRow(key: "Stage II", value: "Larger localized tumor or limited nodal involvement"),
                KeyValueRow(key: "Stage III", value: "Locally advanced, more nodal involvement"),
                KeyValueRow(key: "Stage IV", value: "Distant metastatic disease (any T, any N, M1)")
            ]),
            .keyValueTable(title: "Prefixes / suffixes", [
                KeyValueRow(key: "c — clinical stage", value: "Based on physical exam + imaging + biopsy BEFORE definitive treatment"),
                KeyValueRow(key: "p — pathologic stage", value: "Based on surgical specimen — typically the most accurate"),
                KeyValueRow(key: "y — post-treatment", value: "Used after neoadjuvant therapy (e.g., ypT2N0)"),
                KeyValueRow(key: "r — recurrent", value: "Restaging after recurrence"),
                KeyValueRow(key: "a — autopsy", value: "Stage at death")
            ]),
            .keyValueTable(title: "Other staging considerations", [
                KeyValueRow(key: "Grade (G1–G3 / G4)", value: "Histologic differentiation — well to poorly differentiated"),
                KeyValueRow(key: "Molecular markers", value: "ER/PR/HER2 (breast), KRAS/EGFR/ALK (NSCLC), MSI/dMMR (colorectal), etc. — increasingly INTEGRATED with TNM"),
                KeyValueRow(key: "Performance status (KPS / ECOG)", value: "Influences treatment selection"),
                KeyValueRow(key: "Disease-specific staging systems", value: "Lymphoma — Lugano (replacing Ann Arbor); HCC — BCLC; prostate — Gleason / Grade Group + risk groups")
            ]),
            .bullets(title: "Nursing implications of stage", [
                AttributedBullet("Patient understanding — stage anchors prognosis discussions; \"Stage IV\" usually means metastatic but not necessarily terminal.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Treatment intent — curative (early stage) vs disease control / palliative (later stage); guides shared decision-making.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Restaging — typically after neoadjuvant therapy, mid-treatment for response assessment, at completion, then surveillance imaging per protocol.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Survivorship — staging informs surveillance schedule and screening for late effects.", citationIDs: ["openrn_ha_round12_proc"])
            ])
        ],
        citations: [nccnConceptR12, openrnHar12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Chemotherapy Administration Safety

public enum ChemoSafetySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "chemo-administration-safety",
        title: "Chemotherapy administration safety",
        subtitle: "ONS / ASCO standards · PPE · vesicant management · double-check",
        eyebrow: "REFERENCE · ONCOLOGY NURSING",
        nclexTags: safetyR12,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "Hazardous-drug administration in oncology requires specialized training, double-checks, PPE, closed-system transfer devices, and protocols for spill response and extravasation. ONS / ASCO publish detailed safety standards. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["ons_round12"]
            )),
            .keyValueTable(title: "PPE for chemo administration", [
                KeyValueRow(key: "Chemo-rated double gloves", value: "ASTM F739-tested for permeation; INNER + OUTER glove; change every 30 min or after contact"),
                KeyValueRow(key: "Chemo gown", value: "Long-sleeved, closed-back, chemo-rated; single-use"),
                KeyValueRow(key: "Eye / face protection", value: "Splash shield or goggles for spill / aerosol risk"),
                KeyValueRow(key: "N95 / respirator", value: "For aerosolized agents (e.g., bleomycin pleurodesis, intracavitary chemo)"),
                KeyValueRow(key: "Closed-system transfer device (CSTD)", value: "Required for compounding + administration per primary source")
            ]),
            .keyValueTable(title: "Independent double-check (REQUIRED before administration)", [
                KeyValueRow(key: "Patient identification", value: "Two qualified clinicians verify two identifiers"),
                KeyValueRow(key: "Drug + dose + route + rate", value: "Both verify against current order; calculations including BSA / weight / cycle"),
                KeyValueRow(key: "Allergy / sensitivity", value: "Confirm allergy reconciliation"),
                KeyValueRow(key: "Cycle + day", value: "Confirm correct cycle, treatment day, prior-cycle response"),
                KeyValueRow(key: "Signed off", value: "Both clinicians document — required per primary source")
            ]),
            .keyValueTable(title: "Vesicant management", [
                KeyValueRow(key: "Definition", value: "Vesicant = causes severe tissue necrosis on extravasation (anthracyclines, vincristine, vinblastine, mechlorethamine)"),
                KeyValueRow(key: "Irritant", value: "Causes inflammation but not necrosis (cisplatin, carboplatin, etoposide)"),
                KeyValueRow(key: "Central line preferred", value: "Especially for vesicant continuous infusion"),
                KeyValueRow(key: "Peripheral administration", value: "Use LARGEST proximal vein, never wrist/hand for vesicants; verify free-flowing IV with blood return; SLOW push with periodic blood return checks"),
                KeyValueRow(key: "EXTRAVASATION protocol", value: "(1) STOP infusion immediately; (2) DO NOT remove needle/catheter (aspirate residual); (3) Cold or warm compress per agent (cold for anthracycline / mechlorethamine; warm for vinca / oxaliplatin); (4) ANTIDOTE per agent (dexrazoxane for anthracycline, hyaluronidase for vinca); (5) Notify provider, photograph, document; (6) Plastic-surgery consult for severe per primary source")
            ]),
            .keyValueTable(title: "Spill response", [
                KeyValueRow(key: "Spill kit available", value: "Chemo spill kit on every chemo unit and pharmacy"),
                KeyValueRow(key: "Small spill (<5 mL)", value: "Don PPE; cover with absorbent pad; clean from outside in; double-bag in cytotoxic waste; document"),
                KeyValueRow(key: "Large spill", value: "Restrict area; activate institutional hazmat protocol; PPE including respirator; specialized cleanup"),
                KeyValueRow(key: "Skin / eye exposure", value: "Skin — wash with soap + water 15 min; eye — irrigate with saline / water 15 min + emergent ophthalmology")
            ]),
            .keyValueTable(title: "Patient + family education", [
                KeyValueRow(key: "Body fluids hazardous", value: "Urine / stool / vomit / sweat / blood may contain chemo for 48 hours; wear gloves to clean; double-flush toilet; wash linens separately"),
                KeyValueRow(key: "Caregiver pregnancy", value: "Pregnant caregivers should not handle body fluids during this window"),
                KeyValueRow(key: "Contraception", value: "Patient + partner should use effective contraception during and for months-years after (drug-specific)"),
                KeyValueRow(key: "Sick-day rules", value: "Fever > 38°C / 100.4°F = call or go to ED; do NOT take antipyretic without provider input; central-line care; oral care for mucositis prevention")
            ]),
            .bullets(title: "Universal nursing actions", [
                AttributedBullet("Verify chemotherapy training + competency annually per ONS standard per primary source.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Use closed-system transfer device for ALL hazardous-drug compounding + administration.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("NEVER administer chemotherapy without independent double-check.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Anticipate antiemetic + supportive care premedications PRIOR to start.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Document baseline + ongoing toxicity per CTCAE grading; coordinate with oncology for dose modification.", citationIDs: ["openrn_ha_round12_proc"])
            ])
        ],
        citations: [onsConceptR12, openrnHar12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NGN Item Examples

public enum NGNItemsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ngn-item-examples",
        title: "Next Generation NCLEX (NGN) item formats",
        subtitle: "Bowtie · matrix · cloze · trend · highlight · prep framework",
        eyebrow: "REFERENCE · NCLEX",
        nclexTags: cjmmRefR12,
        sections: [
            .prose(title: "Framework", AttributedProse(
                "The Next-Generation NCLEX (NGN) launched April 2023 introduces case-study items that test the NCSBN Clinical Judgment Measurement Model (CJMM). Items are graded with partial credit. Approximately 10–15% of NCLEX questions are NGN format. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["ngn_round12"]
            )),
            .keyValueTable(title: "Bow-tie item", [
                KeyValueRow(key: "Format", value: "Center action box (1–2 highest-priority interventions); left side — 2 conditions / cues that explain WHY; right side — 2 anticipated outcomes / parameters to monitor"),
                KeyValueRow(key: "Tests CJMM steps", value: "Recognize cues + analyze + take action + evaluate"),
                KeyValueRow(key: "Strategy", value: "Identify the priority action FIRST (\"what would the nurse do FIRST?\"); then explain WHY; then EVALUATE response. Worst-first; safety-first; ABCs.")
            ]),
            .keyValueTable(title: "Matrix multiple-response", [
                KeyValueRow(key: "Format", value: "Grid — rows of patient findings × columns of categories (e.g., \"Indicates worsening / Indicates improvement / Unrelated\")"),
                KeyValueRow(key: "Tests CJMM steps", value: "Analyze cues + evaluate outcomes"),
                KeyValueRow(key: "Strategy", value: "Each row scored separately; partial credit; READ each finding fresh; do not assume column patterns")
            ]),
            .keyValueTable(title: "Cloze (drop-down)", [
                KeyValueRow(key: "Format", value: "Sentence with one or more drop-down options; nurse selects best option in each blank"),
                KeyValueRow(key: "Tests CJMM steps", value: "Prioritize hypothesis + generate solutions"),
                KeyValueRow(key: "Strategy", value: "Read full sentence with each option to verify the answer makes sense in context; complete one drop-down at a time")
            ]),
            .keyValueTable(title: "Trend (highlight)", [
                KeyValueRow(key: "Format", value: "Sequential vital signs, lab values, or assessments; nurse highlights or selects the changes that warrant intervention OR shows worsening"),
                KeyValueRow(key: "Tests CJMM steps", value: "Recognize cues + evaluate outcomes"),
                KeyValueRow(key: "Strategy", value: "Compare to BASELINE / earlier value; flag concerning trends; ignore stable values")
            ]),
            .keyValueTable(title: "Drag-and-drop (rank order)", [
                KeyValueRow(key: "Format", value: "List of actions; arrange in correct order (priority sequence or steps of a procedure)"),
                KeyValueRow(key: "Tests CJMM steps", value: "Take action — sequence matters"),
                KeyValueRow(key: "Strategy", value: "Identify what comes FIRST (safety / ABCs / time-critical) and what comes LAST (chart / educate); fill middle with logical clinical sequence")
            ]),
            .keyValueTable(title: "Extended multiple response (select all that apply)", [
                KeyValueRow(key: "Format", value: "Multiple correct answers possible; partial credit"),
                KeyValueRow(key: "Tests CJMM steps", value: "Analyze cues + generate solutions + take action"),
                KeyValueRow(key: "Strategy", value: "Treat each option as TRUE / FALSE independently; resist the urge to pick a fixed number")
            ]),
            .keyValueTable(title: "Highlight in text", [
                KeyValueRow(key: "Format", value: "Case-study text; nurse highlights phrases / sentences containing relevant cues or risk factors"),
                KeyValueRow(key: "Tests CJMM steps", value: "Recognize cues"),
                KeyValueRow(key: "Strategy", value: "Highlight ABNORMAL findings, time-sensitive concerns, risk factors; ignore baseline / unrelated information")
            ]),
            .bullets(title: "Universal NGN preparation tips", [
                AttributedBullet("MASTER the CJMM 6 steps — Recognize cues → Analyze → Prioritize hypothesis → Generate solutions → Take action → Evaluate outcomes.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Practice case-study format — read full case before answering individual items; cases share scenario across items.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Use SAFETY / ABCs / Maslow framework for prioritization questions.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Watch for ACUTE vs CHRONIC, STABLE vs UNSTABLE, EXPECTED vs UNEXPECTED in trend / matrix items.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Review ATI / Kaplan / NCSBN sample NGN items; partial credit means even imperfect answers can earn points.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Don't overthink — NGN tests application of safe, evidence-based nursing care; trust your training.", citationIDs: ["openrn_ha_round12_proc"])
            ])
        ],
        citations: [ngnConceptR12, openrnHar12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cancer Screening Summary

public enum CancerScreeningSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cancer-screening-summary",
        title: "Adult cancer screening summary (USPSTF / ACS)",
        subtitle: "Major cancers · age + interval + modality · concept reference",
        eyebrow: "REFERENCE · PREVENTIVE",
        nclexTags: cancerScreenRefR12,
        sections: [
            .prose(title: "Source + scope", AttributedProse(
                "USPSTF, ACS, and specialty societies (NCCN, ACOG) issue cancer-screening recommendations. Differences exist; verify the most current published recommendation. THIS IS A CONCEPT REFERENCE per primary source.",
                citationIDs: ["nccn_round12_ref"]
            )),
            .keyValueTable(title: "Breast cancer (USPSTF 2024 + ACS)", [
                KeyValueRow(key: "USPSTF — average risk", value: "Biennial mammography age 40–74"),
                KeyValueRow(key: "ACS — average risk", value: "Optional annual age 40–44; annual 45–54; biennial or annual 55+"),
                KeyValueRow(key: "BRCA1/2 carriers", value: "Annual mammogram + MRI starting age 25–30 per primary source")
            ]),
            .keyValueTable(title: "Cervical cancer (USPSTF + ACS)", [
                KeyValueRow(key: "USPSTF — 21–29", value: "Cytology every 3 years"),
                KeyValueRow(key: "USPSTF — 30–65", value: "ANY of: cytology q3 yr, hrHPV q5 yr, or co-test q5 yr"),
                KeyValueRow(key: "ACS 2020 — 25–65", value: "Primary HPV q5 yr preferred; alternatives same as USPSTF"),
                KeyValueRow(key: "Discontinue", value: ">65 with adequate prior negative screening; or hysterectomy + cervix removed for benign reason")
            ]),
            .keyValueTable(title: "Colorectal cancer (USPSTF + ACS)", [
                KeyValueRow(key: "Average risk start", value: "Age 45 (lowered from 50)"),
                KeyValueRow(key: "Stop", value: "75 (individualize 75–85; stop >85)"),
                KeyValueRow(key: "Modalities", value: "Colonoscopy q10 yr; FIT annually; FIT-DNA / Cologuard q1–3 yr; CT colonography q5 yr; flexible sigmoidoscopy q5 yr (± FIT q1 yr)"),
                KeyValueRow(key: "High-risk (Lynch / FAP / IBD)", value: "Earlier and more frequent screening per primary source")
            ]),
            .keyValueTable(title: "Lung cancer (USPSTF)", [
                KeyValueRow(key: "Annual low-dose chest CT", value: "Adults 50–80 with ≥20 pack-year smoking history who currently smoke OR quit within 15 years per primary source"),
                KeyValueRow(key: "Stop", value: "When 15 yr since quitting OR life expectancy <10 yr OR unwilling to undergo curative-intent treatment")
            ]),
            .keyValueTable(title: "Prostate cancer (USPSTF + ACS)", [
                KeyValueRow(key: "USPSTF 55–69", value: "Shared decision-making; not routine"),
                KeyValueRow(key: "USPSTF >70", value: "Discourage screening"),
                KeyValueRow(key: "Higher-risk (Black men, BRCA, family history)", value: "Discussion may begin earlier (40–45) per primary source")
            ]),
            .keyValueTable(title: "Skin cancer (USPSTF)", [
                KeyValueRow(key: "Population screening", value: "Insufficient evidence per USPSTF"),
                KeyValueRow(key: "Higher risk", value: "Periodic skin self-exams; full skin exam by dermatology in fair-skinned, family history, prior skin cancer, or chronic immunosuppression per primary source")
            ]),
            .keyValueTable(title: "Other cancers", [
                KeyValueRow(key: "HCC (cirrhotic patients)", value: "AFP + abdominal US every 6 months per AASLD"),
                KeyValueRow(key: "Cervical / endometrial cancer in Lynch syndrome", value: "Annual surveillance starting age 30–35 per NCCN"),
                KeyValueRow(key: "Pancreatic cancer (BRCA, familial)", value: "Annual MRI / EUS in selected high-risk; individualize per NCCN"),
                KeyValueRow(key: "Routine ovarian / pancreatic / testicular screening", value: "NOT recommended in average-risk population per USPSTF")
            ]),
            .bullets(title: "Nursing actions", [
                AttributedBullet("Verify last-screening date at every health-maintenance visit; update CDC / state cancer-registry data per requirements.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Counsel patient about benefits AND limitations (false positives, overdiagnosis); shared decision-making preferred for borderline cases.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Coordinate FIT distribution + return for colorectal screening; mammogram + Pap referrals.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("Address barriers — transportation, cost, language; many community programs offer free / low-cost screening.", citationIDs: ["openrn_ha_round12_proc"]),
                AttributedBullet("HIGH-RISK family history — refer for genetic counseling; family screening cascade per primary source.", citationIDs: ["openrn_ha_round12_proc"])
            ])
        ],
        citations: [nccnConceptR12, openrnHar12],
        lastSourceFidelityReview: "2026-05-04"
    )
}
