import Foundation

// Curator-model diagnosis entries (round 27 — vasculitis + connective tissue + advanced neuro).

private let openrnDxR27 = CitationSource(
    id: "openrn_dx_round27",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR27 = CitationSource(
    id: "cdc_dx_round27",
    shortName: "CDC + ACR + AAN concept citations",
    publisher: "CDC · ACR · AAN",
    license: .publicDomain,
    url: "https://www.cdc.gov/nchs/fastats/",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR27 = CitationSource(
    id: "specialty_dx_round27",
    shortName: "ACR + EULAR + AAN + American College of Cardiology concept citations",
    publisher: "ACR · EULAR · AAN · ACC",
    license: .factCitationOnly,
    url: "https://www.rheumatology.org/Practice-Quality/Clinical-Support/Clinical-Practice-Guidelines",
    lastRetrieved: "2026-05-13"
)

private let vasculitisTagR27 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let connectiveTagR27 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .mobility)
private let neuroTagR27 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let oncoTagR27 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)

public enum GPASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "granulomatosis-polyangiitis",
        title: "Granulomatosis with polyangiitis (GPA / Wegener's)",
        subtitle: "Necrotizing vasculitis + granulomas · upper resp + lung + kidney · c-ANCA / PR3-ANCA · rituximab + steroids · RPGN risk",
        nclexTags: vasculitisTagR27,
        definition: AttributedProse(
            "ANCA-associated necrotizing granulomatous vasculitis of small + medium vessels — classically affects upper respiratory tract (sinusitis, nasal septum perforation, saddle-nose deformity), lungs (pulmonary nodules, hemorrhage, cavities), kidneys (rapidly progressive glomerulonephritis). Cyclic / rituximab + corticosteroids induction → maintenance immunosuppression. Untreated rapidly fatal; treated 5-year survival >80% per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "ANCA (PR3-ANCA = c-ANCA pattern most often) directed against proteinase 3 in neutrophil cytoplasm → activates neutrophils → endothelial damage + necrotizing inflammation + granuloma formation in small + medium vessels. Triad — upper respiratory + lower respiratory + kidney; can affect any organ.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("UPPER RESPIRATORY (~80%) — chronic sinusitis, epistaxis, oral ulcers, otitis media, SADDLE-NOSE DEFORMITY (cartilage destruction), nasal septum perforation, hearing loss.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("LOWER RESPIRATORY (~80%) — pulmonary nodules / cavities / infiltrates, alveolar hemorrhage (hemoptysis, anemia), pleuritis, dyspnea, cough.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("RENAL (~70%) — rapidly progressive glomerulonephritis (RPGN); hematuria, proteinuria, AKI; pauci-immune crescentic GN on biopsy.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("OCULAR — scleritis, episcleritis, proptosis (orbital pseudotumor), conjunctivitis.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("SKIN — palpable purpura, ulcers, papules.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("NEUROLOGIC — mononeuritis multiplex (~20%), cranial nerve palsies, CNS rare.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Constitutional — fever, weight loss, fatigue, malaise; arthralgia / myalgia common.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — Caucasian, age 40-65, environmental triggers (silica, certain drugs — propylthiouracil, hydralazine), genetic (HLA-DPB1*04:01).", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ANCA — c-ANCA pattern (~80-90% in active disease) targeting PR3 (PR3-ANCA) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ESR / CRP elevated; CBC anemia + leukocytosis; LFTs may be mildly abnormal.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("URINALYSIS — hematuria (often dysmorphic RBCs), RBC casts, proteinuria.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BIOPSY — necrotizing granulomatous vasculitis of small + medium vessels; PAUCI-IMMUNE crescentic GN on kidney; tissue from lung, sinus, or kidney depending on involvement.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("IMAGING — chest CT (pulmonary nodules / cavities / ground-glass), sinus CT (mucosal thickening, bone destruction).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BVAS (Birmingham Vasculitis Activity Score) — disease activity monitoring.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — EGPA (asthma + eosinophilia + MPO-ANCA), microscopic polyangiitis (MPO-ANCA + no granulomas), drug-induced ANCA, infection (TB, fungal can mimic).", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Organ involvement extent + severity — pulmonary hemorrhage, RPGN, neurologic → urgent treatment.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Rule out infectious mimickers — TB, fungal.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — rheumatology + nephrology + pulmonology + ENT.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BVAS scoring + Five-Factor Score (FFS) for prognosis.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("INDUCTION — severe disease: RITUXIMAB 375 mg/m² IV weekly × 4 OR cyclophosphamide IV 15 mg/kg q2-3 weeks × 3-6 months PLUS high-dose corticosteroids (methylprednisolone 1g IV × 3 days then prednisone 1 mg/kg PO daily, taper) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("INDUCTION — moderate disease: methotrexate 20-25 mg/week + steroids.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MAINTENANCE — rituximab 500 mg IV q6 months for 2+ years OR azathioprine 2 mg/kg/day OR methotrexate; reduces relapse risk.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PCP PROPHYLAXIS — TMP-SMX during induction; pneumocystis pneumonia risk.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PLASMA EXCHANGE — for severe RPGN + alveolar hemorrhage; benefit debated (PEXIVAS trial showed no benefit overall but selected severe cases).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AVACOPAN (C5a receptor antagonist) — newer; reduces steroid use; FDA-approved 2021 for ANCA-associated vasculitis.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BONE HEALTH — calcium + vitamin D + bisphosphonate (chronic steroids); DEXA.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Vaccinations — flu + pneumococcal + Shingrix; pre-rituximab if time; avoid live during therapy.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HCV + HBV + HIV screening + treatment before immunosuppression.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("RPGN → ESRD — emergent immunosuppression + occasionally plasma exchange + dialysis; renal recovery variable.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PULMONARY HEMORRHAGE — life-threatening; ARDS-like; ICU + ventilation + emergent immunosuppression + sometimes plasma exchange.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RELAPSE — common (~30-50%); rituximab maintenance reduces; monitor ANCA + clinical.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CYCLOPHOSPHAMIDE TOXICITY — hemorrhagic cystitis (mesna prevents), bladder cancer (long-term), infertility, marrow suppression, lymphoma; rituximab now preferred.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("INFECTIONS on chronic immunosuppression — PCP prophylaxis, vaccinations, infection counseling.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CARDIOVASCULAR + thromboembolic risk — increased; ASA + LMWH in selected; CV risk reduction.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("LONG-TERM ANCA monitoring — rising titers may predict relapse; clinical correlation primary.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EGPASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "egpa",
        title: "Eosinophilic granulomatosis with polyangiitis (EGPA / Churg-Strauss)",
        subtitle: "Asthma + eosinophilia + vasculitis · MPO-ANCA ~40% · MEPOLIZUMAB (anti-IL-5) approved · cardiac + neuro involvement",
        nclexTags: vasculitisTagR27,
        definition: AttributedProse(
            "ANCA-associated small-medium vessel vasculitis characterized by asthma, eosinophilia, eosinophilic infiltrates, vasculitis. Three phases — prodromal allergic (asthma + atopy), eosinophilic infiltrative (pulmonary infiltrates, GI), vasculitic (cutaneous, renal, neuropathy, cardiac). MPO-ANCA positive ~40%. Heart involvement leading cause of mortality. Mepolizumab + corticosteroids + immunosuppression treatment per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Type 2 immunity dysregulation → eosinophilic inflammation + activation of vasculitis. IL-5-driven eosinophilia central. ANCA-positive (~40% MPO-ANCA) subset has more vasculitic features; ANCA-negative subset has more eosinophilic infiltrative features.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("ASTHMA — universal; often severe + late-onset + difficult to control; precedes vasculitis by years.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PERIPHERAL EOSINOPHILIA — >10% (often >1500/µL).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PULMONARY — infiltrates (eosinophilic pneumonia-like), bronchospasm, alveolar hemorrhage.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("MONONEURITIS MULTIPLEX — common (50-75%); foot drop, wrist drop, asymmetric.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CARDIAC — myocarditis, pericarditis, coronary vasculitis, cardiomyopathy; leading cause of mortality (~25% of EGPA deaths).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("RENAL — less common than other ANCA vasculitides; mild GN sometimes.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CUTANEOUS — palpable purpura, nodules, urticaria.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("GI — eosinophilic gastroenteritis; mesenteric vasculitis can cause infarction.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Constitutional — fever, weight loss, fatigue, arthralgia.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — adult asthmatics with severe + refractory disease; leukotriene receptor antagonist unmasking (debate).", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("AMERICAN COLLEGE OF RHEUMATOLOGY 1990 — 4 of 6: asthma, peripheral eosinophilia >10%, mono / polyneuropathy, pulmonary infiltrates, paranasal sinus abnormality, extravascular eosinophilic infiltrate on biopsy per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MPO-ANCA / p-ANCA positive ~40%; PR3-ANCA rare.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BIOPSY — eosinophilic infiltrate + small-medium vessel vasculitis; tissue (lung, nerve, skin).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CARDIAC — ECG, echo, troponin, CMR if suspected.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("EMG / nerve conduction — peripheral neuropathy.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — chronic eosinophilic pneumonia, hypereosinophilic syndrome, allergic bronchopulmonary aspergillosis, parasitic infection, drug-induced eosinophilia, lymphoma.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Severity + organ involvement — Five-Factor Score (FFS) for prognosis.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Cardiac evaluation — leading mortality cause; serial echo + troponin + cardiac MRI.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Neurologic — EMG + nerve conduction for mononeuritis multiplex.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Asthma severity + control + need for high-dose ICS / oral steroids.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("INDUCTION — high-dose CORTICOSTEROIDS (methylprednisolone 1 g IV × 3 then prednisone 1 mg/kg/day) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SEVERE / vasculitic — add CYCLOPHOSPHAMIDE OR RITUXIMAB.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MEPOLIZUMAB (anti-IL-5) — FDA-approved 2017 specifically for EGPA; 300 mg SC monthly; reduces flares + steroid use per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BENRALIZUMAB (anti-IL-5R) — emerging; may be alternative.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MAINTENANCE — taper steroids; methotrexate, azathioprine, mycophenolate, or mepolizumab.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ASTHMA — continue inhaled steroids + bronchodilators; biologics for severe.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PCP PROPHYLAXIS — during induction.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CARDIAC management — HF treatment, antiarrhythmic, dual-coronary anticoagulation as needed.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — rheumatology + pulmonology + cardiology + neurology + nephrology.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Vaccinations + PCP prophylaxis + bone health.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("CARDIAC INVOLVEMENT — leading cause of death; aggressive monitoring + treatment per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MONONEURITIS MULTIPLEX — irreversible if delayed treatment; aggressive immunosuppression.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ASTHMA EXACERBATIONS — common; severe; oral steroids often needed.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CHRONIC STEROID dependence — common; mepolizumab reduces; bone health + glucose + BP management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RELAPSE — ~30-40%; clinical + lab monitoring + ANCA trends.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MORTALITY ~10-25% at 5 years; treated outcomes improved significantly with mepolizumab + improved immunosuppression.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY — disease + treatment considerations; specialty.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PANSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "polyarteritis-nodosa",
        title: "Polyarteritis nodosa (PAN)",
        subtitle: "Medium-vessel necrotizing vasculitis · NO ANCA · classic HBV-associated · multi-organ except pulmonary · steroids + cyclophosphamide",
        nclexTags: vasculitisTagR27,
        definition: AttributedProse(
            "Medium-vessel necrotizing vasculitis affecting medium-sized muscular arteries. NOT ANCA-associated (distinguishes from MPA + GPA + EGPA). PULMONARY SPARING characteristic. HBV-associated form historically common; idiopathic + secondary forms. Multi-organ involvement (kidney, GI, neuropathy, cutaneous, cardiac) per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Immune complex-mediated medium-vessel arteritis → segmental necrotizing inflammation → microaneurysm formation + thrombosis + organ ischemia. HBV-associated form via HBsAg-anti-HBs immune complex deposition. Idiopathic + secondary (HCV, infection, malignancy) forms also exist.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("CONSTITUTIONAL — fever, weight loss (>4 kg), fatigue, malaise, myalgia (calf tender), arthralgia.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("RENAL (~70%) — HTN (often new + difficult to control), renal infarcts, AKI; NOT glomerulonephritis (renovascular pattern).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("GI (~50%) — abdominal pain, mesenteric ischemia / infarction, GI bleeding, perforation.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("NEUROLOGIC (~70%) — mononeuritis multiplex (most common), CNS rare.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CUTANEOUS — livedo reticularis, palpable purpura, ulcers, nodules.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CARDIAC — coronary vasculitis, cardiomyopathy, pericarditis, MI (rare).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("TESTICULAR/OVARIAN — testicular pain, orchitis-like.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CLASSIC FEATURE: PULMONARY SPARING (vs ANCA vasculitides which involve lungs).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — HBV (~5-10% in some studies), HCV, male, age 40-60, hairy cell leukemia association rare.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACR 1990 (10 criteria; ≥3 = PAN): weight loss >4kg, livedo reticularis, testicular pain, myalgia, mono/polyneuropathy, diastolic BP >90, elevated BUN/Cr, HBsAg+, abnormal arteriogram (aneurysms, occlusions), biopsy with neutrophils in small/medium artery wall.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANCA NEGATIVE (distinguishes from MPA, GPA, EGPA).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MESENTERIC OR RENAL ANGIOGRAPHY — MICROANEURYSMS pathognomonic (\"beads-on-a-string\"); also CT angiography.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BIOPSY — necrotizing medium-vessel vasculitis; sural nerve, testis, muscle, kidney.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ESR / CRP elevated; CBC anemia + leukocytosis; HBV / HCV / HIV screening; cryoglobulins (HCV-associated cryoglobulinemic vasculitis differential).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — ANCA-associated vasculitides, infection (endocarditis, syphilis), cholesterol embolization, fibromuscular dysplasia, segmental arterial mediolysis.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify HBV + treat — affects prognosis + treatment.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Organ involvement extent — kidney, GI, CNS, cardiac.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("FFS (Five-Factor Score) — prognostication.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — rheumatology + nephrology + GI + neurology + cardiology + hepatology.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("INDUCTION — CORTICOSTEROIDS (prednisone 1 mg/kg/day, taper); for severe disease ADD CYCLOPHOSPHAMIDE PO or IV per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HBV-ASSOCIATED — short course of steroids + plasma exchange + antiviral (entecavir or tenofovir); reduces autoimmune-driven inflammation while treating HBV per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HCV-ASSOCIATED — DAA antivirals (treats both); minimize immunosuppression.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MAINTENANCE — methotrexate or azathioprine; taper steroids.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RELAPSE — re-induction with appropriate agents.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BP CONTROL — aggressive; ACE/ARB cautiously (acute renal insult); β-blockers + CCBs.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PCP PROPHYLAXIS during induction.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Vaccinations + bone health + GI / urologic management as needed.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("MESENTERIC ISCHEMIA / INFARCTION — emergent; high mortality; surgical / endovascular evaluation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RENAL FAILURE from infarcts + HTN — dialysis for severe.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MONONEURITIS MULTIPLEX — irreversible neurologic damage; aggressive immunosuppression.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HBV TREATMENT essential — uncontrolled HBV → ongoing immune complexes → continued vasculitis.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CARDIAC events — coronary vasculitis; MI; HF.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RELAPSE — less common in HBV-associated after viral clearance; more common in idiopathic.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MORTALITY — historically 50% 5-year; now <30% with treatment.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TakayasuArteritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "takayasu-arteritis",
        title: "Takayasu arteritis (TAK)",
        subtitle: "Large-vessel vasculitis · aorta + branches · young female · pulseless disease · steroids + biologic · imaging surveillance",
        nclexTags: vasculitisTagR27,
        definition: AttributedProse(
            "Large-vessel granulomatous vasculitis affecting aorta + its major branches (subclavian, carotid, renal, mesenteric arteries). Predominantly affects young women (under 40, female:male 9:1); higher prevalence in Asian + Hispanic populations. Stenoses + aneurysms develop over time per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "T-cell-mediated granulomatous inflammation of large arteries → intimal proliferation + fibrosis → STENOSIS most common; medial destruction → ANEURYSMS less common. Progressive stenoses cause organ ischemia (renal, cerebral) + limb claudication.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("CONSTITUTIONAL phase — fever, weight loss, fatigue, malaise, arthralgia, myalgia.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PULSELESS PHASE / ISCHEMIC PHASE — pulse asymmetry, BP difference >10 mmHg between arms, bruits (carotid, subclavian, abdominal), claudication of upper / lower extremities, syncope.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CAROTID involvement — TIA, stroke, syncope, vision change.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("RENAL artery — RENOVASCULAR HTN (often severe + young patient).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("AORTIC — aortic regurgitation from aortic root dilation; aortic insufficiency murmur.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PULMONARY artery — pulmonary HTN (less common).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CORONARY — angina, MI (rare).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("MESENTERIC — abdominal angina, mesenteric ischemia (rare).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — Asian / Hispanic descent, female, age <40 at onset.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("AMERICAN COLLEGE OF RHEUMATOLOGY 1990 (3 of 6): age ≤40, claudication of extremities, decreased brachial artery pulse, BP difference >10 mmHg between arms, bruit over subclavian / aorta, abnormal arteriography per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("IMAGING — gold standard — magnetic resonance angiography (MRA) OR CT angiography OR conventional angiography; aortic + branch stenoses, occlusions, aneurysms, wall thickening.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PET-CT — vessel wall inflammation (active disease); useful for monitoring.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ESR / CRP — elevated in active disease but normal in many; not always reliable for activity.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("DUPLEX ULTRASOUND — carotid + subclavian assessment; less sensitive than MRA / CTA.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BIOPSY rarely needed; imaging diagnosis sufficient.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — giant cell arteritis (older patients), fibromuscular dysplasia, cocaine vasculopathy, Behcet, IgG4-related, infectious (TB aortitis, syphilis).", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("BP in BOTH ARMS at every visit — use the higher (less affected); subclavian stenosis on the involved side underestimates true BP.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Imaging surveillance — annual MRA / CTA; PET-CT for activity assessment.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CV risk assessment + management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Pregnancy planning — preconception counseling; high-risk; MFM coordination.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("CORTICOSTEROIDS — prednisone 1 mg/kg/day; taper; mainstay; ~50% respond per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CONVENTIONAL DMARDs — methotrexate, azathioprine, mycophenolate; for steroid-sparing.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BIOLOGICS — TNF inhibitors (infliximab, adalimumab) for refractory; tocilizumab (anti-IL-6) emerging; rituximab in selected per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BP CONTROL — multiple antihypertensives often needed; ACE/ARB cautiously in renal artery stenosis.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VASCULAR INTERVENTION — angioplasty + stenting OR bypass surgery for symptomatic stenoses + critical organ ischemia; deferred until inflammation controlled (high restenosis rate during active disease).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANTIPLATELETS — aspirin 81 mg daily for thromboembolic prevention.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY — high-risk; multidisciplinary; BP control + monitoring.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Vaccinations + bone health + CV risk reduction.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("STROKE — carotid involvement; aggressive BP + antiplatelet.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AORTIC ANEURYSM RUPTURE / DISSECTION — emergent; surgical.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RENOVASCULAR HTN — refractory; angioplasty + stenting in inactive disease.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CORONARY involvement — MI; coronary intervention for active disease challenging.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY — preeclampsia + IUGR + maternal HTN crisis risk; close obstetric + cardiology + rheumatology coordination.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RELAPSE — common in first 2 years; long-term monitoring.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("LONG-TERM survival good with treatment (~90% 10-year); morbidity from vascular complications.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BehcetDiseaseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "behcet-disease",
        title: "Behcet disease",
        subtitle: "Triple recurrence — oral + genital ulcers + uveitis · Silk Road · pathergy + HLA-B51 · colchicine + biologics · neuro + vascular threats",
        nclexTags: connectiveTagR27,
        definition: AttributedProse(
            "Systemic inflammatory disease with characteristic recurrent ORAL ULCERS, GENITAL ULCERS, and UVEITIS. Variable vascular, neurologic, GI, articular, cutaneous involvement. Prevalent along Silk Road (Turkey, Iran, Japan, Mediterranean); HLA-B51 association. Treated with colchicine, immunosuppression, biologics (TNF inhibitors), apremilast (oral ulcers) per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic predisposition (HLA-B51), Th17 + Th1 dysregulation, autoinflammatory features. Vasculitis affects vessels of all sizes; particularly inflammation around small + medium veins + arteries.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("ORAL ULCERS — recurrent, painful, multiple, ≥3× per year — REQUIRED for diagnosis.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("GENITAL ULCERS — scrotum, labia, vulva; painful; scarring.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("OCULAR — PANUVEITIS (anterior + posterior uveitis), retinal vasculitis, hypopyon; major cause of vision loss per primary source.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CUTANEOUS — erythema nodosum-like, acneiform lesions, papulopustular, PATHERGY (skin hyperreactivity at trauma sites).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("VASCULAR (~20-40%) — VENOUS thrombosis (DVT, Budd-Chiari, cerebral venous thrombosis), ARTERIAL (aneurysms — Hughes-Stovin syndrome), pulmonary artery aneurysms.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("NEUROLOGIC (~5-30%) — CNS involvement — meningitis, parenchymal lesions (brainstem common), cerebral venous thrombosis; cranial nerve palsies; cognitive decline.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("ARTHRITIC — non-erosive oligoarthritis or polyarthritis.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("GI — terminal ileum + cecum involvement; resembles Crohn's; ulcerations.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CARDIAC — pericarditis, myocarditis, valvulitis; uncommon.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — Silk Road descent (Turkey 80-300/100K vs Western 1-5/100K), HLA-B51, age 20-40.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("INTERNATIONAL CRITERIA FOR BEHCET'S (2014) — score ≥4: oral ulcers + genital ulcers + skin lesions + ocular + neuro + vascular + positive pathergy per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PATHERGY TEST — sterile needle prick → papule / pustule >2 mm in 24-48 hrs; positive in 30-60% of Mediterranean / Asian patients; less common in Western.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HLA-B51 — strong association in endemic areas; supportive not diagnostic.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Ophthalmology evaluation if any eye symptoms.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Workup for systemic involvement — CBC, CMP, ESR, CRP, urinalysis, imaging (vascular, brain) as indicated.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — IBD with extraintestinal, reactive arthritis, recurrent aphthous stomatitis, syphilis, herpes simplex, autoimmune blistering, IgA vasculitis.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Ocular evaluation — uveitis can cause vision loss; ophthalmology referral.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Neurologic + vascular screening for high-risk patients.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — rheumatology + ophthalmology + dermatology + neurology + vascular surgery.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Pregnancy planning — disease often improves in pregnancy; postpartum flare.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("ORAL ULCERS — topical corticosteroids, sucralfate paste, colchicine 1-2 mg/day, APREMILAST (FDA-approved for oral ulcers of Behcet's) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("UVEITIS — systemic corticosteroids + immunosuppression (azathioprine, cyclosporine, biologics — TNF inhibitors infliximab + adalimumab); periocular / intraocular steroids; ophthalmology essential.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("NEUROLOGIC — high-dose corticosteroids + immunosuppression (azathioprine, cyclophosphamide, biologics); chronic management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VASCULAR — corticosteroids + immunosuppression; anticoagulation controversial (aneurysms can bleed with anticoagulation); pulmonary aneurysms surgical / endovascular.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("GI — anti-TNF + immunosuppression; surgical for refractory.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Arthritis — colchicine + NSAIDs + immunosuppression.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("EULAR + ACR / Vasculitis Foundation guidelines — organ-specific recommendations.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Vaccinations + bone health + CV risk reduction.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("VISION LOSS from uveitis — aggressive treatment; ophthalmology essential.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("NEUROLOGIC SEQUELAE — irreversible deficits; aggressive immunosuppression.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PULMONARY ARTERY ANEURYSM — Hughes-Stovin syndrome; emergent surgical / endovascular; AVOID anticoagulation (bleeding risk).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BUDD-CHIARI / cerebral venous thrombosis — emergent.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("INTESTINAL PERFORATION + GI bleed — surgical.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY — generally improves disease but postpartum flares; high-risk pregnancy management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PSYCHOLOGICAL — chronic painful illness, vision threat, ulcers affecting quality of life; mental health support.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum APSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "antiphospholipid-syndrome",
        title: "Antiphospholipid syndrome (APS)",
        subtitle: "Autoimmune thrombosis + pregnancy morbidity · LA + anti-cardiolipin + anti-β2-GPI · WARFARIN INR 2-3 · pregnancy ASA + LMWH",
        nclexTags: vasculitisTagR27,
        definition: AttributedProse(
            "Autoimmune disorder characterized by vascular thrombosis (arterial + venous) + pregnancy morbidity + persistent antiphospholipid antibodies (lupus anticoagulant + anti-cardiolipin + anti-β2-glycoprotein-I). Primary (idiopathic) or secondary (SLE most common). Lifelong anticoagulation for thrombosis; aspirin + LMWH for pregnancy per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Autoantibodies against phospholipid-binding proteins (particularly β2-glycoprotein-I) → activate endothelial cells + platelets + complement → thrombosis. Pregnancy morbidity via placental inflammation + thrombosis. Complement activation in CAPS.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("VENOUS THROMBOSIS — DVT, PE most common; recurrent.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("ARTERIAL THROMBOSIS — STROKE (most common arterial), TIA, MI, peripheral arterial; younger patients.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PREGNANCY morbidity — recurrent pregnancy loss (≥3 unexplained <10 weeks OR ≥1 fetal loss ≥10 weeks OR ≥1 preterm <34 weeks for severe preeclampsia / placental insufficiency).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CARDIAC — Libman-Sacks endocarditis, valvular thickening (often asymptomatic on echo screening).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("HEMATOLOGIC — autoimmune hemolytic anemia, thrombocytopenia (immune-mediated, often mild).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("DERMATOLOGIC — livedo reticularis (common), skin necrosis, leg ulcers.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("NEUROLOGIC — chorea, transverse myelitis, cognitive dysfunction, multiple sclerosis-like.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("RENAL — APS nephropathy (thrombotic microangiopathy).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CATASTROPHIC APS (CAPS) — RARE; multi-organ thrombosis within 1 week + microangiopathic; ~50% mortality; plasmapheresis + IVIG + steroids + anticoagulation.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — female (4:1), SLE / other autoimmune (50% of APS), age <50, smoking, oral contraceptives, infection trigger.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("SAPPORO / SYDNEY criteria — clinical (thrombosis OR pregnancy morbidity) + laboratory (≥1 antibody positive on 2 separate occasions ≥12 weeks apart) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("LUPUS ANTICOAGULANT (LA) — paradoxically prolongs aPTT (in vitro); confirmed by mixing study + neutralization.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANTI-CARDIOLIPIN antibody (aCL — IgG or IgM) — ≥40 GPL or MPL = moderate-high (clinically significant).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANTI-β2-GLYCOPROTEIN-I antibody (anti-β2-GPI — IgG or IgM) — ≥40 SGU/SMU.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("TRIPLE POSITIVE (LA + aCL + anti-β2-GPI) — highest thrombosis risk; lifelong anticoagulation strongly recommended.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Workup secondary — ANA, anti-dsDNA, anti-SSA/B, C3/C4 (SLE workup).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RoPE score — for paradoxical embolism workup (if PFO + cryptogenic stroke).", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Workup recurrent thrombosis + recurrent pregnancy loss + thrombocytopenia.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Coexisting autoimmune — SLE workup; secondary APS more common.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CV risk factor optimization.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Pregnancy planning + reproductive counseling.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("THROMBOSIS treatment — LIFELONG WARFARIN INR 2-3 (target 2-3); ASA 81 mg added for arterial; DOAC NOT first-line per ASH per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("DOACs — generally NOT first-line in APS (especially triple-positive); studies show higher thrombosis recurrence vs warfarin; reserve for warfarin-intolerant.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RECURRENT thrombosis on warfarin (INR 2-3) — escalate to INR 3-4 OR add aspirin OR consider LMWH.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY (recurrent loss / pregnancy morbidity) — ASPIRIN 81 mg + PROPHYLACTIC LMWH from positive pregnancy test through delivery + 6 weeks postpartum per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY with prior thrombosis — THERAPEUTIC LMWH (vs prophylactic) + aspirin throughout.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CATASTROPHIC APS (CAPS) — plasmapheresis + IVIG + corticosteroids + anticoagulation; high mortality without; ICU.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HYDROXYCHLOROQUINE — reduces thrombosis recurrence (especially in SLE-APS); generally added.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("STATIN — anti-inflammatory + atheroprotective.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AVOID estrogen-containing contraceptives — increased thrombosis; non-hormonal / progestin-only / IUD.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Bone health — calcium + vitamin D + bisphosphonate (chronic steroids).", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("RECURRENT THROMBOSIS — most common cause of morbidity / mortality; intensify anticoagulation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CATASTROPHIC APS — emergent; plasmapheresis + IVIG + steroids + anticoagulation; mortality ~50%.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("INR INTERFERENCE — lupus anticoagulant can falsely elevate INR; alternative testing (chromogenic factor X).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY-related thrombosis + morbidity — close MFM + hematology coordination; aspirin + LMWH essential.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ESTROGEN CONTRACEPTIVES contraindicated — counsel.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SLE-ASSOCIATED APS — disease activity affects APS; combined treatment.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("LIFESTYLE — smoking cessation, BP control, diabetes control, weight management.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SystemicSclerosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "systemic-sclerosis",
        title: "Systemic sclerosis (scleroderma)",
        subtitle: "Skin fibrosis + vascular + visceral · Raynaud + sclerodactyly + ILD + PAH + renal crisis · ACE for renal · vasodilators for digital · NIPPV / OFFAB",
        nclexTags: connectiveTagR27,
        definition: AttributedProse(
            "Autoimmune connective tissue disease — skin fibrosis + vasculopathy + visceral organ fibrosis. Two main subsets — LIMITED CUTANEOUS (CREST syndrome — calcinosis, Raynaud, esophageal dysmotility, sclerodactyly, telangiectasia; ANTI-CENTROMERE+; pulmonary hypertension predominant) + DIFFUSE CUTANEOUS (rapid progressive skin involvement, ANTI-Scl-70/Topoisomerase or ANTI-RNA polymerase III, interstitial lung disease, scleroderma renal crisis predominant). Female predominance 4-7:1 per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — autoimmunity, vasculopathy, fibrosis. Endothelial dysfunction → reduced vasoreactivity → Raynaud + digital ulcers + pulmonary HTN. Activated fibroblasts overproduce collagen → skin + organ fibrosis. T-cell-mediated, autoantibody-associated.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("RAYNAUD'S phenomenon — universal; first symptom; triphasic color change (white → blue → red); cold/stress-induced; can cause digital ulcers.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("SKIN — sclerodactyly (digital tightening), telangiectasias, calcinosis (subcutaneous calcium deposits), facial features (smooth tight face, perioral furrowing), salt-and-pepper hyperpigmentation, edema.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("GI — ESOPHAGEAL DYSMOTILITY (~80%, GERD), gastric antral vascular ectasia (\"watermelon stomach\"), small bowel dysmotility + SIBO, large bowel dysmotility, anal sphincter dysfunction.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PULMONARY — INTERSTITIAL LUNG DISEASE (ILD; NSIP pattern most often), PULMONARY ARTERIAL HYPERTENSION (PAH; major cause of mortality).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CARDIAC — myocardial fibrosis, pericardial effusion, arrhythmias, heart failure.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("RENAL — SCLERODERMA RENAL CRISIS (rare but life-threatening); abrupt severe HTN + AKI + thrombotic microangiopathy; ACE inhibitors transformative treatment.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("MUSCULOSKELETAL — arthralgia, myalgia, tendon friction rubs, contractures.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — female (4-7:1), age 30-50 onset, family history of autoimmune, occupational silica / organic solvents exposure.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACR/EULAR 2013 — score ≥9 (sum of features); proximal skin involvement to MCP = 9 points (sufficient alone).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AUTOANTIBODIES — anti-CENTROMERE (~30% limited; CREST), anti-Scl-70/topoisomerase-I (~30% diffuse; ILD), anti-RNA polymerase III (~25% diffuse; renal crisis), anti-U3-RNP (PAH); ANA positive ~90%.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("NAILFOLD CAPILLAROSCOPY — early dilatation, hemorrhage, dropout; characteristic.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PFTs + HRCT — annual to screen / monitor ILD; DLCO trends important.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ECHOCARDIOGRAM — annual; estimates PA pressures; right heart catheterization for definitive PAH diagnosis.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RENAL — BP + Cr; abrupt rise concerning for renal crisis.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("UPPER endoscopy — for severe reflux / Barrett's surveillance.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — eosinophilic fasciitis, generalized morphea, drug-induced (bleomycin, gemcitabine, vinyl chloride), graft-vs-host disease, scleromyxedema, nephrogenic systemic fibrosis (Gd contrast).", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Subset classification (limited vs diffuse) — guides prognosis + monitoring.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Annual screening — PFTs + HRCT, echo, BP + Cr.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — rheumatology + pulmonology + cardiology + nephrology + GI + dermatology + PT/OT.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Cold avoidance + Raynaud management at every visit.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("RAYNAUD'S + DIGITAL ULCERS — cold avoidance + warming; CCB (nifedipine 30-90 mg/day, amlodipine); PDE-5 inhibitors (sildenafil, tadalafil); IV iloprost / epoprostenol for severe; bosentan (endothelin) for ulcer prevention per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ILD — MYCOPHENOLATE first-line; CYCLOPHOSPHAMIDE alternative; NINTEDANIB FDA-approved for SSc-ILD; tocilizumab emerging.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PAH — endothelin receptor antagonists (bosentan, ambrisentan, macitentan), PDE-5 inhibitors (sildenafil, tadalafil), prostacyclin analogs (epoprostenol, treprostinil, iloprost); guanylate cyclase stimulators (riociguat).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SCLERODERMA RENAL CRISIS — ACE INHIBITORS LIFE-SAVING; captopril titrated rapidly; aggressive BP control; dialysis if AKI; AVOID corticosteroids (worsen renal crisis) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("GI — PPIs (severe GERD), prokinetics (metoclopramide), antibiotics for SIBO (rifaximin), surgical consideration for Barrett's.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SKIN — methotrexate (early diffuse), mycophenolate, PUVA, narrow-band UVB; emollients + sun protection.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MUSCULOSKELETAL — NSAIDs + low-dose steroids; PT/OT to maintain function + prevent contractures.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HEMATOPOIETIC CELL TRANSPLANT — for selected severe diffuse SSc; emerging therapy.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AVOID CORTICOSTEROIDS in moderate-high doses — RENAL CRISIS RISK; if needed, use lowest dose + monitor BP carefully.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Pregnancy — high-risk; counsel pre-conception; renal crisis + pulmonary HTN considerations.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("SCLERODERMA RENAL CRISIS — ACE inhibitors LIFE-SAVING; abrupt severe HTN; vigilant BP monitoring per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PULMONARY ARTERIAL HYPERTENSION — leading cause of mortality; annual echo screening; right heart cath confirmation; vasodilator therapy.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("INTERSTITIAL LUNG DISEASE — progressive; nintedanib + mycophenolate slows.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("DIGITAL ISCHEMIA + ULCERATION — amputation risk; aggressive vasodilators; sometimes prostacyclin.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SIBO — antibiotic cycles; mortality predictor.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CARDIAC complications — fibrosis, arrhythmia, HF.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("OSTEOPOROSIS — vitamin D, calcium, bisphosphonate.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY — preconception planning + MFM + rheumatology + cardiology; high-risk.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PSYCHOSOCIAL — chronic disease + disfigurement + fatigue + fertility concerns; counseling + support.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CRPSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "crps",
        title: "Complex regional pain syndrome (CRPS)",
        subtitle: "Chronic limb pain disproportionate to injury · allodynia + autonomic dysfunction + motor changes · early PT + sympathetic blocks · psychological support",
        nclexTags: neuroTagR27,
        definition: AttributedProse(
            "Chronic pain syndrome — disproportionate to inciting injury — with sensory (allodynia, hyperalgesia, hypoesthesia), motor (weakness, dystonia), vasomotor (skin color / temperature), sudomotor (sweating), and trophic (hair, nails, skin) features in distal extremity. Type 1 — no nerve injury identifiable (most cases); Type 2 — identifiable nerve lesion. Early aggressive PT + multimodal therapy improves outcomes per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — peripheral + central sensitization, sympathetic dysregulation, neurogenic inflammation, immune mechanisms, central nervous system reorganization (cortical somatotopic changes). Triggered by trauma (fracture, surgery, immobilization) usually.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("PAIN — disproportionate to inciting injury; burning, throbbing, deep aching; constant; spreads beyond original injury area.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("SENSORY abnormalities — allodynia (pain from non-painful stimulus), hyperalgesia (exaggerated pain), hypoesthesia (decreased sensation).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("VASOMOTOR — skin color changes (red, blue, purple, mottled), temperature asymmetry (>1°C), edema.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("SUDOMOTOR — excessive or absent sweating in affected limb.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("MOTOR — weakness, tremor, dystonia, decreased ROM, neglect.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("TROPHIC — hair / nail changes, skin atrophy, contractures, osteoporosis on plain radiographs.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PSYCHOLOGICAL — depression, anxiety, sleep disturbance, fear-avoidance; high impact on function.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("STAGES (controversial classification) — acute → dystrophic → atrophic; many patients don't follow stages.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — distal limb injury, prolonged immobilization, surgery, pregnancy / female, smoking, anxious / depressive temperament.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BUDAPEST CRITERIA — clinical diagnosis; continuing pain disproportionate to inciting event + 1 symptom in 3 of 4 categories + 1 sign at time of evaluation in 2 of 4 categories + no other diagnosis better explaining the syndrome per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RADIOGRAPHS — osteoporosis (\"patchy\" mottled appearance — Sudeck's atrophy).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BONE SCAN — increased uptake in affected limb; supportive.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MRI / nerve conduction — to exclude other causes; identify nerve injury (Type 2).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Quantitative sensory testing — research; sensitivity / specificity limited.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — peripheral neuropathy, infection, DVT, lymphedema, malingering, factitious disorder, vascular insufficiency, fibromyalgia.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("EARLY recognition + treatment — better outcomes if treated within 6 months.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — pain medicine + PT/OT + psychology + rheumatology + neurology.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Psychological evaluation + treatment essential.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Functional rehabilitation as primary outcome.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("EARLY PT / OT — gentle progressive desensitization + ROM + functional restoration; foundation of treatment per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MIRROR therapy — for upper extremity CRPS; visual feedback to retrain cortical representation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANALGESICS — gabapentin, pregabalin, TCAs (amitriptyline), SNRIs (duloxetine, venlafaxine); opioids generally NOT first-line for chronic CRPS.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("KETAMINE — IV infusions for refractory; subdissociative dosing in specialty pain centers.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BISPHOSPHONATES (alendronate, pamidronate, zoledronate) — emerging evidence; particularly early CRPS with bony changes.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VITAMIN C 500 mg PO daily × 50 days — for prevention of CRPS after wrist fracture per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SYMPATHETIC NERVE BLOCKS — stellate ganglion (upper extremity), lumbar sympathetic (lower extremity); diagnostic + therapeutic.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SPINAL CORD STIMULATION — for refractory; long-term improvement in 50-70%.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PSYCHOLOGICAL — CBT, mindfulness, biofeedback; address depression / anxiety; mental health intervention central.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("DRY needling, acupuncture — some evidence; adjunctive.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BACLOFEN (intrathecal) — for dystonia + spasm.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AVOID overuse of opioids in chronic CRPS — limited efficacy + dependence risk.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("CHRONICITY — once established, very difficult to reverse; aggressive early treatment important.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("FUNCTIONAL DECLINE — disuse contractures + osteoporosis + muscle atrophy; PT essential.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("DEPRESSION + SUICIDE — high prevalence; address mental health; psychiatric consultation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RECURRENCE — risk after additional injuries; counsel + vitamin C prophylaxis after limb fractures.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("OPIOID DEPENDENCE — high risk in chronic CRPS; specialty pain management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("LITIGATION — frequent association with workers compensation + injury claims; objective documentation essential.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("EARLY treatment improves outcomes significantly — referral to specialty pain center promptly.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IIHSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "idiopathic-intracranial-hypertension",
        title: "Idiopathic intracranial hypertension (IIH / pseudotumor cerebri)",
        subtitle: "Young obese female · headache + visual changes + papilledema · LP normal CSF + high opening pressure · acetazolamide + weight loss · vision threat",
        nclexTags: neuroTagR27,
        definition: AttributedProse(
            "Increased intracranial pressure without identifiable cause (no mass / hydrocephalus / venous thrombosis); normal CSF composition. Affects young obese women (women 90%, age 20-50, BMI elevated). Causes papilledema + vision loss + headaches. Weight loss + acetazolamide + surgical interventions for refractory per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — CSF dynamics dysregulation (increased production or decreased absorption), venous outflow obstruction (transverse sinus stenosis), vitamin A metabolism, hormonal influences. Obesity central; weight loss often improves disease.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("HEADACHE — daily, generalized, often retro-orbital; worse on awakening, lying down, with Valsalva.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("VISUAL DISTURBANCES — transient visual obscurations (TVO — fade out for seconds), persistent vision loss, peripheral visual field defects, blurred vision.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PAPILLEDEMA — bilateral; cardinal physical finding; visual acuity may be preserved despite advanced papilledema.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PULSATILE TINNITUS — common; rhythmic whooshing noise heard in head; reflects altered venous flow.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("DIPLOPIA — 6th cranial nerve palsy (LR weakness; abducens stretches under increased ICP); horizontal binocular diplopia.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("NAUSEA + VOMITING — increased ICP; variable.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Visual loss can be PERMANENT if untreated; severity not always proportional to symptoms.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — female (90%), obesity (BMI >30), age 20-50, drugs (tetracyclines, retinoids — vitamin A excess, oral contraceptives, lithium, growth hormone), thyroid disorders, sleep apnea, SLE, Cushing.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MODIFIED DANDY CRITERIA — symptoms + signs of increased ICP, no other identifiable cause on imaging, CSF normal composition + elevated opening pressure ≥25 cm H2O per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BRAIN MRI + MRV — rule out mass, hydrocephalus, cerebral venous thrombosis; may show secondary signs (empty sella, transverse sinus stenosis, distended optic nerve sheaths).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("LUMBAR PUNCTURE — OPENING PRESSURE measurement (patient in lateral decubitus); normal <20-25 cm H2O; >25 supports IIH per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CSF analysis — normal composition (rules out infection / inflammation / malignancy).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("OPHTHALMOLOGY — fundus exam + OCT (papilledema severity) + visual field testing (Humphrey).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Workup secondary causes — drug history, thyroid, sleep apnea, SLE, Cushing.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — cerebral venous sinus thrombosis, posterior fossa mass, hydrocephalus, intracranial hypotension (positional headache opposite pattern), migraine.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Vision threat assessment — visual fields + acuity at every visit; severe papilledema with vision loss = emergent.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Identify + remove secondary triggers — drugs, weight, sleep apnea.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Ophthalmology + neurology + neurosurgery (if surgical interventions needed).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Mental health support — chronic disease + vision concerns.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("WEIGHT LOSS — 5-10% body weight reduction effective; bariatric surgery for morbid obesity refractory; cornerstone per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ACETAZOLAMIDE — carbonic anhydrase inhibitor; reduces CSF production; start 250-500 mg BID, titrate to 1-2 g/day; side effects — paresthesias, taste change, hypokalemia per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("TOPIRAMATE — alternative or add-on; weight loss bonus; carbonic anhydrase inhibition.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("FUROSEMIDE — adjunct; less first-line.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HEADACHE management — same agents as migraine prophylaxis (topiramate doubles as IIH treatment); avoid opioids (medication-overuse headache).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("SERIAL LUMBAR PUNCTURES — relief of ICP; emergency / bridge; not long-term.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VENOUS SINUS STENTING — for transverse sinus stenosis with pressure gradient; emerging effective intervention.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("OPTIC NERVE SHEATH FENESTRATION — surgical for refractory papilledema with vision threat.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VP / LP SHUNT — for refractory; complications include obstruction, infection, low pressure.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("OPHTHALMOLOGY follow-up — frequent; visual field testing q3 months initially.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("STOP offending drugs — tetracyclines, retinoids, OCs, lithium.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Sleep apnea — CPAP treatment improves IIH.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("PERMANENT VISION LOSS — most concerning; aggressive treatment + close monitoring; severe papilledema with vision deterioration = surgical consideration.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("FULMINANT IIH — rapidly progressive vision loss within weeks; emergent surgery (optic nerve sheath fenestration OR shunt) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MEDICATION-OVERUSE HEADACHE — avoid opioids + frequent abortives; counsel.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("OBESITY-RELATED COMORBIDITIES — sleep apnea, T2DM, HTN, CV; multidisciplinary management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY — IIH common during pregnancy; close monitoring + acetazolamide controversial (3rd trimester concerns); MFM + neurology.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PSYCHOSOCIAL — chronic headache + vision concerns + weight management; depression + anxiety; mental health support.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LEMSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "lambert-eaton",
        title: "Lambert-Eaton myasthenic syndrome (LEMS)",
        subtitle: "Pre-synaptic NMJ antibody · proximal LE weakness improves with exercise · autonomic dysfunction · 50% small cell lung cancer · 3,4-DAP + IVIG",
        nclexTags: neuroTagR27,
        definition: AttributedProse(
            "Pre-synaptic neuromuscular junction autoimmune disorder — antibodies against P/Q-type voltage-gated calcium channels (VGCC). Symptoms: proximal lower extremity weakness, autonomic dysfunction, decreased / absent deep tendon reflexes. UNIQUE feature — WEAKNESS IMPROVES with brief exercise (\"facilitation\") — distinguishes from myasthenia gravis. 50% paraneoplastic (small cell lung cancer) per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Autoantibodies (often paraneoplastic from small cell lung cancer) against pre-synaptic P/Q-type voltage-gated calcium channels (VGCC) → reduced calcium influx → reduced acetylcholine release at neuromuscular junction → muscle weakness + autonomic dysfunction.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("PROXIMAL LOWER EXTREMITY WEAKNESS — predominant; thigh + hip weakness; difficulty climbing stairs / rising from chair.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("FATIGUE + WEAKNESS — improves with BRIEF exercise (facilitation; unique vs MG which worsens with exercise).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("AUTONOMIC DYSFUNCTION — dry mouth, erectile dysfunction, constipation, orthostatic hypotension, decreased sweating, accommodation difficulties.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("DECREASED / ABSENT DEEP TENDON REFLEXES — characteristic; recover after brief exercise.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Bulbar symptoms — less common than MG; mild dysarthria, ptosis (less than MG); dysphagia uncommon.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — small cell lung cancer (50%); smoking history; other malignancies; autoimmune disease association.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ANTI-VGCC ANTIBODY — P/Q-type voltage-gated calcium channel antibody; positive in 85-90% of LEMS per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("REPETITIVE NERVE STIMULATION — LOW initial compound muscle action potential (CMAP) + INCREMENT (>100% increase) with HIGH-FREQUENCY (20-50 Hz) repetitive stimulation OR brief voluntary contraction — characteristic per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Single-fiber EMG — jitter + blocking.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CHEST CT — screen for small cell lung cancer; repeat every 6 months × 4-5 years if initially negative; FDG-PET if CT negative.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — myasthenia gravis (different reflex pattern, decrement on RNS, postsynaptic antibodies), inflammatory myopathies, motor neuron disease, GBS.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("CANCER SCREENING — chest CT essential; repeat every 6 months × 4-5 years.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Functional + autonomic assessment.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — neurology + oncology + pulmonology + rehabilitation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Smoking cessation counseling.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("3,4-DIAMINOPYRIDINE (Firdapse / amifampridine) — first-line; blocks pre-synaptic K+ channels → prolonged depolarization → increased ACh release; improves strength per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PYRIDOSTIGMINE — AChE inhibitor; modest benefit; usually combined with 3,4-DAP.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("IVIG — for severe weakness OR refractory; 2 g/kg over 5 days; effect in days-weeks.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PLASMA EXCHANGE — alternative to IVIG.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("IMMUNOSUPPRESSION — prednisone + azathioprine / mycophenolate / cyclosporine — for chronic management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RITUXIMAB — emerging for refractory; B-cell depletion.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("TREAT UNDERLYING CANCER — chemotherapy / surgery; can improve LEMS dramatically if cancer responds.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AVOID neuromuscular blockers in anesthesia — extreme sensitivity; non-depolarizing agents reduced 50%; cisatracurium preferred.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AVOID aminoglycosides + macrolides + magnesium + fluoroquinolones — exacerbate weakness.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Smoking cessation — reduces cancer risk + may improve symptoms.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Mobility aids + PT — maintain function.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("PARANEOPLASTIC — small cell lung cancer; screen aggressively; cancer treatment can dramatically improve LEMS.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANESTHETIC SENSITIVITY — neuromuscular blocking agents prolonged effect; alert anesthesia.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("DRUG SENSITIVITY — many drugs exacerbate (aminoglycosides, macrolides, fluoroquinolones, magnesium, β-blockers, lithium, statins); avoid when possible.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("FALL risk — proximal weakness; PT + assistive devices.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AUTONOMIC dysfunction — manage symptomatically; dry mouth, constipation, orthostatic.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CANCER OUTCOME — paraneoplastic LEMS may indicate occult cancer; surveillance + treatment improves both.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NMOSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "neuromyelitis-optica",
        title: "Neuromyelitis optica spectrum disorder (NMOSD)",
        subtitle: "Aquaporin-4 IgG · severe optic neuritis + transverse myelitis · LONG cord lesions (3+ segments) · ECULIZUMAB / SATRALIZUMAB / INEBILIZUMAB · LIFELONG",
        nclexTags: neuroTagR27,
        definition: AttributedProse(
            "Autoimmune disease of CNS — characterized by severe optic neuritis + extensive transverse myelitis. Predominantly mediated by aquaporin-4 IgG antibodies (~80%); MOG-IgG positive (~15%) is distinct phenotype. Severe attacks + cumulative disability; lifelong immunosuppression with eculizumab / satralizumab / inebilizumab transformed care per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Anti-aquaporin-4 (AQP4) antibodies attack water channel proteins predominantly expressed on astrocyte foot processes → complement-mediated cytotoxicity + inflammation + demyelination in spinal cord + optic nerves + brainstem regions. MOG-IgG NMOSD has different antigen + mechanism.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("OPTIC NEURITIS — severe + often bilateral (~30%); vision loss may be permanent if not treated rapidly.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("TRANSVERSE MYELITIS — extensive (≥3 vertebral segments — LONGITUDINALLY EXTENSIVE TM); paresis, sensory disturbance, autonomic, sphincter dysfunction.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("AREA POSTREMA SYNDROME — intractable nausea + vomiting + hiccups; often presents before classic NMO features.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("BRAINSTEM symptoms — diplopia, vertigo, dysphagia.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Acute disseminated encephalomyelitis-like in MOG-IgG.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — female (10:1 in AQP4+; less female predominance in MOG+), age 20-50, non-white (African + Latina more), other autoimmune disease.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("WINGERCHUK 2015 — clinical core + AQP4-IgG positive + dissemination in time / space; OR AQP4-negative requires more core features.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AQP4-IgG — cell-based assay; positive in ~80% of NMOSD per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MOG-IgG — newer; ~15% of AQP4-negative NMOSD-like presentations.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MRI BRAIN + SPINE — longitudinally extensive transverse myelitis (≥3 segments); optic nerve involvement; periaqueductal gray + area postrema lesions.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CSF — pleocytosis (sometimes neutrophilic, unlike MS), elevated protein; oligoclonal bands less common than MS (~30%).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Visual evoked potentials, OCT for optic involvement.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — multiple sclerosis (different lesion pattern, oligoclonal bands more common, less severe attacks), ADEM, sarcoidosis, infection (HTLV-1, syphilis, lyme), Sjögren myelopathy.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("AQP4-IgG + MOG-IgG testing to confirm + classify.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differentiate from MS — different treatment + prognosis.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — neurology + ophthalmology + PM&R + ID (vaccinations).", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE ATTACK — high-dose IV methylprednisolone 1 g/day × 5 days; followed by plasma exchange for severe (PLEX 5-7 sessions on alternate days) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CHRONIC IMMUNOSUPPRESSION — essential to prevent relapses + cumulative disability.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("FDA-APPROVED biologics — ECULIZUMAB (anti-C5; first-line for AQP4+); SATRALIZUMAB (anti-IL-6R); INEBILIZUMAB (anti-CD19); RITUXIMAB (anti-CD20 off-label first-line) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AZATHIOPRINE OR MYCOPHENOLATE — alternative for resource-limited / drug access.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AVOID MS DISEASE-MODIFYING DRUGS — interferon, fingolimod, natalizumab WORSEN NMOSD; misdiagnosis as MS dangerous per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VACCINATIONS — pre-eculizumab MENINGOCOCCAL vaccination essential (MenACWY + MenB) due to N. meningitidis risk on C5 blockade; ongoing prophylactic ciprofloxacin sometimes.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ATTACK RECOGNITION + PROMPT TREATMENT — counsel patient + family; minimize attack damage.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("REHABILITATION — vision, motor, autonomic, sphincter; OT/PT/SLP.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Pregnancy planning — multidisciplinary; some immunosuppressants safer than others; relapse risk pregnancy + postpartum.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("CUMULATIVE DISABILITY from attacks — vision loss + paraplegia possible; aggressive prevention.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MS DRUGS DANGEROUS — interferon, fingolimod, natalizumab; if misdiagnosed as MS + treated → catastrophic NMO relapses.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MENINGOCOCCAL infection on eculizumab — 1000× increased; vaccinate + counsel + prophylactic antibiotics in selected.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RELAPSE — common without treatment; vigilant clinical + imaging.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("AREA POSTREMA SYNDROME — intractable hiccups + vomiting can precede other NMO; suspect.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PREGNANCY + POSTPARTUM — relapse increased postpartum; monitor + maintain immunosuppression where appropriate.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MOG-IgG NMOSD — distinct disease; better prognosis; lower relapse rate; less aggressive immunosuppression often sufficient.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CIDPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cidp",
        title: "Chronic inflammatory demyelinating polyneuropathy (CIDP)",
        subtitle: "Symmetric proximal + distal weakness · areflexia · slow course (>8 weeks vs GBS) · IVIG + steroids + plasma exchange · long-term IS",
        nclexTags: neuroTagR27,
        definition: AttributedProse(
            "Chronic autoimmune demyelinating polyneuropathy — progressive or relapsing symmetric proximal + distal weakness + sensory loss with hyporeflexia. \"Chronic GBS-like\" disease with course >8 weeks (vs GBS <4 weeks). Treatable + monitoring needed; IVIG + steroids + plasma exchange + immunosuppression maintain function per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Autoimmune-mediated demyelination of peripheral nerves + nerve roots; T-cell + B-cell + autoantibody-mediated. Distinct from GBS by chronic course + different antibody profiles (anti-MAG, anti-paranodal antibodies in some).",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("SYMMETRIC weakness — proximal + distal; arms + legs; less severe than GBS typically.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("SENSORY loss — large fiber (vibration, proprioception); paresthesias.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("AREFLEXIA / hyporeflexia — characteristic.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("PROGRESSIVE OR RELAPSING course — symptoms >8 weeks (distinguishes from GBS).", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("CRANIAL NERVE involvement — less common than GBS; facial weakness, ophthalmoparesis sometimes.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("RESPIRATORY weakness — uncommon vs GBS.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("AUTONOMIC dysfunction — less common vs GBS.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — age 40-60 onset; male slightly more common; autoimmune association; some preceded by infection.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EFNS / PNS criteria — clinical course + nerve conduction studies (demyelinating pattern — slow conduction velocities, prolonged distal latencies, conduction block, temporal dispersion) per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CSF — ALBUMINOCYTOLOGIC DISSOCIATION (elevated protein with normal cell count); similar to GBS.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Nerve biopsy — rarely needed; demyelination + remyelination; onion-bulb formation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MRI of nerve roots — gadolinium enhancement; supportive.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANTIBODY testing — anti-MAG (slow demyelination + sensory), anti-paranodal antibodies (anti-CNTN1, anti-NF155); subtype identification.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Workup secondary — HIV, HCV, lyme disease, syphilis, monoclonal gammopathy (SPEP, IFE — POEMS syndrome), CMV.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — Guillain-Barré syndrome (<4 weeks; GBS vs CIDP TIME COURSE distinguishes), multifocal motor neuropathy, paraproteinemic neuropathy, hereditary neuropathy, diabetic polyneuropathy, vasculitic neuropathy.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Distinguish from GBS — disease course duration is key.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Identify subtypes (anti-MAG, anti-paranodal) — different prognosis + treatment.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — neurology + PT/OT + rehabilitation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Functional + quality of life assessment.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("IVIG — 2 g/kg IV over 2-5 days × induction; maintenance 0.4-1 g/kg q4-8 weeks; first-line for typical CIDP per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CORTICOSTEROIDS — methylprednisolone 1 g IV pulses OR prednisone 60-80 mg/day; taper; second-line; AVOID in motor predominant forms (anti-MAG often worsens with steroids).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PLASMA EXCHANGE — alternative to IVIG; effective; logistically harder.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("STEROID-SPARING / chronic — azathioprine, mycophenolate, cyclosporine, methotrexate; rituximab for refractory.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("HYQVIA (SC IVIG) — alternative to IV; weekly self-administration.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("REHABILITATION — PT/OT to maintain strength + function + prevent contractures.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MONITOR response — typically improvement over weeks; INCAT scale + ONLS for clinical assessment.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Pregnancy — IVIG safe; pregnancy + postpartum can affect course.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Anti-MAG variant — slow + sensory predominant; rituximab + IVIG; steroids may worsen.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("FUNCTIONAL DECLINE — chronic + progressive; aggressive treatment + rehabilitation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RELAPSE — common; periodic IVIG / steroids; adjust maintenance.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("TREATMENT FAILURE — assess subtype + secondary causes (POEMS, anti-MAG, anti-CNTN1); alternative therapies.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("STEROID SIDE EFFECTS — diabetes, weight gain, mood, osteoporosis, infection; bone health + glucose monitoring.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("POEMS SYNDROME — variant with monoclonal gammopathy + polyneuropathy + organomegaly + endocrinopathy + skin changes; oncology referral.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MISDIAGNOSIS — wide differential; revisit if no response.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Pregnancy + postpartum can affect course; coordinate care.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum GlioblastomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "glioblastoma",
        title: "Glioblastoma (GBM)",
        subtitle: "Most common + aggressive primary brain tumor · MAX SAFE RESECTION + RT + TEMOZOLOMIDE · MGMT methylation predicts response · median survival 15-18 mo",
        nclexTags: oncoTagR27,
        definition: AttributedProse(
            "Most common + most aggressive primary brain tumor in adults — Grade IV glioma; WHO 2021 classification — IDH-WILDTYPE glioblastoma (most common, worst prognosis), IDH-mutant astrocytoma WHO 4 (better prognosis). Median survival 15-18 months with current standard of care (surgery + radiation + temozolomide). Recurrence inevitable; new treatments + clinical trials per primary source.",
            citationIDs: ["specialty_dx_round27", "openrn_dx_round27"]
        ),
        pathophysiology: AttributedProse(
            "Multiple genetic alterations — IDH-WILDTYPE: TERT promoter mutation, EGFR amplification, PTEN loss, chromosome 7+/10−; IDH-MUTANT: IDH1/2 mutations confer better prognosis. Tumor heterogeneity + blood-brain barrier limit treatment effectiveness.",
            citationIDs: ["specialty_dx_round27"]
        ),
        presentation: [
            AttributedBullet("HEADACHE — gradually progressive; worse in morning; doesn't respond to typical analgesics.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("FOCAL NEUROLOGIC deficits — depends on location; hemiparesis, hemianesthesia, visual field defects, aphasia, cognitive decline.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("SEIZURES — new-onset seizures in adult — workup for brain tumor.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Personality / behavioral changes — frontal lobe involvement.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("INCREASED INTRACRANIAL PRESSURE — nausea, vomiting, papilledema, gait instability, decreased consciousness; late finding.", citationIDs: ["openrn_dx_round27"]),
            AttributedBullet("Risk factors — age 50-70 typically, prior cranial radiation (rare), genetic syndromes (NF1, Li-Fraumeni — rare); no clear environmental risk factors otherwise.", citationIDs: ["specialty_dx_round27"])
        ],
        diagnosticCriteria: [
            AttributedBullet("MRI BRAIN WITH GADOLINIUM — characteristic enhancing mass with central necrosis + surrounding edema (\"butterfly\" gliomas if crossing midline); FLAIR shows infiltrating non-enhancing component per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CT — useful in acute emergency; less sensitive than MRI; shows mass effect + edema + hemorrhage if present.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("TISSUE BIOPSY OR RESECTION — definitive diagnosis; histology + molecular markers (IDH, MGMT, 1p/19q codeletion for differential).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Differential — metastatic disease (more common than primary; multiple lesions), CNS lymphoma, abscess, demyelinating disease (NMO, MS tumefactive), low-grade glioma, oligodendroglioma.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("WHO 2021 classification — INTEGRATED histology + molecular profile; replaces old grading.", citationIDs: ["specialty_dx_round27"])
        ],
        priorityAssessments: [
            AttributedBullet("Neurologic examination + functional status (Karnofsky / KPS).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ICP + mass effect — emergent management.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Multidisciplinary — neurosurgery + radiation oncology + neuro-oncology + palliative care + PT/OT/SLP + social work.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("Goals of care + advance directives — early discussion essential.", citationIDs: ["specialty_dx_round27"])
        ],
        commonInterventions: [
            AttributedBullet("MAXIMUM SAFE RESECTION — neurosurgical; gross total resection associated with improved survival when feasible; awake craniotomy / intraoperative mapping for eloquent cortex.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RADIATION THERAPY — 60 Gy over 30 fractions over 6 weeks per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CONCURRENT TEMOZOLOMIDE — 75 mg/m²/day during radiation, then ADJUVANT 150-200 mg/m² × 5 days q28 days × 6+ cycles (Stupp protocol).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("MGMT METHYLATION — favorable predictor of temozolomide response; testing guides decision; about 40% methylated.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("BEVACIZUMAB — for recurrent GBM; FDA-approved.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("TUMOR TREATING FIELDS (Optune) — alternating electric fields via scalp electrodes; FDA-approved adjunct in newly diagnosed + recurrent; improves survival modestly.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CLINICAL TRIALS — multiple emerging therapies (immunotherapy, vaccines, viral therapies, CAR-T); encourage participation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PCP PROPHYLAXIS — TMP-SMX during radiation + temozolomide due to lymphopenia; CMV / HBV / HSV consideration.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("CORTICOSTEROIDS — for symptomatic vasogenic edema; dexamethasone 4-16 mg/day; minimize long-term use (Cushing, osteoporosis, diabetes).", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("ANTIEPILEPTIC — levetiracetam, lamotrigine for seizures; not prophylactic in non-seizure patients per primary source.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VTE prophylaxis — high risk in GBM; mechanical + pharmacologic + LMWH.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PALLIATIVE CARE early — symptom management + advance care planning + family support.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("REHABILITATION — PT/OT/SLP throughout treatment.", citationIDs: ["specialty_dx_round27"])
        ],
        watchFor: [
            AttributedBullet("PSEUDOPROGRESSION — increased enhancement post-radiation that resolves; can mimic progression on MRI; clinical correlation + follow-up imaging.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("RECURRENCE inevitable — median 6-9 months from initial treatment; clinical + imaging surveillance.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("STEROID side effects — long-term high-dose dexamethasone; bone, glucose, mood, infections.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("VTE — high risk; bilateral SCDs + LMWH; counsel signs.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("INFECTION — temozolomide lymphopenia + steroids + radiation; pneumocystis, HSV, CMV reactivation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("COGNITIVE + neurologic decline — counsel + supportive care; rehabilitation.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("END-OF-LIFE — palliative care + hospice; family support; symptom management; goals of care continued discussion.", citationIDs: ["specialty_dx_round27"]),
            AttributedBullet("PSYCHOSOCIAL — patient + family devastating diagnosis; mental health support + counseling.", citationIDs: ["specialty_dx_round27"])
        ],
        citations: [openrnDxR27, cdcDxR27, specialtyDxR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}
