import Foundation

// Curator-model drug entries (round 15 — DMARDs / biologics + ID + adherence + tox-rescue).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), ACR / IDSA / DHHS / AAO concept citations.

private let openfda = CitationSource(
    id: "openfda_round15",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR15 = CitationSource(
    id: "openrn_pharm_round15",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=DMARD+biologic+HIV+rifampin",
    lastRetrieved: "2026-05-04"
)
private let specialtyR15 = CitationSource(
    id: "specialty_round15",
    shortName: "ACR / IDSA / DHHS / AAO concept citations",
    publisher: "ACR · IDSA · DHHS · AAO",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/practice-guideline/",
    lastRetrieved: "2026-05-04"
)

public enum RituximabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rituximab",
        title: "Rituximab",
        subtitle: "Anti-CD20 mAb · NHL / CLL / RA / GPA · infusion reactions + HBV reactivation",
        category: "Anti-CD20 monoclonal antibody",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Chimeric anti-CD20 monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "CD20+ NHL, CLL, RA, GPA / MPA, pemphigus vulgaris"),
            KeyValueRow(key: "Boxed", value: "Fatal infusion reactions; HBV reactivation; PML; severe mucocutaneous reactions"),
            KeyValueRow(key: "Premedication", value: "Acetaminophen + diphenhydramine (± corticosteroid)")
        ],
        indications: AttributedProse(
            "Treatment of CD20+ B-cell non-Hodgkin lymphoma; CLL; moderate-severe rheumatoid arthritis (with MTX, after TNFi inadequacy); ANCA-associated vasculitis (GPA / MPA); pemphigus vulgaris per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        mechanism: AttributedProse(
            "Binds CD20 on B-lymphocytes → complement-dependent cytotoxicity, antibody-dependent cellular cytotoxicity, apoptosis → B-cell depletion lasting 6–9 months.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "RA", body: "1000 mg IV on days 1 and 15 q24 weeks (with MTX) per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Lymphoma / CLL", body: "375 mg/m² IV weekly × 4–8 (variable by regimen).", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "GPA / MPA induction", body: "375 mg/m² IV weekly × 4 with steroids per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Premedication", body: "Acetaminophen 650 mg PO + diphenhydramine 50 mg IV; ± corticosteroid.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Active severe infection; severe hypersensitivity to murine proteins; active untreated HBV (without antiviral prophylaxis) per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("BOXED — fatal infusion reactions, especially first dose; STOP infusion + supportive care + retitrate per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — HBV reactivation (fatal hepatic failure); screen HBsAg + anti-HBc; antiviral prophylaxis per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — progressive multifocal leukoencephalopathy (JC virus); monitor neuro status per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — severe mucocutaneous reactions (SJS / TEN) per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Tumor lysis syndrome — high-burden lymphoma; hydration + allopurinol / rasburicase.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hypogammaglobulinemia + chronic infection risk with repeated dosing.", citationIDs: ["specialty_round15"])
        ],
        adverseReactions: AttributedProse(
            "Infusion reaction (fever, chills, hypotension, urticaria, dyspnea), fatigue, nausea, headache, infections, neutropenia, lymphopenia, hypogammaglobulinemia.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — contraindicated; complete inactivated vaccines 4 weeks before initiation per primary source.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Other immunosuppressants — additive infection risk; consider PJP prophylaxis.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Avoid combination with ACE inhibitors at infusion time (hypotension augmentation in some patients).", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-infusion premedicate; slow rate first hour, titrate per protocol; large-bore IV.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Vital signs every 15 min first hour; watch for fever / chills / dyspnea / hypotension / urticaria.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Screen + monitor — HBV / HCV serologies, IGRA, CBC, immunoglobulins; vaccinations 4 weeks before.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Counsel — fever / new neuro symptoms / persistent cough → call immediately.", citationIDs: ["openrn_pharm_round15"])
        ],
        patientTeaching: AttributedProse(
            "We give this through your vein. Tell us right away if you feel chills, fever, trouble breathing, or hives during the infusion. Avoid live vaccines (your provider will tell you which). Call us for fever, sore throat, or new weakness, vision, or thinking changes.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TofacitinibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tofacitinib",
        title: "Tofacitinib",
        subtitle: "JAK1/3 inhibitor · RA / PsA / UC / AS · MACE + thrombosis boxed",
        category: "Janus kinase (JAK) inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Oral JAK1 / JAK3 inhibitor (tsDMARD)"),
            KeyValueRow(key: "Indications", value: "Moderate-severe RA, PsA, UC, AS, polyarticular JIA"),
            KeyValueRow(key: "Boxed", value: "MACE, malignancy, thrombosis, mortality, serious infections"),
            KeyValueRow(key: "Pre-treatment", value: "TB screen, HBV / HCV, CBC, lipids, LFTs")
        ],
        indications: AttributedProse(
            "Moderate-severe rheumatoid arthritis after MTX inadequacy; active psoriatic arthritis; moderate-severe ulcerative colitis after biologic / csDMARD inadequacy; ankylosing spondylitis after TNFi inadequacy; polyarticular JIA ≥2 years per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "Inhibits Janus kinases (JAK1, JAK3 > JAK2, TYK2) → blocks STAT signaling for inflammatory cytokines (IL-2, -4, -6, -7, -9, -15, -21, IFN-γ).",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "RA / PsA", body: "5 mg PO BID (or 11 mg ER daily) per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "UC induction", body: "10 mg PO BID × 8 weeks then 5 mg BID maintenance per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Renal / hepatic adjustment", body: "Dose reduction or avoidance per labeling; not recommended in severe hepatic impairment.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Active serious infection; severe hepatic impairment; live vaccines; pregnancy (relative) per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("BOXED — MACE risk vs TNFi in RA ≥50 with ≥1 CV risk factor (ORAL Surveillance) per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — malignancy (lymphoma + lung cancer in smokers).", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — thrombosis (DVT, PE, arterial).", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — mortality higher than TNFi in RA ≥50 with CV risk factor.", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — serious infections (TB, fungal, bacterial); screen TB before therapy.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infection, headache, diarrhea, nasopharyngitis, hypertension, herpes zoster (increased), elevated lipids, transaminitis, lymphopenia, neutropenia.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (ketoconazole) — reduce dose.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Strong CYP3A4 inducers (rifampin) — avoid combination.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Live vaccines — avoid; complete inactivated up-to-date before therapy.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Other DMARDs / biologics — additive immunosuppression; not combined with biologics.", citationIDs: ["specialty_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline TB screen, HBV / HCV, CBC, lipids, LFTs; vaccinations up-to-date.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Lipid panel 4–8 weeks; CBC + LFTs periodically; lymphocytes <500 → discontinue per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hold during severe infection; monitor for opportunistic / latent infections.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Smoking cessation counseling — JAKi + smoking elevates lung-cancer risk.", citationIDs: ["specialty_round15"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth as directed. Tell us right away about fever, chest pain, leg swelling, sudden shortness of breath, or unusual lumps. Get all blood tests as scheduled. Avoid live vaccines. Keep up with cancer screenings.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LeflunomideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "leflunomide",
        title: "Leflunomide",
        subtitle: "DMARD pyrimidine inhibitor · RA · teratogenic (Cat X) · cholestyramine washout",
        category: "Conventional DMARD (pyrimidine synthesis inhibitor)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "DHODH inhibitor (DMARD)"),
            KeyValueRow(key: "Indications", value: "Moderate-severe rheumatoid arthritis"),
            KeyValueRow(key: "Boxed", value: "Hepatotoxicity; embryo-fetal toxicity (Cat X)"),
            KeyValueRow(key: "Notable", value: "Long half-life — cholestyramine washout for accelerated elimination")
        ],
        indications: AttributedProse(
            "Active rheumatoid arthritis — first-line conventional DMARD alternative or addition to MTX per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "Inhibits dihydroorotate dehydrogenase (DHODH) → reduces de novo pyrimidine synthesis → suppresses lymphocyte proliferation. Active metabolite teriflunomide also inhibits tyrosine kinases.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "Loading 100 mg PO daily × 3 days then 20 mg daily; some skip loading due to GI tolerability per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Cholestyramine washout", body: "8 g PO TID × 11 days for accelerated elimination if hepatotoxicity / planned pregnancy / drug interaction per primary source.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Pregnancy / breastfeeding (Category X); severe hepatic impairment; severe immunodeficiency; concurrent teriflunomide per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("BOXED — hepatotoxicity (fatal cases reported); LFTs monthly first 6 months, then q6–8 weeks per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — embryo-fetal toxicity (Cat X); both sexes require contraception during therapy and after washout (long half-life — up to 2 years) per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Bone-marrow suppression; serious infection risk.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Stevens-Johnson / TEN; peripheral neuropathy reported.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (very common), alopecia, rash, headache, hypertension, transaminitis, weight loss, peripheral neuropathy.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Hepatotoxic drugs (MTX, alcohol) — additive risk; combination with MTX increases hepatotoxicity.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Live vaccines — avoid.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Warfarin — INR monitoring (interaction reported).", citationIDs: ["openfda_round15"]),
            AttributedBullet("Rifampin — avoid (increases active metabolite).", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline pregnancy test, TB screen, HBV / HCV, LFTs, CBC.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Monitor LFTs monthly × 6 months then q6–8 weeks; CBC q1–2 weeks early then periodically.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Cholestyramine washout protocol if pregnancy, severe hepatotoxicity, or stopping per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Counsel reliable contraception during + after washout; avoid alcohol.", citationIDs: ["openrn_pharm_round15"])
        ],
        patientTeaching: AttributedProse(
            "Use reliable birth control while taking this medication and for some time after stopping. Tell us right away if you become or might become pregnant. Avoid alcohol. Report yellow eyes / skin, dark urine, severe diarrhea, severe rash, mouth sores. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum FebuxostatSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "febuxostat",
        title: "Febuxostat",
        subtitle: "Xanthine oxidase inhibitor · gout · CV mortality boxed warning vs allopurinol",
        category: "Xanthine oxidase inhibitor (urate-lowering)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Non-purine xanthine oxidase inhibitor"),
            KeyValueRow(key: "Indications", value: "Chronic gout — second-line after allopurinol"),
            KeyValueRow(key: "Boxed", value: "CV death (vs allopurinol — CARES trial)"),
            KeyValueRow(key: "Target", value: "Serum urate <6.0 mg/dL (<5.0 if tophi)")
        ],
        indications: AttributedProse(
            "Chronic management of hyperuricemia in patients with gout; generally second-line after allopurinol due to CV-mortality signal per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "Selective non-purine xanthine oxidase inhibitor → blocks conversion of hypoxanthine → xanthine → uric acid → reduces serum urate.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "40 mg PO daily; can increase to 80 mg if not at target serum urate <6.0 mg/dL after 2 weeks per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Renal", body: "No dose adjustment for mild-moderate CKD; limited data severe CKD.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Concurrent azathioprine or mercaptopurine (xanthine oxidase metabolism — life-threatening accumulation); hypersensitivity per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased CV death vs allopurinol in patients with established CV disease (CARES trial); reserve for allopurinol-intolerant per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hepatic effects — periodic LFTs; rare hepatotoxicity.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Acute gout flare — common during initiation; concurrent flare prophylaxis ≥6 months.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Severe cutaneous adverse reactions (SJS / TEN) reported.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Liver enzyme elevations, nausea, arthralgia, rash, gout flares (early therapy).",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("AZATHIOPRINE / MERCAPTOPURINE / theophylline — life-threatening accumulation; AVOID combination per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Warfarin — minor effect; routine INR.", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Initiate flare prophylaxis (colchicine 0.6 mg daily / BID OR low-dose NSAID) for ≥6 months per primary source.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Recheck serum urate monthly until <6.0 mg/dL; titrate; baseline + periodic LFTs.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Continue urate-lowering during acute flare; do not discontinue.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Counsel about CV history disclosure.", citationIDs: ["openrn_pharm_round15"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth once daily. Acute gout flares may worsen during the first six months — keep taking the medication and use the flare-prevention drug as directed. Avoid alcohol excess; reduce purine-rich foods. Report rash, chest pain, signs of liver problems.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum BaclofenSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "baclofen",
        title: "Baclofen",
        subtitle: "GABA-B agonist · MS / SCI spasticity · intrathecal pump · severe withdrawal risk",
        category: "Central muscle relaxant (GABA-B agonist)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "GABA-B receptor agonist"),
            KeyValueRow(key: "Indications", value: "Spasticity (MS, SCI, CP); off-label AUD, trigeminal neuralgia, hiccups"),
            KeyValueRow(key: "Boxed (intrathecal)", value: "Severe withdrawal on abrupt discontinuation — life-threatening"),
            KeyValueRow(key: "Routes", value: "Oral; intrathecal pump (refractory)")
        ],
        indications: AttributedProse(
            "Treatment of spasticity associated with multiple sclerosis, spinal cord injury, cerebral palsy. Intrathecal route for refractory severe spasticity per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        mechanism: AttributedProse(
            "GABA-B receptor agonist at spinal level → presynaptic inhibition of mono- and polysynaptic reflexes → reduced spasticity. Less effect on muscle strength than peripheral relaxants.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "Oral", body: "Start 5 mg PO TID; titrate by 5 mg every 3 days to 80 mg/day max per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Intrathecal", body: "Individualized through programmable pump; refill schedule + alarms; emergent oral baclofen on hand.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce dose / extend interval in CKD (accumulation → encephalopathy).", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; intrathecal — active infection at pump site or systemic infection per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("BOXED (intrathecal) — abrupt discontinuation (pump failure) → severe withdrawal — high fever, AMS, rebound spasticity, rhabdomyolysis, multi-organ failure, death; emergent oral baclofen + benzodiazepines + supportive care per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("CNS depression — additive with alcohol / opioids / benzodiazepines.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Renal accumulation — encephalopathy at usual doses in dialysis.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Seizure risk in epilepsy patients on therapy.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, dizziness, weakness, nausea, urinary retention, headache, hypotension; intrathecal — pump-related infection / catheter problems.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants (alcohol, opioids, benzos) — additive sedation + respiratory depression.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Antihypertensives — additive hypotension.", citationIDs: ["openfda_round15"]),
            AttributedBullet("MAO inhibitors — caution; CNS depression.", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Titrate slowly; AVOID abrupt discontinuation (oral OR intrathecal) — taper over 1–2 weeks per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Monitor sedation, BP, urinary retention, mood changes; renal adjustment.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Intrathecal — refill schedule + pump alarms; emergency baclofen + medical-alert ID.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Counsel signs of pump failure → ED immediately.", citationIDs: ["openfda_round15"])
        ],
        patientTeaching: AttributedProse(
            "Do NOT stop this medication suddenly — withdrawal can be life-threatening. Avoid alcohol. Be careful driving until you know how the medication affects you. If you have a pump, watch for severe spasticity, fever, or confusion — go to the ER immediately.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum RifampinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rifampin",
        title: "Rifampin",
        subtitle: "RNA polymerase inhibitor · TB + Staph adjunct · CYP450 inducer · orange body fluids",
        category: "Rifamycin antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Rifamycin RNA polymerase inhibitor"),
            KeyValueRow(key: "Indications", value: "Active + latent TB; meningococcal carrier prophylaxis; MRSA / Staph adjunct"),
            KeyValueRow(key: "Notable", value: "Strong CYP3A4 / CYP2C9 / pgp inducer — many drug interactions"),
            KeyValueRow(key: "Cosmetic", value: "ORANGE body fluids; permanently stains soft contacts")
        ],
        indications: AttributedProse(
            "Treatment of active tuberculosis (with INH, PZA, EMB); latent TB monotherapy or alternative; meningococcal carrier prophylaxis; adjunctive therapy in MRSA prosthetic device infections + severe Staph endocarditis per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "Bactericidal — binds bacterial DNA-dependent RNA polymerase → inhibits transcription. Active against M. tuberculosis, MAC, Staphylococci (intracellular killing), Neisseria meningitidis, Haemophilus.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "TB (active or latent)", body: "10 mg/kg PO daily (max 600 mg) on empty stomach per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Meningococcal prophylaxis", body: "600 mg PO BID × 2 days.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Staph adjunct", body: "300–600 mg PO BID with primary agent (vancomycin, daptomycin) per primary source.", citationIDs: ["specialty_round15"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment; concurrent strong protease inhibitors / specific HCV DAAs without modification per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("Hepatotoxicity — additive with INH; baseline + monthly LFTs; bilirubin elevations common (asymptomatic) per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("CYP450 induction → reduced efficacy of warfarin, OCPs, methadone, NOACs, statins, calcineurin inhibitors, azoles, HIV protease inhibitors per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Flu-like syndrome on intermittent dosing.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hemolytic anemia + thrombocytopenia (rare).", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "GI upset, transaminitis, rash, orange discoloration of body fluids, flu-like reactions on intermittent therapy, thrombocytopenia.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — reduced anticoagulant effect; INR monitoring + dose adjustment per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("OCPs — ineffective; alternative contraception required.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Methadone — induced clearance → withdrawal; dose adjustment.", citationIDs: ["openfda_round15"]),
            AttributedBullet("HIV protease inhibitors / DOACs / azoles — alternative regimen or dose modification per primary source.", citationIDs: ["specialty_round15"]),
            AttributedBullet("INH — additive hepatotoxicity; B6 supplementation for INH neuropathy.", citationIDs: ["openrn_pharm_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Take on empty stomach — 1 hour before / 2 hours after meals.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Baseline + monthly LFTs; CBC + platelet monitoring.", citationIDs: ["openfda_round15"]),
            AttributedBullet("DOT for active TB to ensure adherence.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Counsel orange body fluids (sweat, tears, urine, contacts permanently stained).", citationIDs: ["openfda_round15"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth on an empty stomach. Your urine, sweat, and tears will turn orange — this is harmless but will permanently stain soft contact lenses. Tell every provider and pharmacist you're on this drug — it changes how many other drugs work, including birth control. Report yellow eyes / skin, dark urine, severe nausea, persistent fever, or unusual bruising.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DolutegravirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dolutegravir",
        title: "Dolutegravir",
        subtitle: "INSTI · HIV first-line · high genetic barrier · pregnancy preferred",
        category: "Integrase strand transfer inhibitor (INSTI)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "INSTI"),
            KeyValueRow(key: "Indications", value: "HIV-1 (adults + peds ≥4 weeks + ≥3 kg)"),
            KeyValueRow(key: "Combinations", value: "Triumeq (DTG/ABC/3TC), Juluca (DTG/RPV), Dovato (DTG/3TC), TIVICAY"),
            KeyValueRow(key: "Notable", value: "Once-daily; preferred in pregnancy per current DHHS")
        ],
        indications: AttributedProse(
            "Treatment of HIV-1 infection in adults + pediatrics ≥4 weeks + ≥3 kg, in combination with other antiretrovirals; component of DHHS-recommended initial regimens (BIC/TAF/FTC and DTG/3TC) per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "Inhibits HIV-1 integrase strand-transfer step → prevents integration of viral cDNA into host genome → blocks viral replication. High genetic barrier to resistance.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "Treatment-naive", body: "50 mg PO once daily with or without food per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Treatment-experienced + INSTI-resistant", body: "50 mg PO BID per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "With rifampin or potent CYP inducer", body: "50 mg PO BID; otherwise reduced exposure.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Concurrent dofetilide (QT prolongation); hypersensitivity to dolutegravir per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("Hypersensitivity — discontinue if rash + systemic symptoms (fever, hepatitis, organ involvement) per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hepatotoxicity — caution in HBV / HCV co-infection; monitor LFTs.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Weight gain (modest); insomnia + headache common; mood changes reported.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Polyvalent cation interactions — separate from antacids / multivitamins / Fe / Ca / Mg per primary source.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Insomnia, headache, fatigue, nausea, weight gain, transaminitis, hypersensitivity (rare).",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Polyvalent cations (Mg / Ca / Fe / Al — antacids, supplements) — separate by 2 hr before / 6 hr after per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Rifampin / carbamazepine — reduce dolutegravir levels; use 50 mg BID.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Metformin — increased levels (consider dose limit).", citationIDs: ["openfda_round15"]),
            AttributedBullet("Dofetilide — contraindicated.", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-treatment — HIV resistance testing, HLA-B*5701 (if abacavir co-formulated), HBV / HCV serology, baseline labs.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Counsel adherence + drug-interaction risks; once-daily dosing.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Pregnancy — preferred per DHHS; counsel about U=U; safe at all stages per primary source.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Monitor viral load + CD4; LFTs; weight.", citationIDs: ["openrn_pharm_round15"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed every day. Separate antacids, iron, calcium, or multivitamins by 2 hours before or 6 hours after the dose. Tell all providers you take this medicine. When your virus is undetectable for at least 6 months, you cannot pass HIV to a sexual partner (\"U=U\").",
            citationIDs: ["openrn_pharm_round15", "specialty_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TenofovirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tenofovir",
        title: "Tenofovir (TAF / TDF)",
        subtitle: "NRTI · HIV + HBV · TAF lower bone/renal tox · HBV flare on discontinuation",
        category: "Nucleotide reverse transcriptase inhibitor (NRTI)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "NRTI (nucleotide RTI)"),
            KeyValueRow(key: "Indications", value: "HIV-1 (combination); chronic HBV; HIV PrEP"),
            KeyValueRow(key: "Boxed", value: "Lactic acidosis / hepatic steatosis (class); HBV exacerbation on d/c; TDF — renal + bone toxicity"),
            KeyValueRow(key: "Forms", value: "TDF (older, more renal/bone tox); TAF (newer, lower tox)")
        ],
        indications: AttributedProse(
            "HIV-1 infection in combination with other antiretrovirals; chronic hepatitis B; HIV pre-exposure prophylaxis (PrEP — TDF/FTC daily or 2-1-1) per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "Nucleotide analog → intracellularly phosphorylated → competes with dATP for HIV-1 reverse transcriptase + HBV polymerase → chain termination + viral suppression.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "TDF", body: "300 mg PO daily; renal adjustment for CrCl <50 per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "TAF", body: "25 mg PO daily; preferred in CKD / bone-density concerns per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "PrEP", body: "TDF/FTC 300/200 mg PO daily; or 2-1-1 on-demand for MSM per CDC.", citationIDs: ["specialty_round15"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; TDF — CrCl <30 (TAF preferred or held) per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("BOXED — lactic acidosis / severe hepatomegaly with steatosis (NRTI class effect; rare but fatal) per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("BOXED — severe acute exacerbation of HBV on discontinuation; never stop without specialist guidance per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("TDF — renal toxicity (Fanconi syndrome, AKI) + decreased bone density; TAF lower risk per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Immune reconstitution syndrome — within months of starting ART.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, diarrhea, headache, fatigue, transaminitis; TDF — proximal tubulopathy, decreased BMD; TAF — modest weight gain, lipid increases.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Other nephrotoxic drugs (NSAIDs, aminoglycosides) — additive renal injury with TDF.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Ledipasvir / sofosbuvir + TDF — increased tenofovir; monitor renal.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Didanosine — increased exposure; avoid.", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + periodic creatinine, urinalysis, phosphate, calcium, vitamin D; bone density in chronic use.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hold / switch to TAF if CrCl decline.", citationIDs: ["specialty_round15"]),
            AttributedBullet("HBV — monitor LFTs; counsel never to discontinue without specialist oversight.", citationIDs: ["openfda_round15"]),
            AttributedBullet("PrEP — confirm HIV-negative every 3 months; renal monitoring; counsel adherence.", citationIDs: ["specialty_round15"])
        ],
        patientTeaching: AttributedProse(
            "Take daily — missed doses reduce protection. If you have hepatitis B, do NOT stop this medicine without your specialist — your liver could get worse fast. Drink fluids and tell us about bone pain, less urine, severe nausea, or stomach pain. Get blood tests as scheduled.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AtomoxetineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "atomoxetine",
        title: "Atomoxetine",
        subtitle: "Selective NE reuptake inhibitor · ADHD non-stimulant · suicidality boxed",
        category: "Selective NE reuptake inhibitor (non-stimulant ADHD)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective NE reuptake inhibitor"),
            KeyValueRow(key: "Indications", value: "ADHD ≥6 years (children, adolescents, adults)"),
            KeyValueRow(key: "Boxed", value: "Suicidal ideation in pediatric patients"),
            KeyValueRow(key: "Notable", value: "Onset gradual over 4–6 weeks; not a controlled substance")
        ],
        indications: AttributedProse(
            "Treatment of ADHD in patients ≥6 years; useful when stimulants poorly tolerated, not preferred, or substance-use risk per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "Selective inhibition of presynaptic norepinephrine transporter → enhanced NE availability in prefrontal cortex → improved attention + executive function.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "Pediatric ≤70 kg", body: "0.5 mg/kg/day; increase after 3+ days to ~1.2 mg/kg/day; max 1.4 mg/kg/day per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Adult / >70 kg", body: "40 mg/day → 80 mg/day after 3+ days → up to 100 mg/day; once daily or BID per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "CYP2D6 poor metabolizers / hepatic", body: "Reduce dose; titrate slowly per primary source.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "MAOI use within 14 days; narrow-angle glaucoma; pheochromocytoma; severe CV disease per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("BOXED — suicidal ideation in children + adolescents; monitor closely especially during initiation + dose changes per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hepatotoxicity (rare, severe) — counsel jaundice / dark urine / RUQ pain.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Cardiovascular — modest BP / HR increases; ECG / echo if structural anomalies.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Growth in children — track height / weight at follow-ups.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Decreased appetite, nausea, dyspepsia, fatigue, somnolence, dizziness, insomnia, dry mouth, urinary retention, sexual dysfunction.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("MAOI — within 14 days CONTRAINDICATED.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Strong CYP2D6 inhibitors (paroxetine, fluoxetine, bupropion) — reduce dose.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Albuterol / sympathomimetics — additive cardiovascular effects.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Other QT-prolonging drugs — caution.", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline BP, HR, weight + height (children — track at follow-ups), CV / cardiac history.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Monitor mood, suicidality (first weeks), BP / HR, growth in children.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Onset gradual over 4–6 weeks (vs stimulants — same day) — counsel patience.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Avoid MAOI 14-day washout.", citationIDs: ["openfda_round15"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth daily. It can take 4–6 weeks to feel the full effect — this is normal. Tell us right away about new sad, hopeless, or self-harm thoughts; about chest pain or racing heart; or about yellow eyes / skin or dark urine. Don't stop suddenly without talking to us.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TadalafilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tadalafil",
        title: "Tadalafil",
        subtitle: "PDE5 inhibitor · ED + BPH + PAH · contraindicated with nitrates · 36-hour duration",
        category: "Phosphodiesterase-5 inhibitor",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting (36-hour) PDE5 inhibitor"),
            KeyValueRow(key: "Indications", value: "ED, BPH symptom management, pulmonary arterial hypertension"),
            KeyValueRow(key: "Boxed-equivalent", value: "Contraindicated with NITRATES (any time) — life-threatening hypotension"),
            KeyValueRow(key: "Notable", value: "PRIAPISM >4 hours = emergency; sudden vision / hearing loss = emergency")
        ],
        indications: AttributedProse(
            "Erectile dysfunction (PRN or daily); benign prostatic hyperplasia symptom management (daily 5 mg); pulmonary arterial hypertension per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        mechanism: AttributedProse(
            "Selective PDE5 inhibitor → blocks degradation of cGMP → smooth muscle relaxation in corpora cavernosa, prostate, pulmonary vasculature.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "ED PRN", body: "10–20 mg PO PRN max once daily 30 min before activity per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "ED daily", body: "2.5–5 mg PO daily.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "BPH", body: "5 mg PO daily.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "PAH", body: "40 mg PO daily.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Concurrent organic nitrates (any form, any time); concurrent riociguat; severe CV instability; recent MI / stroke / unstable angina; severe hepatic impairment per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("CONTRAINDICATED with nitrates — life-threatening hypotension; 48-hour washout if emergent nitrate needed per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("CAUTION with α-1 antagonists — start lowest dose; full doses contraindicated.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Priapism (>4 hours) — emergency; tissue ischemia.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Sudden vision loss (NAION) / sudden hearing loss — emergency; discontinue.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Cardiovascular activity — assess exercise tolerance for safe sexual activity.", citationIDs: ["openrn_pharm_round15"])
        ],
        adverseReactions: AttributedProse(
            "Headache, flushing, nasal congestion, dyspepsia, back pain, myalgia, dizziness; rare priapism, NAION, sudden hearing loss.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Nitrates — CONTRAINDICATED.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Riociguat — CONTRAINDICATED (additive vasodilation).", citationIDs: ["openfda_round15"]),
            AttributedBullet("α-1 antagonists (tamsulosin, doxazosin) — caution; start low.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Strong CYP3A4 inhibitors (ketoconazole, ritonavir) — reduce dose.", citationIDs: ["openfda_round15"]),
            AttributedBullet("CYP3A4 inducers (rifampin) — reduced effect.", citationIDs: ["openfda_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Screen for nitrate use every visit; written + verbal warning.", citationIDs: ["openfda_round15"]),
            AttributedBullet("CV evaluation — exercise tolerance for sexual activity.", citationIDs: ["openrn_pharm_round15"]),
            AttributedBullet("Renal / hepatic adjustment.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Counsel medical-alert ID; never take if having chest pain.", citationIDs: ["openfda_round15"])
        ],
        patientTeaching: AttributedProse(
            "Do NOT take nitroglycerin or nitrate medications while on this drug — the combination can cause life-threatening low blood pressure. Tell every provider you take this. Erection lasting more than 4 hours, or sudden change in vision or hearing — go to the ER. Talk to your provider before sexual activity if you have heart disease.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ValacyclovirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "valacyclovir",
        title: "Valacyclovir",
        subtitle: "Acyclovir prodrug · HSV / VZV / shingles · renal adjustment · TTP/HUS rare",
        category: "Antiviral (acyclovir prodrug)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nucleoside analog antiviral (acyclovir prodrug)"),
            KeyValueRow(key: "Indications", value: "HSV genital + cold sore; VZV (shingles, varicella); HSV prophylaxis"),
            KeyValueRow(key: "Window", value: "Shingles — start within 72 hours of rash onset"),
            KeyValueRow(key: "Notable", value: "Renal adjustment; rare TTP/HUS at high doses in immunocompromised")
        ],
        indications: AttributedProse(
            "Treatment + suppression of genital herpes; treatment of herpes zoster (shingles) and chickenpox; cold sore single-day high-dose; HSV prophylaxis in chemoradiation / transplant per primary source.",
            citationIDs: ["openfda_round15", "specialty_round15"]
        ),
        mechanism: AttributedProse(
            "L-valyl prodrug rapidly hydrolyzed to acyclovir → phosphorylated by viral thymidine kinase → inhibits viral DNA polymerase + chain termination.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "Genital herpes initial", body: "1 g PO BID × 10 days per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Recurrent / suppressive", body: "Recurrent — 500 mg BID × 3 days; suppressive — 500 mg–1 g daily per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Shingles", body: "1 g PO TID × 7 days starting within 72 hours of rash onset per primary source.", citationIDs: ["specialty_round15"]),
            DosingBlock(label: "Cold sore", body: "2 g PO BID × 1 day per primary source.", citationIDs: ["openfda_round15"]),
            DosingBlock(label: "Renal", body: "Adjust per CrCl table; risk of neurotoxicity in CKD without adjustment.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to valacyclovir or acyclovir per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("Thrombotic thrombocytopenic purpura / hemolytic uremic syndrome — rare but can be fatal in immunocompromised at high doses per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Renal toxicity / acute kidney injury — dehydration, elderly, CKD; ensure adequate hydration; renal adjustment per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Neurotoxicity — confusion, hallucinations, seizures, especially in CKD / dialysis without dose adjustment.", citationIDs: ["openfda_round15"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, abdominal pain, dizziness; rare AKI, neurotoxicity, TTP/HUS.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid + cimetidine — reduce renal clearance of acyclovir; modest effect.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Other nephrotoxic drugs — additive renal injury.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Live attenuated zoster vaccine — antiviral can interfere; coordinate timing.", citationIDs: ["specialty_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Renal adjustment + adequate hydration — neurotoxicity / AKI in dehydration / CKD.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Start herpes zoster within 72 hours of onset for benefit per primary source.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Monitor renal function + neuro status (confusion, hallucinations) particularly elderly / CKD.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Counsel transmission risk reduction with suppressive therapy + condom use.", citationIDs: ["specialty_round15"])
        ],
        patientTeaching: AttributedProse(
            "Take with plenty of water. For shingles, start within 72 hours of the rash. Suppressive therapy reduces but does not eliminate transmission to a partner — use condoms. After shingles, get the Shingrix vaccine to prevent recurrence. Call us for confusion, decreased urine output, or new severe weakness.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum GlucarpidaseSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "glucarpidase",
        title: "Glucarpidase",
        subtitle: "Methotrexate rescue · recombinant carboxypeptidase G2 · IV single dose · rapid MTX clearance",
        category: "Methotrexate-toxicity rescue (recombinant enzyme)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant bacterial carboxypeptidase G2"),
            KeyValueRow(key: "Indications", value: "MTX-induced AKI with delayed clearance (HDMTX)"),
            KeyValueRow(key: "Threshold", value: "MTX >1 µmol/L at 36–42 hours due to AKI"),
            KeyValueRow(key: "Critical", value: "Do NOT give leucovorin within 2 hours before/after — leucovorin is enzyme substrate")
        ],
        indications: AttributedProse(
            "Treatment of toxic plasma methotrexate concentrations (>1 µmol/L at 36–42 hours after high-dose MTX) due to impaired renal function per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        mechanism: AttributedProse(
            "Hydrolyzes methotrexate to inactive metabolites (DAMPA + glutamate) in the extracellular space → rapid (within 15 minutes) reduction of plasma MTX by >97%.",
            citationIDs: ["openfda_round15"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "50 units/kg IV × 1 over 5 minutes; second dose if MTX remains elevated per primary source.", citationIDs: ["openfda_round15"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to glucarpidase per primary source.",
            citationIDs: ["openfda_round15"]
        ),
        warnings: [
            AttributedBullet("Continue concurrent leucovorin + hydration + urinary alkalinization per primary source.", citationIDs: ["specialty_round15"]),
            AttributedBullet("DO NOT administer leucovorin within 2 hours before / after glucarpidase — leucovorin is enzyme substrate per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Use HPLC for MTX measurement after glucarpidase — immunoassays cross-react with DAMPA → falsely high readings per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Hemodialysis is NOT effective for MTX — does not replace glucarpidase.", citationIDs: ["specialty_round15"])
        ],
        adverseReactions: AttributedProse(
            "Hypersensitivity reaction (rare), paresthesia, flushing, headache, nausea, vomiting.",
            citationIDs: ["openfda_round15"]
        ),
        drugInteractions: [
            AttributedBullet("Leucovorin — enzyme substrate; separate by 2 hours before / after dose per primary source.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Folate-related drugs — leucovorin must continue between glucarpidase windows.", citationIDs: ["specialty_round15"])
        ],
        nursingImplications: [
            AttributedBullet("Identify high-risk MTX patients early; serial serum MTX measurement; pharmacy / oncology consultation.", citationIDs: ["specialty_round15"]),
            AttributedBullet("Continue hydration + urinary alkalinization (target urine pH ≥7.0).", citationIDs: ["specialty_round15"]),
            AttributedBullet("Coordinate leucovorin timing strictly around glucarpidase administration.", citationIDs: ["openfda_round15"]),
            AttributedBullet("Monitor renal function, electrolytes, transaminases; track MTX clearance via HPLC.", citationIDs: ["specialty_round15"])
        ],
        patientTeaching: AttributedProse(
            "This medicine is given through your IV one time to clear high levels of chemotherapy from your body. You'll keep getting fluids and another medicine called leucovorin on a careful schedule. Tell us about chest pain, breathing changes, or rash during or after the infusion.",
            citationIDs: ["openrn_pharm_round15"]
        ),
        citations: [openfda, openrnPharmR15, specialtyR15],
        lastSourceFidelityReview: "2026-05-04"
    )
}
