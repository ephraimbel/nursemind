import Foundation

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
        subtitle: "Short half-life (2-3 days) nutritional marker · more responsive than albumin · ALSO acute phase reactant — drops in inflammation",
        specimen: "Serum (no fasting required); preferred over albumin for tracking acute nutritional response",
        nclexTags: labsTagsR24,
        referenceRanges: [
            ReferenceRangeRow(value: ">20 mg/dL", label: "Normal — adequate nutrition", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "15-20 mg/dL", label: "Mild depletion / mild risk", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "10-15 mg/dL", label: "Moderate depletion", citationIDs: ["specialty_labs_round24"]),
            ReferenceRangeRow(value: "<10 mg/dL", label: "Severe depletion / high risk for malnutrition complications", citationIDs: ["specialty_labs_round24"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal prealbumin",
                summary: "Adequate nutrition + protein synthesis. Continue routine assessment. Especially in geriatric + chronically ill, monitor as part of nutritional surveillance per primary source.",
                nursingActions: [
                    "Continue routine nutrition + monitoring.",
                    "Recheck if clinical signs of malnutrition or chronic disease."
                ],
                citationIDs: ["specialty_labs_round24"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Low prealbumin — malnutrition vs inflammation",
                summary: "Indicates protein-calorie malnutrition OR acute inflammation OR liver disease (decreased synthesis) OR proteinuria (loss). MUST DISTINGUISH from acute phase reactant (CRP elevated suggests inflammation, not pure malnutrition) per primary source.",
                nursingActions: [
                    "Check CRP simultaneously — high CRP + low prealbumin suggests inflammation / acute illness, not pure malnutrition.",
                    "Comprehensive nutritional assessment — weight, BMI, intake, food preferences, dental status, swallowing.",
                    "Calorie + protein needs calculation — typically 25-35 kcal/kg/day, 1.2-1.5 g protein/kg/day in elderly.",
                    "Nutritional support — oral supplements (Ensure / Boost), enteral feeding for severe / NPO, parenteral as last resort.",
                    "Address contributing factors — depression (mirtazapine), dental issues, dysphagia (SLP), polypharmacy.",
                    "Recheck prealbumin in 7-10 days to assess response — short half-life makes it useful for tracking.",
                    "Wound healing concerns — protein-calorie malnutrition impairs healing significantly."
                ],
                citationIDs: ["specialty_labs_round24"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Reduced prealbumin",
                causes: ["Protein-calorie malnutrition", "Acute inflammation / sepsis (acute phase reactant)", "Liver disease (decreased synthesis)", "Chronic disease", "Proteinuria / nephrotic syndrome (loss)", "Hyperthyroidism (increased catabolism)", "Zinc deficiency"],
                citationIDs: ["specialty_labs_round24"]
            ),
            CauseGroup(
                title: "Elevated prealbumin",
                causes: ["Chronic kidney disease (rare)", "Adrenal cortical hyperfunction", "Hodgkin disease", "Pregnancy"],
                citationIDs: ["specialty_labs_round24"]
            )
        ],
        nursingActions: [
            AttributedBullet("HALF-LIFE 2-3 days — much more responsive than albumin (half-life 21 days) for tracking acute nutritional changes per primary source.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("PAIR with CRP — CRP elevated + prealbumin low = inflammation; CRP normal + prealbumin low = pure malnutrition (more concerning for nutritional intervention focus).", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("USE for monitoring nutritional intervention response — recheck in 7-10 days; rising = improving.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("Comprehensive nutritional assessment — MNA-SF (Mini Nutritional Assessment Short Form) for elderly; weight loss, food intake, mobility, BMI, neuropsychological status.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("Pair with body weight + intake monitoring + clinical assessment.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("Geriatric / wound healing patients — monitor periodically.", citationIDs: ["specialty_labs_round24"])
        ],
        watchFor: [
            AttributedBullet("WOUND HEALING + PRESSURE INJURY — protein-calorie malnutrition impairs significantly; prealbumin <15 mg/dL strongly associated with delayed healing.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("REFEEDING SYNDROME — when initiating nutrition in severely malnourished; phosphate, magnesium, potassium drop; replete BEFORE + during initiation; thiamine prevention; start low + advance slowly.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("PEG / FEEDING TUBE decisions — limited benefit in advanced dementia; family education + advance care planning.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("CHRONIC DISEASE — frequently low prealbumin; not all causes are reversible; align with goals of care.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("HYPOPROTEINEMIA — also affects drug binding (warfarin, phenytoin, valproic acid) — monitor levels + adjust.", citationIDs: ["specialty_labs_round24"]),
            AttributedBullet("ALBUMIN limitations — too long half-life (21 days) for acute monitoring; affected by hydration status; prealbumin better for serial monitoring.", citationIDs: ["specialty_labs_round24"])
        ],
        citations: [openrnLabsR24, specialtyLabsR24],
        lastSourceFidelityReview: "2026-05-12"
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
