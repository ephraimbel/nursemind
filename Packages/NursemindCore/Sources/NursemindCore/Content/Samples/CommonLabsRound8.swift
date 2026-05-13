import Foundation

// Curator-model lab entries (round 8 expansion — GYN tumor marker, gout, RA-specific autoantibody).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), ACR / ASCO concept citations.

private let openrnLabsR8 = CitationSource(
    id: "openrn_labs_round8",
    shortName: "Open RN Health Alterations — oncology + rheumatology labs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=tumor+marker+autoantibody+uric",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR8 = CitationSource(
    id: "openstax_labs_round8",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let specialtyConceptR8L = CitationSource(
    id: "specialty_concept_round8_lab",
    shortName: "ACR / ASCO interpretation guidelines (concept citation)",
    publisher: "American College of Rheumatology · ASCO",
    license: .factCitationOnly,
    url: "https://rheumatology.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let oncoLabR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let metabolicLabR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let rheumLabR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .mobility)

// MARK: - CA-125

public enum CA125Sample {
    public static let entry: LabEntry = LabEntry(
        id: "ca-125",
        title: "CA-125",
        subtitle: "Serum tumor marker · ovarian cancer monitoring · NOT a screening test",
        specimen: "Serum (gold-top SST)",
        nclexTags: oncoLabR8,
        referenceRanges: [
            ReferenceRangeRow(value: "<35 U/mL — typical reference (varies by lab)", label: "Reference (typical)", citationIDs: ["openstax_labs_round8"]),
            ReferenceRangeRow(value: "Many benign causes elevate CA-125 — interpretation requires clinical context", label: "Interpretation rule", citationIDs: ["openrn_labs_round8"]),
            ReferenceRangeRow(value: "NOT recommended as a screening test in average-risk women per primary source", label: "Screening", citationIDs: ["specialty_concept_round8_lab"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated CA-125",
                summary: "In a woman with a known pelvic mass, elevated CA-125 supports concern for ovarian malignancy and helps risk-stratify (e.g., ROMA, RMI scores). In a known ovarian cancer patient, trends correlate with disease status — falling on treatment is favorable; rising suggests recurrence per primary source.",
                nursingActions: [
                    "Coordinate with gynecology / oncology for risk stratification",
                    "Imaging — pelvic US, CT abdomen / pelvis as ordered",
                    "Trend serial values — single value less informative than trajectory"
                ],
                citationIDs: ["specialty_concept_round8_lab"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "BENIGN causes of elevated CA-125 — common",
                causes: [
                    "Menstruation, pregnancy, postpartum",
                    "Endometriosis, leiomyomas, PID",
                    "Cirrhosis, ascites of any cause",
                    "Heart failure, recent surgery, trauma",
                    "Other intra-abdominal inflammation"
                ],
                citationIDs: ["openrn_labs_round8"]
            ),
            CauseGroup(
                title: "MALIGNANT causes of elevated CA-125",
                causes: [
                    "Epithelial ovarian cancer (most established association)",
                    "Endometrial, fallopian tube, peritoneal cancer",
                    "Pancreatic, lung, breast, GI malignancies",
                    "Lymphoma"
                ],
                citationIDs: ["openrn_labs_round8"]
            )
        ],
        nursingActions: [
            AttributedBullet("CA-125 is NOT a screening test in average-risk women due to low specificity and absence of mortality benefit per primary source.", citationIDs: ["specialty_concept_round8_lab"]),
            AttributedBullet("In high-risk women (BRCA1/2 carriers awaiting risk-reducing surgery), CA-125 + transvaginal US is sometimes used per primary source.", citationIDs: ["specialty_concept_round8_lab"]),
            AttributedBullet("Document menstrual phase if drawn premenopausally — physiologic elevation around menses.", citationIDs: ["openrn_labs_round8"])
        ],
        watchFor: [
            AttributedBullet("False reassurance — many ovarian cancers have NORMAL CA-125 at diagnosis (especially mucinous, early-stage); a normal value does not exclude malignancy.", citationIDs: ["openrn_labs_round8"]),
            AttributedBullet("Trends matter more than single values — monitor over time on treatment.", citationIDs: ["openrn_labs_round8"])
        ],
        citations: [openrnLabsR8, openstaxLabsR8, specialtyConceptR8L],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Uric Acid

public enum UricAcidSample {
    public static let entry: LabEntry = LabEntry(
        id: "uric-acid",
        title: "Uric Acid (Serum)",
        subtitle: "Gout monitoring · TLS risk · target <6 in gout (or <5 in tophaceous)",
        specimen: "Serum (red- or gold-top)",
        nclexTags: metabolicLabR8,
        referenceRanges: [
            ReferenceRangeRow(value: "Adult male: 3.4–7.0 mg/dL", label: "Adult male reference", citationIDs: ["openstax_labs_round8"]),
            ReferenceRangeRow(value: "Adult female: 2.4–6.0 mg/dL", label: "Adult female reference", citationIDs: ["openstax_labs_round8"]),
            ReferenceRangeRow(value: "Gout target on urate-lowering therapy: <6 mg/dL (or <5 in tophaceous gout) per primary source", label: "Gout treatment target", citationIDs: ["specialty_concept_round8_lab"]),
            ReferenceRangeRow(value: "TLS risk threshold: ≥7.5 mg/dL or 25% rise pre-chemo", label: "Tumor lysis threshold", citationIDs: ["openrn_labs_round8"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Hyperuricemia",
                summary: "Causes — overproduction (purine-rich diet, alcohol, malignancy with high turnover, TLS), underexcretion (CKD, thiazide / loop diuretics, low-dose aspirin, pyrazinamide), genetic. Symptomatic disease: gout flare, tophi, urate nephropathy, kidney stones (uric acid).",
                nursingActions: [
                    "If gout flare — manage acutely (NSAIDs, colchicine, steroids); START urate-lowering therapy at end of flare or with prophylaxis per primary source",
                    "Asymptomatic hyperuricemia: lifestyle (alcohol moderation, red-meat reduction, weight loss); routine treatment of asymptomatic hyperuricemia is NOT recommended per primary source",
                    "TLS prophylaxis — allopurinol, IV hydration, sometimes rasburicase per oncology"
                ],
                citationIDs: ["specialty_concept_round8_lab"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Hypouricemia (uncommon)",
                summary: "Causes — Fanconi syndrome, SIADH, pregnancy, allopurinol / febuxostat overdose, low-purine diet, malnutrition, certain meds (high-dose salicylates).",
                nursingActions: [
                    "Usually clinically insignificant; investigate underlying cause if associated with other lab abnormalities"
                ],
                citationIDs: ["openrn_labs_round8"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of hyperuricemia",
                causes: [
                    "OVERPRODUCTION — high-purine diet (red meat, organ meat, beer, sardines, anchovies), malignancy with high cell turnover (lymphoma, leukemia), TLS, hemolysis, psoriasis",
                    "UNDEREXCRETION — CKD, dehydration, thiazide / loop diuretics, low-dose aspirin (<300 mg), pyrazinamide, ethambutol, cyclosporine",
                    "Genetic / lifestyle — obesity, metabolic syndrome, Lesch-Nyhan"
                ],
                citationIDs: ["openrn_labs_round8"]
            )
        ],
        nursingActions: [
            AttributedBullet("Trend serial uric acid every 2–5 weeks during titration of allopurinol / febuxostat to target <6 mg/dL per primary source.", citationIDs: ["specialty_concept_round8_lab"]),
            AttributedBullet("Review medications — diuretics, low-dose aspirin, certain TB drugs raise levels.", citationIDs: ["openrn_labs_round8"]),
            AttributedBullet("Counsel on lifestyle — alcohol moderation (especially beer), reduce red / organ meat / sweetbreads, weight loss, hydration; cherries / coffee may be associated with lower flare rates per primary source.", citationIDs: ["openrn_labs_round8"])
        ],
        watchFor: [
            AttributedBullet("Acute gout flare during initiation of urate-lowering therapy — co-prescribe NSAID / colchicine / low-dose steroid for first 3–6 months per primary source.", citationIDs: ["openrn_labs_round8"]),
            AttributedBullet("TUMOR LYSIS SYNDROME — rapid uric-acid rise plus K, phosphate, AKI; emergency.", citationIDs: ["openrn_labs_round8"]),
            AttributedBullet("Asymptomatic hyperuricemia is NOT routinely treated per primary source — focus on cardiovascular and metabolic risk factors.", citationIDs: ["openrn_labs_round8"])
        ],
        citations: [openrnLabsR8, openstaxLabsR8, specialtyConceptR8L],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Anti-CCP

public enum AntiCCPSample {
    public static let entry: LabEntry = LabEntry(
        id: "anti-ccp",
        title: "Anti-CCP Antibodies",
        subtitle: "Highly specific for rheumatoid arthritis · prognostic for erosive disease",
        specimen: "Serum (red- or gold-top)",
        nclexTags: rheumLabR8,
        referenceRanges: [
            ReferenceRangeRow(value: "<20 U/mL — typical negative; varies by assay", label: "Negative (typical)", citationIDs: ["openstax_labs_round8"]),
            ReferenceRangeRow(value: "Sensitivity ~60–70%; SPECIFICITY ~95% for RA per primary source", label: "Test characteristics", citationIDs: ["specialty_concept_round8_lab"]),
            ReferenceRangeRow(value: "Higher titers correlate with more aggressive / erosive disease", label: "Prognostic value", citationIDs: ["openrn_labs_round8"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive anti-CCP",
                summary: "Highly specific for rheumatoid arthritis. Often positive YEARS before clinical onset. Higher titers predict more erosive joint damage and benefit most from early aggressive DMARD therapy per primary source.",
                nursingActions: [
                    "Coordinate rheumatology referral for synovitis evaluation",
                    "Pair with RF, ESR/CRP, and clinical exam for ACR/EULAR 2010 RA classification criteria",
                    "Patient education on early treatment to prevent erosive damage"
                ],
                citationIDs: ["specialty_concept_round8_lab"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of positive anti-CCP",
                causes: [
                    "Rheumatoid arthritis (most common; high specificity)",
                    "Less commonly — SLE, psoriatic arthritis, Sjögren, primary biliary cholangitis (lower titer typically)",
                    "Smoking + HLA-DR4 — increases anti-CCP positivity in RA per primary source"
                ],
                citationIDs: ["openrn_labs_round8"]
            )
        ],
        nursingActions: [
            AttributedBullet("Pair with rheumatoid factor (RF) and clinical exam — RF and anti-CCP together are stronger than either alone.", citationIDs: ["openrn_labs_round8"]),
            AttributedBullet("Patient education — anti-CCP positivity AHEAD of disease onset is increasingly recognized; some centers monitor for early intervention research.", citationIDs: ["openrn_labs_round8"]),
            AttributedBullet("Counsel on smoking cessation — strongly modifies disease severity in seropositive RA per primary source.", citationIDs: ["openrn_labs_round8"])
        ],
        watchFor: [
            AttributedBullet("Erosive joint disease — early DMARD therapy (typically methotrexate first-line) is the standard of care per primary source.", citationIDs: ["openrn_labs_round8"]),
            AttributedBullet("Extra-articular manifestations more common in seropositive RA — vasculitis, ILD, rheumatoid nodules, Felty syndrome.", citationIDs: ["openrn_labs_round8"])
        ],
        citations: [openrnLabsR8, openstaxLabsR8, specialtyConceptR8L],
        lastSourceFidelityReview: "2026-05-04"
    )
}
