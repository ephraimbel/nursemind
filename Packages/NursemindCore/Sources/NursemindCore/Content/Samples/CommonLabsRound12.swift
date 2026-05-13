import Foundation

// Curator-model lab entries (round 12 expansion — tumor markers + plasma-cell workup).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax (CC BY 4.0 with AI restriction),
// ASCO / NCCN concept citations.

private let openrnLabsR12 = CitationSource(
    id: "openrn_labs_round12",
    shortName: "Open RN Health Alterations — oncology labs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=AFP+CA+19-9+SPEP",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR12 = CitationSource(
    id: "openstax_labs_round12",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR12 = CitationSource(
    id: "specialty_labs_round12",
    shortName: "ASCO / NCCN tumor-marker guidance (concept citation)",
    publisher: "ASCO · NCCN",
    license: .factCitationOnly,
    url: "https://www.asco.org/practice-policy/cancer-care-initiatives/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let oncoLabR12 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)

// MARK: - AFP

public enum AFPSample {
    public static let entry: LabEntry = LabEntry(
        id: "afp",
        title: "Alpha-Fetoprotein (AFP)",
        subtitle: "Serum tumor marker · HCC + germ-cell tumor · prenatal screening",
        specimen: "Serum (gold-top SST)",
        nclexTags: oncoLabR12,
        referenceRanges: [
            ReferenceRangeRow(value: "Adult: <10 ng/mL (typical)", label: "Reference (adult)", citationIDs: ["openstax_labs_round12"]),
            ReferenceRangeRow(value: "HCC threshold for concern: typically >200–400 ng/mL with characteristic imaging in cirrhotic", label: "HCC threshold", citationIDs: ["specialty_labs_round12"]),
            ReferenceRangeRow(value: "Germ-cell tumor: variable; often markedly elevated with non-seminomatous germ-cell tumor", label: "Germ-cell tumor", citationIDs: ["openrn_labs_round12"]),
            ReferenceRangeRow(value: "Prenatal — maternal serum AFP at 15–20 weeks for neural-tube and aneuploidy screen", label: "Prenatal use", citationIDs: ["openrn_labs_round12"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated AFP",
                summary: "In cirrhosis — supports HCC if compatible imaging; in young man — non-seminomatous germ-cell tumor consideration; in pregnancy — neural-tube defect, abdominal-wall defect, or multiple gestation. Many false-positive (chronic HBV / HCV, pregnancy, benign liver disease).",
                nursingActions: [
                    "Coordinate further workup — hepatology for cirrhotic, urology for young man with testicular mass, MFM / OB for pregnancy",
                    "Trend serial AFP — rising trend more concerning than absolute value"
                ],
                citationIDs: ["specialty_labs_round12"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated AFP",
                causes: [
                    "Hepatocellular carcinoma (most established association)",
                    "Non-seminomatous germ-cell tumor (testicular, ovarian); embryonal carcinoma; yolk-sac tumor",
                    "Pregnancy (peaks at 12–15 weeks; benign)",
                    "Maternal serum AFP elevated — neural-tube defect, abdominal-wall defect, multiple gestation",
                    "Maternal serum AFP low — Down syndrome, Trisomy 18",
                    "Chronic hepatitis (HBV / HCV) — mild elevation",
                    "Cirrhosis — modest elevation",
                    "Hepatic regeneration after injury"
                ],
                citationIDs: ["openrn_labs_round12"]
            )
        ],
        nursingActions: [
            AttributedBullet("HCC surveillance — AFP every 6 months + abdominal US in cirrhotic patients per AASLD per primary source.", citationIDs: ["specialty_labs_round12"]),
            AttributedBullet("Trend serial AFP after HCC treatment — falling = response; rising = recurrence.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Pregnancy interpretation — combined with hCG + estriol + inhibin (quad screen) for risk stratification.", citationIDs: ["openrn_labs_round12"])
        ],
        watchFor: [
            AttributedBullet("Up to 30% of HCCs do NOT secrete AFP — normal AFP does NOT exclude HCC; surveillance imaging is essential.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Pure seminoma — AFP NORMAL (only beta-hCG + LDH may rise); elevated AFP rules OUT pure seminoma.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Counsel pregnant patients about meaning — elevated MSAFP is screening, not diagnostic; further evaluation with US ± amniocentesis per primary source.", citationIDs: ["openrn_labs_round12"])
        ],
        citations: [openrnLabsR12, openstaxLabsR12, specialtyLabsR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CA 19-9

public enum CA199Sample {
    public static let entry: LabEntry = LabEntry(
        id: "ca-19-9",
        title: "CA 19-9",
        subtitle: "Serum tumor marker · pancreatic + biliary cancer · NOT a screening test",
        specimen: "Serum (gold-top SST)",
        nclexTags: oncoLabR12,
        referenceRanges: [
            ReferenceRangeRow(value: "<37 U/mL (typical reference)", label: "Reference", citationIDs: ["openstax_labs_round12"]),
            ReferenceRangeRow(value: "NOT recommended for screening — too many false positives + many pancreatic cancers do not secrete (Lewis-antigen-negative ~5%)", label: "Screening", citationIDs: ["specialty_labs_round12"]),
            ReferenceRangeRow(value: "Marker for monitoring response and recurrence in known disease", label: "Surveillance use", citationIDs: ["specialty_labs_round12"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated CA 19-9",
                summary: "Most associated with pancreatic and cholangiocarcinoma. Many BENIGN causes — biliary obstruction (especially), cholangitis, cirrhosis, pancreatitis, pulmonary disease; resolves when underlying cause treated.",
                nursingActions: [
                    "Differentiate benign from malignant by clinical context + imaging",
                    "Trend with treatment (pre / post resection, during chemo) — falling = response, rising = progression",
                    "Avoid screening use — false positives lead to unnecessary anxiety and workup"
                ],
                citationIDs: ["specialty_labs_round12"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated CA 19-9",
                causes: [
                    "MALIGNANT — pancreatic, biliary tract (cholangiocarcinoma, gallbladder), gastric, colorectal, hepatocellular, esophageal",
                    "BENIGN — biliary obstruction (most common cause of significant elevation), cholangitis, pancreatitis, cirrhosis, IBD, hypothyroidism, RA, ovarian cyst",
                    "Lewis-antigen NEGATIVE patients (~5%) — do NOT secrete CA 19-9; markers will be falsely normal even with disease"
                ],
                citationIDs: ["openrn_labs_round12"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always interpret with imaging + clinical context — single elevated value rarely diagnostic per primary source.", citationIDs: ["specialty_labs_round12"]),
            AttributedBullet("Recheck after relief of biliary obstruction — often falls dramatically.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Trend serial values for response and recurrence monitoring per primary source.", citationIDs: ["openrn_labs_round12"])
        ],
        watchFor: [
            AttributedBullet("Falsely normal in Lewis-antigen-negative patients — clinical exam + imaging matter regardless of CA 19-9.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Very high values (>1000) → metastatic or unresectable disease likely.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Rising CA 19-9 in surveillance after pancreaticoduodenectomy → image to evaluate for recurrence.", citationIDs: ["openrn_labs_round12"])
        ],
        citations: [openrnLabsR12, openstaxLabsR12, specialtyLabsR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - SPEP / UPEP

public enum SPEPSample {
    public static let entry: LabEntry = LabEntry(
        id: "spep-upep",
        title: "Serum + Urine Protein Electrophoresis (SPEP / UPEP)",
        subtitle: "M-protein detection · multiple myeloma + MGUS + Waldenström + amyloidosis workup",
        specimen: "Serum (red- or gold-top) for SPEP; 24-hr urine for UPEP; immunofixation (IFE) for typing",
        nclexTags: oncoLabR12,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal SPEP — distinct albumin + alpha-1 + alpha-2 + beta + gamma bands; no monoclonal spike", label: "Normal SPEP", citationIDs: ["openstax_labs_round12"]),
            ReferenceRangeRow(value: "Monoclonal (M) spike on SPEP suggests plasma-cell or B-cell disorder", label: "M-spike", citationIDs: ["openrn_labs_round12"]),
            ReferenceRangeRow(value: "IFE identifies heavy + light chain (e.g., IgG kappa, IgA lambda)", label: "IFE typing", citationIDs: ["openrn_labs_round12"]),
            ReferenceRangeRow(value: "Serum free light chain (FLC) ratio — abnormal kappa:lambda ratio suggests monoclonal disease per primary source", label: "Free light chain", citationIDs: ["specialty_labs_round12"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "M-spike on SPEP",
                summary: "Suggests monoclonal gammopathy. Differential — MGUS (monoclonal gammopathy of undetermined significance — most common), smoldering myeloma, multiple myeloma, Waldenström macroglobulinemia (IgM), AL amyloidosis, B-cell lymphoma, solitary plasmacytoma. M-spike SIZE + presence of CRAB features distinguishes MGUS vs myeloma.",
                nursingActions: [
                    "Coordinate hematology referral",
                    "Bone-marrow biopsy + IFE + FLC + skeletal survey for staging",
                    "CRAB workup — calcium, renal function, anemia, bone lytic lesions"
                ],
                citationIDs: ["specialty_labs_round12"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of M-spike",
                causes: [
                    "MGUS (~3% adults >50; ~5% >70) — incidental finding; lifetime risk of progression to myeloma ~1%/year",
                    "Smoldering multiple myeloma — meets some criteria but no CRAB",
                    "Multiple myeloma — CRAB features OR myeloma-defining biomarkers (≥60% plasma cells, FLC ratio >100, MRI focal lesions)",
                    "Waldenström macroglobulinemia — IgM-secreting B-cell lymphoma + bone-marrow infiltration",
                    "AL amyloidosis — kappa or lambda light chain deposition; CHF / nephrotic / neuropathy / hepatomegaly",
                    "Solitary plasmacytoma — single bone or extramedullary lesion"
                ],
                citationIDs: ["openrn_labs_round12"]
            )
        ],
        nursingActions: [
            AttributedBullet("Pair SPEP with UPEP (catches Bence Jones light chains in urine) and serum free light-chain assay per primary source.", citationIDs: ["specialty_labs_round12"]),
            AttributedBullet("Annual SPEP / UPEP / FLC + CBC + creatinine + calcium for MGUS surveillance per primary source.", citationIDs: ["specialty_labs_round12"]),
            AttributedBullet("Educate patient — most M-spikes are MGUS (benign condition with monitoring); does not always mean cancer.", citationIDs: ["openrn_labs_round12"])
        ],
        watchFor: [
            AttributedBullet("AL amyloidosis — easy to miss; consider when M-spike + nephrotic-range proteinuria, restrictive cardiomyopathy, hepatomegaly, neuropathy, macroglossia.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Hyperviscosity from IgM (Waldenström) — vision changes, headache, mucosal bleeding; emergent plasmapheresis.", citationIDs: ["openrn_labs_round12"]),
            AttributedBullet("Light-chain CAST nephropathy in myeloma — emergent plasmapheresis + chemo per primary source.", citationIDs: ["openrn_labs_round12"])
        ],
        citations: [openrnLabsR12, openstaxLabsR12, specialtyLabsR12],
        lastSourceFidelityReview: "2026-05-04"
    )
}
