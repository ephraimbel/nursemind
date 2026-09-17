import Foundation

private let reviewPrealbumin = CitationSource(
    id: "review_prealbumin", shortName: "MedlinePlus — Prealbumin blood test",
    detail: "NLM-authored medical-test information, paraphrased and condensed by NurseMind; third-party linked content excluded.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/prealbumin-blood-test/", lastRetrieved: "2026-09-17"
)
private let reviewPrealbuminASPEN = CitationSource(
    id: "review_prealbumin_aspen", shortName: "ASPEN — Visceral proteins and nutrition assessment",
    detail: "ASPEN (2021), Appropriate Use of Visceral Proteins in Nutrition Screening and Assessment. Factual citation only; no reproduction of tables, figures or screening instruments.",
    publisher: "American Society for Parenteral and Enteral Nutrition", license: .factCitationOnly,
    url: "https://nutritioncare.org/wp-content/uploads/2024/12/Appropriate-Use-Visceral-Proteins-Nutrition-Screening-Assessment.pdf", lastRetrieved: "2026-09-17"
)
private let reviewPrealbuminRanges = CitationSource(
    id: "review_prealbumin_ranges", shortName: "MedlinePlus — Understanding lab results",
    detail: "NLM-authored medical-test information, paraphrased and condensed by NurseMind.",
    publisher: "National Library of Medicine", license: .publicDomain,
    url: "https://medlineplus.gov/lab-tests/how-to-understand-your-lab-results/", lastRetrieved: "2026-09-17"
)

// Curator-model lab entries (round 24 — geriatric / wound diagnostics).

private let openrnLabsR24 = CitationSource(
    id: "openrn_labs_round24",
    shortName: "Open RN Health Alterations + Gerontology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-12"
)
private let specialtyLabsR24 = CitationSource(
    id: "specialty_labs_round24",
    shortName: "AGS + WOCN + ASPEN + Endocrine Society concept citations",
    publisher: "AGS · WOCN · ASPEN · Endocrine Society",
    license: .factCitationOnly,
    url: "https://www.americangeriatrics.org/publications-tools",
    lastRetrieved: "2026-05-12"
)

private let labsTagsR24 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .perfusion
)

