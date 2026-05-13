import Foundation

// Curator-model lab entries (round 33 — oncology diagnostics: NGS + ctDNA + MSI/MMR).

private let openrnLabsR33 = CitationSource(
    id: "openrn_labs_round33",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR33 = CitationSource(
    id: "specialty_labs_round33",
    shortName: "NCCN + ASCO + ESMO + AMP concept citations",
    publisher: "NCCN · ASCO · ESMO · AMP",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR33 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .cellularRegulation
)

public enum CancerGenomicTestingSample {
    public static let entry: LabEntry = LabEntry(
        id: "cancer-genomic-testing-ngs",
        title: "Cancer genomic testing (NGS + comprehensive genomic profiling)",
        subtitle: "Tumor + germline genomic profiling · NSCLC + melanoma + CRC + breast + others · BRCA + EGFR + ALK + ROS1 + KRAS + BRAF + HER2 + MSI/TMB + PD-L1 · drives precision oncology",
        specimen: "Tumor tissue (FFPE block from biopsy or surgery) — preferred; LIQUID BIOPSY (ctDNA from plasma) — alternative when tissue inadequate; turnaround 1-3 weeks; results integrated into multidisciplinary tumor board",
        nclexTags: labsTagsR33,
        referenceRanges: [
            ReferenceRangeRow(value: "Standard reportable mutations", label: "Hot spots in driver genes; varies by cancer type and panel; FDA-approved companion diagnostics for many", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "VUS (variants of uncertain significance)", label: "Frequently encountered; not directly actionable; counsel patient + clinical context", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "Tumor mutational burden (TMB)", label: "Mutations per megabase; high TMB ≥10 mut/Mb may predict immunotherapy response (FDA approved pembrolizumab indication)", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "MSI-high / MMR-deficient", label: "Microsatellite instability (≥30% of microsatellites unstable) OR MMR protein loss (MLH1, MSH2, MSH6, PMS2 by IHC); predicts immunotherapy response across cancers (pembrolizumab tissue-agnostic indication)", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "PD-L1 expression", label: "Tumor proportion score (TPS), combined positive score (CPS) — varies by drug + cancer; guides immunotherapy eligibility (pembrolizumab, nivolumab, atezolizumab)", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "HRD (homologous recombination deficiency)", label: "Score combining BRCA mutations + genomic instability; predicts PARP inhibitor response in ovarian cancer", citationIDs: ["specialty_labs_round33"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "No actionable mutations",
                summary: "No FDA-approved or NCCN-listed actionable mutations identified — proceed with standard chemotherapy or immunotherapy based on tumor type + PD-L1 + TMB + MSI per primary source.",
                nursingActions: [
                    "Document baseline genomic profile.",
                    "Consider clinical trial enrollment for targeted therapy options.",
                    "Standard treatment per guidelines.",
                    "Repeat testing if disease progresses (resistance mutations possible)."
                ],
                citationIDs: ["specialty_labs_round33"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Actionable driver mutations identified",
                summary: "Actionable mutations present — guides targeted therapy selection or eligibility for specific immunotherapy or PARP inhibitor; potentially transformative for prognosis per primary source.",
                nursingActions: [
                    "Multidisciplinary tumor board discussion + targeted therapy selection.",
                    "Counsel patient about precision oncology + improved outcomes potential.",
                    "Pre-treatment workup for selected targeted therapy (cardiac for HER2-targeted, pulmonary for EGFR-TKIs, autoimmune for ICIs).",
                    "Genetic counseling if germline (BRCA1/2, Lynch, etc.) — family cascade testing.",
                    "Repeat testing on disease progression — resistance mutations + new therapies (e.g., osimertinib for T790M EGFR resistance).",
                    "Discussion of clinical trials for novel targets without FDA-approved therapies."
                ],
                citationIDs: ["specialty_labs_round33"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "NSCLC actionable mutations",
                causes: ["EGFR mutation (~15-20% NSCLC; osimertinib + others)", "ALK rearrangement (~3-7%; alectinib + others)", "ROS1 (~1-2%; crizotinib + entrectinib)", "BRAF V600E (~1-3%; dabrafenib + trametinib)", "KRAS G12C (~13%; sotorasib + adagrasib)", "MET exon 14 skipping (~3-4%; capmatinib + tepotinib)", "RET fusion (~1-2%; selpercatinib + pralsetinib)", "NTRK fusion (~0.1%; larotrectinib + entrectinib)", "HER2 mutation (~3%; trastuzumab deruxtecan)"],
                citationIDs: ["specialty_labs_round33"]
            ),
            CauseGroup(
                title: "Breast cancer actionable",
                causes: ["BRCA1/2 germline + somatic (PARP inhibitors — olaparib + talazoparib)", "PIK3CA mutation (~30% HR+; alpelisib + capivasertib)", "HER2 amplification (~15-20%; trastuzumab + pertuzumab + T-DM1 + Enhertu + tucatinib)", "ESR1 mutation (acquired endocrine resistance; elacestrant + future SERDs)", "Other less common — AKT1, ERBB2 mutations + fusions, NTRK, MSI"],
                citationIDs: ["specialty_labs_round33"]
            ),
            CauseGroup(
                title: "CRC + GI actionable",
                causes: ["KRAS/NRAS mutation (~50%; predicts NO benefit from anti-EGFR — cetuximab + panitumumab)", "BRAF V600E (~5-10%; encorafenib + cetuximab + binimetinib)", "MSI-high/MMR-deficient (~15% CRC; pembrolizumab + immunotherapy)", "HER2 amplification (~3%; trastuzumab combinations)", "FGFR2/3 fusion (cholangiocarcinoma; pemigatinib + futibatinib)", "IDH1 mutation (cholangiocarcinoma; ivosidenib)", "BRCA in pancreatic (germline; olaparib)"],
                citationIDs: ["specialty_labs_round33"]
            ),
            CauseGroup(
                title: "Tissue-agnostic mutations",
                causes: ["MSI-high/MMR-deficient (pembrolizumab in any solid tumor)", "TMB-high (pembrolizumab in any solid tumor)", "NTRK fusion (larotrectinib + entrectinib in any solid tumor)", "RET fusion (selpercatinib + pralsetinib in any solid tumor)", "BRAF V600E (dabrafenib + trametinib in many solid tumors including biliary, glioma, anaplastic thyroid)"],
                citationIDs: ["specialty_labs_round33"]
            )
        ],
        nursingActions: [
            AttributedBullet("Test ordering — based on cancer type + treatment context (newly diagnosed vs progression); tissue-based panel preferred when adequate sample.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Tissue requirements — adequate FFPE block from biopsy or surgery; pathology coordination; sometimes need re-biopsy.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("LIQUID BIOPSY (ctDNA) — alternative when tissue inadequate or for monitoring; lower sensitivity than tissue but increasingly sensitive.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Multiple panel options — comprehensive genomic profiling (CGP) panels (FoundationOne, Tempus, Caris, etc.) examine 300-500+ genes; cancer-specific smaller panels (e.g., NSCLC EGFR/ALK/ROS1) faster + cheaper; insurance considerations.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Turnaround time — 1-3 weeks typically; some institutions have rapid panels for time-critical decisions.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Multidisciplinary tumor board interpretation — molecular tumor board increasingly common; integrates with clinical context + treatment options + clinical trials.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Germline vs somatic — many cancers also benefit from germline testing (BRCA1/2 + Lynch syndrome + Li-Fraumeni + Cowden); cascade family testing impact.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Genetic counseling — pre + post germline testing; psychosocial impact; family implications + cascade testing options.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Insurance coverage — generally covered for FDA-approved indications; out-of-pocket costs for some panels; financial counseling.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Patient education — precision oncology + targeted therapy + immunotherapy concepts; expectations + limitations + privacy.", citationIDs: ["specialty_labs_round33"])
        ],
        watchFor: [
            AttributedBullet("VUS (variants of uncertain significance) — common; not directly actionable; periodic re-classification as evidence grows.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("INSUFFICIENT TISSUE — common limitation; rebiopsy + liquid biopsy alternatives.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("RESISTANCE MUTATIONS — emerge with targeted therapy; repeat genomic profiling at progression.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("GERMLINE FINDINGS — incidental BRCA + Lynch + others; management implications + family cascade.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("PRIVACY + DISCRIMINATION concerns — GINA (Genetic Information Nondiscrimination Act) protects employment + health insurance; life + disability not covered.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("CLINICAL TRIAL eligibility — molecular profile increasingly determines clinical trial access.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("EVOLVING field — new biomarkers + therapies frequently; ongoing testing + reassessment.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("DISPARITIES — genomic testing access varies by institution + insurance + race/ethnicity; equitable access initiatives.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("MDR1 + DPYD + UGT1A1 + others — pharmacogenomic markers for chemotherapy toxicity prediction; emerging clinical use.", citationIDs: ["specialty_labs_round33"])
        ],
        citations: [openrnLabsR33, specialtyLabsR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CtDNASample {
    public static let entry: LabEntry = LabEntry(
        id: "circulating-tumor-dna",
        title: "Circulating tumor DNA (ctDNA) — liquid biopsy",
        subtitle: "Cell-free DNA from tumor in plasma · non-invasive · MRD detection + treatment response monitoring + actionable mutation identification + emerging early detection",
        specimen: "Plasma 10-30 mL collected in cell-free DNA preservation tubes (Streck or similar); processed within 7 days; specialized lab; turnaround 1-3 weeks",
        nclexTags: labsTagsR33,
        referenceRanges: [
            ReferenceRangeRow(value: "Detectable ctDNA", label: "Variable detectability based on tumor type, stage, location; some tumors release more ctDNA (CRC, lung, pancreas, biliary, melanoma) than others (brain, prostate localized)", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "Variant allele frequency (VAF)", label: "% of cell-free DNA from tumor; higher VAF correlates with greater tumor burden + worse prognosis; quantitative monitoring", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "Detectable specific mutations", label: "Same as tissue NGS — driver mutations + resistance mutations + biomarkers; sometimes finds mutations not in tissue (intratumor heterogeneity, metastatic site difference)", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "MRD (minimal residual disease)", label: "Detection of residual ctDNA after curative treatment; predicts recurrence; emerging clinical adoption (CRC, breast, lung, lymphoma)", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "Negative ctDNA", label: "Doesn't exclude cancer; sensitivity limited especially in localized + early disease + tumors with low ctDNA shedding", citationIDs: ["specialty_labs_round33"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative ctDNA / no actionable mutations",
                summary: "Negative ctDNA — limited sensitivity especially for early/localized disease; doesn't exclude residual disease + recurrence risk; clinical correlation per primary source.",
                nursingActions: [
                    "If for MRD detection — encouraging but not definitive; continue surveillance per guidelines.",
                    "Consider tissue biopsy if alternative samples available + critical decision pending.",
                    "Repeat testing if disease progression clinically suspected."
                ],
                citationIDs: ["specialty_labs_round33"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Detectable ctDNA / actionable mutations identified",
                summary: "Detectable tumor DNA in plasma — supports ongoing or recurrent disease + identifies actionable mutations + tracks treatment response per primary source.",
                nursingActions: [
                    "Multidisciplinary tumor board discussion + targeted therapy selection if actionable mutations.",
                    "MRD (post-curative treatment) — high recurrence risk; consider adjuvant therapy intensification + clinical trials; close surveillance.",
                    "Treatment monitoring — declining VAF correlates with response; rising VAF indicates progression + treatment resistance.",
                    "Resistance mutations — guides line switch (e.g., T790M in EGFR-NSCLC → osimertinib).",
                    "Counsel patient about significance + treatment implications.",
                    "Repeat testing for monitoring + treatment decisions."
                ],
                citationIDs: ["specialty_labs_round33"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications for ctDNA testing",
                causes: ["Tissue inadequate for genomic testing — alternative source for actionable mutation detection", "Treatment monitoring — track tumor response (declining VAF) and progression (rising VAF)", "Resistance mutation detection — at progression to identify mechanism (e.g., EGFR T790M → osimertinib)", "MRD (minimal residual disease) — post-curative treatment to identify high recurrence risk", "Recurrence detection — emerging surveillance tool", "Early detection / cancer screening — emerging use (Galleri, Grail, others — multi-cancer early detection tests)"],
                citationIDs: ["specialty_labs_round33"]
            ),
            CauseGroup(
                title: "Cancers with high ctDNA detectability",
                causes: ["Colorectal cancer — high MRD utility", "Lung cancer (NSCLC + SCLC)", "Pancreatic + biliary cancer", "Melanoma", "Bladder cancer", "Hepatocellular carcinoma"],
                citationIDs: ["specialty_labs_round33"]
            ),
            CauseGroup(
                title: "Cancers with low ctDNA detectability",
                causes: ["Brain tumors (blood-brain barrier limits ctDNA release)", "Localized prostate cancer", "Localized renal cell carcinoma", "Some early-stage cancers", "Tumors with low proliferation"],
                citationIDs: ["specialty_labs_round33"]
            )
        ],
        nursingActions: [
            AttributedBullet("LIQUID BIOPSY ADVANTAGES — non-invasive (just blood draw), repeatable for monitoring, captures tumor heterogeneity (multi-site sampling), faster than tissue biopsy + procedure-free.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("LIMITATIONS — lower sensitivity than tissue (especially early stage), false negatives common, doesn't replace tissue when tissue available + adequate, technical complexity + cost.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("MRD (MINIMAL RESIDUAL DISEASE) emerging — post-curative treatment, ctDNA positivity predicts recurrence; transformative in CRC + breast + lung; clinical trials guiding adjuvant intensification.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("MULTI-CANCER EARLY DETECTION (MCED) tests — Galleri (Grail), CancerSEEK, others — screening multiple cancers from single blood draw; emerging + promising; not yet standard of care; FDA approval pending; clinical context.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Treatment response monitoring — serial ctDNA correlates with imaging + clinical response; emerging clinical use for treatment decisions.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Resistance mutation detection — at progression; guides next line therapy (e.g., osimertinib for T790M EGFR resistance, alpelisib for PIK3CA breast cancer).", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Specimen handling — cell-free DNA preservation tubes (Streck), shipping requirements, processing timeline; quality control.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("INSURANCE — variable coverage; FDA-approved companion diagnostics covered; many MRD + screening uses not yet covered; cost considerations.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Patient education — non-invasive nature + significance + complementary to tissue; expectations + limitations.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("EVOLVING field — rapidly advancing technology + clinical applications; ongoing trials.", citationIDs: ["specialty_labs_round33"])
        ],
        watchFor: [
            AttributedBullet("FALSE NEGATIVES — common in early/localized disease + low-shedding tumors; doesn't exclude cancer.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("FALSE POSITIVES — clonal hematopoiesis of indeterminate potential (CHIP) can produce false-positive somatic mutations from blood cells; need to interpret with hematologic context.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("CLINICAL CONTEXT essential — ctDNA results integrated with imaging, biomarkers, clinical assessment, prior treatment.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("MRD CLINICAL TRIALS — define optimal use + response thresholds + which patients benefit; ongoing.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("DISPARITIES + access — emerging technology; equitable access challenges.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("CLONAL EVOLUTION — ctDNA captures evolving tumor; helps understand resistance + recurrence biology.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("PRIVACY concerns — non-invasive nature increases broader testing; counseling on implications.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("FUTURE — pan-cancer screening + early detection + organ of origin localization + treatment monitoring + drug development biomarkers.", citationIDs: ["specialty_labs_round33"])
        ],
        citations: [openrnLabsR33, specialtyLabsR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MSIMMRTestingSample {
    public static let entry: LabEntry = LabEntry(
        id: "msi-mmr-tumor-testing",
        title: "Microsatellite instability (MSI) + mismatch repair (MMR) testing",
        subtitle: "MSI-high/MMR-deficient predicts immunotherapy response (pembrolizumab tissue-agnostic) · Lynch syndrome screening · ~15% CRC + 30% endometrial · IHC + PCR/NGS",
        specimen: "Tumor tissue FFPE — for IHC (MMR proteins) + PCR/NGS (MSI markers); blood for germline confirmatory testing if Lynch syndrome suspected; turnaround 1-2 weeks IHC, 2-3 weeks PCR/NGS",
        nclexTags: labsTagsR33,
        referenceRanges: [
            ReferenceRangeRow(value: "MMR proteins INTACT (IHC)", label: "MLH1, MSH2, MSH6, PMS2 nuclear staining preserved — proficient mismatch repair (pMMR)", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "MMR protein LOSS (IHC)", label: "Loss of one or more MMR proteins — deficient mismatch repair (dMMR); equivalent to MSI-high; predicts immunotherapy response + Lynch screening", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "MSI status — MSS (microsatellite stable)", label: "<30% of microsatellite markers unstable (often <2 of 5 traditional markers); proficient MMR; STANDARD therapy without immunotherapy benefit from MSI", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "MSI status — MSI-low", label: "Borderline; clinical significance unclear; usually treated as MSS for immunotherapy decisions", citationIDs: ["specialty_labs_round33"]),
            ReferenceRangeRow(value: "MSI-HIGH", label: "≥30% of microsatellite markers unstable (often ≥3 of 5 markers); equivalent to dMMR; PEMBROLIZUMAB tissue-agnostic FDA approval; LYNCH SYNDROME workup", citationIDs: ["specialty_labs_round33"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "MSS / proficient MMR (pMMR)",
                summary: "Microsatellite stable + proficient mismatch repair — does not benefit from immunotherapy based on MSI; standard treatment per cancer-specific guidelines per primary source.",
                nursingActions: [
                    "Standard treatment per cancer-specific guidelines.",
                    "Continue cancer-specific molecular testing (KRAS, BRAF, EGFR, ALK, etc.).",
                    "Lynch syndrome workup not indicated based on MSI alone.",
                    "Document for treatment selection."
                ],
                citationIDs: ["specialty_labs_round33"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "MSI-high / deficient MMR (dMMR)",
                summary: "MSI-high or deficient mismatch repair — IMMUNOTHERAPY indicated (pembrolizumab tissue-agnostic) + LYNCH SYNDROME workup required per primary source.",
                nursingActions: [
                    "IMMUNOTHERAPY consideration — PEMBROLIZUMAB has tissue-agnostic FDA approval for MSI-high/dMMR solid tumors; significant response rates; consider for first-line OR subsequent treatment.",
                    "LYNCH SYNDROME WORKUP — PCR for BRAF V600E mutation OR MLH1 promoter hypermethylation testing — both suggest sporadic (non-Lynch) MSI-high; ABSENCE of these → germline testing for Lynch (MLH1, MSH2, MSH6, PMS2, EPCAM mutations).",
                    "GENETIC COUNSELING + germline testing — for confirmed or suspected Lynch syndrome; cascade family testing.",
                    "FAMILY MEMBERS — if Lynch confirmed, cascade testing of first-degree relatives (50% risk).",
                    "INTENSIFIED CANCER SCREENING — Lynch carriers — annual colonoscopy starting age 20-25, transvaginal ultrasound + endometrial biopsy starting age 30-35, urine cytology + GU surveillance, gastric/small bowel surveillance, skin exam annually.",
                    "PROPHYLACTIC SURGERY — Lynch carriers consider prophylactic hysterectomy + bilateral salpingo-oophorectomy after childbearing complete (high endometrial + ovarian risk).",
                    "Tumor immunotherapy management as for any ICI — irAE surveillance + management."
                ],
                citationIDs: ["specialty_labs_round33"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "MSI-high / dMMR cancers",
                causes: ["Colorectal cancer (~15%; 80% of these are sporadic, 20% Lynch syndrome)", "Endometrial cancer (~30%; many Lynch-associated)", "Gastric cancer", "Small bowel cancer", "Urothelial cancer", "Hepatobiliary + pancreatic cancer (less common)", "Brain tumors (rare; constitutional MMR deficiency syndrome — CMMRD)"],
                citationIDs: ["specialty_labs_round33"]
            ),
            CauseGroup(
                title: "Lynch syndrome",
                causes: ["Autosomal dominant inheritance + variable penetrance", "Germline mutations in MLH1, MSH2, MSH6, PMS2, EPCAM", "Lifetime cancer risks — colorectal 50-80%, endometrial 30-60%, stomach 5-15%, ovarian 8-20%, urothelial 5-10%, brain 5-10%, small bowel + hepatobiliary + skin (Muir-Torre variant)", "Family history — 3+ first-degree relatives with Lynch-associated cancers + at least one diagnosed <50", "Amsterdam II criteria + revised Bethesda guidelines historic; universal MSI/MMR testing of CRC + endometrial cancer increasingly standard"],
                citationIDs: ["specialty_labs_round33"]
            ),
            CauseGroup(
                title: "Sporadic MSI-high",
                causes: ["MLH1 promoter HYPERMETHYLATION — most common cause of sporadic MSI-high CRC; epigenetic silencing of MLH1; BRAF V600E mutation often co-occurs", "Older age", "Right-sided CRC predilection", "Mucinous histology", "Tumor-infiltrating lymphocytes"],
                citationIDs: ["specialty_labs_round33"]
            )
        ],
        nursingActions: [
            AttributedBullet("UNIVERSAL TESTING recommended — colorectal cancer + endometrial cancer (NCCN + USPSTF + others); cancer types with high MSI-high prevalence; identifies Lynch syndrome opportunities + immunotherapy candidates.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("METHODS — IHC (mismatch repair protein staining) faster + cheaper but less sensitive than PCR/NGS; PCR/NGS more sensitive but slower + more expensive; combined approach common.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("DUAL CONFIRMATION — discordant IHC vs PCR/NGS sometimes occurs; multidisciplinary review.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("BRAF V600E + MLH1 promoter hypermethylation — performed if MSI-high to differentiate sporadic from Lynch; sporadic if either positive; Lynch workup if both negative.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("GERMLINE TESTING confirmation — for suspected Lynch (MMR loss without MLH1 hypermethylation OR family history); blood-based genetic panel; pre-test genetic counseling.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("FAMILY CASCADE testing — if Lynch confirmed, first-degree relatives at 50% risk; counseling + cascade testing critical.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("LYNCH SURVEILLANCE — annual colonoscopy starting age 20-25 (or 5 years before youngest affected), gynecologic surveillance, urinalysis/cytology, dermatologic, skin exam annually (Muir-Torre).", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("PROPHYLACTIC SURGERY — Lynch carriers may consider hysterectomy + BSO after childbearing; counseling + reproductive planning.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("IMMUNOTHERAPY for MSI-high — pembrolizumab tissue-agnostic + nivolumab + ipilimumab + others; high response rates (~30-50% in CRC); transformative.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Patient education — significance, implications for treatment + family, reproductive considerations, ongoing surveillance.", citationIDs: ["specialty_labs_round33"])
        ],
        watchFor: [
            AttributedBullet("LYNCH SYNDROME UNDER-RECOGNITION — historically under-tested; universal screening of CRC + endometrial increasing; identifies otherwise unrecognized Lynch families.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("PSYCHOSOCIAL impact of germline mutation diagnosis — anxiety, family relationships, reproductive decisions; counseling support.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("INSURANCE + DISCRIMINATION — GINA protects against employment + health insurance discrimination; life + disability not covered.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("CASCADE TESTING — family genetic counseling + testing critical for prevention; not all relatives accept testing.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("CMMRD (constitutional mismatch repair deficiency) — biallelic Lynch — pediatric brain tumors + leukemia + GI cancers; rare + devastating; multidisciplinary.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("VARIANTS OF UNCERTAIN SIGNIFICANCE — common in MMR genes; counsel + reclassification over time.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("REPRODUCTIVE OPTIONS for Lynch carriers — preimplantation genetic diagnosis + prenatal testing + decisions about childbearing + parental concerns.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("Surveillance ADHERENCE — long-term + intensive; engagement + reminders + multidisciplinary support.", citationIDs: ["specialty_labs_round33"]),
            AttributedBullet("EVOLVING CRITERIA — universal MSI testing reduces missed Lynch cases vs historical Bethesda criteria; adapting practice.", citationIDs: ["specialty_labs_round33"])
        ],
        citations: [openrnLabsR33, specialtyLabsR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}
