import Foundation

// Curator-model diagnosis entries (round 18 — heme/onc + neurology + pediatrics + sleep).

private let openrnDxR18 = CitationSource(
    id: "openrn_dx_round18",
    shortName: "Open RN Health Alterations + Pediatrics + Mental Health",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=hematology+oncology+neurology+pediatrics+sleep",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR18 = CitationSource(
    id: "specialty_dx_round18",
    shortName: "ASH / NCCN / AAN / AAP / AASM concept citations",
    publisher: "ASH · NCCN · AAN · AAP · AASM",
    license: .factCitationOnly,
    url: "https://www.hematology.org/education/clinicians/guidelines-and-quality-care",
    lastRetrieved: "2026-05-04"
)

private let hemeR18 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .clottingHemostasis)
private let oncR18 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let neuroR18 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let pedsR18 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let pulmR18 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)

public enum AnemiaChronicDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anemia-of-chronic-disease",
        title: "Anemia of chronic disease (anemia of inflammation)",
        subtitle: "Hepcidin-mediated · normocytic / mildly microcytic · treat underlying + selective ESA",
        nclexTags: hemeR18,
        definition: AttributedProse(
            "Anemia from chronic infection, inflammation, malignancy, autoimmune disease, CKD — second most common anemia after iron deficiency. Mediated by hepcidin upregulation reducing iron availability + suppressing erythropoiesis per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Inflammatory cytokines (IL-6) increase hepcidin → blocks ferroportin → reduced GI iron absorption + iron sequestered in macrophages → \"functional iron deficiency.\" Also reduced EPO + impaired erythropoiesis + RBC lifespan.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Mild-moderate anemia (Hgb usually 8–10 g/dL); rarely severe.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Symptoms of underlying disease often dominate.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Common contexts — CKD, RA, IBD, lupus, CHF, malignancy, chronic infection (TB, endocarditis), HIV.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Normocytic / mildly microcytic anemia; reticulocyte LOW or normal; ferritin NORMAL or HIGH (acute-phase reactant); TSAT LOW; serum iron LOW; TIBC LOW or normal per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Differentiate from iron deficiency — IDA has LOW ferritin + HIGH TIBC; ACD has normal-high ferritin + LOW TIBC.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Coexistent IDA possible — ferritin <100 (CKD / inflammation cutoff) + TSAT <20% + clinical context.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ESR / CRP often elevated; investigate underlying cause if not known.", citationIDs: ["openrn_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify + treat underlying disease — most important.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Symptom burden + comorbidities; CV stress from chronic anemia.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Coordinate with relevant specialty (rheumatology, oncology, nephrology).", citationIDs: ["openrn_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("Treat underlying disease — DMARD for RA, abx for infection, dialysis for CKD, etc.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ESA (epoetin alfa, darbepoetin) — for CKD anemia + cancer chemo anemia; target Hgb 10–11 (NOT normalize) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Iron supplementation — IV preferred in CKD on ESA; oral may not work due to hepcidin-mediated malabsorption per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Transfusion for severe symptomatic anemia — judicious; trigger Hgb 7–8 (or 8–10 in CV disease).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Newer hepcidin antagonists / HIF-PHI (roxadustat, daprodustat) — emerging therapy for CKD anemia per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AVOID over-aggressive ESA (Hgb >12) — increased CV / thrombotic / mortality risk per primary source.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("MISSED COEXISTENT IRON DEFICIENCY — common in CKD; check TSAT + ferritin + clinical context.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("OCCULT BLOOD LOSS in elderly — endoscopy + colonoscopy work-up before assuming ACD.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("ESA-induced HTN / thrombosis; pure red cell aplasia (rare).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Transfusion overload + iron loading in chronic transfusion dependence.", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ALLR18Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "all-acute-lymphoblastic",
        title: "Acute lymphoblastic leukemia (ALL)",
        subtitle: "Most common pediatric cancer · ~90% peds cure rate · BCR-ABL + MRD-guided · CAR-T option",
        nclexTags: oncR18,
        definition: AttributedProse(
            "Aggressive lymphoid malignancy from clonal proliferation of immature lymphoblasts in bone marrow + peripheral blood ± lymphoid organs. Most common cancer in children (peak 2–5 years); also in adults with worse prognosis. ~90% cure rate in pediatrics with modern chemo per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Genetic alterations (cytogenetic + molecular — Philadelphia chromosome BCR-ABL, ETV6-RUNX1, hypodiploidy, etc.) → arrested lymphoid maturation → uncontrolled proliferation of blasts → marrow failure + extramedullary infiltration.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("MARROW FAILURE — fatigue / pallor (anemia), bleeding / bruising (thrombocytopenia), fever / infections (neutropenia).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("EXTRAMEDULLARY — bone pain, lymphadenopathy, hepatosplenomegaly, mediastinal mass (T-ALL), CNS disease (headache, vomiting), testicular involvement.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("B symptoms — fever, weight loss, night sweats.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Pediatric typical age 2–5 years; adult >40 years has worse prognosis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Down syndrome — increased ALL risk.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CBC + differential — leukocytosis or leukopenia + circulating blasts; thrombocytopenia + anemia.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Bone marrow biopsy — ≥20% lymphoblasts confirms diagnosis; immunophenotyping (B-cell vs T-cell), cytogenetics, molecular testing per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CSF analysis — CNS involvement; intrathecal chemo prophylaxis routine.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Imaging — chest X-ray (mediastinal mass), testicular ultrasound (men), staging.", citationIDs: ["openrn_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Stabilize marrow failure — transfusion + neutropenic precautions + isolation.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Tumor lysis prevention — hydration + allopurinol / rasburicase + electrolyte monitoring per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Coordinate hematology / oncology + pediatric team + transplant evaluation.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Mental health + psychosocial — newly diagnosed family support.", citationIDs: ["openrn_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("MULTI-PHASE CHEMOTHERAPY — induction (vincristine, anthracycline, asparaginase, steroids) → consolidation → CNS prophylaxis (intrathecal chemo + cranial RT in select) → maintenance (mercaptopurine + MTX × 2–3 years) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MRD (minimal residual disease) — guides intensification + transplant decisions per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("PHILADELPHIA-POSITIVE ALL — add tyrosine kinase inhibitor (imatinib, dasatinib, ponatinib) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CD19+ relapsed/refractory — blinatumomab (BiTE), inotuzumab (CD22 ADC), CAR-T (tisagenlecleucel) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ALLOGENEIC HSCT — high-risk + relapsed disease.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Supportive — transfusions, neutropenic precautions, infection prophylaxis (TMP-SMX for PJP, antifungal, antiviral), G-CSF.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Tumor lysis syndrome prevention — IV hydration + allopurinol or rasburicase per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Long-term — fertility preservation, monitoring late effects (cardiac, pulmonary, neurocognitive, secondary malignancy).", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("TUMOR LYSIS SYNDROME — hyperuricemia + hyperkalemia + hyperphosphatemia + hypocalcemia + AKI; aggressive prevention + treatment.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("FEBRILE NEUTROPENIA — emergency; broad-spectrum abx within 1 hour per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CYTOKINE RELEASE SYNDROME / ICANS with CAR-T / blinatumomab — tocilizumab + supportive care per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("RELAPSE — particularly CNS / testicular sites; standard prophylaxis.", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AMLSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "aml-acute-myeloid",
        title: "Acute myeloid leukemia (AML)",
        subtitle: "Adult acute leukemia · 7+3 induction · APL distinct (ATRA + arsenic) · transplant for high-risk",
        nclexTags: oncR18,
        definition: AttributedProse(
            "Aggressive myeloid malignancy from proliferation of myeloblasts. Most common acute leukemia in adults (median age 65–70). Classified by morphology + cytogenetics + molecular markers per WHO. APL (M3) is unique subtype with distinct treatment per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Driver mutations (FLT3, NPM1, IDH1/2, TP53, complex karyotypes) → arrested myeloid differentiation → blast proliferation → marrow failure + extramedullary infiltration.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Marrow failure — fatigue / pallor, bleeding / bruising, fever / infections.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Hyperleukocytosis (WBC >100,000) — leukostasis: dyspnea, AMS, retinal hemorrhages, priapism, end-organ ischemia — emergency.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Gum hypertrophy (M5 monocytic), chloromas (extramedullary), DIC (especially APL).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("APL — DIC + bleeding common at presentation; emergent ATRA per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Older adults often have antecedent MDS / chemotherapy / radiation history.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CBC + diff with circulating blasts; bone marrow ≥20% myeloblasts; immunophenotyping (CD33, CD34, MPO+); cytogenetics; molecular profiling (FLT3, NPM1, IDH1/2 etc.) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("APL — t(15;17) PML-RARα fusion; immediate ATRA empirically before confirmation in suspected.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Coags + fibrinogen — APL DIC workup.", citationIDs: ["specialty_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Hyperleukocytosis — leukostasis emergent; leukapheresis / hydroxyurea / induction.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("APL coagulopathy — emergent ATRA + replace fibrinogen + platelets per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Comorbidity assessment — fitness for intensive therapy vs lower-intensity vs HSCT.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("INDUCTION (fit adults non-APL) — \"7+3\" — cytarabine 7 days + anthracycline (daunorubicin / idarubicin) 3 days per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("APL — ATRA + arsenic trioxide (low-intermediate risk) OR ATRA + chemo (high-risk); curable >90% per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CONSOLIDATION — high-dose cytarabine cycles after CR.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ALLOGENEIC HSCT — high-risk cytogenetics, refractory disease, second remission.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("TARGETED — FLT3 inhibitors (midostaurin, gilteritinib); IDH1/2 inhibitors (ivosidenib, enasidenib); BCL-2 inhibitor venetoclax + HMAs (azacitidine) for unfit patients per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("UNFIT / older — venetoclax + azacitidine; lower-intensity therapy.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Supportive — transfusions, neutropenic precautions, antimicrobial prophylaxis, growth factors.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Tumor lysis prophylaxis — hydration + allopurinol / rasburicase.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("APL DIFFERENTIATION SYNDROME — fever, dyspnea, pulmonary infiltrates, weight gain, hypotension; corticosteroids + supportive care per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("LEUKOSTASIS — emergency cytoreduction.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("FEBRILE NEUTROPENIA — broad-spectrum abx <1 hour.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Long-term — late effects from anthracycline (cardiomyopathy), HSCT (GVHD).", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum CLLSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cll-chronic-lymphocytic",
        title: "Chronic lymphocytic leukemia (CLL)",
        subtitle: "Indolent B-cell · BTK inhibitors + venetoclax · watch-and-wait early stage",
        nclexTags: oncR18,
        definition: AttributedProse(
            "Indolent B-cell lymphoproliferative disorder of mature monoclonal B lymphocytes. Most common adult leukemia in Western countries. Same disease as small lymphocytic lymphoma (SLL) — different presentation. Heterogeneous course; often watch-and-wait for early-stage per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Clonal expansion of mature CD5+ / CD19+ / CD23+ B cells with characteristic molecular markers (IGHV mutational status, TP53, del17p, del11q). Indolent in many; aggressive in TP53 / unmutated IGHV.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Often asymptomatic — found on routine CBC with lymphocytosis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Lymphadenopathy (painless, generalized), hepatosplenomegaly.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Cytopenias from marrow infiltration (late) or autoimmune (AIHA, ITP).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("B symptoms uncommon early; recurrent infections from hypogammaglobulinemia.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Older adults (median 70).", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Persistent monoclonal B-cell lymphocytosis ≥5,000 with characteristic immunophenotype (CD5+, CD19+, CD23+, weak surface Ig) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CT staging + bone marrow + IGHV mutation status + FISH (del17p, del11q, +12, del13q) + TP53 sequencing for treatment planning per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Rai or Binet staging.", citationIDs: ["openrn_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom burden + cytopenia + comorbidities (CIRS / fitness assessment for therapy).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Infection screening + immunization (inactivated only).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Routine vs deferred — many patients never need treatment.", citationIDs: ["openrn_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("WATCH-AND-WAIT — asymptomatic early-stage; periodic monitoring.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("INITIATE TREATMENT for cytopenia, symptomatic adenopathy / splenomegaly, B symptoms, or rapid lymphocyte doubling per IWCLL criteria per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("FIRST-LINE — BTK inhibitors (ibrutinib, acalabrutinib, zanubrutinib) — chronic; OR venetoclax + obinutuzumab × 12 months (time-limited) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("RELAPSED — combination + sequencing per genomic profile; CAR-T evaluation.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AVOID FCR (chemo) in 2026 era except select cases per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AUTOIMMUNE complications (AIHA / ITP) — corticosteroids, IVIG, rituximab.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Hypogammaglobulinemia — IVIG replacement if recurrent infections per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Vaccinations — pneumococcal, flu, shingles (recombinant only — Shingrix), COVID; AVOID live vaccines.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Skin cancer surveillance — markedly increased risk.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("RICHTER TRANSFORMATION — aggressive lymphoma (DLBCL or HL); poor prognosis; aggressive treatment per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AUTOIMMUNE CYTOPENIAS — distinct from disease infiltration; treat differently.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("INFECTIONS (especially encapsulated organisms + opportunistic) — prophylaxis + early aggressive treatment.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("BTK INHIBITOR side effects — atrial fibrillation, bleeding (especially with antiplatelets), hypertension.", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum NHLSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "non-hodgkin-lymphoma",
        title: "Non-Hodgkin lymphoma (NHL)",
        subtitle: "Heterogeneous · DLBCL most common · R-CHOP · CAR-T for relapsed/refractory",
        nclexTags: oncR18,
        definition: AttributedProse(
            "Heterogeneous group of B-cell + T-cell + NK-cell lymphoid malignancies. ~85% are B-cell. Diffuse large B-cell lymphoma (DLBCL) is most common (~30%); follicular, mantle cell, marginal zone, Burkitt, peripheral T-cell among others. Treatment + prognosis vary widely per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Clonal proliferation from B-cell or T-cell at various stages of differentiation. Pathogenic factors — viral (EBV in Burkitt + endemic, HTLV-1 in ATLL, HIV-related), translocations (t(14;18) follicular, t(8;14) Burkitt), chronic inflammation / autoimmunity (MALT, gastric H. pylori).",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Painless lymphadenopathy — most common; localized or generalized.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("B symptoms — fever >38°C, drenching night sweats, ≥10% weight loss in 6 months.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Extranodal — GI (gastric MALT, intestinal), CNS, skin, testes, sinus, bone marrow.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Burkitt — rapid doubling (24–48 hr); jaw mass (endemic); abdominal mass (sporadic).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Risk factors — immunosuppression (HIV, transplant), chronic infection, autoimmune.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EXCISIONAL LYMPH NODE BIOPSY (preferred over needle); immunohistochemistry, flow cytometry, FISH, molecular studies per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("PET-CT staging (Ann Arbor); bone marrow biopsy; CSF for high-risk + extranodal.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("LDH + IPI score for prognostication.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("HIV / hepatitis B/C testing; pregnancy testing.", citationIDs: ["specialty_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Subtype classification — guides treatment + prognosis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Tumor lysis syndrome risk in high-burden / aggressive lymphomas.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Cardiac assessment (echo) before anthracycline-containing regimens.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("DLBCL — R-CHOP × 6 (rituximab + cyclophosphamide + doxorubicin + vincristine + prednisone) ± consolidative RT per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Follicular lymphoma — watch-and-wait if asymptomatic low-burden; rituximab ± chemotherapy when symptomatic per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Mantle cell — intensive chemo + autologous HSCT consolidation; BTK inhibitors (ibrutinib).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Burkitt — intensive chemo (CODOX-M/IVAC or DA-EPOCH-R) with CNS prophylaxis; rapid TLS prevention.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MALT — H. pylori treatment for gastric MALT (often resolves); RT for localized.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("RELAPSED / REFRACTORY DLBCL — autologous HSCT (1st salvage) OR CAR-T (axi-cel, tisa-cel, liso-cel) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Bispecific antibodies (mosunetuzumab, glofitamab, epcoritamab) emerging.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Supportive — TLS prophylaxis, neutropenic precautions, growth factors, vaccinations, infection prophylaxis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Long-term surveillance — response monitoring, secondary malignancies, cardiac, fertility, neurocognitive.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("TUMOR LYSIS SYNDROME — high-burden / aggressive lymphomas; aggressive prevention.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("FEBRILE NEUTROPENIA — emergency.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CRS / ICANS post-CAR-T — tocilizumab + steroids + supportive care per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ANTHRACYCLINE CARDIOTOXICITY — echo monitoring; cumulative dose limits.", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ParkinsonsSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "parkinsons-disease",
        title: "Parkinson's disease",
        subtitle: "TRAP tetrad · idiopathic dopaminergic neurodegeneration · levodopa + multidisciplinary",
        nclexTags: neuroR18,
        definition: AttributedProse(
            "Progressive neurodegenerative disorder of dopaminergic neurons in substantia nigra → motor + non-motor symptoms. Most common movement disorder in older adults; mean onset 60s. No cure; symptomatic management with multidisciplinary care extends function + quality of life per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Loss of dopaminergic neurons in substantia nigra pars compacta (~70% lost before symptoms manifest) → reduced striatal dopamine → impaired basal ganglia motor circuits. α-synuclein aggregates (Lewy bodies + neurites) characteristic.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("MOTOR (TRAP tetrad) — Tremor (resting, pill-rolling, asymmetric), Rigidity (cogwheel), Akinesia / bradykinesia, Postural instability (later).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Asymmetric onset typical; gait — short shuffling steps, festination, freezing.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Mask-like facies, hypophonia, micrographia, stooped posture.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("NON-MOTOR — REM sleep behavior disorder (often precedes motor by years), constipation, anosmia, depression, anxiety, cognitive impairment / dementia (~30%), autonomic dysfunction (orthostasis, urinary), psychosis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Risk factors — age, family history, pesticide exposure, MPTP exposure.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis — bradykinesia + ≥1 of (rest tremor, rigidity, postural instability) + asymmetric onset + sustained levodopa response per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MDS criteria — supportive features, exclusion criteria, red flags for atypical parkinsonism.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("DAT-SPECT (DaTscan) — confirms presynaptic dopamine deficit; rules out essential tremor / drug-induced.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Differentiate from atypical (PSP, MSA, CBD, DLB, vascular parkinsonism) — different prognosis + response.", citationIDs: ["specialty_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Motor symptom severity (UPDRS); functional impact; falls risk.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Non-motor screening — depression / anxiety, cognition, sleep, autonomic, GI.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Medication review — drugs that worsen PD (typical antipsychotics, metoclopramide, prochlorperazine).", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("LEVODOPA-CARBIDOPA — gold standard for motor symptoms; titrate per response per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("DOPAMINE AGONISTS (ropinirole, pramipexole, rotigotine patch) — adjunct or initial in younger patients (delays dyskinesias) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MAO-B INHIBITORS (selegiline, rasagiline, safinamide) — adjunct; mild monotherapy effect.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("COMT INHIBITORS (entacapone, opicapone) — extends levodopa duration.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AMANTADINE — dyskinesia reduction.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("DEEP BRAIN STIMULATION (DBS) — STN or GPi for advanced disease with motor fluctuations + dyskinesias per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MULTIDISCIPLINARY — physical therapy (LSVT BIG), speech (LSVT LOUD), occupational therapy, social work, palliative care.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Treat non-motor — pimavanserin or quetiapine (clozapine) for psychosis; rivastigmine for dementia; SSRIs for depression; CPAP if OSA per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Dietary protein timing for levodopa absorption.", citationIDs: ["openrn_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("FALLS — major morbidity; PT + home modifications.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("PARKINSONISM-HYPERPYREXIA SYNDROME — abrupt levodopa discontinuation → fever + rigidity + AMS; emergency.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ASPIRATION — dysphagia in advanced disease; speech-language eval.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("IMPULSE CONTROL DISORDERS on dopamine agonists; counsel + monitor.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AVOID metoclopramide, prochlorperazine, typical antipsychotics — worsen PD per primary source.", citationIDs: ["specialty_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum HuntingtonSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "huntington-disease",
        title: "Huntington's disease",
        subtitle: "Autosomal dominant CAG repeat · chorea + cognitive + psych · genetic counseling pivotal",
        nclexTags: neuroR18,
        definition: AttributedProse(
            "Autosomal dominant neurodegenerative disorder caused by CAG trinucleotide repeat expansion in HTT gene → mutant huntingtin protein → progressive neuronal loss (caudate / putamen prominent). Typical onset 30–50 years. 100% penetrance with ≥40 repeats per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "CAG repeat expansion (>36 in HTT gene) → polyglutamine tract in huntingtin protein → toxic aggregates → neuronal dysfunction + apoptosis (medium spiny neurons of striatum predominantly). Anticipation — repeat expands across generations (paternal > maternal).",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("MOTOR — chorea (involuntary jerky movements), motor incoordination, dysarthria, dysphagia, eventually dystonia + rigidity + bradykinesia (advanced).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("COGNITIVE — executive dysfunction, attention, memory; eventual dementia.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("PSYCHIATRIC — depression (very common, suicide risk), apathy, irritability, anxiety, OCD-like, psychosis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Juvenile HD (Westphal variant) — onset <20, more rigidity than chorea, paternal inheritance, larger CAG expansions.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Family history (autosomal dominant, may be unknown / hidden due to stigma).", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("GENETIC TESTING — CAG repeat count in HTT gene; ≥40 confirms diagnosis (high penetrance); 36–39 reduced penetrance per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Clinical criteria — characteristic motor + cognitive + psychiatric features + family history (often).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("MRI — caudate atrophy (later in disease).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Pre-symptomatic testing — genetic counseling MANDATORY before; ethical + psychiatric implications per primary source.", citationIDs: ["specialty_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Genetic counseling — patient + family; pre-test counseling for at-risk relatives.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("SUICIDE risk — depression + cognitive decline; ongoing assessment.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Reproductive counseling — preimplantation diagnosis options; testing of children controversial.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("CHOREA — tetrabenazine, deutetrabenazine, valbenazine (VMAT2 inhibitors); risk of depression + suicidality + parkinsonism per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("PSYCHIATRIC — SSRIs for depression / OCD; atypical antipsychotics (olanzapine, risperidone) for psychosis + chorea + irritability.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Avoid typical antipsychotics for chorea (extrapyramidal worsening).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Multidisciplinary — neurology, psychiatry, genetic counseling, PT, OT, speech, dietitian, social work, palliative care, hospice.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Aspiration prevention — speech evaluation, diet modification, PEG late-stage.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Caloric requirements increased due to chorea — high-calorie diet.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Family + caregiver support — significant burden; respite + counseling.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Disease-modifying therapies in trials (antisense oligonucleotides — recent failures); none currently approved per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Advance care planning while cognitively able.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("SUICIDE — peak risks at diagnosis + advanced disease; ongoing screening + safety planning.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("ASPIRATION pneumonia — common cause of death.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("WEIGHT LOSS — high caloric needs + dysphagia.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("CAREGIVER BURDEN — connect to support; respite; long-term care planning.", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ALSSampleR18 {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "als-amyotrophic",
        title: "Amyotrophic lateral sclerosis (ALS)",
        subtitle: "UMN + LMN motor neuron loss · respiratory failure terminal · multidisciplinary + early NIV / PEG",
        nclexTags: neuroR18,
        definition: AttributedProse(
            "Progressive neurodegenerative disorder of upper + lower motor neurons → muscle weakness + atrophy + spasticity → respiratory failure (most common terminal event). Typical onset 50–65; median survival 3–5 years from symptom onset; ~10% live >10 years. ~10% familial (SOD1, C9orf72) per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Selective degeneration of upper motor neurons (motor cortex, corticospinal tracts) + lower motor neurons (anterior horn, brainstem). Mechanisms — protein aggregation (TDP-43, FUS), excitotoxicity, oxidative stress, mitochondrial dysfunction, neuroinflammation.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Asymmetric limb weakness — most common onset (~70%); fasciculations, atrophy, cramps.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("BULBAR ONSET (~25%) — dysarthria, dysphagia, tongue fasciculations + atrophy; worse prognosis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("UMN signs — hyperreflexia, spasticity, Babinski; LMN signs — atrophy, fasciculations, weakness.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Respiratory — early weakness in diaphragm + accessory; orthopnea early, eventually respiratory failure.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("PRESERVED — typically eye movements + bowel / bladder + sensation.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Frontotemporal dementia (FTD) overlap — ~15% with ALS.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Pseudobulbar affect — emotional incontinence (laughing/crying inappropriate to context).", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("El Escorial / Awaji-Shima criteria — combination of UMN + LMN signs across multiple regions (bulbar, cervical, thoracic, lumbosacral) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("EMG / NCS — denervation + chronic reinnervation; rules out other neuropathies.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MRI — rule out structural cord / brain causes.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Genetic testing — familial cases or younger onset.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Differentiate from cervical myelopathy, MS, MMN, IBM, Kennedy disease, paraneoplastic syndromes.", citationIDs: ["specialty_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Respiratory function — FVC, MIP, MEP; baseline + every 2–3 months; nocturnal hypoventilation symptoms.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Bulbar function — speech, swallow; aspiration risk.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Mobility + functional independence (ALSFRS-R).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Mood + cognitive screening.", citationIDs: ["openrn_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("RILUZOLE 50 mg PO BID — modest survival benefit (2–3 months) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("EDARAVONE — IV / oral; reduces functional decline rate in subset; specific eligibility per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Tofersen — for SOD1-mutated ALS; antisense oligonucleotide approved 2023 per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("EARLY NON-INVASIVE VENTILATION (BiPAP) — when FVC <50% OR symptomatic; improves survival + QoL per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("PEG TUBE — when dysphagia significant + before FVC <50% (to reduce procedure risk) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Mechanical insufflation-exsufflation (cough assist) for secretion management.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Symptom management — baclofen / tizanidine for spasticity; sialorrhea (atropine drops, glycopyrrolate, botulinum); pseudobulbar affect (dextromethorphan-quinidine); pain (multimodal).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MULTIDISCIPLINARY ALS CLINIC — neurology, pulm, GI, OT, PT, speech, social work, palliative care; improves outcomes per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Adaptive equipment + AAC devices for communication.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Advance care planning early — including tracheostomy decision; hospice / palliative integration.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("RESPIRATORY FAILURE — most common terminal event; early NIV improves survival.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ASPIRATION pneumonia — bulbar dysfunction; PEG before severe weight loss.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("DEPRESSION + caregiver burden — high; mental health support throughout.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Tracheostomy decision — quality vs quantity; advance care discussions before emergency.", citationIDs: ["specialty_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PediatricSepsisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-sepsis",
        title: "Pediatric sepsis + septic shock",
        subtitle: "Phoenix criteria 2024 · 1-hour bundle · early aggressive resuscitation · age-specific vitals",
        nclexTags: pedsR18,
        definition: AttributedProse(
            "Life-threatening organ dysfunction caused by dysregulated host response to infection in patients ≤18 years. Phoenix Sepsis Criteria (2024) replaced pSOFA-based definitions. Septic shock = sepsis + cardiovascular dysfunction. Time-critical — outcomes depend on rapid recognition + bundled resuscitation per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Pathogen-associated molecular patterns + damage-associated molecular patterns → exaggerated immune response → endothelial dysfunction + microvascular thrombosis + capillary leak → tissue hypoperfusion + organ failure. Children compensate longer than adults via tachycardia + vasoconstriction → \"warm shock\" → \"cold shock\" + decompensation.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Fever or hypothermia; tachycardia (age-adjusted); tachypnea; altered mental status; capillary refill >2 sec.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Warm shock (early) — bounding pulses, flash capillary refill, warm extremities; vs Cold shock (late) — weak pulses, cool extremities, prolonged refill.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("HYPOTENSION is LATE finding in children — do not wait; \"compensated shock\" is key recognition.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Common sources — UTI / pyelonephritis, pneumonia, meningitis, intra-abdominal, CLABSI in CVC, skin/soft tissue, Kawasaki / MISC, post-surgical.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Neonates — vague (lethargy, poor feeding, hypothermia, jaundice); maternal GBS / E. coli / Listeria / HSV common.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Phoenix criteria — score ≥2 with infection (respiratory, cardiovascular, coagulation, neurologic dysfunction); separate definition for septic shock per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Lactate, blood culture (×2), urinalysis + culture, CBC, CMP, ABG, coags, procalcitonin (selective).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("CXR / abdominal imaging / LP per source suspicion; consider HSV PCR in neonates per primary source.", citationIDs: ["specialty_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Age-adjusted vital signs + capillary refill + mental status; reassess frequently.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Source identification + control (drain abscess, remove infected line).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Coordinate with PICU + ID specialist.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("FIRST HOUR BUNDLE — recognize within 5 min, blood cultures + IV access + empiric abx within 1 hour, IV fluid bolus 10–20 mL/kg crystalloid (up to 60 mL/kg titrated), reassess after each per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("FLUID OVERLOAD WATCH — hepatomegaly, rales, increased WOB; halt boluses if fluid overload signs per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ANTIBIOTICS empirically based on age + risk — neonates ampicillin + gentamicin ± acyclovir ± cefotaxime; older children ceftriaxone ± vancomycin per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("VASOPRESSOR — fluid-refractory shock (after 40–60 mL/kg) — epinephrine first-line for cold shock; norepinephrine for warm shock per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("HYDROCORTISONE — for adrenal insufficiency / catecholamine-refractory shock per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Source control — drainage, line removal, surgery as needed.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ICU-level care; mechanical ventilation if needed; CRRT for AKI / acidosis.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Family-centered communication + presence during resuscitation.", citationIDs: ["openrn_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("RAPID DETERIORATION — children compensate then crash; sustained vigilance.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("FLUID OVERLOAD — hepatomegaly, rales; halt + diurese if not improving with fluids.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MENINGOCOCCAL / TOXIC SHOCK — purpura fulminans, rapid DIC; emergent abx + intensive support.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("NEONATAL HSV — empiric acyclovir if any risk factor / atypical presentation per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MISC (post-COVID-19) — Kawasaki-like + cardiac involvement; aggressive immunomodulation per primary source.", citationIDs: ["specialty_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PediatricDKASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-dka",
        title: "Pediatric diabetic ketoacidosis (DKA)",
        subtitle: "Cerebral edema highest risk · slow rehydration · 1.5× maintenance · cautious correction",
        nclexTags: pedsR18,
        definition: AttributedProse(
            "Hyperglycemic ketoacidotic crisis in children with type 1 (most common) or type 2 DM. Higher mortality + cerebral edema risk than adults — children are NOT \"small adults\" in DKA management. Often presenting feature of new-onset T1DM (~30%) per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Insulin deficiency → hyperglycemia + osmotic diuresis + dehydration; counter-regulatory hormones → lipolysis → ketogenesis → metabolic acidosis. Pediatric brain susceptible to osmotic shifts → cerebral edema risk during rehydration.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Polyuria / polydipsia / polyphagia / weight loss (T1DM new-onset) — preceding days-weeks.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Vomiting, abdominal pain (often mimics surgical abdomen), Kussmaul respirations, fruity breath.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Dehydration (5–10%); altered mental status; tachycardia + hypotension late.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Severity — mild pH 7.20–7.30, moderate 7.10–7.20, severe <7.10.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Precipitants — missed insulin, infection, pump failure, growth spurts, stress, eating disorders, new-onset diabetes.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Glucose >200 mg/dL + venous pH <7.30 OR HCO3 <15 + ketonemia (β-OHB) or ketonuria per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Workup — VBG, glucose, electrolytes (especially K + phosphate), BUN/Cr, β-OHB, urinalysis, A1c (new-onset assessment).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Search for precipitant — infection workup, eating disorder screening.", citationIDs: ["openrn_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Mental status — neuro exam q1h; cerebral edema risk during rehydration.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Cardiac monitoring + electrolyte trending; potassium critical.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Source identification + family education for new-onset.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("PICU admission for severe DKA / young age / altered mental status.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("FLUID — initial bolus 10 mL/kg NS (max 500 mL) over 30–60 min; replace deficit + maintenance over 24–48 hours; avoid rapid correction (cerebral edema risk) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("INSULIN — 0.05–0.1 unit/kg/hr IV; do NOT bolus (cerebral edema); start ≥1 hour after fluids initiated per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("POTASSIUM — repletion when K+ <5.5 + adequate urine output; insulin drives K+ into cells; HYPOKALEMIA before insulin can cause cardiac arrest per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("DEXTROSE — add when glucose drops to ~250–300 mg/dL; continue insulin until acidosis resolved + HCO3 normalized.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AVOID bicarbonate routine use — increases cerebral edema risk; only severe acidosis with HD compromise per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Phosphate replacement if severely low; magnesium maintenance.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Hourly neuro checks + glucose; q2h electrolytes initially.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Transition to SQ insulin when DKA resolved (pH >7.30, HCO3 >15, β-OHB <0.6, can eat) — overlap by 30 min before stopping infusion.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Family education for new-onset T1DM — multidisciplinary diabetes team.", citationIDs: ["openrn_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("CEREBRAL EDEMA — leading cause of pediatric DKA mortality; signs: headache, lethargy, vomiting, irritability, bradycardia, HTN, AMS; emergent IV mannitol or hypertonic saline + reduce IV rate per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("HYPOKALEMIC ARREST — confirm + replete K+ before / during insulin.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Hypoglycemia — add dextrose at 250–300; continue insulin to clear ketones.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Recurrence in adolescent T1DM — psychosocial issues, diabulimia, missed doses; address.", citationIDs: ["specialty_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PediatricMeningitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-meningitis",
        title: "Pediatric bacterial meningitis",
        subtitle: "Empiric abx within 1 hour · DEXAMETHASONE before / with abx · contact tracing",
        nclexTags: pedsR18,
        definition: AttributedProse(
            "Bacterial inflammation of meninges in children. Common pathogens vary by age — neonatal: GBS, E. coli, Listeria, HSV; older infants/children: S. pneumoniae, N. meningitidis, H. influenzae b (now rare). Time-critical — empirical antibiotics within 1 hour per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Hematogenous spread or direct extension → bacterial colonization of CSF → inflammatory response → cerebral edema + increased ICP + cortical injury. Cytokine storm contributes to neurologic sequelae.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Older children — fever + headache + neck stiffness + photophobia + vomiting + altered mental status.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Infants / neonates — vague — lethargy, poor feeding, vomiting, irritability, fever / hypothermia, bulging fontanelle.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Petechiae / purpura → meningococcal meningitis emergency.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Seizures (~20%); cranial nerve palsies; focal deficits suggest abscess / complications.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Kernig + Brudzinski signs less reliable in young children.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("LP with CSF analysis — opening pressure, cell count + diff, protein, glucose, Gram stain, culture, PCR (HSV / enterovirus / meningococcus / pneumococcus / H. flu) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Bacterial CSF — WBC >1000 (PMN predominant), low glucose (<40 or CSF/serum <0.4), elevated protein.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("CT before LP — only if focal deficit / immunocompromised / increased ICP signs / new seizure / age >60 (less applicable peds).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Blood cultures + CBC + electrolytes + coags + procalcitonin.", citationIDs: ["openrn_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamics + airway + neuro status; emergency management.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Identify petechial / purpuric rash — meningococcal sepsis emergency.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Coordinate ID + neuro + PICU + public health.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("EMPIRIC ABX WITHIN 1 HOUR — based on age — neonates ampicillin + cefotaxime (+ acyclovir if HSV concern); 1–3 months ampicillin + ceftriaxone + vancomycin; >3 months ceftriaxone + vancomycin per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("DEXAMETHASONE 0.15 mg/kg IV BEFORE / WITH first dose of abx — reduces hearing loss + neurologic sequelae in H. flu + pneumococcal per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("AVOID delaying abx for LP — start abx if LP delayed, blood cultures first if possible.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CONTACT TRACING + PROPHYLAXIS — meningococcal (rifampin, ciprofloxacin, ceftriaxone for close contacts) + H. influenzae b (rifampin) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ICU monitoring; treat increased ICP (mannitol, hypertonic saline, head elevation, sedation, hyperventilation transient).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Seizure management — benzodiazepines + levetiracetam; EEG.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Audiology assessment after recovery — hearing loss common sequela.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Public health REPORTING required.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Vaccinations afterward — pneumococcal + meningococcal + Hib if not up-to-date.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("INCREASED ICP / herniation — emergent treatment.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("MENINGOCOCCAL SEPSIS / WATERHOUSE-FRIDERICHSEN — adrenal hemorrhage + DIC + shock; intensive care.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("HEARING LOSS / NEURO SEQUELAE — long-term follow-up + audiology + developmental assessment per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("RECURRENT MENINGITIS — CSF leak / immunodeficiency / anatomic abnormality workup.", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AplasticAnemiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "aplastic-anemia",
        title: "Aplastic anemia",
        subtitle: "Bone marrow failure · pancytopenia · ATG + cyclosporine OR HSCT · transfusion + abx",
        nclexTags: hemeR18,
        definition: AttributedProse(
            "Pancytopenia from bone marrow failure with hypocellular marrow. Severe AA — ANC <500 + plt <20K + retic <60K (or <20K corrected). Most cases idiopathic / autoimmune; some inherited (Fanconi anemia, dyskeratosis congenita) or secondary (drugs, viruses, radiation) per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Acquired — autoreactive T cells destroy hematopoietic stem cells. Inherited — DNA repair defects (Fanconi), telomere maintenance defects (dyskeratosis). End result — quantitative + qualitative HSC deficit → pancytopenia.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Anemia — fatigue, pallor, dyspnea.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Thrombocytopenia — petechiae, mucosal bleeding, ecchymoses.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Neutropenia — recurrent infections, fever, mouth ulcers.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("NO lymphadenopathy / hepatosplenomegaly typically (vs leukemia / lymphoma).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Inherited — physical anomalies (Fanconi — short stature, café-au-lait spots, thumb anomalies; dyskeratosis — abnormal nails, leukoplakia, reticular pigmentation).", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Pancytopenia + hypocellular bone marrow biopsy (<25% cellularity) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Severity — severe, very severe, non-severe per Camitta criteria.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Workup — flow cytometry for PNH clone (associated), telomere length, chromosome breakage analysis (Fanconi), screen for HBV/HCV/HIV/EBV/CMV/parvovirus.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Drug + toxin history — chloramphenicol, NSAIDs, anticonvulsants, gold, benzene, radiation.", citationIDs: ["openrn_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity stratification → urgency of definitive therapy.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("HLA typing for HSCT consideration; identify potential donors.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Family screening if inherited.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("HSCT — definitive cure; matched sibling donor first-line for severe AA in young patients per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("IMMUNOSUPPRESSION — horse ATG + cyclosporine ± eltrombopag for those not eligible for HSCT or as bridge per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ELTROMBOPAG — augments response when added to ATG/CSA per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Supportive — RBC + platelet transfusions (irradiated, leukoreduced, CMV-safe), G-CSF for febrile neutropenia, antibiotics + antifungal prophylaxis, infection treatment.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Iron chelation for transfusion-dependent (deferasirox).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Avoid blood from family members if HSCT considered — alloimmunization risk.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Inherited AA — different treatment approach + family / fertility counseling.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("LIFE-THREATENING INFECTION — neutropenic fever; aggressive abx within 1 hour.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("BLEEDING — platelet transfusion goals (>10 prophylactic, >20 in fever, >50 with bleeding / procedure) per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("PROGRESSION TO MDS / AML / PNH — long-term surveillance.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("HSCT complications — GVHD, graft failure, infection, secondary malignancy.", citationIDs: ["openrn_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum PNHSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "paroxysmal-nocturnal-hemoglobinuria",
        title: "Paroxysmal nocturnal hemoglobinuria (PNH)",
        subtitle: "Acquired GPI-anchor defect · intravascular hemolysis + thrombosis · ECULIZUMAB + meningococcal vaccine",
        nclexTags: hemeR18,
        definition: AttributedProse(
            "Acquired clonal hematologic disorder from PIGA gene mutation in HSCs → loss of GPI-anchored complement regulators (CD55, CD59) → complement-mediated intravascular hemolysis + thrombosis. Rare; presents with hemolytic anemia, thrombosis, marrow failure. Eculizumab + ravulizumab transformed prognosis per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Somatic PIGA mutation → defective GPI-anchor synthesis → loss of CD55 + CD59 (complement regulators) on RBC + WBC + platelet surface → terminal complement-mediated hemolysis (C5b-9 / MAC) + procoagulant phenotype.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Intravascular hemolysis — hemoglobinuria (often morning — \"nocturnal\"), fatigue, dyspnea, dysphagia (smooth muscle dystonia), erectile dysfunction, abdominal pain.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("THROMBOSIS — venous (atypical sites — hepatic Budd-Chiari, mesenteric, cerebral venous, dermal); 40% lifetime risk; leading cause of death.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Bone marrow failure — overlapping with aplastic anemia + MDS.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("CKD — hemoglobinuria-induced renal injury.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Pulmonary HTN — chronic.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("FLOW CYTOMETRY for GPI-anchored proteins (CD55, CD59 on RBCs; FLAER on WBCs) — gold standard per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Hemolytic markers — elevated LDH, indirect bilirubin, low haptoglobin, hemoglobinuria.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Coombs negative (NOT autoimmune).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Bone marrow — variable; assess for aplastic anemia / MDS overlap.", citationIDs: ["specialty_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("Clone size + symptom severity — drives treatment intensity.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Thrombosis screening + prevention.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Coordinate hematology + transplant evaluation.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("ECULIZUMAB OR RAVULIZUMAB — anti-C5 monoclonal antibody; reduces hemolysis + thrombosis + transfusion need + improves survival per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MENINGOCOCCAL VACCINATION (MenACWY + MenB) ≥2 weeks before C5 inhibitor — REMS per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Pegcetacoplan — proximal C3 inhibitor; alternative for refractory hemolysis on eculizumab.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Iron + folate supplementation; transfusions as needed.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Anticoagulation for thrombosis events; primary prophylaxis controversial — most use C5 inhibitor instead.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("ALLOGENEIC HSCT — curative; reserved for severe / refractory / overlapping AA.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Supportive — antibiotic prophylaxis (penicillin) for asplenic-like risk; pregnancy planning + close monitoring.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Patient + family education — REMS card + emergency action plan.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("MENINGOCOCCAL INFECTION — REMS warning; emergent abx for fever in eculizumab patient.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("BREAKTHROUGH HEMOLYSIS — switch to longer-acting (ravulizumab) or proximal C3 inhibitor.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("THROMBOSIS at unusual sites — Budd-Chiari, cerebral venous; emergent imaging + anticoagulation.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("PREGNANCY — high-risk; eculizumab pregnancy-safe but complications possible.", citationIDs: ["specialty_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum OSAR18Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "osa-obstructive-sleep-apnea",
        title: "Obstructive sleep apnea (OSA)",
        subtitle: "Repetitive upper airway collapse · CPAP first-line · CV / metabolic comorbidities",
        nclexTags: pulmR18,
        definition: AttributedProse(
            "Recurrent partial / complete upper airway collapse during sleep → intermittent hypoxia + hypercapnia + sleep fragmentation. Severity by AHI — mild 5–14, moderate 15–29, severe ≥30 events/hour. Strong association with CV disease, T2DM, mood disorders, MVA risk per primary source.",
            citationIDs: ["openrn_dx_round18", "specialty_dx_round18"]
        ),
        pathophysiology: AttributedProse(
            "Anatomical narrowing + reduced pharyngeal muscle tone during sleep → airway collapse → desaturation + arousal → fragmented sleep + sympathetic activation. Risk factors — obesity (especially central / neck), male sex, age, craniofacial anatomy, alcohol / sedatives, hypothyroidism.",
            citationIDs: ["openrn_dx_round18"]
        ),
        presentation: [
            AttributedBullet("Loud snoring, witnessed apneas (often by partner), gasping awakenings.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Daytime sleepiness (Epworth scale), morning headaches, dry mouth, irritability, cognitive impairment.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Nocturia, GERD worsening, depression, decreased libido, ED.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("CV — refractory HTN, atrial fibrillation, CAD, HF, stroke, pulmonary HTN.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Risk — obesity (BMI >30), large neck (>17 in men, >16 women), retrognathia, large tonsils, Mallampati III/IV.", citationIDs: ["openrn_dx_round18"])
        ],
        diagnosticCriteria: [
            AttributedBullet("STOP-BANG questionnaire — screening; ≥3 = high risk.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Polysomnography (in-lab) — gold standard; AHI = apnea + hypopnea events / hour of sleep per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Home sleep apnea test (HSAT) — for high pre-test probability uncomplicated; negative HSAT in symptomatic patient → in-lab.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Epworth Sleepiness Scale for symptom severity.", citationIDs: ["openrn_dx_round18"])
        ],
        priorityAssessments: [
            AttributedBullet("CV risk + comorbidities (HTN, AF, HF, T2DM, depression).", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Driver / occupational safety counseling.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Pre-operative — high anesthesia / postoperative respiratory failure risk; STOP-BANG screening per primary source.", citationIDs: ["specialty_dx_round18"])
        ],
        commonInterventions: [
            AttributedBullet("CPAP — first-line; titrate via in-lab study OR auto-titrating CPAP at home; mask fit + adherence support critical per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Oral appliance (mandibular advancement device) — moderate OSA or CPAP-intolerant.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("HYPOGLOSSAL NERVE STIMULATION (Inspire) — moderate-severe CPAP-intolerant in selected patients.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Surgical — UPPP, maxillomandibular advancement, tonsillectomy (peds + adult selected).", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("WEIGHT LOSS — single most important intervention if obese; behavioral + GLP-1 / tirzepatide / bariatric surgery for severe.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Positional therapy for positional OSA.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Avoid alcohol + sedatives 3 hours before bed.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Treat coexisting allergic rhinitis, GERD, hypothyroidism.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("CPAP adherence — coaching, mask refitting, humidification, ramp; <4 hours/night common.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Pre-op planning — anesthesia consult; postoperative monitoring; CPAP through perioperative period if used.", citationIDs: ["specialty_dx_round18"])
        ],
        watchFor: [
            AttributedBullet("CV consequences — refractory HTN, AF, HF; CPAP improves but does not eliminate risk per primary source.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("MVA / OCCUPATIONAL ACCIDENTS — counsel + treat; some states require physician reporting.", citationIDs: ["openrn_dx_round18"]),
            AttributedBullet("Pre-op + post-op — sedative + opioid sensitivity; airway compromise; OSA-aware perioperative care.", citationIDs: ["specialty_dx_round18"]),
            AttributedBullet("Pediatric OSA — adenotonsillar hypertrophy main cause; tonsillectomy primary therapy.", citationIDs: ["specialty_dx_round18"])
        ],
        citations: [openrnDxR18, specialtyDxR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}
