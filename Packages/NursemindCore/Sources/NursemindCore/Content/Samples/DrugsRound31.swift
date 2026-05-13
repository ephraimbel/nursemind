import Foundation

// Curator-model drug entries (round 31 — neurology depth: MS DMTs + PD adjuncts + AEDs + MG + migraine + SMA).

private let openfdaR31 = CitationSource(
    id: "openfda_round31",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR31 = CitationSource(
    id: "openrn_pharm_round31",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR31 = CitationSource(
    id: "specialty_round31",
    shortName: "AAN + MS Society + Movement Disorder Society + ILAE + AHS concept citations",
    publisher: "AAN · MS Society · MDS · ILAE · AHS",
    license: .factCitationOnly,
    url: "https://www.aan.com/Guidelines/",
    lastRetrieved: "2026-05-13"
)
private let ismpR31 = CitationSource(
    id: "ismp_round31",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum OcrelizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ocrelizumab",
        title: "Ocrelizumab (Ocrevus)",
        subtitle: "Anti-CD20 monoclonal · 1st-line relapsing MS + ONLY FDA-approved primary progressive MS · IV q6 months · infusion reactions + HBV reactivation + serious infections",
        category: "Anti-CD20 B-cell depleting biologic — MS (relapsing + primary progressive)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized anti-CD20 monoclonal antibody → depletes B lymphocytes"),
            KeyValueRow(key: "Use", value: "Relapsing forms of multiple sclerosis (RMS); primary progressive MS (PPMS — only FDA-approved DMT); first-line for many adults"),
            KeyValueRow(key: "Dose", value: "300 mg IV at week 0 + week 2 (initial); then 600 mg IV every 6 months (maintenance); premedicate methylprednisolone 100 mg IV + diphenhydramine + acetaminophen"),
            KeyValueRow(key: "Monitor", value: "HBV + HCV screen pre-treatment; CBC + immunoglobulins q6 months; serial MRI q12 months; infection signs"),
            KeyValueRow(key: "Watch", value: "INFUSION REACTIONS (~40% — pretreat); HBV REACTIVATION; SERIOUS INFECTIONS (URI + UTI + zoster + opportunistic); PML rare; MALIGNANCY surveillance (breast cancer signal); hypogammaglobulinemia long-term")
        ],
        indications: AttributedProse(
            "Relapsing multiple sclerosis (RMS — relapsing-remitting, clinically isolated syndrome, secondary progressive disease with relapses) + PRIMARY PROGRESSIVE MS (PPMS — only FDA-approved disease-modifying therapy for PPMS). First-line for many adults with active MS per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Humanized anti-CD20 IgG1 monoclonal antibody binds CD20+ B lymphocytes → ADCC + complement-dependent cytotoxicity + apoptosis → B-cell depletion. B cells contribute to MS pathology via antibody-independent (antigen presentation, cytokines) + antibody-dependent (intrathecal Ig) mechanisms. Reduces relapses, MRI lesions, disability progression.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Initial dose", body: "300 mg IV at week 0; 300 mg IV at week 2; both with premedication per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Maintenance", body: "600 mg IV every 6 months; premedication required before each infusion.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Premedication", body: "30-60 minutes before infusion — methylprednisolone 100 mg IV (or equivalent corticosteroid); diphenhydramine 25-50 mg IV/PO; acetaminophen 500-1000 mg PO; reduces infusion reactions per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Infusion rate", body: "First infusion — start 30 mL/hr × 30 min, increase q30 min; subsequent — shorter duration possible per institutional protocol; total ~3.5-5 hours.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment; mild-moderate hepatic — no data severe.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Active HBV infection; history of life-threatening infusion reaction to ocrelizumab; active malignancy (relative).",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("INFUSION REACTIONS — ~40% with first infusion; pruritus, rash, throat irritation, flushing, hypotension, fever, dyspnea, anaphylaxis (rare); premedication essential; observe ≥1 hour post; treat acute reactions; slow / stop infusion; can usually restart slower.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HBV REACTIVATION — fatal hepatic failure reported; SCREEN ALL patients for HBsAg + anti-HBc + anti-HBs BEFORE first dose; hepatology consult for HBV+ patients; entecavir/TAF prophylaxis if HBcAb+.", citationIDs: ["openfda_round31"]),
            AttributedBullet("SERIOUS INFECTIONS — bacterial + viral (zoster, URI, UTI, pneumonia); screen + treat pre-existing; vaccinations BEFORE start preferred (live vaccines avoided during therapy).", citationIDs: ["openfda_round31"]),
            AttributedBullet("PML (Progressive Multifocal Leukoencephalopathy) — rare but reported; new neurologic deficits + MRI white matter changes; JC virus PCR.", citationIDs: ["openfda_round31"]),
            AttributedBullet("MALIGNANCY — possible increased risk; particularly BREAST CANCER signal in MS trials; mammography per age-based guidelines + clinical surveillance.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HYPOGAMMAGLOBULINEMIA — long-term; check immunoglobulin levels (IgG, IgM, IgA) baseline + q6-12 months; IVIG replacement for severe deficient + recurrent infections.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LIVE VACCINES — contraindicated during treatment + ≥4 weeks before initiation; complete live vaccines BEFORE starting; inactivated vaccines OK during therapy though reduced response.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PREGNANCY — Category C; B-cell depletion in neonate possible if exposed late pregnancy; counsel; lactation acceptable per IgG transfer minimal.", citationIDs: ["openfda_round31"]),
            AttributedBullet("COVID-19 — reduced vaccine response with B-cell depletion; timing of dose / vaccine; counsel on infection risk.", citationIDs: ["specialty_round31"])
        ],
        adverseReactions: AttributedProse(
            "Infusion reactions, upper respiratory tract infections, urinary tract infections, herpes infections, depression, hypogammaglobulinemia, malignancy (rare), PML (rare), HBV reactivation.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER IMMUNOSUPPRESSANTS / DMTs — increased infection risk + additive B-cell depletion; usually not combined; wash-out periods.", citationIDs: ["specialty_round31"]),
            AttributedBullet("LIVE VACCINES — contraindicated during therapy + ≥4 weeks before initiation.", citationIDs: ["specialty_round31"]),
            AttributedBullet("RITUXIMAB / OTHER ANTI-CD20 — avoid sequential use without adequate wash-out.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Inactivated vaccines — reduced antibody response but generally OK; influenza, pneumococcal, COVID-19, hepatitis B (give BEFORE ocrelizumab start when possible).", citationIDs: ["specialty_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — HBV + HCV + HIV serology; CBC + immunoglobulins; mammogram for women; comprehensive vaccinations (give live + booster before start); HIV testing; pregnancy test.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Premedication essential — methylprednisolone + diphenhydramine + acetaminophen 30-60 min before infusion; observe ≥1 hour post.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Infusion monitoring — vitals q15-30 min during infusion; recognize reactions early; slow / pause / treat as needed.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Long-term monitoring — CBC + immunoglobulins q6 months; MRI brain q12 months; mammography + cervical cancer screening per age-based guidelines.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Counsel — REPORT fever, severe infections, new neurologic symptoms, easy bruising / bleeding (rare cytopenias); vaccination strategy + family planning.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Live vaccine timing — complete before treatment; not during; counsel travel + occupation.", citationIDs: ["specialty_round31"]),
            AttributedBullet("HBV REACTIVATION — emergent if symptomatic + LFT elevation; entecavir/TAF prophylaxis for HBcAb+ patients before therapy.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Cost + insurance — specialty drug; pharmacy support + financial assistance; infusion center arrangements.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine treats your multiple sclerosis by reducing B-cells that drive inflammation. You'll get infusions every 6 months. We premedicate to reduce reactions. Tell us about fever, infections, easy bruising. Avoid live vaccines during treatment. Get mammograms + cancer screenings on schedule. Tell us if you become pregnant.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NatalizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "natalizumab",
        title: "Natalizumab (Tysabri)",
        subtitle: "α4-integrin antagonist · highly effective relapsing MS + Crohn's · BOXED PML (JCV antibody stratification) · REMS (TOUCH) · monthly IV",
        category: "α4-integrin antagonist — relapsing MS + Crohn disease (REMS-restricted)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized monoclonal antibody against α4-integrin → blocks lymphocyte trafficking across blood-brain barrier"),
            KeyValueRow(key: "Use", value: "Relapsing forms of MS — high disease activity OR inadequate response to other DMTs; Crohn's disease moderate-severe; REMS-restricted (TOUCH program)"),
            KeyValueRow(key: "Dose", value: "300 mg IV every 4 weeks via certified TOUCH infusion center"),
            KeyValueRow(key: "Monitor", value: "JC VIRUS antibody index BEFORE start + every 6 months; MRI BEFORE start + annually; LFTs + CBC; infection signs; PML symptoms"),
            KeyValueRow(key: "Watch", value: "BOXED — PROGRESSIVE MULTIFOCAL LEUKOENCEPHALOPATHY (PML) — risk stratified by JCV antibody index (<0.9 low, ≥1.5 high) + duration + prior immunosuppression; HEPATOTOXICITY; HYPERSENSITIVITY (anti-natalizumab antibodies); REMS — TOUCH only")
        ],
        indications: AttributedProse(
            "Relapsing multiple sclerosis — typically reserved for high disease activity, breakthrough on platform DMTs (interferon, glatiramer), inability to tolerate alternatives; Crohn's disease moderate-severe; highly effective but PML risk per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Humanized monoclonal antibody binds α4-integrin (VLA-4) subunit on leukocyte surface → prevents binding to VCAM-1 on vascular endothelium → blocks lymphocyte adhesion + trafficking across blood-brain barrier + into gut wall. Reduces CNS inflammation in MS + gut inflammation in Crohn's. PML risk arises from impaired immune surveillance.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "300 mg IV infusion over ~1 hour every 4 weeks per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Setting", body: "TOUCH (Tysabri Outreach: Unified Commitment to Health) REMS program-certified infusion centers only; observe 1 hour post-infusion for reactions.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment; severe hepatic — caution.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Pediatric", body: "Limited data; pediatric MS specialist.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Active PML; immunocompromised state from other agents OR HIV; hypersensitivity to natalizumab; concomitant immunosuppressive therapy.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("BOXED — PROGRESSIVE MULTIFOCAL LEUKOENCEPHALOPATHY (PML) — risk stratified by: JCV antibody index (<0.9 — low, 0.9-1.5 — intermediate, >1.5 — high), duration of therapy (longer = higher risk), prior immunosuppressive therapy (highest risk); REMS (TOUCH) tracks; counsel + ongoing monitoring.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PML CLINICAL — subacute focal deficits + cognitive changes + behavior change + visual changes; MRI white matter lesions; CSF JC virus PCR; discontinue + plasmapheresis if confirmed.", citationIDs: ["specialty_round31"]),
            AttributedBullet("HYPERSENSITIVITY — immediate (during infusion) + delayed; observe 1 hour post; anti-natalizumab antibodies in 6%; reduced efficacy + reactions.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HEPATOTOXICITY — hepatitis with jaundice + LFT elevation; STOP if elevated.", citationIDs: ["openfda_round31"]),
            AttributedBullet("INFECTIONS — bacterial + viral; URTI, UTI, pneumonia; counsel.", citationIDs: ["openfda_round31"]),
            AttributedBullet("MALIGNANCY — possible signal; surveillance.", citationIDs: ["openfda_round31"]),
            AttributedBullet("REBOUND DISEASE ACTIVITY upon DISCONTINUATION — severe relapses can occur within months; transition to alternative DMT or bridge.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PREGNANCY — Category C; transfer to fetus late pregnancy; lactation acceptable.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LIVE VACCINES — avoid during therapy + 4 weeks before; complete pre-treatment.", citationIDs: ["specialty_round31"])
        ],
        adverseReactions: AttributedProse(
            "Headache, fatigue, urinary tract infections, depression, joint pain, infusion reactions, hepatic enzyme elevation, hypersensitivity, PML (rare but severe).",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER IMMUNOSUPPRESSANTS / DMTs — increased infection + PML risk; CONTRAINDICATED concurrent immunosuppression.", citationIDs: ["specialty_round31"]),
            AttributedBullet("LIVE VACCINES — avoid during therapy + 4 weeks before; inactivated OK but reduced response.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PRIOR IMMUNOSUPPRESSION (cyclophosphamide, mitoxantrone, azathioprine, methotrexate) — increased PML risk; counsel + monitor.", citationIDs: ["specialty_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — JC virus antibody index (BEFORE starting + every 6 months thereafter); MRI; CBC + LFTs; HIV; comprehensive vaccinations; pregnancy test.", citationIDs: ["specialty_round31"]),
            AttributedBullet("TOUCH REMS enrollment — patient + prescriber + infusion center; tracking + PML surveillance.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Infusion monitoring — vitals q15 min × first hour + q30 min thereafter; observe 1 hour post; recognize hypersensitivity; treat acute reactions.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Monitoring — JCV antibody q6 months; MRI annually + emergent if PML symptoms (subacute focal deficits + cognitive changes + behavior); LFTs + CBC; clinical PML assessment at every visit.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PML risk-benefit discussion at every visit — patient + family understanding; informed consent renewed; alternative DMTs considered.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Counsel — REPORT new focal weakness, vision changes, cognitive changes, behavioral changes (PML symptoms — emergent); fever, severe infection.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("DISCONTINUATION strategy — bridge to alternative DMT to prevent rebound; rapid wash-out limited (~80% removed by 12 weeks but lingering effect 6+ months); plasmapheresis if PML.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Pregnancy — risk-benefit; coordinate with OB; can continue with careful monitoring.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Cost + insurance — specialty + restricted; TOUCH-certified centers; insurance approval + ongoing.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This IV medicine treats severe MS by blocking immune cells from entering the brain. Get the JC virus antibody test before + every 6 months. CALL US RIGHT AWAY if you notice new weakness, vision changes, confusion, or personality changes — these could be PML, a serious brain infection. Get the medicine at certified infusion centers (TOUCH program) only. Plan with us before stopping — disease can rebound.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FingolimodSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fingolimod",
        title: "Fingolimod (Gilenya) + S1P modulators",
        subtitle: "First oral DMT for MS · S1P receptor modulator · FIRST-DOSE bradycardia + AV block · macular edema + zoster + LFT · 6-hour observation",
        category: "S1P receptor modulator — relapsing MS oral DMT",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Sphingosine 1-phosphate (S1P) receptor modulator → lymphocyte sequestration in lymph nodes → reduced CNS lymphocyte trafficking"),
            KeyValueRow(key: "Use", value: "Relapsing MS in adults + pediatric ≥10 years"),
            KeyValueRow(key: "Dose", value: "0.5 mg PO daily; FIRST-DOSE OBSERVATION 6 hours with ECG + BP q1 hour due to bradycardia / AV block risk"),
            KeyValueRow(key: "Monitor", value: "CBC + LFTs + macular OCT + cardiac ECG + VZV status pre-treatment; serial CBC + LFTs; ophthalmology q4 months × 1 year"),
            KeyValueRow(key: "Watch", value: "FIRST-DOSE BRADYCARDIA + AV block (6-hour observation); MACULAR EDEMA; HEPATOTOXICITY; lymphopenia; ZOSTER reactivation; rebound disease activity on discontinuation; PML rare; cardiovascular events; teratogen")
        ],
        indications: AttributedProse(
            "Relapsing forms of multiple sclerosis in adults + pediatric ≥10 years — clinically isolated syndrome, relapsing-remitting, active secondary progressive. Newer S1P modulators (siponimod, ozanimod, ponesimod) similar with refined cardiac safety profiles per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Sphingosine 1-phosphate (S1P) receptor modulator — binds S1P1 + S1P3 + S1P4 + S1P5 receptors → INTERNALIZES + DOWN-REGULATES receptors → prevents lymphocyte egress from lymph nodes → reduced peripheral lymphocyte count (sequestration, not depletion) → reduced CNS infiltration. Newer S1P modulators selectively target S1P1 + S1P5 reducing cardiac S1P3 effects (less bradycardia).",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Adult + adolescent ≥10 years", body: "0.5 mg PO ONCE daily; with or without food per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "First-dose observation", body: "6 HOURS continuous ECG + BP monitoring; HR q1 hour; ECG at end; bradycardia minimum at 4-5 hours; if bradycardia <45 BPM OR symptomatic OR QTc prolongation → extend observation + cardiology; restart same monitoring if missed dose >2 weeks per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Newer S1P modulators", body: "SIPONIMOD (Mayzent) 2 mg PO daily (titrate over 5 days); OZANIMOD (Zeposia) 0.92 mg PO daily (titrate 7 days); PONESIMOD (Ponvory) 20 mg PO daily (titrate 14 days); refined cardiac safety + no first-dose monitoring requirement (siponimod genotype-based).", citationIDs: ["specialty_round31"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe — caution; LFT elevations may require dose reduction or discontinuation.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "MI / unstable angina / stroke / TIA in past 6 months; severe heart failure (NYHA III-IV); decompensated heart failure; history of Mobitz Type II second-degree or third-degree AV block; sick sinus syndrome; baseline QTc >500 ms; concurrent class Ia or III antiarrhythmics; congenital long QT.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("BOXED / FIRST-DOSE BRADYCARDIA + AV BLOCK — 6-hour observation with continuous ECG + BP; if HR <45 OR symptomatic OR QTc rise → cardiology + extended monitoring; restart from beginning if missed dose >2 weeks.", citationIDs: ["openfda_round31"]),
            AttributedBullet("MACULAR EDEMA — ~0.4%; risk factors — diabetes + uveitis; baseline OCT + ophthalmology + repeat at 3-4 months; vision changes → emergent eval.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HEPATOTOXICITY — LFT elevation in ~15%; baseline + q3 months; if ALT >5× ULN → discontinue; hepatitis flare risk.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LYMPHOPENIA — lymphocyte count typically 30% of baseline; INFECTIONS — bacterial, fungal, viral (especially VZV reactivation), opportunistic.", citationIDs: ["openfda_round31"]),
            AttributedBullet("VZV reactivation — herpes zoster especially in younger / immunosuppressed; VZV serology pre-treatment + vaccinate if non-immune before starting.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PML — rare; subacute focal deficits; emergent MRI + CSF JC PCR.", citationIDs: ["openfda_round31"]),
            AttributedBullet("REBOUND disease activity upon discontinuation — severe relapses + tumefactive lesions possible; transition to alternative DMT immediately; some patients require steroid coverage.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PREGNANCY — Category C; teratogen; reliable contraception during + 2 months after.", citationIDs: ["openfda_round31"]),
            AttributedBullet("MALIGNANCY — non-melanoma skin cancer increased; monitor + dermatologic exam.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Live vaccines — avoid during + 2 months after; complete vaccinations pre-treatment.", citationIDs: ["specialty_round31"])
        ],
        adverseReactions: AttributedProse(
            "Headache, hepatic enzyme elevation, diarrhea, cough, influenza, sinusitis, back pain, bradycardia, AV block, macular edema, lymphopenia, infections, hypertension.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("CLASS Ia OR III ANTIARRHYTHMICS — CONTRAINDICATED; QT prolongation + arrhythmia risk.", citationIDs: ["openfda_round31"]),
            AttributedBullet("BETA-BLOCKERS + CALCIUM CHANNEL BLOCKERS — additive bradycardia; coordinate cardiology + dose adjustments.", citationIDs: ["openfda_round31"]),
            AttributedBullet("KETOCONAZOLE — strong CYP3A4 inhibitor; increases fingolimod ~75%; avoid OR caution.", citationIDs: ["openfda_round31"]),
            AttributedBullet("RIFAMPIN — induces metabolism; reduces fingolimod ~40%; consider alternative.", citationIDs: ["openfda_round31"]),
            AttributedBullet("VACCINES — efficacy reduced; complete LIVE vaccines BEFORE start; inactivated OK but reduced response.", citationIDs: ["specialty_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + diff + lymphocyte count, LFTs, comprehensive vaccinations (VZV serology + vaccine if non-immune), ECG, eye exam + OCT, MRI, pregnancy test, JC antibody.", citationIDs: ["specialty_round31"]),
            AttributedBullet("FIRST-DOSE MONITORING — observe in clinic 6 hours; continuous ECG + BP + HR q1 hour; ECG end of observation; clinic with crash cart + cardiology backup.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Monitoring — CBC + LFTs q3 months; ophthalmology q4 months × 1 year then annually; MRI annually; clinical assessment.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Counsel — REPORT severe HA + vision changes (macular edema); rash + zoster signs (immediate antiviral); palpitations + syncope (cardiac); yellow eyes/skin; new neurologic deficits (PML).", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("MISSED DOSE — if >2 weeks, restart with first-dose monitoring; <2 weeks resume daily.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DISCONTINUATION strategy — coordinate alternative DMT to prevent rebound; sometimes high-dose steroids bridge; specialty consultation.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Pregnancy planning — contraception during + 2 months after; switch DMT if planning pregnancy.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Newer S1P modulators (siponimod, ozanimod, ponesimod) — less cardiac monitoring needed; titration schedules; selection by MS specialist.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This oral MS medicine reduces immune cell trafficking. FIRST DOSE — sit in clinic 6 hours with heart monitor (slows heart rate). Get eye exam at 3-4 months. Tell us about vision changes, severe headache, irregular heartbeat, fever, rash (especially if you've never had chickenpox). Get bloodwork every 3 months. Use reliable birth control + 2 months after stopping. Don't stop without talking to us — disease can rebound.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DimethylFumarateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dimethyl-fumarate",
        title: "Dimethyl fumarate (Tecfidera)",
        subtitle: "Oral MS DMT · Nrf2 pathway activator · FLUSHING + GI very common · lymphopenia + PML risk · BID dosing + food",
        category: "Nrf2 pathway activator — relapsing MS oral DMT",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nrf2 (nuclear factor erythroid 2-related factor 2) pathway activator + immunomodulator"),
            KeyValueRow(key: "Use", value: "Relapsing MS — first-line oral platform DMT; moderate efficacy"),
            KeyValueRow(key: "Dose", value: "Start 120 mg PO BID × 7 days → 240 mg PO BID maintenance; take with food + aspirin 325 mg 30 min before (reduces flushing)"),
            KeyValueRow(key: "Monitor", value: "CBC + ALC (absolute lymphocyte count) baseline + q3 months × first year → q6-12 months; LFTs; signs of infection + PML"),
            KeyValueRow(key: "Watch", value: "FLUSHING + GI side effects (~30% common initial 4 weeks then tolerance); LYMPHOPENIA + PML in prolonged lymphopenia (<500); ALT elevation; pruritus + rash; pregnancy use cautious")
        ],
        indications: AttributedProse(
            "Relapsing forms of MS — first-line oral DMT; moderate efficacy + tolerable side effect profile makes it widely used for milder disease; diroximel fumarate (Vumerity) is a related agent with improved GI tolerability per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Activates Nrf2 transcription factor → upregulates antioxidant + cytoprotective genes; immunomodulatory effects on lymphocytes including shifting from Th1 to Th2 phenotype + reducing oxidative stress in CNS. Mechanism for MS treatment partially understood.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Initial dose escalation", body: "120 mg PO BID × 7 days → 240 mg PO BID maintenance; reduce if intolerable then attempt re-escalation.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Take with food", body: "Take WITH FOOD (preferred fatty meal) reduces GI side effects; pre-medication aspirin 325 mg PO 30 minutes before dose reduces flushing.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe — caution; no specific adjustment.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Pediatric (≥10 years)", body: "Weight-based titration; consult pediatric neurology.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to dimethyl fumarate; concomitant other fumarate (diroximel fumarate, monomethyl fumarate).",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("FLUSHING + GI side effects — ~30% initial 4 weeks; abdominal pain, nausea, vomiting, diarrhea; usually improves with tolerance; ASPIRIN 325 mg PO 30 min before dose + with FOOD reduces flushing.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LYMPHOPENIA — sustained ALC <500 ↑ PML risk; CBC + ALC q3 months × first year → q6 months; if ALC <500 × 6 months → consider discontinuation; if ALC <800 × 6 months → re-evaluate.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PML (Progressive Multifocal Leukoencephalopathy) — rare; new neurologic deficits + MRI white matter changes; emergent workup.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LFT elevation — baseline + periodic; reduce / discontinue for elevations.", citationIDs: ["openfda_round31"]),
            AttributedBullet("FANCONI SYNDROME — proximal renal tubular dysfunction with proteinuria + glucosuria + acidosis; rare; urinalysis baseline + periodic.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ANAPHYLAXIS / angioedema — uncommon; discontinue.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PREGNANCY — limited data; use only if benefits outweigh risk; lactation acceptable.", citationIDs: ["openfda_round31"]),
            AttributedBullet("VACCINATIONS — generally OK; live vaccines avoided during prolonged severe lymphopenia.", citationIDs: ["specialty_round31"])
        ],
        adverseReactions: AttributedProse(
            "Flushing, abdominal pain, diarrhea, nausea, vomiting, dyspepsia, pruritus, rash, lymphopenia, hepatic enzyme elevation, infection, proteinuria.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER IMMUNOSUPPRESSANTS — additive cytopenias + infection; avoid concurrent.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ASPIRIN — REDUCES flushing (pre-medication 325 mg 30 min before); compatible.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LIVE VACCINES — avoid during prolonged severe lymphopenia.", citationIDs: ["specialty_round31"]),
            AttributedBullet("ALCOHOL — can worsen flushing; counsel.", citationIDs: ["openfda_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + ALC, LFTs, urinalysis, pregnancy test, vaccinations, MRI.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Pre-medication — aspirin 325 mg PO 30 minutes before each dose (if not contraindicated); take WITH FOOD; counsel tolerance over 4 weeks.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Monitoring — CBC + ALC q3 months × first year → q6 months; LFTs q3 months; urinalysis baseline + periodic.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Counsel — flushing + GI common initial; resolve with tolerance + aspirin pre-medication + food; REPORT severe weakness, fever, unusual infections, signs of liver problems, new neurologic deficits.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Dose adjustment — reduce to 120 mg BID temporarily if intolerable; re-escalate.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Lymphopenia management — if ALC <500 × 6 months → discontinue; check ALC + recovery before resuming.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Diroximel fumarate (Vumerity) — newer related agent; improved GI tolerability; same mechanism.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Pregnancy planning — counsel + alternative DMT if planning pregnancy.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This oral MS medicine reduces inflammation. Take WITH FOOD twice daily. Take aspirin 30 minutes before to reduce flushing. Side effects (flushing, stomach upset) usually improve in 4 weeks. Get bloodwork every 3 months. Tell us about severe weakness, infections, yellow eyes/skin, new neurologic symptoms. Use reliable birth control + tell us if planning pregnancy.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TeriflunomideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "teriflunomide",
        title: "Teriflunomide (Aubagio)",
        subtitle: "DHODH inhibitor · oral DMT relapsing MS · BOXED hepatotoxicity + TERATOGENICITY · CHOLESTYRAMINE washout for pregnancy · alopecia + neuropathy",
        category: "DHODH inhibitor — relapsing MS oral DMT",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pyrimidine synthesis inhibitor — dihydroorotate dehydrogenase (DHODH) inhibitor; immunomodulator"),
            KeyValueRow(key: "Use", value: "Relapsing MS in adults; alternative oral platform DMT; active metabolite of leflunomide"),
            KeyValueRow(key: "Dose", value: "7 mg OR 14 mg PO daily; with or without food"),
            KeyValueRow(key: "Monitor", value: "LFTs monthly × 6 months → q3 months; CBC + diff baseline + as clinically indicated; pregnancy test; BP; INR if on warfarin"),
            KeyValueRow(key: "Watch", value: "BOXED — HEPATOTOXICITY + TERATOGENICITY (animal); long half-life (~2 weeks); CHOLESTYRAMINE OR activated charcoal washout for pregnancy / overdose; alopecia + peripheral neuropathy + hypertension + skin reactions + interstitial lung disease")
        ],
        indications: AttributedProse(
            "Relapsing forms of multiple sclerosis in adults — alternative oral DMT; active metabolite of leflunomide (used for rheumatoid arthritis); moderate efficacy similar to platform interferon + glatiramer per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Inhibits dihydroorotate dehydrogenase (DHODH) — key enzyme in DE NOVO pyrimidine synthesis → reduces pyrimidine pool in rapidly proliferating lymphocytes (immune cells dependent on de novo synthesis) → reduced T + B cell proliferation. Cytostatic, not cytotoxic; spares resting + memory cells.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "7 mg OR 14 mg PO ONCE daily; 14 mg more effective; titrate based on tolerability + efficacy per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Hepatic", body: "Severe — AVOID; monitor LFTs (boxed); reduce / discontinue for elevations >3× ULN.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal", body: "No specific adjustment; severe renal impairment — limited data.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Washout (pregnancy/overdose/severe toxicity)", body: "CHOLESTYRAMINE 8 g PO TID × 11 days OR activated charcoal 50 g PO q12 hours × 11 days → reduces level to <0.02 mg/L; long half-life (~2 weeks) without washout per primary source.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment; PREGNANCY (Category X — animal teratogen + birth defects); breastfeeding; concomitant leflunomide; severe immunodeficiency or active infection; HIV+ uncontrolled.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("BOXED — SEVERE HEPATOTOXICITY — fatal liver failure rare; LFT monthly × 6 months → q3 months; ALT >3× ULN — discontinue + cholestyramine washout.", citationIDs: ["openfda_round31"]),
            AttributedBullet("BOXED — TERATOGENICITY — animal teratogen + birth defects; LONG HALF-LIFE (~2 weeks); RELIABLE CONTRACEPTION during + UNTIL plasma level <0.02 mg/L; for pregnancy planning OR confirmed pregnancy → CHOLESTYRAMINE WASHOUT × 11 days; both partners contraception encouraged.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PERIPHERAL NEUROPATHY — paresthesias, numbness, pain; reversible usually; discontinue if severe.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ALOPECIA + hair thinning — common; usually self-limited.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HYPERTENSION — monitor + treat.", citationIDs: ["openfda_round31"]),
            AttributedBullet("SKIN REACTIONS — Stevens-Johnson syndrome, TEN, hypersensitivity reactions; discontinue.", citationIDs: ["openfda_round31"]),
            AttributedBullet("INTERSTITIAL LUNG DISEASE — uncommon; cough + dyspnea + imaging; discontinue + cholestyramine.", citationIDs: ["openfda_round31"]),
            AttributedBullet("INFECTIONS — bacterial + viral + opportunistic; counsel; screen TB + HBV pre-treatment.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Cytopenias — uncommon; CBC monitoring.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HIV+ patients — exacerbates immunodeficiency; cautious use + ID consultation.", citationIDs: ["openfda_round31"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, alopecia, headache, paresthesia, abdominal pain, increased ALT, hypertension, peripheral neuropathy, skin reactions.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("LEFLUNOMIDE — same active metabolite; do not combine.", citationIDs: ["openfda_round31"]),
            AttributedBullet("WARFARIN — moderate increase in INR (~20%); monitor.", citationIDs: ["openfda_round31"]),
            AttributedBullet("OTHER HEPATOTOXIC drugs — additive hepatotoxicity; avoid concurrent ALCOHOL + acetaminophen high doses.", citationIDs: ["openfda_round31"]),
            AttributedBullet("CYP1A2 + CYP2C8 SUBSTRATES — teriflunomide inhibits + induces; monitor concurrent drugs.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LIVE VACCINES — avoid during treatment; complete pre-treatment; immunization response reduced.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Cholestyramine + activated charcoal — REMOVES teriflunomide (washout for pregnancy / overdose).", citationIDs: ["openfda_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — LFTs, CBC, BUN/Cr, BP, TB screening (PPD/IGRA), HBV/HCV serology, comprehensive vaccinations, pregnancy test + reliable contraception counseling.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Monitoring — LFTs MONTHLY × 6 months → q3 months; CBC + BP regularly; INR if on warfarin.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PREGNANCY counseling — Category X; reliable contraception during + until plasma level <0.02 mg/L (long half-life); CHOLESTYRAMINE WASHOUT × 11 days for pregnancy planning, confirmed pregnancy, severe toxicity; both partners encouraged.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Counsel — REPORT yellow eyes/skin, severe nausea, fatigue (hepatic); rash, fever, sore throat; numbness/tingling (neuropathy); breathlessness (ILD); pregnancy / planning.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Pregnancy washout — CHOLESTYRAMINE 8 g PO TID × 11 days OR activated charcoal; check plasma levels.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LIVE VACCINES — avoid during treatment; complete pre-treatment; inactivated OK.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Cost + insurance — specialty drug; financial assistance + ongoing care coordination.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Discontinuation — gradual return to baseline immunity; relapse rate increases as drug washes out (long half-life buffer).", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This oral MS pill reduces inflammation. Take with or without food. Get monthly bloodwork at first then every 3 months. Tell us about yellow eyes/skin, severe stomach upset, numbness, breathing problems, severe rash. Birth control is CRITICAL — this medicine causes birth defects + stays in your body for months. If planning pregnancy, we use a special washout protocol. Watch BP. Hair thinning common but usually improves.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum RasagilineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "rasagiline",
        title: "Rasagiline (Azilect) + selegiline + safinamide",
        subtitle: "MAO-B inhibitors · early Parkinson + adjunct to LDOPA · mild benefit · serotonin syndrome with SSRIs · tyramine reactions at high doses",
        category: "MAO-B inhibitor — Parkinson disease monotherapy + adjunct",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective MAO-B inhibitor → reduces dopamine breakdown in CNS"),
            KeyValueRow(key: "Use", value: "Parkinson disease — early monotherapy (mild benefit) OR adjunct to levodopa for motor fluctuations + off-time reduction"),
            KeyValueRow(key: "Dose", value: "Rasagiline 1 mg PO daily; selegiline 5 mg PO BID (max 10 mg); safinamide 50-100 mg PO daily; rasagiline most selective; safinamide also reduces dyskinesia"),
            KeyValueRow(key: "Monitor", value: "BP (orthostatic), mood, drug interactions, hepatic function"),
            KeyValueRow(key: "Watch", value: "SEROTONIN SYNDROME with SSRIs/SNRIs/TCAs/MAOIs (rare at selective doses but can occur); HYPERTENSIVE CRISIS with TYRAMINE-RICH foods (less than non-selective MAOIs); insomnia + nausea + headache; impulse control disorders (with dopamine agonists)")
        ],
        indications: AttributedProse(
            "Parkinson disease — early monotherapy OR adjunct to LEVODOPA for motor fluctuations (off-time reduction + smoother on-time). Rasagiline + safinamide may have neuroprotective effects (debated). Selegiline used for atypical depression in low doses (rarely now). Safinamide additionally reduces dyskinesia per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Selective irreversible inhibition of monoamine oxidase type B (MAO-B) → reduces dopamine breakdown in basal ganglia → increases synaptic dopamine + endogenous + exogenous (levodopa-derived) availability. Selectivity for MAO-B vs MAO-A reduces tyramine reactions (less hypertensive crisis risk than non-selective phenelzine/tranylcypromine). Safinamide also blocks voltage-gated sodium channels + modulates glutamate.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Rasagiline", body: "1 mg PO ONCE daily; can be taken any time per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Selegiline", body: "5 mg PO BID (breakfast + lunch) maximum 10 mg/day; transdermal patch available (EMSAM 6 mg/24h) for depression — different pharmacology.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Safinamide", body: "Initial 50 mg PO daily × 2 weeks → 100 mg PO daily; adjunct to levodopa.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Hepatic", body: "Mild — no adjustment; moderate-severe — reduce dose or avoid.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal", body: "No specific adjustment for rasagiline + safinamide.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Concomitant meperidine, tramadol, methadone, propoxyphene, dextromethorphan, cyclobenzaprine, St. John's wort; concurrent MAOIs; pheochromocytoma; severe hepatic impairment.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("SEROTONIN SYNDROME — combining with SSRIs/SNRIs/TCAs/buspirone/triptans/meperidine/tramadol → rare but emergent; counsel + medication review; if combining for depression carefully, use lowest effective dose + monitor.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HYPERTENSIVE CRISIS / TYRAMINE — significantly less risk than non-selective MAOIs at therapeutic doses; aged cheese / cured meats / fermented foods / draft beer / red wine / soy sauce / yeast extract — strict avoidance NOT required at selective doses but counsel moderation; rasagiline >1 mg loses selectivity.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — common + additive with levodopa.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HALLUCINATIONS + psychosis — particularly with levodopa combo + dopamine agonists; especially elderly.", citationIDs: ["openfda_round31"]),
            AttributedBullet("IMPULSE CONTROL DISORDERS — gambling, hypersexuality, compulsive shopping, binge eating; with dopamine agonist concurrent therapy.", citationIDs: ["openfda_round31"]),
            AttributedBullet("MELANOMA — increased risk in PD; surveillance + dermatology + sun protection.", citationIDs: ["openfda_round31"]),
            AttributedBullet("INSOMNIA + nausea + headache + dyskinesia (with levodopa adjunct).", citationIDs: ["openfda_round31"]),
            AttributedBullet("PREGNANCY — Category C; limited data.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ELECTIVE SURGERY — discontinue 1-2 weeks before for anesthetic safety; coordinate with anesthesia.", citationIDs: ["openfda_round31"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, abdominal pain, constipation, fatigue, depression, insomnia, dyskinesia, orthostatic hypotension, hallucinations, dyspepsia.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("MEPERIDINE, METHADONE, TRAMADOL, DEXTROMETHORPHAN, CYCLOBENZAPRINE, ST. JOHN'S WORT — CONTRAINDICATED (serotonin syndrome / serious reactions).", citationIDs: ["openfda_round31"]),
            AttributedBullet("SSRIs / SNRIs / TCAs — use cautiously; serotonin syndrome rare at selective doses; combining for depression with rasagiline + low-dose SSRI sometimes done in PD with depression.", citationIDs: ["openfda_round31"]),
            AttributedBullet("TRIPTANS (sumatriptan, etc.) — caution; rare serotonin syndrome.", citationIDs: ["openfda_round31"]),
            AttributedBullet("CIPROFLOXACIN — inhibits rasagiline CYP1A2 metabolism; reduce dose to 0.5 mg.", citationIDs: ["openfda_round31"]),
            AttributedBullet("TYRAMINE-RICH foods — moderate at selective doses; significant risk at high doses (rasagiline >1 mg or non-selective).", citationIDs: ["openfda_round31"]),
            AttributedBullet("LEVODOPA — synergistic; risk of dyskinesia + hallucinations + orthostasis; titrate.", citationIDs: ["openfda_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — BP supine + standing, ECG (QTc), comprehensive medications + supplements (St. John's wort), depression / mental health screen, hepatic function, dermatologic exam (melanoma risk in PD).", citationIDs: ["specialty_round31"]),
            AttributedBullet("Medication review crucial — extensive interactions; coordinate with all prescribers; pharmacist consultation.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Counsel — REPORT confusion, severe hypertension after foods (aged cheese / cured meats — moderate intake), high fever / agitation (serotonin syndrome — emergent), gambling + impulse behaviors, severe dizziness, new skin lesions.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Orthostatic precautions — rise slowly; especially with levodopa.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("ANESTHESIA — discontinue 1-2 weeks before elective surgery; coordinate; avoid meperidine specifically; CV monitoring.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Dermatology — annual skin exam for melanoma surveillance in PD.", citationIDs: ["specialty_round31"]),
            AttributedBullet("MAO inhibitor diet (less strict than non-selective) — moderate tyramine; counsel.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Combination with levodopa — reduces off-time + smoother control; monitor for dyskinesia + hallucinations.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This pill treats Parkinson disease by slowing dopamine breakdown. Tell us about ALL medicines (some can interact). Avoid large amounts of aged cheese, cured meats, fermented foods. Tell us about high fever + agitation right away (rare reaction). Rise slowly from sitting/lying. Tell us about gambling, hypersexuality, or other impulsive behaviors. Get yearly skin exam.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EntacaponeSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "entacapone",
        title: "Entacapone (Comtan) + opicapone + tolcapone",
        subtitle: "COMT inhibitors · adjunct to levodopa · reduces off-time + smoother dyskinesia · BROWN URINE (entacapone) · tolcapone hepatotoxic",
        category: "COMT inhibitor — Parkinson levodopa adjunct",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Peripheral catechol-O-methyltransferase (COMT) inhibitor — blocks levodopa metabolism + increases levodopa availability to brain"),
            KeyValueRow(key: "Use", value: "Parkinson disease adjunct to levodopa/carbidopa for motor fluctuations + wearing-off + reduce off-time"),
            KeyValueRow(key: "Dose", value: "Entacapone 200 mg PO with each levodopa dose (max 8 doses/day OR 1600 mg/day); opicapone 50 mg PO daily at bedtime; tolcapone 100 mg TID (LFT monitoring); Stalevo combines levodopa + carbidopa + entacapone"),
            KeyValueRow(key: "Monitor", value: "Motor symptoms + off-time + dyskinesia + LFTs (tolcapone especially); orthostatic vitals"),
            KeyValueRow(key: "Watch", value: "BROWN-ORANGE URINE (entacapone — harmless); DIARRHEA (entacapone); TOLCAPONE — RARE FATAL HEPATOTOXICITY (LFTs q2 weeks × 1 year then q2-4 weeks); dyskinesia (because more levodopa = more dyskinesia); NMS upon abrupt discontinuation")
        ],
        indications: AttributedProse(
            "Parkinson disease adjunct to LEVODOPA/CARBIDOPA — for motor fluctuations + wearing-off phenomenon + reduce off-time + smoother on-time. Adding COMT inhibitor allows lower levodopa dose with similar effect OR maintained effect with reduced fluctuations. Tolcapone reserved due to hepatotoxicity; opicapone newer convenient once-daily per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Inhibits catechol-O-methyltransferase (COMT) — peripheral enzyme that metabolizes levodopa to 3-O-methyldopa (3-OMD, inactive metabolite that competes for blood-brain barrier transport). Blocking COMT increases levodopa half-life + availability for brain conversion to dopamine → smoother + prolonged motor benefit. Tolcapone also has central activity (BBB-crossing). Does NOT alter brain dopamine breakdown (no MAO-B effect).",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Entacapone", body: "200 mg PO with each levodopa dose (max 8 doses/day or 1600 mg/day); take with food per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Opicapone", body: "50 mg PO once daily AT BEDTIME at least 1 hour after last levodopa dose; convenient once-daily; better tolerated than entacapone.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Tolcapone", body: "100 mg PO TID (rarely 200 mg TID); RESERVED — must have informed consent + LFT monitoring; fatal hepatotoxicity risk.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Combination (Stalevo)", body: "Levodopa/carbidopa/entacapone fixed-dose combo — multiple strengths (50/12.5/200, 75/18.75/200, 100/25/200, 125/31.25/200, 150/37.5/200, 200/50/200); convenient single tablet.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Hepatic", body: "Mild-moderate — entacapone OK; tolcapone AVOID; severe — caution all.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal", body: "No specific adjustment.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; concurrent non-selective MAOIs; pheochromocytoma; severe hepatic impairment. Tolcapone — pre-existing liver disease, prior hepatic injury from tolcapone.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("BROWN-ORANGE URINE — harmless; counsel reassure (entacapone).", citationIDs: ["openfda_round31"]),
            AttributedBullet("DIARRHEA — common (5-10%) with entacapone; usually mild + resolves; if persistent + severe → discontinue.", citationIDs: ["openfda_round31"]),
            AttributedBullet("TOLCAPONE BOXED — RARE FATAL HEPATOTOXICITY (~10 deaths reported); LFTs q2 weeks × 6 months → q2-4 weeks; STOP if ALT >2× ULN.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DYSKINESIA — increased due to more levodopa available; reduce levodopa dose by 25-30% when adding entacapone.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — additive with levodopa + dopamine agonists.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HALLUCINATIONS + psychosis — particularly in elderly + advanced PD.", citationIDs: ["openfda_round31"]),
            AttributedBullet("NMS-like upon ABRUPT DISCONTINUATION — withdraw gradually; counsel never abruptly stop.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DRUG INTERACTIONS — catecholamine-containing drugs (norepinephrine, dopamine, epinephrine, methyldopa, dobutamine) increased effect from COMT inhibition; non-selective MAOIs contraindicated.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PREGNANCY — Category C; lactation — limited data.", citationIDs: ["openfda_round31"])
        ],
        adverseReactions: AttributedProse(
            "Dyskinesia, nausea, diarrhea (entacapone), urine discoloration brown-orange, abdominal pain, fatigue, hallucinations, hypotension, hepatotoxicity (tolcapone).",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("NON-SELECTIVE MAOIs — CONTRAINDICATED (catecholamine excess); selegiline/rasagiline OK at standard doses.", citationIDs: ["openfda_round31"]),
            AttributedBullet("CATECHOLAMINE-containing drugs (NE, dopamine, epinephrine, methyldopa, dobutamine, isoproterenol) — significantly increased effect; cardiac monitoring.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LEVODOPA — synergistic; reduce levodopa dose 25-30% to manage dyskinesia + reduce wearing-off.", citationIDs: ["openfda_round31"]),
            AttributedBullet("WARFARIN — minimal interaction.", citationIDs: ["openfda_round31"]),
            AttributedBullet("CHELATORS / iron — separate from doses (chelate levodopa).", citationIDs: ["openfda_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — motor symptoms + off-time + dyskinesia + LFTs (tolcapone), BP, comprehensive medications.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Take with food + take ENTACAPONE with each levodopa dose (timed together); OPICAPONE once daily at bedtime AFTER last levodopa dose.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Counsel — BROWN-ORANGE URINE harmless; diarrhea common initial weeks; report severe diarrhea, dyskinesia worsening, hallucinations, severe orthostasis.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("DOSE ADJUSTMENT levodopa — reduce 25-30% when starting entacapone to control dyskinesia.", citationIDs: ["openfda_round31"]),
            AttributedBullet("TOLCAPONE LFT monitoring — q2 weeks × 6 months; STOP if ALT >2× ULN; counsel; informed consent.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Never abruptly stop — gradual taper; coordinate movement disorders specialist.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Drug interactions — flag pre-anesthesia (catecholamines) + non-selective MAOIs.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Opicapone preferred for new starts — once daily + better tolerated than entacapone.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This pill works WITH your levodopa to smooth out symptoms. Take entacapone with every levodopa dose; opicapone once daily at bedtime. Your urine may turn brown-orange — this is normal. Diarrhea common at first. Tell us about severe diarrhea, increased involuntary movements (we may reduce your levodopa), hallucinations, severe dizziness. Never stop suddenly.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AmantadineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "amantadine",
        title: "Amantadine (Symmetrel + Gocovri)",
        subtitle: "NMDA antagonist + dopamine releaser · PD tremor + DYSKINESIA + fatigue · ER for dyskinesia (Gocovri) · influenza prophylaxis (historical) · livedo reticularis",
        category: "NMDA antagonist + dopamine releaser — Parkinson + influenza (historical)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "NMDA receptor antagonist + dopamine releaser + anticholinergic; mechanism in PD partially understood"),
            KeyValueRow(key: "Use", value: "Parkinson disease — tremor (mild), LEVODOPA-INDUCED DYSKINESIA (ER specifically — Gocovri), fatigue, drug-induced parkinsonism; INFLUENZA A prophylaxis historically (resistance now > 95% — not recommended)"),
            KeyValueRow(key: "Dose", value: "Immediate-release: 100 mg PO BID-TID; Gocovri ER (capsules): 137 mg PO daily at bedtime → 274 mg daily after 1 week (LID indication); reduce in renal impairment"),
            KeyValueRow(key: "Monitor", value: "Motor symptoms + LID + cognition + livedo + edema; renal function"),
            KeyValueRow(key: "Watch", value: "LIVEDO RETICULARIS (mottled lower extremity skin) — common harmless; ANTICHOLINERGIC effects (confusion, dry mouth, constipation, urinary retention); orthostatic hypotension; ankle edema; psychosis in elderly; sudden withdrawal NMS-like")
        ],
        indications: AttributedProse(
            "Parkinson disease — tremor (mild benefit), LEVODOPA-INDUCED DYSKINESIA (immediate-release used for years; Gocovri extended-release FDA-approved 2017 specifically for LID), fatigue, drug-induced parkinsonism (especially first-generation antipsychotic-induced). Influenza A prophylaxis historically — RESISTANCE >95% means not recommended per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Multiple mechanisms — NMDA receptor antagonist (reduces glutamate-mediated overstimulation in basal ganglia → reduces dyskinesia + tremor); dopamine releaser + reuptake inhibitor (increases synaptic dopamine); anticholinergic activity (reduces parkinsonian rigidity + tremor); influenza M2 ion channel blocker (historical).",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Adult PD (immediate-release)", body: "Initial 100 mg PO BID; can increase to 100 mg TID; maximum 400 mg/day; reduce in elderly + renal impairment per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Gocovri ER (dyskinesia)", body: "137 mg PO daily AT BEDTIME × 7 days → 274 mg PO daily at bedtime; FDA-approved specifically for LID + off-episodes; capsules cannot be crushed/chewed.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Influenza prophylaxis (historical)", body: "100 mg PO BID; NOT recommended due to resistance; oseltamivir / baloxavir preferred.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal adjustment", body: "CrCl 60 — 100 mg BID; CrCl 30-50 — 200 mg day 1 → 100 mg daily; CrCl 15-29 — 200 mg day 1 → 100 mg every other day; <15 mL/min — 200 mg single dose then 100 mg q7 days.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Hepatic", body: "Severe — caution.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to amantadine; angle-closure glaucoma; severe renal impairment (relative — adjust dose).",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("LIVEDO RETICULARIS — mottled bluish-red lower extremity skin discoloration; common (~50%); harmless; counsel + reassure.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ANTICHOLINERGIC effects — confusion (especially elderly), dry mouth, constipation, urinary retention, blurred vision, dry eyes; counsel + monitor.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — additive with levodopa + dopamine agonists; rise slowly.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ANKLE EDEMA — common; usually mild + manageable with elevation + compression.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PSYCHOSIS / hallucinations + confusion — especially elderly + advanced PD; reduce dose or discontinue.", citationIDs: ["openfda_round31"]),
            AttributedBullet("SUDDEN WITHDRAWAL — NMS-like syndrome possible; taper gradually.", citationIDs: ["openfda_round31"]),
            AttributedBullet("RENAL — accumulates with impairment; dose adjustments essential.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PREGNANCY — Category C; limited data; lactation — limited data.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HEART FAILURE — caution; can exacerbate.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Impulse control disorders — uncommon vs other PD meds.", citationIDs: ["openfda_round31"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, dizziness, insomnia, livedo reticularis, dry mouth, constipation, ankle edema, blurred vision, confusion, hallucinations, orthostatic hypotension, headache.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("ANTICHOLINERGICS — additive (dry mouth, urinary retention, confusion); avoid combining if possible.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ALCOHOL — additive CNS effects.", citationIDs: ["openfda_round31"]),
            AttributedBullet("TRIAMTERENE, HYDROCHLOROTHIAZIDE — increase amantadine levels; monitor.", citationIDs: ["openfda_round31"]),
            AttributedBullet("CNS DEPRESSANTS — additive sedation.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LIVE FLU VACCINE — historically; oseltamivir preferred for prophylaxis now.", citationIDs: ["openfda_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC, BUN/Cr, hepatic, comprehensive medications, eye exam (angle-closure glaucoma), cognitive baseline (elderly).", citationIDs: ["specialty_round31"]),
            AttributedBullet("Take with food to reduce GI; immediate-release morning + noon (NOT evening — insomnia); Gocovri ER at BEDTIME.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Counsel — LIVEDO RETICULARIS harmless skin pattern; dry mouth, urinary symptoms, constipation common; report severe confusion, hallucinations, urinary retention, vision changes.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Renal dosing — verify CrCl; reduce dose to avoid toxicity (accumulates).", citationIDs: ["openfda_round31"]),
            AttributedBullet("Gradual taper — never abrupt discontinuation; NMS-like syndrome.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Elderly + advanced PD — confusion + hallucinations + falls risk; balance benefit vs side effects.", citationIDs: ["openfda_round31"]),
            AttributedBullet("LID benefit — Gocovri ER specifically; many patients can continue immediate-release for tremor + dyskinesia.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Drug-induced parkinsonism — useful adjunct; switch causative agent if possible.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Flu prophylaxis — NOT recommended (resistance); use oseltamivir.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This pill treats Parkinson disease + reduces dyskinesia. Take with food. You may notice a mottled purplish pattern on your legs — this is harmless. Tell us about confusion, severe dry mouth, trouble urinating, hallucinations, severe leg swelling. Don't stop suddenly — taper with us. Rise slowly to avoid dizziness.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PyridostigmineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pyridostigmine",
        title: "Pyridostigmine (Mestinon)",
        subtitle: "Cholinesterase inhibitor · 1st-line myasthenia gravis · improves muscle strength · MUSCARINIC side effects (SLUDGE) · CHOLINERGIC CRISIS at high doses",
        category: "Cholinesterase inhibitor — myasthenia gravis 1st-line",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Reversible cholinesterase inhibitor → prevents acetylcholine breakdown at neuromuscular junction"),
            KeyValueRow(key: "Use", value: "Myasthenia gravis (MG) — symptomatic treatment; reverses neuromuscular blockers post-anesthesia (different formulation); urinary retention + paralytic ileus (off-label)"),
            KeyValueRow(key: "Dose", value: "Adult MG: 30-60 mg PO every 4-6 hours during waking hours; max ~600 mg/day; titrate to symptoms; sustained-release (Mestinon Timespan) 180 mg every 12-24 hours"),
            KeyValueRow(key: "Monitor", value: "Motor strength + bulbar function + respiratory function (forced vital capacity); symptom diary + medication timing; cholinergic effects (SLUDGE)"),
            KeyValueRow(key: "Watch", value: "MUSCARINIC SLUDGE — salivation, lacrimation, urination, defecation, GI upset, emesis (\"SLUDGE\"); CHOLINERGIC CRISIS at high doses (weakness, fasciculations, respiratory failure); MYASTHENIC vs CHOLINERGIC crisis differentiation (Tensilon test or empiric atropine challenge)")
        ],
        indications: AttributedProse(
            "Myasthenia gravis — first-line symptomatic treatment; improves muscle strength + bulbar function; does NOT alter underlying autoimmune process. Reverses neuromuscular blockers (vecuronium, rocuronium) post-anesthesia in different IV formulation (typically neostigmine used in OR). Off-label — urinary retention, paralytic ileus, postoperative GI dysmotility per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Quaternary amine reversible cholinesterase inhibitor — binds to acetylcholinesterase active site → prevents breakdown of acetylcholine in synaptic cleft → INCREASED ACh available at neuromuscular junction + autonomic ganglia. Quaternary structure limits CNS penetration (less central side effects than physostigmine). Compensates for reduced ACh receptors in MG.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Adult MG (immediate-release)", body: "Initial 30-60 mg PO every 4-6 hours during waking hours; titrate to symptom control + side effect tolerance; maximum ~600 mg/day in 4-6 divided doses per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Sustained-release (Mestinon Timespan)", body: "180 mg PO every 12-24 hours; useful for nighttime / bulbar symptoms; less convenient than IR for fluctuating symptoms.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Pediatric", body: "1 mg/kg PO every 4-6 hours; max 7 mg/kg/day in divided doses.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Myasthenic crisis", body: "May increase pyridostigmine + add IVIG OR plasma exchange + steroids; intubation + mechanical ventilation if respiratory failure; ICU.", citationIDs: ["specialty_round31"]),
            DosingBlock(label: "Renal", body: "Severe — caution; renal elimination significant.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to pyridostigmine OR bromides; mechanical intestinal OR urinary tract obstruction; bronchial asthma (relative — bronchospasm).",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("MUSCARINIC SLUDGE — Salivation, Lacrimation, Urination, Defecation, GI upset, Emesis; dose-dependent + manageable with atropine OR glycopyrrolate; balance with motor benefit.", citationIDs: ["openfda_round31"]),
            AttributedBullet("CHOLINERGIC CRISIS — at HIGH doses; weakness + fasciculations + miosis + sweating + bradycardia + respiratory paralysis; ATROPINE 1-2 mg IV antidote + discontinue pyridostigmine; respiratory support.", citationIDs: ["specialty_round31"]),
            AttributedBullet("MYASTHENIC vs CHOLINERGIC CRISIS — both cause weakness; differentiate: Tensilon (edrophonium) test (myasthenic → strength improves; cholinergic → worsens) OR empiric atropine challenge; consider intubation while differentiating + adjust pyridostigmine.", citationIDs: ["specialty_round31"]),
            AttributedBullet("BRONCHOSPASM — caution in asthma + COPD; bronchodilator pre-treatment if needed.", citationIDs: ["openfda_round31"]),
            AttributedBullet("BRADYARRHYTHMIA + AV block — cardiac monitoring particularly in elderly + cardiac disease.", citationIDs: ["openfda_round31"]),
            AttributedBullet("CONCURRENT IMMUNOSUPPRESSION — definitive MG treatment with thymectomy + azathioprine + mycophenolate + rituximab + eculizumab.", citationIDs: ["specialty_round31"]),
            AttributedBullet("DRUG INTERACTIONS — non-depolarizing neuromuscular blockers (worsen MG symptoms); anticholinergics antagonize.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DRUGS WORSENING MG — aminoglycosides, fluoroquinolones, macrolides, telithromycin, beta-blockers, magnesium, succinylcholine; coordinate with anesthesia.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PREGNANCY — Category C; lactation OK; coordinate; some neonatal MG transient.", citationIDs: ["specialty_round31"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea, abdominal cramps, increased salivation, miosis, lacrimation, sweating, bradycardia, muscle fasciculations, bronchospasm, urinary urgency.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("NON-DEPOLARIZING NMBs (rocuronium, vecuronium, cisatracurium) — antagonized by pyridostigmine; coordinate anesthesia.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DEPOLARIZING NMBs (succinylcholine) — prolonged effect; avoid in MG.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DRUGS WORSENING MG — aminoglycosides, fluoroquinolones (esp ciprofloxacin), macrolides, telithromycin, beta-blockers, magnesium (IV), succinylcholine, lithium, statins, immune checkpoint inhibitors (anti-PD-1/PD-L1).", citationIDs: ["specialty_round31"]),
            AttributedBullet("ANTICHOLINERGICS (atropine, diphenhydramine, glycopyrrolate) — antagonize pyridostigmine; useful at low doses for SLUDGE; large doses precipitate myasthenic crisis.", citationIDs: ["openfda_round31"]),
            AttributedBullet("STEROIDS — synergistic for MG; first-line concurrent treatment; transient worsening early.", citationIDs: ["specialty_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — motor function + bulbar + respiratory (forced vital capacity, negative inspiratory force), AChR antibodies + MuSK antibodies, thymectomy assessment + chest CT, comprehensive medications + flag drugs worsening MG.", citationIDs: ["specialty_round31"]),
            AttributedBullet("SYMPTOM DIARY — patient logs medication timing + meals + symptoms + side effects; titrate dose to optimal balance.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Take 30 minutes BEFORE meals to optimize bulbar swallowing strength.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Counsel — SLUDGE expected at higher doses; report severe weakness (myasthenic vs cholinergic crisis), respiratory difficulty (emergent), severe diarrhea, abdominal cramps, palpitations.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("CRISIS recognition — sudden severe weakness; differentiate myasthenic (often after stress, infection, surgery, missed dose) vs cholinergic (high doses, fasciculations + miosis + sweating); ICU + intubation + supportive; immunotherapy (IVIG/PLEX) for myasthenic.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Anesthesia / surgery — communicate MG diagnosis; avoid succinylcholine + careful NMBs; sugammadex preferred reversal; postoperative respiratory monitoring.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Concurrent immunotherapy — definitive treatment usually combined (steroids, mycophenolate, rituximab, eculizumab for AChR+); thymectomy for thymoma OR generalized AChR-MG.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PROGNOSIS — 80%+ achieve good control with combined therapy; chronic disease requiring lifelong care.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Vaccinations — keep updated; some flares post-infection; pneumococcal + influenza annual.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This medicine helps muscles work better in myasthenia gravis. Take 30 minutes BEFORE meals. Side effects (drooling, watery eyes, diarrhea, urinating more) are common — usually manageable. Keep a diary of doses, meals, symptoms. CALL US RIGHT AWAY for sudden severe weakness, breathing trouble, or trouble swallowing — could be a crisis. Some medicines worsen MG — show our list to every provider. Don't miss doses.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LacosamideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lacosamide",
        title: "Lacosamide (Vimpat)",
        subtitle: "Sodium channel modulator (slow inactivation) · partial-onset seizures + status epilepticus · IV + PO · PR INTERVAL prolongation · dizziness + diplopia",
        category: "Sodium channel modulator AED — focal-onset epilepsy + status",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective slow inactivation of voltage-gated sodium channels → stabilization of hyperexcitable neuronal membranes"),
            KeyValueRow(key: "Use", value: "Focal (partial)-onset seizures adjunct + monotherapy in adults + children ≥4 years; generalized tonic-clonic seizures adjunct ≥4 years; STATUS EPILEPTICUS (off-label IV)"),
            KeyValueRow(key: "Dose", value: "Initial 50 mg PO/IV BID × 1 week → 100 mg BID; titrate weekly by 50 mg BID to max 400 mg/day; status: 200-400 mg IV load over 15 minutes"),
            KeyValueRow(key: "Monitor", value: "Seizure frequency, ECG (PR interval), liver function, suicidal ideation"),
            KeyValueRow(key: "Watch", value: "PR INTERVAL PROLONGATION + AV block (especially with other PR-prolonging drugs); dizziness + diplopia + ataxia common; suicidal ideation (class effect); cardiac history caution; IV/PO interchangeable")
        ],
        indications: AttributedProse(
            "Focal (partial)-onset seizures in adults + pediatric ≥4 years — adjunct + monotherapy; primary generalized tonic-clonic seizures adjunct ≥4 years. STATUS EPILEPTICUS — IV loading dose off-label but well-established second/third-line per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Selective enhancement of slow inactivation of voltage-gated sodium channels (different from older Na+ channel blockers like phenytoin/carbamazepine which affect fast inactivation) → stabilization of hyperexcitable neuronal membranes + reduction of neurotransmitter release; novel mechanism. No effect on GABAergic or glutamatergic systems directly.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Adult focal seizures (PO)", body: "Initial 50 mg PO BID × 1 week → 100 mg PO BID; titrate weekly by 50 mg BID increments to max 200 mg PO BID (400 mg/day total) per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Adult IV", body: "Same as PO; 50% bioavailability oral; IV 1:1 conversion; useful when NPO + acute setting.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Status epilepticus", body: "IV LOAD 200-400 mg IV over 15 minutes (some protocols up to 600 mg); follow-up oral maintenance; second-third line after benzodiazepine + fosphenytoin or other.", citationIDs: ["specialty_round31"]),
            DosingBlock(label: "Pediatric (≥4 years)", body: "Weight-based; consult pediatric neurology.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Hepatic", body: "Mild-moderate (Child-Pugh A-B) — max 300 mg/day; severe (C) — avoid.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal", body: "CrCl <30 — max 300 mg/day; hemodialysis — supplement after.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; congenital long QT; second OR third-degree AV block; cardiac conduction abnormalities; severe hepatic impairment.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("PR INTERVAL PROLONGATION + AV BLOCK — dose-dependent; baseline ECG; cardiac history (CHF, MI, conduction abnormalities) caution; combine with other PR-prolonging drugs (beta-blockers, CCBs, antiarrhythmics, methadone, lithium) → caution.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ATRIAL FIBRILLATION + ATRIAL FLUTTER — uncommon but reported.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DIZZINESS + ATAXIA + DIPLOPIA + blurred vision — common; usually dose-related + reversible with reduction.", citationIDs: ["openfda_round31"]),
            AttributedBullet("SUICIDAL IDEATION + BEHAVIOR — class effect of all AEDs; monitor + screen + counsel.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DRESS / multiorgan hypersensitivity — rare; rash, fever, eosinophilia, hepatic + renal involvement; discontinue.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ABRUPT WITHDRAWAL — increased seizure risk; gradual taper.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PREGNANCY — Category C; pregnancy registry; AED considerations balanced with seizure control.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HEPATIC + RENAL impairment — dose adjustments.", citationIDs: ["openfda_round31"]),
            AttributedBullet("DRUG INTERACTIONS — minimal compared to older AEDs; CYP-independent metabolism; valproate may slightly increase levels.", citationIDs: ["openfda_round31"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, headache, diplopia, nausea, vomiting, vertigo, blurred vision, ataxia, somnolence, tremor, depression, asthenia, PR prolongation, arrhythmia (rare).",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("PR-PROLONGING DRUGS (beta-blockers, calcium channel blockers, digoxin, amiodarone, lithium, methadone) — additive PR prolongation + arrhythmia risk.", citationIDs: ["openfda_round31"]),
            AttributedBullet("OTHER AEDs — minimal interaction (favorable polytherapy candidate); carbamazepine + phenytoin slight metabolism increase.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ALCOHOL — additive CNS depression.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Hormonal contraceptives — no significant effect.", citationIDs: ["openfda_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive seizure history, ECG, LFTs, BUN/Cr, comprehensive medications + flag cardiac conduction drugs.", citationIDs: ["specialty_round31"]),
            AttributedBullet("PO + IV INTERCHANGEABLE — same dose; useful transition from IV to PO.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Titration weekly to minimize side effects; can administer in acute setting with rapid IV loading for status epilepticus.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Cardiac monitoring — baseline ECG; PR interval surveillance; cardiac history precautions.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Suicidal ideation surveillance — screen + counsel + family monitoring (class effect of all AEDs).", citationIDs: ["openfda_round31"]),
            AttributedBullet("Counsel — common side effects (dizziness, double vision, ataxia, dizziness) usually improve over time + reduce with dose; report worsening seizures, mood changes, rash + fever (DRESS), severe arrhythmia symptoms.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Polytherapy compatible — minimal interactions; good adjunct + monotherapy switch option.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Pregnancy — risk-benefit; pregnancy registry enrollment; coordinate with epilepsy + OB.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats seizures. Take twice daily (or as we direct). Tell us about any racing or skipped heartbeats. Dizziness + double vision are common at first — improve with time. Tell us about mood changes, suicidal thoughts, rash with fever. Never stop suddenly. Get bloodwork as ordered.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ErenumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "erenumab",
        title: "Erenumab (Aimovig) + CGRP migraine prophylaxis MABs",
        subtitle: "Anti-CGRP receptor MAB · monthly SC migraine prophylaxis · fremanezumab + galcanezumab + eptinezumab alternatives · constipation + injection site",
        category: "Anti-CGRP receptor MAB — migraine prophylaxis",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal antibody against calcitonin gene-related peptide receptor (CGRP-R)"),
            KeyValueRow(key: "Use", value: "Episodic + chronic migraine prophylaxis in adults with inadequate response or intolerance to oral preventives; failed 2-3 other preventives typically"),
            KeyValueRow(key: "Dose", value: "Erenumab: 70 mg OR 140 mg SC monthly; auto-injector or prefilled syringe; alternative — fremanezumab 225 mg SC monthly OR 675 mg q3 months; galcanezumab 240 mg SC load → 120 mg SC monthly; eptinezumab 100 mg or 300 mg IV q3 months"),
            KeyValueRow(key: "Monitor", value: "Migraine frequency + severity + days; injection site reactions; constipation (erenumab); hypertension"),
            KeyValueRow(key: "Watch", value: "INJECTION SITE reactions; CONSTIPATION (erenumab specifically — sometimes severe); HYPERSENSITIVITY rare; HYPERTENSION (erenumab); ALOPECIA + GI uncommon; pregnancy limited data")
        ],
        indications: AttributedProse(
            "Episodic migraine (4-14 migraine days/month) + chronic migraine (≥15 headache days/month with ≥8 migraine features) prophylaxis in adults — when oral preventives (topiramate, beta-blockers, TCAs, valproate) inadequate or intolerable. First targeted migraine prophylaxis class with monthly/quarterly injectable dosing per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Calcitonin gene-related peptide (CGRP) is a potent vasoactive neuropeptide released during migraine attacks; mediates trigeminovascular pain. Erenumab is human IgG2 monoclonal antibody that binds CGRP RECEPTOR (functional antagonism). Fremanezumab/galcanezumab/eptinezumab bind CGRP LIGAND. All reduce migraine days + severity prophylactically.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Erenumab", body: "70 mg SC monthly (4 weeks); can escalate to 140 mg SC monthly if inadequate response; auto-injector OR prefilled syringe per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Fremanezumab (Ajovy)", body: "225 mg SC monthly OR 675 mg SC every 3 months (q3 months); auto-injector.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Galcanezumab (Emgality)", body: "240 mg SC loading dose → 120 mg SC monthly thereafter; auto-injector.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Eptinezumab (Vyepti)", body: "100 mg OR 300 mg IV infusion every 3 months over 30 minutes; only IV CGRP-MAB.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Self-administration", body: "Auto-injector OR prefilled syringe; abdominal SC, thigh, upper arm; rotate sites; refrigerate; warm to room temperature before injection.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Hepatic / renal", body: "No specific adjustment for any CGRP-MAB.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to specific CGRP-MAB.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("CONSTIPATION (erenumab) — common (~10%), sometimes SEVERE requiring hospitalization or discontinuation; counsel + fluid + fiber + laxatives; consider alternative CGRP-MAB if persistent.", citationIDs: ["openfda_round31"]),
            AttributedBullet("INJECTION SITE REACTIONS — pain, erythema, induration, pruritus; rotate sites; local cool compress.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HYPERTENSION — particularly erenumab; monitor BP; new-onset HTN reported.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HYPERSENSITIVITY — rare; rash, urticaria, angioedema, anaphylaxis; discontinue.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ALOPECIA — uncommon.", citationIDs: ["openfda_round31"]),
            AttributedBullet("MUSCLE SPASMS + GI uncommon.", citationIDs: ["openfda_round31"]),
            AttributedBullet("PREGNANCY — Category not established; limited data; pregnancy registry; CGRP receptor important in some vascular adaptation; theoretical concerns.", citationIDs: ["openfda_round31"]),
            AttributedBullet("RAYNAUD-like — theoretical from CGRP vasodilator blockade; rare reports.", citationIDs: ["openfda_round31"])
        ],
        adverseReactions: AttributedProse(
            "Injection site reactions, constipation (erenumab), hypertension (erenumab), nasopharyngitis, fatigue, alopecia (rare), muscle spasms, hypersensitivity.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("Minimal — MABs not metabolized by CYPs; no significant pharmacokinetic interactions.", citationIDs: ["openfda_round31"]),
            AttributedBullet("Combination with ORAL CGRP gepants (ubrogepant, rimegepant, atogepant) — combination + theoretical synergy + reduces gepant clearance; clinical use evolving.", citationIDs: ["specialty_round31"]),
            AttributedBullet("LIVE VACCINES — generally OK; CGRP-MABs don't suppress immune system broadly.", citationIDs: ["specialty_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — migraine diary (days + severity + medication use), failed preventives history + reason for failure, BP, comprehensive medications, pregnancy status.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Patient training — auto-injector / prefilled syringe technique; warm to room temperature; site rotation; storage refrigerated.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Monitoring — migraine diary (response in 1-3 months); BP at visits (erenumab); constipation management (erenumab).", citationIDs: ["specialty_round31"]),
            AttributedBullet("Counsel — first dose can give in clinic; observe; subsequent at home; storage refrigerated 2-8°C; warm to room temp before injection.", citationIDs: ["openrn_pharm_round31"]),
            AttributedBullet("Constipation (erenumab specifically) — fluid 2 L/day, fiber, exercise, polyethylene glycol, senna PRN; severe → switch to ligand-binding CGRP-MAB (fremanezumab, galcanezumab, eptinezumab).", citationIDs: ["specialty_round31"]),
            AttributedBullet("Other migraine therapies — acute (triptans, gepants, ditans), preventives oral (topiramate, beta-blockers, TCAs, valproate, candesartan, magnesium, riboflavin), nutraceuticals (CoQ10, butterbur, feverfew), Botox.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Pregnancy — limited data; coordinate with neurology + OB; pregnancy registry.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Cost + insurance — expensive specialty; prior authorization + manufacturer assistance.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Response assessment — 1-3 months for full effect; consider switch if inadequate response after 3 months at adequate dose.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This monthly shot prevents migraines. Take consistently every month. Keep a migraine diary. Watch for constipation with erenumab — drink water + eat fiber. Tell us if not better after 3 months. Refrigerate the pen; warm to room temperature before injecting. Rotate sites. Tell us if you become pregnant.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NusinersenSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nusinersen",
        title: "Nusinersen (Spinraza) + SMA therapies",
        subtitle: "Antisense oligonucleotide · SMN2-targeted · spinal muscular atrophy (SMA) · INTRATHECAL administration · SMA type 1-4 · onasemnogene gene therapy alternative",
        category: "Antisense oligonucleotide — spinal muscular atrophy (SMA)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Antisense oligonucleotide (ASO) targeting SMN2 pre-mRNA → modulates splicing to produce more functional SMN protein"),
            KeyValueRow(key: "Use", value: "Spinal muscular atrophy (SMA) — pediatric + adult; SMA types 1-4; intrathecal administration"),
            KeyValueRow(key: "Dose", value: "12 mg INTRATHECAL lumbar puncture — 4 loading doses on days 0, 14, 28, 63 → maintenance every 4 months thereafter; lifelong"),
            KeyValueRow(key: "Monitor", value: "Motor function (HFMSE, CHOP INTEND, RULM); LP complications; CBC + platelets + coagulation + urine protein; neurodevelopmental assessment"),
            KeyValueRow(key: "Watch", value: "INTRATHECAL administration with anesthesia + procedural sedation in young children; THROMBOCYTOPENIA + coagulation abnormalities; renal toxicity + proteinuria; HYDROCEPHALUS (reports); post-LP headache + back pain")
        ],
        indications: AttributedProse(
            "Spinal muscular atrophy (SMA) — pediatric + adult patients; SMA types 1-4 (most severe SMA1 to mildest SMA4). First disease-modifying therapy for SMA approved 2016. Alternatives — onasemnogene abeparvovec (Zolgensma — single-dose gene therapy IV in children <2 years), risdiplam (Evrysdi — oral SMN2 splicing modulator) per primary source.",
            citationIDs: ["specialty_round31", "openfda_round31"]
        ),
        mechanism: AttributedProse(
            "Spinal muscular atrophy caused by deletion/mutation of SMN1 gene → reduced survival motor neuron (SMN) protein → motor neuron degeneration. SMN2 backup gene produces mostly truncated protein due to exon 7 splicing defect. Nusinersen is antisense oligonucleotide that BINDS SMN2 pre-mRNA + alters splicing → INCLUDES EXON 7 → produces full-length functional SMN protein → preserves motor neurons + improves function.",
            citationIDs: ["openfda_round31"]
        ),
        dosing: [
            DosingBlock(label: "Loading + maintenance", body: "12 mg INTRATHECAL lumbar puncture on days 0, 14, 28, 63 (4 loading doses) → maintenance every 4 months thereafter; lifelong; under fluoroscopy or ultrasound guidance per primary source.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Setting", body: "Hospital / specialty center; procedural sedation/anesthesia in pediatric + complex spine; experienced team.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Pediatric", body: "Same dose regardless of age; preferred in younger patients with better preservation of motor neurons.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Renal", body: "Severe — caution; renal monitoring; possible proteinuria.", citationIDs: ["openfda_round31"]),
            DosingBlock(label: "Hepatic", body: "Severe — caution.", citationIDs: ["openfda_round31"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to nusinersen; severe spine deformity precluding intrathecal access.",
            citationIDs: ["openfda_round31"]
        ),
        warnings: [
            AttributedBullet("INTRATHECAL ADMINISTRATION risks — post-LP headache, back pain, paresthesias, infection (meningitis), accidental dural puncture; experienced neurology + IR team; sedation/anesthesia in pediatric.", citationIDs: ["openfda_round31"]),
            AttributedBullet("THROMBOCYTOPENIA + coagulation abnormalities — baseline platelets + INR/PT + clinical bleeding signs.", citationIDs: ["openfda_round31"]),
            AttributedBullet("RENAL TOXICITY + PROTEINURIA — baseline + periodic urinalysis; AKI rare but reported.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HYDROCEPHALUS — reported; new HA, vomiting, vision changes → imaging.", citationIDs: ["openfda_round31"]),
            AttributedBullet("HYPERSENSITIVITY — rare; monitor.", citationIDs: ["openfda_round31"]),
            AttributedBullet("VACCINATIONS — keep current before initiation; respiratory infection prevention important in SMA.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Comprehensive SMA care — multidisciplinary (neurology + pulmonology + GI + nutrition + PT/OT + orthopedics + cardiology + psychosocial).", citationIDs: ["specialty_round31"]),
            AttributedBullet("ALTERNATIVES — ONASEMNOGENE (Zolgensma) — SINGLE IV gene therapy in children <2 years SMA1-2 (very expensive ~$2 million); RISDIPLAM (Evrysdi) — daily oral SMN2 splicing modulator; ELAMIPRETIDE clinical trials.", citationIDs: ["specialty_round31"])
        ],
        adverseReactions: AttributedProse(
            "Lower respiratory infection, fever, headache, vomiting, back pain, post-LP headache, thrombocytopenia, renal proteinuria, atelectasis.",
            citationIDs: ["openfda_round31"]
        ),
        drugInteractions: [
            AttributedBullet("Minimal — ASOs not significantly metabolized by CYPs; localized intrathecal effect.", citationIDs: ["openfda_round31"]),
            AttributedBullet("ANTICOAGULANTS — caution for LP procedure; coordinate with hematology + IR.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Combination with risdiplam OR onasemnogene — no established combination protocols; research ongoing.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Live vaccines — keep current pre-treatment.", citationIDs: ["specialty_round31"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive motor assessment (HFMSE, CHOP INTEND, RULM), CBC + platelets, coagulation, urinalysis (protein), nutritional status, pulmonary function (SMA respiratory weakness), ECG, genetic confirmation of SMA + SMN2 copies.", citationIDs: ["specialty_round31"]),
            AttributedBullet("MULTIDISCIPLINARY SMA care team — neurology + pulmonology + nutrition + PT/OT + orthopedics + cardiology + psychosocial + genetic counseling.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Procedural — schedule LP in IR or operating room with experienced team; sedation/anesthesia + airway monitoring + post-procedural recovery.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Pre-procedure — NPO 6-8 hours, IV access, fluoroscopy/ultrasound guidance, sterile technique; post-procedure 1-2 hour recovery, monitor for HA + back pain + neurologic.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Monitoring — motor function q4 months pre-dose; CBC + plt + INR + UA pre-dose; clinical assessment.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Counsel family — lifelong therapy commitment + every 4 month visits; alternative therapies (Zolgensma + risdiplam); insurance coordination + advocacy.", citationIDs: ["specialty_round31"]),
            AttributedBullet("ALTERNATIVES discussion — RISDIPLAM oral daily (less invasive, comparable efficacy) preferred by some families; ONASEMNOGENE single IV gene therapy in <2 years SMA1 (very expensive); informed shared decision making.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Respiratory support — many SMA patients require non-invasive ventilation (NIV) + cough assistance; multidisciplinary pulmonology.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Nutritional support — feeding difficulties in SMA1-2; gastrostomy, enteral feeds.", citationIDs: ["specialty_round31"]),
            AttributedBullet("Cost + insurance — very expensive (~$125K loading + ~$125K/year maintenance); manufacturer support programs.", citationIDs: ["specialty_round31"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats spinal muscular atrophy. You'll get it via spinal tap (lumbar puncture) — 4 loading doses then every 4 months for life. We do this in the hospital with sedation if needed. Tell us about severe headache, back pain, fever, easy bleeding. Continue all your physical therapy, breathing support, nutrition support. Alternative treatments (Zolgensma + Evrysdi) discuss with us.",
            citationIDs: ["openrn_pharm_round31"]
        ),
        citations: [openfdaR31, openrnPharmR31, specialtyR31, ismpR31],
        lastSourceFidelityReview: "2026-05-13"
    )
}
