import Foundation

// Curator-model lab entries (round 15 — rheumatology + ID).

private let openrnLabsR15 = CitationSource(
    id: "openrn_labs_round15",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR15 = CitationSource(
    id: "specialty_labs_round15",
    shortName: "ACR / DHHS / IDSA guidance (concept citation)",
    publisher: "ACR · DHHS · IDSA",
    license: .factCitationOnly,
    url: "https://clinicalinfo.hiv.gov/en/guidelines/",
    lastRetrieved: "2026-05-04"
)

private let labsTagsR15 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)

public enum RheumatoidFactorSample {
    public static let entry: LabEntry = LabEntry(
        id: "rheumatoid-factor",
        title: "Rheumatoid factor (RF)",
        subtitle: "IgM autoantibody · RA + Sjögren's + cryoglobulinemia · low specificity",
        specimen: "Serum",
        nclexTags: labsTagsR15,
        referenceRanges: [
            ReferenceRangeRow(value: "<14 IU/mL (varies by assay)", label: "Negative / normal", citationIDs: ["openrn_labs_round15"]),
            ReferenceRangeRow(value: "≥14 IU/mL", label: "Positive — interpret with anti-CCP + clinical context", citationIDs: ["specialty_labs_round15"]),
            ReferenceRangeRow(value: ">3× upper limit of normal", label: "High titer — supports RA or other condition", citationIDs: ["specialty_labs_round15"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative",
                summary: "RF below assay cutoff. Does not rule out RA — ~30% of RA is seronegative; combine with anti-CCP, ESR/CRP, joint exam, imaging per primary source.",
                nursingActions: [
                    "Interpret with full clinical picture; do not exclude RA solely on RF.",
                    "Order anti-CCP if RA suspected; specificity ~95%."
                ],
                citationIDs: ["openrn_labs_round15", "specialty_labs_round15"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive — low to moderate titer",
                summary: "Positive in many conditions besides RA — Sjögren's, SLE, cryoglobulinemia (especially HCV), endocarditis, syphilis, hepatitis, HIV, malignancy, sarcoidosis, healthy elderly per primary source.",
                nursingActions: [
                    "Combine with anti-CCP + clinical exam + imaging for RA diagnosis.",
                    "Consider HCV testing in unexplained high titer.",
                    "Counsel patient about possible incidental positivity."
                ],
                citationIDs: ["openrn_labs_round15", "specialty_labs_round15"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "High titer + clinical RA",
                summary: "Very high RF + anti-CCP positive supports RA + correlates with more severe / erosive disease + extra-articular manifestations per primary source.",
                nursingActions: [
                    "Initiate ACR-recommended early DMARD therapy.",
                    "Baseline cardiac + pulmonary screening for extra-articular RA.",
                    "Counsel about long-term joint protection + treatment adherence."
                ],
                citationIDs: ["specialty_labs_round15"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Rheumatic / autoimmune",
                causes: ["Rheumatoid arthritis", "Sjögren's syndrome", "SLE", "Mixed connective tissue disease"],
                citationIDs: ["openrn_labs_round15"]
            ),
            CauseGroup(
                title: "Infection",
                causes: ["Hepatitis B / C (especially HCV cryoglobulinemia)", "Endocarditis", "Tuberculosis", "Syphilis", "HIV"],
                citationIDs: ["openrn_labs_round15"]
            ),
            CauseGroup(
                title: "Other",
                causes: ["Healthy elderly (5–10%)", "Sarcoidosis", "Malignancy / cryoglobulinemia"],
                citationIDs: ["openrn_labs_round15"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum (red top / SST); fasting not required.", citationIDs: ["openrn_labs_round15"]),
            AttributedBullet("Interpret WITH anti-CCP, ESR/CRP, and clinical / imaging findings — never alone per primary source.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Negative does not rule out RA; positive does not confirm it.", citationIDs: ["openrn_labs_round15"]),
            AttributedBullet("Hepatitis C — leading non-rheumatic cause of high-titer RF; consider HCV testing.", citationIDs: ["specialty_labs_round15"])
        ],
        watchFor: [
            AttributedBullet("False-positive in healthy elderly — counsel patient before testing about result interpretation.", citationIDs: ["openrn_labs_round15"]),
            AttributedBullet("Cryoglobulinemia (especially HCV) — high-titer RF + skin / nerve / kidney involvement.", citationIDs: ["specialty_labs_round15"])
        ],
        citations: [openrnLabsR15, specialtyLabsR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AntiDsDNASample {
    public static let entry: LabEntry = LabEntry(
        id: "anti-dsdna",
        title: "Anti-double-stranded DNA antibodies",
        subtitle: "Lupus-specific · trends with disease activity · LUPUS NEPHRITIS marker",
        specimen: "Serum",
        nclexTags: labsTagsR15,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative / low titer (varies by assay)", label: "Normal", citationIDs: ["openrn_labs_round15"]),
            ReferenceRangeRow(value: "Positive (titer-dependent)", label: "Strongly suggests SLE", citationIDs: ["specialty_labs_round15"]),
            ReferenceRangeRow(value: "Rising titer + falling C3/C4", label: "Consistent with active flare / lupus nephritis", citationIDs: ["specialty_labs_round15"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative",
                summary: "Below assay cutoff — does not rule out SLE; ANA + clinical criteria still relevant. Drug-induced lupus typically has anti-histone antibodies + negative anti-dsDNA per primary source.",
                nursingActions: [
                    "If lupus suspected, repeat with clinical change + complement levels.",
                    "Consider anti-Sm, anti-Ro/La, antiphospholipid panel."
                ],
                citationIDs: ["openrn_labs_round15", "specialty_labs_round15"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive (stable)",
                summary: "Highly specific for SLE (>95%); part of ACR / EULAR 2019 SLE classification criteria. Sensitivity 70% in active lupus, lower in quiescent per primary source.",
                nursingActions: [
                    "Trend over time vs single value.",
                    "Pair with C3 / C4 + urinalysis + spot urine PCR + creatinine for nephritis surveillance.",
                    "Counsel flare signs (rash, arthralgia, fatigue, mucosal ulcers, edema)."
                ],
                citationIDs: ["specialty_labs_round15"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Rising titer + low complement + clinical worsening",
                summary: "LUPUS FLARE / NEPHRITIS — escalate immunosuppressive therapy; consider renal biopsy if proteinuria / new urinary sediment per primary source.",
                nursingActions: [
                    "Urgent rheumatology / nephrology consultation.",
                    "Repeat creatinine, urinalysis, urine PCR, complement; consider renal biopsy.",
                    "Counsel patient + adherence to escalated regimen."
                ],
                citationIDs: ["specialty_labs_round15"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "SLE-related",
                causes: ["Active lupus nephritis", "Lupus flare with skin / serositis / arthritis", "Antiphospholipid syndrome co-occurrence"],
                citationIDs: ["specialty_labs_round15"]
            ),
            CauseGroup(
                title: "Differentials",
                causes: ["Drug-induced lupus (anti-histone +, anti-dsDNA usually –)", "Rare overlap syndromes"],
                citationIDs: ["openrn_labs_round15"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum.", citationIDs: ["openrn_labs_round15"]),
            AttributedBullet("Trend over time vs single value for lupus management.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Pair with C3 / C4 + urinalysis / spot UPCR + creatinine for nephritis surveillance per primary source.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Pregnancy planning — quiescent disease ≥6 months + low / stable anti-dsDNA reduces flare + fetal complications.", citationIDs: ["specialty_labs_round15"])
        ],
        watchFor: [
            AttributedBullet("Lupus nephritis — proteinuria, hematuria, casts, rising creatinine + rising anti-dsDNA + falling complement.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Antiphospholipid syndrome co-occurrence — thrombosis + miscarriage history; screen lupus anticoagulant + ACL + β2-GP1.", citationIDs: ["specialty_labs_round15"])
        ],
        citations: [openrnLabsR15, specialtyLabsR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum HIVMonitoringSample {
    public static let entry: LabEntry = LabEntry(
        id: "hiv-viral-load-cd4",
        title: "HIV viral load + CD4 count",
        subtitle: "Treatment monitoring · suppression goal · OI risk stratification",
        specimen: "EDTA whole blood (HIV RNA PCR + CD4 flow cytometry)",
        nclexTags: labsTagsR15,
        referenceRanges: [
            ReferenceRangeRow(value: "Not detected (<20–50 copies/mL)", label: "Suppressed on effective ART", citationIDs: ["specialty_labs_round15"]),
            ReferenceRangeRow(value: "20–199 copies/mL", label: "Low-level viremia — assess adherence + resistance", citationIDs: ["specialty_labs_round15"]),
            ReferenceRangeRow(value: "≥200 copies/mL persistent", label: "Virologic failure — resistance testing + regimen change", citationIDs: ["specialty_labs_round15"]),
            ReferenceRangeRow(value: "CD4 500–1500 cells/µL", label: "Healthy / normal range", citationIDs: ["specialty_labs_round15"]),
            ReferenceRangeRow(value: "CD4 200–499 cells/µL", label: "Moderate immunosuppression", citationIDs: ["specialty_labs_round15"]),
            ReferenceRangeRow(value: "CD4 <200 cells/µL", label: "AIDS-defining; OI prophylaxis indicated", citationIDs: ["specialty_labs_round15"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Suppressed VL + recovering CD4",
                summary: "Sustained virologic suppression on ART. When suppressed ≥6 months, sexual transmission risk effectively zero (U=U) per primary source.",
                nursingActions: [
                    "Continue current regimen; routine VL + CD4 every 6 months once stable >2 years.",
                    "Counsel U=U; routine cancer screening; vaccinations.",
                    "PrEP for negative partners if desired."
                ],
                citationIDs: ["specialty_labs_round15"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Detectable VL during treatment",
                summary: "Adherence assessment; rule out drug interactions, recent illness; resistance testing if persistent ≥200 copies/mL per primary source.",
                nursingActions: [
                    "Adherence assessment + barriers identification.",
                    "Drug interaction review — antacids, supplements, new medications.",
                    "Resistance genotype if confirmed virologic failure; ID consultation."
                ],
                citationIDs: ["specialty_labs_round15"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "CD4 <200 / new diagnosis with low CD4",
                summary: "AIDS-defining; opportunistic-infection risk threshold for PJP / toxoplasma / cryptococcal prophylaxis per primary source.",
                nursingActions: [
                    "Initiate ART immediately + OI prophylaxis (TMP-SMX for PJP if CD4 <200).",
                    "Screen for active TB / cryptococcal antigen / toxoplasma IgG / hepatitis / STIs.",
                    "Vaccinations per CDC immunocompromised schedule (avoid live in CD4 <200).",
                    "Coordinate care with infectious disease + social work."
                ],
                citationIDs: ["specialty_labs_round15"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Detectable VL on therapy",
                causes: ["Non-adherence (most common)", "Drug interactions / malabsorption", "Resistance / archived mutations", "Drug-drug interaction (rifampin, antacids)"],
                citationIDs: ["specialty_labs_round15"]
            ),
            CauseGroup(
                title: "CD4 changes",
                causes: ["Immune reconstitution after ART (may unmask infection)", "Acute illness can transiently lower CD4", "Chemotherapy / steroid effect", "Aging"],
                citationIDs: ["openrn_labs_round15"]
            )
        ],
        nursingActions: [
            AttributedBullet("Initial baseline panel — HIV-1 RNA, CD4, resistance, HBV / HCV / RPR / IGRA, STI screen, toxoplasma IgG, CBC, CMP, lipids, urinalysis per primary source.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Frequency — viral load every 3 months early; every 6 months if stable + suppressed for >2 years.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Privacy — disclosure laws vary; patient-controlled disclosure; medical record sensitivity protocols.", citationIDs: ["openrn_labs_round15"]),
            AttributedBullet("Counsel adherence — single missed doses can drive resistance.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("U=U — sustained virally suppressed for ≥6 months → sexual transmission risk effectively zero per primary source.", citationIDs: ["specialty_labs_round15"])
        ],
        watchFor: [
            AttributedBullet("Persistent VL >200 — virologic failure; resistance genotype + regimen change per primary source.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Acute opportunistic infection — fever, weight loss, persistent cough, focal neuro deficits → OI workup.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("Immune reconstitution syndrome — within months of starting ART; can unmask latent infection.", citationIDs: ["specialty_labs_round15"]),
            AttributedBullet("PrEP for partners — confirm HIV-negative every 3 months on PrEP.", citationIDs: ["specialty_labs_round15"])
        ],
        citations: [openrnLabsR15, specialtyLabsR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}
