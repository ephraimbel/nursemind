import Foundation

// Curator-model lab entries (round 7 expansion — transplant immunology + viral monitoring).
// Sources: Open RN Pharmacology (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), AST / IDSA concept citations.

private let openrnLabsR7 = CitationSource(
    id: "openrn_labs_round7",
    shortName: "Open RN Pharmacology / Health Alterations — therapeutic monitoring",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=therapeutic+drug+monitoring+immunosuppressant",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR7 = CitationSource(
    id: "openstax_labs_round7",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let astConceptR7 = CitationSource(
    id: "ast_concept_round7",
    shortName: "AST / IDSA infection-monitoring guidelines (concept citation)",
    publisher: "American Society of Transplantation · Infectious Diseases Society of America",
    license: .factCitationOnly,
    url: "https://www.myast.org/practice-resources/practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let immunoLabR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let infectionLabR7 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)

// MARK: - Mycophenolate Level

public enum MycophenolateLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "mycophenolate-level",
        title: "Mycophenolic Acid (MPA) Level",
        subtitle: "Trough or AUC monitoring · post-transplant adherence + dose-finding",
        specimen: "Plasma (lavender or green) — trough drawn just before next dose",
        nclexTags: immunoLabR7,
        referenceRanges: [
            ReferenceRangeRow(value: "Trough goal: typically 1.0–3.5 mg/L (varies by indication and protocol)", label: "Trough (per primary source)", citationIDs: ["openrn_labs_round7"]),
            ReferenceRangeRow(value: "AUC₀₋₁₂: 30–60 mg·h/L (more validated than trough)", label: "AUC monitoring", citationIDs: ["ast_concept_round7"]),
            ReferenceRangeRow(value: "Routine TDM not standard for all transplant programs — used selectively per primary source", label: "Practice variation", citationIDs: ["ast_concept_round7"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic MPA",
                summary: "Risk of acute rejection. Common causes: malabsorption, missed doses, drug interactions (cholestyramine, antacids, iron), enzyme induction, diarrhea (paradoxically can reduce levels via altered enterohepatic recirculation).",
                nursingActions: [
                    "Verify dose, timing of last dose, missed doses, and any new GI medications",
                    "Coordinate with transplant team for dose escalation or formulation change (mycophenolate sodium has different bioavailability)",
                    "Review for active rejection — biopsy may be indicated"
                ],
                citationIDs: ["openrn_labs_round7"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic MPA",
                summary: "Increased risk of dose-related toxicity — bone-marrow suppression (neutropenia, anemia, thrombocytopenia), GI symptoms (especially diarrhea), and infection.",
                nursingActions: [
                    "Hold or reduce dose per provider; trend CBC",
                    "Assess for opportunistic infection — fever, sore throat, pneumonia symptoms",
                    "Review interacting drugs — acyclovir / ganciclovir / probenecid raise MPA"
                ],
                citationIDs: ["openrn_labs_round7"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of altered MPA levels",
                causes: [
                    "Antacids, sucralfate, iron — REDUCE absorption (separate by 2 hours)",
                    "Cholestyramine — reduces enterohepatic recirculation, lowers levels",
                    "Acyclovir / ganciclovir / probenecid — RAISE MPA levels via reduced renal clearance",
                    "Diarrhea — altered enterohepatic recirculation (often lowers levels)",
                    "Switch from CellCept (mofetil) to Myfortic (sodium) — different bioavailability"
                ],
                citationIDs: ["openrn_labs_round7"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always draw TROUGH (just before next dose) for trough-based monitoring; AUC monitoring requires multiple timed levels per primary source.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("Document last dose time and any GI medications.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("Pair with simultaneous calcineurin-inhibitor (tacrolimus) trough — most patients are dual-therapy.", citationIDs: ["openrn_labs_round7"])
        ],
        watchFor: [
            AttributedBullet("Bone-marrow suppression — fever, fatigue, easy bleeding; CBC trending.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("Opportunistic infection — CMV, BK virus, PJP; coordinate prophylaxis with transplant team.", citationIDs: ["openrn_labs_round7"])
        ],
        citations: [openrnLabsR7, openstaxLabsR7, astConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CMV Viral Load

public enum CMVViralLoadSample {
    public static let entry: LabEntry = LabEntry(
        id: "cmv-viral-load",
        title: "CMV Viral Load (Quantitative PCR)",
        subtitle: "Surveillance + treatment monitoring in transplant + HIV",
        specimen: "Whole blood or plasma (per assay)",
        nclexTags: infectionLabR7,
        referenceRanges: [
            ReferenceRangeRow(value: "Undetectable / target-not-detected — typical normal", label: "Normal", citationIDs: ["openrn_labs_round7"]),
            ReferenceRangeRow(value: "Reported in IU/mL (international standard) — thresholds vary by lab and patient population", label: "Units (IU/mL)", citationIDs: ["openrn_labs_round7"]),
            ReferenceRangeRow(value: "Preemptive-therapy thresholds vary by transplant center (commonly ≥1000–5000 IU/mL)", label: "Preemptive threshold", citationIDs: ["ast_concept_round7"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Detectable / rising CMV viral load",
                summary: "Early reactivation in immunosuppressed patient. Treatment threshold is center- and patient-specific. Surveillance vs preemptive therapy reduces tissue-invasive disease per primary source.",
                nursingActions: [
                    "Notify transplant / ID team",
                    "Assess for end-organ disease — fever, GI symptoms, cough, retinitis, AMS, transaminitis, cytopenias",
                    "Review immunosuppression intensity; coordinate possible reduction"
                ],
                citationIDs: ["ast_concept_round7"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Tissue-invasive CMV disease",
                summary: "End-organ involvement (pneumonitis, colitis, hepatitis, retinitis, encephalitis). High morbidity. Treatment with valganciclovir or IV ganciclovir per primary source.",
                nursingActions: [
                    "Coordinate IV ganciclovir or PO valganciclovir per provider; obtain biopsy when feasible",
                    "Trend CBC weekly — myelosuppression common; G-CSF support",
                    "Reduce immunosuppression with transplant team",
                    "PJP, antifungal prophylaxis intensification"
                ],
                citationIDs: ["openrn_labs_round7"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Risk factors for CMV reactivation",
                causes: [
                    "D+/R− transplant (donor-positive, recipient-negative)",
                    "Heavy induction (ATG, OKT3)",
                    "Steroid pulse for rejection",
                    "Severe lymphopenia",
                    "Recent organ rejection treatment"
                ],
                citationIDs: ["openrn_labs_round7"]
            )
        ],
        nursingActions: [
            AttributedBullet("Use a single laboratory for serial monitoring — lab-to-lab differences make trends hard to interpret.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("Trend Q1–2 weeks during high-risk period or active treatment per primary source.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("CMV-negative blood products in CMV-seronegative transplant recipients.", citationIDs: ["openrn_labs_round7"])
        ],
        watchFor: [
            AttributedBullet("Drug resistance — CMV viral load NOT falling on appropriate ganciclovir; switch class (foscarnet, cidofovir, maribavir) per primary source.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("Indirect effects — CMV is associated with rejection, opportunistic infection, and PTLD.", citationIDs: ["openrn_labs_round7"])
        ],
        citations: [openrnLabsR7, openstaxLabsR7, astConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CD4 Count

public enum CD4Sample {
    public static let entry: LabEntry = LabEntry(
        id: "cd4-count",
        title: "CD4 Cell Count",
        subtitle: "T-helper count · HIV staging + opportunistic infection prophylaxis",
        specimen: "Whole blood (lavender-top EDTA) — flow cytometry",
        nclexTags: infectionLabR7,
        referenceRanges: [
            ReferenceRangeRow(value: "500–1500 cells/mm³ — typical adult", label: "Normal", citationIDs: ["openstax_labs_round7"]),
            ReferenceRangeRow(value: "<500 — immunocompromised", label: "Mild immune compromise", citationIDs: ["openrn_labs_round7"]),
            ReferenceRangeRow(value: "<200 — AIDS by definition; PJP prophylaxis indicated", label: "AIDS / PJP threshold", citationIDs: ["openrn_labs_round7"]),
            ReferenceRangeRow(value: "<100 — toxoplasmosis prophylaxis indicated", label: "Toxoplasmosis threshold", citationIDs: ["openrn_labs_round7"]),
            ReferenceRangeRow(value: "<50 — MAC prophylaxis indicated; CMV / fungal disease risk peaks", label: "MAC threshold", citationIDs: ["openrn_labs_round7"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "CD4 below opportunistic-infection threshold",
                summary: "Risk of specific opportunistic infections rises in stepwise fashion as CD4 falls. Prophylaxis prevents most. ART improves CD4 over months.",
                nursingActions: [
                    "Initiate or continue prophylaxis per CD4 — TMP-SMX (PJP < 200; toxo < 100); azithromycin (MAC < 50) per primary source",
                    "Reinforce ART adherence — viral suppression restores CD4",
                    "Vaccinate per CDC immunocompromised schedule (avoid live vaccines if CD4 < 200)"
                ],
                citationIDs: ["ast_concept_round7"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Rising CD4 on ART",
                summary: "Indicates response to therapy and immune reconstitution. Discontinuation thresholds for prophylaxis exist (typically CD4 sustained >200 for ≥3 mo to stop PJP) per primary source.",
                nursingActions: [
                    "Reassess prophylaxis indications per current guidelines",
                    "Watch for IRIS — paradoxical worsening of treated infection during immune recovery",
                    "Continue HIV care + screening (cancer, lipid, bone)"
                ],
                citationIDs: ["openrn_labs_round7"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of altered CD4",
                causes: [
                    "HIV (untreated → falls; on ART → rises)",
                    "Acute infection — transient drop",
                    "Cancer chemotherapy",
                    "Immunosuppressants (steroids, calcineurin inhibitors, ATG)",
                    "Splenectomy — falsely elevates count percentage",
                    "Diurnal variation — lowest in morning"
                ],
                citationIDs: ["openrn_labs_round7"]
            )
        ],
        nursingActions: [
            AttributedBullet("Pair CD4 ABSOLUTE count with CD4 PERCENTAGE — the percentage is more stable in non-HIV settings (e.g., post-splenectomy).", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("In HIV, monitor every 3–6 months early on; less frequently once stable on ART per primary source.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("Trend with viral load — both inform adherence + treatment success.", citationIDs: ["openrn_labs_round7"])
        ],
        watchFor: [
            AttributedBullet("CD4 < 200 — fever workup includes PJP; sputum / induced sputum / bronchoscopy.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("CD4 < 50 — fundoscopic exam for CMV retinitis; opportunistic mycoses; consider MAC.", citationIDs: ["openrn_labs_round7"]),
            AttributedBullet("IRIS — within weeks of starting ART; paradoxical worsening; DO NOT stop ART unless severe; treat underlying infection.", citationIDs: ["openrn_labs_round7"])
        ],
        citations: [openrnLabsR7, openstaxLabsR7, astConceptR7],
        lastSourceFidelityReview: "2026-05-04"
    )
}
