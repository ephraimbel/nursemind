import Foundation

// Curator-model lab entries (round 16 — toxicology + cardiology + ID stewardship).

private let openrnLabsR16 = CitationSource(
    id: "openrn_labs_round16",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR16 = CitationSource(
    id: "specialty_labs_round16",
    shortName: "ACC/AHA / IDSA / ACR concept citations",
    publisher: "ACC · AHA · IDSA · ACR",
    license: .factCitationOnly,
    url: "https://www.acc.org/guidelines",
    lastRetrieved: "2026-05-04"
)

private let labsTagsR16 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .perfusion
)

public enum HSTroponinSample {
    public static let entry: LabEntry = LabEntry(
        id: "troponin-hs",
        title: "High-sensitivity troponin (hs-cTnI / hs-cTnT)",
        subtitle: "Cardiac myocyte injury marker · 0/1h or 0/3h algorithms · sex-specific cutoffs",
        specimen: "Serum or plasma; sex-specific cutoffs by lab",
        nclexTags: labsTagsR16,
        referenceRanges: [
            ReferenceRangeRow(value: "Sex-specific 99th percentile (varies by lab)", label: "Reference upper limit", citationIDs: ["specialty_labs_round16"]),
            ReferenceRangeRow(value: "Below limit of detection (very low value)", label: "Rule out at presentation", citationIDs: ["specialty_labs_round16"]),
            ReferenceRangeRow(value: "Rising or falling pattern with elevation", label: "Acute myocardial injury", citationIDs: ["specialty_labs_round16"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Below detection at presentation + no symptoms",
                summary: "Acute MI ruled out at presentation; consider alternative diagnoses; risk stratify other causes of chest pain per primary source.",
                nursingActions: [
                    "Continue cardiac evaluation if clinical suspicion remains.",
                    "Reassess for non-MI causes of chest pain (PE, dissection, GERD, MSK).",
                    "Counsel patient + arrange follow-up."
                ],
                citationIDs: ["specialty_labs_round16"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated above 99th percentile + rising/falling",
                summary: "Acute myocardial injury — Type 1 (plaque rupture) vs Type 2 (supply-demand mismatch — sepsis, hypoxia, tachyarrhythmia, anemia, severe HTN, hypotension); pattern + clinical context determines per primary source.",
                nursingActions: [
                    "Serial troponin per facility protocol (0/1h, 0/3h, 0/6h).",
                    "ECG every 15–30 min during initial workup.",
                    "Treat underlying cause; cardiology consultation; consider ACS protocol.",
                    "Coordinate echo, cardiac MRI, or angiography per indication."
                ],
                citationIDs: ["specialty_labs_round16"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Markedly elevated + clinical ACS / shock",
                summary: "STEMI / NSTEMI / cardiogenic shock; emergent intervention per primary source.",
                nursingActions: [
                    "Activate STEMI / cath-lab protocol per ECG findings.",
                    "Continuous cardiac monitoring + arterial line + ICU admission.",
                    "Antiplatelets, anticoagulation, oxygen, nitrates per ACS bundle.",
                    "Code cart at bedside; arrhythmia precautions."
                ],
                citationIDs: ["specialty_labs_round16"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Type 1 (atherothrombotic / plaque rupture)",
                causes: ["STEMI", "NSTEMI", "Plaque erosion + thrombus"],
                citationIDs: ["specialty_labs_round16"]
            ),
            CauseGroup(
                title: "Type 2 (supply / demand mismatch)",
                causes: ["Sepsis", "Hypoxia / respiratory failure", "Tachyarrhythmia", "Severe HTN / hypotension", "Anemia", "Cocaine / sympathomimetic"],
                citationIDs: ["specialty_labs_round16"]
            ),
            CauseGroup(
                title: "Non-ischemic injury",
                causes: ["Myocarditis", "Heart failure decompensation", "Pulmonary embolism", "Cardiotoxic chemotherapy", "Sepsis-induced cardiomyopathy", "Renal failure (chronic stable elevations)"],
                citationIDs: ["specialty_labs_round16"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum or plasma; centrifuge promptly; refrigerate or analyze within timeframe.", citationIDs: ["openrn_labs_round16"]),
            AttributedBullet("Use sex-specific 99th percentile cutoffs per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Serial sampling — 0/1h or 0/3h algorithms per facility protocol; rising / falling pattern key per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Always interpret with ECG + clinical presentation; troponin alone does NOT confirm ACS.", citationIDs: ["openrn_labs_round16"]),
            AttributedBullet("Renal failure — chronic mild elevations common; trends matter more than single values.", citationIDs: ["specialty_labs_round16"])
        ],
        watchFor: [
            AttributedBullet("STEMI on ECG with rising troponin — emergent cath lab; do not wait for second troponin.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Type 2 MI in critical illness — manage underlying cause primarily; not always coronary.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("False elevations — analytical interferences (heterophile antibodies, biotin); discuss with lab if discordant.", citationIDs: ["openrn_labs_round16"])
        ],
        citations: [openrnLabsR16, specialtyLabsR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DDimerVTESample {
    public static let entry: LabEntry = LabEntry(
        id: "d-dimer-vte",
        title: "D-dimer (VTE workup)",
        subtitle: "Fibrin degradation product · rule-out tool · age-adjusted cutoffs · YEARS criteria",
        specimen: "Plasma (citrate tube)",
        nclexTags: labsTagsR16,
        referenceRanges: [
            ReferenceRangeRow(value: "<500 ng/mL FEU (varies by assay)", label: "Standard cutoff — rule out VTE in low pretest probability", citationIDs: ["specialty_labs_round16"]),
            ReferenceRangeRow(value: "<(age × 10) ng/mL FEU for age >50", label: "Age-adjusted cutoff — improves specificity", citationIDs: ["specialty_labs_round16"]),
            ReferenceRangeRow(value: "Above cutoff", label: "VTE not excluded — proceed to imaging", citationIDs: ["specialty_labs_round16"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Below cutoff + low/intermediate pretest probability",
                summary: "VTE effectively excluded — no further imaging needed in low-risk patients per Wells / Geneva / YEARS criteria per primary source.",
                nursingActions: [
                    "Document rule-out + clinical scoring used.",
                    "Continue evaluation for alternative diagnoses.",
                    "Counsel patient + arrange follow-up."
                ],
                citationIDs: ["specialty_labs_round16"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Above cutoff",
                summary: "VTE not excluded — proceed to definitive imaging (CTPA for PE, ultrasound for DVT). Many non-VTE causes elevate D-dimer per primary source.",
                nursingActions: [
                    "Order CTPA / VQ scan (PE suspicion) or extremity Doppler ultrasound (DVT suspicion).",
                    "Consider therapeutic anticoagulation if high probability while imaging pending.",
                    "Risk-stratify with PESI / sPESI; coordinate disposition."
                ],
                citationIDs: ["specialty_labs_round16"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Very high D-dimer + suspected massive PE / DIC",
                summary: "Massive PE with hemodynamic compromise — emergent thrombolysis / catheter-directed therapy / surgical embolectomy. DIC — ICU, treat underlying cause per primary source.",
                nursingActions: [
                    "Emergent CTPA or echo (RV strain) at bedside if hemodynamically unstable.",
                    "Activate massive PE response team if available.",
                    "ICU admission; vasopressors / oxygen / advanced airway as needed.",
                    "Coordinate thrombolysis vs catheter-directed therapy."
                ],
                citationIDs: ["specialty_labs_round16"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Venous thromboembolism",
                causes: ["DVT", "PE", "Cerebral venous thrombosis", "Intra-cardiac thrombus"],
                citationIDs: ["specialty_labs_round16"]
            ),
            CauseGroup(
                title: "Non-VTE elevations",
                causes: ["Recent surgery / trauma", "Pregnancy / postpartum", "Active cancer", "Sepsis / DIC", "Severe illness, hospitalization, immobility", "Aortic dissection", "Older age"],
                citationIDs: ["specialty_labs_round16"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — citrate tube; deliver promptly to lab; avoid hemolysis.", citationIDs: ["openrn_labs_round16"]),
            AttributedBullet("Use only with structured pretest probability tool (Wells, Geneva, YEARS) per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Age-adjusted cutoff for >50 years improves specificity without compromising sensitivity per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Avoid in high-pretest-probability patients — D-dimer is rule-out tool only; proceed directly to imaging in high-risk.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Many false-positive elevations — interpret in clinical context.", citationIDs: ["openrn_labs_round16"])
        ],
        watchFor: [
            AttributedBullet("MASSIVE PE — hemodynamic compromise, RV strain on echo; emergent thrombolysis.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Cancer + VTE — provoked but recurrent; long-term anticoagulation per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Pregnancy — D-dimer rises naturally; YEARS-pregnancy or other algorithms preferred.", citationIDs: ["specialty_labs_round16"])
        ],
        citations: [openrnLabsR16, specialtyLabsR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum FerritinIronStudiesSample {
    public static let entry: LabEntry = LabEntry(
        id: "ferritin-iron-studies",
        title: "Ferritin + iron studies",
        subtitle: "Iron deficiency vs overload · ferritin acute-phase reactant · interpret with TSAT",
        specimen: "Serum (ferritin); serum (iron + TIBC); fasting preferred for iron",
        nclexTags: labsTagsR16,
        referenceRanges: [
            ReferenceRangeRow(value: "Ferritin 30–400 ng/mL (men); 13–150 ng/mL (women premenopausal)", label: "Reference range (varies by lab)", citationIDs: ["openrn_labs_round16"]),
            ReferenceRangeRow(value: "Ferritin <30 ng/mL", label: "Iron deficiency (high specificity)", citationIDs: ["specialty_labs_round16"]),
            ReferenceRangeRow(value: "Ferritin <100 ng/mL with TSAT <20% in CKD / inflammation", label: "Functional iron deficiency", citationIDs: ["specialty_labs_round16"]),
            ReferenceRangeRow(value: "Ferritin >1000 ng/mL", label: "Iron overload OR severe inflammation", citationIDs: ["specialty_labs_round16"]),
            ReferenceRangeRow(value: "TSAT (transferrin saturation) 20–50%", label: "Normal", citationIDs: ["openrn_labs_round16"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Iron deficiency anemia",
                summary: "Low ferritin <30 ng/mL OR low TSAT + low ferritin + microcytic anemia — work up source (GI, GU, menorrhagia, dietary, malabsorption); start iron repletion per primary source.",
                nursingActions: [
                    "Identify cause — endoscopy in adults >50, gyn evaluation in menstruating women, dietary history, celiac screen.",
                    "Start oral iron 65 mg elemental every other day OR daily; vitamin C improves absorption; avoid antacids / dairy at same time.",
                    "IV iron if intolerant / refractory / malabsorptive / blood loss exceeds oral repletion.",
                    "Monitor CBC + ferritin at 4–8 weeks."
                ],
                citationIDs: ["specialty_labs_round16"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Iron overload",
                summary: "Persistently elevated ferritin + high TSAT (>45%) — hemochromatosis (HFE gene), transfusional iron overload, chronic liver disease per primary source.",
                nursingActions: [
                    "Genetic testing (HFE C282Y, H63D); screen first-degree relatives.",
                    "Phlebotomy — therapeutic; until ferritin <50; chelation if anemia precludes phlebotomy.",
                    "Screen complications — diabetes, cirrhosis, cardiomyopathy, arthritis, hypogonadism, skin pigmentation.",
                    "Avoid vitamin C supplements; avoid raw shellfish (Vibrio infections)."
                ],
                citationIDs: ["specialty_labs_round16"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Hyperferritinemia + clinical sepsis / HLH",
                summary: "Markedly elevated ferritin (>10,000 ng/mL) with cytopenias, fever, hepatosplenomegaly → hemophagocytic lymphohistiocytosis (HLH); critical-care emergency per primary source.",
                nursingActions: [
                    "Hematology + critical care consultation immediately.",
                    "Workup HLH-2004 criteria (fever, splenomegaly, cytopenias, hyperTG, hyperferritinemia, hemophagocytosis on biopsy, low NK cell activity, soluble CD25).",
                    "ICU admission; etoposide-based chemotherapy + steroids per protocol."
                ],
                citationIDs: ["specialty_labs_round16"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Iron deficiency",
                causes: ["GI blood loss (PUD, colon cancer, IBD, hookworm)", "Menorrhagia", "Dietary deficiency", "Celiac / malabsorption", "Pregnancy + breastfeeding", "Recurrent blood donation"],
                citationIDs: ["specialty_labs_round16"]
            ),
            CauseGroup(
                title: "Iron overload / elevated ferritin",
                causes: ["Hereditary hemochromatosis", "Transfusion-dependent anemia", "Chronic liver disease", "Inflammation / acute illness (acute-phase reactant)", "Adult-onset Still's disease", "Hemophagocytic lymphohistiocytosis"],
                citationIDs: ["specialty_labs_round16"]
            ),
            CauseGroup(
                title: "Anemia of chronic disease (functional iron deficiency)",
                causes: ["CKD", "Chronic inflammation", "Cancer", "RA / lupus / IBD"],
                citationIDs: ["specialty_labs_round16"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum (ferritin); fasting preferred for serum iron + TIBC.", citationIDs: ["openrn_labs_round16"]),
            AttributedBullet("Ferritin is acute-phase reactant — falsely normal in iron-deficient patients with active inflammation; pair with TSAT + clinical context per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("CKD / inflammation — use ferritin <100 ng/mL + TSAT <20% as functional iron deficiency cutoff per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Counsel oral iron — every other day dosing improves absorption, fewer GI side effects; vitamin C; constipation common.", citationIDs: ["openrn_labs_round16"]),
            AttributedBullet("IV iron — preferred for refractory / malabsorption / dialysis / cancer; modern preparations (ferric carboxymaltose, derisomaltose) low risk.", citationIDs: ["specialty_labs_round16"])
        ],
        watchFor: [
            AttributedBullet("OCCULT GI MALIGNANCY — iron-deficiency anemia in adult >50 → endoscopy + colonoscopy per primary source.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("HEMOCHROMATOSIS — most common genetic disorder in Northern Europeans; screen with TSAT + ferritin in suspected cases.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Pregnancy — iron deficiency common; treat aggressively.", citationIDs: ["specialty_labs_round16"]),
            AttributedBullet("Hyperferritinemia + cytopenias + fever → consider HLH (life-threatening, treatable).", citationIDs: ["specialty_labs_round16"])
        ],
        citations: [openrnLabsR16, specialtyLabsR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}
