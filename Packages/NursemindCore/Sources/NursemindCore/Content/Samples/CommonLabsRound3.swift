import Foundation

// Curator-model lab entries (round 3 expansion — anemia workup, cardiac, anticoag, endocrine, hepatitis).
// Sources: Open RN Fundamentals + Health Alterations (CC BY 4.0), CDC (public domain),
// concept citations only for AHA/ACR/ENS/ATS.

private let openrnLabsR3 = CitationSource(
    id: "openrn_labs_round3",
    shortName: "Open RN Nursing Fundamentals — Reference Ranges",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/?s=fundamentals+nursing+process",
    lastRetrieved: "2026-05-04"
)
private let openrnMSLabs3 = CitationSource(
    id: "openrn_mslabs_round3",
    shortName: "Open RN Health Alterations / Med-Surg",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=clinical+reference",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR3 = CitationSource(
    id: "openstax_labs_round3",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let cdcLabsR3 = CitationSource(
    id: "cdc_labs_round3",
    shortName: "CDC clinical laboratory standards",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/laboratory/",
    lastRetrieved: "2026-05-04"
)

private let perfusionLabTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion)
private let cellularLabTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let pharmLabTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let infectionLabTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)

// MARK: - Reticulocyte Count

public enum ReticulocyteSample {
    public static let entry: LabEntry = LabEntry(
        id: "reticulocyte-count",
        title: "Reticulocyte Count",
        subtitle: "Bone marrow response · % or absolute · anemia workup",
        specimen: "Whole blood (EDTA, lavender-top)",
        nclexTags: perfusionLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "0.5–1.5% (typical adult)", label: "Normal (relative)", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "Absolute reticulocytes 25–75 × 10⁹/L", label: "Normal (absolute)", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "Reticulocyte index >2 = appropriate marrow response in anemia", label: "Reticulocyte index (corrected)", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "<0.5% in setting of anemia", label: "Inadequate marrow response", citationIDs: ["openrn_mslabs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated reticulocytes (with anemia)",
                summary: "Marrow is responding appropriately to anemia. Suggests blood loss or hemolysis. Pair with haptoglobin (low in hemolysis), LDH (high), bilirubin (indirect high) for the hemolytic pattern.",
                nursingActions: [
                    "Investigate hemolytic causes (autoimmune, microangiopathic, hereditary, drug-induced, transfusion reaction)",
                    "Assess for occult blood loss (FOBT, EGD/colonoscopy)",
                    "Iron studies, peripheral smear for schistocytes, Coombs test"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Inappropriately low reticulocytes (with anemia)",
                summary: "Marrow is failing to respond to anemia. Suggests nutritional deficiency (iron, B12, folate), bone marrow suppression (drugs, radiation, infiltration), CKD with low erythropoietin, or aplastic anemia.",
                nursingActions: [
                    "Iron studies, B12, folate",
                    "BUN/creatinine (CKD)",
                    "Drug review",
                    "Bone marrow biopsy if persistent unexplained low retic"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH reticulocyte count",
                causes: [
                    "Acute blood loss (after marrow ramps up — 3–5 days)",
                    "Hemolysis (autoimmune, sickle cell, microangiopathic, drug-induced)",
                    "Response to iron / B12 / folate replacement (after 4–7 days)",
                    "Recovery from marrow suppression"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            CauseGroup(
                title: "Causes of LOW reticulocyte count",
                causes: [
                    "Iron, B12, or folate deficiency (untreated)",
                    "CKD with low erythropoietin",
                    "Bone marrow suppression — chemo, radiation, infection (parvovirus B19), aplastic anemia",
                    "Marrow infiltration — leukemia, lymphoma, fibrosis, metastasis",
                    "Anemia of chronic disease"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("Calculate the reticulocyte INDEX in anemic patients — corrects for the anemia: (% retic × patient Hct / normal Hct) ÷ correction factor (1–2.5).", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("In aplastic crisis (parvovirus, especially in sickle cell), retic falls precipitously — emergency.", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("Aplastic crisis in sickle cell disease — sudden Hgb drop with low reticulocytes; often parvovirus B19; transfusion required.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Adequate response after starting iron — retic should rise by 4–7 days; if no response, reconsider diagnosis (malabsorption, ongoing loss, wrong dx).", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Haptoglobin

public enum HaptoglobinSample {
    public static let entry: LabEntry = LabEntry(
        id: "haptoglobin",
        title: "Haptoglobin",
        subtitle: "Hemolysis marker · pairs with retic, LDH, bilirubin",
        specimen: "Serum",
        nclexTags: perfusionLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "30–200 mg/dL (typical adult)", label: "Normal", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "<25 mg/dL", label: "Suggestive of hemolysis", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "Undetectable", label: "Strongly suggestive of intravascular hemolysis", citationIDs: ["openrn_mslabs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Low haptoglobin",
                summary: "Plasma haptoglobin binds free hemoglobin released by hemolysis; the complex is cleared. Low/absent haptoglobin = hemolysis (especially intravascular). Caveat: liver disease causes low haptoglobin (impaired synthesis).",
                nursingActions: [
                    "Combine with high LDH, high indirect bilirubin, high reticulocytes, schistocytes on smear for the hemolytic pattern",
                    "Differentiate intravascular (very low haptoglobin, hemoglobinuria, hemoglobinemia) vs extravascular (modestly low haptoglobin)",
                    "Investigate cause — Coombs test (autoimmune), peripheral smear (microangiopathic), hemoglobin electrophoresis (sickle cell), G6PD (oxidative)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated haptoglobin",
                summary: "Acute phase reactant — rises with inflammation, infection, malignancy, steroid use. Can mask concurrent hemolysis.",
                nursingActions: [
                    "Interpret in context of acute illness",
                    "If concurrent hemolysis suspected, value can be misleadingly normal/high"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of LOW haptoglobin",
                causes: [
                    "Hemolysis (autoimmune, microangiopathic, mechanical from valves, sickle cell crisis, transfusion reaction, G6PD with oxidative stress)",
                    "Liver disease (impaired synthesis)",
                    "Megaloblastic anemia (intramedullary hemolysis)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            CauseGroup(
                title: "Causes of HIGH haptoglobin",
                causes: [
                    "Acute infection / inflammation",
                    "Malignancy",
                    "Trauma / surgery",
                    "Corticosteroid use",
                    "Cholestasis"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("Hemolysis pattern (classic): LOW haptoglobin + HIGH LDH + HIGH indirect bilirubin + HIGH reticulocytes + schistocytes (if microangiopathic).", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Acute phase reaction can falsely elevate haptoglobin and obscure mild hemolysis — interpret in clinical context.", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("Acute hemolytic transfusion reaction — undetectable haptoglobin within hours; medical emergency.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Microangiopathic hemolytic anemia (TTP, HUS, DIC, HELLP) — schistocytes + thrombocytopenia + low haptoglobin; specialty workup.", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Iron Studies

public enum IronStudiesSample {
    public static let entry: LabEntry = LabEntry(
        id: "iron-studies",
        title: "Iron Studies (Iron / TIBC / Saturation)",
        subtitle: "Beyond ferritin — characterize iron metabolism",
        specimen: "Serum (fasting morning sample preferred)",
        nclexTags: perfusionLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Serum iron 50–170 mcg/dL (varies by sex; diurnal variation)", label: "Normal", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "TIBC 240–450 mcg/dL", label: "Normal", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "Transferrin saturation 20–50%", label: "Normal", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "Ferritin: M 24–336 · F 11–307 ng/mL", label: "Normal", citationIDs: ["openrn_labs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Iron deficiency pattern",
                summary: "LOW iron, HIGH TIBC, LOW transferrin saturation (<20%), LOW ferritin (<30 definitive, <15 absolute). Most specific marker is ferritin (acute-phase confounder must be considered).",
                nursingActions: [
                    "Investigate cause — menstrual, GI loss, malabsorption, dietary",
                    "Iron replacement (oral or IV)",
                    "Adult M / postmenopausal F: COLON CANCER WORKUP until proven otherwise"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Anemia of chronic disease pattern",
                summary: "LOW iron, LOW TIBC, low/normal transferrin saturation, NORMAL or HIGH ferritin (acute-phase).",
                nursingActions: [
                    "Treat underlying inflammatory condition",
                    "If concurrent iron deficiency suspected (mixed picture), check soluble transferrin receptor (high in true ID, normal in ACD)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Iron overload (hemochromatosis)",
                summary: "HIGH iron, HIGH transferrin saturation (>45–50%), HIGH ferritin (often >300; can be markedly elevated). Hereditary hemochromatosis (HFE) is most common cause; other: secondary iron overload from transfusions, ineffective erythropoiesis.",
                nursingActions: [
                    "Genetic testing for HFE C282Y mutation",
                    "Liver imaging / biopsy for fibrosis assessment",
                    "Phlebotomy to maintain ferritin <50 and saturation <50%"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Iron deficiency",
                causes: [
                    "Menstruation, pregnancy",
                    "GI bleeding (occult — colorectal cancer, peptic ulcer, AVMs)",
                    "Malabsorption (celiac, gastric bypass, atrophic gastritis, PPI use)",
                    "Dietary insufficiency (vegan, malnutrition)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            CauseGroup(
                title: "Anemia of chronic disease",
                causes: [
                    "Chronic infection",
                    "Inflammation (RA, lupus, IBD)",
                    "Malignancy",
                    "Chronic kidney disease"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            CauseGroup(
                title: "Iron overload",
                causes: [
                    "Hereditary hemochromatosis (HFE C282Y/H63D)",
                    "Repeated transfusions (thalassemia, sickle cell)",
                    "Ineffective erythropoiesis (myelodysplastic syndromes)",
                    "Excessive supplementation"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("Morning fasting sample — iron has diurnal variation (highest AM); transferrin sat = serum iron / TIBC × 100.", citationIDs: ["openrn_labs_round3"]),
            AttributedBullet("Ferritin is acute-phase reactant — falsely elevated with inflammation; check CRP if interpreting iron studies in unwell patient.", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("Iron deficiency in adult M / postmenopausal F → colorectal cancer until proven otherwise; refer for colonoscopy + EGD.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Hemochromatosis — screen first-degree relatives; complications include cirrhosis, HCC, diabetes, cardiomyopathy, arthropathy.", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Vitamin B12

public enum VitaminB12Sample {
    public static let entry: LabEntry = LabEntry(
        id: "vitamin-b12",
        title: "Vitamin B12 (Cobalamin)",
        subtitle: "Macrocytic anemia · neurologic deficits · pernicious anemia",
        specimen: "Serum",
        nclexTags: cellularLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "200–900 pg/mL (typical adult)", label: "Normal", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "<200 pg/mL", label: "Deficient", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "200–300 pg/mL", label: "Borderline — confirm with methylmalonic acid (MMA) and homocysteine (both elevated in deficiency)", citationIDs: ["openrn_mslabs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "B12 deficiency",
                summary: "Causes macrocytic megaloblastic anemia AND neurologic symptoms (peripheral neuropathy, ataxia, dementia, subacute combined degeneration). Neurologic deficits may not fully reverse — early treatment matters.",
                nursingActions: [
                    "Investigate cause — pernicious anemia (anti-IF antibodies, anti-parietal-cell antibodies), malabsorption (gastric bypass, ileal disease, atrophic gastritis), strict vegan diet, metformin, PPI use, fish tapeworm",
                    "Supplement — IM cyanocobalamin 1000 mcg weekly × 4 weeks then monthly OR oral 1000–2000 mcg daily (high-dose oral effective even in malabsorption)",
                    "Monitor neurologic recovery and Hgb response (retics rise within 1 week)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of B12 deficiency",
                causes: [
                    "Pernicious anemia (autoimmune destruction of parietal cells / intrinsic factor)",
                    "Atrophic gastritis (elderly)",
                    "Gastric bypass / partial gastrectomy",
                    "Ileal disease (Crohn's, resection, bacterial overgrowth)",
                    "Strict vegan diet without supplementation",
                    "Long-term metformin",
                    "Chronic PPI / H2 blocker use",
                    "Fish tapeworm (Diphyllobothrium)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always check FOLATE concurrently — folate replacement alone in B12 deficiency can correct anemia but worsen neurologic deficits ('folate trap').", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("MMA + homocysteine confirm true deficiency in borderline B12 (200–300).", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("Subacute combined degeneration (posterior + lateral spinal cord) — paresthesias, ataxia, weakness, dementia; treat early before deficits become permanent.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Neurologic deficit can occur WITHOUT anemia in early B12 deficiency.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Long-term metformin / PPI users — periodic B12 screening.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Pernicious anemia — increased gastric cancer risk; surveillance per guidelines.", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NT-proBNP

public enum NTproBNPSample {
    public static let entry: LabEntry = LabEntry(
        id: "nt-probnp",
        title: "NT-proBNP",
        subtitle: "Heart failure marker · use INSTEAD of BNP if patient on Entresto",
        specimen: "Serum or plasma",
        nclexTags: perfusionLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "<125 pg/mL (age <75)", label: "Normal — HF unlikely", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "<450 pg/mL (age <50) · <900 (50–75) · <1800 (>75)", label: "Age-adjusted HF rule-in thresholds", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: ">10,000 pg/mL", label: "Severe disease / poor prognosis", citationIDs: ["openrn_mslabs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated NT-proBNP",
                summary: "Strongly suggestive of heart failure, especially in dyspneic patient. More elevated = worse prognosis. Can also be elevated in PE, AFib, sepsis, MI, AKI/CKD, advanced age. NORMAL value (<125) has high negative predictive value for HF in dyspneic patient.",
                nursingActions: [
                    "Echocardiography to confirm HF and characterize (HFrEF vs HFpEF)",
                    "GDMT for HF — ACEi/ARB/ARNI, β-blocker, MRA, SGLT2 inhibitor",
                    "Diuresis if congested",
                    "Trend BNP/NT-proBNP across hospitalization to assess response"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated NT-proBNP",
                causes: [
                    "Heart failure (acute or chronic)",
                    "Atrial fibrillation",
                    "Pulmonary embolism",
                    "Sepsis",
                    "Acute MI",
                    "AKI / CKD (reduced clearance)",
                    "Advanced age (gradual rise)",
                    "Cor pulmonale"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("USE NT-proBNP IN PATIENTS ON ENTRESTO (sacubitril-valsartan) — sacubitril inhibits neprilysin which degrades BNP, falsely elevating BNP. NT-proBNP is NOT affected.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("BNP and NT-proBNP both rise with HF severity — trend over time.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Obesity LOWERS BNP/NT-proBNP — interpret with caution in BMI ≥35.", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("Acute HF in dyspneic patient — combine with clinical exam, lung sounds, JVD, edema, BNP/NT-proBNP, lung US, CXR.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Renal impairment elevates NT-proBNP independent of HF — interpret with eGFR.", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Anti-Xa

public enum AntiXaSample {
    public static let entry: LabEntry = LabEntry(
        id: "anti-xa",
        title: "Anti-Xa Activity",
        subtitle: "Heparin / LMWH monitoring · particularly in renal disease, pregnancy, obesity",
        specimen: "Citrated plasma (blue-top)",
        nclexTags: pharmLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "Therapeutic UFH: 0.3–0.7 IU/mL", label: "On unfractionated heparin", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "Therapeutic LMWH (treatment): 0.5–1.0 IU/mL (4 hr post-dose)", label: "On LMWH treatment dose", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "Prophylactic LMWH: 0.2–0.5 IU/mL (4 hr post-dose)", label: "On LMWH prophylactic dose", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: ">1.5 IU/mL", label: "Supratherapeutic — bleeding risk", citationIDs: ["openrn_mslabs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic anti-Xa",
                summary: "High bleeding risk. Common in renal impairment (LMWH renally cleared), elderly, low body weight, dose error.",
                nursingActions: [
                    "Hold heparin/LMWH; reassess dose",
                    "Assess for active bleeding — gums, urine, stool, IV sites, neuro changes",
                    "Reverse if active bleeding — protamine for UFH (full reversal); protamine partially reverses LMWH (~60%)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic anti-Xa",
                summary: "Inadequate anticoagulation; risk of clot extension or new VTE.",
                nursingActions: [
                    "Verify timing — peak should be 4 hr post-LMWH SC; confirm continuous infusion running for UFH",
                    "Increase dose per protocol",
                    "Recheck after appropriate steady-state interval"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "When to use anti-Xa instead of aPTT (UFH monitoring)",
                causes: [
                    "Lupus anticoagulant (falsely prolongs aPTT)",
                    "Heparin resistance (high antithrombin, factor VIII elevation)",
                    "Inconsistent aPTT-heparin correlation"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            CauseGroup(
                title: "When to monitor anti-Xa with LMWH",
                causes: [
                    "Renal impairment (CrCl <30) — accumulates",
                    "Pregnancy (volume of distribution changes)",
                    "Obesity (BMI ≥40)",
                    "Pediatric / elderly weight extremes",
                    "Prolonged therapy (>1 week)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("Timing matters — LMWH anti-Xa: 4 hours after SC injection (peak); UFH: anytime during continuous drip after steady state.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("In HIT, anti-Xa is NOT useful for monitoring alternatives (argatroban, bivalirudin) — use aPTT instead.", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("Renal impairment — LMWH accumulates; consider switch to UFH or anti-Xa-monitored LMWH.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Bleeding signs — head-to-toe assessment; lower threshold to image (CT head, GI workup) at supratherapeutic levels.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Apixaban/rivaroxaban anti-Xa levels available at some institutions but not used for routine dosing.", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cortisol

public enum CortisolSample {
    public static let entry: LabEntry = LabEntry(
        id: "cortisol",
        title: "Cortisol",
        subtitle: "Adrenal function · diurnal variation · stim test for AI",
        specimen: "Serum (timing critical — early morning preferred for baseline)",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation),
        referenceRanges: [
            ReferenceRangeRow(value: "Morning (8 AM): 5–25 mcg/dL", label: "Normal AM cortisol", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "Evening (4 PM): 3–13 mcg/dL", label: "Normal PM cortisol", citationIDs: ["openrn_labs_round3"]),
            ReferenceRangeRow(value: "Random in critical illness: >18 mcg/dL", label: "Adequate stress response", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "Post-cosyntropin stim (60 min): >18 mcg/dL", label: "Normal adrenal response (excludes primary AI)", citationIDs: ["openrn_mslabs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Low cortisol — adrenal insufficiency",
                summary: "Primary (Addison's disease) = adrenal failure (high ACTH, low cortisol). Secondary = pituitary failure (low ACTH, low cortisol). Tertiary = hypothalamic / chronic steroid withdrawal. Adrenal CRISIS is medical emergency.",
                nursingActions: [
                    "If unstable: do NOT wait for results; give hydrocortisone 100 mg IV immediately",
                    "Cosyntropin (ACTH) stim test — measure cortisol pre and 60 min post 250 mcg cosyntropin IV",
                    "ACTH level differentiates primary vs secondary",
                    "Stress-dose steroids during illness/surgery in chronic AI"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated cortisol — Cushing syndrome",
                summary: "Endogenous (pituitary adenoma — Cushing disease, adrenal tumor, ectopic ACTH) or exogenous (steroid use). Elevated 24-hr urinary free cortisol, late-night salivary cortisol, or failure of dexamethasone suppression confirms.",
                nursingActions: [
                    "Confirmatory testing — 24-hour urine free cortisol, late-night salivary cortisol, low-dose dexamethasone suppression test",
                    "Differentiate cause — ACTH-dependent (pituitary, ectopic) vs ACTH-independent (adrenal)",
                    "Endocrine referral",
                    "Manage complications — diabetes, HTN, osteoporosis, infection susceptibility"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of LOW cortisol",
                causes: [
                    "Primary AI (Addison's): autoimmune, infection (TB, fungal), hemorrhage (Waterhouse-Friderichsen), adrenoleukodystrophy",
                    "Secondary AI: pituitary disease, post-surgical, traumatic brain injury",
                    "Tertiary AI: chronic exogenous steroid use (most common cause overall) — abrupt discontinuation"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            CauseGroup(
                title: "Causes of HIGH cortisol",
                causes: [
                    "Exogenous corticosteroid use (most common)",
                    "Cushing disease (pituitary adenoma)",
                    "Adrenal tumor (cortisol-secreting)",
                    "Ectopic ACTH (small cell lung cancer)",
                    "Stress / acute illness (physiologic)",
                    "Pregnancy (mild)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("Time of draw matters — diurnal cortisol peaks ~8 AM, troughs at midnight; document time.", citationIDs: ["openrn_labs_round3"]),
            AttributedBullet("In suspected adrenal crisis, treat with empiric hydrocortisone — DO NOT delay for cortisol results.", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("ADRENAL CRISIS — hypotension, shock, hyperK, hyponatremia, hypoglycemia in patient on chronic steroids who became sick or stopped steroids; hydrocortisone 100 mg IV emergency.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Patients on chronic steroids need stress-dose during illness/surgery to prevent crisis.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Cushing disease pituitary adenoma — visual field defects from compression; surgical referral.", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hepatitis B Panel

public enum HepatitisBPanelSample {
    public static let entry: LabEntry = LabEntry(
        id: "hepatitis-b-panel",
        title: "Hepatitis B Panel",
        subtitle: "HBsAg · anti-HBs · anti-HBc · interpretation by pattern",
        specimen: "Serum",
        nclexTags: infectionLabTags,
        referenceRanges: [
            ReferenceRangeRow(value: "HBsAg POS + anti-HBc POS + anti-HBs NEG", label: "Active infection (acute or chronic)", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "HBsAg NEG + anti-HBc POS + anti-HBs POS", label: "Resolved past infection · immunity from natural infection", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "HBsAg NEG + anti-HBc NEG + anti-HBs POS", label: "Vaccinated · immunity from vaccine", citationIDs: ["openrn_mslabs_round3"]),
            ReferenceRangeRow(value: "HBsAg NEG + anti-HBc POS + anti-HBs NEG", label: "Isolated anti-HBc — interpret carefully (occult HBV, false positive, or remote past infection)", citationIDs: ["openrn_mslabs_round3"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Active HBV infection (HBsAg positive >6 months = chronic)",
                summary: "Chronic HBV: long-term risk of cirrhosis (15–40% in untreated chronic), hepatocellular carcinoma (high relative risk even without cirrhosis). Treatment depends on activity (HBV DNA, ALT, fibrosis stage). Lifelong surveillance.",
                nursingActions: [
                    "Confirm with HBV DNA quantitative, HBeAg/anti-HBe, ALT, HCC screening (US ± AFP every 6 months)",
                    "Consider antiviral therapy (entecavir, tenofovir) per AASLD criteria",
                    "Screen all household / sexual contacts; vaccinate contacts",
                    "Counsel on transmission prevention",
                    "Avoid HBV reactivation triggers (rituximab, chemotherapy, anti-TNF) without prophylaxis"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Resolved past infection (anti-HBc + anti-HBs)",
                summary: "Immune from natural infection. NOT contagious. Risk of reactivation if immunosuppressed (e.g., rituximab) — prophylaxis indicated.",
                nursingActions: [
                    "Document immunity",
                    "If immunosuppression planned, discuss reactivation prophylaxis with hepatology"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "HBV transmission",
                causes: [
                    "Bloodborne — IV drug use, transfusion (now screened), needle-stick",
                    "Sexual",
                    "Perinatal (vertical)",
                    "Household contact (shared toothbrush/razor)"
                ],
                citationIDs: ["openrn_mslabs_round3"]
            )
        ],
        nursingActions: [
            AttributedBullet("Universal screening recommended for all adults at least once (USPSTF, CDC).", citationIDs: ["cdc_labs_round3"]),
            AttributedBullet("Healthcare worker post-exposure: hepatitis B immune globulin (HBIG) + HBV vaccine (if not immunized) within 24 hours of exposure.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Pregnant patients — universal HBsAg screening; HBIG + vaccine to newborn within 12 hours if mother HBsAg-positive.", citationIDs: ["openrn_mslabs_round3"])
        ],
        watchFor: [
            AttributedBullet("HBV REACTIVATION — patients with resolved or chronic HBV starting immunosuppressive therapy (rituximab, anti-TNF, chemotherapy); fulminant hepatitis possible; antiviral prophylaxis required.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Hepatocellular carcinoma — chronic HBV is a leading cause; lifelong screening US ± AFP every 6 months in cirrhotic and select non-cirrhotic patients.", citationIDs: ["openrn_mslabs_round3"]),
            AttributedBullet("Vaccinate household and sexual contacts of HBsAg-positive patients.", citationIDs: ["openrn_mslabs_round3"])
        ],
        citations: [openrnLabsR3, openrnMSLabs3, openstaxLabsR3, cdcLabsR3],
        lastSourceFidelityReview: "2026-05-04"
    )
}
