import Foundation

// Curator-model drug entries (round 18 — heme/onc supportive + chemo + neurology + psych).

private let openfdaR18 = CitationSource(
    id: "openfda_round18",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR18 = CitationSource(
    id: "openrn_pharm_round18",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=hematology+oncology+neurology+psychiatry",
    lastRetrieved: "2026-05-04"
)
private let specialtyR18 = CitationSource(
    id: "specialty_round18",
    shortName: "ASCO / NCCN / AAN / APA concept citations",
    publisher: "ASCO · NCCN · AAN · APA",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/category_1",
    lastRetrieved: "2026-05-04"
)

public enum FilgrastimSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "filgrastim",
        title: "Filgrastim (G-CSF)",
        subtitle: "Neupogen / Granix · recombinant G-CSF · neutropenia recovery · bone pain",
        category: "Granulocyte colony-stimulating factor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant human G-CSF"),
            KeyValueRow(key: "Indications", value: "Chemotherapy-induced neutropenia; HSCT; severe chronic neutropenia; AML induction recovery"),
            KeyValueRow(key: "Notable", value: "Bone pain very common — counsel + analgesia (loratadine adjunct evidence)"),
            KeyValueRow(key: "Watch", value: "Splenic rupture (rare), ARDS, sickle cell crisis trigger")
        ],
        indications: AttributedProse(
            "Reduce duration + severity of chemotherapy-induced neutropenia; mobilization of hematopoietic stem cells before HSCT; severe chronic neutropenia (congenital / cyclic / idiopathic); accelerate myeloid recovery after HSCT per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        mechanism: AttributedProse(
            "Recombinant G-CSF binds receptor on myeloid progenitor cells → stimulates proliferation, differentiation, and end-cell function of neutrophils.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "Chemo-induced neutropenia", body: "5 mcg/kg/day SQ starting ~24 hr post-chemo until ANC recovery (>10,000) per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "HSCT mobilization", body: "10 mcg/kg/day SQ × 4–6 days before apheresis.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Pegfilgrastim alternative", body: "Single 6 mg SQ dose ≥24 hr post-chemo (longer-acting).", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to E. coli-derived proteins; concurrent use 24 hours before to 24 hours after chemotherapy (limited supportive evidence) per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("BONE PAIN — very common (mediastinum, sternum, hips); manage with NSAIDs / acetaminophen; loratadine adjunct may help per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Splenic rupture — rare; counsel about LUQ / shoulder pain.", citationIDs: ["openfda_round18"]),
            AttributedBullet("ARDS — rare; respiratory distress + hypoxia.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Sickle cell crisis — can precipitate; cautious in HbSS / HbSC patients.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Capillary leak syndrome — rare but serious.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Aortitis — rare; monitor for fever + abdominal / chest pain.", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Bone pain (very common), headache, fatigue, nausea, leukocytosis, splenomegaly, skin rash.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Concurrent chemotherapy / RT — reduced effect; timing per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Lithium — additive leukocytosis.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Refrigerate; allow to room temperature 30 min before injection; SQ rotate sites.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Monitor CBC q1–2 days; discontinue when ANC >10,000 post-nadir per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Patient self-administration — teach SQ technique; sharps disposal.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Counsel bone pain management + when to call (severe LUQ pain — splenic rupture concern).", citationIDs: ["specialty_round18"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this medicine through your skin to help your bone marrow make white blood cells faster after chemotherapy. Bone pain (especially in your back, chest, or hips) is common — try loratadine, ibuprofen, or acetaminophen as we discussed. Tell us right away about severe left-upper-belly pain or shoulder pain, severe shortness of breath, or unusual rash.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EpoetinAlfaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "epoetin-alfa",
        title: "Epoetin alfa (EPO)",
        subtitle: "Procrit / Epogen · ESA · CKD + chemo anemia · target Hgb 10–11 (NOT normal)",
        category: "Erythropoiesis-stimulating agent (ESA)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant human erythropoietin"),
            KeyValueRow(key: "Indications", value: "Anemia of CKD (especially dialysis); chemotherapy-induced anemia; zidovudine-treated HIV anemia; perisurgical RBC reduction"),
            KeyValueRow(key: "Boxed", value: "Increased CV / thrombotic events + tumor progression at higher Hgb targets"),
            KeyValueRow(key: "Target", value: "Hgb 10–11 g/dL (lowest dose to avoid transfusion); NOT normalize to >12")
        ],
        indications: AttributedProse(
            "Anemia of chronic kidney disease (especially dialysis-dependent); chemotherapy-induced anemia in non-myeloid malignancies; anemia from zidovudine; reduction of allogeneic RBC transfusion in elective non-cardiac, non-vascular surgery per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        mechanism: AttributedProse(
            "Recombinant human erythropoietin → binds erythropoietin receptors on erythroid progenitor cells → stimulates RBC production. Iron must be available for effective response.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "CKD on dialysis", body: "50–100 units/kg IV / SQ 3× weekly; titrate to Hgb 10–11 per primary source.", citationIDs: ["specialty_round18"]),
            DosingBlock(label: "CKD non-dialysis", body: "Initial 100 units/kg/week SQ in divided doses; titrate per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Chemo-induced anemia", body: "150–300 units/kg/week SQ; only if Hgb <10 + chemotherapy ≥2 months remaining; discontinue when chemo complete per primary source.", citationIDs: ["specialty_round18"]),
            DosingBlock(label: "Surgery prep", body: "300 units/kg/day SQ × 10 days pre-op + day of + 4 days post; OR 600 units/kg/week.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; uncontrolled hypertension; pure red cell aplasia (PRCA) from prior ESA; hypersensitivity to mammalian cell-derived products; multi-dose vials with benzyl alcohol in neonates per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased mortality + CV events + thromboembolism + tumor progression at Hgb >11; use lowest dose to avoid transfusion per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Hypertension — pre-existing must be controlled before starting; monitor BP closely.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Pure red cell aplasia (PRCA) — anti-EPO antibodies; rare but irreversible; switch ESA / treatment.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Iron deficiency limits response — supplementation often needed (oral or IV).", citationIDs: ["specialty_round18"]),
            AttributedBullet("Seizures — risk increased; especially in CKD.", citationIDs: ["openfda_round18"]),
            AttributedBullet("REMS for chemo-induced anemia — patient counseling on risks per primary source.", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Hypertension, headache, arthralgia, thrombosis (DVT, PE, MI, stroke), seizures, injection-site reaction, PRCA (rare).",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Iron — supplementation enhances response; check ferritin + TSAT.", citationIDs: ["specialty_round18"]),
            AttributedBullet("ACE inhibitors — may blunt response (controversial).", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + ongoing — Hgb (target 10–11), iron studies, BP, CV symptoms.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Iron repletion — oral or IV; ESA does not work without adequate iron.", citationIDs: ["specialty_round18"]),
            AttributedBullet("BP optimization before + during therapy.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Counsel — call for new chest pain, leg swelling, severe headache, sudden weakness.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Cancer patients — REMS counseling; balance transfusion avoidance vs progression risk.", citationIDs: ["specialty_round18"])
        ],
        patientTeaching: AttributedProse(
            "We're giving this to help your bone marrow make red blood cells. We aim for hemoglobin around 10–11 — higher is not safer; it can increase clots and heart attacks. We'll check your blood pressure, iron, and blood counts often. Tell us right away about chest pain, breathing trouble, leg swelling, severe headache, or weakness on one side.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum VincristineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "vincristine",
        title: "Vincristine",
        subtitle: "Vinca alkaloid · NEVER intrathecal — fatal · neuropathy + ileus · vesicant",
        category: "Vinca alkaloid antineoplastic",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Mitotic inhibitor (microtubule disruption)"),
            KeyValueRow(key: "Indications", value: "ALL, lymphoma (Hodgkin + NHL), Wilms', neuroblastoma, multiple myeloma, ITP refractory"),
            KeyValueRow(key: "Boxed", value: "FATAL if given intrathecally — IV ONLY; high-alert med, double-check + dilute"),
            KeyValueRow(key: "Watch", value: "Peripheral neuropathy, ileus, SIADH, vesicant (extravasation injury)")
        ],
        indications: AttributedProse(
            "Acute lymphoblastic leukemia (ALL); Hodgkin + non-Hodgkin lymphoma; Wilms' tumor; rhabdomyosarcoma; neuroblastoma; multiple myeloma combinations; refractory ITP per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Binds tubulin → inhibits microtubule formation → arrests cells in metaphase → cell death. Antineoplastic for rapidly dividing cells.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "1.4 mg/m² IV (max 2 mg) weekly; multiple regimens.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Pediatric", body: "1.5–2 mg/m² IV weekly; varied per protocol.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Dose CAP at 2 mg per dose for ALL patients (regardless of BSA) per primary source.", body: "Reduce hepatic dose if bilirubin elevated.", citationIDs: ["specialty_round18"])
        ],
        contraindications: AttributedProse(
            "INTRATHECAL administration (fatal); demyelinating Charcot-Marie-Tooth disease; severe hepatic impairment per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("BOXED — FATAL if administered intrathecally; IV ONLY — labeled clearly + dispensed in IV bag (not syringe) per ISMP per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Peripheral neuropathy — dose-limiting; jaw pain, numbness / tingling, foot drop, autonomic.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Constipation / ileus / paralytic ileus — prophylactic stool softener + laxative; abdominal pain → emergent.", citationIDs: ["specialty_round18"]),
            AttributedBullet("VESICANT — extravasation causes severe tissue injury; central line preferred; hyaluronidase + warm compress for extravasation per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("SIADH — hyponatremia.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Myelosuppression less severe than other vinca alkaloids (vinblastine).", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Peripheral neuropathy, constipation, jaw pain, alopecia, hyponatremia (SIADH), tissue necrosis from extravasation, mild myelosuppression.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, ritonavir) — increase neuropathy + toxicity.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Itraconazole — particular concern for severe neurotoxicity.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Phenytoin — vincristine reduces phenytoin levels.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("CRITICAL — verify route of administration BEFORE giving; bag NOT syringe; pharmacist verification + nurse double-check.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Central line preferred; IF peripheral, use new IV with good blood return; observe insertion site continuously.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Extravasation — STOP immediately, aspirate residual, leave catheter in place, call oncology, hyaluronidase + warm compress per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Stool softener + laxative bowel program prophylactic for entire course.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Neuro exam each visit — DTRs, gait, fine motor, autonomic; dose modification per protocol.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Monitor sodium; avoid hypotonic IV in SIADH.", citationIDs: ["openfda_round18"])
        ],
        patientTeaching: AttributedProse(
            "This is a chemotherapy that goes only into your IV — never into your spine. We always double-check before giving it. Take stool softeners + drink fluids — constipation is common and serious. Tell us about numbness, tingling, jaw pain, weakness, or trouble walking. If the IV site burns, hurts, or swells, tell us right away.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CytarabineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cytarabine",
        title: "Cytarabine (Ara-C)",
        subtitle: "Pyrimidine antimetabolite · AML induction backbone · myelosuppression + cerebellar tox + conjunctivitis",
        category: "Pyrimidine antimetabolite chemotherapy",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pyrimidine antimetabolite"),
            KeyValueRow(key: "Indications", value: "AML induction (\"7+3\"); ALL; CML blast crisis; lymphomatous meningitis (intrathecal)"),
            KeyValueRow(key: "Notable", value: "High-dose causes cerebellar toxicity + chemical conjunctivitis"),
            KeyValueRow(key: "Watch", value: "Myelosuppression (severe + prolonged), cytarabine syndrome, hand-foot syndrome")
        ],
        indications: AttributedProse(
            "Induction + maintenance therapy for AML; ALL; CML in blast crisis; intrathecal for meningeal leukemia / lymphoma; component of HSCT conditioning per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Pyrimidine analog → intracellularly converted to ara-CTP → inhibits DNA polymerase + incorporates into DNA → S-phase specific cell death.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "AML standard induction (7+3)", body: "100–200 mg/m²/day continuous IV × 7 days + anthracycline × 3 days per primary source.", citationIDs: ["specialty_round18"]),
            DosingBlock(label: "High-dose (HiDAC)", body: "1–3 g/m² IV q12h × 6–12 doses; consolidation per primary source.", citationIDs: ["specialty_round18"]),
            DosingBlock(label: "Intrathecal", body: "30–100 mg per dose per protocol.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Renal / hepatic adjustment", body: "Dose reduce in CrCl <60 + hepatic impairment per primary source.", citationIDs: ["specialty_round18"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; severe pre-existing pancytopenia (relative) per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("Severe + prolonged myelosuppression — pancytopenia weeks; supportive care + transfusions.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Cytarabine syndrome — fever, myalgia, bone pain, rash, conjunctivitis, malaise within 6–12 hr; corticosteroid prophylaxis.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Cerebellar toxicity (high-dose) — ataxia, dysarthria, nystagmus; usually reversible if d/c per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Chemical conjunctivitis (high-dose) — corticosteroid eye drops prophylactic.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Hand-foot syndrome — palmar-plantar erythrodysesthesia.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Tumor lysis syndrome — high-burden disease; allopurinol / rasburicase + hydration.", citationIDs: ["specialty_round18"])
        ],
        adverseReactions: AttributedProse(
            "Myelosuppression, mucositis, nausea / vomiting, alopecia, diarrhea, hepatic dysfunction, fever / cytarabine syndrome, conjunctivitis, hand-foot syndrome, cerebellar toxicity (high-dose).",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Other chemotherapy / radiation — additive myelosuppression.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Live vaccines — contraindicated; coordinate timing.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous infusion via central line preferred; pump verification.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("High-dose — corticosteroid eye drops prophylactic + cerebellar exam pre-each-dose; hold if cerebellar signs per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Daily CBC + electrolytes; tumor lysis labs (uric acid, K, phos, Ca, LDH); hydrate aggressively.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Antiemetic prophylaxis; mouth care; counsel hand-foot syndrome care.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Neutropenic precautions during nadir + close monitoring for febrile neutropenia.", citationIDs: ["specialty_round18"])
        ],
        patientTeaching: AttributedProse(
            "This chemotherapy can cause low blood counts, mouth sores, nausea, hair loss, and infection risk. Use the eye drops (high-dose) on schedule. Tell us right away about fever, balance problems, slurred speech, severe rash, or mouth pain.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EltrombopagSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "eltrombopag",
        title: "Eltrombopag",
        subtitle: "Promacta · oral TPO mimetic · ITP + aplastic anemia + HCV thrombocytopenia",
        category: "Thrombopoietin receptor agonist (TPO-RA)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Oral non-peptide thrombopoietin mimetic"),
            KeyValueRow(key: "Indications", value: "Chronic ITP; severe aplastic anemia (refractory); HCV-related thrombocytopenia"),
            KeyValueRow(key: "Notable", value: "Hepatotoxicity boxed; cataract risk; chelation with cations"),
            KeyValueRow(key: "Schedule", value: "PO daily; separate from polyvalent cations 4 hrs")
        ],
        indications: AttributedProse(
            "Chronic immune thrombocytopenia (ITP) refractory to corticosteroids / immunoglobulin / splenectomy; severe aplastic anemia refractory to immunosuppression; HCV thrombocytopenia limiting interferon therapy per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Non-peptide oral thrombopoietin receptor agonist → increases megakaryocyte proliferation + differentiation → increased platelet production.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "ITP", body: "Initial 50 mg PO daily (25 mg in East Asians or hepatic impairment); titrate every 2 weeks to platelet 50,000–200,000 (max 75 mg) per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Aplastic anemia", body: "50 mg PO daily; titrate to 150 mg max with hematology guidance per primary source.", citationIDs: ["specialty_round18"]),
            DosingBlock(label: "Take with empty stomach", body: "1 hour before / 2 hours after meals + 4 hours from polyvalent cations / dairy / antacids.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment without dose reduction; hypersensitivity per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("BOXED-EQUIVALENT — hepatotoxicity (sometimes severe / fatal); LFTs at baseline + frequently per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Thrombosis — especially with platelet count >400,000 in ITP; titrate carefully.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Cataracts — periodic eye exams in long-term use.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Bone marrow fibrosis (rare) — periodic peripheral smear.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Rebound thrombocytopenia after discontinuation.", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Hepatotoxicity, headache, nausea, diarrhea, fatigue, thromboembolism, cataracts (chronic), back pain, increased BUN.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Polyvalent cations (Ca, Fe, Mg, Al, Zn) + dairy / antacids — REDUCE absorption; separate by 4 hours per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Statins — eltrombopag inhibits OATP1B1 + BCRP; reduce statin dose.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Strong CYP1A2 / 2C8 modulators — adjust dosing per primary source.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + biweekly LFTs first 6 months then monthly.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Platelet count weekly during titration; target 50,000–200,000 in ITP.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Counsel — empty stomach, separate from supplements / dairy / antacids by 4 hrs.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Annual eye exams; report blurred vision.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Monitor for thrombosis (DVT/PE), GI bleeding, jaundice.", citationIDs: ["openrn_pharm_round18"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth on an empty stomach. Don't take it within 4 hours of dairy, antacids, calcium, iron, or magnesium supplements. Get blood tests for liver and platelets as scheduled. Tell us about yellow eyes / skin, dark urine, bruising, leg swelling, or vision changes.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum RomiplostimSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "romiplostim",
        title: "Romiplostim",
        subtitle: "Nplate · weekly SQ TPO peptide · ITP · marrow fibrosis monitoring",
        category: "Thrombopoietin receptor agonist (TPO-RA — peptide)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "TPO peptibody (Fc-peptide fusion)"),
            KeyValueRow(key: "Indications", value: "Chronic ITP; pediatric ITP; acute radiation syndrome (HSCS)"),
            KeyValueRow(key: "Notable", value: "Weekly SQ; alternative to eltrombopag"),
            KeyValueRow(key: "Watch", value: "Bone marrow fibrosis, thromboembolism, rebound thrombocytopenia")
        ],
        indications: AttributedProse(
            "Chronic immune thrombocytopenia (ITP) refractory to standard therapy; pediatric chronic ITP ≥1 year of age; acute radiation syndrome (hematopoietic) per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Fc-peptide fusion protein → activates thrombopoietin receptor → stimulates megakaryocyte proliferation + platelet production.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "ITP", body: "1 mcg/kg SQ weekly; titrate by 1 mcg/kg every 2 weeks to platelet 50,000–200,000 (max 10 mcg/kg/week) per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Pediatric", body: "Same weekly weight-based; max 10 mcg/kg.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("Bone marrow fibrosis — reticulin deposition; rare reversible if d/c; monitor peripheral smear.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Thromboembolism — venous + arterial; monitor especially with thrombosis history.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Rebound thrombocytopenia (worse than baseline) within 2 weeks of stopping.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Progression of MDS — limit use in MDS-related thrombocytopenia.", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Headache, arthralgia, dizziness, fatigue, insomnia, bone marrow fibrosis (rare), thromboembolism.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("None significant in oral / hepatic metabolism since SQ peptide.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Reconstitute per labeling; SQ weekly in clinic; teach self-administration after stable.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Weekly platelet count during titration; target 50,000–200,000.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Periodic peripheral smear / consider bone marrow biopsy if prolonged use.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Counsel rebound thrombocytopenia — do not abruptly discontinue.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Monitor for thrombosis + bleeding.", citationIDs: ["openrn_pharm_round18"])
        ],
        patientTeaching: AttributedProse(
            "We give this through your skin once a week. Get your platelet counts checked weekly while we adjust the dose. Tell us about bruising, bleeding, leg swelling, or chest pain. Don't stop the medication suddenly — your platelets can drop very low.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LevodopaCarbidopaSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "levodopa-carbidopa",
        title: "Levodopa-carbidopa",
        subtitle: "Sinemet · Parkinson's gold standard · ON / OFF + dyskinesias · protein-spaced",
        category: "Dopamine precursor + decarboxylase inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Dopamine precursor (L-DOPA) + peripheral decarboxylase inhibitor"),
            KeyValueRow(key: "Indications", value: "Parkinson's disease; symptomatic parkinsonism"),
            KeyValueRow(key: "Notable", value: "Take 30 min before / 1 hour after protein meals; never abruptly stop"),
            KeyValueRow(key: "Watch", value: "Wearing-off, on-off, dyskinesias, hypotension, hallucinations")
        ],
        indications: AttributedProse(
            "Treatment of Parkinson's disease + symptomatic parkinsonism; carbidopa prevents peripheral decarboxylation of levodopa → reduces nausea + maximizes CNS levodopa per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Levodopa crosses blood-brain barrier → converted to dopamine in striatum → replaces lost dopamine. Carbidopa blocks peripheral conversion (reduces GI side effects + increases CNS availability).",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "Start carbidopa-levodopa 25/100 PO TID; titrate gradually per response per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "ER (Sinemet CR / Rytary)", body: "Various formulations; longer-acting; useful for wearing-off.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Continuous intestinal gel (Duopa)", body: "Surgically placed PEG-J tube; advanced PD with motor complications.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Concurrent non-selective MAOI (within 14 days); narrow-angle glaucoma; melanoma history (relative); severe psychosis per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("AVOID abrupt discontinuation — can precipitate neuroleptic malignant-like syndrome (parkinsonism-hyperpyrexia) per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Wearing-off + on-off phenomena + dyskinesias — develop after 5–10 years of therapy.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Orthostatic hypotension; counsel rise slowly.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Hallucinations + delusions — especially elderly; reduce dose or switch.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Impulse control disorders — pathologic gambling, hypersexuality, binge eating.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Dietary protein interferes with levodopa absorption — separate doses from high-protein meals.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Sleep attacks — sudden daytime sleep; counsel about driving risks.", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, orthostatic hypotension, dyskinesias, hallucinations, dystonia, sleep disturbance, impulse control disorders, dark urine / sweat (harmless).",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Non-selective MAOIs — hypertensive crisis; CONTRAINDICATED.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Antipsychotics (especially typical) — antagonize PD effect.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Pyridoxine high-dose — may reduce effect (if no carbidopa).", citationIDs: ["openfda_round18"]),
            AttributedBullet("Iron supplements — chelate levodopa; separate dosing.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Protein meals — reduce absorption; separate from high-protein meals.", citationIDs: ["specialty_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Take 30 min before / 1 hour after meals; separate from high-protein meals.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Track motor diary — \"on\" vs \"off\" times + dyskinesias.", citationIDs: ["specialty_round18"]),
            AttributedBullet("BP monitoring including orthostatic; fall prevention.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Counsel — never abrupt discontinuation; warn impulse-control behaviors; sleep attacks + driving risk.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Multidisciplinary care — neurology, PT, OT, speech, social work.", citationIDs: ["openrn_pharm_round18"])
        ],
        patientTeaching: AttributedProse(
            "Take this on a regular schedule, separate from high-protein meals (protein blocks absorption). Get up slowly to avoid lightheadedness. Don't stop suddenly — call us first. Tell us about sudden urges to gamble, shop, eat, or have sex; sudden daytime sleeping; visions; or bad dyskinesias.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum RopiniroleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ropinirole",
        title: "Ropinirole",
        subtitle: "Requip · D2/D3 dopamine agonist · Parkinson's + RLS · sleep attacks + impulse control",
        category: "Non-ergot dopamine receptor agonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective non-ergot D2 / D3 dopamine receptor agonist"),
            KeyValueRow(key: "Indications", value: "Parkinson's (alone or adjunct); restless legs syndrome (moderate-severe)"),
            KeyValueRow(key: "Notable", value: "Sleep attacks + impulse control disorders ± augmentation in RLS"),
            KeyValueRow(key: "Watch", value: "Orthostatic hypotension, hallucinations, drowsiness, RLS augmentation")
        ],
        indications: AttributedProse(
            "Parkinson's disease — early monotherapy or adjunct to levodopa; moderate-severe primary restless legs syndrome per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Selective D2 / D3 dopamine receptor agonist (non-ergot derivative — fewer fibrotic side effects than ergot agonists).",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "Parkinson's", body: "Start 0.25 mg PO TID; titrate slowly weekly to 1 mg TID then 1.5 mg TID etc.; max 24 mg/day per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "RLS", body: "0.25 mg PO 1–3 hours before bedtime; titrate to 0.5–4 mg.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("SLEEP ATTACKS — sudden daytime sleep without warning; counsel driving + activity risk per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Impulse control disorders — gambling, sexual, eating, shopping; counsel + monitor.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Orthostatic hypotension; rise slowly.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Hallucinations + paranoia — especially elderly + Parkinson's dementia.", citationIDs: ["openfda_round18"]),
            AttributedBullet("RLS AUGMENTATION — earlier onset, worse symptoms over time; major reason to switch to α2δ ligands; AVOID dose escalation per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Withdrawal syndrome on discontinuation — taper.", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, somnolence, dizziness, orthostatic hypotension, fatigue, hallucinations, dyskinesia (with levodopa), peripheral edema.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP1A2 inhibitors (ciprofloxacin, fluvoxamine) — increase ropinirole levels.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Estrogens — reduce clearance; reduce ropinirole.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Other dopamine antagonists — antagonize effect.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Slow titration; monitor for orthostasis at each dose change.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Counsel sleep attacks — restrict driving + machinery if any sleep episodes.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Routinely ask about impulse control behaviors.", citationIDs: ["specialty_round18"]),
            AttributedBullet("RLS — counsel augmentation signs; iron studies first; α2δ ligands preferred per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Taper to discontinue.", citationIDs: ["openrn_pharm_round18"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth as directed. Get up slowly. Tell us about sudden daytime sleep — you may need to stop driving. Tell us right away about new urges to gamble, shop, eat excessively, or have sex; visions; or paranoid thoughts. For RLS — let us know if symptoms get worse over time despite treatment.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum RiluzoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "riluzole",
        title: "Riluzole",
        subtitle: "Rilutek · NMDA / glutamate inhibitor · ALS · modest survival benefit",
        category: "Glutamate inhibitor (ALS)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Glutamate inhibitor / sodium channel blocker"),
            KeyValueRow(key: "Indications", value: "Amyotrophic lateral sclerosis (ALS)"),
            KeyValueRow(key: "Notable", value: "Modest 2–3 month survival benefit; only oral disease-modifying ALS therapy in US until edaravone IV (2017)"),
            KeyValueRow(key: "Watch", value: "Hepatotoxicity, neutropenia, interstitial lung disease (rare)")
        ],
        indications: AttributedProse(
            "Treatment of amyotrophic lateral sclerosis to extend survival (modest 2–3 months) per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Mechanism not fully understood — inhibits glutamate release, blocks NMDA + voltage-gated sodium channels, neuroprotective in ALS animal models.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "50 mg PO BID; take 1 hour before / 2 hours after meals (high-fat meals reduce absorption) per primary source.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Hepatic disease with elevated transaminases; hypersensitivity per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("Hepatotoxicity — baseline + monthly LFTs first 3 months, then q3 months × 1 year, then periodically per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Neutropenia (rare) — monthly CBC initially.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Interstitial lung disease (rare) — investigate persistent dyspnea / cough.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Pancreatitis (rare).", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Asthenia, nausea, dizziness, decreased lung function, abdominal pain, vomiting, transaminitis, somnolence.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("CYP1A2 substrates / inducers / inhibitors — fluvoxamine, ciprofloxacin (caution); rifampin (reduce effect).", citationIDs: ["openfda_round18"]),
            AttributedBullet("Hepatotoxic drugs — additive risk; alcohol limit.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Take on empty stomach — 1 hr before / 2 hrs after meals.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Baseline + scheduled LFTs + CBC; counsel hepatotoxicity signs.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Pulmonary function trending — important in ALS.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Multidisciplinary ALS clinic — neurology, pulm, GI, OT/PT, palliative care, social work.", citationIDs: ["specialty_round18"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth twice daily on an empty stomach. Get blood tests for liver and counts as scheduled. Tell us about yellow eyes / skin, dark urine, severe fatigue, fever, or new shortness of breath. Limit alcohol. This medicine modestly slows disease progression — combine with multidisciplinary ALS care.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EculizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "eculizumab",
        title: "Eculizumab",
        subtitle: "Soliris · anti-C5 mAb · PNH + aHUS + gMG + NMOSD · MENINGOCOCCAL boxed warning",
        category: "Anti-C5 monoclonal antibody (terminal complement inhibitor)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized anti-C5 monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "Paroxysmal nocturnal hemoglobinuria (PNH); atypical hemolytic uremic syndrome (aHUS); generalized myasthenia gravis; neuromyelitis optica spectrum disorder (NMOSD)"),
            KeyValueRow(key: "Boxed", value: "Life-threatening meningococcal infections — vaccinate ≥2 weeks pre-treatment + REMS"),
            KeyValueRow(key: "Schedule", value: "IV infusion weekly × 4 then biweekly maintenance")
        ],
        indications: AttributedProse(
            "Paroxysmal nocturnal hemoglobinuria (PNH); atypical hemolytic uremic syndrome (aHUS); generalized myasthenia gravis (anti-AChR positive); aquaporin-4 antibody-positive NMOSD per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Binds complement protein C5 → prevents cleavage to C5a + C5b → blocks terminal complement complex (C5b-9 / membrane attack complex) formation → reduces complement-mediated hemolysis + inflammation.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "PNH adult", body: "600 mg IV weekly × 4 → 900 mg IV week 5 → 900 mg IV q14 days maintenance per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "aHUS adult", body: "900 mg IV weekly × 4 → 1200 mg IV week 5 → 1200 mg IV q14 days maintenance per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Pediatric", body: "Weight-based per labeling; meningococcal vaccine + booster.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Unresolved Neisseria meningitidis infection; not vaccinated against meningococcal disease (REMS exception with antibiotic prophylaxis) per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("BOXED — life-threatening + fatal meningococcal infections; vaccinate against MenACWY + MenB ≥2 weeks before therapy; if urgent need, antibiotic prophylaxis (penicillin, ciprofloxacin) per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("REMS PROGRAM — patient + prescriber + pharmacy enrolled; safety card carried per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Other infections — encapsulated organisms (gonorrhea, pneumococcal, H. influenzae) increased risk.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Infusion reactions — hypotension, hypertension, hypersensitivity.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Hemolysis return on stopping in PNH — never abrupt cessation; monitor LDH + plan transition.", citationIDs: ["specialty_round18"])
        ],
        adverseReactions: AttributedProse(
            "Headache, infections (URI, gastroenteritis), nasopharyngitis, hypertension, infusion reactions, peripheral edema, anemia.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — generally avoid; coordinate with specialty.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Other immunosuppressants — additive infection risk.", citationIDs: ["specialty_round18"])
        ],
        nursingImplications: [
            AttributedBullet("CONFIRM meningococcal vaccination ≥2 weeks before therapy; antibiotic prophylaxis if not.", citationIDs: ["specialty_round18"]),
            AttributedBullet("REMS card + emergency action plan; patient + family carry safety card describing high-fever protocol.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Infuse over 25–45 min; monitor vitals + reactions; have emergency meds available.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("PNH — monitor LDH + Hgb; aHUS — creatinine + LDH + platelets.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Counsel ALL infection signs urgent, especially fever / headache / neck stiffness.", citationIDs: ["specialty_round18"])
        ],
        patientTeaching: AttributedProse(
            "Be sure you've had your meningococcal vaccines at least 2 weeks before starting this medication. Carry your Soliris safety card and show it to ANY provider when you have a fever — meningitis can be life-threatening on this medication. Tell us right away about fever, severe headache, neck stiffness, or feeling very ill. Get all your scheduled infusions — stopping suddenly can make your disease much worse.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CyclophosphamideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cyclophosphamide",
        title: "Cyclophosphamide",
        subtitle: "Cytoxan · alkylating · cancer + autoimmune · MESNA + hydration for hemorrhagic cystitis",
        category: "Alkylating agent (chemo + immunosuppressant)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nitrogen mustard alkylating agent"),
            KeyValueRow(key: "Indications", value: "Lymphomas, breast/ovarian cancer, sarcomas, multiple myeloma; severe SLE / vasculitis / nephrotic syndrome"),
            KeyValueRow(key: "Boxed", value: "Bone marrow suppression; hemorrhagic cystitis (acrolein metabolite); secondary malignancy + infertility"),
            KeyValueRow(key: "Adjuncts", value: "MESNA + aggressive hydration to prevent cystitis at high IV doses")
        ],
        indications: AttributedProse(
            "Treatment of NHL, Hodgkin's, multiple myeloma, breast cancer, ovarian, sarcomas, neuroblastoma; severe lupus nephritis, ANCA-associated vasculitis (induction), refractory nephrotic syndrome per primary source.",
            citationIDs: ["openfda_round18", "specialty_round18"]
        ),
        mechanism: AttributedProse(
            "Prodrug → activated by hepatic CYP450 → alkylates DNA → cross-links DNA strands → cell death; immunosuppressive at lower doses (autoimmune disease).",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "Oncologic regimens", body: "500–1500 mg/m² IV per cycle; varied by disease + regimen.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Lupus nephritis induction", body: "0.5–1.0 g/m² IV monthly × 6 months (NIH protocol) OR low-dose Euro-Lupus 500 mg q2 weeks × 6 doses per primary source.", citationIDs: ["specialty_round18"]),
            DosingBlock(label: "Vasculitis induction", body: "15 mg/kg IV q2–3 weeks × 3–6 doses (with steroids) per primary source.", citationIDs: ["specialty_round18"]),
            DosingBlock(label: "Oral", body: "1.5–3 mg/kg/day PO for some autoimmune indications.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Severe bone marrow suppression; active urinary tract obstruction; hypersensitivity per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("BOXED — bone marrow suppression; severe + prolonged in high-dose; monitor CBC.", citationIDs: ["openfda_round18"]),
            AttributedBullet("BOXED — hemorrhagic cystitis from acrolein metabolite; MESNA + aggressive IV hydration + Foley + frequent voiding for HD IV per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("BOXED — secondary malignancies (bladder cancer, leukemia, MDS) — long-term risk per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("BOXED — infertility (irreversible in some); fertility preservation discussion before therapy per primary source.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Cardiotoxicity (high-dose) — cardiomyopathy + heart failure.", citationIDs: ["openfda_round18"]),
            AttributedBullet("SIADH — hyponatremia.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Pulmonary fibrosis (rare).", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Myelosuppression, alopecia, nausea / vomiting, mucositis, hemorrhagic cystitis, infertility, secondary malignancy, cardiotoxicity (HD), pulmonary fibrosis, SIADH.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("Allopurinol — increased myelosuppression.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Doxorubicin — additive cardiotoxicity at high doses.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Live vaccines — contraindicated.", citationIDs: ["openfda_round18"]),
            AttributedBullet("CYP3A4 inducers / inhibitors — alter metabolism.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Aggressive IV hydration (3 L/m²/day) + MESNA for high-dose IV; encourage frequent voiding; Foley for high-dose.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Antiemetic prophylaxis (high emetogenic potential); mouth care; neutropenic precautions during nadir.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("FERTILITY counseling + preservation pre-therapy (sperm banking, oocyte / ovarian tissue).", citationIDs: ["specialty_round18"]),
            AttributedBullet("Long-term — counsel + screen for secondary malignancy (bladder cancer, MDS); contraception during therapy + 4–12 months after.", citationIDs: ["specialty_round18"]),
            AttributedBullet("PJP prophylaxis with combined immunosuppression in autoimmune disease per primary source.", citationIDs: ["specialty_round18"])
        ],
        patientTeaching: AttributedProse(
            "We give this through your IV with a protective drug called MESNA + lots of fluids to protect your bladder. Drink lots of fluids and pee often. Tell us right away about pink / red urine, painful urination, fever, severe nausea, or breathing trouble. This medication can affect fertility — talk to us about preservation options before starting. Use reliable contraception during + after treatment.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LisdexamfetamineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lisdexamfetamine",
        title: "Lisdexamfetamine",
        subtitle: "Vyvanse · prodrug stimulant · ADHD + binge eating · Schedule II",
        category: "CNS stimulant (amphetamine prodrug)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Lysine-conjugated dexamphetamine prodrug"),
            KeyValueRow(key: "Indications", value: "ADHD ≥6 years; binge eating disorder (moderate-severe)"),
            KeyValueRow(key: "Boxed", value: "Abuse + dependence (Schedule II); CV risks; growth retardation in pediatrics"),
            KeyValueRow(key: "Notable", value: "Once-daily AM dosing; longer + smoother effect than IR amphetamine")
        ],
        indications: AttributedProse(
            "ADHD in patients ≥6 years; moderate-to-severe binge eating disorder in adults per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        mechanism: AttributedProse(
            "Prodrug — gradual hydrolysis by RBC peptidases to dextroamphetamine → blocks reuptake + promotes release of NE + dopamine in CNS → improved attention + executive function.",
            citationIDs: ["openfda_round18"]
        ),
        dosing: [
            DosingBlock(label: "ADHD", body: "30 mg PO daily AM; titrate weekly by 10–20 mg to 70 mg max per primary source.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Binge eating disorder", body: "30 mg PO daily AM; titrate to 50–70 mg.", citationIDs: ["openfda_round18"]),
            DosingBlock(label: "Renal", body: "Reduce dose in CKD; max 50 mg in CrCl 15–30; max 30 mg if dialysis.", citationIDs: ["openfda_round18"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to amphetamine; advanced atherosclerosis; symptomatic CV disease; moderate-severe HTN; hyperthyroidism; glaucoma; agitation; history of substance abuse; concurrent MAOI (within 14 days) per primary source.",
            citationIDs: ["openfda_round18"]
        ),
        warnings: [
            AttributedBullet("BOXED — abuse + dependence + diversion (Schedule II); use lowest effective dose; monitor for misuse per primary source.", citationIDs: ["openfda_round18"]),
            AttributedBullet("BOXED — sudden cardiac death + serious CV events in patients with structural heart disease.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Hypertension + tachycardia — monitor BP + HR.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Psychiatric — exacerbation of bipolar / psychosis / aggression / suicidality; monitor.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Pediatric growth — track height + weight; \"drug holidays\" considered.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Peripheral vasculopathy — Raynaud's; counsel.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Serotonin syndrome with serotonergic drugs (rare).", citationIDs: ["openfda_round18"])
        ],
        adverseReactions: AttributedProse(
            "Decreased appetite, insomnia, dry mouth, weight loss, irritability, anxiety, headache, jitteriness, hypertension, tachycardia, growth retardation in children.",
            citationIDs: ["openfda_round18"]
        ),
        drugInteractions: [
            AttributedBullet("MAOIs — within 14 days CONTRAINDICATED (hypertensive crisis).", citationIDs: ["openfda_round18"]),
            AttributedBullet("Tricyclics, SSRIs (high dose) — additive sympathomimetic.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Acidifying / alkalinizing agents — alter renal clearance.", citationIDs: ["openfda_round18"])
        ],
        nursingImplications: [
            AttributedBullet("Take in AM (insomnia if late); can be sprinkled / dissolved in water; consume immediately.", citationIDs: ["openrn_pharm_round18"]),
            AttributedBullet("Baseline BP, HR, weight, height, cardiac history, mental health screen.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Monitor periodic — BP / HR, growth in pediatrics, mood / sleep.", citationIDs: ["openfda_round18"]),
            AttributedBullet("Counsel — never share / sell prescription (controlled substance); store securely.", citationIDs: ["specialty_round18"]),
            AttributedBullet("Coordinate with mental health for comorbidities; non-stimulant alternatives if intolerant.", citationIDs: ["specialty_round18"])
        ],
        patientTeaching: AttributedProse(
            "Take in the morning. You can dissolve the capsule contents in water if needed. Tell us about chest pain, racing heart, severe anxiety, or new mood changes. This is a controlled medication — store it securely + never share it. We'll track your weight, height, and blood pressure. Take \"medication holidays\" if your provider recommends them.",
            citationIDs: ["openrn_pharm_round18"]
        ),
        citations: [openfdaR18, openrnPharmR18, specialtyR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}