public enum ABISample {
    public static let entry: LabEntry = LabEntry(
        id: "ankle-brachial-index",
        title: "Ankle-Brachial Index (ABI)",
        subtitle: "Bedside screening for PAD · ratio of ankle SBP / brachial SBP · <0.9 = PAD · GUIDES wound dressing + compression",
        specimen: "Doppler ultrasound + BP cuffs at ankle (DP + PT) + brachial; non-invasive bedside",
        nclexTags: labsTagsR24,
        referenceRanges: [
            ReferenceRangeRow(value: ">1.30", label: "Non-compressible / calcified vessels (DM, CKD, advanced age) — ABI invalid; use TBI", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "1.00-1.30", label: "Normal", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "0.91-0.99", label: "Borderline; possible PAD; investigate symptoms", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "0.71-0.90", label: "Mild PAD", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "0.41-0.70", label: "Moderate PAD", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "<0.40", label: "Severe PAD / critical limb ischemia", citationIDs: ["specialty_labs_round24"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal ABI 1.00-1.30",
                summary: "Normal arterial perfusion. Compression therapy SAFE for venous ulcers. Continue routine cardiovascular risk factor assessment + management per primary source.",
                nursingActions: [
                    "Compression therapy (30-40 mmHg) safe for venous stasis ulcer.",
                    "Continue cardiovascular risk factor management — BP, lipids, glucose, smoking.",
                    "Counsel exercise + walking program."
                ],
                citationIDs: ["specialty_labs_round24"]
            ),
            InterpretationTier(
                severity: .high,
                label: "PAD detected (ABI 0.41-0.90)",
                summary: "Peripheral arterial disease confirmed. Compression therapy MAY be modified or contraindicated depending on severity. Cardiovascular risk factor optimization + vascular consult per severity per primary source.",
                nursingActions: [
                    "ABI 0.71-0.90 (mild) — modified compression OK with monitoring; vascular referral.",
                    "ABI 0.41-0.70 (moderate) — AVOID standard compression; vascular consult; consider revascularization if symptomatic / ulcer.",
                    "ABI <0.40 (severe) — NO compression; URGENT vascular surgery consult; revascularization or amputation planning.",
                    "Aggressive CV risk factor management — antiplatelet, statin, BP <130/80, A1c <7%, smoking cessation.",
                    "Walking exercise program for claudication.",
                    "Counsel — PAD is marker of generalized atherosclerosis; CAD + stroke risk."
                ],
                citationIDs: ["specialty_labs_round24"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Non-compressible vessels (>1.30)",
                summary: "Falsely elevated ABI from calcified vessels (common in DM, CKD, advanced age). ABI is INVALID. Use Toe-Brachial Index (TBI) or other vascular studies per primary source.",
                nursingActions: [
                    "Order Toe-Brachial Index (TBI) — <0.7 = PAD.",
                    "Order Transcutaneous oxygen pressure (TcPO2) — <30 mmHg = critical ischemia.",
                    "Vascular surgery referral for definitive evaluation.",
                    "Duplex ultrasound or CTA / MRA for arterial mapping."
                ],
                citationIDs: ["specialty_labs_round24"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications for ABI",
                causes: ["Symptoms of PAD (claudication, rest pain, non-healing wound)", "Lower extremity ulcer (distinguish arterial vs venous)", "Before compression therapy", "Diabetic foot screening (annually for DM patients)", "USPSTF screening for selected high-risk asymptomatic adults"],
                citationIDs: ["specialty_labs_round24"]
            ),
            CauseGroup(
                title: "Falsely elevated ABI (>1.30)",
                causes: ["Diabetes (calcified medial vessels)", "Chronic kidney disease", "Advanced age", "Long-standing hypertension", "Calciphylaxis"],
                citationIDs: ["specialty_labs_round24"]
            )
        ],
        nursingActions: [
            AttributedBullet("PROCEDURE — patient supine 5-10 min before measurement; SBP at brachial (both arms — use higher); SBP at DP + PT (use higher of the 2 ankle pressures); divide ankle / brachial.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("USE Doppler probe for accurate SBP detection (manual auscultation often inaccurate in PAD).", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("Document ABI for EACH leg + indicate which DP / PT used.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("CONTRAINDICATIONS — DVT (compression risk), severe wound at cuff site, painful foot.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("ABI BEFORE COMPRESSION — required to safely apply compression therapy for venous ulcer per primary source.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("REPEAT ABI annually for diabetics + at-risk; sooner if symptoms change.", citationIDs: ["specialty_labs_round24"])
        ],
        watchFor: [
            AttributedBullet("CRITICAL LIMB ISCHEMIA (CLI) — ABI <0.4 + rest pain + non-healing wound or gangrene; URGENT vascular surgery; amputation risk high without revascularization.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("FALSELY NORMAL ABI in calcified vessels — TBI / TcPO2 alternative.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("INTERMITTENT CLAUDICATION — exercise program; cilostazol pharmacotherapy; smoking cessation; revascularization for refractory.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("CARDIOVASCULAR mortality — PAD is marker of generalized atherosclerosis; aggressive CV risk reduction (statin, BP, antiplatelet, smoking cessation).", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("MIXED VENOUS-ARTERIAL ulcer — ABI 0.5-0.8; modified low-compression under specialty supervision.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("DIABETIC PATIENTS — annual ABI; lower threshold for vascular workup; combine with monofilament neuropathy screening.", citationIDs: ["specialty_labs_round24"])
        ],
        citations: [openrnLabsR24, specialtyLabsR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PrealbuminSample {
    public static let entry: LabEntry = LabEntry(
        id: "prealbumin",
        title: "Prealbumin (transthyretin)",
        subtitle: "Blood · inflammation and interpretation limits",
        specimen: "Blood; follow the collecting laboratory’s instructions",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        referenceRanges: [
            ReferenceRangeRow(value: "Laboratory-specific", label: "Use the interval on the report", citationIDs: ["review_prealbumin_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low, label: "Low prealbumin",
                summary: "Prealbumin is made in the liver and transports thyroid hormone and vitamin A. Inflammation, illness and injury can lower the result, making its cause difficult to identify from the concentration alone.",
                nursingActions: ["Review the clinical reason for testing and the patient’s illness or recovery stage.", "Additional assessment may be needed to understand an abnormal result."],
                citationIDs: ["review_prealbumin"]
            )
        ],
        commonCauses: [
            CauseGroup(title: "Lower results may accompany", causes: ["Inflammation, infection or burns", "Liver or digestive disease", "Hyperthyroidism", "Malnutrition may coexist"], citationIDs: ["review_prealbumin"]),
            CauseGroup(title: "Higher results may accompany", causes: ["Kidney failure", "Hodgkin disease", "Alcohol use disorder or corticosteroid therapy"], citationIDs: ["review_prealbumin"])
        ],
        nursingActions: [
            AttributedBullet("Testing generally needs no special preparation. Review medicines and supplements; patients should not stop medicines without instructions from their clinician.", citationIDs: ["review_prealbumin"]),
            AttributedBullet("Neither prealbumin nor albumin is a reliable nutrition marker. Assess intake, weight changes, physical findings and function instead of using either concentration to judge nutritional adequacy.", citationIDs: ["review_prealbumin_aspen"]),
            AttributedBullet("Ask about weight loss, weakness and other nutrition concerns. Illness, injury or postoperative recovery may complicate interpretation; communicate the findings for a broader assessment.", citationIDs: ["review_prealbumin"])
        ],
        watchFor: [
            AttributedBullet("A normal CRP does not make prealbumin a validated nutrition marker. A rising concentration alone does not prove successful nutrition support.", citationIDs: ["review_prealbumin_aspen"]),
            AttributedBullet("An elevated result is not a diagnostic test for kidney failure or the other associated conditions. Other testing may be needed.", citationIDs: ["review_prealbumin"])
        ],
        citations: [reviewPrealbumin, reviewPrealbuminASPEN, reviewPrealbuminRanges],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum MMAHomocysteineSample {
    public static let entry: LabEntry = LabEntry(
        id: "mma-homocysteine",
        title: "Methylmalonic acid (MMA) + homocysteine",
        subtitle: "Confirms B12 / folate deficiency when serum levels borderline · MMA up = B12 def specifically · Homocysteine up = either",
        specimen: "Serum MMA + homocysteine; fasting preferred; collect on ice (homocysteine continues to rise in vitro)",
        nclexTags: labsTagsR24,
        referenceRanges: [
            ReferenceRangeRow(value: "MMA <0.4 µmol/L", label: "Normal", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "MMA 0.4-1.0 µmol/L", label: "Borderline elevated — may indicate B12 deficiency", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "MMA >1.0 µmol/L", label: "Elevated — strongly suggests B12 deficiency (specific marker)", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "Homocysteine <12 µmol/L", label: "Normal", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "Homocysteine 12-30 µmol/L", label: "Mild elevation — B12 OR folate deficiency", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "Homocysteine >30 µmol/L", label: "Significantly elevated — deficiency confirmed; CV risk marker", citationIDs: ["specialty_labs_round24"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal MMA + homocysteine",
                summary: "Rules out B12 + folate deficiency at functional level. Even if serum B12 borderline (200-400 pg/mL), normal MMA + homocysteine = adequate per primary source.",
                nursingActions: [
                    "No vitamin replacement needed.",
                    "If clinical suspicion remains (neuropathy, anemia), consider other causes."
                ],
                citationIDs: ["specialty_labs_round24"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated MMA — B12 deficiency confirmed",
                summary: "MMA is SPECIFIC for B12 deficiency (only B12 cofactor for MMA → succinyl-CoA conversion). Confirms B12 deficiency even when serum B12 borderline. Initiate B12 replacement per primary source.",
                nursingActions: [
                    "B12 REPLACEMENT — oral high-dose 1000-2000 mcg/day OR IM 1000 mcg/week × 4 then monthly.",
                    "Workup CAUSE — pernicious anemia (anti-IF + anti-parietal cell Ab), atrophic gastritis, malabsorption, dietary, drug-induced (metformin, PPI, H2 blocker, colchicine).",
                    "Recheck MMA at 3-6 months — should normalize with adequate replacement.",
                    "If neurologic symptoms — early replacement crucial; some deficits may not fully reverse.",
                    "Continue lifelong if cause is irreversible (pernicious anemia, post-bariatric, ileal disease)."
                ],
                citationIDs: ["specialty_labs_round24"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated homocysteine + normal MMA — folate deficiency",
                summary: "Homocysteine elevated WITHOUT MMA elevation suggests folate deficiency (folate cofactor for homocysteine → methionine but not for MMA). Folate replacement; check + treat B12 first to avoid masking neuro damage per primary source.",
                nursingActions: [
                    "FOLATE REPLACEMENT — 1-5 mg/day PO for deficiency.",
                    "ALWAYS check + replete B12 FIRST or together — folate alone treats anemia but NOT B12 neuro damage.",
                    "Workup cause — alcoholism, pregnancy, malabsorption (celiac, IBD), medications (methotrexate, sulfasalazine, phenytoin, TMP-SMX), poor dietary intake.",
                    "Recheck at 3 months."
                ],
                citationIDs: ["specialty_labs_round24"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated MMA (B12 deficiency)",
                causes: ["Pernicious anemia (autoimmune intrinsic factor deficiency)", "Atrophic gastritis", "Strict vegan diet (>1 year)", "Bariatric surgery / gastrectomy", "Terminal ileum disease (Crohn's, resection)", "Long-term metformin / PPI / H2 blocker / colchicine"],
                citationIDs: ["specialty_labs_round24"]
            ),
            CauseGroup(
                title: "Elevated homocysteine alone (folate deficiency)",
                causes: ["Alcoholism", "Pregnancy (insufficient supplementation)", "Methotrexate / sulfasalazine / TMP-SMX / phenytoin", "Malabsorption (celiac, IBD)", "Hemodialysis"],
                citationIDs: ["specialty_labs_round24"]
            )
        ],
        nursingActions: [
            AttributedBullet("USE FOR — borderline B12 levels (200-400 pg/mL); cognitive impairment in elderly with normal-low B12; megaloblastic anemia distinguishing folate vs B12.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("MMA is SPECIFIC for B12 deficiency; homocysteine is sensitive for both B12 + folate.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("PATTERN — MMA up + homocysteine up = B12 deficiency; MMA normal + homocysteine up = folate deficiency.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("Specimen handling — collect homocysteine on ICE; continues to rise in vitro at room temperature.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("CHECK B12 + folate + MMA + homocysteine + TSH in unexplained anemia / neurologic / cognitive decline workup.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("Recheck after 3-6 months of replacement to confirm response.", citationIDs: ["specialty_labs_round24"])
        ],
        watchFor: [
            AttributedBullet("FALSELY ELEVATED MMA — renal failure (impaired excretion), small intestinal bacterial overgrowth (SIBO).", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("FALSELY ELEVATED HOMOCYSTEINE — renal failure, hypothyroidism, smoking, age, MTHFR polymorphism (consider methylated folate / B12).", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("HOMOCYSTEINE + cardiovascular risk — modest associations; supplementation does NOT reduce CV events; CV markers limited utility per primary source.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("B12 NEUROLOGIC DEFICIT — early replacement crucial; permanent if delayed; check MMA in patients with cognitive decline / neuropathy + borderline B12.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("METFORMIN long-term users — consider annual B12 screening (or MMA if borderline); supplementation if low.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("PERNICIOUS ANEMIA — autoimmune; anti-IF + anti-parietal cell Ab; lifelong replacement; screen autoimmune cluster (thyroid, T1DM).", citationIDs: ["specialty_labs_round24"])
        ],
        citations: [openrnLabsR24, specialtyLabsR24],
        lastSourceFidelityReview: "2026-05-12"
    )
}
