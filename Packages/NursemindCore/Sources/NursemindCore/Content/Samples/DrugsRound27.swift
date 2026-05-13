import Foundation

// Curator-model drug entries (round 27 — rheumatology biologics + JAK inhibitors).

private let openfdaR27 = CitationSource(
    id: "openfda_round27",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR27 = CitationSource(
    id: "openrn_pharm_round27",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR27 = CitationSource(
    id: "specialty_round27",
    shortName: "ACR + EULAR + AAD + ASCO + ASCEND concept citations",
    publisher: "ACR · EULAR · AAD · ASCO",
    license: .factCitationOnly,
    url: "https://www.rheumatology.org/Practice-Quality/Clinical-Support/Clinical-Practice-Guidelines",
    lastRetrieved: "2026-05-13"
)
private let ismpR27 = CitationSource(
    id: "ismp_round27",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum AbataceptSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "abatacept",
        title: "Abatacept (Orencia)",
        subtitle: "CTLA-4-Ig fusion · T-cell co-stimulation blocker · RA + JIA + PsA · IV monthly OR SC weekly · TB + HBV screening pre-start",
        category: "T-cell co-stimulation blocker (CTLA-4 fusion) — biologic DMARD",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "CTLA-4-Ig fusion protein — blocks T-cell co-stimulation"),
            KeyValueRow(key: "Use", value: "Rheumatoid arthritis (moderate-severe); juvenile idiopathic arthritis (JIA); psoriatic arthritis"),
            KeyValueRow(key: "Dose IV", value: "Weight-based: <60 kg = 500 mg; 60-100 kg = 750 mg; >100 kg = 1000 mg IV at 0, 2, 4 weeks then monthly"),
            KeyValueRow(key: "Dose SC", value: "125 mg SC weekly after IV loading OR initial 125 mg SC weekly"),
            KeyValueRow(key: "Watch", value: "Infections (URI, pneumonia, TB reactivation, HBV); pre-treatment TB + HBV screening; avoid live vaccines")
        ],
        indications: AttributedProse(
            "Moderate-severe rheumatoid arthritis with inadequate response to methotrexate or TNF inhibitors; juvenile idiopathic arthritis (JIA — polyarticular ≥6 years); psoriatic arthritis. Combination with methotrexate often preferred per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "CTLA-4-Ig fusion protein — selectively binds CD80/CD86 on antigen-presenting cells → blocks co-stimulation of T cells (prevents the \"second signal\" required for T-cell activation) → reduces T-cell-mediated inflammation in RA + other autoimmune conditions.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult RA — IV", body: "Weight-based: <60 kg = 500 mg; 60-100 kg = 750 mg; >100 kg = 1000 mg IV at weeks 0, 2, 4, then every 4 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult RA — SC", body: "125 mg SC weekly (with or without IV loading); preferred by many patients for home administration per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric JIA (≥6 years)", body: "Weight-based IV: 10 mg/kg (≤75 kg) OR adult dosing if ≥75 kg per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Psoriatic arthritis", body: "125 mg SC weekly OR IV at weeks 0, 2, 4 then monthly.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Active serious infection (sepsis, TB, opportunistic); hypersensitivity. Caution — recurrent infections, COPD (increased pulmonary infections), latent TB / HBV (treat before), planned surgery (hold during perioperative period).",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("INFECTIONS — increased risk (URI, pneumonia, UTI, herpes zoster, TB reactivation); pre-treatment TB testing (PPD or IGRA) + treatment if latent; HBV screening per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("AVOID LIVE VACCINES during therapy + 3 months after (no MMR, varicella, yellow fever, intranasal flu).", citationIDs: ["specialty_round27"]),
            AttributedBullet("INACTIVATED VACCINES — give 2+ weeks BEFORE initiation when possible.", citationIDs: ["specialty_round27"]),
            AttributedBullet("ANTI-TNF combination — increased infection risk; generally avoid combining biologics.", citationIDs: ["openfda_round27"]),
            AttributedBullet("COPD — increased risk of pulmonary infections + exacerbations.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MALIGNANCY — possible increased risk (limited data); skin cancer monitoring.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFUSION REACTIONS — mild + uncommon; observe.", citationIDs: ["openfda_round27"]),
            AttributedBullet("PREGNANCY — Category C; abatacept crosses placenta in 3rd trimester; risk-benefit; resume after delivery.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LATENT TB — treat with isoniazid (or rifampin) BEFORE OR concurrent with abatacept; counsel.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infections, headache, nausea, dizziness, infusion reactions (mild), nasopharyngitis, hypertension, increased liver enzymes, malignancy (slight increase).",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Other BIOLOGICS or JAK inhibitors — additive infection risk; avoid combination.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LIVE VACCINES — contraindicated; avoid concurrent + 3 months after.", citationIDs: ["specialty_round27"]),
            AttributedBullet("METHOTREXATE — synergistic; commonly combined.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Hepatotoxic drugs — caution with combinations.", citationIDs: ["openfda_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB testing (PPD or IGRA), HBV screening (HBsAg + HBcAb + HBsAb), CBC, LFTs, hepatitis C; vaccinations up-to-date per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFUSION protocol — 30 minutes over IV; observe; rare reactions.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("SC INJECTION — teach patient self-administration; abdomen / thigh / upper arm rotation.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("PERIODIC MONITORING — CBC + LFTs at 2 months then q3-6 months; signs of infection at every visit.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFECTION counseling — fever, dyspnea, dysuria, cough, skin lesions; SEEK CARE.", citationIDs: ["specialty_round27"]),
            AttributedBullet("VACCINATIONS — annual flu, pneumococcal, zoster shingles (recombinant Shingrix); avoid live; communicate to all providers.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PERIOPERATIVE — hold 1-2 months before elective surgery; resume after healing without infection.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Pregnancy planning — counsel risks + benefits; rheumatology + MFM coordination.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats your RA by blocking T-cells. You'll get monthly IV infusions OR weekly SC shots. Tell us before traveling outside US — some vaccines (yellow fever, MMR) can't be given. Tell us about fever, infections, cough, breathing trouble. Get annual flu + Shingrix shots. Stop 1-2 months before surgery.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BelimumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "belimumab",
        title: "Belimumab (Benlysta)",
        subtitle: "Anti-BLyS · ONLY FDA-approved SLE biologic · IV monthly OR SC weekly · gradual benefit over weeks-months · TB + suicide monitoring",
        category: "Anti-BLyS (B-lymphocyte stimulator) monoclonal antibody — SLE-specific",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized monoclonal antibody against B-lymphocyte stimulator (BLyS) / BAFF"),
            KeyValueRow(key: "Use", value: "Active SLE despite standard therapy; lupus nephritis (FDA-approved 2020); active autoantibody-positive SLE in adults + pediatric ≥5 years"),
            KeyValueRow(key: "Dose IV", value: "10 mg/kg IV at weeks 0, 2, 4 then monthly"),
            KeyValueRow(key: "Dose SC", value: "200 mg SC weekly (after IV loading) OR initial SC weekly"),
            KeyValueRow(key: "Watch", value: "Infections, suicide risk (FDA monitoring), depression, infusion reactions, pre-treatment TB + HBV screening")
        ],
        indications: AttributedProse(
            "Active autoantibody-positive systemic lupus erythematosus (SLE) in adults + pediatric ≥5 years; lupus nephritis (FDA-approved 2020) per primary source. Combined with standard SLE therapy (hydroxychloroquine, steroids, immunosuppressants).",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Recombinant humanized monoclonal antibody — binds soluble B-lymphocyte stimulator (BLyS / BAFF) → prevents binding to B-cell receptors → reduces survival of B-cells + reduces autoantibody production + immune complex formation in SLE.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult IV", body: "10 mg/kg IV over 1 hour at weeks 0, 2, 4, then every 4 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult SC", body: "200 mg SC weekly per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric (≥5 years; SLE)", body: "10 mg/kg IV at weeks 0, 2, 4 then every 4 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric (≥5 years; SC SLE)", body: "Body weight-based: 200 mg SC weekly for ≥40 kg; lower dose <40 kg.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Lupus nephritis", body: "Combined with standard therapy (mycophenolate or cyclophosphamide + steroids); IV 10 mg/kg dosing same.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to belimumab. Caution — active severe infection, history of severe depression / suicidality (close monitoring), pregnancy (limited data; assess benefit-risk).",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("SUICIDE RISK monitoring — FDA-required; clinical trials showed slight increase in suicidal ideation; screen mental health at every visit per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFECTIONS — bacterial, viral, fungal; pre-treatment screening — TB (PPD or IGRA), HBV, HCV; CBC, LFTs.", citationIDs: ["specialty_round27"]),
            AttributedBullet("AVOID LIVE VACCINES during therapy + 30 days before/after; influenza, MMR, varicella, zoster (live), yellow fever.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFUSION REACTIONS — fever, urticaria, dyspnea; pre-medication (acetaminophen + diphenhydramine) for prior reactions; observe ≥1 hour after IV.", citationIDs: ["openfda_round27"]),
            AttributedBullet("DEPRESSION + SUICIDAL IDEATION — possible association; counsel + monitor; suicidal ideation report.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PML (progressive multifocal leukoencephalopathy) — very rare; new neurologic symptoms → emergent evaluation; JCV reactivation.", citationIDs: ["specialty_round27"]),
            AttributedBullet("ANGIOEDEMA / anaphylaxis — rare; counsel + monitor; alternative if severe.", citationIDs: ["openfda_round27"]),
            AttributedBullet("MALIGNANCY — potential B-cell suppression effects; skin cancer monitoring.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PREGNANCY — Category C; limited human data; weigh benefits vs continued SLE activity; pregnancy registry per primary source.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, diarrhea, fever, infusion reactions, headache, depression, insomnia, urinary tract infection, respiratory infection, leukopenia, hypersensitivity reactions.",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Other BIOLOGICS / immunosuppressants — additive infection risk + immunosuppression.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Live vaccines — contraindicated within 30 days.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Concurrent SLE therapy — standard combination with hydroxychloroquine, low-dose steroids, mycophenolate, cyclophosphamide.", citationIDs: ["specialty_round27"]),
            AttributedBullet("RITUXIMAB combination — limited data; assess separately.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB testing (PPD or IGRA), HBV (HBsAg + HBcAb + HBsAb), HCV, CBC, LFTs, vaccinations up-to-date.", citationIDs: ["specialty_round27"]),
            AttributedBullet("BASELINE depression screen (PHQ-9); counsel + monitor at each visit.", citationIDs: ["specialty_round27"]),
            AttributedBullet("IV INFUSION 1 hour; pre-medication for prior reactions; observe ≥1 hour after.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("SC self-injection — abdomen, thigh, upper arm; rotate sites; teaching.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("GRADUAL ONSET — clinical benefit takes 8-12 weeks; counsel patience; continued standard SLE therapy meanwhile.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MONITOR — CBC, LFTs, signs of infection, mood, neurologic symptoms.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFECTION precautions counseling + emergent evaluation criteria.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Vaccinations — flu + pneumococcal + Shingrix (zoster recombinant — safe); influenza nasal LIVE contraindicated.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Pregnancy + reproductive — discuss carefully; pregnancy registry; MFM consultation.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats lupus by reducing the cells that make harmful antibodies. You'll get monthly IV infusions OR weekly SC shots. It takes 2-3 months to feel better. Tell us right away about thoughts of suicide, severe depression, fever, infections, or new neurologic problems. Avoid live vaccines.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AnifrolumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "anifrolumab",
        title: "Anifrolumab (Saphnelo)",
        subtitle: "Anti-type I interferon receptor · moderate-severe SLE · IV monthly · adjunct to standard therapy · TB + zoster screen pre-start",
        category: "Anti-type I interferon receptor monoclonal antibody — SLE",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against type I interferon receptor 1 (IFNAR1)"),
            KeyValueRow(key: "Use", value: "Moderate-severe SLE despite standard therapy — FDA-approved 2021"),
            KeyValueRow(key: "Dose", value: "300 mg IV over 30 min every 4 weeks"),
            KeyValueRow(key: "Watch", value: "Infections (URI, herpes zoster reactivation, bronchitis); pre-treatment TB + zoster vaccine consideration; infusion reactions rare")
        ],
        indications: AttributedProse(
            "Moderate-severe systemic lupus erythematosus (SLE) in adults receiving standard therapy. FDA-approved 2021. Reduces disease activity + flares + steroid use vs placebo per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Human IgG1 monoclonal antibody — binds subunit 1 of type I IFN receptor (IFNAR1) → blocks type I interferon signaling. Type I IFN is upregulated in SLE + drives autoimmune inflammation. Anifrolumab reduces IFN gene expression + immune complex deposition.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult SLE", body: "300 mg IV over 30 minutes every 4 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric", body: "Not approved; specialty.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to anifrolumab. Caution — active serious infection, latent TB (treat first), HBV (treat first), planned surgery, pregnancy.",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("INFECTIONS — particularly upper respiratory + bronchitis; pre-treatment TB testing (PPD or IGRA) per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HERPES ZOSTER reactivation increased — consider Shingrix vaccine pre-treatment if eligible.", citationIDs: ["specialty_round27"]),
            AttributedBullet("AVOID LIVE VACCINES — MMR, varicella, yellow fever, intranasal flu, zoster live (Zostavax — outdated).", citationIDs: ["specialty_round27"]),
            AttributedBullet("RESPIRATORY infections — increased frequency; pneumonia screening; bronchitis monitoring.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFUSION REACTIONS — uncommon; observe; pre-medication for prior reactions.", citationIDs: ["openfda_round27"]),
            AttributedBullet("MALIGNANCY — limited data; surveillance for skin + other cancers.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HBV — screen + treat latent before initiation.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PREGNANCY — limited human data; assess benefits vs lupus activity; pregnancy registry.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infections, bronchitis, herpes zoster, infusion reactions, hypersensitivity, headache, nausea, dyspepsia.",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Other BIOLOGICS / immunosuppressants — additive infection risk.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LIVE VACCINES contraindicated.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Standard SLE therapy continued — hydroxychloroquine + steroids + mycophenolate; combinations effective.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB testing, HBV/HCV screening, CBC, LFTs, vaccinations up-to-date including Shingrix if eligible.", citationIDs: ["specialty_round27"]),
            AttributedBullet("IV INFUSION 30 min; observe; pre-medication for prior reactions.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("MONTHLY scheduling; patient-facing infusion clinic.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("MONITOR — signs of infection at every visit; flu / pneumonia symptoms; herpes zoster.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — vaccination schedule, infection precautions, no live vaccines.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Pregnancy planning — discuss; alternatives may be safer for those planning pregnancy.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Continuation of standard SLE therapy as needed — anifrolumab is add-on, not replacement.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "This medicine is added to your lupus treatment. You get an IV infusion every 4 weeks. It reduces lupus flares + may let us reduce your steroid dose. Tell us about respiratory infections, fever, shingles rash, or unusual symptoms. Stay up-to-date on flu + pneumonia vaccines. No live vaccines.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VoclosporinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "voclosporin",
        title: "Voclosporin (Lupkynis)",
        subtitle: "Calcineurin inhibitor · lupus nephritis · combine with MMF + steroids · monitor renal + BP · IMPROVED renal response in trials",
        category: "Calcineurin inhibitor (CNI) — lupus nephritis-specific",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Calcineurin inhibitor (next-generation cyclosporine analog) — selective for nephritis"),
            KeyValueRow(key: "Use", value: "Active lupus nephritis in combination with mycophenolate + corticosteroids (FDA-approved 2021)"),
            KeyValueRow(key: "Dose", value: "23.7 mg PO BID; take consistently with meal patterns; avoid grapefruit"),
            KeyValueRow(key: "Watch", value: "Renal toxicity (Cr increase, eGFR decrease), HTN, hyperkalemia, infections, fetal risk; close BP + renal monitoring")
        ],
        indications: AttributedProse(
            "Active lupus nephritis in adults — IN COMBINATION with mycophenolate mofetil + corticosteroids. FDA-approved 2021 (AURORA 1 trial showed improved complete renal response vs MMF + steroids alone) per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Calcineurin inhibitor — binds cyclophilin → inhibits calcineurin → blocks T-cell activation + IL-2 production → reduces autoimmune response. Modified structure vs cyclosporine A → more predictable PK + less metabolite variability + tighter therapeutic window.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult lupus nephritis", body: "23.7 mg PO BID per primary source; take consistently with respect to meals.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal adjustment", body: "Hold or reduce for eGFR <45 mL/min/1.73 m² OR significant Cr rise (>30% from baseline).", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Hepatic adjustment", body: "Hepatic impairment — reduce dose; specialty.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Strong CYP3A4 inhibitor", body: "Voclosporin DOSE REDUCED to 15.8 mg AM + 7.9 mg PM (~50% reduction) per primary source.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Concurrent strong CYP3A4 INDUCERS (rifampin, St. John's wort) — significantly reduce voclosporin; avoid. Concurrent strong CYP3A4 INHIBITORS (ketoconazole, ritonavir, clarithromycin) — dose adjustment per primary source. Pregnancy (Category D — embryo-fetal risk).",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("RENAL TOXICITY — Cr increase + eGFR decrease (CNI nephrotoxicity); HOLD for Cr >30% rise OR eGFR <45; monitor Cr + eGFR every 2 weeks initially + then monthly per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HYPERTENSION — common (~30%); monitor + treat with non-dihydropyridine CCB preferred (amlodipine; AVOID diltiazem + verapamil — CYP3A4 inhibitors).", citationIDs: ["specialty_round27"]),
            AttributedBullet("HYPERKALEMIA — common; monitor K+; adjust diet + avoid K-sparing diuretics.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFECTIONS — bacterial + viral + fungal; immunosuppression; PCP prophylaxis selective.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MALIGNANCY — long-term immunosuppression risk; skin cancer surveillance; lymphoma rare.", citationIDs: ["specialty_round27"]),
            AttributedBullet("CYP3A4 DRUG INTERACTIONS — narrow therapeutic window; meticulous review.", citationIDs: ["openfda_round27"]),
            AttributedBullet("PREGNANCY — Category D; reliable contraception; pregnancy registry; alternative therapies for pregnancy.", citationIDs: ["specialty_round27"]),
            AttributedBullet("ELECTROLYTE imbalances — hypomagnesemia, hyperuricemia.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Renal toxicity (Cr increase), HTN, headache, diarrhea, anemia, cough, upper respiratory infection, hyperkalemia, hypomagnesemia, tremor, gum overgrowth (gingival hyperplasia), hirsutism.",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS (ketoconazole, ritonavir, clarithromycin) — significantly increase voclosporin; REDUCE DOSE 50%.", citationIDs: ["openfda_round27"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, St. John's wort, phenytoin) — decrease voclosporin; AVOID concurrent.", citationIDs: ["openfda_round27"]),
            AttributedBullet("CALCIUM CHANNEL BLOCKERS — non-DHP (diltiazem, verapamil) inhibit CYP3A4 + increase voclosporin; AVOID; amlodipine + nifedipine preferred.", citationIDs: ["specialty_round27"]),
            AttributedBullet("STATINS — increased levels; monitor for rhabdomyolysis; dose adjustment.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MMF (mycophenolate) — standard combination for lupus nephritis; no PK interaction.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Live vaccines — avoid.", citationIDs: ["specialty_round27"]),
            AttributedBullet("GRAPEFRUIT — inhibits CYP3A4; AVOID.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — eGFR + Cr baseline; BP; K+; pregnancy test + reliable contraception.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MONITOR — Cr + eGFR + BP + K+ every 2 weeks initially → monthly; reduce dose / hold per parameters.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PATIENT EDUCATION — consistent meal timing for absorption; avoid grapefruit; report HTN symptoms.", citationIDs: ["specialty_round27"]),
            AttributedBullet("DRUG INTERACTIONS reviewed at every prescription change; pharmacist consultation.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HTN management — amlodipine or nifedipine preferred; avoid diltiazem + verapamil.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFECTION precautions counseling + emergent evaluation.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Vaccinations — pneumococcal, flu, Shingrix recombinant; avoid live.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Pregnancy planning — reliable contraception; pre-pregnancy planning with MFM + rheumatology.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "Take this twice daily with your meals (be consistent — same way every day). AVOID grapefruit + Seville oranges. Tell us about all medicines, including OTC + supplements. Get blood pressure + lab tests as scheduled. Use reliable birth control. Tell us about decreased urine output, swelling, fever, or infection.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CanakinumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "canakinumab",
        title: "Canakinumab (Ilaris)",
        subtitle: "Anti-IL-1β monoclonal · CAPS / FMF / TRAPS / sJIA / Still / gout · long T1/2 q8 weeks SC · pre-screening TB + active infection",
        category: "Anti-IL-1β monoclonal antibody — autoinflammatory diseases",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against IL-1β"),
            KeyValueRow(key: "Use", value: "Cryopyrin-associated periodic syndromes (CAPS), familial Mediterranean fever (FMF), TRAPS, mevalonate kinase deficiency, systemic juvenile idiopathic arthritis (sJIA), Adult Still's disease, refractory gout / pseudogout"),
            KeyValueRow(key: "Dose", value: "Variable per indication; CAPS adult — 150 mg SC every 8 weeks; sJIA — 4 mg/kg SC every 4 weeks"),
            KeyValueRow(key: "Watch", value: "Infections, TB reactivation, injection site reactions; long T1/2 (~26 days) means slow on / off effects")
        ],
        indications: AttributedProse(
            "Autoinflammatory IL-1β-mediated diseases — CRYOPYRIN-ASSOCIATED PERIODIC SYNDROMES (CAPS including familial cold autoinflammatory + Muckle-Wells + neonatal-onset multisystem inflammatory disease NOMID); FAMILIAL MEDITERRANEAN FEVER (colchicine-resistant); TRAPS, HIDS / MKD, systemic JIA, ADULT STILL'S DISEASE; REFRACTORY GOUT / pseudogout when standard therapy contraindicated / failed per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Human monoclonal antibody binds + neutralizes IL-1β cytokine → blocks downstream inflammatory signaling. IL-1β is central in autoinflammatory diseases driven by inflammasome (NLRP3) activation. Effect long-lasting (T1/2 ~26 days).",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "CAPS adult / pediatric ≥4 yrs ≥40 kg", body: "150 mg SC every 8 weeks; titrate per response per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "CAPS pediatric ≥4 yrs <40 kg", body: "2 mg/kg SC every 8 weeks.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Systemic JIA (≥2 yrs)", body: "4 mg/kg SC every 4 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "FMF / TRAPS / HIDS", body: "150 mg SC every 4 weeks (or 2 mg/kg <40 kg) per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult Still's disease", body: "4 mg/kg (max 300 mg) SC every 4 weeks; alternative to anakinra.", citationIDs: ["specialty_round27"]),
            DosingBlock(label: "Refractory gout flare", body: "150 mg SC single dose during acute flare (off-label primary in some countries).", citationIDs: ["specialty_round27"])
        ],
        contraindications: AttributedProse(
            "Active serious infection; hypersensitivity. Caution — recurrent infections, latent TB (treat first), HBV / HCV / HIV (active), severe cytopenias, malignancy.",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("INFECTIONS — increased bacterial + opportunistic; particularly respiratory; PCP prophylaxis for selected; counsel + monitor per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("TB REACTIVATION — pre-treatment PPD or IGRA; treat latent TB before starting.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HBV REACTIVATION — screen + treat carriers.", citationIDs: ["specialty_round27"]),
            AttributedBullet("AVOID LIVE VACCINES during therapy.", citationIDs: ["specialty_round27"]),
            AttributedBullet("CYTOPENIAS — uncommon; periodic CBC monitoring.", citationIDs: ["openfda_round27"]),
            AttributedBullet("HEPATOTOXICITY — rare; LFT monitoring.", citationIDs: ["openfda_round27"]),
            AttributedBullet("HYPERSENSITIVITY — anaphylaxis rare; observe for reactions.", citationIDs: ["openfda_round27"]),
            AttributedBullet("PREGNANCY — Category C; limited data; pregnancy registry; assess benefit-risk.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LONG HALF-LIFE — effects persist weeks; surgery / infection considerations.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infections, injection site reactions, headache, vertigo, gastroenteritis, nasopharyngitis, increased weight, cytopenias (rare), hypersensitivity.",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Other biologics + immunosuppressants — additive infection risk.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Live vaccines — contraindicated.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Anakinra — similar mechanism; specialty switching.", citationIDs: ["specialty_round27"]),
            AttributedBullet("CYP3A4 substrate-affecting drugs — may need adjustment; cytokines affect CYP450.", citationIDs: ["openfda_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB, HBV, HCV screening; CBC; LFTs; vaccinations.", citationIDs: ["specialty_round27"]),
            AttributedBullet("SC ADMINISTRATION — abdomen, thigh, upper arm rotation; teach self-injection.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("INFREQUENT dosing — q8 weeks (CAPS); q4 weeks (sJIA/FMF) — easy schedule for many patients.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MONITOR — infections, CBC, LFTs, disease activity.", citationIDs: ["specialty_round27"]),
            AttributedBullet("FAMILY screening — many autoinflammatory diseases hereditary; genetic counseling.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MAS (macrophage activation syndrome) in sJIA — emergent; recognize features; anakinra + steroids; specialty.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel on infection signs + emergent evaluation.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Vaccinations — flu, pneumococcal, Shingrix; avoid live.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "This medicine blocks the inflammatory chemical that drives your disease. You'll inject this under your skin every 4 to 8 weeks. Tell us about fever, infections, or symptoms returning between doses. Get flu + pneumonia shots — avoid live vaccines. Continue regular labs + follow-up.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AnakinraSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "anakinra",
        title: "Anakinra (Kineret)",
        subtitle: "IL-1 receptor antagonist · daily SC · Still / MAS / NOMID / CAPS / refractory gout · short half-life · cheaper than canakinumab · injection site",
        category: "IL-1 receptor antagonist (recombinant) — autoinflammatory + sJIA + Still's",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant IL-1 receptor antagonist (IL-1Ra)"),
            KeyValueRow(key: "Use", value: "RA (rare today); CAPS / NOMID; familial Mediterranean fever; systemic JIA; Adult Still's disease; macrophage activation syndrome (MAS); refractory gout flare"),
            KeyValueRow(key: "Dose", value: "100 mg SC DAILY (adult RA / Still); higher for CAPS / NOMID; MAS — pulses + continuous infusion"),
            KeyValueRow(key: "Watch", value: "INJECTION SITE reactions COMMON (~70%); infections; TB screening; short T1/2 ~4-6 hrs allows rapid stop")
        ],
        indications: AttributedProse(
            "Active rheumatoid arthritis (less commonly used now, biologic alternatives preferred); CRYOPYRIN-ASSOCIATED PERIODIC SYNDROMES (CAPS / NOMID — FDA approved); systemic juvenile idiopathic arthritis (sJIA); Adult Still's disease; MACROPHAGE ACTIVATION SYNDROME (MAS — off-label, life-saving); familial Mediterranean fever; refractory gout flare; severe COVID-19 / sepsis (off-label investigational) per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Recombinant human IL-1 receptor antagonist (IL-1Ra) — competitively blocks IL-1 receptor → prevents IL-1α + IL-1β signaling → reduces inflammation. Short T1/2 (~4-6 hrs) allows rapid on/off effect — useful for MAS where immediate cessation possible.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult RA", body: "100 mg SC daily per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult Still's disease + sJIA", body: "1-2 mg/kg SC daily (max 100 mg adult); flare 2-4 mg/kg/day possible.", citationIDs: ["specialty_round27"]),
            DosingBlock(label: "CAPS / NOMID", body: "Start 1-2 mg/kg/day SC; titrate to control symptoms; higher doses common.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Macrophage activation syndrome (MAS)", body: "2-5 mg/kg/day SC OR pulses (10-15 mg/kg/day) for severe per primary source; life-saving in HLH / sJIA-MAS.", citationIDs: ["specialty_round27"]),
            DosingBlock(label: "Refractory gout flare", body: "100 mg SC daily × 3 days OR single dose.", citationIDs: ["specialty_round27"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce dose for CrCl <30 mL/min; specialty.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Active serious infection; TB / HBV active. Caution — renal impairment (reduce dose), recurrent infections.",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("INJECTION SITE REACTIONS — VERY COMMON (~70% — redness, swelling, induration; usually mild + resolves over weeks); rotate sites; topical antihistamine + cool compresses per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFECTIONS — bacterial + opportunistic; TB pre-screening; HBV; PCP prophylaxis selective.", citationIDs: ["specialty_round27"]),
            AttributedBullet("AVOID LIVE VACCINES during therapy + 1 month after.", citationIDs: ["specialty_round27"]),
            AttributedBullet("DAILY SC injection — adherence concern; teach proper technique.", citationIDs: ["specialty_round27"]),
            AttributedBullet("NEUTROPENIA — possible; monitor CBC.", citationIDs: ["openfda_round27"]),
            AttributedBullet("ELDERLY — higher infection risk; caution.", citationIDs: ["openfda_round27"]),
            AttributedBullet("PREGNANCY — Category B; limited human data; assess benefits.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Injection site reactions (very common), headache, nausea, upper respiratory infections, sinusitis, gastroenteritis, neutropenia (rare), hypersensitivity reactions.",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Other biologics — increased infection risk; avoid combination.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Live vaccines — avoid.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Standard DMARDs (methotrexate, hydroxychloroquine) — compatible; combination common.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB, HBV, HCV, CBC, vaccinations.", citationIDs: ["specialty_round27"]),
            AttributedBullet("DAILY SC injection — teach self-administration; rotate sites; consistent timing.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("INJECTION SITE management — common but usually self-limited; counsel; cool compresses, topical hydrocortisone, antihistamines.", citationIDs: ["specialty_round27"]),
            AttributedBullet("STORAGE — refrigerate; allow 30 min room temp before injection.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("MONITOR — infections + CBC q3-6 months.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MAS — life-threatening; pulses or continuous infusion for severe; specialty.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — when to skip dose (active infection, surgery prep, etc.); resume after.", citationIDs: ["specialty_round27"]),
            AttributedBullet("SHORT HALF-LIFE — rapid off if infection / complications; useful flexibility.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "Inject this daily under your skin. Injection site redness, swelling, + itching are very common — they get better. Rotate where you inject. Tell us about infections, breathing trouble, fever. Store in fridge; warm to room temp before injecting. Stop temporarily if you have a serious infection — we'll let you know.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ApremilastSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "apremilast",
        title: "Apremilast (Otezla)",
        subtitle: "PDE4 inhibitor · ORAL psoriasis + PsA + Behcet · NO biologic monitoring · GI side effects · weight loss · depression risk · gradual titration",
        category: "Phosphodiesterase 4 (PDE4) inhibitor — psoriasis + autoinflammatory",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective PDE4 inhibitor — small molecule oral immunomodulator"),
            KeyValueRow(key: "Use", value: "Moderate-severe psoriasis + psoriatic arthritis + oral ulcers of Behcet's disease"),
            KeyValueRow(key: "Dose", value: "Gradual titration: 10 mg AM day 1, 10 mg BID day 2-3, 20 mg AM day 3-4, 20 mg BID day 4-5, 30 mg BID day 6+; maintenance 30 mg BID"),
            KeyValueRow(key: "Watch", value: "GI side effects (diarrhea, nausea) — common; weight loss; depression / suicidality (FDA warning); no major TB / HBV monitoring vs biologics")
        ],
        indications: AttributedProse(
            "Moderate-to-severe plaque psoriasis; psoriatic arthritis; oral ulcers of Behcet's disease (FDA-approved). Convenient ORAL alternative to injectable biologics; lower efficacy than newer biologics but acceptable safety profile + no TB / HBV monitoring requirement per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Selective phosphodiesterase 4 (PDE4) inhibitor → increases intracellular cAMP → modulates pro-inflammatory cytokine production (TNF-α, IL-12, IL-23, IFN-γ) + anti-inflammatory (IL-10) → reduces psoriatic inflammation. Small molecule oral; not biologic; no immunosuppression vs biologics.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "TITRATION schedule", body: "Day 1: 10 mg AM; Day 2: 10 mg AM + 10 mg PM; Day 3: 10 mg AM + 20 mg PM; Day 4: 20 mg AM + 20 mg PM; Day 5: 20 mg AM + 30 mg PM; Day 6 onward: 30 mg BID per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Maintenance", body: "30 mg PO BID per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal adjustment", body: "Severe (eGFR <30) — 30 mg DAILY (no PM dose) per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Hepatic", body: "No initial adjustment; monitor.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric", body: "Not approved; specialty.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — depression / suicidality history (FDA warning); pregnancy / lactation (limited data — assess benefit-risk).",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("GI SIDE EFFECTS — diarrhea (15%), nausea (15%); usually resolves with continued use; reduce if severe; gradual titration helps per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("WEIGHT LOSS — common (~10-15% lose ≥5%); monitor; usually mild + plateau; concern in undernourished.", citationIDs: ["specialty_round27"]),
            AttributedBullet("DEPRESSION + SUICIDAL IDEATION — FDA monitoring required; screen at every visit; PHQ-9 + suicide assessment per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HEADACHE + insomnia — common.", citationIDs: ["openfda_round27"]),
            AttributedBullet("INFECTIONS — modest increase; less than biologics; no TB / HBV pre-screening required per FDA per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HYPERSENSITIVITY — rare angioedema, urticaria.", citationIDs: ["openfda_round27"]),
            AttributedBullet("PREGNANCY — Category C; pregnancy registry; limited human data.", citationIDs: ["openfda_round27"]),
            AttributedBullet("BENEFITS modestly lower than biologics — option for biologic-averse patients OR mild-moderate disease.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, headache, upper respiratory infections, vomiting, weight loss, insomnia, depression / suicidality (rare but FDA-warning), hypersensitivity reactions.",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, phenytoin, carbamazepine, St. John's wort) — significantly decrease apremilast; AVOID concurrent per primary source.", citationIDs: ["openfda_round27"]),
            AttributedBullet("Strong CYP3A4 inhibitors — minimal effect; no dose adjustment.", citationIDs: ["openfda_round27"]),
            AttributedBullet("Generally NO major drug interactions vs biologics; safer in polypharmacy.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — depression screen (PHQ-9), suicide risk; consider mental health baseline.", citationIDs: ["specialty_round27"]),
            AttributedBullet("GRADUAL TITRATION REQUIRED — reduces GI side effects per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MONITOR — weight, GI symptoms, mood / suicidal ideation at every visit.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — GI symptoms usually resolve in weeks; persistent → reduce dose or alternative.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel mental health vigilance — depression, suicidal thoughts, mood changes — seek help.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Convenient ORAL ROUTE — many patients prefer over injection.", citationIDs: ["specialty_round27"]),
            AttributedBullet("NO TB / HBV / vaccination monitoring required for apremilast (vs biologics).", citationIDs: ["specialty_round27"]),
            AttributedBullet("DRUG INTERACTIONS — avoid strong CYP3A4 inducers.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "Take this orally twice daily — start with the titration package (gradually increasing doses to reduce stomach upset). Diarrhea + nausea are common in the first weeks + usually improve. Tell us about depression, sad mood, thoughts of self-harm, or suicidal thoughts. We'll check your weight + mood at visits. No live vaccine restrictions.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum UpadacitinibSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "upadacitinib",
        title: "Upadacitinib (Rinvoq)",
        subtitle: "Selective JAK1 inhibitor · RA + atopic dermatitis + UC + Crohn · BOXED CV / VTE / cancer · TB + HBV screen · once-daily PO",
        category: "Janus kinase (JAK1-selective) inhibitor — oral",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective JAK1 inhibitor — small molecule oral"),
            KeyValueRow(key: "Use", value: "Rheumatoid arthritis (moderate-severe); atopic dermatitis; psoriatic arthritis; ulcerative colitis; Crohn's disease; ankylosing spondylitis; non-radiographic axial spondyloarthritis"),
            KeyValueRow(key: "Dose", value: "RA + PsA + AS — 15 mg PO daily; atopic dermatitis 15-30 mg PO daily; UC / Crohn induction 45 mg → maintenance 15 mg"),
            KeyValueRow(key: "Boxed", value: "Serious infections, MORTALITY, MALIGNANCIES, MACE (cardiovascular), thrombosis (VTE)"),
            KeyValueRow(key: "Watch", value: "Pre-treatment TB + HBV + lipid + CBC; older / smokers higher risk")
        ],
        indications: AttributedProse(
            "Moderate-severe rheumatoid arthritis; moderate-severe atopic dermatitis; psoriatic arthritis; active ulcerative colitis; active Crohn's disease; ankylosing spondylitis; non-radiographic axial spondyloarthritis; alopecia areata (FDA-approved); INADEQUATE response or intolerance to other biologics / standard therapy per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Selective inhibition of Janus kinase 1 (JAK1) → reduces signaling of cytokines including IL-6, IFN, common gamma chain cytokines → modulates inflammation in autoimmune + inflammatory diseases. JAK1 selectivity in upadacitinib associated with improved safety vs pan-JAK inhibitors.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "RA + PsA + AS", body: "15 mg PO once daily per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Atopic dermatitis", body: "15 mg PO daily; titrate to 30 mg if inadequate; adolescents ≥12 yrs ≥40 kg same dosing.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Ulcerative colitis (induction)", body: "45 mg PO daily × 8 weeks; maintenance 15 mg PO daily (or 30 mg for refractory).", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Crohn's disease (induction)", body: "45 mg PO daily × 12 weeks; maintenance 15-30 mg PO daily.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal adjustment", body: "Severe (eGFR <30) — reduce dose; specialty.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric atopic dermatitis (≥12 yrs)", body: "Same as adult.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Active serious infection (sepsis, TB, opportunistic); active HBV; severe hepatic impairment; pregnancy (Category D — limited data, fetal harm theoretical); breastfeeding (excreted in milk).",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("BOXED — SERIOUS INFECTIONS — bacterial, opportunistic (TB, herpes zoster, PCP, candidiasis); pre-screening TB (PPD or IGRA) + HBV mandatory per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("BOXED — MORTALITY — increased all-cause mortality vs TNF inhibitors in some studies (RA elderly).", citationIDs: ["specialty_round27"]),
            AttributedBullet("BOXED — MALIGNANCIES — including non-melanoma skin cancer, lymphoma; surveillance.", citationIDs: ["specialty_round27"]),
            AttributedBullet("BOXED — MACE — MI, stroke, sudden cardiac death; particularly in age ≥50 + CV risk factors + smokers.", citationIDs: ["specialty_round27"]),
            AttributedBullet("BOXED — VTE — DVT + PE + arterial thrombosis; greater risk in elderly + smokers + estrogen + CV risk.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LIPID elevations — total cholesterol + LDL + HDL increase; check at 4-8 weeks + treat.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LFTs ELEVATION — monitor at 4-8 weeks; hold if >5× ULN.", citationIDs: ["specialty_round27"]),
            AttributedBullet("CYTOPENIAS — neutropenia, lymphopenia, anemia; CBC at 2 months then q3-6 months.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HERPES ZOSTER — significantly increased; consider Shingrix vaccine pre-treatment.", citationIDs: ["specialty_round27"]),
            AttributedBullet("BOWEL PERFORATION in patients with diverticulitis or perforation history.", citationIDs: ["openfda_round27"]),
            AttributedBullet("PREGNANCY — Category D; reliable contraception × 4 weeks after last dose; alternative drugs preferred in pregnancy planning.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infections, increased CPK, nausea, neutropenia, anemia, lymphopenia, hyperlipidemia, transaminase elevation, herpes zoster, weight gain, headache, acne (high-dose atopic dermatitis).",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS (ketoconazole, itraconazole, ritonavir, clarithromycin) — increase upadacitinib levels; reduce dose 50% or alternative.", citationIDs: ["openfda_round27"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, phenytoin) — decrease levels; avoid concurrent.", citationIDs: ["openfda_round27"]),
            AttributedBullet("Other BIOLOGICS / JAK inhibitors — contraindicated; do not combine.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LIVE vaccines contraindicated.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Methotrexate combination — common in RA + PsA.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB testing, HBV + HCV screening, CBC + LFTs + lipid panel, vaccinations including Shingrix per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("CV RISK ASSESSMENT — age, smoking, lipids, prior CV disease; informed consent for high-risk.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MONITOR — CBC + LFTs + lipids at 4-8 weeks then q3-6 months; signs of infection at every visit.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — VTE risk; signs of clot (leg pain / swelling, chest pain, SOB); emergent eval.", citationIDs: ["specialty_round27"]),
            AttributedBullet("VACCINATIONS — Shingrix (recombinant) BEFORE; flu + pneumococcal; live vaccines avoided.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Lifestyle — smoking cessation, lipid management, BP control.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PREGNANCY — reliable contraception; planning + alternatives.", citationIDs: ["specialty_round27"]),
            AttributedBullet("ELDERLY (≥65 yrs) — higher MACE + VTE risk; specialty informed decision.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "This medicine has BOXED warnings about serious infections, blood clots, cancers, heart attack / stroke. We must check your TB + hepatitis B + blood + cholesterol before + during. Tell us about leg pain or swelling, chest pain, shortness of breath, fever, infection, severe rash, or shingles. Smoking + over 50 increases risks. Get Shingrix vaccine. No live vaccines.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SecukinumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "secukinumab",
        title: "Secukinumab (Cosentyx)",
        subtitle: "Anti-IL-17A monoclonal · psoriasis + PsA + AS + hidradenitis · candidiasis risk (especially oral) · IBD caution · IGRA pre-treatment",
        category: "Anti-IL-17A monoclonal antibody — psoriasis spectrum",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against IL-17A"),
            KeyValueRow(key: "Use", value: "Moderate-severe plaque psoriasis; psoriatic arthritis; ankylosing spondylitis; non-radiographic axial spondyloarthritis; hidradenitis suppurativa"),
            KeyValueRow(key: "Dose (psoriasis)", value: "300 mg SC at weeks 0, 1, 2, 3, 4 then every 4 weeks"),
            KeyValueRow(key: "Dose (PsA/AS)", value: "150 mg SC weeks 0, 1, 2, 3, 4 then every 4 weeks (300 mg for PsA with concurrent psoriasis)"),
            KeyValueRow(key: "Watch", value: "Mucocutaneous CANDIDIASIS (oral common), IBD activity (worsening / new onset), infections; pre-treatment TB + HBV")
        ],
        indications: AttributedProse(
            "Moderate-severe plaque psoriasis; active psoriatic arthritis; active ankylosing spondylitis; non-radiographic axial spondyloarthritis; moderate-severe hidradenitis suppurativa; pediatric ≥6 yrs (psoriasis) per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Human monoclonal antibody against IL-17A — key cytokine in psoriasis + spondyloarthropathies; blocks IL-17A-mediated keratinocyte hyperproliferation + neutrophil-rich inflammation in skin + joints. IL-17 also important in mucosal defense — explains candidiasis risk.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult plaque psoriasis", body: "300 mg SC at weeks 0, 1, 2, 3, 4 then every 4 weeks; some patients respond to 150 mg per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult PsA / AS / non-rad axSpA", body: "150 mg SC at weeks 0, 1, 2, 3, 4 then every 4 weeks; 300 mg if concurrent psoriasis.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Hidradenitis suppurativa", body: "300 mg SC weeks 0, 1, 2, 3, 4 then every 4 weeks; can escalate to every 2 weeks for refractory.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric (≥6 yrs psoriasis)", body: "Weight-based 75-150 mg SC similar schedule.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — Crohn's disease + ulcerative colitis active or history (can worsen / induce), active infection, latent TB, HBV / HCV.",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("MUCOCUTANEOUS CANDIDIASIS — increased; particularly ORAL THRUSH + esophageal candidiasis + vulvovaginal; counsel + treat per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("IBD (Crohn's + UC) WORSENING — paradoxical induction or worsening; AVOID in IBD; counsel per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFECTIONS — URI, candidiasis, cellulitis; pre-treatment TB + HBV.", citationIDs: ["specialty_round27"]),
            AttributedBullet("AVOID LIVE VACCINES.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PEDIATRIC growth disturbances less common than other biologics.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INFUSION REACTIONS — uncommon (vs many other biologics).", citationIDs: ["openfda_round27"]),
            AttributedBullet("MALIGNANCY — limited data; skin cancer surveillance.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PREGNANCY — Category B; limited human data; assess.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infections, nasopharyngitis, diarrhea, oral candidiasis, hypersensitivity reactions, injection site reactions, peripheral edema, headache, neutropenia (mild).",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — contraindicated.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Other biologics — additive infection; avoid concurrent.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Methotrexate / standard DMARDs — compatible.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB, HBV, HCV; IBD history (consider avoidance).", citationIDs: ["specialty_round27"]),
            AttributedBullet("SC SELF-INJECTION — teach; abdomen, thigh, upper arm; rotate.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("CANDIDIASIS counseling — oral hygiene, denture care, recognize symptoms (oral white patches, dysphagia / odynophagia for esophageal); seek treatment promptly.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MONITOR — infections, IBD symptoms (diarrhea, blood, weight loss); counsel.", citationIDs: ["specialty_round27"]),
            AttributedBullet("IBD HISTORY — avoid secukinumab if Crohn's / UC; alternative biologics.", citationIDs: ["specialty_round27"]),
            AttributedBullet("VACCINATIONS — flu, pneumococcal, Shingrix recombinant; avoid live.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — psoriasis improvement over 4-12 weeks; PsA / AS improvement may be faster.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "Inject this under your skin weekly for 5 weeks, then every 4 weeks. Tell us about mouth thrush (white patches in mouth, difficulty swallowing), severe diarrhea, infections, or worsening of any bowel symptoms (we may need to stop this). Practice oral hygiene + dental care. Avoid live vaccines.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum UstekinumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ustekinumab",
        title: "Ustekinumab (Stelara)",
        subtitle: "Anti-IL-12 + IL-23 · psoriasis + PsA + Crohn + UC · convenient q12 weeks SC maintenance · TB + HBV pre-treatment",
        category: "Anti-IL-12 / IL-23 monoclonal antibody",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against shared p40 subunit of IL-12 + IL-23"),
            KeyValueRow(key: "Use", value: "Moderate-severe plaque psoriasis; psoriatic arthritis; Crohn's disease; ulcerative colitis"),
            KeyValueRow(key: "Dose (psoriasis SC)", value: "Weight-based: ≤100 kg = 45 mg; >100 kg = 90 mg at weeks 0, 4, then every 12 weeks"),
            KeyValueRow(key: "Dose (IBD IV)", value: "Weight-based loading dose then 90 mg SC every 8 weeks"),
            KeyValueRow(key: "Watch", value: "Pre-treatment TB + HBV; infections; PML rare; convenient q12 week dosing")
        ],
        indications: AttributedProse(
            "Moderate-severe plaque psoriasis (adults + pediatric ≥6 yrs); active psoriatic arthritis; moderate-severe Crohn's disease; moderate-severe ulcerative colitis. Convenient q12 week dosing for psoriasis after induction phase per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Human IgG1 monoclonal antibody — binds shared p40 subunit of IL-12 + IL-23 → blocks signaling → reduces Th1 + Th17 inflammation (in psoriasis, PsA) + reduces gut inflammation (in IBD). Both cytokines central in autoimmune pathways.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult plaque psoriasis ≤100 kg", body: "45 mg SC at weeks 0, 4 then every 12 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult plaque psoriasis >100 kg", body: "90 mg SC at weeks 0, 4 then every 12 weeks.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult psoriatic arthritis", body: "45 mg SC at weeks 0, 4 then every 12 weeks (90 mg if psoriasis severe + >100 kg).", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "IBD induction (Crohn's + UC)", body: "Weight-based IV loading: ≤55 kg = 260 mg; 55-85 kg = 390 mg; >85 kg = 520 mg; then 90 mg SC every 8 weeks for maintenance.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric (≥6 yrs psoriasis)", body: "Weight-based — typically 0.75-1 mg/kg SC schedule.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Active serious infection; TB / HBV active. Caution — recurrent infections, malignancy history, latent TB (treat before).",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("INFECTIONS — including TB, HBV, opportunistic; pre-treatment TB testing (PPD or IGRA) + HBV screening per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PROGRESSIVE MULTIFOCAL LEUKOENCEPHALOPATHY (PML) — VERY RARE; JC virus reactivation; new neurologic symptoms → emergent evaluation.", citationIDs: ["specialty_round27"]),
            AttributedBullet("MALIGNANCY — non-melanoma skin cancer, lymphoma; surveillance.", citationIDs: ["specialty_round27"]),
            AttributedBullet("REVERSIBLE POSTERIOR LEUKOENCEPHALOPATHY (PRES) — rare; HTN + neurologic symptoms.", citationIDs: ["openfda_round27"]),
            AttributedBullet("HYPERSENSITIVITY — anaphylaxis rare; observation post-injection.", citationIDs: ["openfda_round27"]),
            AttributedBullet("AVOID LIVE VACCINES.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Pre-treatment TB testing — IGRA preferred; treat latent TB before initiation.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PREGNANCY — Category B; limited human data; assess.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infections, headache, fatigue, injection site reactions, nasopharyngitis, sinusitis, diarrhea, depression, hypersensitivity reactions, malignancy, PML (very rare).",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("LIVE vaccines — contraindicated.", citationIDs: ["specialty_round27"]),
            AttributedBullet("OTHER BIOLOGICS — avoid combination; additive infection.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Methotrexate compatible; common combination.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB, HBV, HCV screening, vaccinations.", citationIDs: ["specialty_round27"]),
            AttributedBullet("SC INJECTION (psoriasis) — teach self-administration; q12 week schedule convenient.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("IV INDUCTION for IBD — infusion center; observe.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("MONITOR — infections, neurologic symptoms (PML), skin cancer.", citationIDs: ["specialty_round27"]),
            AttributedBullet("VACCINATIONS — flu, pneumococcal, Shingrix; avoid live.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — psoriasis improvement at 4-12 weeks; PsA + IBD response timeline varies.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — new neurologic symptoms (cognitive, visual, motor) → urgent evaluation for PML.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Pregnancy planning — limited data; alternatives may be preferable.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "Inject this every 12 weeks (psoriasis) after starting doses — convenient schedule. We check TB + hepatitis B before. Tell us about infections, fever, severe cough, vision problems, weakness, or confusion (we'd need to check for PML — very rare brain infection). Avoid live vaccines.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum GuselkumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "guselkumab",
        title: "Guselkumab (Tremfya)",
        subtitle: "Anti-IL-23 (selective) · psoriasis + PsA · NEWER more selective vs ustekinumab · q8 weeks SC · TB + HBV pre-treatment · less IBD risk vs anti-IL-17",
        category: "Anti-IL-23 monoclonal antibody (selective)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against IL-23 p19 subunit (selective vs IL-12 / IL-23 dual)"),
            KeyValueRow(key: "Use", value: "Moderate-severe plaque psoriasis; psoriatic arthritis"),
            KeyValueRow(key: "Dose", value: "100 mg SC at weeks 0, 4, then every 8 weeks"),
            KeyValueRow(key: "Watch", value: "Infections, TB + HBV pre-screening; less IBD induction risk than anti-IL-17; SUPERIOR efficacy vs anti-IL-12/23 (ustekinumab) per head-to-head trials")
        ],
        indications: AttributedProse(
            "Moderate-severe plaque psoriasis; active psoriatic arthritis. Newer + more selective vs ustekinumab; SUPERIOR efficacy in head-to-head trials per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Human IgG1 monoclonal antibody — selectively binds IL-23 p19 subunit (unlike ustekinumab which blocks shared p40 of IL-12 + IL-23) → blocks IL-23 signaling → reduces Th17 differentiation + IL-17 production → reduces psoriatic + PsA inflammation.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Plaque psoriasis + PsA", body: "100 mg SC at weeks 0, 4 then every 8 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric", body: "Not approved; specialty.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution — active serious infection, latent TB (treat first), HBV (treat first), malignancy.",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("INFECTIONS — URI common; opportunistic uncommon; pre-treatment TB + HBV per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("AVOID LIVE VACCINES.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LOWER IBD induction risk vs anti-IL-17 — concept favorable for selected patients.", citationIDs: ["specialty_round27"]),
            AttributedBullet("HYPERSENSITIVITY — rare.", citationIDs: ["openfda_round27"]),
            AttributedBullet("MALIGNANCY — surveillance; limited data on long-term.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PREGNANCY — Category B; limited human data; assess.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Upper respiratory infections, headache, injection site reactions, tinea infections, herpes simplex, gastroenteritis, hypersensitivity (rare).",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — avoid.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Other biologics — avoid concurrent.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Standard DMARDs compatible.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — TB + HBV; vaccinations.", citationIDs: ["specialty_round27"]),
            AttributedBullet("SC SELF-INJECTION every 8 weeks; convenient schedule.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("MONITOR — infections at every visit.", citationIDs: ["specialty_round27"]),
            AttributedBullet("VACCINATIONS — flu, pneumococcal, Shingrix recombinant; avoid live.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Counsel — psoriasis improvement at 16-24 weeks; significant clearance possible.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LESS IBD-induction risk than anti-IL-17; option for patients with IBD personal / family history.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Other IL-23 inhibitors — risankizumab (Skyrizi), tildrakizumab (Ilumya) — similar class.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "This medicine is an injection every 8 weeks. Most people see major improvement by 4-6 months. We check TB + hepatitis B first. Tell us about infections, fever, or skin changes. Avoid live vaccines. Get flu + pneumonia + Shingrix vaccines as scheduled.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DupilumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dupilumab",
        title: "Dupilumab (Dupixent)",
        subtitle: "Anti-IL-4Rα · atopic dermatitis + asthma + EoE + COPD + nasal polyps · q2 weeks SC · NO routine TB / lab monitoring · conjunctivitis common",
        category: "Anti-IL-4 receptor α (blocks IL-4 + IL-13) monoclonal antibody — atopic / Th2 diseases",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against IL-4 receptor α — blocks IL-4 + IL-13 signaling"),
            KeyValueRow(key: "Use", value: "Atopic dermatitis; eosinophilic asthma; eosinophilic esophagitis (EoE); chronic rhinosinusitis with nasal polyps; eosinophilic COPD (FDA 2024); prurigo nodularis"),
            KeyValueRow(key: "Dose (adult)", value: "Loading 600 mg SC + 300 mg SC every 2 weeks; dosing varies by indication"),
            KeyValueRow(key: "Watch", value: "Conjunctivitis (~10%; usually treatable), injection site reactions, eosinophilia, transient infections; NO routine TB / labs vs other biologics")
        ],
        indications: AttributedProse(
            "Moderate-severe ATOPIC DERMATITIS (adults + children ≥6 months); moderate-severe ASTHMA with eosinophilic phenotype OR oral corticosteroid-dependent (adults + children ≥6 yrs); EOSINOPHILIC ESOPHAGITIS (adults + children ≥1 year); CHRONIC RHINOSINUSITIS WITH NASAL POLYPS; eosinophilic CHRONIC OBSTRUCTIVE PULMONARY DISEASE (FDA-approved 2024); PRURIGO NODULARIS per primary source.",
            citationIDs: ["specialty_round27", "openfda_round27"]
        ),
        mechanism: AttributedProse(
            "Human IgG4 monoclonal antibody — binds IL-4 receptor α (shared subunit of IL-4 + IL-13 receptors) → blocks signaling of both cytokines → reduces Th2-mediated inflammation (atopic + eosinophilic diseases). NO immunosuppression of Th1 / cellular immunity → favorable safety vs other biologics.",
            citationIDs: ["openfda_round27"]
        ),
        dosing: [
            DosingBlock(label: "Adult atopic dermatitis", body: "600 mg SC × 1 loading, then 300 mg SC every 2 weeks per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Adult asthma", body: "Loading 400-600 mg SC OR 200-300 mg SC depending on oral CS use; maintenance 200-300 mg every 2 weeks.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Eosinophilic esophagitis (adult)", body: "300 mg SC weekly per primary source.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Pediatric atopic dermatitis (≥6 mo)", body: "Weight-based loading then maintenance every 2 or 4 weeks.", citationIDs: ["openfda_round27"]),
            DosingBlock(label: "Renal / hepatic", body: "No dose adjustment.", citationIDs: ["openfda_round27"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. No major absolute contraindications; safer profile than other biologics. Caution — active parasitic infection, pre-existing helminth infection (deworm first).",
            citationIDs: ["openfda_round27"]
        ),
        warnings: [
            AttributedBullet("CONJUNCTIVITIS — ~10% in atopic dermatitis patients; usually mild + treatable with ophthalmology consultation per primary source.", citationIDs: ["specialty_round27"]),
            AttributedBullet("INJECTION SITE REACTIONS — common; usually mild.", citationIDs: ["openfda_round27"]),
            AttributedBullet("EOSINOPHILIA — transient elevation; usually clinically silent; rare eosinophilic conditions (vasculitis, pneumonia) reported.", citationIDs: ["openfda_round27"]),
            AttributedBullet("ARTHRALGIA — uncommon but reported.", citationIDs: ["openfda_round27"]),
            AttributedBullet("HYPERSENSITIVITY — anaphylaxis rare; observation post-injection.", citationIDs: ["openfda_round27"]),
            AttributedBullet("HELMINTH INFECTION — pre-existing; could exacerbate; deworm before in endemic areas.", citationIDs: ["specialty_round27"]),
            AttributedBullet("LIVE VACCINES — avoid; INACTIVATED vaccines fine.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PREGNANCY — Category B; limited human data; pregnancy registry; generally continued during pregnancy if needed.", citationIDs: ["specialty_round27"]),
            AttributedBullet("NO routine TB / HBV / lab monitoring required — significant advantage over other biologics.", citationIDs: ["specialty_round27"])
        ],
        adverseReactions: AttributedProse(
            "Conjunctivitis, injection site reactions, blepharitis, dry eye, oral herpes simplex, eosinophilia (mild + transient), arthralgia, hypersensitivity (rare).",
            citationIDs: ["openfda_round27"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — avoid.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Other biologics — generally avoided.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Topical / inhaled steroids + standard atopic dermatitis / asthma therapy — compatible + continued.", citationIDs: ["specialty_round27"])
        ],
        nursingImplications: [
            AttributedBullet("PRE-TREATMENT — relatively minimal; CBC + helminth screening in endemic areas.", citationIDs: ["specialty_round27"]),
            AttributedBullet("SC SELF-INJECTION every 2 weeks — abdomen / thigh / upper arm rotation.", citationIDs: ["openrn_pharm_round27"]),
            AttributedBullet("MONITOR — atopic dermatitis improvement at 4-8 weeks; asthma at 12-24 weeks; conjunctivitis assessment.", citationIDs: ["specialty_round27"]),
            AttributedBullet("CONJUNCTIVITIS counseling — soft eye drops, ophthalmology referral if severe; usually doesn't require stopping dupilumab.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Vaccinations — flu, pneumococcal, Shingrix recombinant; avoid live.", citationIDs: ["specialty_round27"]),
            AttributedBullet("PEDIATRIC use — well-tolerated; growth + development normal; counsel.", citationIDs: ["specialty_round27"]),
            AttributedBullet("Pregnancy — generally continued if needed; pregnancy registry.", citationIDs: ["specialty_round27"]),
            AttributedBullet("NO ROUTINE labs vs many other biologics — convenient monitoring.", citationIDs: ["specialty_round27"])
        ],
        patientTeaching: AttributedProse(
            "Inject this under your skin every 2 weeks (some indications differ). You may get conjunctivitis (red, itchy eyes) — usually treatable + doesn't mean we stop the medicine. Skin should improve in 4-8 weeks for eczema. Eye drops + ophthalmology referral if eye symptoms. Continue your other treatments (steroids, inhalers, etc.). Avoid live vaccines.",
            citationIDs: ["openrn_pharm_round27"]
        ),
        citations: [openfdaR27, openrnPharmR27, specialtyR27, ismpR27],
        lastSourceFidelityReview: "2026-05-13"
    )
}
