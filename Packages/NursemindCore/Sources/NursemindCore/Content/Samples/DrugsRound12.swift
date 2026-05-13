import Foundation

// Curator-model drug entries (round 12 expansion — chemotherapy, immunotherapy, biologics, GI/hepatic).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC + ASCO + ONS + AGA concept citations.

private let openfda = CitationSource(
    id: "openfda_round12",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR12 = CitationSource(
    id: "openrn_pharm_round12",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=chemotherapy+immunotherapy+IBD",
    lastRetrieved: "2026-05-04"
)
private let cdcR12 = CitationSource(
    id: "cdc_round12",
    shortName: "CDC HBV reactivation + HBV antiviral guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/hepatitis/hbv/index.html",
    lastRetrieved: "2026-05-04"
)
private let specialtyR12 = CitationSource(
    id: "specialty_round12",
    shortName: "ASCO / ONS / AGA / NCCN concept citations",
    publisher: "ASCO · ONS · AGA · NCCN",
    license: .factCitationOnly,
    url: "https://www.asco.org/practice-policy/cancer-care-initiatives/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

// MARK: - Cisplatin

public enum CisplatinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cisplatin",
        title: "Cisplatin",
        subtitle: "Platinol · platinum-based alkylating chemotherapy · multiple solid tumors",
        category: "Platinum-based chemotherapy",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Platinum chemotherapy (alkylating-like crosslinking)"),
            KeyValueRow(key: "Tumors", value: "Testicular (curative), ovarian, bladder, lung (NSCLC + SCLC), head/neck, esophageal, gastric, cervical"),
            KeyValueRow(key: "Toxicity profile", value: "Severe N/V, NEPHROTOXICITY, ototoxicity, neurotoxicity, myelosuppression"),
            KeyValueRow(key: "Critical pre-treatment", value: "Aggressive IV hydration + mannitol or furosemide; pre-medicate with potent antiemetics (5-HT3 + dexamethasone + NK1)")
        ],
        indications: AttributedProse(
            "Testicular cancer (curative as part of BEP), ovarian, bladder, NSCLC and SCLC, head/neck (often with radiation), esophageal, gastric, cervical, others per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Forms inter- and intra-strand DNA crosslinks → blocks DNA replication and transcription → apoptosis. Active in non-dividing as well as dividing cells.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Common ranges", body: "20–100 mg/m² IV per cycle (varies by regimen and tumor); always per oncology protocol per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Pre-existing renal impairment (CrCl <60 typically); myelosuppression; hearing impairment; previous severe hypersensitivity to platinum; pregnancy; hypersensitivity per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("BOXED — cumulative dose-related nephrotoxicity (ATN); aggressive hydration MANDATORY (typically 1–2 L IV NS pre + post per primary source).", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — high-frequency hearing loss + tinnitus; cumulative; baseline + serial audiology in pediatrics and prolonged courses per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — severe acute and delayed nausea / vomiting; high-emetogenic regimen; aggressive antiemetic prophylaxis required.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Peripheral neuropathy (cumulative dose).", citationIDs: ["openfda_round12"]),
            AttributedBullet("Hypomagnesemia + hypocalcemia + hypokalemia → tetany / dysrhythmia; replete during and after cycle.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Anaphylaxis — usually after multiple cycles; have epi / steroids / diphenhydramine ready.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Secondary malignancy (acute leukemia) — long-term concern.", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Severe N/V, AKI, ototoxicity, peripheral neuropathy, myelosuppression (less than other agents), electrolyte wasting, alopecia.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Aminoglycosides + loop diuretics — additive nephrotoxicity / ototoxicity.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Phenytoin — cisplatin reduces phenytoin levels.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Live vaccines — AVOID during and for months after.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY hydration order — typically 1–2 L IV NS pre + post-infusion; monitor strict I&O; watch for >100 mL/hr UOP per protocol.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Premedicate with 5-HT3 antagonist + dexamethasone + NK1 antagonist (e.g., aprepitant) per ONS/ASCO antiemetic guidelines per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Trend creatinine, K, Mg, Ca, hearing; replete electrolytes.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Use central line; assess for extravasation though cisplatin is not a strong vesicant; closed-system transfer device + chemo PPE per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel patient about delayed nausea (peaks day 2–3) — continue scheduled antiemetics at home per primary source.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "You will need IV fluids before and after each treatment to protect your kidneys. Take your nausea medications on schedule — even when you don't feel sick — for several days. Tell us about ringing in your ears, decreased hearing, numbness or tingling in fingers / toes, decreased urination, or muscle cramps. Do not become pregnant during treatment or for several months after; use reliable contraception.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Doxorubicin

public enum DoxorubicinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "doxorubicin",
        title: "Doxorubicin",
        subtitle: "Adriamycin · anthracycline · breast / lymphoma / sarcoma · cardiotoxicity",
        category: "Anthracycline chemotherapy",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anthracycline antitumor antibiotic"),
            KeyValueRow(key: "Tumors", value: "Breast cancer (AC, AC-T), Hodgkin (ABVD), non-Hodgkin (CHOP), sarcoma, leukemia, others"),
            KeyValueRow(key: "Boxed warnings", value: "Cardiotoxicity (cumulative-dose limit 450–550 mg/m²); severe vesicant — extravasation = tissue necrosis; secondary leukemia"),
            KeyValueRow(key: "Notable", value: "Red-orange urine for 24–48 hours (harmless but informs patient)")
        ],
        indications: AttributedProse(
            "Breast cancer, Hodgkin / non-Hodgkin lymphoma, soft-tissue and bone sarcoma, acute lymphoblastic and myeloblastic leukemia, Wilms tumor, neuroblastoma, ovarian, gastric, thyroid, bladder per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Topoisomerase II inhibition + DNA intercalation + free-radical generation → DNA strand breaks → apoptosis.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Per regimen", body: "60–75 mg/m² IV every 21 days; cumulative-dose limit 450–550 mg/m² per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment; pre-existing severe cardiomyopathy / HF (LVEF <30); recent MI; previous full cumulative anthracycline dose; pregnancy; hypersensitivity per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("BOXED — CARDIOTOXICITY — cumulative-dose-dependent dilated cardiomyopathy; baseline + serial echocardiogram (LVEF); STOP if LVEF falls below threshold per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — severe MYELOSUPPRESSION; nadir 10–14 days; CBC monitoring.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — extravasation = severe tissue necrosis; CENTRAL LINE preferred; if extravasation, STOP, aspirate, apply COLD, use dexrazoxane antidote per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — secondary acute leukemia (AML) months-years after treatment.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Severe N/V (less than cisplatin); alopecia (universal); mucositis.", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Myelosuppression, alopecia, mucositis, N/V, RED-ORANGE urine (24–48 hr), cardiotoxicity (acute + chronic), tissue necrosis with extravasation.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Trastuzumab — additive cardiotoxicity; sequencing critical.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Other cardiotoxic chemo (anthracyclines, mitoxantrone) — cumulative.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + serial LVEF (echo or MUGA); follow institutional cardiotoxicity protocol per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("CENTRAL LINE preferred; verify patency before each push; never give in anything but rapidly-flowing IV.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel about red-orange urine, alopecia, mucositis prevention (oral care + ice chips during infusion in some regimens).", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Dexrazoxane (Zinecard) cardioprotection in metastatic breast cancer at high cumulative doses per primary source.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "Your urine will be red-orange for 1–2 days after treatment — this is harmless. Hair loss is expected. Use a soft toothbrush; rinse mouth with salt water; report mouth sores. Tell us about new shortness of breath, swelling, fatigue, fast heartbeat — these can be heart symptoms. Get echocardiograms as scheduled. Use reliable contraception.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Paclitaxel

public enum PaclitaxelSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "paclitaxel",
        title: "Paclitaxel",
        subtitle: "Taxol · taxane · breast / ovarian / lung / many · severe hypersensitivity prophylaxis",
        category: "Taxane chemotherapy",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Microtubule-stabilizing taxane"),
            KeyValueRow(key: "Tumors", value: "Breast, ovarian, NSCLC, head/neck, Kaposi sarcoma"),
            KeyValueRow(key: "Hypersensitivity", value: "From Cremophor vehicle — DEXAMETHASONE + DIPHENHYDRAMINE + H2-blocker premedication MANDATORY per primary source"),
            KeyValueRow(key: "Notable", value: "nab-paclitaxel (Abraxane) — albumin-bound; no Cremophor; less hypersensitivity")
        ],
        indications: AttributedProse(
            "Breast (adjuvant + metastatic), ovarian (first-line + recurrent), NSCLC (often with carboplatin), head and neck, AIDS-related Kaposi sarcoma per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Binds and stabilizes microtubules → prevents disassembly → mitotic arrest → apoptosis.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "175 mg/m² IV every 21 days OR 80 mg/m² weekly per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to paclitaxel or polyoxyethylated castor oil (Cremophor); baseline neutrophil count <1500; pregnancy per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("BOXED — severe hypersensitivity reactions during infusion (anaphylaxis, hypotension, bronchospasm) — MANDATORY premedication: dexamethasone, diphenhydramine, H2 blocker per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — myelosuppression (neutropenia is dose-limiting); CBC; defer if neutropenic.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Peripheral neuropathy — cumulative; dose modification.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Cardiotoxicity (less than anthracyclines); arrhythmias.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Alopecia (universal).", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Myelosuppression, alopecia, peripheral neuropathy, myalgia / arthralgia (transient post-infusion), hypersensitivity reaction.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors / inducers — significantly affect levels.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Cisplatin — sequencing matters (paclitaxel after cisplatin → more myelosuppression).", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Verify dexamethasone + diphenhydramine + H2 blocker premedication completed per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Slow infusion start (1–3 hours) with frequent vital signs — most reactions in first 10 minutes.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Use NON-PVC tubing + 0.22-micron filter — Cremophor leaches plasticizers per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel about myalgia / arthralgia 2–3 days post-infusion; supportive analgesia; recovery typically 5–7 days.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Cold cap / scalp cooling can reduce alopecia severity per primary source.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "You will get pre-medications before the infusion to prevent reactions. Tell us right away about itching, flushing, chest tightness, or shortness of breath during the infusion. Hair loss is expected; some centers offer scalp cooling. You may have body aches for a few days after — it goes away. Report numbness or tingling in hands or feet.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Trastuzumab

public enum TrastuzumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "trastuzumab",
        title: "Trastuzumab",
        subtitle: "Herceptin · anti-HER2 monoclonal antibody · HER2+ breast + gastric cancer",
        category: "HER2-directed monoclonal antibody",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-HER2 (ERBB2) humanized monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "HER2-positive breast cancer (adjuvant + metastatic); HER2-positive gastric cancer"),
            KeyValueRow(key: "Boxed warnings", value: "Cardiomyopathy + pulmonary toxicity + embryofetal toxicity"),
            KeyValueRow(key: "Notable", value: "Cardiotoxicity may be reversible (vs anthracyclines) but additive with doxorubicin")
        ],
        indications: AttributedProse(
            "HER2-overexpressing breast cancer — adjuvant therapy after primary treatment AND first-line metastatic; HER2-overexpressing metastatic gastric / GE-junction adenocarcinoma per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Binds extracellular domain of HER2 → blocks downstream signaling + induces antibody-dependent cellular cytotoxicity (ADCC).",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Breast cancer (IV)", body: "Loading 4 mg/kg IV; then 2 mg/kg IV weekly OR 6 mg/kg every 3 weeks per primary source.", citationIDs: ["openfda_round12"]),
            DosingBlock(label: "SQ formulation (Herceptin Hylecta)", body: "600 mg SQ every 3 weeks per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to trastuzumab or excipients; pregnancy (boxed embryofetal toxicity); pre-existing severe cardiomyopathy per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("BOXED — cardiomyopathy / HF; baseline + every 3-month echo / MUGA during therapy; HOLD if LVEF falls per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — pulmonary toxicity (interstitial pneumonitis, ARDS) — STOP if dyspnea / hypoxia.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — embryofetal toxicity; use contraception during + 7 months after per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Infusion reactions — fever / chills / dyspnea / hypotension during first infusion.", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Infusion reactions, fatigue, headache, GI upset, decreased LVEF, anemia, neutropenia, infection.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Anthracyclines — additive cardiotoxicity; sequence carefully (do not concurrently).", citationIDs: ["openfda_round12"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline LVEF (echo or MUGA); recheck every 3 months per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Observe FIRST infusion 90 minutes; subsequent 30 minutes if tolerated per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel about contraception during + 7 months after; assess pregnancy plans.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Educate about HF symptoms — new dyspnea, edema, weight gain — REPORT immediately.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "This medicine targets HER2-positive cancer cells. Tell us right away about new shortness of breath, leg swelling, weight gain (>2 lb in a day), or unusual fatigue — heart side effects can occur. Get heart scans as scheduled. Use reliable birth control during and for 7 months after.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bevacizumab

public enum BevacizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bevacizumab",
        title: "Bevacizumab",
        subtitle: "Avastin · anti-VEGF monoclonal antibody · multiple solid tumors",
        category: "Anti-angiogenic monoclonal antibody",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-VEGF humanized monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "Metastatic colorectal, NSCLC, glioblastoma, RCC, cervical, ovarian, hepatocellular cancer; macular degeneration (off-label)"),
            KeyValueRow(key: "Boxed warnings", value: "GI perforation, surgical / wound healing complications, severe hemorrhage"),
            KeyValueRow(key: "Notable", value: "HOLD ≥28 days before / after major surgery to allow wound healing")
        ],
        indications: AttributedProse(
            "Metastatic colorectal, NSCLC, glioblastoma, metastatic RCC, persistent/recurrent/metastatic cervical, ovarian (with chemo), HCC; off-label intravitreal for AMD, diabetic macular edema per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Binds vascular endothelial growth factor (VEGF-A) → blocks tumor angiogenesis → starves tumor of new blood vessels.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Per regimen", body: "5–15 mg/kg IV every 2–3 weeks; varies by tumor and combination per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Recent surgery (within 28 days); active bleeding; bowel perforation; severe HTN; hypersensitivity per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("BOXED — GI perforation (1–4%) — abdominal pain, peritonitis; surgical emergency per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — surgery / wound healing complications; HOLD ≥28 days pre/post surgery per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — severe / fatal hemorrhage (especially pulmonary in lung cancer); avoid in squamous-cell NSCLC; avoid in patients with hemoptysis.", citationIDs: ["openfda_round12"]),
            AttributedBullet("HTN — control before and during therapy; STOP if hypertensive crisis.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Proteinuria / nephrotic syndrome; thromboembolic events (arterial > venous); reversible posterior leukoencephalopathy syndrome (PRES).", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "HTN, proteinuria, fatigue, GI upset, epistaxis, headache, infusion reactions, impaired wound healing.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Sunitinib + bevacizumab — increased bleeding / microangiopathy.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Anticoagulants — increased bleeding; coordinate carefully.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + ongoing BP — control before initiation; trend during therapy.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Urine dipstick or quantitative protein at baseline + before each cycle; HOLD for ≥3+ proteinuria; confirm 24-h urine protein <2 g per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Verify ≥28-day wound-healing window before / after surgery — coordinate with oncology and surgical teams per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel patient — abdominal pain, severe headache, vision changes, bleeding (any site) require immediate evaluation.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "Tell us about severe abdominal pain, severe headache, vision changes, leg pain or swelling, chest pain, or any unusual bleeding. Take blood pressure at home if asked. If you need surgery (including dental procedures), tell us — this medicine needs to be held for several weeks.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pembrolizumab

public enum PembrolizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pembrolizumab",
        title: "Pembrolizumab",
        subtitle: "Keytruda · PD-1 checkpoint inhibitor · broad cancer indications · IRAEs",
        category: "PD-1 checkpoint inhibitor (immunotherapy)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-PD-1 humanized monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "Melanoma, NSCLC, head/neck, urothelial, RCC, MSI-H/dMMR colorectal, gastric, esophageal, cervical, hepatocellular, others — single-agent or combination"),
            KeyValueRow(key: "Notable", value: "IMMUNE-RELATED ADVERSE EVENTS (IRAEs) — colitis / pneumonitis / hepatitis / endocrinopathy / nephritis; STEROIDS for severe per primary source")
        ],
        indications: AttributedProse(
            "Multiple FDA-approved indications across melanoma, NSCLC, head/neck, urothelial, RCC, MSI-H/dMMR solid tumors, classical Hodgkin lymphoma, others — frequently with chemotherapy or other agents per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Binds PD-1 on T-cells → blocks PD-1/PD-L1 interaction → restores T-cell ability to recognize and attack tumor cells. Removes the brakes on adaptive immunity.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Most indications", body: "200 mg IV every 3 weeks OR 400 mg IV every 6 weeks per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to pembrolizumab.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("Immune-related adverse events (IRAEs) — can affect ANY organ; common: pneumonitis, colitis, hepatitis, endocrinopathy (hypothyroid, hyperthyroid, hypophysitis, T1DM), nephritis, dermatitis, myocarditis, neurologic per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Hypophysitis → secondary adrenal insufficiency — fatigue, hypotension, hyponatremia; emergent steroids if suspected.", citationIDs: ["openfda_round12"]),
            AttributedBullet("New-onset T1DM with DKA presentation — finger-stick BG at every visit per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Infusion reactions; embryofetal toxicity.", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Fatigue, pruritus, rash, decreased appetite, diarrhea, nausea, IRAEs (variable).",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("CORTICOSTEROIDS at baseline (>10 mg prednisone equivalent) — may BLUNT efficacy; use minimum needed for non-IRAE conditions per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Other immune-modulating drugs — additive immunologic effects.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + ongoing labs — TSH, free T4, BMP, LFTs, glucose, cortisol per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("ASK at every visit about new diarrhea, cough, dyspnea, rash, fatigue, polyuria / polydipsia — early IRAE recognition.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("IRAE management — high-dose steroids (1–2 mg/kg/day prednisone) for grade 3+ per primary source; coordinate with oncology IRAE algorithms.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel about lifelong endocrinopathy possibility (hypothyroidism, T1DM); patients carry medical-alert ID.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "This medicine boosts your immune system to fight cancer. The immune system can also attack healthy organs — tell us about persistent diarrhea, new cough or shortness of breath, severe fatigue, rash, increased thirst / urination, or chest pain. Get blood tests as scheduled. Report any of these even months after stopping treatment.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Imatinib

public enum ImatinibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "imatinib",
        title: "Imatinib",
        subtitle: "Gleevec · BCR-ABL TKI · CML / Ph+ ALL / GIST",
        category: "BCR-ABL tyrosine kinase inhibitor (oral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Oral TKI (BCR-ABL, c-Kit, PDGFR)"),
            KeyValueRow(key: "Indications", value: "Chronic myeloid leukemia (CML), Philadelphia chromosome-positive ALL, GIST (KIT-positive), other rare conditions"),
            KeyValueRow(key: "Notable", value: "First-line CML — transformative; >85% 10-year survival; needs lifelong adherence"),
            KeyValueRow(key: "Newer TKIs", value: "Dasatinib, nilotinib, bosutinib, ponatinib for resistance / intolerance")
        ],
        indications: AttributedProse(
            "Chronic-phase CML (Philadelphia chromosome-positive); Ph+ ALL; KIT-positive GIST; aggressive systemic mastocytosis; chronic eosinophilic leukemia; dermatofibrosarcoma protuberans; others per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Inhibits BCR-ABL fusion tyrosine kinase (CML), c-KIT (GIST, mastocytosis), PDGFR — blocks oncogenic signaling.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "CML chronic phase", body: "400 mg PO daily; titrate to 600–800 mg/day for resistant disease per primary source.", citationIDs: ["openfda_round12"]),
            DosingBlock(label: "GIST", body: "400 mg PO daily; 800 mg for KIT exon 9 mutation per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to imatinib.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("Edema (periorbital especially), fluid retention, pleural / pericardial effusion — assess and trend.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Hepatotoxicity — baseline + ongoing LFTs.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Cytopenias (neutropenia, thrombocytopenia, anemia) — CBC monitoring.", citationIDs: ["openfda_round12"]),
            AttributedBullet("HF / cardiotoxicity (rare); GI bleeding (GIST patients with large tumors).", citationIDs: ["openfda_round12"]),
            AttributedBullet("Embryofetal toxicity — contraception required.", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Edema (especially periorbital), nausea, diarrhea, muscle cramps, rash, fatigue, cytopenias.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides, grapefruit) — RAISE imatinib levels.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Strong CYP3A4 inducers (rifampin, phenytoin, carbamazepine, St. John's wort) — LOWER imatinib levels.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Warfarin — INR fluctuations.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Acetaminophen — additive hepatotoxicity; limit dose.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Take with FOOD + large glass of water to reduce GI upset per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Trend CBC + LFTs + BCR-ABL transcript level (CML) per oncology protocol.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel ADHERENCE — daily lifelong; missed doses → loss of disease control + resistance.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Address financial / insurance concerns proactively — TKIs are expensive; assistance programs available.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "Take with food and water at the same time daily. Do not miss doses — even one missed dose can let the cancer escape control. Avoid grapefruit. Use sunscreen — rash is common. Tell us about leg / facial swelling, severe nausea, yellow skin, easy bruising, or fever. Use reliable birth control. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Mesalamine

public enum MesalamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mesalamine",
        title: "Mesalamine (5-ASA)",
        subtitle: "Asacol / Pentasa / Lialda · 5-aminosalicylic acid · IBD induction + maintenance",
        category: "5-aminosalicylic acid (anti-inflammatory)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "5-aminosalicylate; topical (luminal) anti-inflammatory"),
            KeyValueRow(key: "Indications", value: "Mild-moderate UC (induction + maintenance); modest benefit in Crohn's"),
            KeyValueRow(key: "Forms", value: "Oral (delayed-release / extended-release / pH-dependent), enema, suppository — choose per disease location"),
            KeyValueRow(key: "Notable", value: "GI symptom flares may mimic intolerance — \"mesalamine intolerance syndrome\"; rare nephrotoxicity")
        ],
        indications: AttributedProse(
            "Mild-to-moderate ulcerative colitis induction and maintenance of remission; left-sided / distal colitis with rectal preparations; modest benefit in Crohn's per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Topical anti-inflammatory in colonic lumen — inhibits prostaglandin and leukotriene synthesis, scavenges free radicals, modulates leukocyte function.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "UC induction", body: "Oral 2.4–4.8 g/day (divided or once daily depending on product) per primary source.", citationIDs: ["openfda_round12"]),
            DosingBlock(label: "Distal disease", body: "Mesalamine ENEMA 4 g qHS (left-sided colitis) OR mesalamine SUPPOSITORY 1 g qHS (proctitis) per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to salicylates / mesalamine; severe renal impairment per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("Mesalamine intolerance — paradoxical worsening of colitis (cramping, bloody diarrhea); STOP and notify; mimics flare.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Nephrotoxicity (rare interstitial nephritis) — baseline + annual creatinine per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Hepatotoxicity (rare).", citationIDs: ["openfda_round12"]),
            AttributedBullet("Pancreatitis (rare).", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, abdominal pain, diarrhea, rash, increased liver enzymes (mild).",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Other NSAIDs — additive nephrotoxicity.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Azathioprine / 6-MP — additive bone-marrow suppression; some increase 6-MP levels.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel — swallow tablets WHOLE (do not crush/chew); intact pill in stool can occur (does not mean failure of release).", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Annual creatinine, LFTs.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Topical preparations — schedule at bedtime; counsel on retention 1+ hour for enemas; positioning (left lateral for left-sided).", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Distinguish flare worsening (typical or response to triggers) from mesalamine intolerance (worsens with the medication).", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed; swallow tablets whole. If you see an intact tablet in your stool, the medicine has still been absorbed. Tell us about increased diarrhea, rash, severe abdominal pain, or decreased urination. Take rectal medications at bedtime; lie on your left side and try to retain for at least 1 hour for enema.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Infliximab

public enum InfliximabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "infliximab",
        title: "Infliximab",
        subtitle: "Remicade · TNF inhibitor (IV) · IBD / RA / psoriasis / AS",
        category: "TNF inhibitor (biologic IV)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Chimeric anti-TNF monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "Crohn's, UC, RA, AS, psoriatic arthritis, plaque psoriasis"),
            KeyValueRow(key: "Boxed warnings", value: "Serious infection (TB / fungal / opportunistic), malignancy (lymphoma + skin cancer)"),
            KeyValueRow(key: "Notable", value: "IV infusion every 8 weeks maintenance; combine with immunomodulator (methotrexate / azathioprine) to reduce immunogenicity")
        ],
        indications: AttributedProse(
            "Moderate-to-severe Crohn's disease (induction + maintenance), ulcerative colitis, rheumatoid arthritis, ankylosing spondylitis, psoriatic arthritis, plaque psoriasis per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Binds soluble and membrane-bound TNF-α → blocks TNF-mediated inflammation. Chimeric (mouse + human) — potential for antibody formation.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "IBD induction", body: "5 mg/kg IV at weeks 0, 2, 6, then every 8 weeks per primary source.", citationIDs: ["openfda_round12"]),
            DosingBlock(label: "IBD maintenance", body: "5–10 mg/kg IV every 8 weeks; titrate to disease activity and trough level.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Active serious infection; active TB; HF NYHA III/IV at doses >5 mg/kg; hypersensitivity to murine proteins; concurrent live vaccines per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("BOXED — serious infection (TB / fungal / opportunistic) — SCREEN for latent TB and HBV before initiation per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("BOXED — malignancy (lymphoma especially HSTCL in young IBD males on combination immunosuppression; skin cancer).", citationIDs: ["openfda_round12"]),
            AttributedBullet("HF — caution moderate-severe HF; monitor.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Demyelinating disease, lupus-like syndrome, hepatitis B reactivation, cytopenias.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Infusion reactions — fever, chills, rash, hypotension; pre-medicate with diphenhydramine + acetaminophen ± steroid per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("AVOID live vaccines.", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Infusion reactions, infection (URI most common, opportunistic less common), headache, nausea.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Other biologic DMARDs / JAK inhibitors — AVOID combination; additive infection risk.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Methotrexate / azathioprine — often combined; reduces antibody-to-drug formation.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-initiation — TB screen (TST or IGRA), HBV serology, vaccinations updated, malignancy review per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Pre-medicate per facility — diphenhydramine + acetaminophen ± hydrocortisone.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Slow initial infusion (2 hours); decrease for subsequent if tolerated; observe ≥1 hour post.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Trend antibody levels and trough infliximab levels in patients with loss of response per primary source.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "You will get this through an IV every 8 weeks. Tell us right away about fever, persistent cough, night sweats, weight loss, sore throat, or any infection. Avoid live vaccines. Use sun protection — skin-cancer risk is increased. Tell every provider you take this before any procedure or vaccine.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Loperamide

public enum LoperamideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "loperamide",
        title: "Loperamide",
        subtitle: "Imodium · μ-opioid agonist (peripheral) · acute / chronic diarrhea",
        category: "Antidiarrheal (opioid receptor agonist, peripheral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic μ-opioid agonist with minimal CNS penetration"),
            KeyValueRow(key: "Indications", value: "Acute non-infectious diarrhea, chronic diarrhea (IBS-D, IBD-related), ileostomy output reduction"),
            KeyValueRow(key: "AVOID in", value: "Bloody diarrhea, fever, suspected bacterial dysentery, C. difficile (toxin retention), <2 yr children"),
            KeyValueRow(key: "Recent FDA warning", value: "Cardiotoxicity at high doses (intentional misuse for opioid effect) — QT prolongation, dysrhythmia, cardiac arrest")
        ],
        indications: AttributedProse(
            "Acute non-specific diarrhea; chronic diarrhea (IBD, IBS-D, post-infectious, post-resection / short-gut); reduction of ileostomy output per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        mechanism: AttributedProse(
            "Activates peripheral μ-opioid receptors in enteric nervous system → slows GI motility, increases water absorption, decreases secretion. Minimal CNS effects at therapeutic doses.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Acute (adult)", body: "4 mg PO initially; then 2 mg PO after each unformed stool; max 16 mg/day per primary source.", citationIDs: ["openfda_round12"]),
            DosingBlock(label: "Chronic", body: "Maintenance 4–8 mg/day in 2 divided doses; max 16 mg/day per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Bloody diarrhea / dysentery; suspected acute bacterial enterocolitis; pseudomembranous colitis (C. difficile); ileus; bowel obstruction; <2 years per primary source.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("CARDIOTOXICITY at high doses (intentional misuse for euphoria) — QT prolongation, torsades, cardiac arrest; FDA limits OTC packaging since 2018 per primary source.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Toxic megacolon in IBD or C. difficile — STOP if present.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Anaphylaxis (rare).", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Constipation (with prolonged use), abdominal distension, dizziness, nausea, dry mouth.",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 / P-gp inhibitors — RAISE loperamide levels (cardiotoxicity at high doses).", citationIDs: ["openfda_round12"]),
            AttributedBullet("Other QT-prolonging drugs — additive risk.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("ASSESS for red-flag features before initiation — fever, bloody stools, severe abdominal pain, recent antibiotic use (C. diff), travel history per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel hydration + electrolyte replacement during diarrhea.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("AVOID in suspected infectious diarrhea — slowing motility traps toxins.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel about MAX dose; OTC packaging now limits to 8-mg quantity per primary source.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "Use only the dose recommended on the label. Drink fluids with electrolytes. Stop and call us if you see blood in stool, develop fever, severe abdominal pain, or no improvement in 48 hours. Do NOT take above the label dose — high doses can cause life-threatening heart rhythm problems.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Rifaximin

public enum RifaximinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rifaximin",
        title: "Rifaximin",
        subtitle: "Xifaxan · non-absorbable rifamycin · hepatic encephalopathy + IBS-D + traveler's",
        category: "Non-absorbable rifamycin antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Rifamycin (non-absorbable; <0.4% systemic absorption)"),
            KeyValueRow(key: "Indications", value: "Hepatic encephalopathy recurrence prevention; IBS-D; traveler's diarrhea (E. coli)"),
            KeyValueRow(key: "Notable", value: "Minimal systemic effect → safer than systemic antibiotics; minimal CYP3A4 induction"),
            KeyValueRow(key: "Adjunct", value: "Lactulose first-line for HE; rifaximin added to PREVENT recurrence per primary source")
        ],
        indications: AttributedProse(
            "Reduction in risk of overt hepatic encephalopathy recurrence in adults; treatment of irritable bowel syndrome with diarrhea (IBS-D); treatment of traveler's diarrhea due to non-invasive E. coli per primary source.",
            citationIDs: ["openfda_round12", "specialty_round12"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial RNA polymerase → bactericidal in gut lumen. Minimal systemic absorption keeps action local. Reduces ammonia-producing gut flora in HE.",
            citationIDs: ["openfda_round12"]
        ),
        dosing: [
            DosingBlock(label: "Hepatic encephalopathy", body: "550 mg PO BID (paired with lactulose) per primary source.", citationIDs: ["openfda_round12"]),
            DosingBlock(label: "IBS-D", body: "550 mg PO TID × 14 days; can repeat course up to 2× more if symptoms recur per primary source.", citationIDs: ["openfda_round12"]),
            DosingBlock(label: "Traveler's diarrhea", body: "200 mg PO TID × 3 days per primary source.", citationIDs: ["openfda_round12"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to rifaximin or rifamycins.",
            citationIDs: ["openfda_round12"]
        ),
        warnings: [
            AttributedBullet("C. difficile-associated diarrhea (despite limited absorption) — discontinue if suspected.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Severe hepatic impairment — use cautiously despite low absorption.", citationIDs: ["openfda_round12"]),
            AttributedBullet("Hypersensitivity (rare).", citationIDs: ["openfda_round12"])
        ],
        adverseReactions: AttributedProse(
            "Edema, nausea, dizziness, fatigue (mostly in HE patients reflecting underlying disease).",
            citationIDs: ["openfda_round12"]
        ),
        drugInteractions: [
            AttributedBullet("Generally minimal due to non-absorption; rare CYP3A interaction (unlike systemic rifampin).", citationIDs: ["openfda_round12"]),
            AttributedBullet("OCPs — limited evidence for reduced efficacy.", citationIDs: ["openfda_round12"])
        ],
        nursingImplications: [
            AttributedBullet("Co-administer with LACTULOSE in HE — combination significantly more effective than either alone per primary source.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Assess HE recurrence (mental status); collaborate with hepatology.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Counsel that this antibiotic stays in the gut — minimal systemic side effects.", citationIDs: ["openrn_pharm_round12"]),
            AttributedBullet("Insurance considerations — expensive; coordinate prior auth.", citationIDs: ["openrn_pharm_round12"])
        ],
        patientTeaching: AttributedProse(
            "Take with or without food. This antibiotic stays in the intestines so side effects are usually mild. Continue lactulose if also prescribed for liver-related encephalopathy. Tell us about new severe diarrhea, abdominal pain, or fever.",
            citationIDs: ["openrn_pharm_round12"]
        ),
        citations: [openfda, openrnPharmR12, specialtyR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}
