import Foundation

// Curator-model lab entries (round 11 expansion — tumor markers + autoimmune).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), ACS / ACR / USPSTF concept citations.

private let openrnLabsR11 = CitationSource(
    id: "openrn_labs_round11",
    shortName: "Open RN Health Alterations — oncology + rheumatology labs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=tumor+marker+ANA+autoantibody",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR11 = CitationSource(
    id: "openstax_labs_round11",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR11 = CitationSource(
    id: "specialty_labs_round11",
    shortName: "ACS / USPSTF / ACR concept citations",
    publisher: "American Cancer Society · USPSTF · ACR",
    license: .factCitationOnly,
    url: "https://www.cancer.org/health-care-professionals/cancer-screening-guidelines.html",
    lastRetrieved: "2026-05-04"
)

private let oncoLabR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let rheumLabR11 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .mobility)

// MARK: - PSA

public enum PSASample {
    public static let entry: LabEntry = LabEntry(
        id: "psa",
        title: "Prostate-Specific Antigen (PSA)",
        subtitle: "Serum tumor marker · screening + monitoring · NOT specific for cancer",
        specimen: "Serum (gold-top SST)",
        nclexTags: oncoLabR11,
        referenceRanges: [
            ReferenceRangeRow(value: "Typical adult: <4 ng/mL (variable by age and lab)", label: "Reference (typical)", citationIDs: ["openstax_labs_round11"]),
            ReferenceRangeRow(value: "Age-specific: <2.5 (40s) · <3.5 (50s) · <4.5 (60s) · <6.5 (70s)", label: "Age-adjusted reference", citationIDs: ["openrn_labs_round11"]),
            ReferenceRangeRow(value: "PSA velocity (rate of rise) and free:total ratio refine cancer risk", label: "Refinement metrics", citationIDs: ["openrn_labs_round11"]),
            ReferenceRangeRow(value: "USPSTF — individual shared decision-making screening men 55–69; AVOID screening >70 per primary source", label: "Screening guidance", citationIDs: ["specialty_labs_round11"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated PSA",
                summary: "Many BENIGN causes — BPH, prostatitis, urinary retention, recent ejaculation / DRE / cycling, urethral instrumentation. Higher value or rising trend warrants urology evaluation; biopsy decision involves shared discussion + MRI imaging per primary source.",
                nursingActions: [
                    "Avoid drawing within 48 hr of ejaculation, DRE, prostate massage, cycling — falsely elevates",
                    "Coordinate referral; consider repeat PSA + MRI before biopsy",
                    "Educate about benign causes to reduce anxiety"
                ],
                citationIDs: ["specialty_labs_round11"]
            ),
            InterpretationTier(
                severity: .normal,
                label: "Falling PSA on therapy",
                summary: "After definitive treatment (prostatectomy / radiation), PSA should fall to undetectable. Rising PSA after treatment = biochemical recurrence; coordinate urology / oncology workup.",
                nursingActions: [
                    "Trend serial PSA per oncology",
                    "Educate about expected pattern and concerning trend"
                ],
                citationIDs: ["openrn_labs_round11"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated PSA",
                causes: [
                    "BPH (most common in older men)",
                    "Prostatitis (acute or chronic)",
                    "Recent ejaculation, DRE, prostate massage, urethral instrumentation, cycling",
                    "Acute urinary retention",
                    "Prostate cancer (often slow-growing; many incidental)"
                ],
                citationIDs: ["openrn_labs_round11"]
            )
        ],
        nursingActions: [
            AttributedBullet("Counsel about timing — avoid sex / vigorous cycling / DRE for 48 hours before draw.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Discuss screening with shared decision-making — false positives, biopsy risks, indolent cancers per primary source.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Coordinate urology referral for elevated PSA, abnormal DRE, or rising velocity.", citationIDs: ["openrn_labs_round11"])
        ],
        watchFor: [
            AttributedBullet("Overdiagnosis / overtreatment — many indolent prostate cancers; current practice favors AS (active surveillance) for low-risk per primary source.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Family history + race (Black men higher risk) — screening conversation may start younger (40–45) per primary source.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Post-treatment recurrence — rising PSA from undetectable level requires urgent workup.", citationIDs: ["openrn_labs_round11"])
        ],
        citations: [openrnLabsR11, openstaxLabsR11, specialtyLabsR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CEA

public enum CEASample {
    public static let entry: LabEntry = LabEntry(
        id: "cea",
        title: "Carcinoembryonic Antigen (CEA)",
        subtitle: "Serum tumor marker · colorectal cancer monitoring · NOT a screening test",
        specimen: "Serum (gold-top SST)",
        nclexTags: oncoLabR11,
        referenceRanges: [
            ReferenceRangeRow(value: "Non-smokers: <2.5 ng/mL", label: "Non-smoker reference", citationIDs: ["openstax_labs_round11"]),
            ReferenceRangeRow(value: "Smokers: <5 ng/mL", label: "Smoker reference", citationIDs: ["openstax_labs_round11"]),
            ReferenceRangeRow(value: "NOT recommended for screening — many false positives", label: "Screening", citationIDs: ["specialty_labs_round11"]),
            ReferenceRangeRow(value: "Use case — pre-treatment baseline + post-treatment surveillance for colorectal cancer; rising trend after resection suggests recurrence", label: "Surveillance use", citationIDs: ["specialty_labs_round11"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated CEA",
                summary: "Many causes; in known colorectal cancer patient, rising trend after resection warrants imaging for recurrence. In non-cancer patient, often benign cause.",
                nursingActions: [
                    "Coordinate with oncology for trend interpretation",
                    "Avoid using for cancer screening in average-risk population",
                    "Investigate benign causes if no cancer history"
                ],
                citationIDs: ["specialty_labs_round11"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated CEA",
                causes: [
                    "Colorectal cancer (most established association)",
                    "Other GI malignancies — pancreatic, gastric, esophageal, biliary",
                    "Lung cancer, breast cancer, ovarian, uterine, bladder",
                    "BENIGN causes — smoking, IBD, pancreatitis, cirrhosis, COPD, peptic ulcer, hypothyroidism",
                    "Pregnancy (transient mild elevation)"
                ],
                citationIDs: ["openrn_labs_round11"]
            )
        ],
        nursingActions: [
            AttributedBullet("Trend serial CEA in surveillance after colorectal-cancer resection per primary source.", citationIDs: ["specialty_labs_round11"]),
            AttributedBullet("Counsel that elevated CEA does not always = cancer — many benign causes; further workup guided by clinical context.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Smoking status — interpret elevation in smokers cautiously.", citationIDs: ["openrn_labs_round11"])
        ],
        watchFor: [
            AttributedBullet("Recurrence after colorectal resection — rising CEA on serial monitoring; coordinate imaging.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Falsely reassuring normal CEA — some colorectal cancers do NOT secrete CEA; clinical exam + imaging matter.", citationIDs: ["openrn_labs_round11"])
        ],
        citations: [openrnLabsR11, openstaxLabsR11, specialtyLabsR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ANA

public enum ANASample {
    public static let entry: LabEntry = LabEntry(
        id: "ana",
        title: "Antinuclear Antibody (ANA)",
        subtitle: "Autoimmune screen · highly sensitive but low specificity · pattern + titer matter",
        specimen: "Serum (gold-top SST)",
        nclexTags: rheumLabR11,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative or titer ≤1:40 (varies by lab)", label: "Negative", citationIDs: ["openstax_labs_round11"]),
            ReferenceRangeRow(value: "Titer ≥1:160 — moderately elevated; further workup if symptoms", label: "Moderate", citationIDs: ["openrn_labs_round11"]),
            ReferenceRangeRow(value: "Titer ≥1:640 — high; strongly suggests autoimmune disease in clinical context", label: "High", citationIDs: ["openrn_labs_round11"]),
            ReferenceRangeRow(value: "Patterns — homogeneous (drug-induced lupus, SLE), speckled (mixed CTD, Sjögren), nucleolar (scleroderma), centromere (CREST)", label: "Pattern significance", citationIDs: ["specialty_labs_round11"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive ANA",
                summary: "ANA is highly sensitive (~95% in SLE) but very low specificity — up to 15% of healthy adults positive at low titer. INTERPRET in clinical context. Titer + pattern guide further workup with specific antibodies.",
                nursingActions: [
                    "Coordinate rheumatology referral if symptoms suggest autoimmune disease",
                    "Specific autoantibodies — anti-dsDNA (SLE), anti-Smith (SLE), anti-Ro/SSA + anti-La/SSB (Sjögren), anti-Scl-70 (scleroderma), anti-Jo-1 (myositis), anti-CCP (RA), c-ANCA / p-ANCA (vasculitis)",
                    "Reduce patient anxiety — positive ANA alone is NOT diagnostic"
                ],
                citationIDs: ["specialty_labs_round11"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of positive ANA",
                causes: [
                    "Autoimmune — SLE, scleroderma, Sjögren, mixed CTD, RA, autoimmune hepatitis, polymyositis / dermatomyositis",
                    "DRUG-INDUCED LUPUS — procainamide, hydralazine, INH, anti-TNFs, minocycline; resolves with stopping (usually homogeneous pattern with anti-histone antibodies)",
                    "Healthy individuals — up to 15% at low titer (especially older adults)",
                    "Other — chronic infection (HCV, HIV, TB), some malignancies"
                ],
                citationIDs: ["openrn_labs_round11"]
            )
        ],
        nursingActions: [
            AttributedBullet("Do NOT order ANA without clinical suspicion of autoimmune disease — false positives lead to unnecessary anxiety and workup per primary source.", citationIDs: ["specialty_labs_round11"]),
            AttributedBullet("Pair with disease-specific antibodies and clinical exam.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Educate patients about meaning of result — focus on symptoms and disease, not numbers.", citationIDs: ["openrn_labs_round11"])
        ],
        watchFor: [
            AttributedBullet("DRUG-INDUCED LUPUS — review medication list; stop suspect drug; symptoms typically resolve within weeks-months.", citationIDs: ["openrn_labs_round11"]),
            AttributedBullet("Subclinical autoimmune disease — positive ANA may precede clinical disease by years; serial reassessment if symptoms develop.", citationIDs: ["openrn_labs_round11"])
        ],
        citations: [openrnLabsR11, openstaxLabsR11, specialtyLabsR11],
        lastSourceFidelityReview: "2026-05-04"
    )
}
