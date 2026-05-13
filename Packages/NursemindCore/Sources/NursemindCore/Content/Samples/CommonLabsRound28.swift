import Foundation

// Curator-model lab entries (round 28 — pulmonary diagnostics).

private let openrnLabsR28 = CitationSource(
    id: "openrn_labs_round28",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcLabsR28 = CitationSource(
    id: "cdc_labs_round28",
    shortName: "CDC TB + NIOSH guidance",
    publisher: "CDC · NIOSH",
    license: .publicDomain,
    url: "https://www.cdc.gov/tb/topic/testing/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR28 = CitationSource(
    id: "specialty_labs_round28",
    shortName: "ATS + ERS + IDSA + Alpha-1 Foundation guidance",
    publisher: "ATS · ERS · IDSA · Alpha-1 Foundation",
    license: .factCitationOnly,
    url: "https://www.thoracic.org/statements/",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR28 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .gasExchange
)

public enum AlphaOneAntitrypsinSample {
    public static let entry: LabEntry = LabEntry(
        id: "alpha-1-antitrypsin",
        title: "Alpha-1 antitrypsin level + phenotype",
        subtitle: "Genetic deficiency screen · early-onset COPD + panacinar emphysema + cirrhosis · MM normal, ZZ severe deficiency, MZ carrier · Pi typing",
        specimen: "Serum for level; whole blood for phenotype (Pi typing by isoelectric focusing) or genotype (PCR for S + Z alleles)",
        nclexTags: labsTagsR28,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal AAT level 100-220 mg/dL (1.0-2.2 g/L)", label: "Reference range; varies by lab; serum levels also rise as acute phase reactant — may mask deficiency in inflammation", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "Severe deficiency <50 mg/dL (PI*ZZ)", label: "Homozygous Z (PI*ZZ) — most common severe deficiency; ~95% of clinically significant cases; severe risk", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "Intermediate deficiency 50-100 mg/dL", label: "Heterozygous (PI*MZ, PI*SZ) carriers — mildly increased risk; modifier for environmental exposure", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "Normal genotype PI*MM", label: "Normal alleles; no deficiency", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "Phenotype Pi*S, Pi*Z, Pi*null", label: "Deficient alleles; severity depends on combination", citationIDs: ["specialty_labs_round28"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal AAT — deficiency unlikely",
                summary: "Normal AAT level + PI*MM phenotype — alpha-1 antitrypsin deficiency excluded. Continue standard COPD / liver disease workup if clinical concerns persist per primary source.",
                nursingActions: [
                    "Document baseline if patient at risk (early COPD <45 years, unexplained liver disease, family history).",
                    "Continue COPD or liver disease standard workup + management.",
                    "Repeat if clinical change or rising acute-phase makes initial level uninterpretable."
                ],
                citationIDs: ["specialty_labs_round28"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Low AAT — severe deficiency (PI*ZZ)",
                summary: "Severe AAT deficiency (PI*ZZ phenotype) — major risk for early-onset (40s-50s) panacinar emphysema (lower lobe-predominant) + childhood/adult liver disease (neonatal hepatitis, cirrhosis, HCC). Family screening + counseling + augmentation therapy + smoking cessation paramount per primary source.",
                nursingActions: [
                    "ALPHA-1 FOUNDATION referral — counseling + resources + augmentation therapy access.",
                    "AUGMENTATION THERAPY — weekly IV infusion of pooled human AAT (Aralast, Glassia, Prolastin, Zemaira); life-long; expensive; reduces lung function decline.",
                    "Smoking cessation paramount — DRAMATICALLY accelerates emphysema; counseling + pharmacotherapy.",
                    "Pulmonary specialist + standard COPD management (LABA/LAMA/ICS); pulmonary rehab; vaccinations.",
                    "Hepatology evaluation — LFTs, AFP, ultrasound; HCC surveillance; ZZ liver disease in 10-15% of adults.",
                    "FAMILY screening — siblings + parents + children; genetic counseling.",
                    "Avoid hepatotoxic drugs + alcohol minimization.",
                    "Lung transplant — selected; AAT deficiency excellent transplant indication; augmentation continues."
                ],
                citationIDs: ["specialty_labs_round28"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Decreased AAT — deficiency",
                causes: ["PI*ZZ — severe deficiency, most common clinical phenotype", "PI*SZ — intermediate, increased risk with smoking", "PI*SS — mild deficiency", "PI*null variants — rare, severe deficiency", "Liver disease causing decreased synthesis (rare)"],
                citationIDs: ["specialty_labs_round28"]
            ),
            CauseGroup(
                title: "Elevated AAT — acute phase",
                causes: ["Acute inflammation / infection — falsely normalizes AAT in deficient patients", "Malignancy", "Pregnancy + oral contraceptives", "Stress / surgery"],
                citationIDs: ["specialty_labs_round28"]
            )
        ],
        nursingActions: [
            AttributedBullet("WHO TO TEST per AAT Foundation + ATS: All adults with COPD (regardless of age), bronchiectasis, unexplained liver disease, family history of AAT deficiency, panniculitis, granulomatosis with polyangiitis (slight increased risk).", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("LEVEL ALONE can be misleading in acute inflammation; PHENOTYPE / GENOTYPE definitive.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("EARLY DIAGNOSIS critical — smoking cessation + augmentation can DRAMATICALLY alter outcomes.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("Family screening — first-degree relatives; genetic counseling; insurance considerations.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("Augmentation therapy candidacy — PI*ZZ + emphysema + ages 18+ + non-smoker; weekly IV infusion lifelong.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("LIVER DISEASE — ZZ phenotype causes liver disease in 10-15% of adults; HCC surveillance with cirrhosis.", citationIDs: ["specialty_labs_round28"])
        ],
        watchFor: [
            AttributedBullet("UNDERRECOGNIZED — most AAT-deficient COPD patients undiagnosed; early-onset emphysema in 40s-50s; lower-lobe panacinar pattern.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("SMOKING accelerates lung disease DRAMATICALLY in ZZ; smoke-free environment critical.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("LIVER DISEASE — neonatal hepatitis, childhood cirrhosis, adult cirrhosis + HCC; screen + monitor.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("AUGMENTATION expensive ~$60,000-100,000/year; insurance coordination; AAT Foundation patient assistance.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("FAMILY screening + genetic counseling — siblings, children; cascade testing.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("PANNICULITIS — necrotizing skin lesions; classic AAT deficiency complication.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("LUNG TRANSPLANT — AAT deficiency excellent indication; augmentation may continue post-transplant.", citationIDs: ["specialty_labs_round28"])
        ],
        citations: [openrnLabsR28, cdcLabsR28, specialtyLabsR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum QuantiFERONTBSample {
    public static let entry: LabEntry = LabEntry(
        id: "quantiferon-tb-gold",
        title: "QuantiFERON-TB Gold + T-SPOT.TB (IGRA)",
        subtitle: "Interferon-γ release assay for latent + active TB · NOT affected by BCG · single blood draw · alternative to TST · CDC + ATS preferred",
        specimen: "Whole blood collected in specific QFT-GOLD-Plus tubes (4 tubes: nil, TB1, TB2, mitogen); strict handling — within 16 hours to lab; results in 24 hours",
        nclexTags: labsTagsR28,
        referenceRanges: [
            ReferenceRangeRow(value: "Negative (TB1 + TB2 minus Nil) <0.35 IU/mL", label: "TB infection unlikely; consider repeat in 8-10 weeks for window period if exposure recent", citationIDs: ["cdc_labs_round28"]),
            ReferenceRangeRow(value: "Positive (TB1 OR TB2 minus Nil) ≥0.35 IU/mL + ≥25% of Nil", label: "TB infection (latent or active); cannot distinguish; clinical + imaging differentiate", citationIDs: ["cdc_labs_round28"]),
            ReferenceRangeRow(value: "Indeterminate — nil control too high OR mitogen too low", label: "Inadequate immune response or technical issue; repeat OR consider T-SPOT.TB", citationIDs: ["cdc_labs_round28"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative IGRA",
                summary: "Negative result suggests TB infection unlikely. Window period of 8-10 weeks after exposure exists. Recent close contact may need repeat testing if initial negative per primary source.",
                nursingActions: [
                    "If recent close TB contact + initially negative: REPEAT IGRA in 8-10 weeks (window period).",
                    "Reassure patient if no exposure / immunocompromise; document baseline.",
                    "If pre-biologic / pre-immunosuppression: clear for therapy."
                ],
                citationIDs: ["cdc_labs_round28"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive IGRA — TB infection",
                summary: "POSITIVE IGRA indicates Mycobacterium tuberculosis infection. Cannot distinguish latent from active TB — CXR + clinical evaluation + sputum if active disease suspected. Treat latent or active accordingly per CDC.",
                nursingActions: [
                    "CHEST X-RAY immediately — rule out active pulmonary TB.",
                    "CLINICAL evaluation — cough, fever, weight loss, night sweats, hemoptysis (active TB).",
                    "If active TB suspected: 3 sputum AFB smears + culture; respiratory isolation (negative pressure room, N95); CDC + state TB program notification.",
                    "If latent TB: chest x-ray normal + no symptoms; treat with isoniazid 9 months OR rifampin 4 months OR rifapentine + INH weekly × 12 weeks (3HP) per primary source.",
                    "ASSESS RISK — biologics + chemotherapy + HIV+ + transplant + close contacts of active TB — high priority for treatment.",
                    "Education — adherence, side effects (hepatotoxicity, drug-induced lupus, neuropathy), monthly LFTs for INH.",
                    "Public health partnership — Directly Observed Therapy (DOT) for high-risk; contact investigation.",
                    "VACCINATIONS — avoid live vaccines in active TB; INH treatment doesn't preclude."
                ],
                citationIDs: ["cdc_labs_round28"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Indeterminate",
                summary: "Indeterminate result — inadequate immune response (immunocompromised, immunosuppressants) OR technical issue. Repeat OR use alternative test per primary source.",
                nursingActions: [
                    "REPEAT QFT-GOLD-Plus.",
                    "Consider T-SPOT.TB (more sensitive in immunocompromised).",
                    "TST (PPD) — alternative; subject to BCG vaccine cross-reaction.",
                    "If patient on immunosuppression / HIV+ / extremes of age: discuss with TB specialist.",
                    "Clinical evaluation regardless — symptoms + risk factors."
                ],
                citationIDs: ["cdc_labs_round28"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Positive IGRA",
                causes: ["Latent TB infection (most common positive)", "Active pulmonary or extrapulmonary TB", "Prior TB infection (treated or self-resolved)", "M. tuberculosis exposure (close contact)", "Healthcare worker / shelter / prison exposure", "Immigration from high-prevalence country"],
                citationIDs: ["cdc_labs_round28"]
            ),
            CauseGroup(
                title: "Indeterminate IGRA",
                causes: ["Immunosuppression (HIV, transplant, biologics, chemotherapy)", "Extremes of age (<5 years, elderly)", "Severe illness", "Technical issues (improper specimen, delayed processing)", "Anergy"],
                citationIDs: ["cdc_labs_round28"]
            )
        ],
        nursingActions: [
            AttributedBullet("IGRA preferred over TST for BCG-vaccinated, prior false-positive TST, low return-rate populations per CDC.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("TST (Mantoux) still appropriate for children <5, serial testing in low-cost settings.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("Specimen handling critical — within 16 hours to lab; specific tubes (4 — nil, TB1, TB2, mitogen).", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("PRE-BIOLOGIC + PRE-IMMUNOSUPPRESSION screening — ALL patients before TNF-inhibitor, rituximab, JAK inhibitor, transplant, chemotherapy.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("HIGH-RISK populations — close contacts, immigrants from high-prevalence countries, healthcare workers, homeless / incarcerated, prior abnormal CXR, immunocompromised.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("LATENT TB treatment — INH 9 mo, rifampin 4 mo, OR 3HP (INH + rifapentine weekly × 12 weeks) — most preferred regimen now per CDC.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("DOT (Directly Observed Therapy) — public health for high-risk; contact investigation.", citationIDs: ["cdc_labs_round28"])
        ],
        watchFor: [
            AttributedBullet("WINDOW PERIOD — 8-10 weeks post-exposure; recent contact may need repeat.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("CANNOT distinguish LATENT from ACTIVE — need CXR + clinical + sputum if active suspected.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("BCG vaccine does NOT cause false-positive (advantage over TST).", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("NONTUBERCULOUS MYCOBACTERIA — some cause false-positive (M. kansasii, M. szulgai, M. marinum); clinical correlation.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("IMMUNOCOMPROMISED — indeterminate / false-negative more common; consider T-SPOT or repeat testing.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("HIV+ — anergy → false negative; multiple testing modalities + clinical correlation.", citationIDs: ["cdc_labs_round28"]),
            AttributedBullet("INH HEPATOTOXICITY — risk with chronic alcohol + age + viral hepatitis + pregnancy; monthly LFTs first 3 months.", citationIDs: ["cdc_labs_round28"])
        ],
        citations: [openrnLabsR28, cdcLabsR28, specialtyLabsR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AspergillusPrecipitinsSample {
    public static let entry: LabEntry = LabEntry(
        id: "aspergillus-precipitins",
        title: "Aspergillus precipitins (IgG) + specific IgE",
        subtitle: "ABPA workup in asthma + CF · positive IgE + IgG · galactomannan for invasive · hypersensitivity pneumonitis · chronic pulmonary aspergillosis",
        specimen: "Serum for IgG precipitins (ImmunoCAP assay), specific IgE; galactomannan antigen for invasive disease (BAL or serum); skin prick test alternative for ABPA",
        nclexTags: labsTagsR28,
        referenceRanges: [
            ReferenceRangeRow(value: "Aspergillus fumigatus IgE elevated", label: "Suggests hypersensitivity — ABPA, severe asthma with fungal sensitization (SAFS), atopic asthma", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "Aspergillus IgG precipitins positive", label: "Chronic Aspergillus exposure — ABPA, chronic pulmonary aspergillosis, hypersensitivity pneumonitis (farmer's lung, malt worker's lung)", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "TOTAL serum IgE >1000 IU/mL in ABPA", label: "Elevated total IgE — major criterion for ABPA; trending reflects disease activity", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "Galactomannan + (serum or BAL)", label: "Invasive aspergillosis (immunocompromised) — emergent treatment with voriconazole or isavuconazole", citationIDs: ["specialty_labs_round28"]),
            ReferenceRangeRow(value: "Both IgE + IgG negative", label: "Aspergillus disease less likely; consider other fungi, mycobacteria, allergic etiologies", citationIDs: ["specialty_labs_round28"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative results — Aspergillus disease unlikely",
                summary: "Negative IgE + IgG suggests Aspergillus disease unlikely in immunocompetent. Consider alternative diagnosis. Strong clinical suspicion warrants repeat or alternative testing per primary source.",
                nursingActions: [
                    "Consider alternative diagnoses — other fungi, mycobacteria, vasculitis, malignancy, severe asthma without fungal component.",
                    "If high suspicion: BAL, biopsy, sputum cultures.",
                    "Document baseline for serial monitoring."
                ],
                citationIDs: ["specialty_labs_round28"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Positive — diagnostic workup",
                summary: "Positive Aspergillus IgE + IgG in clinical context of asthma OR cystic fibrosis OR chronic lung disease — workup for ABPA, chronic pulmonary aspergillosis (CPA), or hypersensitivity pneumonitis (HP) per primary source.",
                nursingActions: [
                    "ABPA suspected — total IgE level (>1000 IU/mL is criterion), eosinophil count, HRCT chest (central bronchiectasis, mucoid impaction), peripheral eosinophilia.",
                    "Skin prick test for immediate hypersensitivity to A. fumigatus.",
                    "CHRONIC PULMONARY ASPERGILLOSIS (cavitary structural lung disease) — chest imaging, possible biopsy; precipitin IgG often very elevated.",
                    "INVASIVE ASPERGILLOSIS — galactomannan antigen test (serum + BAL), beta-D-glucan, biopsy/culture; emergent voriconazole or isavuconazole in immunocompromised.",
                    "HP — environmental exposure history (birds, hay, mold, hot tubs); BAL lymphocytosis; environmental remediation.",
                    "TREATMENT — ABPA: prednisone + itraconazole; CPA: itraconazole / voriconazole; invasive: voriconazole / isavuconazole.",
                    "Monitor — IgE trends, symptom diary, FEV1; clinical + imaging response.",
                    "Environmental — reduce mold exposure (home, workplace); air filtration."
                ],
                citationIDs: ["specialty_labs_round28"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Aspergillus hypersensitivity (IgE+/IgG+)",
                causes: ["Allergic bronchopulmonary aspergillosis (ABPA) — asthma + CF", "Severe asthma with fungal sensitization (SAFS)", "Atopic asthma + environmental Aspergillus exposure", "Eczema + atopic dermatitis with fungal sensitization"],
                citationIDs: ["specialty_labs_round28"]
            ),
            CauseGroup(
                title: "Aspergillus disease (IgG+, often IgE-)",
                causes: ["Chronic pulmonary aspergillosis (cavitary structural lung disease — prior TB, COPD, sarcoid)", "Chronic necrotizing pulmonary aspergillosis (subacute invasive)", "Aspergilloma (fungal ball in pre-existing cavity)", "Hypersensitivity pneumonitis (farmer's lung, malt worker's lung)"],
                citationIDs: ["specialty_labs_round28"]
            ),
            CauseGroup(
                title: "Invasive aspergillosis (immunocompromised)",
                causes: ["Neutropenic chemotherapy patients", "Allogeneic hematopoietic stem cell transplant", "Solid organ transplant", "Advanced AIDS", "High-dose / prolonged corticosteroids", "Inherited immunodeficiencies"],
                citationIDs: ["specialty_labs_round28"]
            )
        ],
        nursingActions: [
            AttributedBullet("ABPA testing in difficult-to-control asthma + CF — Rosenberg-Patterson + ISHAM criteria; central bronchiectasis on HRCT pathognomonic.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("TOTAL IgE trending — primary disease activity marker in ABPA; >1000 IU/mL major criterion.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("HRCT chest — central bronchiectasis, mucoid impaction (\"finger-in-glove\" sign), transient infiltrates.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("INVASIVE ASPERGILLOSIS — emergent in immunocompromised; galactomannan + beta-D-glucan + biopsy; voriconazole first-line; high mortality.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("AZOLE drug interactions — extensive CYP3A4 effects; calcineurin inhibitors, warfarin, statins.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("AZOLE hepatotoxicity — monitor LFTs; QTc on voriconazole.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("ENVIRONMENTAL — water-damaged buildings, compost, mold-infested workplaces; remediation.", citationIDs: ["specialty_labs_round28"])
        ],
        watchFor: [
            AttributedBullet("ABPA EXACERBATIONS — rising IgE + new infiltrates; corticosteroid re-initiation.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("INVASIVE ASPERGILLOSIS — emergent in immunocompromised; high mortality even with treatment.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("ASPERGILLOMA — fungal ball; hemoptysis (sometimes massive); embolization or surgical resection.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("DISTINGUISH from invasive aspergillosis (emergent, immunocompromised) and ABPA (hypersensitivity, immunocompetent asthmatic).", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("CROSS-REACTIVITY — other fungi (Penicillium, Mucor); clinical correlation.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("MUCUS PLUGGING in ABPA — atelectasis; bronchoscopic clearance.", citationIDs: ["specialty_labs_round28"]),
            AttributedBullet("LONG-TERM corticosteroid + azole toxicity — bone, liver, drug interactions.", citationIDs: ["specialty_labs_round28"])
        ],
        citations: [openrnLabsR28, cdcLabsR28, specialtyLabsR28],
        lastSourceFidelityReview: "2026-05-13"
    )
}
