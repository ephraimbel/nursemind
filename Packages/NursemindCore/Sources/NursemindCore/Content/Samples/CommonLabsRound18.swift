import Foundation

// Curator-model lab entries (round 18 — heme + onc workup).

private let openrnLabsR18 = CitationSource(
    id: "openrn_labs_round18",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR18 = CitationSource(
    id: "specialty_labs_round18",
    shortName: "ASH / NCCN concept citations",
    publisher: "ASH · NCCN",
    license: .factCitationOnly,
    url: "https://www.hematology.org/",
    lastRetrieved: "2026-05-04"
)

private let labsTagsR18 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .nutrition
)

public enum B12FolateSample {
    public static let entry: LabEntry = LabEntry(
        id: "b12-folate",
        title: "Vitamin B12 + folate",
        subtitle: "Macrocytic anemia workup · neurologic deficits in B12 · always treat B12 first",
        specimen: "Serum (B12 fasting); serum or red cell folate",
        nclexTags: labsTagsR18,
        referenceRanges: [
            ReferenceRangeRow(value: "B12 200–900 pg/mL", label: "Reference (varies by lab)", citationIDs: ["openrn_labs_round18"]),
            ReferenceRangeRow(value: "B12 <200 pg/mL", label: "Deficient — treat", citationIDs: ["specialty_labs_round18"]),
            ReferenceRangeRow(value: "B12 200–300 pg/mL", label: "Borderline — confirm with MMA + homocysteine", citationIDs: ["specialty_labs_round18"]),
            ReferenceRangeRow(value: "Folate >4 ng/mL serum", label: "Reference", citationIDs: ["openrn_labs_round18"]),
            ReferenceRangeRow(value: "Folate <2 ng/mL serum", label: "Deficient", citationIDs: ["specialty_labs_round18"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "B12 deficiency",
                summary: "Macrocytic anemia (MCV >100), hypersegmented neutrophils, NEUROLOGIC deficits (peripheral neuropathy, subacute combined degeneration, dementia, depression) — neurologic damage may be IRREVERSIBLE if delayed; treat empirically while confirming per primary source.",
                nursingActions: [
                    "Identify cause — pernicious anemia (anti-IF antibodies), strict vegan diet, malabsorption (gastric bypass, ileal disease, metformin, PPI), Diphyllobothrium tapeworm.",
                    "Treat with parenteral B12 (1000 mcg IM daily × 1 week → weekly × 1 month → monthly lifelong) OR high-dose oral 1000–2000 mcg/day.",
                    "Recheck CBC + MCV at 8 weeks; reticulocytosis within days.",
                    "ALWAYS treat B12 BEFORE folate when both deficient — folate alone unmasks B12 neurologic damage."
                ],
                citationIDs: ["specialty_labs_round18"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Folate deficiency",
                summary: "Macrocytic anemia + hypersegmented neutrophils WITHOUT neurologic deficits (vs B12). Confirm with elevated homocysteine + NORMAL methylmalonic acid (MMA elevated in B12, normal in folate) per primary source.",
                nursingActions: [
                    "Identify cause — dietary (alcoholism, anorexia, elderly), malabsorption (celiac, IBD), drugs (phenytoin, MTX, TMP-SMX), pregnancy, hemolysis.",
                    "Treat with folic acid 1–5 mg PO daily; recheck CBC at 8 weeks.",
                    "Pregnancy — 0.4–0.8 mg daily prevention; 4 mg if prior NTD.",
                    "Counsel — never replace folate alone if B12 status uncertain."
                ],
                citationIDs: ["specialty_labs_round18"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Combined deficiency or borderline",
                summary: "Borderline B12 with macrocytic anemia + symptoms — confirm with MMA + homocysteine + treat empirically per primary source.",
                nursingActions: [
                    "MMA + homocysteine — both elevated B12; only homocysteine elevated folate.",
                    "Empirically treat B12 first; add folate after.",
                    "Underlying cause workup essential."
                ],
                citationIDs: ["specialty_labs_round18"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "B12 deficiency",
                causes: ["Pernicious anemia (autoimmune)", "Strict vegan diet", "Bariatric surgery / gastrectomy", "Ileal disease (Crohn's, terminal ileum resection)", "Long-term metformin", "Long-term PPI / H2 blocker", "Diphyllobothrium tapeworm"],
                citationIDs: ["specialty_labs_round18"]
            ),
            CauseGroup(
                title: "Folate deficiency",
                causes: ["Dietary (alcoholism, elderly, anorexia)", "Malabsorption (celiac, IBD)", "Pregnancy + breastfeeding", "Hemolysis", "Drugs (MTX, TMP-SMX, phenytoin, sulfasalazine)", "Hemodialysis"],
                citationIDs: ["specialty_labs_round18"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum B12 fasting preferred; folate serum or red cell (more reliable for true status).", citationIDs: ["openrn_labs_round18"]),
            AttributedBullet("Always check both when macrocytic anemia or neurologic symptoms suggest deficiency.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("MMA + homocysteine confirm B12 vs folate when borderline.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("ALWAYS treat B12 before folate — folate alone can mask neurologic damage.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Elderly — high prevalence; screen if cognitive decline / neuropathy / anemia.", citationIDs: ["specialty_labs_round18"])
        ],
        watchFor: [
            AttributedBullet("IRREVERSIBLE neurologic damage from delayed B12 replacement — early treatment crucial.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Pernicious anemia — autoimmune; lifelong B12 therapy + screening for other autoimmune (thyroid, T1DM).", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Pregnancy — folic acid supplementation prevents NTDs; high dose if family history.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Hypokalemia during initial B12 replacement — rapid erythropoiesis consumes K+.", citationIDs: ["openrn_labs_round18"])
        ],
        citations: [openrnLabsR18, specialtyLabsR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum MMASample {
    public static let entry: LabEntry = LabEntry(
        id: "methylmalonic-acid",
        title: "Methylmalonic acid (MMA)",
        subtitle: "Confirms B12 deficiency · sensitive in early / borderline · NORMAL in folate deficiency",
        specimen: "Serum or 24-hour urine",
        nclexTags: labsTagsR18,
        referenceRanges: [
            ReferenceRangeRow(value: "Serum MMA <0.4 µmol/L", label: "Normal — argues against B12 deficiency", citationIDs: ["specialty_labs_round18"]),
            ReferenceRangeRow(value: "Serum MMA 0.4–1.0 µmol/L", label: "Mild elevation — B12 deficiency probable", citationIDs: ["specialty_labs_round18"]),
            ReferenceRangeRow(value: "Serum MMA >1.0 µmol/L", label: "Significant elevation — B12 deficiency or methylmalonic acidemia", citationIDs: ["specialty_labs_round18"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal MMA",
                summary: "Argues strongly against B12 deficiency. If macrocytic anemia + normal MMA → consider folate deficiency, MDS, hypothyroidism, alcohol, drug-induced (MTX, hydroxyurea), reticulocytosis per primary source.",
                nursingActions: [
                    "Pursue alternative cause of macrocytic anemia.",
                    "Folate level + reticulocyte count + TSH + drug history."
                ],
                citationIDs: ["specialty_labs_round18"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated MMA + low/borderline B12",
                summary: "Confirms B12 deficiency; treat parenteral B12. MMA more sensitive than B12 level alone, especially in borderline B12 (200–300) with symptoms per primary source.",
                nursingActions: [
                    "Initiate B12 replacement (parenteral or high-dose PO).",
                    "Investigate cause — pernicious anemia (anti-IF antibodies), malabsorption.",
                    "Recheck MMA after treatment to confirm response."
                ],
                citationIDs: ["specialty_labs_round18"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Markedly elevated MMA + neurologic symptoms",
                summary: "Severe B12 deficiency with neurologic involvement — emergent parenteral B12; prevent permanent damage per primary source.",
                nursingActions: [
                    "Parenteral B12 1000 mcg IM daily × 1 week then weekly × 1 month.",
                    "Neurologic baseline + serial assessment.",
                    "Underlying cause workup; long-term lifelong replacement."
                ],
                citationIDs: ["specialty_labs_round18"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated MMA",
                causes: ["B12 deficiency (most common reason for testing)", "Renal failure (modest elevation)", "Methylmalonic acidemia (genetic — neonatal screening)", "Volume contraction"],
                citationIDs: ["specialty_labs_round18"]
            ),
            CauseGroup(
                title: "Normal MMA",
                causes: ["Folate deficiency (homocysteine elevated, MMA normal)", "Non-B12 macrocytic anemia (MDS, hypothyroidism, alcohol, drugs)"],
                citationIDs: ["specialty_labs_round18"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum (preferred) or 24-hour urine.", citationIDs: ["openrn_labs_round18"]),
            AttributedBullet("Order with B12 + homocysteine to fully clarify deficiency type.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("More sensitive than B12 level alone — especially in borderline ranges.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Renal failure can falsely elevate — interpret with caution.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Newborn screening — methylmalonic acidemia detection.", citationIDs: ["specialty_labs_round18"])
        ],
        watchFor: [
            AttributedBullet("FALSE POSITIVE in renal failure — modest elevations from reduced clearance.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Methylmalonic acidemia (genetic) — pediatric metabolic crisis; specialty management.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Treatment response — MMA falls within days-weeks of effective B12 repletion.", citationIDs: ["specialty_labs_round18"])
        ],
        citations: [openrnLabsR18, specialtyLabsR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LDHR18Sample {
    public static let entry: LabEntry = LabEntry(
        id: "lactate-dehydrogenase",
        title: "Lactate dehydrogenase (LDH)",
        subtitle: "Cell turnover marker · hemolysis + tumor lysis + ischemia · non-specific but useful trend",
        specimen: "Serum (avoid hemolysis — falsely elevates)",
        nclexTags: labsTagsR18,
        referenceRanges: [
            ReferenceRangeRow(value: "140–280 U/L (varies by lab + assay)", label: "Reference range", citationIDs: ["openrn_labs_round18"]),
            ReferenceRangeRow(value: ">2× upper limit", label: "Significantly elevated — investigate", citationIDs: ["specialty_labs_round18"]),
            ReferenceRangeRow(value: ">5× upper limit", label: "Markedly elevated — TLS, hemolysis, lymphoma, hepatic ischemia, PCP", citationIDs: ["specialty_labs_round18"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal LDH",
                summary: "No significant cell turnover or tissue injury detected. Continue clinical monitoring; non-specific marker — normal does not exclude disease per primary source.",
                nursingActions: [
                    "Continue clinical evaluation if symptoms persist.",
                    "LDH is not sensitive enough to rule out specific diseases."
                ],
                citationIDs: ["specialty_labs_round18"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Moderately elevated",
                summary: "Many possible causes — hemolysis (most common artifactual), liver disease, MI / muscle injury, malignancy (especially lymphoma + germ cell tumors), ischemia, tissue injury per primary source.",
                nursingActions: [
                    "Confirm sample integrity — repeat if hemolyzed.",
                    "Pair with haptoglobin + bilirubin + reticulocyte count for hemolysis.",
                    "Trend over time + clinical context.",
                    "Investigate per clinical suspicion (lymphoma, germ cell, hepatitis, ischemia)."
                ],
                citationIDs: ["specialty_labs_round18"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Markedly elevated >5× ULN",
                summary: "Tumor lysis syndrome, massive hemolysis, hepatic infarction, severe pulmonary embolism, advanced lymphoma, PJP — life-threatening; emergent workup per primary source.",
                nursingActions: [
                    "Emergent assessment for TLS — uric acid, K+, phos, Ca, creatinine; aggressive prevention if at risk.",
                    "Emergent workup for hepatic ischemia, massive PE, lymphoma.",
                    "PJP in HIV / immunocompromised — empiric treatment + workup."
                ],
                citationIDs: ["specialty_labs_round18"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Marked elevation (>5× ULN)",
                causes: ["Tumor lysis syndrome", "Massive hemolysis (transfusion reaction, MAHA, G6PD crisis)", "Hepatic infarction / necrosis", "Massive PE", "Aggressive lymphoma (especially Burkitt)", "PCP / PJP pneumonia in HIV"],
                citationIDs: ["specialty_labs_round18"]
            ),
            CauseGroup(
                title: "Moderate elevation",
                causes: ["Hemolysis (intravascular more)", "Hepatitis / hepatic congestion", "MI / muscle injury", "Lymphoma + leukemia + germ cell tumors", "Megaloblastic anemia (B12 / folate)", "Pulmonary embolism", "Ovarian cancer (germ cell)", "Pancreatitis"],
                citationIDs: ["specialty_labs_round18"]
            ),
            CauseGroup(
                title: "Artifactual elevation",
                causes: ["Hemolyzed sample (most common)", "Delayed processing", "Prosthetic valve / mechanical hemolysis"],
                citationIDs: ["openrn_labs_round18"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum; AVOID hemolysis (rough handling, slow draw, small needles falsely elevate).", citationIDs: ["openrn_labs_round18"]),
            AttributedBullet("Trend over time more useful than single value.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Pair with haptoglobin + bilirubin + reticulocyte count for hemolysis workup.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("In lymphoma — prognostic + response marker; trend during treatment.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Tumor lysis prevention — high LDH suggests high tumor burden / risk.", citationIDs: ["specialty_labs_round18"])
        ],
        watchFor: [
            AttributedBullet("TUMOR LYSIS SYNDROME — high LDH + hyperuricemia + hyperK + hyperphos + hypoCa + AKI; aggressive prevention before chemo.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("MASSIVE HEMOLYSIS — review transfusion history; G6PD; MAHA workup if microangiopathy signs.", citationIDs: ["openrn_labs_round18"]),
            AttributedBullet("PJP in HIV — elevated LDH supports diagnosis; empirically treat + bronchoscopy.", citationIDs: ["specialty_labs_round18"]),
            AttributedBullet("Falsely elevated from hemolyzed sample — re-draw if isolated finding.", citationIDs: ["openrn_labs_round18"])
        ],
        citations: [openrnLabsR18, specialtyLabsR18],
        lastSourceFidelityReview: "2026-05-04"
    )
}
