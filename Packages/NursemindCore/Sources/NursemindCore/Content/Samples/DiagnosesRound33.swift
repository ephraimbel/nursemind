import Foundation

// Curator-model diagnosis entries (round 33 — oncology depth: lung + breast subtypes + prostate + CRC + irAEs + febrile neutropenia).

private let openrnDxR33 = CitationSource(
    id: "openrn_dx_round33",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR33 = CitationSource(
    id: "cdc_dx_round33",
    shortName: "CDC + NCI + NIH oncology concept citations",
    publisher: "CDC · NCI · NIH",
    license: .publicDomain,
    url: "https://www.cancer.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR33 = CitationSource(
    id: "specialty_dx_round33",
    shortName: "NCCN + ASCO + ESMO + ONS concept citations",
    publisher: "NCCN · ASCO · ESMO · ONS",
    license: .factCitationOnly,
    url: "https://www.nccn.org/guidelines/",
    lastRetrieved: "2026-05-13"
)

private let cancerTagR33 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let irAETagR33 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cellularRegulation)
private let infectionOncTagR33 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)

public enum NSCLCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "nsclc",
        title: "Non-small cell lung cancer (NSCLC)",
        subtitle: "~85% of lung cancers · adenocarcinoma/squamous/large cell · molecular testing (EGFR/ALK/ROS1/BRAF/KRAS/PD-L1/MET/RET/NTRK) · targeted + immunotherapy + chemo · staging-driven",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "Non-small cell lung cancer (NSCLC) — ~85% of lung cancers; subtypes — adenocarcinoma (~50%, more common in non-smokers + women), squamous cell carcinoma (~25%, central, smoking-related), large cell carcinoma. Modern management revolutionized by MOLECULAR TESTING (EGFR, ALK, ROS1, BRAF, KRAS, MET, RET, NTRK, NRG1, HER2) + IMMUNOTHERAPY (PD-L1, TMB). Staging-driven (TNM, AJCC); treatment ranges from surgery + adjuvant (early) to combination chemoimmunotherapy + targeted therapy (advanced) per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Malignant transformation of bronchial epithelium → invasive growth + local spread → metastasis. Driver mutations (EGFR + ALK + ROS1 + BRAF, etc.) drive specific cancer phenotypes + targeted therapy responsiveness. Smoking causes most squamous + small cell; adenocarcinoma more common in non-smokers + Asian women + younger; environmental (radon, asbestos, secondhand smoke); genetic predisposition.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("PERSISTENT COUGH (often productive or hemoptysis), dyspnea, chest pain, recurrent pneumonia (post-obstructive), weight loss, fatigue.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("BONE PAIN (metastases), neurologic deficits (brain metastases — frequent in lung cancer), supraclavicular adenopathy, paraneoplastic syndromes (SIADH, hypercalcemia).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("HORNER SYNDROME (Pancoast tumor — apical NSCLC with sympathetic chain compression), brachial plexus pain, hoarseness (recurrent laryngeal nerve), dysphagia (esophageal compression).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("SVC SYNDROME — facial + neck swelling + dilated chest veins; oncologic emergency from mediastinal mass; less common in NSCLC than SCLC.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("INCIDENTAL — increasingly common in lung cancer screening (low-dose chest CT in high-risk individuals).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — SMOKING (~85% of lung cancer), secondhand smoke, radon, asbestos, occupational (arsenic, cadmium, chromium), family history, prior radiation, COPD, fibrotic lung disease.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HISTOLOGIC diagnosis from BIOPSY — bronchoscopy + transthoracic + endobronchial ultrasound (EBUS) + CT-guided lung biopsy + thoracoscopy; tissue essential for histology + molecular testing per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGING — CT chest/abdomen/pelvis with contrast + PET-CT (FDG uptake) + brain MRI (especially adenocarcinoma + symptoms) + bone scan if symptomatic; AJCC TNM staging.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MOLECULAR TESTING (essential for advanced disease) — EGFR mutation (osimertinib for L858R, ex19del + others), ALK rearrangement (alectinib, brigatinib, lorlatinib, crizotinib), ROS1 (crizotinib, entrectinib), BRAF V600E (dabrafenib + trametinib), MET exon 14 skipping (capmatinib, tepotinib), RET fusion (selpercatinib, pralsetinib), KRAS G12C (sotorasib, adagrasib), NTRK fusion (larotrectinib, entrectinib), HER2 mutation (trastuzumab deruxtecan).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PD-L1 testing — TPS (tumor proportion score) score 0/<1%, 1-49%, ≥50% — guides immunotherapy selection.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LIQUID BIOPSY (ctDNA) — when tissue inadequate OR for monitoring; emerging for staging + treatment selection + recurrence detection.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Tumor markers — CEA + others may be used; not screening + not specific.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Pulmonary function tests — pre-operative assessment for surgical candidates.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Histologic + molecular profile — determines treatment options; targeted vs immunotherapy vs chemo.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Stage — surgery for Stage I-II (some Stage III); chemoradiation + immunotherapy for Stage III; systemic therapy for Stage IV.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Performance status — ECOG/Karnofsky; influences treatment choice; rehabilitation potential.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary tumor board — pulmonologist + thoracic surgeon + medical oncologist + radiation oncologist + radiology + pathology + palliative care.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Smoking cessation — even after diagnosis; improves outcomes + reduces complications.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("STAGE I-II — SURGICAL RESECTION (lobectomy preferred; pneumonectomy or sublobar) + lymphadenectomy; ADJUVANT CHEMO for Stage IIA-IIIB (cisplatin + vinorelbine, OR cisplatin + pemetrexed for non-squamous); ADJUVANT IMMUNOTHERAPY (atezolizumab) for high-risk + PD-L1 ≥1%; OSIMERTINIB adjuvant for EGFR+ Stage IB-IIIA (ADAURA trial) per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGE III (locally advanced) — concurrent CHEMORADIATION (cisplatin + etoposide, OR cisplatin + pemetrexed for non-squamous) + DURVALUMAB IMMUNOTHERAPY maintenance (PACIFIC trial); sometimes neoadjuvant chemoimmunotherapy + surgery in selected.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGE IV / METASTATIC — molecular-driven targeted therapy first-line if applicable; OTHERWISE chemo-immunotherapy (carboplatin + paclitaxel/pemetrexed + pembrolizumab) OR PD-L1 high (≥50%) — pembrolizumab monotherapy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("EGFR+ — first-line OSIMERTINIB (Tagrisso); second-line if resistance — clinical trials, chemotherapy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ALK+ — first-line ALECTINIB (Alecensa), brigatinib, lorlatinib, crizotinib.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ROS1+ — crizotinib, entrectinib; lorlatinib for resistance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRAF V600E — dabrafenib + trametinib.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Other actionable — capmatinib/tepotinib (MET), selpercatinib/pralsetinib (RET), sotorasib/adagrasib (KRAS G12C), larotrectinib/entrectinib (NTRK), trastuzumab deruxtecan (HER2).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMMUNOTHERAPY — pembrolizumab, nivolumab, atezolizumab, cemiplimab, durvalumab; alone for PD-L1 ≥50% OR with chemo; combinations with anti-CTLA-4 (ipilimumab) increasingly used.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION THERAPY — concurrent with chemo (Stage III), stereotactic body radiation (SBRT) for early-stage non-surgical, palliative for bone + brain metastases.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRAIN METASTASES — stereotactic radiosurgery (SRS) for limited, whole-brain RT for extensive, immunotherapy + targeted therapy for some; corticosteroids for edema.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PALLIATIVE CARE — integrated early; symptom management + advance care planning + quality of life; some studies show survival benefit.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LUNG CANCER SCREENING — low-dose chest CT in high-risk individuals (USPSTF — age 50-80, ≥20 pack-years, current or quit within 15 years) — reduces lung cancer mortality.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Smoking cessation + counseling + pharmacotherapy.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("PROGRESSION on treatment — resistance mechanisms varying by drug class; rebiopsy + molecular re-profiling + line switch.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRAIN METASTASES — common in NSCLC; surveillance MRI in selected; SRS + whole brain + targeted brain-penetrant therapies (osimertinib, alectinib, lorlatinib).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PARANEOPLASTIC — SIADH (hyponatremia), hypercalcemia (parathyroid hormone-related peptide), hypertrophic osteoarthropathy, dermatomyositis, Lambert-Eaton (rare in NSCLC vs SCLC).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ONCOLOGIC EMERGENCIES — SVC syndrome, spinal cord compression, hypercalcemia of malignancy, tumor lysis syndrome (rare in NSCLC).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION + chemo + immunotherapy toxicities — pneumonitis, esophagitis, dermatitis, immune-related adverse events.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Targeted therapy resistance — develop within 6-24 months typically; rebiopsy for new mutations + line switch.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary care coordination — complex regimens + multiple specialists.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Psychosocial + financial impact — significant; counseling + financial navigation + support groups.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Hereditary cancer syndromes — some lung cancers (~1-5%) hereditary; Li-Fraumeni, hereditary RET, germline EGFR T790M; family history.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Long-term survivorship + screening — second primary cancers + cardiopulmonary complications; comprehensive follow-up.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SCLCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sclc",
        title: "Small cell lung cancer (SCLC)",
        subtitle: "~15% of lung cancers · STRONG smoking association · rapid growth + early metastasis · paraneoplastic (SIADH, Cushing, Lambert-Eaton) · platinum chemo + atezolizumab + radiation",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "Small cell lung cancer (SCLC) — ~15% of lung cancers; aggressive neuroendocrine tumor with rapid growth + early metastasis; strongly smoking-associated. Classified as LIMITED-STAGE (confined to one hemithorax, single radiation port) vs EXTENSIVE-STAGE (beyond one hemithorax). Limited-stage — concurrent chemoradiation + prophylactic cranial irradiation (PCI) in responders. Extensive-stage — platinum + etoposide + atezolizumab (or durvalumab). Paraneoplastic syndromes common (SIADH, ectopic Cushing, Lambert-Eaton, paraneoplastic encephalitis) per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Neuroendocrine tumor; arises from neuroendocrine cells in bronchial epithelium → aggressive growth + early dissemination (often distant metastases at diagnosis); extensive necrosis + paraneoplastic hormone production. Strong smoking association (~98% smoking history); rare in non-smokers. Genomic profile — frequent TP53 + RB1 mutations + MYC family amplifications.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("RAPID symptom progression weeks-months — cough, dyspnea, hemoptysis, chest pain, fatigue, weight loss.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("CENTRAL MASS often — perihilar; commonly mediastinal lymphadenopathy + SVC syndrome.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("EARLY METASTASES — brain (frequent — symptomatic in 20-30% at diagnosis), liver, bone (lytic), adrenal, lung itself.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("PARANEOPLASTIC SYNDROMES — common in SCLC: SIADH (hyponatremia from ectopic ADH), ECTOPIC CUSHING (ACTH-secreting tumor — hypokalemia + hyperglycemia + edema + HTN + metabolic alkalosis), LAMBERT-EATON MYASTHENIC SYNDROME (proximal weakness + autonomic + improves with exercise — distinct from MG), PARANEOPLASTIC ENCEPHALITIS (limbic — anti-Hu antibody), cerebellar degeneration.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("SVC SYNDROME — facial + neck swelling + dilated chest veins + headache + dyspnea + arm swelling; ONCOLOGIC EMERGENCY; common in SCLC.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("ALWAYS exclude SCLC in central lung mass + paraneoplastic features + rapid presentation.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — SMOKING (>95% smoking history), secondhand smoke, occupational + radiation exposure, COPD.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BIOPSY — bronchoscopy, transthoracic, mediastinal node sampling; histology with neuroendocrine markers (chromogranin A, synaptophysin, CD56, INSM1) per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGING — chest/abdomen/pelvis CT + brain MRI + bone scan (or PET-CT alternative); identifies extensive vs limited; older Veterans Administration system (limited vs extensive) supplements TNM.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PARANEOPLASTIC workup — sodium (SIADH), cortisol + ACTH (Cushing — usually atypical timing), calcium, anti-Hu/CV2/amphiphysin antibodies (paraneoplastic encephalitis), creatine kinase (LEMS).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ECG + ECHO — baseline cardiac function before chemo/radiation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Tumor markers — neuron-specific enolase (NSE) + chromogranin A; not specific or sensitive enough for screening.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Mutation testing — less actionable than NSCLC; emerging targeted therapies for select molecular subtypes (DLL3 — tarlatamab).", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("URGENT histologic diagnosis — rapidly progressive disease; sequencing trials of treatment matter.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGE distinction — limited vs extensive; impacts treatment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Paraneoplastic workup — SIADH + Cushing + LEMS + encephalitis particularly common.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary tumor board.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Emergency assessment — SVC syndrome (chemo-responsive emergency in SCLC), spinal cord compression, increased ICP from brain mets.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("LIMITED-STAGE SCLC — concurrent CHEMORADIATION — CISPLATIN + ETOPOSIDE for 4-6 cycles + concurrent radiation (preferred BID 45 Gy / 30 fractions × 3 weeks); PROPHYLACTIC CRANIAL IRRADIATION (PCI) in complete or partial responders; ~20-25% 5-year survival per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("EXTENSIVE-STAGE SCLC — PLATINUM + ETOPOSIDE + ATEZOLIZUMAB (or DURVALUMAB) × 4 cycles → atezolizumab/durvalumab MAINTENANCE; IMPower133 trial + CASPIAN trial — first immunotherapy to improve OS in SCLC; median OS ~12-14 months.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Brain metastases — present in 20-30% at diagnosis; WHOLE BRAIN RADIATION + stereotactic radiosurgery for limited brain mets; PCI for limited-stage in responders (reduces brain mets + improves survival in some).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Second-line — TOPOTECAN (oral or IV), lurbinectedin (Zepzelca), TARLATAMAB (Imdelltra — anti-DLL3 + CD3 bispecific T-cell engager — FDA-approved 2024 for relapsed SCLC); irinotecan-based; clinical trials.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PARANEOPLASTIC management — SIADH (fluid restriction, hypertonic saline for severe hyponatremia, vasopressin antagonists, demeclocycline historic); CUSHING (ketoconazole, metyrapone, mifepristone, surgical adrenalectomy rare); LEMS (3,4-diaminopyridine, IVIG, plasmapheresis); ENCEPHALITIS (immunotherapy + tumor treatment).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SVC SYNDROME — emergent treatment with chemoradiation (highly chemosensitive); steroids for symptoms; rarely surgical bypass.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SUPPORTIVE — palliative care + symptom management + advance care planning; integrated early.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Smoking cessation + counseling.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Surveillance — chest CT q3 months × 2 years; intensive follow-up due to high recurrence.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + radiation oncology + pulmonology + neurology (brain mets + paraneoplastic) + palliative.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("RAPID PROGRESSION + early mortality — median OS extensive-stage 12-14 months despite treatment; limited-stage 5-year survival 20-25%.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HIGH RECURRENCE rate — chemo-sensitive but resistance develops quickly; 2nd line + clinical trials.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRAIN METASTASES — even in initial complete responders; surveillance + PCI consideration.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PARANEOPLASTIC syndromes can be presenting symptom OR develop during treatment — vigilance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ONCOLOGIC EMERGENCIES — SVC syndrome, spinal cord compression, hypercalcemia (less than NSCLC).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CHEMORADIATION toxicities — esophagitis (severe), pneumonitis, cytopenias.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PCI side effects — cognitive decline (modest), fatigue; balance benefits with QOL.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Palliative integration — early; symptom management + quality of life + advance care planning.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Hereditary — rare; not typically associated with germline mutations.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Smoking cessation — critical even after diagnosis; reduces complications + improves treatment response.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DCISSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "dcis",
        title: "Ductal carcinoma in situ (DCIS)",
        subtitle: "Pre-invasive breast cancer · usually screening-detected microcalcifications · BCS + radiation OR mastectomy + endocrine for HR+ · low-risk active surveillance trials",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "Non-invasive breast cancer where malignant cells confined to ductal system (haven't breached basement membrane). Usually detected on screening mammography (microcalcifications); core needle biopsy diagnostic. Spectrum from low-grade with very low progression risk to high-grade more likely to progress. Treatment — BREAST CONSERVING SURGERY (BCS) with margins + RADIATION (typically) OR MASTECTOMY (large area, multifocal, refractory); ENDOCRINE THERAPY for HR+ (tamoxifen or aromatase inhibitor); ongoing trials for active surveillance in low-risk DCIS per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Malignant cells originate from ductal epithelium → proliferate within duct lumen + along basement membrane WITHOUT invasion through membrane. Progression — 14-40% over 10-30 years untreated → invasive cancer (varies by grade + receptor status). Estrogen-receptor positive (~75%), HER2-positive (~30-40% high-grade), triple-negative (~5-10%).",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("ASYMPTOMATIC typically — incidental on screening mammography (~85%); microcalcifications hallmark.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("PALPABLE MASS — uncommon (5-10%); usually invasive component present.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("NIPPLE DISCHARGE — bloody or serous; Paget disease (rare DCIS variant — eczematous nipple changes).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("MAMMOGRAPHY — characteristic microcalcifications (linear, branching, segmental); BIRADS 4-5; calls back for biopsy.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("MRI — sensitive for extent + multifocality; sometimes pre-operative for surgical planning.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — family history of breast cancer, BRCA1/2 mutations, hormonal factors (early menarche, late menopause, nulliparity, HRT), prior breast biopsies, dense breast tissue, older age, ethnicity.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BIOPSY — core needle biopsy preferred; histology + ER + PR + HER2 testing; nuclear grade (low, intermediate, high) per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMAGING — mammography (calcifications), ultrasound (in dense breasts + masses), MRI (extent + multifocality + occult cancer in selected — younger, dense breasts, BRCA).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PATHOLOGY — DCIS grading (Van Nuys, others); margins from surgery; presence of microinvasion (<1 mm — categorized as DCIS-MI); ER/PR/HER2 status.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Oncotype DX DCIS Score — risk stratification tool for local recurrence + benefit of radiation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Differential — atypical ductal hyperplasia (ADH), lobular carcinoma in situ (LCIS), invasive ductal carcinoma (with DCIS component).", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("BIOPSY characterization — DCIS confirmed + grade + receptor status.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging extent — single focus vs multifocal vs widespread.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Genetic counseling — for BRCA + Lynch + Li-Fraumeni risk factors; family history.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary breast tumor board — surgical oncology + radiation oncology + medical oncology + radiology + pathology.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Patient + family counseling — DCIS is pre-invasive; excellent prognosis with treatment; emotional impact + decision-making.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("BREAST CONSERVING SURGERY (BCS / lumpectomy) — first-line for most; goal of negative margins; sentinel lymph node biopsy NOT routine (DCIS doesn't metastasize) but performed if upgrade to invasive concern OR mastectomy + large tumor per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION THERAPY — standard after BCS to reduce local recurrence; whole breast irradiation 4-6 weeks OR partial breast irradiation (selected) OR hypofractionation; Oncotype DX DCIS score helps select low-risk patients who may omit radiation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MASTECTOMY — for large area, multifocal, recurrent, patient preference; usually with sentinel node biopsy OR axillary nodes; reconstruction option.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ENDOCRINE THERAPY — for HR+ DCIS — TAMOXIFEN 20 mg PO daily × 5 years (premenopausal) OR ANASTROZOLE 1 mg PO daily × 5 years (postmenopausal); reduces ipsilateral + contralateral breast cancer; ~50% reduction in local recurrence + new contralateral cancer.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ACTIVE SURVEILLANCE — ongoing trials (COMET, LORIS, LORD) for low-risk DCIS (low-grade, ER+, small, post-menopausal); standard for now is treatment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PROPHYLACTIC mastectomy — for BRCA1/2 carriers with DCIS + high genetic risk.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Surveillance — annual mammography (alternating with MRI in high-risk) + clinical breast exam + risk reduction counseling.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary care + supportive — breast cancer navigator + support groups + reconstruction consultation + mental health.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Lifestyle — weight management, exercise, alcohol moderation (≤1 drink/day), smoking cessation.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("LOCAL RECURRENCE — ~5-10% with BCS + radiation; ~25-30% with BCS alone; half are invasive, half DCIS again; comprehensive imaging surveillance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CONTRALATERAL BREAST CANCER — increased risk lifetime; endocrine therapy reduces.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("UPSTAGING at surgery — ~25% find invasive component on final pathology; sometimes sentinel node biopsy planning.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ENDOCRINE THERAPY adherence — adherence challenges; side effects (hot flashes, joint pain, sexual dysfunction) significant impact; bone density (aromatase inhibitor), VTE risk (tamoxifen); counseling + adherence support.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSYCHOSOCIAL — \"cancer\" diagnosis impact even pre-invasive; uncertainty + treatment decisions; counseling + support groups.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION effects — fatigue, dermatitis, late effects (cosmesis, lymphedema, second cancer rare).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SURGICAL complications — wound infection, hematoma, seroma, cosmesis.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GENETIC counseling — for family history concerns + cascade testing.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRCA1/2 in patients with DCIS — testing for high-risk patients (age <45, multiple cancers, family history).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Long-term survivorship — comprehensive follow-up + healthy lifestyle + breast surveillance.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HRPositiveBreastCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hr-positive-her2-negative-breast-cancer",
        title: "Hormone receptor-positive HER2-negative breast cancer",
        subtitle: "Most common breast cancer (~70%) · ER+/PR+ HER2- · endocrine therapy backbone + CDK4/6 inhibitors transformative · long-term recurrence risk · long DFS",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "Most common breast cancer subtype (~65-70%) — estrogen receptor positive (ER+) + progesterone receptor positive (PR+) + HER2 negative. Generally favorable prognosis but characterized by LONG-TERM RECURRENCE RISK (continues for decades). ENDOCRINE THERAPY backbone (tamoxifen, aromatase inhibitors, fulvestrant, GnRH agonists in premenopausal); CDK4/6 INHIBITORS (palbociclib, ribociclib, abemaciclib) transformative addition for advanced + high-risk early disease. Targeted therapies expanding (PARP for BRCA, PI3K inhibitor alpelisib, AKT inhibitor capivasertib, oral SERDs) per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Estrogen-dependent tumor growth — estrogen binding to nuclear estrogen receptor drives proliferation; targeted by blocking estrogen production (aromatase inhibitors) OR estrogen-receptor binding (SERMs like tamoxifen) OR degrading the receptor (SERDs like fulvestrant). CDK4/6 axis activated downstream; combination with endocrine therapy overcomes resistance + extends responses.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("Variable — screening-detected (asymptomatic mammography), palpable mass, breast changes (skin dimpling, retraction, nipple changes, discharge).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("INFLAMMATORY (rare subtype) — erythema + peau d'orange + warm skin + rapidly progressive; aggressive variant.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Lymph node involvement — axillary lymphadenopathy; sometimes initial presentation.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("METASTASES — bone (most common — typically blastic in HR+, vs lytic), lung, liver, brain (less common than HER2+ or TN), nodal; bone metastases can be painless and detected radiographically.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — age (most common cause of breast cancer in postmenopausal), family history + BRCA1/2 + Lynch + Li-Fraumeni + Cowden, hormonal factors (early menarche, late menopause, nulliparity, late first pregnancy, HRT especially combination), prior chest radiation, dense breasts, lifestyle (alcohol, obesity), Caucasian + Ashkenazi Jewish ethnicity higher.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BIOPSY — core needle biopsy with histology + IHC for ER + PR + HER2 + Ki-67 proliferation index per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMAGING — mammography, ultrasound, MRI in selected (younger, dense breasts, BRCA, neoadjuvant planning).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGING — TNM + AJCC; clinical (T, N, M) + pathologic; size + nodes + metastases.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MULTIGENE ASSAYS — Oncotype DX (21-gene RS) for ER+ N0 — recurrence + chemo benefit prediction; MammaPrint, Prosigna, EndoPredict alternatives.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GENETIC COUNSELING — for selected patients (age <45, multiple cancers, family history) — BRCA1/2 + Lynch + other.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PIK3CA mutation testing — for advanced HR+ HER2- (alpelisib eligibility); ctDNA increasingly used.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ESR1 mutation testing — for advanced HR+ HER2- after CDK4/6 inhibitor + AI progression (elacestrant — oral SERD targeting ESR1-mutated).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging metastases — CT, bone scan, PET for advanced; ctDNA emerging.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Stage + molecular profile — guides treatment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Hormone receptor + HER2 status confirmation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multigene assays for ER+ N0 — Oncotype DX RS.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Genetic counseling for eligible patients.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Fertility preservation discussion in younger pre-menopausal patients before treatment.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("EARLY STAGE (I-II + IIIA selected) — SURGERY (BCS or mastectomy + sentinel node biopsy + axillary lymph node dissection as indicated) + RADIATION THERAPY (whole breast after BCS, post-mastectomy if needed) + ENDOCRINE THERAPY × 5-10 years per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ENDOCRINE THERAPY by menopausal status — PREMENOPAUSAL: TAMOXIFEN 20 mg PO daily × 5 years (often 10 years for high-risk) OR ovarian suppression (GnRH agonist — leuprolide, goserelin) + AROMATASE INHIBITOR (letrozole, anastrozole, exemestane); POSTMENOPAUSAL: AROMATASE INHIBITOR (anastrozole, letrozole, exemestane) × 5 years (sometimes 10).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CHEMOTHERAPY ADJUVANT — Oncotype DX RS to guide; high RS (≥26) benefits from chemotherapy; AC-T (doxorubicin + cyclophosphamide → taxane) common; for premenopausal node-positive + selected.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CDK4/6 INHIBITOR ADJUVANT — ABEMACICLIB × 2 years for high-risk HR+ HER2- early breast cancer (monarchE trial — node+ + high-risk criteria); palbociclib + ribociclib trials in adjuvant ongoing.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("METASTATIC HR+ HER2- — first-line CDK4/6 INHIBITOR + AI (postmenopausal) OR + tamoxifen/AI + GnRH agonist (premenopausal); PALBOCICLIB / RIBOCICLIB / ABEMACICLIB significant survival benefit; second-line — fulvestrant + CDK4/6 inhibitor + alpelisib (PI3K-mutated) + capivasertib (AKT mutated) + olaparib/talazoparib (BRCA-mutated) + elacestrant (ESR1-mutated); chemotherapy after endocrine therapies exhausted.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PARP inhibitors (olaparib, talazoparib) — germline BRCA1/2 mutated; metastatic + selected adjuvant high-risk (OlympiA trial).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BONE-DIRECTED therapy — bisphosphonates (zoledronate IV q3-6 months) OR denosumab (60 mg SC q6 months) for postmenopausal + bone metastases; reduces SREs (fractures, cord compression, hypercalcemia) + may reduce recurrence.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION for metastases — bone (palliative), brain (SRS, WBRT), other symptomatic.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Comprehensive cancer center care — multidisciplinary tumor board, supportive care, palliative care, mental health, social work.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("LONG-TERM RECURRENCE RISK — continues for decades; ER+ breast cancer can recur 10-20+ years after initial diagnosis; extended endocrine therapy + surveillance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ENDOCRINE THERAPY adherence — challenging; hot flashes, sexual dysfunction, mood changes, weight gain, joint pain (AI), bone density loss (AI), VTE (tamoxifen + estrogen-related); counseling + adherence support + symptom management.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("AROMATASE INHIBITOR side effects — bone density loss (DEXA + calcium + vitamin D + bisphosphonate/denosumab if osteoporosis), arthralgias, sexual dysfunction.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("TAMOXIFEN side effects — VTE risk (especially with surgery, immobility), endometrial cancer (rare), cataracts, hot flashes; counseling.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CDK4/6 INHIBITOR side effects — neutropenia (palbociclib + ribociclib), diarrhea (abemaciclib), interstitial lung disease (rare), QTc prolongation (ribociclib > others); CBC + ECG monitoring.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CARDIOTOXICITY — anthracyclines (cumulative dose limits + ECHO surveillance); HER2-targeted not relevant in HER2-negative.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ONCOLOGIC EMERGENCIES — hypercalcemia of malignancy, SVC syndrome, spinal cord compression (bone metastases).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("FERTILITY — discuss before treatment in premenopausal; embryo + oocyte cryopreservation; ovarian suppression during chemotherapy + post-treatment fertility consultation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSYCHOSOCIAL — body image, sexuality, depression, anxiety; integrated mental health + sexual health + support groups.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Surveillance — annual mammography + clinical exam + symptom-directed evaluations.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Pregnancy after breast cancer — possible for some; coordinate with oncology + reproductive endocrinology.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TNBCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "triple-negative-breast-cancer",
        title: "Triple-negative breast cancer (TNBC)",
        subtitle: "~10-15% of breast cancers · ER-/PR-/HER2- · aggressive + early recurrence · NO targeted endocrine + HER2 · chemo backbone + immunotherapy (PD-L1+) + PARP (BRCA+) + sacituzumab govitecan",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "Triple-negative breast cancer (TNBC) — ~10-15% of breast cancers; ER-, PR-, HER2- (lacks expression of estrogen receptor, progesterone receptor, AND HER2). Aggressive subtype with early recurrence (peak 2-3 years post-diagnosis), higher metastasis rates, younger age presentation, more common in BRCA1 carriers + African American women. No targeted endocrine OR HER2 therapy available. Treatment — CHEMOTHERAPY backbone (anthracycline + taxane) + IMMUNOTHERAPY (pembrolizumab) for PD-L1+ + PARP inhibitors (olaparib, talazoparib) for germline BRCA-mutated + SACITUZUMAB GOVITECAN (Trop-2 ADC) for metastatic; KEYNOTE-522 (neoadjuvant pembrolizumab + chemo) transformative per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Heterogeneous group of cancers without ER, PR, or HER2 expression; molecular subtypes include basal-like (most), claudin-low, mesenchymal stem-like, LAR (luminal androgen receptor); lacks targeted endocrine + HER2 receptor pathways. Often associated with BRCA1 mutations (germline) — HRD (homologous recombination deficient). Genomic features — high TP53 mutations, BRCA1/2, RB1 loss; high tumor mutation burden + PD-L1 expression in subsets enable immunotherapy response.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("RAPID PROGRESSION — often palpable mass, axillary lymphadenopathy at diagnosis; presents at higher stage than HR+.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("AGE — younger at diagnosis than other subtypes; African American women + BRCA1 carriers represented.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("METASTASES preferential — visceral (lung, liver, brain), nodes, soft tissue; less commonly bone-only (vs HR+).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("INFLAMMATORY TNBC — particularly aggressive; erythema + peau d'orange + rapid progression.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Family history of breast/ovarian cancer + BRCA1/2 carrier prevalence (~10-20% of TNBC).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — BRCA1/2 carriers (especially BRCA1), African American ethnicity, premenopausal age, parity factors, lifestyle, family history.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BIOPSY — core needle biopsy with histology + IHC for ER + PR + HER2 — TRIPLE NEGATIVE if all three negative; Ki-67 typically high; histologic subtype per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMAGING — mammography, ultrasound, MRI for staging + planning.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGING — TNM + AJCC; presents at higher stage often.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GENETIC COUNSELING + BRCA1/2 TESTING — RECOMMENDED for ALL TNBC patients per NCCN guidelines (~10-20% germline BRCA in TNBC); also Lynch + other.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PD-L1 testing — combined positive score (CPS) ≥10 (SP142 assay 22C3) — predicts pembrolizumab benefit; testing for metastatic + neoadjuvant.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HRD (homologous recombination deficiency) testing — emerging; predicts PARP inhibitor response.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("TROP-2 expression — universal in TNBC; sacituzumab govitecan eligibility based on metastatic disease.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging for advanced — CT, PET-CT, brain MRI (high TNBC brain metastasis risk).", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("MOLECULAR profile — confirm triple-negative; subtype if available.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GENETIC COUNSELING + BRCA testing — ALL TNBC patients.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PD-L1 status for treatment eligibility.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Stage + extent of disease.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Fertility preservation discussion (often young).", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("EARLY STAGE (II-III) — NEOADJUVANT CHEMOIMMUNOTHERAPY — pembrolizumab + carboplatin + paclitaxel × 4 cycles → pembrolizumab + AC × 4 cycles → surgery → adjuvant pembrolizumab × 9 cycles (KEYNOTE-522 trial); pathologic complete response (pCR) → continue pembrolizumab; residual disease — adjuvant CAPECITABINE (CREATE-X trial) OR PARP inhibitor (germline BRCA) OR pembrolizumab continued per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SURGERY — BCS + radiation OR mastectomy; SLNB; axillary dissection if positive nodes.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION — post-mastectomy if tumor >5 cm OR 4+ positive nodes OR positive margins; whole-breast after BCS.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ADJUVANT systemic therapy — based on residual disease + response to neoadjuvant; capecitabine OR pembrolizumab continued OR PARP for BRCA+.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("METASTATIC TNBC — first-line: PD-L1 CPS ≥10 — PEMBROLIZUMAB + chemo (carboplatin + paclitaxel OR nab-paclitaxel); PD-L1 negative or low — chemo alone; PARP inhibitor for germline BRCA-mutated; second-line — SACITUZUMAB GOVITECAN (anti-TROP-2 ADC), trastuzumab deruxtecan for HER2-LOW expression, other chemo.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PARP inhibitors (olaparib, talazoparib) — germline BRCA-mutated; metastatic + selected adjuvant high-risk.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION metastases — bone, brain, soft tissue palliation; SRS for limited brain mets.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CLINICAL TRIALS — encouraged given limited targeted options; antibody-drug conjugates, combination immunotherapies, novel agents.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Comprehensive supportive care + palliative care + survivorship.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRCA1/2 cascade — family genetic counseling + screening + risk-reduction surgery considerations.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("EARLY RECURRENCE peak 2-3 years post-treatment; aggressive disease; intensive early surveillance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("VISCERAL + BRAIN METASTASES — lung + liver + brain particularly; CNS metastasis surveillance for advanced disease (brain MRI as symptomatic OR routine in some).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CHEMO TOXICITIES — anthracycline (cardiac), taxane (neuropathy), platinum (renal + neuropathy + nausea), cyclophosphamide; standard chemo management.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMMUNOTHERAPY irAEs — same as nivolumab + atezolizumab; full organ system surveillance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRCA1 carriers — high lifetime risks of other cancers (contralateral breast, ovarian, pancreatic); risk-reduction strategies + surveillance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ONCOLOGIC EMERGENCIES — spinal cord compression, brain mets symptoms, hypercalcemia (less than HR+), pleural effusion, ascites.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("FERTILITY + young patients — pre-treatment fertility preservation; pregnancy after treatment possible with planning.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSYCHOSOCIAL — aggressive disease + younger demographic; significant impact; mental health + support groups + survivorship.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("DISPARITIES — African American patients have higher TNBC incidence + worse outcomes; access + culturally-competent care.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Limited targeted therapy options vs HR+/HER2+; clinical trials encouraged.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HER2PositiveBreastCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "her2-positive-breast-cancer",
        title: "HER2-positive breast cancer",
        subtitle: "~15-20% of breast cancers · HER2 amplified/overexpressed · trastuzumab REVOLUTIONIZED · pertuzumab + T-DM1 + tucatinib + trastuzumab deruxtecan · CNS metastasis common",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "HER2-positive (human epidermal growth factor receptor 2) breast cancer — ~15-20% of all breast cancers; HER2 gene amplification (IHC 3+ OR FISH/CISH ratio ≥2.0); previously highly aggressive subtype until trastuzumab developed. Now TARGETED THERAPY-DRIVEN with multiple options — trastuzumab + pertuzumab + T-DM1 (trastuzumab emtansine) + trastuzumab deruxtecan + tucatinib + neratinib + margetuximab + lapatinib. Frequently HR-positive (~50%) — \"triple positive\" disease. Significant CNS metastasis risk per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "HER2 gene amplification → HER2 receptor overexpression on tumor cell surface → constitutive receptor dimerization + downstream signaling (PI3K/AKT, RAS/MAPK) → aggressive proliferation. HER2-targeted therapies block this signaling — trastuzumab + pertuzumab bind extracellular HER2; T-DM1 + trastuzumab deruxtecan deliver chemo payload internally; tucatinib + lapatinib + neratinib block intracellular kinase. Multiple resistance mechanisms exist.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("Generally similar to other breast cancers but more aggressive without targeted therapy; mass, lymphadenopathy.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("CNS METASTASES — high risk (~30-50% lifetime in metastatic HER2+); related to HER2-mediated blood-brain barrier interactions; sometimes presenting symptom (headache, seizures, focal deficits).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Triple positive (HR+ HER2+) — ~50% of HER2+; similar treatment but endocrine therapy added.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Inflammatory + locally advanced presentations.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Metastases — bone + visceral + nodes + CNS (high frequency).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — younger age, family history (less BRCA-associated than TNBC), lifestyle factors similar to other breast cancers.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BIOPSY — IHC scoring (0/1+ negative; 2+ equivocal — requires FISH/CISH; 3+ positive); FISH/CISH for equivocal IHC — HER2/CEP17 ratio ≥2.0 OR HER2 signal ≥6/cell positive per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HER2-LOW emerging classification — IHC 1+ or 2+/ISH- — previously HER2-negative; new ADC trastuzumab deruxtecan effective.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HORMONE RECEPTOR status — ER + PR — combined HR+ HER2+ \"triple positive\" treatment includes endocrine therapy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMAGING — standard breast workup; brain MRI for metastatic + symptoms (high CNS risk).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGING — TNM AJCC; PD-L1 NOT relevant for HER2+ (immunotherapy minimal role).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CARDIAC assessment — ECHO (LVEF) baseline + periodic; trastuzumab + others cardiotoxic.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Genetic counseling — selected patients; less BRCA association than TNBC.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("HER2 status confirmed — IHC + FISH if needed; HR status; molecular profile.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Stage + extent of disease.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Cardiac baseline — LVEF essential.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Brain MRI in advanced + symptomatic.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary care + fertility preservation in younger patients.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("NEOADJUVANT (Stage II-III) — TCHP (docetaxel + carboplatin + trastuzumab + pertuzumab) × 6 cycles → surgery → adjuvant trastuzumab + pertuzumab × 1 year; if residual disease after neoadjuvant → T-DM1 (trastuzumab emtansine) × 14 cycles (KATHERINE trial) per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ADJUVANT for Stage I — trastuzumab × 1 year + paclitaxel × 12 weekly (APT trial) OR trastuzumab + chemo for higher risk.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("TRIPLE POSITIVE (HR+ HER2+) — same chemo + HER2 + endocrine therapy (tamoxifen OR aromatase inhibitor based on menopause); 5-10 years.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("METASTATIC HER2+ FIRST-LINE — TRASTUZUMAB + PERTUZUMAB + TAXANE (CLEOPATRA trial — significant survival benefit); HR+ — add endocrine therapy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SECOND-LINE METASTATIC — TRASTUZUMAB DERUXTECAN (Enhertu) preferred (DESTINY-Breast03 trial — superior to T-DM1); T-DM1 alternative.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("THIRD-LINE + LATER — TUCATINIB + trastuzumab + capecitabine (HER2CLIMB — especially brain mets); margetuximab; neratinib + capecitabine; lapatinib combinations; trastuzumab + chemo alternative.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRAIN METASTASES — TUCATINIB + trastuzumab + capecitabine BRAIN-PENETRANT (HER2CLIMB) particularly effective; SRS + WBRT; trastuzumab deruxtecan brain activity emerging.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SURGERY + RADIATION — same as other subtypes (BCS or mastectomy + lymph node management + radiation).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ENDOCRINE THERAPY for HR+ HER2+ — concurrent with HER2 therapy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CARDIAC MONITORING — ECHO baseline + q3 months during trastuzumab; hold + cardiology for EF decline >10% OR <50%; cardiotoxicity often reversible.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Comprehensive cancer center care + supportive + palliative.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("CARDIOTOXICITY — major concern with HER2 therapy (especially trastuzumab); ECHO q3 months during therapy; usually reversible; cardiology + dose modification + holding.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRAIN METASTASES — high incidence; brain MRI for symptoms; targeted brain-penetrant therapy (tucatinib + trastuzumab deruxtecan).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("INFUSION REACTIONS — first dose typically; premedication for subsequent if reactions.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ADC-SPECIFIC TOXICITIES — trastuzumab deruxtecan ILD/pneumonitis; T-DM1 thrombocytopenia + LFT elevation; counsel + monitor.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ENDOCRINE THERAPY adherence + side effects (HR+ subset).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LONG-TERM RECURRENCE risk — better than TNBC, similar to HR+; CNS recurrence particular concern.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSYCHOSOCIAL — body image, sexuality, depression, anxiety; integrated mental health + sexual health.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("FERTILITY + young patients — pre-treatment fertility preservation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ONCOLOGIC EMERGENCIES — brain metastasis + spinal cord compression + bone fractures.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("EVOLVING landscape — new ADCs + immunotherapy combinations in HER2+ ongoing.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BIOSIMILARS — trastuzumab biosimilars (e.g., trazimera, ogivri, herzuma, kanjinti) available + interchangeable.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CRPCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "castration-resistant-prostate-cancer",
        title: "Castration-resistant prostate cancer (CRPC)",
        subtitle: "Progressive disease despite castrate testosterone <50 ng/dL · abiraterone + enzalutamide + apalutamide + darolutamide + chemotherapy (docetaxel/cabazitaxel) + radium-223 + lutetium-177-PSMA",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "Prostate cancer that progresses (rising PSA OR new metastases OR symptoms) despite CASTRATE LEVEL TESTOSTERONE (<50 ng/dL) from ADT (LHRH agonist, surgical castration, OR GnRH antagonist). Two main types — METASTATIC (mCRPC) + NON-METASTATIC (nmCRPC — PSA rising without imaging evidence of metastases). Modern era — multiple effective therapies: androgen receptor pathway inhibitors (abiraterone, enzalutamide, apalutamide, darolutamide), CHEMOTHERAPY (docetaxel, cabazitaxel), RADIOPHARMACEUTICALS (radium-223 for bone-only, lutetium-177-PSMA for PSMA+), PARP inhibitors (olaparib for BRCA), immunotherapy (sipuleucel-T, pembrolizumab for MSI-high) per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Despite castrate testosterone, prostate cancer cells develop mechanisms to survive + proliferate — adrenal/intratumoral androgen synthesis (CYP17 active), AR amplification + mutations (AR variants), constitutive AR activation + cofactors, alternative growth signals. Disease becomes lethal usually within years of CRPC; modern therapies have significantly extended survival.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("Rising PSA despite ADT — most common CRPC indicator; PSA doubling time helps risk-stratify.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("BONE METASTASES — most common (~85-90%); BLASTIC (vs lytic in many cancers); bone pain, pathologic fractures, spinal cord compression risk.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("NODAL + visceral metastases — pelvic + retroperitoneal + lung + liver + brain (rare); CT/MRI staging.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Systemic — fatigue, weight loss, anemia (bone marrow involvement), bleeding from coagulopathy + DIC (in advanced).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Urinary symptoms — obstruction from primary, recurrent UTIs.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Cord compression — bone metastasis to spine; sensory level + motor deficits + bowel/bladder; ONCOLOGIC EMERGENCY.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — high-grade Gleason at diagnosis, advanced stage, BRCA1/2 + DNA repair mutations + Lynch syndrome (more aggressive variants); African American men higher rates; older age.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("RISING PSA × 3 consecutive measurements (1 week apart, ≥1 ng/mL) OR new metastasis OR progressive symptoms despite castrate testosterone (<50 ng/dL) per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMAGING — bone scan (Tc-99m MDP — blastic bone metastases), CT pelvis/abdomen + chest CT for visceral; PSMA PET-CT (Ga-68 or F-18) increasingly used + more sensitive than conventional.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSA + testosterone — establish castrate range; serial PSA trends.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Genomic testing — germline + somatic — BRCA1/2 + ATM + CHEK2 + other HRR genes (PARP eligibility); MSI/MMR (pembrolizumab); selected patients.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Bone scan staging — count metastases (>20 bony metastases = \"high-volume\" — affects treatment choice).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Biopsy of metastasis — sometimes for histology + molecular profile when clinical scenario unclear.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Differential — clinical signs of progression — confirm CRPC definitions before treatment changes.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Confirm CRPC — castrate testosterone + rising PSA OR new mets.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Stage + volume — metastatic (mCRPC) vs non-metastatic (nmCRPC); high vs low volume.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Genomic profile — BRCA + DNA repair + MSI/MMR.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Symptom burden — pain + functional status + comorbidities; quality of life.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Performance status + life expectancy; treatment intensity matched.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("NON-METASTATIC CRPC (nmCRPC) with HIGH risk (PSA doubling time <10 months) — ANDROGEN RECEPTOR INHIBITOR — APALUTAMIDE, ENZALUTAMIDE, OR DAROLUTAMIDE (with continued ADT); delays metastasis + improves survival per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("METASTATIC CRPC (mCRPC) FIRST-LINE — many options: ABIRATERONE + prednisone, ENZALUTAMIDE, APALUTAMIDE (with continued ADT); DOCETAXEL chemotherapy (especially high-volume); PARP INHIBITOR (olaparib, talazoparib) for BRCA-mutated; RADIUM-223 for bone-only mCRPC + osteoporotic; cancer-specific selection.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SECOND-LINE mCRPC — switch class of androgen receptor inhibitor; DOCETAXEL chemotherapy; CABAZITAXEL second-line chemotherapy; OLAPARIB/TALAZOPARIB for BRCA+ + HRR mutations; LUTETIUM-177-PSMA-617 (Pluvicto) for PSMA-expressing post-chemotherapy + post-ARSi (VISION trial); PEMBROLIZUMAB for MSI-high.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CONTINUOUS ADT — LHRH agonist OR antagonist OR surgical castration; maintain castrate testosterone throughout treatment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BONE-DIRECTED THERAPY — bone metastases + ADT-related bone loss; ZOLEDRONIC ACID (4 mg IV q3-4 weeks) OR DENOSUMAB (120 mg SC q4 weeks) — reduces skeletal-related events; ONJ + atypical femur fracture risks; pre-treatment dental + calcium + vitamin D.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION — palliative for bone pain + spinal cord compression + symptomatic metastases.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIOPHARMACEUTICALS — RADIUM-223 (Xofigo) for bone-only mCRPC, alpha emitter selective for bone; LUTETIUM-177-PSMA-617 (Pluvicto) for PSMA-expressing CRPC (theranostic — PSMA PET-CT confirms target).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PAIN management — opioids + adjuvants + radiation + integrative approaches; palliative care.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary care — urology + medical oncology + radiation oncology + palliative care + pain management + supportive care.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("SPINAL CORD COMPRESSION — bone metastasis emergency; back pain + neuro deficits + bowel/bladder dysfunction; emergent MRI + corticosteroids + radiation OR surgery + bisphosphonate.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ONCOLOGIC EMERGENCIES — pathologic fracture, hypercalcemia of malignancy, urinary obstruction (from primary or pelvic mass), DIC.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ADT side effects — hot flashes, sexual dysfunction, fatigue, mood changes, weight gain, bone density loss, metabolic syndrome, anemia, cognitive changes; chronic + lifelong; quality of life.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ANDROGEN RECEPTOR INHIBITOR side effects — fatigue + hot flashes + falls + fractures (apalutamide + enzalutamide higher); seizure with enzalutamide; rash with apalutamide; counsel + monitor.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ABIRATERONE side effects — mineralocorticoid excess (HTN + hypokalemia + edema) + hepatotoxicity; prednisone REQUIRED; counsel adherence.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CHEMOTHERAPY side effects — docetaxel (cytopenias, neuropathy, fluid retention, edema, alopecia, mucositis); cabazitaxel similar.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PARP INHIBITOR side effects — anemia + cytopenias + MDS/AML rare; monitor.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIUM-223 side effects — myelosuppression + GI symptoms; selective for bone.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LUTETIUM-177-PSMA side effects — fatigue + nausea + xerostomia + myelosuppression + AKI; theranostic approach.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BONE-DIRECTED therapy side effects — ONJ + atypical femur fracture + hypocalcemia; pre-treatment dental + calcium + vitamin D + monitoring.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSYCHOSOCIAL impact — depression + body image + sexual + family; counseling.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PALLIATIVE care + advance directives — integrated early.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GENETIC counseling — BRCA + HRR mutations + family cascade testing.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MCRCSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "metastatic-colorectal-cancer",
        title: "Metastatic colorectal cancer (mCRC)",
        subtitle: "Stage IV CRC · FOLFOX/FOLFIRI + bevacizumab/cetuximab/panitumumab · molecular testing (KRAS/NRAS/BRAF/MSI/HER2) · resectable liver mets curative · sequential lines",
        nclexTags: cancerTagR33,
        definition: AttributedProse(
            "Stage IV colorectal cancer — distant metastases (liver most common, lung, peritoneum, distant lymph nodes, bone, brain rare). MOLECULAR-DRIVEN treatment — KRAS/NRAS/BRAF mutations exclude anti-EGFR (cetuximab/panitumumab); BRAF V600E targeted (encorafenib + cetuximab + binimetinib); MSI-HIGH/MMR-DEFICIENT — IMMUNOTHERAPY (pembrolizumab); HER2-amplified — trastuzumab combinations. FOLFOX/FOLFIRI/CAPOX/IROX backbone chemotherapy + biologic therapy. Liver-limited metastases potentially curable with resection + perioperative chemotherapy per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Colorectal adenocarcinoma → distant spread via hematogenous (mostly LIVER via portal vein), lymphatic, peritoneal seeding. Molecular drivers — APC + KRAS + TP53 + SMAD4 progression; molecular subtypes — chromosomal instability (CIN — most), microsatellite instability (MSI — ~15%, hereditary Lynch), CpG island methylator phenotype (CIMP), BRAF V600E mutated.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("Symptomatic from primary — change in bowel habits, rectal bleeding, abdominal pain, weight loss, fatigue; sometimes presenting as obstruction or perforation.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Metastatic symptoms — RUQ pain + hepatomegaly (liver), pulmonary symptoms, ascites + peritoneal carcinomatosis, bone pain (less common), neuro deficits (brain — rare).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("LIVER METASTASES — most common; sometimes resectable + curable.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("PERITONEAL CARCINOMATOSIS — ascites + intestinal obstruction; HIPEC (hyperthermic intraperitoneal chemotherapy) selected centers.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Tumor markers — CEA + CA 19-9 trending; not diagnostic but useful for response + recurrence.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — age, family history (Lynch syndrome — MMR deficient, FAP, MUTYH-associated polyposis), Crohn's/UC, lifestyle (red meat, alcohol, smoking, obesity, sedentary), African American, prior CRC, type 2 DM.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DIAGNOSIS — colonoscopy + biopsy + staging CT chest/abdomen/pelvis + MRI pelvis for rectal cancer per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MOLECULAR TESTING — KRAS + NRAS + BRAF mutations (RAS/RAF testing essential for anti-EGFR selection); MSI/MMR (immunotherapy + Lynch screening); HER2 amplification (trastuzumab combinations); ctDNA + NGS emerging.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LYNCH SYNDROME workup — for MSI-high tumors + family history + age <50; universal MMR/MSI screening recommended in colorectal cancer.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STAGING — CT chest/abdomen/pelvis with contrast + MRI pelvis (rectal cancer) + PET-CT in selected; brain MRI rarely.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LIVER RESECTABILITY assessment — multidisciplinary (medical oncology + hepatobiliary surgery + interventional radiology); CT/MRI characterization; future liver remnant adequacy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("TUMOR MARKERS — CEA baseline + serial; CA 19-9 in some.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Genetic counseling — Lynch syndrome MMR-deficient tumors + family history + young age.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Differential — different primary cancers (rare), benign liver masses (correlation with primary).", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Molecular profile — RAS, BRAF, MSI/MMR, HER2 — essential for treatment selection.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Resectability — liver-limited mets potentially curative; multidisciplinary assessment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Performance status + comorbidities + life expectancy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Lynch syndrome assessment + family genetic counseling.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary tumor board.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("RESECTABLE LIVER METASTASES — POTENTIALLY CURATIVE — perioperative FOLFOX or FOLFIRI (6 cycles before + 6 after) + LIVER RESECTION + concurrent primary tumor management; 5-year survival 30-50% per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("METASTATIC FIRST-LINE (unresectable) — FOLFOX OR FOLFIRI + BEVACIZUMAB (anti-VEGF, mostly RIGHT-sided + RAS-mutated) OR + CETUXIMAB/PANITUMUMAB (anti-EGFR, ONLY for LEFT-sided + RAS/RAF wild-type tumors); ENCORAFENIB + CETUXIMAB + binimetinib for BRAF V600E (encorafenib first-line + 2nd-line options).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MSI-HIGH/MMR-DEFICIENT — PEMBROLIZUMAB monotherapy first-line (KEYNOTE-177 trial); nivolumab + ipilimumab combination alternative; transformative for this 5% subset.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HER2-AMPLIFIED — trastuzumab + tucatinib OR trastuzumab + pertuzumab; HER2-targeted therapy emerging.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SECOND-LINE — switch chemo backbone (FOLFOX → FOLFIRI or vice versa); regorafenib (REGORAFENIB monotherapy or with combinations); TAS-102 (trifluridine/tipiracil); fruquintinib (FRUZAQLA — newer VEGFR inhibitor); BRAF + cetuximab for BRAF V600E; PD-1 if not yet exposed.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("THIRD-LINE + beyond — sequential approach; clinical trials encouraged.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HIPEC + cytoreductive surgery — for peritoneal carcinomatosis (limited disease, selected centers).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LOCO-REGIONAL therapies — radiofrequency ablation, microwave ablation, transarterial chemoembolization (TACE), Y-90 radioembolization for liver mets.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RADIATION — palliative for symptomatic mets; rectal cancer initial management.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — medical oncology + hepatobiliary/colorectal surgery + interventional radiology + radiation oncology + GI + palliative.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("BOWEL OBSTRUCTION — peritoneal carcinomatosis or local tumor; NG decompression + supportive + sometimes surgery + diverting ostomy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LIVER FAILURE — extensive liver involvement; hepatorenal syndrome + variceal bleeding (portal HTN); supportive + sometimes urgent treatment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("VENOUS THROMBOEMBOLISM (VTE) — high risk in mCRC; prophylactic anticoagulation in active disease + bevacizumab; bleeding risk balanced.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CHEMOTHERAPY TOXICITIES — oxaliplatin neuropathy (acute + chronic), 5-FU (mucositis + cardiotoxicity + DPYD-deficient), irinotecan diarrhea + UGT1A1 polymorphisms, capecitabine hand-foot syndrome.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BEVACIZUMAB toxicities — HTN + proteinuria + bleeding + GI perforation + impaired wound healing + arterial thromboembolism + osteonecrosis of jaw rare; surgical timing important.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CETUXIMAB/PANITUMUMAB toxicities — acneiform rash (correlates with response), hypomagnesemia + infusion reactions.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMMUNOTHERAPY irAEs — full organ system surveillance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LYNCH SYNDROME — universal MSI/MMR screening; family genetic counseling + cascade testing; surveillance for endometrial + GI + GU + brain cancers.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PALLIATIVE care — integrated early; pain + GI symptoms + ascites + obstruction management.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Surveillance — CT q3-6 months + CEA + clinical assessment; sometimes ctDNA for occult disease.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Survivorship — long-term issues + screening + cardiovascular health + bowel function.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IRColitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ir-colitis-immunotherapy",
        title: "Immune-related colitis (ir-colitis)",
        subtitle: "Checkpoint inhibitor irAE · diarrhea + abdominal pain + bloody stool · grade severity · HOLD ICI + STEROIDS (prednisone 1-2 mg/kg) + infliximab/vedolizumab refractory",
        nclexTags: irAETagR33,
        definition: AttributedProse(
            "Inflammatory colitis caused by immune checkpoint inhibitor (ICI) therapy — pembrolizumab, nivolumab, atezolizumab, durvalumab, cemiplimab, ipilimumab (highest rate), or combination therapy. More common with anti-CTLA-4 (ipilimumab) than anti-PD-1. Variable severity from mild diarrhea to severe colitis with perforation. CTCAE grading. Treatment — HOLD ICI + STEROIDS (Grade 2+) + INFLIXIMAB/VEDOLIZUMAB for steroid-refractory + supportive care + possible permanent discontinuation per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Removal of immune brakes (CTLA-4, PD-1, PD-L1) by checkpoint inhibitor → autoreactive T-cell activation against colonic mucosa → mucosal inflammation + ulceration + diarrhea. Genetic predisposition + commensal microbiota interactions; CTLA-4 blockade causes more diffuse + severe disease vs PD-1.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("DIARRHEA — most common; non-bloody to bloody; watery to severe; days to weeks after ICI start; can occur weeks-months later.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("ABDOMINAL PAIN — cramping, sometimes severe.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("FEVER + tenesmus + urgency + mucus + bloody stools (Grade 3-4).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Dehydration + electrolyte imbalance from severe diarrhea; AKI possible.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Grade severity — Grade 1 (<4 stools/day above baseline), Grade 2 (4-6 stools/day + functional impact), Grade 3 (≥7 stools/day + hospitalization), Grade 4 (life-threatening + perforation + sepsis).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Time course — anti-CTLA-4 typically 4-8 weeks; anti-PD-1 typically 6-12 weeks; combination higher + earlier.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — ipilimumab + combination ICI (highest); high cumulative dose; baseline GI conditions (IBD, microscopic colitis), tobacco use; younger age; HLA-DRB1*0301; female sex (slight).", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — new-onset diarrhea after ICI; CTCAE grading; rule out other causes per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STOOL studies — C. difficile testing (rule out + treat if present — DON'T treat as ir-colitis), bacterial culture, ova/parasites, viral PCR (CMV particularly in immunocompromised post-treatment), inflammatory markers (calprotectin, lactoferrin).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LABS — CBC, electrolytes, BUN/Cr, LFTs, CRP, lactoferrin, calprotectin, lactate (severe).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CT abdomen/pelvis — for Grade 2+ — mural thickening + pericolonic stranding + complications (perforation, abscess, megacolon, ileus).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("COLONOSCOPY with biopsy — for Grade 2+ + diagnostic uncertainty + steroid-refractory; characteristic findings (erythema, friability, ulcers, exudates) + histology (cryptitis, crypt abscess, mucosal inflammation).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("FECAL CALPROTECTIN + LACTOFERRIN — elevated in inflammatory colitis; differentiate from infectious or non-inflammatory.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging for SEVERE — CT for perforation + abscess + obstruction + megacolon; emergent surgical evaluation if peritoneal signs.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity grading + hydration + electrolytes.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Rule out C. difficile + other infectious causes BEFORE attributing to ir-colitis.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + GI + surgery for severe.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging for severe + perforation concerns.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Patient education + emergency action plan.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("GRADE 1 — supportive care; loperamide PRN; hydration + electrolytes; clear liquids; continue ICI; emergent reassessment if worsens per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 2 — HOLD ICI; PREDNISONE 1-2 mg/kg/day PO; clear liquids → BRAT diet; reassess in 48-72 hours; if improving, taper steroids over 4-6 weeks + may rechallenge ICI when resolved (caution with combo ICI).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 3-4 — HOSPITALIZATION; HOLD ICI + IV STEROIDS (methylprednisolone 1-2 mg/kg/day OR dexamethasone equivalent); hydration + electrolytes; surgical evaluation if perforation; PERMANENT DISCONTINUATION typically for Grade 4.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STEROID-REFRACTORY (no improvement after 48-72 hours of steroids OR worsening) — INFLIXIMAB (5 mg/kg IV — can repeat at 2 + 6 weeks) OR VEDOLIZUMAB (300 mg IV — anti-α4β7 integrin, gut-selective, less systemic immunosuppression); response within 1-2 days; steroid taper after response.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PERFORATION + bowel obstruction + megacolon — surgical evaluation + emergent intervention; high mortality.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ICI rechallenge — controversial; some Grade 2-3 patients can resume after resolution; PD-1 alone preferred over CTLA-4 if combo caused; counsel risk + benefits.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Steroid TAPERING — gradual over 4-8 weeks for Grade 2-3, longer for Grade 4; avoid abrupt + risk recurrence.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Infection prophylaxis during prolonged steroids — PCP prophylaxis (TMP-SMX) if expected >4 weeks of moderate-high dose steroids.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + GI + nutrition + critical care if severe + surgery if perforation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Avoid loperamide in suspected IBD-like presentation (may mask + worsen); use cautiously based on severity.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("PERFORATION — Grade 4 colitis emergency; pneumoperitoneum on imaging; emergent surgery + high mortality; rare but devastating.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("TOXIC MEGACOLON + ileus — supportive + NG decompression + emergent surgery if not improving.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STEROID-REFRACTORY — escalation to infliximab + vedolizumab + supportive; mortality risk.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("DEHYDRATION + ELECTROLYTE imbalance — aggressive hydration + correction; AKI possible.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("INFECTION — CMV colitis as superinfection; antiviral if confirmed; rule out C. difficile.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LONG-TERM steroid side effects — bone health + glucose + opportunistic infections (PCP); prophylaxis + monitoring.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ICI RESPONSE may continue despite need for immunosuppression — discuss with patient + family.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MICROSCOPIC COLITIS — sometimes seen with ICI; less severe; tailored management.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Quality of life impact — significant; supportive care + adjustments.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IRPneumonitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ir-pneumonitis-immunotherapy",
        title: "Immune-related pneumonitis (ir-pneumonitis)",
        subtitle: "ICI lung inflammation · cough + dyspnea + hypoxia · chest CT ground-glass + consolidation patterns · HOLD ICI + STEROIDS (prednisone 1-2 mg/kg) · CAN BE FATAL · mortality 10-15%",
        nclexTags: irAETagR33,
        definition: AttributedProse(
            "Inflammatory lung disease caused by immune checkpoint inhibitor therapy — ranges from asymptomatic radiographic findings to fulminant respiratory failure. ANTI-PD-1 (pembrolizumab + nivolumab) > ANTI-CTLA-4 (ipilimumab) > anti-PD-L1; COMBINATION therapy highest risk + earliest onset. CTCAE grading. Treatment — HOLD ICI + STEROIDS (Grade 2+) + ADDITIONAL IMMUNOSUPPRESSION for steroid-refractory; MORTALITY 10-15% from Grade 3-4 disease per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Removal of immune brakes by ICI → autoreactive T-cell activation in lung tissue → pneumonitis with various histopathologic patterns — organizing pneumonia (OP) most common, ground-glass opacities, hypersensitivity pneumonitis-like, ARDS-like in severe; bronchoalveolar lavage shows lymphocytic predominance.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("COUGH — typically non-productive; may be new or worsening from baseline.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("DYSPNEA — exertional progressing to rest; insidious onset usually but can be sudden in severe.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("HYPOXIA — desaturation on pulse oximetry; supplemental oxygen requirements.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("FEVER — variable; sometimes prominent.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("FATIGUE + decreased exercise tolerance.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("RESPIRATORY FAILURE — Grade 4 — requires mechanical ventilation; ICU; high mortality.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Time course — variable; typically weeks-months after ICI start; can occur after discontinuation; combination therapy earlier (median 5-7 weeks).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — combination ICI > monotherapy; PD-1 + PD-L1 slightly higher than CTLA-4 alone; underlying lung disease (COPD, fibrosis, prior radiation), smoking history, prior thoracic radiation, NSCLC patients (highest in lung cancer indication).", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — new respiratory symptoms (cough, dyspnea, hypoxia) + radiographic abnormalities + ICI exposure + exclusion of other causes per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CHEST IMAGING — chest CT high-resolution (HRCT); patterns include — organizing pneumonia (peripheral or peribronchovascular consolidation), ground-glass opacities, hypersensitivity pneumonitis (centrilobular nodules + mosaic attenuation), interstitial fibrosis, ARDS-like; sometimes pleural effusions.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PFTs — restrictive pattern with decreased DLCO; functional assessment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BRONCHOSCOPY + BAL — for diagnostic uncertainty + steroid-refractory; lymphocytic alveolitis supportive; rule out infection (bacterial, viral, fungal, PCP).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Rule out — infection (sputum cultures, viral PCR, bronchoscopy), pulmonary embolism, CHF, radiation pneumonitis, malignancy progression (tumor pseudo-progression), drug toxicity from chemotherapy.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LABS — CBC, CRP, LDH, troponin (rule out cardiac), procalcitonin (bacterial pneumonia), beta-D-glucan (PCP), galactomannan (aspergillus), BNP (CHF).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADING — Grade 1 asymptomatic radiographic + Grade 2 symptomatic + Grade 3 severe symptoms with hospitalization + Grade 4 life-threatening + respiratory failure.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity grading + oxygen requirement + clinical status.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Rule out other causes — infection particularly important; broad workup.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + pulmonology + ID + critical care for severe.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging for diagnosis + monitoring.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Patient education + emergency action plan.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("GRADE 1 (asymptomatic) — continue ICI with close monitoring; repeat imaging in 4-12 weeks; symptom education; some experts hold ICI in higher-risk patients per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 2 (symptomatic + functional impact) — HOLD ICI + PREDNISONE 1-2 mg/kg/day PO; reassess in 48-72 hours; supplemental oxygen as needed; resolve over weeks; gradual steroid taper over 4-6 weeks.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 3 (severe symptoms + hospitalization) — HOLD ICI + IV STEROIDS (methylprednisolone 1-2 mg/kg/day OR dexamethasone equivalent); supplemental oxygen + non-invasive ventilation OR intubation if respiratory failure; consider ICU; PERMANENT DISCONTINUATION often.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 4 (life-threatening + respiratory failure) — HOLD ICI permanently; HIGH-DOSE IV STEROIDS (methylprednisolone 1 g IV × 3 days OR equivalent then 1-2 mg/kg/day taper); ICU + mechanical ventilation + ECMO if needed; additional immunosuppression for refractory cases.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STEROID-REFRACTORY (no improvement in 48-72 hours) — INFLIXIMAB 5 mg/kg IV (anti-TNF) OR IVIG 2 g/kg OR MYCOPHENOLATE 500 mg-1 g PO BID + cyclophosphamide for severe.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("INFECTION PROPHYLAXIS — PCP prophylaxis (TMP-SMX) for prolonged steroid use >4 weeks; PPI for gastric protection; calcium + vitamin D for bone density.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Pulmonary support — supplemental oxygen, NIV (BiPAP/CPAP), mechanical ventilation, prone positioning, ECMO for refractory; lung-protective ventilation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Steroid TAPERING — gradual over 4-8 weeks for Grade 2-3, longer for Grade 4; avoid abrupt + risk recurrence.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ICI RECHALLENGE — Grade 1-2 resolved patients may resume; Grade 3+ usually permanent discontinuation; counsel risk + benefits + alternative therapies.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + pulmonology + ID + critical care + ECMO team + nutrition + PT/OT.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY — 10-15% from Grade 3-4 ir-pneumonitis; early recognition + treatment critical.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RAPID PROGRESSION — Grade 1 can progress to Grade 4 within days; vigilant monitoring.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("INFECTION as alternative or coexisting — concurrent PCP + viral + bacterial; broad evaluation + treatment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PULMONARY FIBROSIS — long-term sequelae; some patients have chronic respiratory limitations; pulmonary rehabilitation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STEROID side effects — bone, glucose, infection, mood; chronic use management.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ICU complications — VAP + critical illness myopathy + delirium + thromboembolism.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ECMO — severe refractory cases; bridge to recovery or transplant rarely.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSYCHOSOCIAL impact — anxiety, depression, fear of recurrence; counseling.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("QUALITY OF LIFE — significant impact during + after; rehabilitation + supportive care.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Underlying lung disease impacts severity + recovery; comprehensive pulmonary assessment.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IRHepatitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ir-hepatitis-immunotherapy",
        title: "Immune-related hepatitis (ir-hepatitis)",
        subtitle: "Hepatocellular vs cholestatic injury · LFT elevation + jaundice · HOLD ICI + STEROIDS (prednisone 1-2 mg/kg) + MYCOPHENOLATE refractory · Hy's law cases · mortality 1-3%",
        nclexTags: irAETagR33,
        definition: AttributedProse(
            "Hepatic inflammation caused by immune checkpoint inhibitor therapy — characterized by hepatocellular (ALT/AST predominant) or cholestatic (alkaline phosphatase/bilirubin predominant) injury. ANTI-CTLA-4 + COMBINATION higher risk than anti-PD-1 alone. CTCAE grading by LFT elevations. Treatment — HOLD ICI + STEROIDS (Grade 2+) + ADDITIONAL IMMUNOSUPPRESSION (mycophenolate, azathioprine) for steroid-refractory; consider biopsy in atypical or refractory; mortality 1-3% from severe per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Autoreactive T-cell activation against hepatocytes + biliary epithelium → inflammatory infiltrates (predominantly CD4+ + CD8+ T cells); histopathology variable — panlobular hepatitis, periportal hepatitis, granulomatous hepatitis, cholangitis-like; differs from autoimmune hepatitis + viral hepatitis patterns.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("ASYMPTOMATIC LFT elevation — most common presentation; routine monitoring detects.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Fatigue, nausea, decreased appetite — non-specific symptoms.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("JAUNDICE — yellow eyes/skin, dark urine, pale stools — bilirubin elevation in significant injury.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Right upper quadrant pain, abdominal discomfort.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("PRURITUS — itching from cholestatic pattern.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Time course — typically 4-12 weeks after ICI initiation; combination therapy earlier; can occur after discontinuation.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — combination CTLA-4 + PD-1 (highest), CTLA-4 alone, prior liver disease (NAFLD, HBV, HCV), elevated baseline LFTs, female sex, certain HLA genotypes.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CTCAE GRADING — Grade 1 (ALT/AST 1-3× ULN OR bilirubin 1-1.5× ULN); Grade 2 (3-5× ULN OR bili 1.5-3× ULN); Grade 3 (5-20× ULN OR bili 3-10× ULN); Grade 4 (>20× ULN OR bili >10× ULN OR hepatic decompensation) per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LABS — comprehensive LFT panel + INR (synthetic function) + autoimmune workup (ANA + ASMA + LKM-1 + AMA) + viral hepatitis serologies (HBsAg, anti-HCV, anti-HAV IgM) + iron studies + ceruloplasmin + alpha-1 antitrypsin + ammonia (encephalopathy).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("IMAGING — abdominal ultrasound + CT/MRI for biliary tract evaluation + parenchymal disease; rule out malignant progression (liver metastases).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LIVER BIOPSY — for diagnostic uncertainty, atypical features, severe + steroid-refractory; characteristic patterns + rule out alternative diagnoses.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Hy's LAW criteria — ALT/AST >3× ULN + total bilirubin >2× ULN without obstruction or alternative explanation — indicates serious hepatocellular injury; emergent workup + intervention.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Differential — viral hepatitis, autoimmune hepatitis, drug-induced (chemotherapy, antibiotics, supplements, alcohol), gallstones, malignant biliary obstruction, malignant progression in liver, vascular causes (Budd-Chiari).", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity grading + synthetic function assessment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Rule out other causes — comprehensive workup before attributing to ir-hepatitis.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + GI/hepatology + transplant if severe.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging + biopsy in uncertain/severe cases.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Patient education + medication adherence + emergency contact.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("GRADE 1 (asymptomatic) — continue ICI + close LFT monitoring; recheck in 1 week; if persistent or rising → escalate per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 2 — HOLD ICI + PREDNISONE 1 mg/kg/day PO; if hepatitis worsens after 3 days → IV steroids; reassess in 48-72 hours; resolve over weeks; gradual steroid taper over 4-6 weeks.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 3 — HOLD ICI + IV STEROIDS (methylprednisolone 1-2 mg/kg/day); hospitalization for severe; rapid response 48-72 hours; PERMANENT DISCONTINUATION typically + slow steroid taper.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("GRADE 4 — HOSPITALIZATION; HIGH-DOSE IV STEROIDS (methylprednisolone 1-2 mg/kg/day); ICU if hepatic encephalopathy or coagulopathy; PERMANENT DISCONTINUATION; consider liver transplant evaluation for fulminant; high mortality without intervention.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STEROID-REFRACTORY (no improvement in 72 hours OR worsening) — MYCOPHENOLATE 500 mg-1 g PO BID; AZATHIOPRINE 1-2 mg/kg/day; alternative — TACROLIMUS, ATG, plasmapheresis for severe.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("INFLIXIMAB AVOIDED — hepatotoxicity concern (different from ir-colitis where infliximab effective).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("URSODEOXYCHOLIC ACID (UDCA) — for cholestatic pattern + pruritus; protective.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BIOPSY — sometimes needed for atypical or refractory; differentiate from autoimmune + viral + drug-induced.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STEROID TAPERING — gradual over 6-12 weeks for Grade 2-3, longer for Grade 4; avoid abrupt + risk recurrence.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ICI RECHALLENGE — Grade 1-2 resolved patients may resume; Grade 3+ usually permanent discontinuation; counsel risks; consider alternative therapies.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Infection prophylaxis — PCP (TMP-SMX) for prolonged steroids >4 weeks; bone protection.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + GI/hepatology + ID + transplant for fulminant.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("HY'S LAW + fulminant hepatic failure — risk of acute liver failure; mortality without intervention; emergent management + transplant evaluation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("STEROID-REFRACTORY — escalation needed; mortality risk if delayed.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CHRONIC LIVER DAMAGE + cirrhosis — long-term sequelae in severe + delayed-treatment cases; ongoing hepatology.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("DIFFERENTIATION from autoimmune hepatitis — clinical features + autoantibodies + biopsy + treatment response.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HEPATITIS B reactivation — in patients with prior HBV; emergent antiviral; consult hepatology.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("COEXISTING liver pathology — alcohol, NAFLD, viral; complicates picture; comprehensive evaluation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("INFECTIONS during steroid treatment — opportunistic; vigilance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MULTIPLE irAEs — concurrent ir-hepatitis + ir-colitis + ir-pneumonitis sometimes; complex management.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Long-term LFTs surveillance after recovery + ICI discontinuation; some patients have persistent elevations.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IRThyroiditisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ir-thyroiditis-immunotherapy",
        title: "Immune-related thyroiditis (ir-thyroiditis)",
        subtitle: "Most common endocrine irAE · transient HYPERTHYROIDISM → HYPOTHYROIDISM · USUALLY PERMANENT hypothyroidism · levothyroxine replacement · monitor TSH q cycle",
        nclexTags: irAETagR33,
        definition: AttributedProse(
            "Immune-mediated thyroid dysfunction from checkpoint inhibitor therapy — most common endocrine irAE. Typically biphasic — initial transient HYPERTHYROIDISM (thyroid hormone release from destruction, 2-6 weeks) → progressing to HYPOTHYROIDISM (usually 4-8 weeks after) which is OFTEN PERMANENT. ANTI-PD-1 + ANTI-PD-L1 + combination higher than anti-CTLA-4 alone. Treatment — beta-blocker for symptomatic hyperthyroid phase, LEVOTHYROXINE REPLACEMENT (lifelong typically) for hypothyroid; CONTINUE ICI (different from most other irAEs) per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Autoreactive T-cell + antibody-mediated thyroid gland destruction → initial release of stored thyroid hormone (transient hyperthyroidism, similar to subacute thyroiditis) → gland destruction → permanent hypothyroidism. Anti-thyroglobulin + anti-TPO antibodies often elevated; distinct from Graves disease (TSH receptor antibody-mediated hyperthyroidism with sustained hormone production).",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("HYPERTHYROID PHASE (transient, 2-6 weeks) — palpitations, tremor, heat intolerance, weight loss, anxiety, fatigue (sometimes), tachycardia, hyperreflexia; usually subclinical or mild symptoms; differentiate from Graves (no exophthalmos, no ophthalmopathy, lower hormone levels).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("HYPOTHYROID PHASE (4-8+ weeks after) — fatigue, cold intolerance, constipation, weight gain, dry skin, hair loss, depression, bradycardia, hyporeflexia; can be more pronounced; chronic.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Many patients have INITIAL hypothyroidism without preceding hyperthyroidism (direct destruction); some only transient hyperthyroidism without subsequent hypothyroidism.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("TIMING — typically 4-12 weeks after ICI initiation; sometimes earlier with combination therapy.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — combination ICI > monotherapy; anti-PD-1/PD-L1 > anti-CTLA-4 (different from most other irAEs); prior thyroid disease + autoimmune thyroid antibodies + female sex.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BASELINE + CYCLIC monitoring — TSH + free T4 + free T3 at baseline + each cycle (every 2-3 weeks) per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HYPERTHYROID — low TSH + high free T4/T3; thyroid antibodies (anti-TPO, anti-TG, sometimes TRAb); thyroid uptake LOW (low RAIU) on radionuclide scan differentiates from Graves (high RAIU); ultrasound may show heterogeneous gland.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HYPOTHYROID — high TSH + low/normal free T4; positive anti-TPO + anti-TG antibodies; sometimes evolving from initial euthyroid → high TSH.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Symptom assessment + functional impact.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Differential — Graves disease (different mechanism, sustained hyperthyroidism), subclinical thyroid dysfunction, iodine-induced, drug-induced (amiodarone, lithium, interferon), pituitary insufficiency.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("Thyroid function panel — TSH, free T4, free T3; baseline + cyclic.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Symptom + functional assessment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + endocrinology coordination.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Continue ICI typically (different from other irAEs) — thyroiditis usually manageable.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Patient education + medication adherence.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("HYPERTHYROID PHASE — BETA-BLOCKER (propranolol 10-40 mg q6-8h, atenolol, metoprolol) for symptomatic; SHORT-COURSE STEROIDS (prednisone 0.5-1 mg/kg/day × 1-2 weeks then taper) for SEVERE thyrotoxicosis WITH systemic symptoms; usually NO ANTITHYROID DRUGS (PTU/methimazole) because destruction not overproduction; ICI continues per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HYPOTHYROID PHASE — LEVOTHYROXINE replacement (1.6 mcg/kg/day starting dose, lower in elderly + cardiac patients); titrate to TSH 0.5-4.5 mIU/L; recheck TSH 6-8 weeks after dose change; LIFELONG TYPICALLY; CONTINUE ICI per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MONITORING — TSH q6 weeks during dose titration → q3 months stable + at each ICI cycle.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MYXEDEMA COMA (rare) — severe hypothyroidism with altered mental status + hypothermia + bradycardia; emergent IV levothyroxine + hydrocortisone (rule out concurrent adrenal insufficiency).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HYPOPHYSITIS (secondary hypothyroidism) — distinct from primary thyroiditis; characterized by LOW TSH + low free T4 + low cortisol + low ACTH + low FSH/LH; suspect with associated symptoms (headache, vision changes); pituitary MRI; HORMONE REPLACEMENT (cortisol FIRST, then levothyroxine).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + endocrinology; long-term endocrine follow-up.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Counsel — most patients have permanent hypothyroidism; lifelong levothyroxine; monitoring; symptom awareness.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("PERMANENT HYPOTHYROIDISM — most patients; lifelong replacement; routine TSH monitoring.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HYPOPHYSITIS — secondary hypothyroidism from pituitary inflammation; particularly with anti-CTLA-4; suspect when secondary pattern (low TSH + low T4 + other pituitary hormones affected); EMERGENT cortisol replacement before levothyroxine (replace cortisol first to avoid adrenal crisis).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MYXEDEMA COMA — severe untreated/undertreated hypothyroidism; rare but devastating; emergent intervention.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("CARDIAC effects of hyperthyroidism — palpitations, atrial fibrillation, heart failure in elderly + cardiac disease.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("DEHYDRATION + fluid balance during severe phases.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("OPHTHALMOPATHY — rare; differentiate from Graves (typically not present in immune-related thyroiditis).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("COEXISTING irAEs — other endocrine + non-endocrine; multidisciplinary surveillance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("DIFFERENTIAL — Graves disease (different treatment), iodine + drug-induced, pituitary insufficiency.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PSYCHOSOCIAL — mood symptoms from thyroid changes; counseling.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Long-term monitoring + adjustment of levothyroxine dose; pregnancy increases requirement.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FebrileNeutropeniaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "febrile-neutropenia",
        title: "Febrile neutropenia",
        subtitle: "ONCOLOGIC EMERGENCY · ANC <500 + fever ≥38.3°C (single) OR ≥38.0°C (sustained 1h) · empiric broad-spectrum within 1 hour · MASCC risk stratification · mortality 5-15%",
        nclexTags: infectionOncTagR33,
        definition: AttributedProse(
            "Oncologic emergency defined as ANC <500/μL (OR <1000/μL projected to fall <500 within 48 hours) + fever ≥38.3°C (101°F) single measurement OR ≥38.0°C (100.4°F) sustained ≥1 hour. Caused by chemotherapy-induced bone marrow suppression. EMPIRIC broad-spectrum antibiotics within 1 hour of recognition (mortality increases with delay). MASCC score risk-stratifies; HIGH-RISK requires inpatient IV antibiotics; LOW-RISK selected outpatient oral. Mortality 5-15% per primary source.",
            citationIDs: ["specialty_dx_round33", "openrn_dx_round33"]
        ),
        pathophysiology: AttributedProse(
            "Chemotherapy or radiation suppresses bone marrow → neutropenia → impaired phagocytic + bacterial killing → loss of barrier function (mucositis, central lines, surgery) → bacterial translocation + bloodstream entry → sepsis. Typical nadir 7-14 days post-chemo. Common pathogens — gram-positive (CoNS, S. aureus, viridans group strep), gram-negative (E. coli, Klebsiella, Pseudomonas), Candida + Aspergillus in prolonged neutropenia.",
            citationIDs: ["specialty_dx_round33"]
        ),
        presentation: [
            AttributedBullet("FEVER — primary defining feature; may be only sign in immunocompromised (no other signs of inflammation).", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Chills, rigors, hypotension, tachycardia (SIRS criteria), altered mental status, septic shock.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("LOCAL SIGNS — variable + often blunted; mucositis, central line site, perirectal, sinus, lung, skin, urinary; vigilance + comprehensive exam.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("NO FEVER doesn't exclude — elderly + steroid-treated may be afebrile despite serious infection; clinical suspicion essential.", citationIDs: ["openrn_dx_round33"]),
            AttributedBullet("Risk factors — chemotherapy regimen (high vs low risk — AML induction, lymphoma, head/neck radiation), absolute neutrophil count (severity), duration of neutropenia, mucositis, central venous catheters, recent surgery, advanced age, comorbidities, prior infections, prophylactic antibiotic resistance.", citationIDs: ["specialty_dx_round33"])
        ],
        diagnosticCriteria: [
            AttributedBullet("DEFINITION — ANC <500/μL (OR <1000 projected to fall <500 in 48 hours) + FEVER ≥38.3°C (101°F) single measurement OR ≥38.0°C (100.4°F) sustained ≥1 hour per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MASCC RISK SCORE — points-based stratification — burden of disease (5 points if no/mild, 3 if moderate), no hypotension (5), no COPD (4), solid tumor or absence of fungal infection (4), no dehydration requiring IV (3), outpatient status (3), age <60 (2); ≥21 LOW RISK (potential outpatient); <21 HIGH RISK (inpatient).", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Comprehensive workup — CBC + diff, CMP, LFTs, lactate, lipase, ABG, blood cultures × 2 (peripheral + central line), urinalysis + culture, CXR, throat + skin + perineal exam, sinus CT if symptoms, sputum culture if cough, stool culture if diarrhea, lumbar puncture if CNS signs.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Beta-D-glucan + galactomannan — for invasive fungal infection screening in prolonged neutropenia.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Imaging — CXR all patients; CT chest if pulmonary symptoms or persistent fever (HRCT identifies fungal patterns); abdominal imaging for GI symptoms; sinus imaging.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Differential — bacterial sepsis (most common), viral infection, fungal (with prolonged neutropenia), drug fever, transfusion reaction, tumor fever, thromboembolism, line infection.", citationIDs: ["specialty_dx_round33"])
        ],
        priorityAssessments: [
            AttributedBullet("EMERGENT — recognize + treat within 1 hour; mortality increases with delay.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("MASCC risk stratification.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Identify source — comprehensive evaluation.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Hemodynamic assessment + sepsis bundle if shock features.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Multidisciplinary — oncology + ID + critical care for severe.", citationIDs: ["specialty_dx_round33"])
        ],
        commonInterventions: [
            AttributedBullet("HIGH-RISK (MASCC <21) — INPATIENT IV BROAD-SPECTRUM ANTIBIOTICS within 1 hour — antipseudomonal beta-lactam: CEFEPIME 2 g IV q8h OR PIPERACILLIN-TAZOBACTAM 4.5 g IV q6-8h OR MEROPENEM 1 g IV q8h; add VANCOMYCIN if mucositis + line infection + hemodynamic instability + skin/soft tissue + suspected MRSA per primary source.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LOW-RISK (MASCC ≥21) — selected outpatient ORAL antibiotic — CIPROFLOXACIN 750 mg PO BID + AMOXICILLIN-CLAVULANATE 875 mg PO BID; close monitoring + emergency contact + return if worsens; requires reliable patient + home support.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ADD ANTIFUNGAL — for persistent fever >4-7 days on appropriate antibacterial + prolonged neutropenia (~5+ days): empirical caspofungin or micafungin OR voriconazole OR isavuconazole (Aspergillus coverage); imaging guidance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ADD ANTIVIRAL — for HSV/VZV/CMV concern (mucositis, vesicles, encephalitis, retinitis); acyclovir + ganciclovir as indicated.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HEMODYNAMIC SUPPORT — fluid resuscitation, vasopressors (norepinephrine first-line) for septic shock; ICU as needed.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("G-CSF (filgrastim, pegfilgrastim) — secondary prophylaxis OR established febrile neutropenia in high-risk patients; not routinely used for treatment of established FN.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("Source control — remove infected central lines + drain abscesses + treat localized infections.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("De-escalation — narrow antibiotics based on cultures; continue until neutropenia resolves (ANC ≥500 + improving) + afebrile 24-48 hours.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("FUTURE CHEMOTHERAPY adjustment — dose reduction OR G-CSF prophylaxis for subsequent cycles if high-risk regimen.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PREVENTION — G-CSF primary prophylaxis for high-risk regimens (>20% FN risk), antibiotic prophylaxis (fluoroquinolone) for high-risk + prolonged neutropenia, antifungal prophylaxis (posaconazole, voriconazole) for high-risk hematologic, antiviral prophylaxis (acyclovir) for HSCT, vaccinations.", citationIDs: ["specialty_dx_round33"])
        ],
        watchFor: [
            AttributedBullet("MORTALITY — 5-15% overall; higher in elderly + comorbidities + severe sepsis + delayed treatment.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("SEPTIC SHOCK — emergent sepsis bundle; ICU; vasopressors; aggressive antibiotics.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("FUNGAL INFECTION — Aspergillus + Candida + Mucor in prolonged neutropenia + steroid + transplant patients; empiric antifungal for persistent fever; CT chest + biomarkers.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("BACTERIAL RESISTANCE — increasing MDR pathogens (ESBL, carbapenem-resistant, MRSA, VRE); local antibiogram + ID guidance.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("LINE INFECTIONS — central venous catheter is common source; consider removal for persistent fever + line infection + S. aureus + Candida.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("NEUTROPENIC ENTEROCOLITIS (typhlitis) — right lower quadrant pain + fever + neutropenia; conservative management + antibiotics; emergent surgery if complications.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("RECURRENT FN — dose modify chemo + G-CSF prophylaxis + antibiotic prophylaxis.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("HOSPITAL COSTS + length of stay — significant; outpatient management for low-risk reduces.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("PATIENT EDUCATION — recognize fever + emergent contact; thermometer at home; emergency numbers; precautions.", citationIDs: ["specialty_dx_round33"]),
            AttributedBullet("ANTIBIOTIC STEWARDSHIP — narrow antibiotics based on cultures + clinical improvement; avoid prolonged unnecessary therapy.", citationIDs: ["specialty_dx_round33"])
        ],
        citations: [openrnDxR33, cdcDxR33, specialtyDxR33],
        lastSourceFidelityReview: "2026-05-13"
    )
}
