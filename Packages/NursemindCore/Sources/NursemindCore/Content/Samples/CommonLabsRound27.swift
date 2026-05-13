import Foundation

// Curator-model lab entries (round 27 — rheumatology / vasculitis diagnostics).

private let openrnLabsR27 = CitationSource(
    id: "openrn_labs_round27",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR27 = CitationSource(
    id: "specialty_labs_round27",
    shortName: "ACR + EULAR + AAN concept citations",
    publisher: "ACR · EULAR · AAN",
    license: .factCitationOnly,
    url: "https://www.rheumatology.org/Practice-Quality/Clinical-Support/Clinical-Practice-Guidelines",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR27 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .infection
)

public enum ANCASample {
    public static let entry: LabEntry = LabEntry(
        id: "anca-panel",
        title: "ANCA panel — c-ANCA / p-ANCA + PR3 / MPO",
        subtitle: "ANCA-associated vasculitis · GPA + MPA + EGPA · IFA pattern (c vs p) + ELISA antigen (PR3 vs MPO) · positive often before clinical · drug-induced + infection",
        specimen: "Serum; processed by immunofluorescence (IFA pattern) + ELISA antigen-specific assay; not affected by anticoagulants",
        nclexTags: labsTagsR27,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative ANCA", label: "ANCA not detected; ANCA-associated vasculitis unlikely if clinical features absent", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "c-ANCA pattern + PR3-ANCA positive", label: "Granulomatosis with polyangiitis (GPA / Wegener's) — ~80-90% sensitivity in active disease", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "p-ANCA pattern + MPO-ANCA positive", label: "Microscopic polyangiitis (MPA), EGPA (40%), drug-induced vasculitis, some inflammatory conditions", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Atypical p-ANCA + negative MPO/PR3", label: "Non-specific; inflammatory bowel disease (UC > Crohn), primary sclerosing cholangitis, autoimmune hepatitis, drug-induced, infection — NOT vasculitis", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Dual c-ANCA + p-ANCA", label: "Rare; check antigen specificity; consider drug-induced (cocaine, hydralazine, propylthiouracil)", citationIDs: ["specialty_labs_round27"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative ANCA",
                summary: "ANCA-associated vasculitis unlikely in absence of clinical features. NOTE: ANCA-negative GPA / MPA / EGPA exists (~10-20%) per primary source. Strong clinical suspicion warrants biopsy + repeat testing.",
                nursingActions: [
                    "If clinical features (RPGN, alveolar hemorrhage, mononeuritis multiplex, palpable purpura) → biopsy + specialist consultation.",
                    "Consider other vasculitides (PAN — ANCA-negative; Takayasu; large-vessel) OR mimics (infection, drug-induced).",
                    "Repeat ANCA at 3-6 weeks if high clinical suspicion + initially negative."
                ],
                citationIDs: ["specialty_labs_round27"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive ANCA — workup vasculitis",
                summary: "Positive ANCA + appropriate clinical features → workup for vasculitis. Confirm with biopsy when feasible. Pattern + antigen specificity narrows differential per primary source.",
                nursingActions: [
                    "URGENT rheumatology / nephrology referral for evaluation + treatment planning.",
                    "Workup organ involvement — urinalysis, BUN/Cr, CXR/CT chest, urinalysis, basic labs.",
                    "BIOPSY — kidney, lung, skin, or nasal mucosa — confirms vasculitis + assesses activity.",
                    "RULE OUT mimics — endocarditis, syphilis, lupus, cocaine-induced vasculitis, drug-induced (hydralazine, propylthiouracil, minocycline, levamisole-contaminated cocaine).",
                    "Pre-treatment workup — TB (PPD or IGRA), HBV, HCV, HIV; CBC, comprehensive metabolic, ECG.",
                    "ANCA titer trends — may correlate with disease activity / relapse but not always reliable.",
                    "INDUCTION immunosuppression coordinated with specialist — rituximab or cyclophosphamide + steroids."
                ],
                citationIDs: ["specialty_labs_round27"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Positive ANCA — vasculitis",
                causes: ["Granulomatosis with polyangiitis (GPA) — c-ANCA / PR3-ANCA (~80%)", "Microscopic polyangiitis (MPA) — p-ANCA / MPO-ANCA (~70%)", "Eosinophilic granulomatosis with polyangiitis (EGPA / Churg-Strauss) — p-ANCA / MPO-ANCA (~40%)", "Drug-induced vasculitis (propylthiouracil, hydralazine, allopurinol, minocycline, levamisole-cut cocaine)"],
                citationIDs: ["specialty_labs_round27"]
            ),
            CauseGroup(
                title: "Positive ANCA — non-vasculitic",
                causes: ["Inflammatory bowel disease (UC > Crohn) — atypical p-ANCA", "Primary sclerosing cholangitis — atypical p-ANCA", "Autoimmune hepatitis — atypical p-ANCA", "Endocarditis (subacute bacterial)", "Tuberculosis, HIV, syphilis", "Lupus — sometimes ANCA+", "Cocaine use — levamisole-contaminated"],
                citationIDs: ["specialty_labs_round27"]
            )
        ],
        nursingActions: [
            AttributedBullet("Order BOTH immunofluorescence (IFA) pattern AND ELISA antigen-specific assay (PR3 vs MPO) — patterns alone non-specific.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("INTEGRATE clinical + lab + imaging + biopsy for vasculitis diagnosis — ANCA alone insufficient per primary source.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("TITER TRENDS — repeat ANCA at intervals; rising titers may predict relapse but clinical primary; not all relapses preceded by titer rise.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("Pre-immunosuppression — TB + HBV + HCV + HIV testing; vaccinations.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("DRUG-INDUCED ANCA — common with hydralazine, propylthiouracil, allopurinol, minocycline, levamisole-cut cocaine; ANCA + clinical resolves with drug withdrawal.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("ANCA-NEGATIVE GPA / MPA / EGPA — exists; biopsy for definitive diagnosis if high suspicion.", citationIDs: ["specialty_labs_round27"])
        ],
        watchFor: [
            AttributedBullet("PR3 c-ANCA — most specific for GPA + worst prognosis; aggressive treatment.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("MPO p-ANCA — milder course typically; MPA + EGPA; less alveolar hemorrhage.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("DRUG-INDUCED — propylthiouracil + hydralazine + allopurinol + minocycline + levamisole-cocaine; withdraw drug; may remit.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("ATYPICAL p-ANCA in IBD / PSC / AIH — not vasculitis; ELISA negative for PR3 / MPO.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("FALSE POSITIVE — endocarditis (subacute bacterial), drug-induced; clinical context essential.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("ANCA + clinical features → BIOPSY for definitive diagnosis.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("Monitoring during treatment — clinical primary; ANCA helpful in some patients.", citationIDs: ["specialty_labs_round27"])
        ],
        citations: [openrnLabsR27, specialtyLabsR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ComplementSample {
    public static let entry: LabEntry = LabEntry(
        id: "complement-c3-c4",
        title: "Complement C3 + C4 + CH50",
        subtitle: "Autoimmune workup · LOW in active SLE / aHUS / cryoglobulinemia · HIGH in acute phase reaction · functional CH50 screen",
        specimen: "Serum; processed within hours of collection (complement consumes in vitro); reference ranges age-dependent",
        nclexTags: labsTagsR27,
        referenceRanges: [
            ReferenceRangeRow(value: "C3 normal 90-180 mg/dL", label: "Normal C3 component", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "C4 normal 16-50 mg/dL", label: "Normal C4 component", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "CH50 normal 30-75 U/mL", label: "Normal functional total complement (functional screen)", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Low C3 + C4 + CH50", label: "Classical pathway activation — active SLE, cryoglobulinemic vasculitis, septic immune complex disease, post-strep GN, hereditary deficiencies", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Low C3 + normal C4", label: "Alternative pathway activation — aHUS, glomerulonephritis (post-strep, MPGN, dense deposit disease)", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Normal C3 + low C4 + CH50 ~0", label: "Hereditary angioedema (HAE) type 1 (deficient C1-INH) or type 2 (dysfunctional C1-INH)", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Elevated C3 + C4 (acute phase reactants)", label: "Inflammation, infection, malignancy — not pathologic", citationIDs: ["specialty_labs_round27"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal complement",
                summary: "Complement system intact. In SLE follow-up, normal complement is reassuring but doesn't exclude active disease. Useful baseline.",
                nursingActions: [
                    "Document baseline; trend in autoimmune disease management.",
                    "Repeat in clinical concerns.",
                    "Continue routine autoimmune monitoring."
                ],
                citationIDs: ["specialty_labs_round27"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Low complement — autoimmune workup",
                summary: "Low complement (C3 + C4) suggests immune complex disease — most commonly SLE (active), cryoglobulinemic vasculitis, post-streptococcal GN, MPGN, hereditary angioedema. Workup specific etiology per primary source.",
                nursingActions: [
                    "SLE workup — ANA, anti-dsDNA, urinalysis, anti-Sm, anti-Ro/La; complement trends.",
                    "CRYOGLOBULINEMIA workup — cryoglobulins (warm-collected), HCV, M-spike.",
                    "Hereditary angioedema — C1-INH levels + function in suspected.",
                    "Active SLE — low complement supports diagnosis + activity; combine with anti-dsDNA trends.",
                    "Repeat complement trends to monitor disease activity + treatment response.",
                    "aHUS — alternative pathway; complement testing + ADAMTS13 to differentiate from TTP."
                ],
                citationIDs: ["specialty_labs_round27"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Low complement (classical pathway — C3 + C4 both low)",
                causes: ["Active SLE (especially lupus nephritis)", "Cryoglobulinemic vasculitis (HCV-related, autoimmune)", "Mixed essential cryoglobulinemia", "Post-streptococcal GN", "Septic immune complex disease (bacterial endocarditis, shunt nephritis)", "Hereditary complement deficiencies (rare)"],
                citationIDs: ["specialty_labs_round27"]
            ),
            CauseGroup(
                title: "Low C3 only (alternative pathway)",
                causes: ["Atypical HUS", "Membranoproliferative GN (especially dense deposit disease — C3 glomerulopathy)", "Acute glomerulonephritis"],
                citationIDs: ["specialty_labs_round27"]
            ),
            CauseGroup(
                title: "Low C4 only / hereditary angioedema",
                causes: ["Hereditary angioedema types 1 + 2 (C1-INH deficiency / dysfunction)", "Acquired C1-INH deficiency (lymphoproliferative)"],
                citationIDs: ["specialty_labs_round27"]
            )
        ],
        nursingActions: [
            AttributedBullet("ORDER both C3 + C4 together; consider CH50 (functional screen).", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("SAMPLE handling — complement consumes in vitro; process within hours.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("INTERPRET in clinical context — many causes of complement consumption.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("SLE MONITORING — paired with anti-dsDNA; trends predict activity + relapse.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("Workup specific causes — autoimmune (SLE, vasculitis), infections (endocarditis, post-strep), hereditary (angioedema).", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("HAE workup — C1-INH levels (low type 1) + function (low type 2 with normal levels).", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("Repeat trends to assess treatment response.", citationIDs: ["specialty_labs_round27"])
        ],
        watchFor: [
            AttributedBullet("ACTIVE SLE — low complement + elevated anti-dsDNA suggest active disease; correlate with clinical + urinalysis.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("LUPUS NEPHRITIS — complement decline often precedes clinical flare.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("HEREDITARY ANGIOEDEMA — C4 always low between attacks; C1-INH testing confirms; treatment with C1-INH replacement / icatibant / ecallantide.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("aHUS — eculizumab dramatically improves outcomes; mandatory complement testing + AQP4 in TTP / aHUS differential.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("HEREDITARY complement deficiency (C1, C2, C4, properdin) — increased Neisseria infection risk; vaccinations.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("ENDOCARDITIS — low complement + clinical features; blood cultures + echo.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("CH50 zero — terminal complement deficiency OR severe consumption; functional screen.", citationIDs: ["specialty_labs_round27"])
        ],
        citations: [openrnLabsR27, specialtyLabsR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IgG4Sample {
    public static let entry: LabEntry = LabEntry(
        id: "igg4",
        title: "IgG4 + IgG4-related disease workup",
        subtitle: "IgG4-related disease · fibroinflammatory multisystem · autoimmune pancreatitis + sialadenitis + retroperitoneal fibrosis · steroid responsive",
        specimen: "Serum; quantitative IgG4 measurement; clinical interpretation + biopsy needed for definitive diagnosis",
        nclexTags: labsTagsR27,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal IgG4 <135 mg/dL", label: "Normal serum IgG4", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Elevated IgG4 135-200 mg/dL", label: "Borderline; specific in clinical context", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "IgG4 >200 mg/dL", label: "Suggestive of IgG4-related disease IF clinical features present; ~70-80% sensitivity", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "IgG4/IgG ratio >0.05", label: "Supports IgG4-related disease; relative measure", citationIDs: ["specialty_labs_round27"]),
            ReferenceRangeRow(value: "Tissue IgG4+ plasma cells per HPF >10 + IgG4/IgG ratio >40%", label: "Histopathologic confirmation per consensus criteria", citationIDs: ["specialty_labs_round27"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal serum IgG4",
                summary: "IgG4-related disease less likely; HOWEVER ~20-30% of IgG4-RD have normal serum IgG4. Biopsy + histopathology + clinical features integrate for diagnosis per primary source.",
                nursingActions: [
                    "If clinical features (autoimmune pancreatitis, sialadenitis, retroperitoneal fibrosis, orbital pseudotumor, lymphadenopathy, cholangitis) → biopsy.",
                    "Histopathology — IgG4+ plasma cells + storiform fibrosis + obliterative phlebitis."
                ],
                citationIDs: ["specialty_labs_round27"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated IgG4 — IgG4-RD workup",
                summary: "Elevated serum IgG4 in appropriate clinical context suggests IgG4-related disease — fibroinflammatory multisystem disorder. Biopsy for histopathologic confirmation; corticosteroids are first-line + highly effective per primary source.",
                nursingActions: [
                    "Workup organ involvement — imaging (MRCP for pancreas / biliary, CT chest/abdomen/pelvis), urinalysis, autoimmune workup.",
                    "BIOPSY for definitive diagnosis — affected organ; histopathology criteria.",
                    "Rule out — Sjogren syndrome (similar gland involvement; different histopathology), malignancy (lymphoma, pancreatic / cholangiocarcinoma — IgG4-RD MIMICKS cancer), GPA / EGPA, sarcoidosis, IgG4-positive marginal zone lymphoma.",
                    "PREDNISONE 0.6 mg/kg/day initially × 4 weeks then taper — first-line; HIGHLY effective response per primary source.",
                    "RITUXIMAB — for refractory / steroid-dependent; B-cell depletion effective.",
                    "Multidisciplinary — rheumatology + gastroenterology + ophthalmology + otolaryngology depending on involvement.",
                    "Long-term monitoring — relapses common."
                ],
                citationIDs: ["specialty_labs_round27"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated IgG4 + IgG4-related disease",
                causes: ["Autoimmune pancreatitis type 1 — most common", "IgG4-related sclerosing cholangitis", "IgG4-related sialadenitis (Mikulicz disease)", "IgG4-related orbital disease (pseudotumor)", "Retroperitoneal fibrosis (Ormond disease)", "IgG4-related kidney disease (tubulointerstitial nephritis, membranous GN)", "IgG4-related pneumonitis", "Riedel thyroiditis", "Sclerosing mediastinitis"],
                citationIDs: ["specialty_labs_round27"]
            ),
            CauseGroup(
                title: "Other causes of elevated IgG4",
                causes: ["Some malignancies (pancreatic adenocarcinoma, lymphoma)", "Atopy + chronic helminth infections", "Type 2 autoimmune pancreatitis (different disease)", "Pemphigus vulgaris", "Chronic inflammation"],
                citationIDs: ["specialty_labs_round27"]
            )
        ],
        nursingActions: [
            AttributedBullet("Consider IgG4-related disease in patients with unexplained organ-based fibroinflammatory lesions.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("Most common presentations — autoimmune pancreatitis, sialadenitis (parotid + submandibular), orbital pseudotumor, retroperitoneal fibrosis, cholangitis (mimics PSC + cholangiocarcinoma) per primary source.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("DIAGNOSIS — clinical + serology + histopathology integrated; biopsy gold standard.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("HISTOPATHOLOGY criteria — IgG4+ plasma cells + storiform fibrosis + obliterative phlebitis + IgG4/IgG ratio >40%.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("RULE OUT malignancy + Sjogren + sarcoidosis + vasculitis — many overlap.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("Treatment — CORTICOSTEROIDS first-line; highly effective; rituximab for refractory.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("Long-term — relapses common; chronic management; monitor for malignancy.", citationIDs: ["specialty_labs_round27"])
        ],
        watchFor: [
            AttributedBullet("PANCREATIC ADENOCARCINOMA — IgG4-RD pancreatitis can mimic; tissue biopsy distinguishes; surgical resection unnecessary if IgG4-RD identified.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("CHOLANGIOCARCINOMA — IgG4-RD cholangitis can mimic; biopsy + close monitoring.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("LYMPHOMA — IgG4+ marginal zone lymphoma + other lymphomas can have elevated IgG4 + tissue infiltrates; comprehensive workup.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("RELAPSE rate ~30-50% after steroid taper; maintenance therapy may be needed.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("STEROID-RESPONSIVENESS — dramatic improvement supports diagnosis; lack of response suggests alternative.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("INCREASED MALIGNANCY risk — possible association with multiple cancers; surveillance.", citationIDs: ["specialty_labs_round27"]),
            AttributedBullet("ALLERGY association — atopy common in IgG4-RD; high IgE; eosinophilia.", citationIDs: ["specialty_labs_round27"])
        ],
        citations: [openrnLabsR27, specialtyLabsR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}
