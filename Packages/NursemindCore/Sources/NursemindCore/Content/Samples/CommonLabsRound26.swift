import Foundation

// Curator-model lab entries (round 26 — heme + chronic liver diagnostics).

private let openrnLabsR26 = CitationSource(
    id: "openrn_labs_round26",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR26 = CitationSource(
    id: "specialty_labs_round26",
    shortName: "ASH + AASLD + ASCO concept citations",
    publisher: "ASH · AASLD · ASCO",
    license: .factCitationOnly,
    url: "https://www.hematology.org/education/clinicians/guidelines-and-quality-care",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR26 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .clottingHemostasis
)

public enum ADAMTS13Sample {
    public static let entry: LabEntry = LabEntry(
        id: "adamts13",
        title: "ADAMTS13 activity + inhibitor",
        subtitle: "Diagnostic for TTP · <10% with thrombocytopenia + MAHA = TTP · order BEFORE plasma exchange · 1-3 day turnaround",
        specimen: "Citrate plasma; collected BEFORE plasma exchange (PEX interferes with results); send to specialty lab",
        nclexTags: labsTagsR26,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal activity ≥40-67%", label: "Normal ADAMTS13 — rules out TTP if thrombocytopenia + MAHA present", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "Activity 10-40%", label: "Reduced; may suggest hereditary partial deficiency OR secondary causes (sepsis, DIC, pregnancy)", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "Activity <10%", label: "Severe deficiency — DIAGNOSTIC for TTP (acquired or congenital)", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "Activity <5% + inhibitor positive", label: "Acquired (immune) TTP — autoantibody against ADAMTS13", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "Activity <5% + inhibitor negative", label: "Congenital TTP (Upshaw-Schulman syndrome) — ADAMTS13 gene mutations", citationIDs: ["specialty_labs_round26"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal ADAMTS13 activity (≥40%)",
                summary: "TTP unlikely in patient with thrombocytopenia + MAHA. Consider alternative thrombotic microangiopathies — DIC (abnormal coag), aHUS (complement-mediated), STEC-HUS (Shiga toxin), HIT (heparin exposure), HELLP (pregnancy), drug-induced TMA per primary source.",
                nursingActions: [
                    "Reassess differential diagnosis for thrombotic microangiopathy.",
                    "Check DAT for autoimmune hemolytic anemia.",
                    "Check Shiga toxin + E. coli O157:H7 stool if STEC-HUS suspected.",
                    "Check complement levels for aHUS.",
                    "Workup secondary causes — sepsis, drugs, pregnancy."
                ],
                citationIDs: ["specialty_labs_round26"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "ADAMTS13 <10% — TTP confirmed",
                summary: "Severe deficiency confirms TTP. Start plasma exchange (PEX) immediately if not already started — DO NOT WAIT for results in clinical TTP suspicion. Add corticosteroids + rituximab; consider caplacizumab per primary source.",
                nursingActions: [
                    "EMERGENT PLASMA EXCHANGE — daily 1-1.5 plasma volumes; continue until platelet count >150K × 2 consecutive days.",
                    "Corticosteroids — methylprednisolone 1 g IV × 3 days then prednisone 1 mg/kg PO taper.",
                    "Rituximab — 375 mg/m² IV weekly × 4 weeks; reduces relapse.",
                    "Caplacizumab — 11 mg IV before first PEX, then 11 mg SC daily × duration + 30 days; reduces recurrence + time to recovery.",
                    "Inhibitor positive → acquired TTP; immunosuppression essential.",
                    "Inhibitor negative + <5% activity → consider congenital TTP (Upshaw-Schulman); FFP or recombinant ADAMTS13 prophylactically.",
                    "DO NOT TRANSFUSE PLATELETS unless life-threatening bleeding — fuels thrombosis.",
                    "Recheck ADAMTS13 to assess response + guide continuation."
                ],
                citationIDs: ["specialty_labs_round26"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications to test",
                causes: ["Suspected TTP (MAHA + thrombocytopenia ± neurologic / renal / fever)", "Atypical HUS workup", "Pre / post plasma exchange to monitor response", "Family history of TTP (congenital screening)", "Recurrent thrombotic microangiopathy"],
                citationIDs: ["specialty_labs_round26"]
            ),
            CauseGroup(
                title: "Causes of reduced ADAMTS13 (but not TTP)",
                causes: ["Sepsis", "DIC", "Pregnancy", "Cirrhosis", "Liver failure", "Recent surgery / inflammation", "Hereditary partial deficiency (clinically silent)"],
                citationIDs: ["specialty_labs_round26"]
            )
        ],
        nursingActions: [
            AttributedBullet("DRAW SAMPLE BEFORE plasma exchange — PEX adds donor ADAMTS13 + removes inhibitor, falsely normalizing results per primary source.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("DO NOT WAIT for results to start treatment in clinical TTP suspicion — empirical PEX while result pending.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("SEND-OUT lab — most centers; 1-3 day turnaround; some hospitals have in-house rapid testing.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("SEND CONCURRENT ADAMTS13 INHIBITOR — distinguishes acquired (autoimmune) from congenital TTP.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("FOLLOW-UP — periodic monitoring of ADAMTS13 activity to assess remission; persistent low predicts relapse.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("Genetic testing — for confirmed congenital TTP (low activity + negative inhibitor + family history); ADAMTS13 gene sequencing.", citationIDs: ["specialty_labs_round26"])
        ],
        watchFor: [
            AttributedBullet("EMPIRIC PEX in clinical TTP suspicion — start before ADAMTS13 result; mortality from delay is high; recheck after if normal value, can stop PEX per primary source.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("PERSISTENT LOW ADAMTS13 between TTP episodes — relapse predictor; consider preventive rituximab.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("CONGENITAL TTP — chronic FFP or recombinant ADAMTS13 (TAK-755) prophylactically; family screening.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("ACQUIRED TTP RELAPSE — ~40% in first 2 years without rituximab; lifelong monitoring + low threshold to retreat.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("LIVER DISEASE + ADAMTS13 — moderately reduced; not TTP; clinical context essential.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("ANTIBODY-INDUCED — many patients have autoantibodies that need IMMUNOSUPPRESSION (rituximab) for sustained remission, not just PEX.", citationIDs: ["specialty_labs_round26"])
        ],
        citations: [openrnLabsR26, specialtyLabsR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PeripheralSmearSample {
    public static let entry: LabEntry = LabEntry(
        id: "peripheral-blood-smear",
        title: "Peripheral blood smear",
        subtitle: "Microscopy of stained blood · hemolysis findings · neoplastic cells · parasites · CRITICAL for hematologic differential",
        specimen: "EDTA blood smear (purple-top tube); stained with Wright or Giemsa; reviewed by hematopathologist OR experienced provider",
        nclexTags: labsTagsR26,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal RBC morphology", label: "Biconcave disks, uniform size + shape, normal central pallor", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "SCHISTOCYTES (fragmented RBCs)", label: "Microangiopathic hemolytic anemia (TTP, HUS, DIC, mechanical valve, malignant HTN)", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "SPHEROCYTES", label: "Hereditary spherocytosis OR autoimmune hemolytic anemia (DAT positive)", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "SICKLE CELLS", label: "Sickle cell disease (HbSS or HbSC)", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "TARGET CELLS", label: "Thalassemia, liver disease, post-splenectomy, hemoglobinopathies", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "BITE / HEINZ BODIES", label: "G6PD deficiency, oxidative hemolysis", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "TEARDROP CELLS (dacrocytes)", label: "Myelofibrosis, marrow infiltration, megaloblastic anemia", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "BASOPHILIC STIPPLING", label: "Lead poisoning, thalassemia, sideroblastic anemia", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "HYPERSEGMENTED NEUTROPHILS", label: "B12 or folate deficiency (megaloblastic anemia)", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "BLASTS / AUER RODS", label: "Acute leukemia (AML if Auer rods; ALL if lymphoblasts)", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "ATYPICAL LYMPHOCYTES", label: "Infectious mononucleosis (EBV), CMV, viral infections", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "SMUDGE CELLS", label: "Chronic lymphocytic leukemia (CLL)", citationIDs: ["specialty_labs_round26"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal peripheral smear",
                summary: "Rules out major morphologic abnormalities; supports normal CBC. Note: subtle abnormalities may require specialist review for accurate interpretation.",
                nursingActions: [
                    "Continue routine monitoring.",
                    "Consider repeat smear if clinical concern persists or labs evolve."
                ],
                citationIDs: ["specialty_labs_round26"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Abnormal smear — requires interpretation",
                summary: "Pattern of abnormalities guides differential diagnosis. Hematology / hematopathology consultation for definitive interpretation per primary source.",
                nursingActions: [
                    "Match smear findings to clinical context — pattern of abnormalities + CBC + lab values.",
                    "Schistocytes + thrombocytopenia → urgent TMA workup (ADAMTS13, complement, Shiga toxin).",
                    "Spherocytes → osmotic fragility test or EMA test for hereditary spherocytosis vs DAT for AIHA.",
                    "Blasts → urgent hematology / bone marrow biopsy for leukemia.",
                    "Hypersegmented neutrophils → B12 + folate workup.",
                    "Heinz bodies → G6PD screening.",
                    "Atypical lymphocytes + symptoms → Monospot, EBV serology."
                ],
                citationIDs: ["specialty_labs_round26"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications for peripheral smear review",
                causes: ["Unexplained anemia + need to characterize type", "Suspected hemolysis", "Suspected hematologic malignancy", "Unexplained cytopenia(s)", "Suspected infection (mono, malaria, babesiosis)", "Suspected parasitic disease", "Pre + post treatment of TMA", "Validate abnormal CBC results"],
                citationIDs: ["specialty_labs_round26"]
            ),
            CauseGroup(
                title: "Key morphologic findings to identify",
                causes: ["Schistocytes — MAHA (TMA)", "Spherocytes — hereditary spherocytosis or AIHA", "Sickle cells — sickle cell disease", "Target cells — thalassemia, liver disease, hemoglobin C", "Bite cells / Heinz bodies — G6PD deficiency", "Teardrop cells — myelofibrosis, marrow infiltration", "Basophilic stippling — lead poisoning, thalassemia", "Hypersegmented neutrophils — megaloblastic anemia", "Blasts — acute leukemia", "Smudge cells — CLL", "Atypical lymphocytes — viral infections"],
                citationIDs: ["specialty_labs_round26"]
            )
        ],
        nursingActions: [
            AttributedBullet("REQUEST when clinical findings + CBC suggest hematologic abnormality.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("EDTA tube within 4 hours of collection — older specimens have artifact (crenation, fragmented cells).", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("WRIGHT-GIEMSA STAIN standard; review by experienced provider or hematopathologist.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("INTERPRET in clinical context — same finding can mean different things (e.g., spherocytes in HS vs AIHA).", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("PARASITES — RBC inclusion bodies in MALARIA (especially Plasmodium falciparum + vivax + ovale + malariae); thick + thin smear separately.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("BABESIOSIS — \"Maltese cross\" inclusion; serologies + PCR.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("INSTANT bedside microscopy useful in suspected leukemia, parasitic infection, or thrombotic microangiopathy.", citationIDs: ["specialty_labs_round26"])
        ],
        watchFor: [
            AttributedBullet("ARTIFACTS — improperly stored / handled specimens; recollect if findings unclear.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("SCHISTOCYTE THRESHOLD — >2% suggests MAHA; high index of suspicion + clinical context.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("RETICULOCYTE COUNT — ALWAYS pair with smear in suspected hemolysis or response to therapy.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("FLOW CYTOMETRY — for suspected leukemia / lymphoma; characterizes cell lineage + maturity.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("BONE MARROW BIOPSY — definitive for primary marrow disorders; smear is screening.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("DAT (direct antiglobulin / Coombs) — distinguishes immune from non-immune hemolysis when spherocytes present.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("SECOND OPINION — for unclear or atypical findings; refer to hematology / hematopathology.", citationIDs: ["specialty_labs_round26"])
        ],
        citations: [openrnLabsR26, specialtyLabsR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CeruloplasminSample {
    public static let entry: LabEntry = LabEntry(
        id: "ceruloplasmin",
        title: "Ceruloplasmin",
        subtitle: "Wilson disease screening · low + Kayser-Fleischer rings + high urinary copper = WD · acute phase reactant · falsely normal in 5-15%",
        specimen: "Serum (not fasting required); acute phase reactant — interpretation in clinical context (elevated in inflammation, pregnancy, estrogen use)",
        nclexTags: labsTagsR26,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal 20-50 mg/dL", label: "Normal ceruloplasmin", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "<20 mg/dL", label: "Low — suggestive of Wilson disease (~85-95% sensitivity); requires confirmation with 24-hour urinary copper + slit lamp", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: "<10 mg/dL", label: "Very low — highly specific for Wilson disease; confirm with genetic + 24-hour urinary copper", citationIDs: ["specialty_labs_round26"]),
            ReferenceRangeRow(value: ">50 mg/dL", label: "Elevated — pregnancy, estrogen use, inflammation, certain malignancies", citationIDs: ["specialty_labs_round26"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal ceruloplasmin",
                summary: "Wilson disease unlikely BUT NOT EXCLUDED. 5-15% of Wilson patients have normal ceruloplasmin (especially during acute hepatic flare — acute phase reactant). Combine with 24-hour urinary copper + slit lamp + clinical features for definitive workup per primary source.",
                nursingActions: [
                    "If clinical suspicion remains (neuropsychiatric symptoms, hepatic dysfunction in young patient, Kayser-Fleischer rings) → proceed with 24-hour urinary copper + slit lamp + consider genetic testing.",
                    "Consider repeat ceruloplasmin when acute phase reactants normalize."
                ],
                citationIDs: ["specialty_labs_round26"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Low ceruloplasmin <20 mg/dL",
                summary: "Suggestive of Wilson disease. Confirm with 24-hour urinary copper (>100 mcg/24 hr; >40 supportive), slit lamp (Kayser-Fleischer rings — present in 95% of neurologic Wilson), and ATP7B genetic testing per primary source.",
                nursingActions: [
                    "Order 24-hour urinary copper — collect in copper-free container.",
                    "Refer to ophthalmology for slit lamp exam.",
                    "Order ATP7B genetic testing.",
                    "Consider penicillamine challenge (post-test urinary copper).",
                    "Family screening — first-degree relatives.",
                    "Liver biopsy with hepatic copper measurement — gold standard for diagnosis.",
                    "Hepatology + neurology + psychiatry referrals.",
                    "INITIATE CHELATION (penicillamine, trientine, or zinc) once diagnosis confirmed."
                ],
                citationIDs: ["specialty_labs_round26"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Low ceruloplasmin",
                causes: ["Wilson disease (autosomal recessive)", "Severe malnutrition", "Nephrotic syndrome (loss)", "Severe liver disease (impaired synthesis)", "Menkes disease (X-linked; copper deficiency)", "Aceruloplasminemia (ferroportin defect; iron overload)", "Heterozygous Wilson carriers (intermediate values)"],
                citationIDs: ["specialty_labs_round26"]
            ),
            CauseGroup(
                title: "Elevated ceruloplasmin (acute phase reactant)",
                causes: ["Pregnancy", "Estrogen / oral contraceptive use", "Acute infection or inflammation", "Cirrhosis (variable)", "Hodgkin lymphoma", "Multiple myeloma", "Hyperthyroidism"],
                citationIDs: ["specialty_labs_round26"]
            )
        ],
        nursingActions: [
            AttributedBullet("CONSIDER WILSON DISEASE in patients age 5-40 with unexplained hepatic OR neuropsychiatric features.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("CERULOPLASMIN ALONE insufficient — pair with 24-HOUR URINARY COPPER + SLIT LAMP examination per primary source.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("ACUTE PHASE REACTANT — false normal in liver inflammation; CRP / ESR to assess if interpretation difficult.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("PREGNANCY + ESTROGEN — falsely elevate ceruloplasmin; can MASK Wilson diagnosis; consider stopping OCs + repeat or use alternative tests.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("FAMILY SCREENING — first-degree relatives of confirmed Wilson patients; ceruloplasmin + 24-hour urinary copper + ATP7B genetic testing.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("LIVER BIOPSY WITH HEPATIC COPPER >250 mcg/g — gold standard; not required if other tests confirmatory.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("DIFFERENTIATE — Menkes (X-linked male hypocupremia + neurodegeneration + kinky hair) vs Wilson (hypercupremia in tissues + low ceruloplasmin).", citationIDs: ["specialty_labs_round26"])
        ],
        watchFor: [
            AttributedBullet("WILSON DIAGNOSIS — combination — low ceruloplasmin + high 24-hour urinary copper + Kayser-Fleischer rings; ATP7B genetic testing confirms.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("ACUTE HEPATIC FAILURE in Wilson — Coombs-negative hemolytic anemia + rising bilirubin + worsening LFTs; high mortality without transplant.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("PENICILLAMINE INDUCED WORSENING — paradoxical neurologic decline early in treatment; specialist supervision.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("PEDIATRIC presentation often hepatic-only; neurologic later in young adults.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("MISSED DIAGNOSIS common — Wilson is treatable + reversible if caught early; lifelong chelation prevents progression.", citationIDs: ["specialty_labs_round26"]),
            AttributedBullet("CERULOPLASMIN levels in inflammation make diagnosis ambiguous; integrate clinical + multiple tests.", citationIDs: ["specialty_labs_round26"])
        ],
        citations: [openrnLabsR26, specialtyLabsR26],
        lastSourceFidelityReview: "2026-05-13"
    )
}
