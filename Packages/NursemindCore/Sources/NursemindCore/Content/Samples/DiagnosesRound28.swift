import Foundation

// Curator-model diagnosis entries (round 28 — pulmonary depth: ILDs + PH + occupational + pleural).

private let openrnDxR28 = CitationSource(
    id: "openrn_dx_round28",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR28 = CitationSource(
    id: "cdc_dx_round28",
    shortName: "CDC NIOSH + NHLBI + GINA + GOLD concept citations",
    publisher: "CDC NIOSH · NHLBI · GINA · GOLD",
    license: .publicDomain,
    url: "https://www.cdc.gov/niosh/topics/",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR28 = CitationSource(
    id: "specialty_dx_round28",
    shortName: "ATS + ERS + CHEST + GINA + GOLD concept citations",
    publisher: "ATS · ERS · CHEST · GINA · GOLD",
    license: .factCitationOnly,
    url: "https://www.thoracic.org/statements/",
    lastRetrieved: "2026-05-13"
)

private let ildTagR28 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)
private let occupationalTagR28 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .gasExchange)
private let phTagR28 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let pleuralTagR28 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange)

public enum NSIPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "nonspecific-interstitial-pneumonia",
        title: "Nonspecific interstitial pneumonia (NSIP)",
        subtitle: "ILD pattern · cellular + fibrotic subtypes · often CTD-associated (scleroderma, MCTD, polymyositis) · better prognosis than IPF",
        nclexTags: ildTagR28,
        definition: AttributedProse(
            "Idiopathic interstitial pneumonia characterized by homogeneous (vs IPF heterogeneous) interstitial inflammation + variable fibrosis. Cellular (mostly inflammation) vs fibrotic (predominantly fibrosis) subtypes. Often secondary to connective tissue disease (scleroderma, polymyositis, MCTD, Sjogren), drug-induced, or hypersensitivity. Better prognosis than IPF; immunosuppression often effective per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Homogeneous (uniform in time) lung involvement with varying degrees of inflammation + fibrosis. Cellular NSIP — predominantly lymphocytic + plasma cell infiltrate; fibrotic NSIP — uniform fibrosis without honeycombing or fibroblast foci. Etiology often autoimmune (CTD-NSIP) or idiopathic.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Subacute-chronic dyspnea on exertion + dry cough; weeks-months onset.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Bibasilar crackles (less prominent than IPF \"velcro\").", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Clubbing less common than IPF.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("CONNECTIVE TISSUE DISEASE features — Raynaud, skin thickening (scleroderma), arthralgia, myalgia, dry eyes/mouth, mechanic hands.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Drug exposure (amiodarone, methotrexate, nitrofurantoin, bleomycin) — screen history.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Risk factors — female, age 40-60, CTD, drug exposure, idiopathic.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HRCT — bilateral, symmetric, predominantly LOWER LOBE ground-glass opacities, reticulation, traction bronchiectasis, sparing of immediate subpleural region (vs IPF), absence of honeycombing per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("EXCLUDE CTD — ANA + ENA panel + RF + anti-CCP + myositis panel + Scl-70 + anti-Jo-1 + anti-centromere; rheumatology consult.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PFTs — restrictive pattern; reduced DLCO; serial.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("BAL — lymphocytic predominance >15% supports NSIP / HP; rules out infection / malignancy.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SURGICAL LUNG BIOPSY — if HRCT non-diagnostic; histopathology — homogeneous, uniform interstitial inflammation + fibrosis; absence of UIP features.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Multidisciplinary discussion essential.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("CONNECTIVE TISSUE DISEASE workup — comprehensive autoimmune serologies + rheumatology consult.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Drug exposure review.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Hypersensitivity pneumonitis screen — environmental exposures (birds, molds, hot tubs, humidifiers).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Functional assessment — 6MWT, PFTs, SpO2; serial.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Cellular vs fibrotic NSIP — guides treatment + prognosis.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("CORTICOSTEROIDS — prednisone 0.5-1 mg/kg/day; particularly effective for cellular NSIP + CTD-NSIP; taper over months per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("STEROID-SPARING agents — mycophenolate mofetil (preferred for scleroderma-NSIP), azathioprine, methotrexate (avoid in CTD), cyclophosphamide for severe.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RITUXIMAB — refractory cases + selected CTD-NSIP (antisynthetase syndrome).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("NINTEDANIB — approved for progressive fibrosing NSIP (INBUILD trial) per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("OXYGEN therapy — supplemental as needed; pulse oximetry monitoring.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary rehab + vaccinations + GERD treatment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Treat underlying CTD per rheumatology; immunosuppression often improves NSIP.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Lung transplant — selected severe progressive cases.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("PROGRESSION to fibrotic — worse prognosis; antifibrotics may slow.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("INFECTIONS on immunosuppression — PCP prophylaxis with high-dose / prolonged steroids.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Drug toxicity — methotrexate avoided in CTD-NSIP, mycophenolate preferred for scleroderma.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CTD systemic complications — depending on underlying disease.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Treatment response — variable; cellular NSIP often responsive, fibrotic less so.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HypersensitivityPneumonitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypersensitivity-pneumonitis",
        title: "Hypersensitivity pneumonitis (HP)",
        subtitle: "Immune-mediated ILD · antigen exposure (birds, molds, humidifiers, hot tubs) · acute/subacute/chronic · antigen avoidance + steroids",
        nclexTags: ildTagR28,
        definition: AttributedProse(
            "Immunologically-mediated interstitial lung disease from inhaled organic + chemical antigens — bird droppings (bird fancier's lung), mold (farmer's lung, hot tub lung), humidifiers, MDI workers (isocyanates). Acute, subacute, chronic phenotypes. Antigen identification + avoidance + corticosteroids + sometimes immunosuppression per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Type III + IV hypersensitivity reactions to inhaled antigens → granulomatous + lymphocytic interstitial inflammation + bronchiolitis + variable fibrosis. Chronic HP can progress to fibrotic phenotype indistinguishable from IPF.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("ACUTE — 4-12 hours after exposure: flu-like symptoms (fever, chills, malaise, myalgia), cough, dyspnea, chest tightness; resolves with avoidance.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("SUBACUTE — weeks-months: progressive cough + dyspnea + weight loss + fatigue.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("CHRONIC — months-years: insidious dyspnea + cough + clubbing + fibrosis; may not be reversible.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("EXPOSURE HISTORY — birds (pigeon, parrot, parakeet), molds, hot tubs, hay/farming, isocyanates, water-damaged buildings; thorough environmental + occupational history.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Bibasilar crackles, mid-inspiratory squeaks; clubbing in chronic.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Risk factors — antigen exposure history, smoking paradoxically protective in some studies.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HRCT — acute: ground-glass + mosaic attenuation + centrilobular nodules; chronic: peribronchovascular + upper-lobe predominant fibrosis with air-trapping per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("EXPOSURE history + serum-specific IgG (precipitating antibodies) — supportive but neither sensitive nor specific.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("BAL — LYMPHOCYTOSIS >30-40%, often with CD4:CD8 ratio inversion (<1); characteristic.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PFTs — restrictive ± obstructive (bronchiolitis); reduced DLCO.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("ENVIRONMENTAL evaluation — home / workplace assessment; remediate antigen sources.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SURGICAL LUNG BIOPSY — granulomatous bronchiolitis + lymphocytic inflammation + sometimes giant cells; chronic — fibrosis with airway-centered pattern.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Specific INHALATION challenge — research / specialized centers; rarely needed.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("THOROUGH EXPOSURE HISTORY — birds, molds, water damage, occupational, hobbies, hot tubs.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Antigen identification + removal — MOST IMPORTANT intervention.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Differentiation from IPF + NSIP — guides treatment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Multidisciplinary — pulmonologist + allergy + occupational medicine.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Chronic / fibrotic HP — assess for antifibrotics.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("ANTIGEN AVOIDANCE — paramount; remove birds, remediate molds, leave occupational exposure, clean humidifiers / hot tubs / HVAC.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CORTICOSTEROIDS — prednisone 40-60 mg PO daily for symptomatic acute / subacute; taper over months per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Steroid-sparing — mycophenolate, azathioprine for chronic / refractory.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ANTIFIBROTICS — nintedanib for fibrotic HP with progressive phenotype (INBUILD trial).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Oxygen + pulmonary rehab + vaccinations.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Lung transplant — end-stage fibrotic.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Counseling on environmental triggers + occupational changes if needed.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Symptom diary correlating exposures.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("PROGRESSION to chronic fibrotic — worse prognosis; antigen avoidance critical.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CONTINUED exposure — most common cause of treatment failure.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Misdiagnosis as IPF — exposure history retake; chronic HP can mimic UIP.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Acute episode triggers — re-exposure; antigen surveillance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Comorbidities — depression, occupational/career implications, financial.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SilicosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "silicosis",
        title: "Silicosis",
        subtitle: "Occupational pneumoconiosis · crystalline silica dust · mining, sandblasting, stone work, engineered stone · TB risk · no specific Tx",
        nclexTags: occupationalTagR28,
        definition: AttributedProse(
            "Chronic occupational lung disease from inhaled crystalline silica dust — characterized by silicotic nodules + progressive fibrosis. Strong association with mining, sandblasting, foundry work, ceramics, engineered stone countertops (recent emerging concern). Increased TB + lung cancer + autoimmune disease risk. No specific treatment — supportive + complications management per primary source.",
            citationIDs: ["specialty_dx_round28", "cdc_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Inhaled crystalline silica particles (1-3 μm) deposit in respiratory bronchioles + alveoli → engulfed by alveolar macrophages → silica is cytotoxic to macrophages → release of inflammatory mediators (TNF-α, IL-1, TGF-β) → recruit fibroblasts + collagen deposition → silicotic nodules → progressive massive fibrosis (PMF) in chronic.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("CHRONIC SIMPLE silicosis — minimal symptoms; incidental imaging finding (rounded nodules upper lobes); slowly progressive.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("CHRONIC COMPLICATED (PMF) — dyspnea, productive cough, weight loss, fatigue; coalescent fibrotic masses.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("ACCELERATED — 5-10 years high exposure; more rapid progression to fibrosis.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("ACUTE (SILICOPROTEINOSIS) — intense exposure (sandblasting); months-years; alveolar proteinosis-like; high mortality.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("OCCUPATIONAL history — sandblasting, mining, quarrying, tunneling, foundry, ceramics, engineered stone fabrication (alarming recent surge).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("INCREASED RISK — TB + nontuberculous mycobacteria, lung cancer, COPD, scleroderma + RA, ESRD.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Bibasilar crackles, clubbing (advanced), cor pulmonale features.", citationIDs: ["openrn_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EXPOSURE history — high-risk occupation; quantitative exposure assessment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CHEST X-RAY — small rounded opacities (\"q\" or \"r\" type) upper-mid lung; eggshell calcification of hilar lymph nodes (characteristic); PMF — large coalescent opacities >1 cm.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HRCT — more sensitive; small nodules + emphysema + PMF.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PFTs — restrictive ± obstructive (concomitant emphysema in smokers).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("TB SCREENING — PPD or IGRA; latent TB common; treat to prevent reactivation.", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("AUTOIMMUNE workup — ANA, RF, anti-CCP (Caplan syndrome — RA + silicosis with rapid nodular progression).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LUNG BIOPSY — rarely needed; silicotic nodules with concentric collagen + birefringent crystals.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("OCCUPATIONAL history — current + past; engineered stone countertop industry surveillance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("REMOVE from continued exposure — workers' compensation, occupational medicine referral.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("TB SCREENING + TREATMENT of latent TB — INH 9 months or rifampin 4 months per CDC.", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("LUNG CANCER SURVEILLANCE — annual low-dose CT; smoking cessation paramount.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Smoking cessation, vaccinations, pulmonary rehab.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("REMOVAL from exposure — primary intervention; OSHA standards for silica; engineering controls + respiratory protection per primary source.", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("NO specific antifibrotic therapy proven; supportive care.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary rehab + bronchodilators if obstructive component + oxygen for hypoxemia.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("TB latent treatment + ongoing surveillance (annual sx review).", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("Lung cancer screening per USPSTF + occupational guidelines.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Vaccinations — flu, pneumococcal, COVID, pertussis.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("WORKERS' COMPENSATION + occupational medicine + benefits navigation.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Lung transplant — end-stage PMF + young.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Industry surveillance — engineered stone workplaces; OSHA notification.", citationIDs: ["cdc_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("TB REACTIVATION — silicosis 30× increased TB risk; latent TB treatment + surveillance.", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("LUNG CANCER — IARC Group 1 carcinogen; surveillance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PROGRESSIVE MASSIVE FIBROSIS — 1-cm+ coalescent masses; severe functional decline.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("AUTOIMMUNE — scleroderma, RA (Caplan), SLE, ANCA-vasculitis.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("KIDNEY — increased ESRD + chronic kidney disease + glomerulonephritis.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ENGINEERED STONE epidemic — countertop fabrication; rapid progressive silicosis in young workers; OSHA enforcement.", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("Cor pulmonale + heart failure end-stage.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AsbestosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "asbestosis",
        title: "Asbestosis + asbestos-related disease",
        subtitle: "Pleural plaques + parenchymal fibrosis · prior asbestos exposure (decades latency) · mesothelioma + lung cancer increased · no specific Tx",
        nclexTags: occupationalTagR28,
        definition: AttributedProse(
            "Asbestos-related lung diseases — asbestosis (parenchymal fibrosis), pleural plaques, pleural thickening, benign effusions, malignant mesothelioma, lung cancer. Decades latency (20-40 years post exposure). No specific treatment for asbestosis itself; surveillance + cessation of further exposure + cancer screening per primary source.",
            citationIDs: ["specialty_dx_round28", "cdc_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Inhaled asbestos fibers (amphibole especially crocidolite > chrysotile) → deposit in alveoli + peribronchiolar regions → ferruginous bodies → macrophage phagocytosis + cytokine release → progressive fibrosis with bilateral lower lobe predominance + pleural disease. Mesothelium susceptible to cancer (mesothelioma) + synergistic with smoking for lung cancer.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Insidious dyspnea on exertion (decades after exposure) + dry cough + bibasilar crackles + clubbing (advanced).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("PLEURAL PLAQUES — usually asymptomatic; incidental finding; calcified parietal pleura.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("BENIGN ASBESTOS PLEURAL EFFUSION — within decades post exposure; exudative; sometimes recurrent.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("MALIGNANT MESOTHELIOMA — pleural pain, chest wall mass, weight loss, dyspnea; aggressive; poor prognosis.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LUNG CANCER — multiplicative risk with smoking (50-90×); same presentation as other lung cancers.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Occupational history — shipyards, asbestos mining, insulation, construction, fireproofing, brakes, military (esp Navy), pre-1980s; second-hand exposure (workers' families).", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EXPOSURE history — quantitative; latency typically >15-20 years.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CHEST X-RAY — bibasilar reticular opacities; pleural plaques (calcified); diaphragmatic plaques; bilateral pleural thickening.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HRCT — more sensitive; subpleural curvilinear lines, septal thickening, ground-glass; pleural plaques; honeycombing in advanced.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PFTs — restrictive pattern + reduced DLCO.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("LUNG BIOPSY — ferruginous bodies (asbestos with iron coating) + fibrosis; rarely needed.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pleural fluid analysis — exudative for benign effusion; cytology + biopsy if suspecting mesothelioma (often requires VATS biopsy).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("MESOTHELIOMA workup — CT, pleural biopsy (calretinin + WT1 + cytokeratin 5/6 positive; CEA + TTF-1 negative), PET-CT, MRI.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("OCCUPATIONAL + environmental history — shipyards, construction, military (especially Navy), insulation, brake mechanics.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("REMOVAL from continued exposure (rare today).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SMOKING cessation — paramount given synergistic cancer risk.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Cancer surveillance — low-dose chest CT, monitoring for mesothelioma symptoms.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Multidisciplinary — pulmonology, oncology, occupational medicine, legal (workers' compensation, asbestos litigation).", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("NO specific treatment for asbestosis fibrosis itself; supportive care.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("OXYGEN therapy for hypoxemia; pulmonary rehab.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Smoking cessation — REPEATED counseling; pharmacotherapy.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Vaccinations — flu, pneumococcal, COVID, pertussis.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LUNG CANCER SCREENING — annual low-dose CT in eligible per USPSTF + occupational guidelines.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("MESOTHELIOMA — multimodal therapy (surgery, chemo, radiation, immunotherapy); poor median survival 12-18 months.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("WORKERS' COMPENSATION + legal — asbestos trust funds, occupational disease claims.", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("Lung transplant — selected for end-stage fibrosis.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("MESOTHELIOMA — life-long risk after exposure; chest pain, dyspnea, weight loss; emergent workup.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LUNG CANCER — multiplicative risk with smoking; lifetime cancer surveillance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PROGRESSIVE FIBROSIS — slow over decades; functional decline.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PLEURAL DISEASE — recurrent effusions; sometimes requires drainage / pleurodesis.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PSYCHOSOCIAL — anxiety about cancer risk; counseling.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Cor pulmonale + heart failure — end-stage.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SECONDARY EXPOSURE — household members (laundering work clothes); historical.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MesotheliomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "mesothelioma",
        title: "Malignant pleural mesothelioma",
        subtitle: "Asbestos-related cancer of pleura · decades latency · aggressive · multimodal therapy · poor prognosis 12-18 mo median survival",
        nclexTags: ildTagR28,
        definition: AttributedProse(
            "Malignant cancer of mesothelial cells lining pleura (most common), peritoneum, pericardium, tunica vaginalis. >85% asbestos-related; 20-50 year latency. Epithelioid (best prognosis), biphasic, sarcomatoid subtypes. Aggressive disease; multimodal therapy (surgery, chemo, immunotherapy, radiation); median survival 12-18 months per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Asbestos fibers reach pleural surfaces → chronic inflammation + DNA damage in mesothelial cells → malignant transformation. Genetic predispositions (BAP1 germline mutations) accelerate. Pleural mesothelioma — pleural thickening + nodular masses + effusion; locally invasive into chest wall + lung + mediastinum.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Chest pain (often pleuritic, non-positional) — common.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Dyspnea (often progressive); pleural effusion.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Constitutional — weight loss, fatigue, sweats.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Cough (typically non-productive), supraclavicular adenopathy, chest wall mass (advanced).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Asbestos exposure history — shipyards, construction, military (Navy), insulation, mining; latency 20-50 years.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Risk factors — age >60, male, asbestos exposure, BAP1 mutation, prior radiation, simian virus 40 (controversial).", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CHEST IMAGING — CT: pleural thickening, nodularity, effusion, mediastinal involvement; PET-CT: increased uptake; MRI: chest wall + diaphragm invasion assessment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PLEURAL FLUID analysis — exudative, often bloody; cytology positive in only 30-50%; cytology alone insufficient.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("TISSUE BIOPSY — preferred: VATS or open biopsy; immunohistochemistry — calretinin + WT1 + cytokeratin 5/6 + D2-40 positive; CEA + TTF-1 negative (vs adenocarcinoma).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HISTOLOGIC SUBTYPES — epithelioid (~70%, best prognosis), biphasic (mixed), sarcomatoid (worst).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("STAGING — TNM system; resectability assessment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("GENETIC — BAP1 germline mutation testing especially if young / multiple cancers.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("Multidisciplinary thoracic oncology evaluation — surgical oncology + medical oncology + radiation oncology + palliative care.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RESECTABILITY assessment — extrapleural pneumonectomy (EPP) vs pleurectomy/decortication (P/D); selected patients.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Asbestos exposure documentation — workers' compensation, legal asbestos trust funds.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Performance status + comorbidities — guide aggressiveness.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Early palliative care referral.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("CHEMOTHERAPY — first-line — cisplatin + pemetrexed (often + bevacizumab); or nivolumab + ipilimumab (CheckMate-743 trial showed survival benefit) per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("IMMUNOTHERAPY — nivolumab + ipilimumab combination — first-line standard for unresectable disease; pembrolizumab single-agent option.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SURGERY — extrapleural pneumonectomy (EPP) vs pleurectomy/decortication (P/D); selected epithelioid + early stage; controversial.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RADIATION — intensity-modulated radiation therapy (IMRT) after surgery; palliative for symptoms.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PLEUROCENTESIS / PLEURODESIS — symptomatic effusion management.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PALLIATIVE CARE — pain management, dyspnea, end-of-life planning; integrated early.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Clinical trials — encourage participation; immunotherapy + targeted therapy advances ongoing.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Legal — asbestos trust funds, workers' comp; financial counseling.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("POOR PROGNOSIS — median survival 12-18 months untreated; up to 24-36 months with multimodal therapy in selected patients.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LOCAL PROGRESSION — chest wall invasion, mediastinal involvement, diaphragm; pain refractory.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RECURRENT PLEURAL EFFUSIONS — palliation with pleurodesis or indwelling pleural catheter.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PAIN — chest wall invasion; multimodal pain management; nerve blocks; opioids; radiation.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PSYCHOSOCIAL — anger / grief / depression related to occupational cause; support resources.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("FAMILY screening — second-hand exposure (laundering); reassurance + minimal added risk.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CTEPHSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cteph",
        title: "Chronic thromboembolic pulmonary hypertension (CTEPH)",
        subtitle: "Persistent thromboembolic obstruction · post-PE · operable with pulmonary endarterectomy CURE · riociguat + balloon angioplasty for inoperable",
        nclexTags: phTagR28,
        definition: AttributedProse(
            "Pulmonary hypertension from persistent thromboembolic obstruction of pulmonary arteries — sequelae of acute pulmonary embolism (PE). Pulmonary endarterectomy (PEA / PTE) is POTENTIALLY CURATIVE in operable patients. Riociguat (Adempas) is only FDA-approved medical therapy for inoperable / persistent. Balloon pulmonary angioplasty for inoperable per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Pulmonary embolism in ~2-4% of patients fails to resolve → organization + endothelialization of thromboembolic material → fibrous occlusive lesions in pulmonary arteries → increased pulmonary vascular resistance → pulmonary hypertension + right heart failure. Distal small vessel disease in some.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Progressive exertional dyspnea — months-years after PE; often unrecognized as PH initially.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Exercise intolerance, fatigue, syncope.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Right heart failure features — JVD, hepatomegaly, edema, ascites (advanced).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("History of acute PE — symptomatic or unprovoked DVT/PE (~75% of CTEPH); subacute presentation common.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Hypercoagulable factors — antiphospholipid syndrome (~10%), thrombophilia, malignancy, family history.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Cardiac auscultation — accentuated P2, right-sided S4, tricuspid regurgitation murmur.", citationIDs: ["openrn_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("V/Q SCAN — gold standard screen; mismatched perfusion defects (segmental + larger) at least 3 months post anticoagulated PE; high sensitivity per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CT PULMONARY ANGIOGRAPHY — chronic thromboembolic lesions (eccentric / mural / webs / pouching); pulmonary artery dilation; right ventricular enlargement.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("DIRECT PULMONARY ANGIOGRAPHY — diagnostic + operability assessment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RIGHT HEART CATHETERIZATION — confirms pre-capillary PH (mPAP ≥25 mm Hg, PVR ≥2 Wood units, PCWP ≤15 mm Hg per current definitions); hemodynamic assessment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ECHO — pulmonary hypertension features; estimates PASP; right ventricular function.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HYPERCOAGULABILITY workup — antiphospholipid antibodies, factor V Leiden, prothrombin gene, protein C/S, antithrombin.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("EXERCISE TESTING — 6MWT; cardiopulmonary exercise test for functional assessment.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("CONSIDER CTEPH in any patient with unexplained PH or post-PE persistent dyspnea — frequently UNDERDIAGNOSED.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Refer to PH expert center early.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("OPERABILITY assessment — surgical evaluation at expert center; proximal accessible disease = operable.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HYPERCOAGULABILITY workup + lifelong anticoagulation.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Right heart function + comorbidity assessment.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("PULMONARY ENDARTERECTOMY (PEA) — POTENTIALLY CURATIVE for operable proximal disease; performed at expert centers; deep hypothermic circulatory arrest; long-term survival >80% per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LIFELONG ANTICOAGULATION — warfarin INR 2-3 OR DOAC; even after successful PEA.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RIOCIGUAT (Adempas) — only FDA-approved medical therapy for inoperable or persistent/recurrent CTEPH after PEA per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("BALLOON PULMONARY ANGIOPLASTY (BPA) — emerging for inoperable patients; expert centers; multiple sessions.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Oxygen + diuretics for right heart failure.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary rehab + symptom management.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Lung transplant — selected end-stage refractory.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Hypercoagulable disorder management — antiphospholipid syndrome long-term anticoagulation.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("UNDERDIAGNOSIS — high index of suspicion after PE; routine V/Q at 3-6 months post PE if persistent symptoms.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PEA COMPLICATIONS — reperfusion pulmonary edema, hemoptysis, residual PH, mortality 2-5% at expert centers.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PERSISTENT / RECURRENT PH post-PEA — riociguat + BPA + transplant.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RIGHT HEART FAILURE — diuresis, oxygen, lifestyle, hospice in end-stage.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ANTIPHOSPHOLIPID SYNDROME — common comorbidity; bridging considerations.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("BLEEDING on lifelong anticoagulation — monitor; bleeding mitigation strategies.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CorPulmonaleSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "cor-pulmonale",
        title: "Cor pulmonale",
        subtitle: "Right heart failure from chronic pulmonary disease · COPD + ILD + PAH common causes · oxygen + diuretics · treat underlying lung disease",
        nclexTags: phTagR28,
        definition: AttributedProse(
            "Right ventricular hypertrophy + dilation + eventually failure secondary to chronic pulmonary disease causing pulmonary hypertension. Causes — COPD (most common), ILD, PAH, chronic hypoxemia, OSA, chest wall disease, neuromuscular. Treatment focuses on underlying lung disease + oxygen + diuretics + PAH therapies when applicable per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Chronic hypoxemia + pulmonary vascular disease → pulmonary vasoconstriction + vascular remodeling → elevated pulmonary vascular resistance → right ventricular pressure overload → RV hypertrophy → eventually dilation + dysfunction + failure. Hypercapnic acidosis worsens. Polycythemia from chronic hypoxia adds blood viscosity.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Dyspnea on exertion + fatigue + reduced exercise tolerance.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Lower extremity EDEMA (often pitting, dependent).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("HEPATOMEGALY + abdominal distension + ASCITES (advanced).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("JVD, hepatojugular reflux, parasternal heave (RV impulse).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Accentuated pulmonic component of S2; right-sided S3 / S4; tricuspid regurgitation murmur.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Cyanosis (peripheral or central); CLUBBING.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Underlying lung disease — COPD, ILD, PAH features.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Risk factors — chronic hypoxemia, COPD, ILD, PE history, OSA, chronic mountain sickness.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECG — right axis deviation, P pulmonale (peaked P in II, III, aVF), RV hypertrophy (R > S in V1), incomplete RBBB.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("CHEST X-RAY — RV enlargement; prominent main pulmonary artery; pulmonary disease features.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("ECHOCARDIOGRAM — RV hypertrophy, dilation, dysfunction, TR jet estimates PASP; gold standard non-invasive.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("RIGHT HEART CATHETERIZATION — definitive hemodynamic confirmation; pre-capillary PH (PCWP normal); rules out left heart contribution.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PFTs — assess underlying lung disease severity.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("ABG / SpO2 — chronic hypoxemia + hypercapnia.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("BNP / NT-proBNP elevated; CBC for polycythemia.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("V/Q scan + CTPA — exclude PE / CTEPH.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("Identify + treat UNDERLYING lung disease — COPD optimization, ILD therapy, OSA treatment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Chronic OXYGEN therapy — confirmed hypoxemia (PaO2 ≤55 mm Hg OR SpO2 ≤88% on room air); LTOT improves survival in COPD per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Right heart cath if PAH suspected.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Smoking cessation + vaccinations + pulmonary rehab.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary specialist referral.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("LONG-TERM OXYGEN therapy (LTOT) — ≥15 hours/day improves survival in chronic hypoxemic COPD (NOTT + MRC trials) per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("DIURETICS — for edema + hepatic congestion + ascites; loop diuretic + spironolactone; cautious diuresis to avoid hypovolemia (RV preload-dependent).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("TREATMENT of underlying lung disease — inhalers for COPD, antifibrotics for IPF, immunosuppression for sarcoid, anticoagulation for CTEPH, CPAP for OSA.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PAH THERAPIES — ONLY if Group 1 PH (PAH) confirmed by RHC; not for COPD-related Group 3 PH (no benefit + may worsen V/Q matching).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PHLEBOTOMY — for symptomatic erythrocytosis (Hct >55-60); cautious.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Vaccinations — flu, pneumococcal, COVID, pertussis annual.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary rehabilitation + exercise training.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Heart-lung or lung transplant — selected end-stage younger patients.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Palliative care + advance care planning.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("ACUTE DECOMPENSATION — infection, PE, arrhythmia, MI; right heart failure exacerbation; emergent.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HYPOVOLEMIA from excessive diuresis — RV preload-dependent; cautious dosing.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ARRHYTHMIAS — atrial fibrillation, multifocal atrial tachycardia common; treat triggers.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("WORSENING HYPOXEMIA from sedatives, opioids; counsel.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("POLYCYTHEMIA — viscosity-related stroke + DVT; monitor + treat.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("END-STAGE — palliative care; opioids for dyspnea + anxiety; hospice.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BronchiectasisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "bronchiectasis",
        title: "Bronchiectasis (non-cystic-fibrosis)",
        subtitle: "Permanent airway dilation · chronic productive cough + recurrent infections · post-infectious + autoimmune + immunodeficiency · airway clearance",
        nclexTags: ildTagR28,
        definition: AttributedProse(
            "Chronic respiratory disease with irreversible dilation of bronchi due to inflammatory destruction of airway walls. Causes — post-infectious (TB, pertussis, viral), autoimmune (RA, IBD-associated), immunodeficiency, primary ciliary dyskinesia, ABPA, idiopathic. Treatment — airway clearance + antibiotics + treatment of underlying cause + sometimes surgical resection per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "\"Vicious cycle\" hypothesis — initial insult (infection, immune dysfunction, mucociliary failure) → impaired mucociliary clearance → chronic infection + colonization (Pseudomonas, H. influenzae, S. aureus, NTM) → neutrophilic inflammation → proteases damage airway walls → progressive bronchial dilation + destruction.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("CHRONIC DAILY PRODUCTIVE COUGH — large volumes mucopurulent sputum; characteristic.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Recurrent respiratory infections + exacerbations; hemoptysis (variable from minor to massive).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Dyspnea, fatigue, wheezing, weight loss in advanced.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Coarse crackles + wheezing + clubbing (variable).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Underlying disease history — childhood pneumonia, pertussis, TB, IBD, RA, primary ciliary dyskinesia (chronic sinusitis + infertility), immunoglobulin deficiency.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HRCT — bronchial dilation + lack of tapering + visible airways within 1 cm of pleural surface; signet ring sign (dilated bronchus > adjacent artery); cylindrical/varicose/cystic patterns per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ETIOLOGY workup — sweat chloride + CFTR gene (CF screen even in adults), sputum cultures (bacterial + AFB + fungal), immunoglobulin levels (IgG, IgA, IgM), ANCA + ANA + RF + anti-CCP, alpha-1 antitrypsin, ciliary biopsy if PCD suspected.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PFTs — obstructive ± mixed pattern; reduced FEV1; monitor decline.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Sputum surveillance — bacterial pathogens (Pseudomonas, H. influenzae, S. aureus, NTM); guides antibiotic choice.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Severity scores — Bronchiectasis Severity Index (BSI), FACED score.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("ETIOLOGY WORKUP — identify underlying cause guides treatment.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SPUTUM CULTURE — bacterial + AFB + fungal; Pseudomonas eradication if first isolated.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Multidisciplinary care — pulmonologist + infectious disease + respiratory therapist.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Vaccinations — flu, pneumococcal, COVID, pertussis annual.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Smoking cessation + nutrition.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("AIRWAY CLEARANCE — daily; methods — high-frequency chest wall oscillation (HFCWO vest), oscillatory PEP (Acapella, Flutter), autogenic drainage, postural drainage + percussion; SCALE based on patient + tolerability per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HYPERTONIC SALINE 7% nebulized — improves clearance; pre-airway clearance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("BRONCHODILATORS — short-acting + long-acting if obstructive component; pre-airway clearance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ANTIBIOTICS for exacerbations — culture-guided; 10-14 day courses; oral or IV.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PSEUDOMONAS ERADICATION — first isolation — aggressive oral ciprofloxacin + inhaled tobramycin/colistin × 2-3 months.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CHRONIC SUPPRESSIVE INHALED ANTIBIOTICS — tobramycin, colistin, aztreonam, gentamicin for chronic Pseudomonas; alternating cycles.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("AZITHROMYCIN — chronic 3× weekly anti-inflammatory; reduces exacerbations; QTc + hearing monitoring; NTM exclusion before starting.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("NTM — Mycobacterium avium complex; multidrug regimen (azithromycin + ethambutol + rifampin/rifabutin) × 18+ months.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HEMOPTYSIS — minor: rest + transamine acid; massive: bronchial artery embolization + lobectomy.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Surgical RESECTION — selected focal disease + refractory.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Lung transplant — end-stage.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary rehab + nutrition.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("EXACERBATIONS — increased cough, purulence, dyspnea; culture + antibiotics.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PSEUDOMONAS COLONIZATION — accelerates decline; eradicate when possible.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("NTM INFECTION — chronic mycobacterial colonization complicates; multidrug Tx + monitoring.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("MASSIVE HEMOPTYSIS — emergency; bronchial artery embolization; airway protection.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PROGRESSIVE FEV1 decline; functional limitation.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("QUALITY OF LIFE — chronic productive cough impact; psychosocial support.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Vaccinations + infection prevention paramount.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ABPASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "abpa",
        title: "Allergic bronchopulmonary aspergillosis (ABPA)",
        subtitle: "Aspergillus hypersensitivity in asthma + CF · IgE elevated + central bronchiectasis · steroids + itraconazole · biologics emerging",
        nclexTags: ildTagR28,
        definition: AttributedProse(
            "Complex hypersensitivity reaction to Aspergillus fumigatus colonizing the airways — predominantly in asthma + cystic fibrosis patients. Characterized by IgE elevation, eosinophilia, central bronchiectasis, transient pulmonary infiltrates. Corticosteroids ± itraconazole; emerging role for anti-IgE (omalizumab) + anti-IL5 biologics per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Aspergillus fumigatus spores colonize airway lumen (not invasive) → Th2 + Th17 immune response in genetically susceptible (HLA-DR2, HLA-DR5) → IgE-mediated immediate + IgG-mediated late hypersensitivity → eosinophilic + neutrophilic inflammation → airway damage + central bronchiectasis + mucoid impaction.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Difficult-to-control ASTHMA — frequent exacerbations, steroid-dependent, brown mucus plugs (mycelial casts).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("CYSTIC FIBROSIS — worsening pulmonary function, exacerbations.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Cough, sputum production, wheeze, hemoptysis (variable).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Constitutional — low-grade fever, fatigue, weight loss during exacerbations.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Risk factors — asthma (especially severe), CF, atopic predisposition, environmental Aspergillus exposure.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ROSENBERG-PATTERSON OR ISHAM criteria — main criteria — asthma OR CF, central bronchiectasis, immediate skin test reactivity to A. fumigatus, elevated total IgE >1000 IU/mL, elevated A. fumigatus-specific IgE + IgG, eosinophilia >500 cells/μL, fleeting infiltrates on CXR per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("TOTAL serum IgE — elevated; serial monitoring tracks activity.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ASPERGILLUS-specific IgE + IgG (precipitins) — positive.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HRCT — CENTRAL bronchiectasis (proximal airways), mucoid impaction (\"finger-in-glove\" sign), fleeting transient infiltrates.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("EOSINOPHILIA peripheral blood + sputum.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Skin prick test — immediate hypersensitivity to A. fumigatus extract.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("STAGES — acute, remission, recurrent exacerbation, steroid-dependent, fibrotic end-stage.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("Asthma + CF severity + control — pivotal.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("IgE level monitoring — trend reflects activity.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Environmental Aspergillus exposure — mold remediation, environmental control.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Multidisciplinary — pulmonologist + allergy + ID.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Differentiate from invasive aspergillosis (immunocompromised) + chronic pulmonary aspergillosis (cavitary structural lung disease).", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("ORAL CORTICOSTEROIDS — cornerstone; prednisone 0.5 mg/kg PO daily × 2 weeks → 0.5 mg/kg every other day × 6-8 weeks → taper based on clinical + IgE response per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ITRACONAZOLE — 200 mg PO BID × 16+ weeks; reduces Aspergillus burden + steroid requirement; monitor LFTs + drug interactions.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ALTERNATIVE AZOLES — voriconazole, posaconazole for itraconazole intolerance / resistance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ASTHMA optimization — high-dose ICS + LABA + LAMA + rescue inhalers; SMART therapy.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("OMALIZUMAB (anti-IgE) — selected severe ABPA; reduces steroid burden.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("MEPOLIZUMAB + BENRALIZUMAB (anti-IL5/IL5R) — emerging for eosinophilic ABPA.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ENVIRONMENTAL — reduce mold exposure; air filtration; avoid damp / mouldy environments.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("AIRWAY CLEARANCE — for mucoid impaction; sometimes bronchoscopic clearance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CF-specific — ABPA in CF can mimic exacerbation; intensify management.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("EXACERBATIONS — rising IgE, new infiltrates, eosinophilia; reinitiate steroids.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("FIBROTIC end-stage — irreversible damage; respiratory failure.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CHRONIC steroid toxicity — bone density, glucose, cataracts, infections.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("AZOLE drug interactions — extensive CYP3A4 (calcineurin inhibitors, statins, anticoagulants).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("AZOLE HEPATOTOXICITY — monitor LFTs; discontinue if elevated.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("DISTINGUISH from invasive aspergillosis (immunocompromised, biopsy positive, urgent) + chronic cavitary aspergillosis (structural lung disease).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("MUCUS PLUGGING — atelectasis, hemoptysis.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum StatusAsthmaticusSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "status-asthmaticus",
        title: "Status asthmaticus (life-threatening asthma exacerbation)",
        subtitle: "Refractory bronchospasm · respiratory failure imminent · continuous SABA + IV mag + IV steroids · ICU + intubation imminent",
        nclexTags: ildTagR28,
        definition: AttributedProse(
            "Severe, refractory acute asthma exacerbation that does not respond to standard initial bronchodilator therapy — life-threatening respiratory failure imminent. Defined clinically by severe symptoms, hypoxemia, hypercapnia (late + ominous), exhaustion, silent chest. Requires emergent + intensive multimodal therapy + often ICU admission per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Acute severe airway inflammation + bronchospasm + mucus plugging → severe airflow obstruction → V/Q mismatch + hypoxemia + air trapping + hyperinflation + increased work of breathing → respiratory muscle fatigue → hypercapnia + respiratory failure. Triggers — infection, allergen, medication noncompliance, aspirin/NSAIDs in sensitive, smoke, cold.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("SEVERE DYSPNEA — single-word phrases / cannot speak; orthopnea; tripod position.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Tachycardia >120, tachypnea >30, accessory muscle use, retractions, paradoxical breathing.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("DIAPHORESIS, agitation / confusion, exhaustion (late + ominous).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("WHEEZING — variable; SILENT CHEST is ominous (no airflow).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("CYANOSIS, decreased mental status, lethargy.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("PULSUS PARADOXUS >12 mm Hg indicates severe obstruction.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("PEAK FLOW <50% personal best or predicted; <33% severe; <25% life-threatening.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("SpO2 <92%; ABG — early respiratory alkalosis → normal CO2 (fatigue) → hypercapnia (failure).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Risk factors — prior intubation / ICU, ≥2 hospitalizations / year, low SES, mental illness, food allergy, drug allergy.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — severe symptoms + failure to respond to initial bronchodilators after 1 hour.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PEAK FLOW <50% personal best / predicted.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SpO2 + ABG — hypoxemia + initial alkalosis; rising CO2 = impending failure.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CXR — usually clear; rules out pneumonia, pneumothorax, atelectasis, foreign body.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CBC, CMP, BNP if cardiac concern.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Bedside ULTRASOUND — rule out pneumothorax.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Triggers identification — recent illness, exposure, medication compliance.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("RESPIRATORY STATUS — work of breathing, mental status, pulse ox, ABG; deterioration → ICU + intubation.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Continuous monitoring — telemetry, pulse ox, frequent vitals.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("AIR FLOW assessment — peak flow + clinical; serial response to therapy.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("IDENTIFY trigger — pneumonia, allergen, exposure, medication noncompliance.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ICU + airway team early notification.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("OXYGEN — high-flow O2; titrate SpO2 ≥94%.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CONTINUOUS SABA — albuterol 2.5-5 mg nebulized continuously × 1 hour, then q15-30 min as tolerated; +/- ipratropium 0.5 mg q20 min × 3 doses then q4 hours per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("SYSTEMIC CORTICOSTEROIDS — methylprednisolone 1-2 mg/kg IV q6 hours (max 60-125 mg/dose) OR prednisone 1 mg/kg PO; benefit at 4-6 hours per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("IV MAGNESIUM SULFATE — 2 g IV over 20 minutes; bronchodilator + smooth muscle relaxant; refractory cases per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HELIOX (helium-oxygen mixture) — 70:30 or 80:20; reduces work of breathing in refractory; bridging therapy.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("EPINEPHRINE (1:1000) — 0.3-0.5 mg IM in extreme cases or anaphylaxis component.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("KETAMINE — 1-2 mg/kg IV; bronchodilator effect; consider for intubation drug + bronchodilator.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("INTUBATION + mechanical ventilation — for refractory respiratory failure, exhaustion, hypercapnia; ketamine for induction; lung-protective ventilation (low TV, permissive hypercapnia, slow rates) to minimize air trapping per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ANTIBIOTICS — only if bacterial trigger evidence.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ICU admission — most cases requiring continuous SABA + IV magnesium + impending intubation.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Avoid — sedatives (suppress respiration), beta-blockers, NSAIDs in sensitive.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("IMPENDING RESPIRATORY FAILURE — silent chest, decreased mental status, rising CO2, exhaustion → emergent intubation.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PNEUMOTHORAX from severe air trapping + barotrauma; CXR + bedside US.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("AIR TRAPPING + dynamic hyperinflation — auto-PEEP; ventilator strategy with low rate, permissive hypercapnia, prolonged expiration.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HYPOTENSION — air trapping reduces preload; hypovolemia common; fluids + vasopressors.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LACTIC ACIDOSIS — high-dose beta-agonist effect; transient + reversible.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("STEROID side effects — hyperglycemia, hypokalemia, mood, infection susceptibility.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("DISCHARGE planning — comprehensive education, asthma action plan, controller medication, peak flow meter, follow-up.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PleuralEffusionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pleural-effusion",
        title: "Pleural effusion",
        subtitle: "Fluid in pleural space · transudate (CHF, cirrhosis) vs exudate (pneumonia, malignancy, PE, TB) · Light's criteria · thoracentesis",
        nclexTags: pleuralTagR28,
        definition: AttributedProse(
            "Abnormal accumulation of fluid in the pleural space — most commonly from CHF (transudate), pneumonia (parapneumonic), malignancy, pulmonary embolism, TB, autoimmune. Categorized as transudate (low protein/LDH from systemic factors) vs exudate (high protein/LDH from local pleural pathology) using Light's criteria. Drainage indicated for symptoms, diagnostic uncertainty, or complications per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Imbalance between fluid production + drainage in pleural space. TRANSUDATE — increased hydrostatic pressure (CHF) or decreased oncotic pressure (cirrhosis, nephrotic); normal capillary permeability. EXUDATE — increased capillary permeability from inflammation / infection / malignancy / decreased lymphatic drainage.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Dyspnea (often progressive); pleuritic chest pain (more in exudative); cough.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Decreased breath sounds + dullness to percussion + decreased fremitus over effusion.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Egophony (\"E\" sounds like \"A\") + bronchial breath sounds at compressed lung above effusion.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Trachea may DEVIATE AWAY from large effusion.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Causal disease features — CHF (JVD, edema, S3), cirrhosis (ascites, jaundice), pneumonia (fever, productive cough), malignancy (weight loss, smoking history), PE (sudden dyspnea, leg swelling).", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Risk factors based on cause.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CHEST X-RAY — blunting of costophrenic angle (>200 mL); large effusions can opacify hemithorax with meniscus sign.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ULTRASOUND — sensitive for small effusions; guides thoracentesis safety; identifies septations.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CT CHEST — detailed anatomy; underlying causes (pneumonia, mass, embolus).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("THORACENTESIS — diagnostic + therapeutic; pleural fluid analysis per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("LIGHT'S CRITERIA — EXUDATE if ANY: (1) pleural fluid protein / serum protein >0.5, (2) pleural fluid LDH / serum LDH >0.6, (3) pleural fluid LDH > 2/3 upper limit normal serum LDH.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PLEURAL FLUID workup — cell count + differential, glucose, pH, LDH, protein, cytology (malignancy), gram stain + culture + AFB, amylase (pancreatic), triglycerides (chylothorax), adenosine deaminase (ADA — TB).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("APPEARANCE — clear (transudate), cloudy (parapneumonic), hemorrhagic (malignancy, PE, trauma), milky (chylothorax), purulent (empyema), pH <7.2 (parapneumonic effusion needing drainage).", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("RESPIRATORY status — SpO2, respiratory rate, work of breathing, mental status.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Diagnostic thoracentesis — for new effusions where cause uncertain OR therapeutic for symptomatic.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Light's criteria classification — transudate vs exudate.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Identify underlying cause + treat.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary specialist if complex; thoracic surgery for empyema or trapped lung.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("THORACENTESIS — diagnostic + therapeutic; ultrasound-guided preferred; max 1.5 L at one time (re-expansion pulmonary edema risk).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("TRANSUDATE — treat underlying disease (diurese for CHF, treat cirrhosis); rarely needs drainage unless symptomatic.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PARAPNEUMONIC EFFUSION — drainage if complicated (pH <7.2, glucose <60, positive culture, gross pus); chest tube; consider VATS / decortication for empyema.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("MALIGNANT EFFUSION — recurrence common; indwelling pleural catheter (PleurX) for repeated drainage; pleurodesis (talc) for recurrent symptomatic.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CHYLOTHORAX — pleural fluid triglycerides >110 mg/dL; low-fat diet + medium-chain triglycerides; somatostatin; surgical ligation refractory.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("HEMOTHORAX — chest tube; thoracic surgery for >1500 mL or persistent bleeding.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("TB pleurisy — anti-TB chemotherapy; usually resolves with treatment.", citationIDs: ["cdc_dx_round28"]),
            AttributedBullet("FIBRINOLYTICS (tPA + DNase) — intrapleural for loculated parapneumonic effusion / empyema (MIST-2 trial).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Oxygen + symptomatic management.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Underlying disease treatment (CHF, infection, malignancy).", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("RE-EXPANSION PULMONARY EDEMA — large rapid drainage (>1.5 L); slow drainage prevents; CPAP/intubation if occurs.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PNEUMOTHORAX from thoracentesis — risk ~5-10%; bedside US-guided + post-procedure imaging.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("EMPYEMA — purulent or organizing infection requiring drainage + sometimes VATS.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("MALIGNANT recurrence — pleurodesis + indwelling catheter; palliative care.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Diagnostic uncertainty after first thoracentesis — pleural biopsy + thoracoscopy.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Trapped lung — failure to re-expand; pleural fluid persists; difficult management.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EmpyemaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "empyema-thoracic",
        title: "Empyema (pleural space infection)",
        subtitle: "Pus in pleural space · post-pneumonia complicated parapneumonic · CHEST TUBE + IV antibiotics · VATS / decortication if loculated",
        nclexTags: pleuralTagR28,
        definition: AttributedProse(
            "Infection of the pleural space with frank pus, positive gram stain, or culture-confirmed bacterial growth. Most often complicates pneumonia (10% of parapneumonic effusions). Treatment requires IV antibiotics + chest tube drainage + sometimes intrapleural fibrinolytics or VATS / decortication for organized disease per primary source.",
            citationIDs: ["specialty_dx_round28", "openrn_dx_round28"]
        ),
        pathophysiology: AttributedProse(
            "Three stages — exudative (free-flowing infected fluid), fibrinopurulent (fibrin deposition + loculations), organizing (thick rind / peel + trapped lung). Bacterial pathogens — Streptococcus pneumoniae, anaerobes, S. aureus (incl MRSA), gram-negatives, Klebsiella, Pseudomonas in hospital-acquired.",
            citationIDs: ["specialty_dx_round28"]
        ),
        presentation: [
            AttributedBullet("Persistent or recurrent fever DESPITE antibiotics for pneumonia.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Pleuritic chest pain + dyspnea + productive cough; weight loss + malaise.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Decreased breath sounds + dullness + tactile fremitus over effusion.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Sepsis features — tachycardia, tachypnea, hypotension if severe.", citationIDs: ["openrn_dx_round28"]),
            AttributedBullet("Risk factors — pneumonia (especially severe / inadequately treated), aspiration, alcohol use disorder, IVDU, diabetes, immunosuppression, chest trauma, post-surgical, esophageal rupture.", citationIDs: ["specialty_dx_round28"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CT CHEST — split pleura sign (enhancing visceral + parietal pleura with fluid between), loculations, pleural thickening; differentiates loculated empyema from free effusion.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ULTRASOUND — identifies loculations, septations, guides drainage.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PLEURAL FLUID — empyema defined by: frank pus, positive gram stain OR culture, OR complicated parapneumonic effusion: pH <7.2, glucose <60 mg/dL, LDH >1000 IU/L per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CULTURES — aerobic + anaerobic; sensitivity guides antibiotic choice.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("BLOOD CULTURES + sputum cultures.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CBC + procalcitonin + lactate.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Underlying cause workup — TB testing (especially HIV+, immigrant), esophageal rupture (Boerhaave), malignancy.", citationIDs: ["specialty_dx_round28"])
        ],
        priorityAssessments: [
            AttributedBullet("SEPSIS — vital signs, mental status, lactate, source control.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Pulmonary specialist + thoracic surgery consultation early.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Imaging guidance — ultrasound + CT.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Source identification — pneumonia, aspiration, surgical, esophageal.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Underlying conditions — diabetes, immunosuppression, alcohol use.", citationIDs: ["specialty_dx_round28"])
        ],
        commonInterventions: [
            AttributedBullet("EMPIRIC IV ANTIBIOTICS — community-acquired: ceftriaxone + metronidazole OR ampicillin-sulbactam OR amoxicillin-clavulanate (anaerobes); hospital-acquired: vancomycin + cefepime / piperacillin-tazobactam per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Narrow antibiotics to culture-specific; treat 3-6 weeks total (longer than pneumonia).", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CHEST TUBE DRAINAGE — large bore (>24F historically, now smaller pigtails often used); evacuates pus; daily output monitoring.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("INTRAPLEURAL FIBRINOLYTICS — TPA + DNase combination (MIST-2 protocol) for loculated empyema with insufficient drainage; chest tube + fibrinolytics + DNase improve drainage + reduce surgery per primary source.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("VATS (video-assisted thoracoscopic surgery) — early consideration for failure of medical / chest tube therapy; debridement + decortication.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("OPEN THORACOTOMY + DECORTICATION — for chronic / organized empyema with thick peel preventing lung re-expansion.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("DRAINAGE imaging — repeat ultrasound / CT to assess progress.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Nutritional support — chronic infection + protein loss; oral / enteral nutrition.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("Underlying cause treatment — pneumonia source, oral hygiene, swallowing assessment.", citationIDs: ["specialty_dx_round28"])
        ],
        watchFor: [
            AttributedBullet("LOCULATIONS / TRAPPED LUNG — failed re-expansion despite drainage; surgical intervention.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("BRONCHOPLEURAL FISTULA — communication from airway to pleura; air leak through chest tube; surgical management.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("INFECTION SPREAD — chest wall, mediastinum, sepsis.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("CHRONIC EMPYEMA — peel formation; debilitating; decortication required.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ANTIBIOTIC course duration — 3-6 weeks total minimum; clinical + imaging response guide.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("PROLONGED HOSPITALIZATION + functional decline — physical therapy + nutritional support + psychosocial.", citationIDs: ["specialty_dx_round28"]),
            AttributedBullet("ESOPHAGEAL RUPTURE (Boerhaave) — uncommon cause; emergent surgical repair.", citationIDs: ["specialty_dx_round28"])
        ],
        citations: [openrnDxR28, cdcDxR28, specialtyDxR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}
