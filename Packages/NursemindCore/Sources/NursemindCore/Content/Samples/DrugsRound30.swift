import Foundation

// Curator-model drug entries (round 30 — ID depth: HIV/OI antifungals + antiparasitics + advanced antivirals).

private let openfdaR30 = CitationSource(
    id: "openfda_round30",
    shortName: "openFDA Structured Product Labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-05-13"
)
private let openrnPharmR30 = CitationSource(
    id: "openrn_pharm_round30",
    shortName: "Open RN Pharmacology + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-13"
)
private let specialtyR30 = CitationSource(
    id: "specialty_round30",
    shortName: "IDSA + HIVMA + CDC + DHHS guidelines + WHO concept citations",
    publisher: "IDSA · HIVMA · CDC · DHHS · WHO",
    license: .factCitationOnly,
    url: "https://clinicalinfo.hiv.gov/en/guidelines",
    lastRetrieved: "2026-05-13"
)
private let ismpR30 = CitationSource(
    id: "ismp_round30",
    shortName: "ISMP High-Alert Medications 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-13"
)

public enum ItraconazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "itraconazole",
        title: "Itraconazole (Sporanox / Tolsura)",
        subtitle: "Triazole antifungal · endemic mycoses (histo + blasto + coccidio) + sporotrichosis + ABPA · CYP3A4 SUBSTRATE + INHIBITOR · BOXED HF + drug interactions",
        category: "Triazole antifungal — endemic mycoses + ABPA",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Triazole antifungal — inhibits fungal cytochrome P450 14-α-demethylase → blocks ergosterol synthesis"),
            KeyValueRow(key: "Use", value: "Endemic mycoses (histoplasmosis, blastomycosis, coccidioidomycosis); sporotrichosis; aspergillosis (non-invasive); onychomycosis; ABPA"),
            KeyValueRow(key: "Dose", value: "Capsule 200 mg PO daily-BID with food + acidic beverage; oral solution 200 mg daily empty stomach; IV reserved + limited availability"),
            KeyValueRow(key: "Monitor", value: "Drug levels (target trough >1 mcg/mL), LFTs monthly, CHF signs, drug interactions"),
            KeyValueRow(key: "Watch", value: "BOXED CHF (negative inotrope); HEPATOTOXICITY; massive CYP3A4 drug interactions; ABSORPTION variable (cap vs solution); preferred IV alternatives (voriconazole, isavuconazole)")
        ],
        indications: AttributedProse(
            "Endemic mycoses — histoplasmosis (mild-moderate), blastomycosis (non-CNS), coccidioidomycosis (non-meningeal). Sporotrichosis cutaneous + lymphocutaneous. Onychomycosis. Allergic bronchopulmonary aspergillosis (ABPA) adjunct. Less first-line for invasive aspergillosis (voriconazole + isavuconazole superior) per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Triazole antifungal — inhibits fungal CYP-dependent 14-α-demethylase enzyme → blocks lanosterol-to-ergosterol conversion → ergosterol depletion + membrane disruption + abnormal sterol accumulation → fungal cell death + growth inhibition. Triazole > imidazole selectivity for fungal vs mammalian P450.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Capsule (variable absorption)", body: "200 mg PO daily-BID with FOOD + ACIDIC beverage (cola) to optimize absorption; loading 200 mg PO TID × 3 days for severe; max 400-600 mg/day depending on indication per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Oral solution (cyclodextrin)", body: "200 mg PO daily on EMPTY stomach; better absorption than capsule; tastes bad; alternative when capsule absorption suboptimal.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "IV", body: "Limited availability; 200 mg IV BID × 4 doses then 200 mg IV daily; reserve for severe + intolerant oral.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Hepatic / renal", body: "Severe hepatic — avoid; renal — no specific adjustment for capsule; oral solution + IV contain cyclodextrin (accumulates in renal impairment).", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Drug levels", body: "Trough level target >1 mcg/mL for therapeutic efficacy; check after 2 weeks of stable dose; adjust based on response.", citationIDs: ["specialty_round30"])
        ],
        contraindications: AttributedProse(
            "Heart failure (relative — boxed); pregnancy (Category C/D — teratogenic); coadministration with QT-prolonging drugs metabolized by CYP3A4 (cisapride, pimozide, quinidine, dofetilide); ergot alkaloids; lovastatin / simvastatin; midazolam (oral); triazolam.",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("BOXED — CONGESTIVE HEART FAILURE; negative inotropic effect; AVOID in CHF history; counsel + monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HEPATOTOXICITY — LFT elevation common; rare fulminant; monthly LFTs initially → q3 months.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MASSIVE CYP3A4 DRUG INTERACTIONS — strong inhibitor + substrate; check medications carefully; common dangerous combinations with statins + CCBs + immunosuppressants + DOACs.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ABSORPTION VARIABLE — capsule requires acid (food + cola); PPI / H2 blocker / antacid significantly reduce; oral solution better but bad taste.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CYCLODEXTRIN ACCUMULATION (IV + oral solution) in renal impairment — avoid CrCl <30 if possible.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PERIPHERAL NEUROPATHY — uncommon with prolonged use.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ADRENAL INSUFFICIENCY — high-dose long-term suppresses cortisol synthesis (similar to ketoconazole but less).", citationIDs: ["openfda_round30"]),
            AttributedBullet("PREGNANCY — teratogen; reliable contraception; avoid pregnancy × 2 months after; lactation acceptable.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea, abdominal pain, headache, rash, edema, hypokalemia, hepatic enzyme elevation, hypertension, dizziness, fatigue, neuropathy (prolonged).",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITOR — increases levels of CYP3A4 substrates significantly: statins (avoid lovastatin/simvastatin), CCBs (felodipine, amlodipine, nifedipine), DOACs (apixaban, rivaroxaban — reduce dose), opioids (fentanyl, oxycodone), benzodiazepines (midazolam, triazolam — avoid), immunosuppressants (cyclosporine, tacrolimus, sirolimus — reduce dose), eplerenone (avoid), digoxin (increase levels).", citationIDs: ["openfda_round30"]),
            AttributedBullet("CONTRAINDICATED — QT-prolonging drugs metabolized by CYP3A4 (cisapride, pimozide, quinidine, dofetilide), ergot alkaloids, lovastatin/simvastatin, midazolam (oral), triazolam.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ANTACIDS, PPIs, H2 BLOCKERS — reduce capsule absorption significantly; separate by 2 hours OR use oral solution.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CYP3A4 INDUCERS (rifampin, carbamazepine, phenytoin, phenobarbital, St. John's wort) — significantly reduce itraconazole levels; avoid concurrent.", citationIDs: ["openfda_round30"]),
            AttributedBullet("WARFARIN — increased anticoagulation; monitor INR.", citationIDs: ["openfda_round30"]),
            AttributedBullet("OPIOIDS, MUSCLE RELAXANTS — increased CNS effects.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — LFTs, ECG (QTc), CHF history, medications + comprehensive interaction screen, pregnancy test.", citationIDs: ["specialty_round30"]),
            AttributedBullet("CAPSULE — give WITH FOOD + ACIDIC BEVERAGE (cola, orange juice); avoid PPI/H2/antacid 2 hours before+after.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ORAL SOLUTION — EMPTY stomach; rinse mouth after; significantly better absorption than capsule.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Drug levels (trough >1 mcg/mL therapeutic) — q2 weeks initially → less often when stable.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Monitoring — LFTs monthly initially → q3 months; CHF signs daily; ECG for QTc with prolonging drugs.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Drug interaction REVIEW essential at EVERY visit; pharmacist consultation.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — REPORT shortness of breath, edema, severe weight gain (CHF); yellow eyes/skin, dark urine, abdominal pain (hepatotoxicity); irregular heartbeat (QTc).", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("Pregnancy avoidance — 2 months after last dose; reliable contraception.", citationIDs: ["openfda_round30"])
        ],
        patientTeaching: AttributedProse(
            "This antifungal treats endemic fungal infections. Take CAPSULE with food + acidic drink (cola); take ORAL SOLUTION empty stomach. Tell us about ALL medications + supplements — many drug interactions. Watch for swelling, breathlessness, yellow eyes/skin, irregular heartbeat. Bloodwork monthly initially. Avoid pregnancy 2 months after stopping.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IsavuconazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "isavuconazole",
        title: "Isavuconazole (Cresemba)",
        subtitle: "Newer triazole · invasive aspergillosis + MUCORMYCOSIS (only oral) · IV/PO interchangeable · less hepatotoxic + better tolerated than voriconazole · NO QTc prolongation",
        category: "Triazole antifungal — invasive aspergillosis + mucormycosis",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Triazole antifungal — fungal CYP14-α-demethylase inhibitor; isavuconazonium sulfate is water-soluble prodrug"),
            KeyValueRow(key: "Use", value: "Invasive aspergillosis (1st-line alternative to voriconazole); INVASIVE MUCORMYCOSIS (only oral azole approved + recommended); breakthrough infections"),
            KeyValueRow(key: "Dose", value: "200 mg PO/IV q8 hours × 6 doses (loading) → 200 mg PO/IV daily; PO + IV bioequivalent (interchangeable)"),
            KeyValueRow(key: "Monitor", value: "LFTs, drug interactions, infusion reactions, electrolytes"),
            KeyValueRow(key: "Watch", value: "Hepatotoxicity (less than voriconazole + itraconazole); QTc SHORTENING (unique among azoles); drug interactions (CYP3A4 substrate + inhibitor); pregnancy")
        ],
        indications: AttributedProse(
            "Invasive aspergillosis (1st-line alternative to voriconazole; preferred in some scenarios — less hepatotoxicity, predictable PK). INVASIVE MUCORMYCOSIS — only oral azole FDA-approved + IDSA-recommended; alternative to amphotericin B. Breakthrough infections on other azoles. Renal-friendly (no cyclodextrin) per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Isavuconazonium sulfate water-soluble prodrug → activated to ISAVUCONAZOLE by serum esterases. Triazole — inhibits fungal CYP-dependent 14-α-demethylase → blocks ergosterol synthesis. Broad spectrum — Aspergillus, Mucorales (Rhizopus, Mucor, Lichtheimia), Candida (including non-albicans), endemic mycoses.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Loading", body: "200 mg (= 372 mg isavuconazonium sulfate) PO/IV every 8 hours × 6 doses (48 hours) per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Maintenance", body: "200 mg PO/IV ONCE daily; PO + IV bioequivalent (interchangeable); take consistently +/- food.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Renal", body: "No adjustment for any degree of renal impairment (no cyclodextrin); HD friendly.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Hepatic", body: "Mild-moderate (Child-Pugh A-B) — no adjustment; severe (C) — use with caution.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Duration", body: "Variable based on disease + immune recovery; typically 6-12 weeks aspergillosis + lifelong suppression for refractory; mucormycosis often weeks-months + surgical resection.", citationIDs: ["specialty_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to isavuconazole or isavuconazonium; FAMILIAL SHORT QT SYNDROME (unique QTc shortening effect); concomitant strong CYP3A4 inducers (rifampin, ritonavir, St. John's wort); strong inhibitors (high-dose ketoconazole).",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — LFT elevations possible (less than voriconazole + itraconazole); baseline + periodic LFTs.", citationIDs: ["openfda_round30"]),
            AttributedBullet("QTc SHORTENING — unique among azoles; contraindicated in FAMILIAL SHORT QT SYNDROME; ECG baseline.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HYPERSENSITIVITY + INFUSION REACTIONS — uncommon; slow infusion if reactions; corticosteroid premedication possible.", citationIDs: ["openfda_round30"]),
            AttributedBullet("EMBRYO-FETAL TOXICITY — Category C; teratogen; avoid pregnancy + reliable contraception × 28 days after.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DRUG INTERACTIONS — CYP3A4 substrate + moderate inhibitor; significantly fewer + milder vs voriconazole.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Therapeutic drug monitoring — NOT routinely required (predictable PK); reserve for severe / breakthrough.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Adverse effects — less common than voriconazole (no visual disturbances, less hepatotoxicity, less photosensitivity).", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, diarrhea, headache, ALT/AST elevation, peripheral edema, hypokalemia, fatigue, infusion site reactions; less common than voriconazole.",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INDUCERS — contraindicated (rifampin, carbamazepine, phenytoin, St. John's wort, ritonavir long-term); significantly reduce isavuconazole.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INHIBITORS — significantly increase isavuconazole; high-dose ketoconazole contraindicated.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MODERATE CYP3A4 INHIBITOR effect — increases levels of substrate drugs (statins, CCBs, opioids, immunosuppressants, DOACs) but less than itraconazole / voriconazole; monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CYCLOSPORINE / TACROLIMUS / SIROLIMUS — increase levels; monitor + reduce dose.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DIGOXIN — increased levels.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MIDAZOLAM, lopinavir-ritonavir, OCs — increased; alternative timing or dose adjustment.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Generally MORE compatible with other drugs than voriconazole + itraconazole.", citationIDs: ["specialty_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — LFTs, ECG (QTc — short QT contraindication), pregnancy test, medications.", citationIDs: ["specialty_round30"]),
            AttributedBullet("PO + IV BIOEQUIVALENT — interchangeable; switch as clinically appropriate; smoothly transition.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Take with or without food — consistent timing.", citationIDs: ["openfda_round30"]),
            AttributedBullet("LFTs at baseline + monthly initially → q3 months; ECG if QT concerns; CHO if needed.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Drug interactions LESS than voriconazole / itraconazole but still significant; pharmacist review.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — REPORT yellow eyes/skin, dark urine, severe nausea/vomiting; pregnancy planning.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("MUCORMYCOSIS - aggressive disease; combine with SURGICAL DEBRIDEMENT + amphotericin B initial + transition to isavuconazole; lipid amphotericin preferred for systemic toxicity reduction.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Compared to voriconazole — less hepatotoxic, no visual disturbances, no photosensitivity, predictable PK without TDM, less drug interactions; emerging first-line.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This antifungal treats serious fungal infections. Take consistently — pill or IV are interchangeable. Get bloodwork to check liver. Tell us about all medications. Tell us if pregnant or planning. Watch for yellow eyes/skin, severe nausea, irregular heartbeat. Continue until your immune system + infection recover.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ValganciclovirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "valganciclovir",
        title: "Valganciclovir (Valcyte)",
        subtitle: "Oral ganciclovir prodrug · CMV treatment + prevention in immunocompromised · BONE MARROW SUPPRESSION + TERATOGEN + CARCINOGEN · CBC weekly",
        category: "Anti-CMV antiviral (nucleoside analog) — transplant + AIDS CMV",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Oral L-valyl ester prodrug of ganciclovir; nucleoside analog; inhibits viral DNA polymerase"),
            KeyValueRow(key: "Use", value: "CMV retinitis in AIDS (treatment + chronic maintenance); CMV prevention + treatment in solid organ + stem cell transplant; congenital CMV (off-label)"),
            KeyValueRow(key: "Dose", value: "Induction: 900 mg PO BID × 21 days (with food); maintenance: 900 mg PO daily; CMV prophylaxis transplant: 900 mg PO daily × 100-200 days post-transplant; renal adjustment"),
            KeyValueRow(key: "Monitor", value: "CBC + diff WEEKLY × 6 weeks → biweekly → monthly (cytopenias); CMV viral load; renal function; LFTs"),
            KeyValueRow(key: "Watch", value: "BOXED — bone marrow suppression (neutropenia + anemia + thrombocytopenia); CARCINOGENICITY (animal); TERATOGENICITY (animal); fertility impairment; immunocompromise + infection risk")
        ],
        indications: AttributedProse(
            "CMV retinitis treatment (induction) + chronic suppression in AIDS patients; CMV prevention in solid organ + hematopoietic stem cell transplant (high-risk D+/R-); CMV disease treatment in transplant; congenital CMV (off-label per AAP) — improves hearing + neurodevelopmental outcomes per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "L-valyl ester prodrug of ganciclovir — rapidly hydrolyzed by intestinal + hepatic esterases to active ganciclovir → phosphorylated by viral UL97 kinase (cell entry concentrate) to triphosphate → competitively inhibits viral DNA polymerase + incorporates into viral DNA → chain termination. Selective for CMV-infected cells.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "CMV retinitis induction", body: "900 mg PO BID with food × 21 days; reduce if neutropenia <500 + restart when recovered per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "CMV retinitis maintenance", body: "900 mg PO daily; lifelong unless ART restores immunity (CD4 >100 × 6 months).", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Transplant prophylaxis", body: "900 mg PO daily × 100-200 days post-transplant; CMV D+/R- highest risk solid organ; longer for stem cell.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "CMV treatment transplant", body: "900 mg PO BID × 21+ days; transition to maintenance based on viral load + clinical.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Renal", body: "CrCl 40-59 — 450 mg PO BID induction → 450 mg PO daily maintenance; CrCl 25-39 — 450 mg PO daily induction → 450 mg PO q2 days maintenance; CrCl 10-24 — 450 mg PO q2 days induction → 450 mg PO TID per week maintenance; severe CrCl <10 — IV ganciclovir preferred + dose-adjusted.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pediatric / congenital CMV", body: "Weight-based; 16 mg/kg PO BID × 6 months; significant adverse effects monitoring.", citationIDs: ["specialty_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to valganciclovir, ganciclovir, acyclovir; pregnancy (Category C — teratogenic in animals); breastfeeding; absolute neutrophil count <500/μL; platelet count <25,000/μL; hemoglobin <8 g/dL.",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("BOXED — MYELOSUPPRESSION (neutropenia ~24%, thrombocytopenia ~18%, anemia ~9%); CBC + DIFF weekly × 6 weeks → biweekly → monthly; reduce dose if ANC <500.", citationIDs: ["openfda_round30"]),
            AttributedBullet("BOXED — CARCINOGENICITY + TERATOGENICITY + spermatogenesis impairment in animals; reliable contraception during + ≥3 months men, ≥30 days women after.", citationIDs: ["openfda_round30"]),
            AttributedBullet("INFERTILITY — males + females; consider sperm/egg banking pre-treatment; reversible vs permanent varies.", citationIDs: ["openfda_round30"]),
            AttributedBullet("RENAL — dose-adjust + hydration; AKI possible.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ACUTE RENAL FAILURE — uncommon; monitor BUN/Cr.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CNS — seizures, confusion, psychosis, retinal detachment from CMV; counsel.", citationIDs: ["openfda_round30"]),
            AttributedBullet("IMMUNOCOMPROMISE — bacterial + fungal + other viral co-infections; consider trimethoprim-sulfa, fluconazole prophylaxis.", citationIDs: ["specialty_round30"]),
            AttributedBullet("GANCICLOVIR RESISTANCE — UL97 mutations in chronic suppression; foscarnet + cidofovir alternatives.", citationIDs: ["specialty_round30"]),
            AttributedBullet("DRUG INTERACTIONS — additive myelosuppression with chemotherapy, zidovudine; nephrotoxic drugs; probenecid (increases ganciclovir levels).", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, fever, neutropenia, anemia, thrombocytopenia, nausea, vomiting, abdominal pain, headache, fatigue, retinal detachment, peripheral neuropathy.",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER MYELOSUPPRESSIVE — chemotherapy, zidovudine, AZT, hydroxyurea — additive cytopenias; avoid OR adjust.", citationIDs: ["openfda_round30"]),
            AttributedBullet("NEPHROTOXIC — aminoglycosides, amphotericin B, cyclosporine, tacrolimus, NSAIDs — additive renal toxicity.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PROBENECID — reduces ganciclovir renal clearance; increased levels; monitor for toxicity.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DDI (didanosine) — reduces valganciclovir levels; consider alternative ART.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MYCOPHENOLATE — additive cytopenias.", citationIDs: ["openfda_round30"]),
            AttributedBullet("LIVE VACCINES — avoid in immunocompromised.", citationIDs: ["specialty_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + diff + creatinine + LFTs + pregnancy test; CMV viral load + serology; CD4 if HIV.", citationIDs: ["specialty_round30"]),
            AttributedBullet("CBC + DIFF WEEKLY × 6 weeks → BIWEEKLY × 4 weeks → MONTHLY; HOLD if ANC <500, plt <25K, Hgb <8.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CMV viral load q2 weeks during induction → monthly maintenance; clinical + ophthalmology for retinitis.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Renal function — Cr q1-2 weeks initially → monthly; dose adjust as CrCl changes.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HAZARDOUS DRUG handling — gloves; spills + crushed tablets are hazardous; don't break / crush.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Take with FOOD to improve absorption.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Counsel — REPORT fever, easy bruising, signs of infection (cytopenias); contraception; potential infertility + sperm/egg banking discussion pre-treatment.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("HIV with CMV retinitis — start ART for immune restoration; CD4 >100 × 6 months → consider discontinuation of CMV suppression.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Pre-emptive transplant strategy — CMV viral load surveillance + valganciclovir initiation when positive.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Resistance — if breakthrough on valganciclovir → foscarnet OR cidofovir; genotypic resistance testing.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This medicine prevents + treats CMV infection. Take with food twice daily during induction, then once daily. Tell us about all medications + supplements. Watch for fever, easy bruising, infections (low blood counts), severe nausea, yellow eyes/skin. Use reliable birth control + may affect fertility — talk to us before starting if planning pregnancy. Get bloodwork frequently.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AtovaquoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "atovaquone",
        title: "Atovaquone (Mepron + Malarone)",
        subtitle: "PCP prophylaxis + treatment · alternative to TMP-SMX (sulfa allergy + intolerance) · malaria (Malarone with proguanil) · GI side effects · oral suspension",
        category: "Anti-PCP + antimalarial — alternative when sulfa contraindicated",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Hydroxynaphthoquinone — inhibits mitochondrial electron transport (cytochrome bc1 complex) → blocks pyrimidine synthesis in protozoa"),
            KeyValueRow(key: "Use", value: "Pneumocystis pneumonia (PCP / PJP) — prophylaxis + treatment in AIDS, transplant, immunocompromised (alternative to TMP-SMX in sulfa allergy / intolerance); Malarone (atovaquone-proguanil) for malaria prophylaxis + treatment"),
            KeyValueRow(key: "Dose", value: "PCP prophylaxis: 1500 mg PO daily WITH FATTY FOOD; PCP treatment mild-moderate: 750 mg PO BID with food; Malarone (250/100) for malaria: 4 tablets PO daily × 3 days treatment OR 1 tablet PO daily prophylaxis (1-2 days before exposure × 7 days post-exposure)"),
            KeyValueRow(key: "Monitor", value: "Clinical response, LFTs, electrolytes"),
            KeyValueRow(key: "Watch", value: "TAKE WITH FATTY FOOD (variable absorption); GI side effects; rifampin/rifabutin/tetracycline reduce levels; alternative for sulfa-allergic")
        ],
        indications: AttributedProse(
            "PCP prophylaxis + mild-moderate treatment when TMP-SMX contraindicated (sulfa allergy + intolerance, G6PD deficiency). Malarone (atovaquone + proguanil) for malaria treatment + prophylaxis (CDC-recommended for non-resistant P. falciparum + travelers) per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Hydroxynaphthoquinone — inhibits mitochondrial electron transport at cytochrome bc1 complex (complex III) → disrupts pyrimidine biosynthesis in P. carinii (jirovecii) + Plasmodium + Toxoplasma + Babesia. Proguanil (Malarone partner) — inhibits dihydrofolate reductase → synergistic antimalarial.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "PCP prophylaxis", body: "1500 mg (10 mL of 750 mg/5 mL suspension) PO ONCE daily WITH FATTY FOOD per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "PCP treatment (mild-moderate)", body: "750 mg PO BID × 21 days with FATTY FOOD; severe PCP requires IV TMP-SMX or IV pentamidine.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Malaria treatment (Malarone)", body: "4 tablets (1000 mg atovaquone + 400 mg proguanil) PO daily × 3 days with food/milk per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Malaria prophylaxis (Malarone)", body: "1 tablet (250 mg atovaquone + 100 mg proguanil) PO daily — start 1-2 days BEFORE travel + DURING + 7 days AFTER returning.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pediatric", body: "Weight-based dosing; oral suspension for younger; consult.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe — caution; limited data; no specific adjustment.", citationIDs: ["openfda_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to atovaquone; severe renal impairment (Malarone proguanil component); pregnancy (Category C — limited data); breastfeeding.",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("VARIABLE ABSORPTION — TAKE WITH FATTY MEAL; bioavailability ~25% on empty stomach, ~50-60% with fat; cottage cheese + milk + cheese + nuts + fatty meal.", citationIDs: ["openfda_round30"]),
            AttributedBullet("GI SIDE EFFECTS — diarrhea, nausea, vomiting, abdominal pain — common; usually transient.", citationIDs: ["openfda_round30"]),
            AttributedBullet("RASH — can be severe; counsel + discontinue if Stevens-Johnson features.", citationIDs: ["openfda_round30"]),
            AttributedBullet("LFTs — elevations; monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PCP severe disease — atovaquone is NOT recommended; use IV TMP-SMX + steroids OR IV pentamidine.", citationIDs: ["specialty_round30"]),
            AttributedBullet("MALARIA — atovaquone-proguanil for non-resistant; chloroquine-resistant areas; CDC region-specific recommendations.", citationIDs: ["specialty_round30"]),
            AttributedBullet("PREGNANCY — Category C; limited data; risk-benefit; mefloquine (pregnancy A) preferred for some malaria scenarios.", citationIDs: ["openfda_round30"]),
            AttributedBullet("BREASTFEEDING — limited data; risk-benefit.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, vomiting, abdominal pain, headache, rash, fever, dyspepsia, anorexia, hepatic enzyme elevation, dizziness, insomnia.",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("RIFAMPIN, RIFABUTIN — significantly REDUCE atovaquone levels (~50%); avoid OR alternative atovaquone OR alternative TB regimen.", citationIDs: ["openfda_round30"]),
            AttributedBullet("TETRACYCLINES — reduce atovaquone levels.", citationIDs: ["openfda_round30"]),
            AttributedBullet("METOCLOPRAMIDE — reduces atovaquone.", citationIDs: ["openfda_round30"]),
            AttributedBullet("WARFARIN — increased anticoagulation; monitor INR.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ZIDOVUDINE (AZT) — atovaquone increases AZT levels; monitor for AZT toxicity.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DIDANOSINE — atovaquone reduces ddI levels.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — LFTs, comprehensive medications, allergies (sulfa intolerance documentation), comprehensive infection workup.", citationIDs: ["specialty_round30"]),
            AttributedBullet("TAKE WITH FATTY FOOD — counsel patients on fat content (cottage cheese, milk, nuts, peanut butter, avocado, cheese, fatty meal); critical for absorption.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Oral suspension — shake well + measure carefully; bitter taste; can mix with food.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Counsel — REPORT severe diarrhea, rash, jaundice; expected GI symptoms transient.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("MALARIA prophylaxis — 1-2 days before + during + 7 days after return; counsel on mosquito avoidance + travel medicine.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Drug interactions — rifampin/rifabutin (TB) significantly reduce atovaquone; ID specialist consultation if both needed.", citationIDs: ["specialty_round30"]),
            AttributedBullet("PCP severity — atovaquone for mild-moderate ONLY; severe (PaO2 <70 on room air) → IV TMP-SMX + steroids OR IV pentamidine.", citationIDs: ["specialty_round30"]),
            AttributedBullet("HIV+ PCP — start ART after PCP treatment initiated (within 2 weeks) for immune reconstitution; primary prophylaxis can be discontinued when CD4 >200 × 3 months on ART.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This medicine prevents or treats pneumocystis pneumonia + malaria. ALWAYS take with FATTY food — cottage cheese, milk, nuts, cheese — for proper absorption. Suspension tastes bad; shake well. Tell us about ALL medications — interactions can reduce effect. Watch for severe diarrhea, rash, yellow eyes/skin. For malaria — start 1-2 days before travel + continue 7 days after returning.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DapsoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dapsone",
        title: "Dapsone",
        subtitle: "Sulfone · PCP prophylaxis (alt to TMP-SMX) + dermatologic + leprosy · G6PD SCREEN MANDATORY · METHEMOGLOBINEMIA + hemolysis · slow oral absorption",
        category: "Sulfone antibacterial — PCP prophylaxis + leprosy + dermatitis herpetiformis",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Sulfone antibacterial — competitive PABA antagonist + folate synthesis inhibition; bacteriostatic + bactericidal vs Mycobacterium leprae"),
            KeyValueRow(key: "Use", value: "PCP prophylaxis (alternative to TMP-SMX when sulfa-intolerant); leprosy (multidrug regimen); dermatitis herpetiformis; toxoplasmosis prophylaxis (with pyrimethamine)"),
            KeyValueRow(key: "Dose", value: "PCP prophylaxis: 100 mg PO daily; leprosy multidrug regimen: 100 mg PO daily; dermatitis herpetiformis: 50-300 mg PO daily; toxoplasmosis prophylaxis: 50 mg PO daily + pyrimethamine + leucovorin"),
            KeyValueRow(key: "Monitor", value: "G6PD SCREEN BEFORE START (mandatory); CBC weekly × 1 month → monthly; LFTs; methemoglobin level if symptomatic"),
            KeyValueRow(key: "Watch", value: "G6PD DEFICIENCY — HEMOLYTIC ANEMIA; METHEMOGLOBINEMIA — cyanosis + hypoxia; agranulocytosis; SULFONE SYNDROME (DRESS-like); peripheral neuropathy")
        ],
        indications: AttributedProse(
            "PCP prophylaxis in HIV/AIDS + transplant + immunocompromised — alternative to TMP-SMX when sulfa-intolerant. Leprosy (multidrug regimen with rifampin + clofazimine). Dermatitis herpetiformis (gluten-related skin disease). Toxoplasmosis prophylaxis (with pyrimethamine + leucovorin). Refractory acne, autoimmune skin diseases (off-label) per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Sulfone antibacterial — competitive PABA (para-aminobenzoic acid) antagonist; inhibits dihydropteroate synthetase → blocks bacterial folate synthesis. Bacteriostatic against many organisms, bactericidal against Mycobacterium leprae. Anti-inflammatory + neutrophil chemotaxis inhibition (dermatitis herpetiformis effects). Hemolytic + methemoglobin-inducing in G6PD-deficient + susceptible.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "PCP prophylaxis", body: "100 mg PO ONCE daily per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Leprosy (multidrug regimen)", body: "100 mg PO daily × 6 months (paucibacillary) OR × 12-24 months (multibacillary) — WITH rifampin + clofazimine per WHO.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Dermatitis herpetiformis", body: "Initial 50 mg PO daily; titrate based on response + tolerability up to 300 mg/day per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Toxoplasmosis prophylaxis (with pyrimethamine + leucovorin)", body: "50 mg PO daily + pyrimethamine 50 mg weekly + leucovorin 25 mg weekly; CD4 <100.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe — caution; no specific adjustment; consider lower dose.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pediatric", body: "Weight-based; consult pediatric ID.", citationIDs: ["openfda_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to dapsone or sulfones; severe G6PD deficiency (relative); severe hepatic / renal impairment; methemoglobinemia history; sulfa allergy (cross-reactivity controversial — generally less than sulfonamides but caution).",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("BOXED — HEMOLYSIS in G6PD-deficient + others; mandatory G6PD screen before start; African + Mediterranean + Asian ethnicities higher risk.", citationIDs: ["openfda_round30"]),
            AttributedBullet("METHEMOGLOBINEMIA — bluish-gray skin (cyanosis), dyspnea, fatigue, low SpO2 with normal PaO2; methylene blue 1-2 mg/kg IV antidote (CAUTION — methylene blue can worsen hemolysis in G6PD).", citationIDs: ["openfda_round30"]),
            AttributedBullet("AGRANULOCYTOSIS + neutropenia — weekly CBC × 1 month → monthly; STOP if signs.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DAPSONE / SULFONE SYNDROME (DRESS-like) — fever, rash, hepatitis, eosinophilia, lymphadenopathy; 2-6 weeks after starting; STOP + steroids.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HEPATOTOXICITY + hepatitis — LFTs monthly initially.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PERIPHERAL NEUROPATHY — chronic high-dose; reversible usually.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HYPERSENSITIVITY syndrome — Stevens-Johnson, TEN; STOP + supportive care.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PREGNANCY — Category C; risk-benefit; leprosy continuation; PCP prophylaxis alternatives.", citationIDs: ["openfda_round30"]),
            AttributedBullet("BREASTFEEDING — caution; can cause hemolysis in infant; G6PD screen infant.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Hemolytic anemia, methemoglobinemia, agranulocytosis, hepatic enzyme elevation, peripheral neuropathy, rash, headache, nausea, vomiting, sulfone syndrome (DRESS-like).",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("RIFAMPIN — induces dapsone metabolism; may need higher dapsone dose.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PYRIMETHAMINE — additive hematologic toxicity; CBC monitoring.", citationIDs: ["openfda_round30"]),
            AttributedBullet("TRIMETHOPRIM — additive methemoglobinemia + hematologic toxicity.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ZIDOVUDINE (AZT) — additive bone marrow suppression.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PROBENECID — increases dapsone levels.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Drugs causing methemoglobinemia (NITRATES, BENZOCAINE, LIDOCAINE, PHENAZOPYRIDINE) — additive.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("MANDATORY G6PD screen BEFORE starting; severe deficiency contraindication; partial deficiency caution + lower dose.", citationIDs: ["specialty_round30"]),
            AttributedBullet("BASELINE — CBC + diff, methemoglobin level, LFTs, BUN/Cr, comprehensive medications, allergies.", citationIDs: ["specialty_round30"]),
            AttributedBullet("CBC + diff WEEKLY × 1 month → MONTHLY × 6 months → q6 months; LFTs monthly initially → q3 months.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — REPORT severe weakness, breathlessness, blue/gray lips or skin (methemoglobinemia + hemolysis); fever, rash, sore throat (sulfone syndrome / agranulocytosis); yellow eyes/skin; numbness/tingling extremities.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("Methylene blue IV antidote for methemoglobinemia — CAUTION in G6PD deficient (can worsen hemolysis); ascorbic acid alternative.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PCP prophylaxis — alternative when TMP-SMX contraindicated; primary prophylaxis discontinuable CD4 >200 × 3 months on ART.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Sulfa allergy — controversial cross-reactivity; less common than sulfonamides but caution + observation.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Pregnancy + breastfeeding — risk-benefit; coordinate ID + OB.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This medicine prevents pneumocystis pneumonia + treats leprosy + some skin conditions. CRITICAL — get the G6PD blood test FIRST. Call us right away for: blue/gray lips or skin, severe weakness/breathlessness, fever + sore throat + rash, yellow eyes/skin, numbness in hands/feet. Frequent bloodwork. Take consistently.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PentamidineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pentamidine",
        title: "Pentamidine (Pentam + NebuPent)",
        subtitle: "Aromatic diamidine · PCP treatment + prophylaxis · IV severe PCP + AEROSOLIZED prophylaxis · severe hypoglycemia + hyperglycemia + hypotension + pancreatitis · QT prolongation",
        category: "Antiprotozoal — PCP severe + leishmaniasis + trypanosomiasis",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aromatic diamidine — binds AT-rich DNA + disrupts protozoal kinetoplasts"),
            KeyValueRow(key: "Use", value: "PCP severe (IV alternative to TMP-SMX); PCP prophylaxis (aerosolized); leishmaniasis; trypanosomiasis (African sleeping sickness); babesiosis"),
            KeyValueRow(key: "Dose", value: "PCP treatment IV: 4 mg/kg IV daily × 14-21 days; PCP prophylaxis aerosolized: 300 mg via Respirgard II nebulizer q4 weeks"),
            KeyValueRow(key: "Monitor", value: "BP + ECG + glucose + electrolytes during IV infusion; pancreas amylase/lipase; CBC + LFTs + Cr regularly"),
            KeyValueRow(key: "Watch", value: "SEVERE HYPOTENSION (orthostatic during infusion); HYPOGLYCEMIA + HYPERGLYCEMIA (beta cell toxicity); QT prolongation + arrhythmias; PANCREATITIS; nephrotoxicity")
        ],
        indications: AttributedProse(
            "PCP pneumonia treatment (IV — when TMP-SMX intolerant or refractory) + PCP prophylaxis (aerosolized — alternative when oral TMP-SMX/dapsone/atovaquone not tolerated). Leishmaniasis (visceral + cutaneous). African trypanosomiasis (early stage). Babesiosis severe. Limited use due to toxicity per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Aromatic diamidine — binds AT-rich DNA in protozoa + disrupts kinetoplast DNA + inhibits topoisomerase II + interferes with folate synthesis + interferes with mitochondrial function. Selective uptake by protozoa (P. carinii, Leishmania, Trypanosoma, Babesia). Toxic to mammalian cells at concentrations affecting beta cells (insulin release), heart (QT), pancreas, kidney.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "PCP treatment IV", body: "4 mg/kg IV ONCE daily over 60-120 minutes × 14-21 days per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "PCP prophylaxis aerosolized", body: "300 mg via Respirgard II nebulizer monthly (q4 weeks); 5-10 mL sterile water diluent.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Leishmaniasis", body: "Visceral 3 mg/kg IV q2 days × 5-25 doses depending on response; cutaneous 2-3 mg/kg IM/IV q2 days × 4-7 doses.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "African trypanosomiasis", body: "4 mg/kg IM daily × 7 days (early stage).", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Renal", body: "CrCl <50 — extend interval to q48 hours; severe — risk-benefit + lower dose.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Hepatic", body: "Severe — caution; no specific adjustment.", citationIDs: ["openfda_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to pentamidine; pregnancy (Category C); severe renal / hepatic impairment (relative).",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("SEVERE HYPOTENSION — orthostatic + severe during IV infusion; infuse over 60-120 min; patient supine; pre-infusion + frequent BP monitoring.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HYPOGLYCEMIA — beta cell stimulation early + necrosis later → HYPOGLYCEMIA initially → HYPERGLYCEMIA + diabetes; monitor glucose pre-infusion + q1-2 hours during + post; sometimes severe + persistent.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PANCREATITIS — uncommon but serious; amylase/lipase monitoring.", citationIDs: ["openfda_round30"]),
            AttributedBullet("QT PROLONGATION — torsades de pointes possible; baseline ECG + electrolytes (correct hypokalemia + hypomagnesemia); avoid QT-prolonging drugs.", citationIDs: ["openfda_round30"]),
            AttributedBullet("NEPHROTOXICITY — Cr elevation; AKI possible; monitor + hydration.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CARDIAC arrhythmias — telemetry during IV infusion.", citationIDs: ["openfda_round30"]),
            AttributedBullet("BONE MARROW SUPPRESSION — leukopenia, thrombocytopenia, anemia.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HEPATOTOXICITY — LFT elevation; monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ELECTROLYTES — hypocalcemia, hypomagnesemia, hyperkalemia possible.", citationIDs: ["openfda_round30"]),
            AttributedBullet("AEROSOLIZED — local airway effects (bronchospasm, cough); bronchodilator pre-treatment helpful; minimal systemic absorption.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Hypotension, hypoglycemia, hyperglycemia, diabetes mellitus, pancreatitis, nephrotoxicity, QT prolongation, arrhythmias, cytopenias, hepatic enzyme elevation, sterile abscess at IM site, bronchospasm (aerosolized).",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("QT-PROLONGING DRUGS — fluoroquinolones, macrolides, antipsychotics, antiarrhythmics, methadone — additive QT risk.", citationIDs: ["openfda_round30"]),
            AttributedBullet("NEPHROTOXIC DRUGS — aminoglycosides, amphotericin B, NSAIDs — additive renal toxicity.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HYPOGLYCEMIC AGENTS — additive hypoglycemia; monitor + adjust.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ANTI-HYPERTENSIVES — additive hypotension.", citationIDs: ["openfda_round30"]),
            AttributedBullet("BONE MARROW SUPPRESSANTS — additive.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — BP supine + standing, ECG (QTc), glucose, electrolytes (K, Mg, Ca), CBC, LFTs, Cr, amylase/lipase, pregnancy test.", citationIDs: ["specialty_round30"]),
            AttributedBullet("IV INFUSION SAFETY — patient SUPINE; slow infusion 60-120 minutes; continuous BP + ECG monitoring; immediate access; intervene at first signs of hypotension/arrhythmia.", citationIDs: ["openfda_round30"]),
            AttributedBullet("GLUCOSE — q1-2 hours during infusion + q4-6 hours after; treat hypoglycemia AGGRESSIVELY; may need long-acting glucose monitoring (chronic hyperglycemia + diabetes possible after).", citationIDs: ["openfda_round30"]),
            AttributedBullet("Daily monitoring during IV course — CBC, electrolytes, BUN/Cr, glucose, amylase/lipase, LFTs.", citationIDs: ["specialty_round30"]),
            AttributedBullet("AEROSOLIZED administration — special Respirgard II nebulizer; bronchodilator (albuterol) pre-treatment helpful; cough + bronchospasm common.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HEALTHCARE worker exposure — aerosolized cough produces; use N95 + negative-pressure room.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — orthostatic precautions; report dizziness, tachycardia, fever, severe weakness, abdominal pain (pancreatitis).", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("Alternative options preferred — TMP-SMX, atovaquone, dapsone for PCP prophylaxis; pentamidine reserved for refractory / intolerant.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Persistent DIABETES after IV pentamidine — may be permanent; counsel + diabetes management.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats severe pneumocystis pneumonia + other parasitic infections. We give it slowly IV or as a special breathing mist. Many side effects possible — low BP, low/high blood sugar (sometimes permanent diabetes), pancreas inflammation, heart rhythm changes. We monitor closely. Tell us about dizziness, palpitations, severe nausea, belly pain.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PyrimethamineSulfadiazineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "pyrimethamine-sulfadiazine",
        title: "Pyrimethamine + sulfadiazine (+ leucovorin)",
        subtitle: "CNS toxoplasmosis treatment · synergistic folate antagonists · LEUCOVORIN RESCUE mandatory · sulfa allergy alternative · 6+ weeks then suppression",
        category: "Antiprotozoal combination — CNS toxoplasmosis",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Pyrimethamine — dihydrofolate reductase inhibitor; sulfadiazine — dihydropteroate synthetase inhibitor; SYNERGISTIC folate antagonism; leucovorin (folinic acid) rescues mammalian cells without rescuing parasites"),
            KeyValueRow(key: "Use", value: "CNS toxoplasmosis treatment (induction + maintenance) — AIDS, transplant; congenital toxoplasmosis; ocular toxoplasmosis; primary toxoplasmosis prophylaxis (CD4 <100, TMP-SMX intolerant)"),
            KeyValueRow(key: "Dose", value: "Toxo induction: pyrimethamine 200 mg PO load → 50-75 mg PO daily + sulfadiazine 1-1.5 g PO QID + LEUCOVORIN 10-25 mg PO daily × 6 weeks; chronic maintenance ½ dose × CD4 recovery"),
            KeyValueRow(key: "Monitor", value: "CBC + diff weekly initially → biweekly (cytopenias); LFTs; Cr; clinical + MRI response"),
            KeyValueRow(key: "Watch", value: "CYTOPENIAS (BM suppression — leucovorin MANDATORY); SJS/TEN (sulfa allergy); kidney stones (sulfa crystalluria); G6PD hemolysis; teratogen 1st trimester")
        ],
        indications: AttributedProse(
            "CNS toxoplasmosis (Toxoplasma gondii encephalitis) — initial therapy + chronic suppression in immunocompromised (AIDS CD4 <100, transplant). Congenital toxoplasmosis. Ocular toxoplasmosis (vision-threatening lesions). Alternative regimens — TMP-SMX (preferred when sulfa-tolerant), atovaquone-based, clindamycin-pyrimethamine per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Pyrimethamine — inhibits parasitic dihydrofolate reductase (DHFR) → reduces tetrahydrofolate. Sulfadiazine — inhibits parasitic dihydropteroate synthetase (DHPS) → blocks PABA incorporation into dihydropteroic acid. Sequential blockade of folate synthesis → synergistic killing. LEUCOVORIN (folinic acid) bypasses DHFR block in mammalian cells (humans) but parasites cannot use folinic acid → rescues human cells from pyrimethamine toxicity.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Toxoplasmosis induction", body: "Pyrimethamine 200 mg PO loading dose × 1 → 50-75 mg PO daily + sulfadiazine 1-1.5 g PO every 6 hours + LEUCOVORIN 10-25 mg PO daily × 6 weeks per primary source.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Maintenance suppression", body: "Pyrimethamine 25-50 mg PO daily + sulfadiazine 500-1000 mg PO QID + leucovorin 10-25 mg PO daily; CONTINUE until CD4 >200 × 6 months on ART.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Primary prophylaxis (TMP-SMX intolerant)", body: "Pyrimethamine 50 mg PO weekly + sulfadiazine 500 mg PO daily + leucovorin 25 mg PO weekly OR alternative (atovaquone, dapsone + pyrimethamine).", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Renal / hepatic", body: "Severe — caution; monitor.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pregnancy", body: "1st trimester — TERATOGEN (pyrimethamine); SPIRAMYCIN alternative; 2nd-3rd trimester pyrimethamine + sulfadiazine + leucovorin.", citationIDs: ["specialty_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to pyrimethamine OR sulfa drugs; megaloblastic anemia from folate deficiency (uncorrected); pregnancy 1st trimester; G6PD deficiency (relative — hemolysis from sulfadiazine).",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("LEUCOVORIN MANDATORY — folinic acid 10-25 mg PO daily; prevents pyrimethamine bone marrow toxicity; without leucovorin → severe cytopenias.", citationIDs: ["specialty_round30"]),
            AttributedBullet("CYTOPENIAS — anemia, leukopenia, thrombocytopenia, agranulocytosis; CBC + diff weekly initially → biweekly → monthly; reduce / hold for severe.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STEVENS-JOHNSON SYNDROME / TEN — sulfadiazine; severe cutaneous reactions; STOP + supportive.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CRYSTALLURIA + KIDNEY STONES — sulfadiazine; ADEQUATE HYDRATION (≥1.5 L fluid/day) + urine alkalinization sometimes; monitor BUN/Cr.", citationIDs: ["openfda_round30"]),
            AttributedBullet("G6PD DEFICIENCY — hemolysis from sulfadiazine; screen + caution.", citationIDs: ["openfda_round30"]),
            AttributedBullet("TERATOGEN — pyrimethamine 1st trimester teratogen; spiramycin alternative early; pyrimethamine + sulfa later.", citationIDs: ["specialty_round30"]),
            AttributedBullet("HEPATOTOXICITY — LFTs monthly.", citationIDs: ["openfda_round30"]),
            AttributedBullet("FOLATE DEFICIENCY — leucovorin rescues; never use folic acid (parasites can use folic acid + worsens infection).", citationIDs: ["specialty_round30"]),
            AttributedBullet("CARDIAC arrhythmias — uncommon.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PSYCHIATRIC + neurologic — confusion, ataxia, seizures uncommon.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Cytopenias (BM suppression), rash, Stevens-Johnson syndrome, crystalluria, kidney stones, hepatic enzyme elevation, nausea, vomiting, GI upset, headache, fever, atrophic glossitis.",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("OTHER FOLATE ANTAGONISTS (TMP, methotrexate) — additive cytopenias.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ZIDOVUDINE (AZT), GANCICLOVIR — additive bone marrow suppression.", citationIDs: ["openfda_round30"]),
            AttributedBullet("WARFARIN — sulfa increases anticoagulation; monitor INR.", citationIDs: ["openfda_round30"]),
            AttributedBullet("METHOTREXATE — synergistic + dangerous; avoid.", citationIDs: ["openfda_round30"]),
            AttributedBullet("LEUCOVORIN — REQUIRED; folic acid INCREASES infection (parasites use folic acid but not folinic acid).", citationIDs: ["specialty_round30"]),
            AttributedBullet("CYP2C9 inhibitors — increase sulfadiazine levels.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — CBC + diff, LFTs, BUN/Cr, urinalysis (crystalluria), G6PD screen, sulfa allergy, pregnancy test, HIV CD4 + viral load, brain MRI.", citationIDs: ["specialty_round30"]),
            AttributedBullet("LEUCOVORIN INCLUDED in every regimen — folinic acid NOT folic acid; NEVER use folic acid alone (worsens infection).", citationIDs: ["specialty_round30"]),
            AttributedBullet("HYDRATION — 1.5-2 L fluid daily to prevent crystalluria + kidney stones; monitor urine output + BUN/Cr.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("CBC + diff weekly × 4 weeks → biweekly → monthly; LFTs monthly initially → q3 months; Cr + urinalysis monthly.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — REPORT rash (especially with fever — SJS), severe weakness/fatigue (cytopenias), painful urination/flank pain (kidney stones), severe nausea/vomiting, mood changes.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("HIV/AIDS — start ART for immune restoration; consider holding ART start during first 2 weeks of toxo treatment (IRIS risk).", citationIDs: ["specialty_round30"]),
            AttributedBullet("Pregnancy — 1st trimester teratogenic risk; SPIRAMYCIN preferred; 2nd-3rd trimester pyrimethamine + sulfa + leucovorin acceptable.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Cost concerns — pyrimethamine + Daraprim price increases historically; specialty pharmacy + financial assistance.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "These medicines treat severe brain toxoplasmosis. Take WITH leucovorin (folinic acid) — protects your bone marrow. Drink 1.5-2 liters of water daily to prevent kidney stones. NEVER take regular folic acid — could worsen the infection. Watch for rash + fever (serious skin reaction), severe weakness, flank pain. Frequent bloodwork. Long treatment course.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum BiktarvySample {
    public static let entry: DrugEntry = DrugEntry(
        id: "bictegravir-tenofovir-emtricitabine",
        title: "Bictegravir / tenofovir / emtricitabine (Biktarvy)",
        subtitle: "Single-tablet HIV regimen · INSTI + 2 NRTIs · 1st-line ART (DHHS) · TAF less renal/bone · one pill daily · resistance rare",
        category: "HIV antiretroviral single-tablet regimen — DHHS preferred 1st-line",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Fixed-dose combination single-tablet regimen (STR) — bictegravir (BIC, second-generation INSTI) + tenofovir alafenamide (TAF, NRTI) + emtricitabine (FTC, NRTI)"),
            KeyValueRow(key: "Use", value: "HIV-1 treatment — DHHS preferred first-line for treatment-naive + virologically suppressed switch; not for HBV co-infection alone (active TAF for HBV but limited utility)"),
            KeyValueRow(key: "Dose", value: "1 tablet (50/200/25 mg BIC/FTC/TAF) PO once daily WITH OR WITHOUT FOOD"),
            KeyValueRow(key: "Monitor", value: "HIV viral load (q3-4 months until suppressed → q6-12 months); CD4; renal function (Cr, urine protein); LFTs; lipids; bone density baseline"),
            KeyValueRow(key: "Watch", value: "RARE resistance (high genetic barrier); less renal/bone toxicity than TDF; HEPATITIS B reactivation if stopped; CYP3A4 substrate (limited interactions); weight gain")
        ],
        indications: AttributedProse(
            "HIV-1 treatment in adults + adolescents (≥6 years and ≥25 kg) — DHHS preferred first-line for treatment-naive + virologically-suppressed switch; high genetic barrier to resistance; one pill once daily; tolerable + effective per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "BICTEGRAVIR — second-generation INSTI (integrase strand transfer inhibitor); blocks integration of HIV proviral DNA into host genome. EMTRICITABINE — NRTI (cytidine analog) competing with natural substrates + chain termination. TENOFOVIR ALAFENAMIDE — NRTI prodrug of tenofovir with better tissue distribution + less renal/bone toxicity than tenofovir disoproxil fumarate (TDF); inhibits reverse transcriptase.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Adult + adolescent (≥6 years, ≥25 kg)", body: "1 tablet (50 mg bictegravir + 200 mg emtricitabine + 25 mg tenofovir alafenamide) PO ONCE daily with or without food per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Renal", body: "CrCl ≥30 — no adjustment (TAF safer renal profile); CrCl <30 — AVOID; hemodialysis-dependent — alternative regimen.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Hepatic", body: "Mild-moderate (Child-Pugh A-B) — no adjustment; severe (Child-Pugh C) — caution.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pregnancy", body: "Generally safe per DHHS perinatal guidelines; data accumulating; switch may be considered.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Pediatric (<6 years)", body: "Limited; consult.", citationIDs: ["openfda_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to bictegravir, emtricitabine, or tenofovir; severe renal impairment (CrCl <30); concurrent strong CYP3A4 inducers (rifampin); severe hepatic disease relative.",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("HEPATITIS B REACTIVATION — if stopped in HBV-coinfected patient → severe acute hepatitis flare; alternative HBV-active therapy if discontinuing.", citationIDs: ["openfda_round30"]),
            AttributedBullet("RENAL TOXICITY (TAF less than TDF) — monitor Cr + urine protein; AKI rare.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HEPATIC TOXICITY — LFT elevations; monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("LACTIC ACIDOSIS + hepatomegaly with steatosis — boxed for NRTI class but rare with TAF.", citationIDs: ["openfda_round30"]),
            AttributedBullet("IMMUNE RECONSTITUTION INFLAMMATORY SYNDROME (IRIS) — upon ART start; latent infections become symptomatic.", citationIDs: ["openfda_round30"]),
            AttributedBullet("WEIGHT GAIN — increasingly recognized class effect (INSTI + TAF); counsel + lifestyle.", citationIDs: ["specialty_round30"]),
            AttributedBullet("RESISTANCE — high genetic barrier; rare; sequencing if breakthrough.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DRUG INTERACTIONS — CYP3A4 substrate; rifampin contraindicated; some antacids/divalent cations reduce absorption.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, headache, abnormal dreams, fatigue, weight gain, depression (uncommon), Cr elevation (minimal with TAF).",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("RIFAMPIN — CONTRAINDICATED (significantly reduces bictegravir); rifabutin acceptable with adjustment.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ANTACIDS + DIVALENT/TRIVALENT CATIONS (Ca, Mg, Fe, Al) — reduce bictegravir absorption; separate by 2 hours.", citationIDs: ["openfda_round30"]),
            AttributedBullet("METFORMIN — bictegravir increases metformin levels; monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (carbamazepine, phenytoin, St. John's wort) — reduce bictegravir; avoid.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INHIBITORS — minimally significant.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — HIV viral load + genotype (resistance testing), CD4 count, CBC, comprehensive metabolic, LFTs, lipid panel, HCV + HBV serology, hepatitis A vaccine status, syphilis + STI screen, pregnancy test, urine pregnancy.", citationIDs: ["specialty_round30"]),
            AttributedBullet("ART INITIATION — start ASAP after diagnosis; rapid initiation increasingly common; treatment-naive → Biktarvy preferred per DHHS.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Monitoring — viral load q4 weeks until suppressed → q3 months → q6 months; CD4 q3-6 months; routine labs.", citationIDs: ["specialty_round30"]),
            AttributedBullet("ADHERENCE — once daily; pill burden minimized; psychosocial assessment + linkage to care.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — REPORT all medications + supplements (antacids, multivitamins, iron); separate divalent cations by 2 hours; weight gain monitoring; mood; HBV reactivation risk if discontinuing.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("HBV co-infection — Biktarvy active against HBV (TAF + FTC); if discontinuing → switch to HBV-active alternative to avoid flare.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Pregnancy — switch may be considered per perinatal guidelines; coordinate.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Comorbidities — renal disease (avoid <30 CrCl), liver disease, bone health, cardiovascular risk.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This single pill treats HIV — take ONCE daily with or without food. Take consistently every day for the rest of your life. Tell us about ALL medicines + supplements — some interact (antacids, iron, calcium — separate by 2 hours). Watch for fatigue, mood changes, severe nausea, yellow eyes/skin. Get bloodwork as ordered. Don't stop without talking to us — can cause hepatitis flare.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum DarunavirCobicistatSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "darunavir-cobicistat",
        title: "Darunavir / cobicistat (Prezcobix) ± tenofovir / emtricitabine (Symtuza)",
        subtitle: "PI/PK booster · resistant or salvage HIV · pregnancy preferred for some · cobicistat boost only PK · rash + GI + cardiovascular events",
        category: "HIV protease inhibitor + pharmacokinetic enhancer — salvage + boosted regimens",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Darunavir — HIV-1 protease inhibitor; cobicistat — pharmacokinetic enhancer (CYP3A4 inhibitor) — no anti-HIV activity but boosts darunavir"),
            KeyValueRow(key: "Use", value: "HIV treatment — preferred for treatment-experienced with resistance; alternative first-line; salvage; PI-favorable PK"),
            KeyValueRow(key: "Dose", value: "Prezcobix (DRV 800 mg / COBI 150 mg) 1 tablet PO once daily WITH FOOD; Symtuza (DRV/COBI/TAF/FTC 800/150/10/200 mg) 1 tablet PO once daily WITH FOOD"),
            KeyValueRow(key: "Monitor", value: "HIV viral load, CD4, lipid panel, LFTs, Cr, weight, BP"),
            KeyValueRow(key: "Watch", value: "SULFA allergy (darunavir contains sulfa moiety); RASH (SJS, DRESS); HEPATOTOXICITY; massive CYP3A4 drug interactions via cobicistat boost; cardiovascular events; weight gain")
        ],
        indications: AttributedProse(
            "HIV-1 treatment — treatment-experienced patients with darunavir-resistance mutations <3; treatment-naive (alternative first-line); switch from older PI/ritonavir regimens; salvage therapy. Pharmacokinetic boost (cobicistat replaces ritonavir for some PIs + INSTIs). Pregnancy preferred PI option per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "DARUNAVIR — competitive inhibitor of HIV-1 protease enzyme → blocks cleavage of Gag-Pol polyprotein → prevents formation of mature infectious virions. COBICISTAT — selective CYP3A4 inhibitor with negligible anti-HIV activity → boosts darunavir plasma levels by inhibiting metabolism → enables once-daily dosing (vs unboosted darunavir BID).",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Treatment-naive + experienced (Prezcobix)", body: "DRV 800 mg / COBI 150 mg — 1 tablet PO ONCE daily WITH FOOD per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Single-tablet regimen (Symtuza)", body: "DRV/COBI/TAF/FTC 800/150/10/200 mg — 1 tablet PO ONCE daily WITH FOOD; combines PI + booster + 2 NRTIs.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Treatment-experienced with resistance", body: "Use DRV 600 mg + RTV 100 mg BID OR DRV 800 mg + COBI 150 mg daily based on resistance pattern.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Renal", body: "CrCl ≥70 — no adjustment; severe renal impairment + Symtuza — avoid; consider alternative.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Hepatic", body: "Mild-moderate — no adjustment; severe (Child-Pugh C) — avoid.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pregnancy", body: "DRV/RTV 600/100 mg BID preferred (more PK data); coordinate perinatal.", citationIDs: ["specialty_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to darunavir, cobicistat; severe hepatic impairment (Child-Pugh C); coadministration with drugs metabolized by CYP3A4 that can cause serious adverse effects (alfuzosin, amiodarone, ranolazine, lovastatin, simvastatin, sildenafil for PAH, triazolam, midazolam oral, ergot alkaloids, lurasidone, pimozide, dronedarone, dofetilide, lurasidone, lomitapide); rifampin; St. John's wort.",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("SULFA ALLERGY — darunavir contains sulfa moiety; ~10-15% cross-reactivity in sulfa-allergic; careful screening + risk-benefit.", citationIDs: ["openfda_round30"]),
            AttributedBullet("RASH — common; can be severe (SJS, DRESS); discontinue for severe.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HEPATOTOXICITY — LFTs monthly initially; hepatitis flares; severe hepatic — caution.", citationIDs: ["openfda_round30"]),
            AttributedBullet("COBICISTAT — increases serum CREATININE by inhibiting tubular secretion (NOT true renal injury); baseline + monitor; if significant rise → workup.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MASSIVE CYP3A4 DRUG INTERACTIONS — cobicistat is potent inhibitor; extensive medication review essential; alternative drugs when possible.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CARDIOVASCULAR — increased MI risk in some studies; CV risk reduction.", citationIDs: ["openfda_round30"]),
            AttributedBullet("LIPID elevation — hyperlipidemia; monitor + treat.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DIABETES + hyperglycemia — class effect; monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("WEIGHT GAIN — common; counsel + lifestyle.", citationIDs: ["openfda_round30"]),
            AttributedBullet("IRIS — immune reconstitution; latent OIs become symptomatic upon ART start.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PREGNANCY — switch to DRV/RTV BID may be considered (more PK data + transferable).", citationIDs: ["specialty_round30"])
        ],
        adverseReactions: AttributedProse(
            "Rash, nausea, diarrhea, headache, abdominal pain, vomiting, fatigue, lipid + glucose elevations, weight gain, hepatic enzyme elevation, serum Cr elevation (cobicistat artifact).",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("CONTRAINDICATED — alfuzosin, amiodarone, dronedarone, ranolazine, sildenafil for PAH, alfuzosin, ergot alkaloids, lovastatin / simvastatin, oral midazolam, triazolam, lurasidone, pimozide, rifampin, St. John's wort, lomitapide, irinotecan, salmeterol, ranolazine, ticagrelor (high-dose), naltrexone HCl long-acting.", citationIDs: ["openfda_round30"]),
            AttributedBullet("USE WITH CAUTION — ATORVASTATIN, ROSUVASTATIN (start low dose), digoxin, voriconazole, fluticasone (Cushing risk), salmeterol, calcium channel blockers (felodipine, nifedipine, amlodipine), warfarin, methadone.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS — rifampin, carbamazepine, phenytoin, phenobarbital, St. John's wort — avoid.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ANTACIDS, multivitamins — separate by hours.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CONCOMITANT ART — bictegravir-tenofovir-emtricitabine — not concurrent (use Symtuza for STR).", citationIDs: ["specialty_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — HIV viral load + genotype (resistance), CD4, CBC, CMP, LFTs, lipid panel, HCV+HBV, urinalysis, sulfa allergy assessment, comprehensive medications, pregnancy test.", citationIDs: ["specialty_round30"]),
            AttributedBullet("SULFA allergy — careful assessment; mild rash history → may try with monitoring; severe (SJS, DRESS) — avoid.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Drug interactions — EXTENSIVE; pharmacy review every visit; many CCBs, statins, antiarrhythmics, sedatives, immunosuppressants, anticoagulants, antifungals affected.", citationIDs: ["specialty_round30"]),
            AttributedBullet("COBICISTAT-induced Cr rise (NOT true AKI) — baseline + interpret; significant change → workup.", citationIDs: ["openfda_round30"]),
            AttributedBullet("TAKE WITH FOOD — bioavailability + GI tolerability; consistent timing.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Monitoring — viral load, CD4, lipids, CMP, LFTs, weight, BP regularly.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — REPORT rash (especially with fever), severe nausea, yellow eyes/skin, palpitations, weight gain; pregnancy planning.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("Salvage therapy — based on resistance testing; multidisciplinary team; sometimes 3-4 drug active regimens.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "These HIV medicines treat resistant or experienced HIV. Take WITH FOOD every day. Tell us about EVERY medication + supplement — many interactions (statins, blood thinners, antifungals, sedatives). Tell us about your sulfa allergy history. Watch for rash with fever (call right away), severe nausea, yellow eyes. Get bloodwork as ordered. Don't stop without talking to us.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MaravirocSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "maraviroc",
        title: "Maraviroc (Selzentry)",
        subtitle: "HIV CCR5 antagonist · tropism testing REQUIRED · R5-tropic virus only · BOXED hepatotoxicity · niche use in salvage / specific populations",
        category: "HIV CCR5 entry inhibitor — tropism-tested salvage",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "HIV-1 entry inhibitor — selective CCR5 antagonist; blocks viral binding to host cell"),
            KeyValueRow(key: "Use", value: "HIV-1 treatment — TROPISM TESTING REQUIRED (only effective vs R5-tropic virus, ~80% of treatment-naive HIV); salvage in treatment-experienced; some pediatric"),
            KeyValueRow(key: "Dose", value: "150 mg PO BID (with strong CYP3A4 inhibitors); 300 mg PO BID (most regimens); 600 mg PO BID (with strong CYP3A4 inducers)"),
            KeyValueRow(key: "Monitor", value: "HIV viral load, tropism testing baseline, LFTs, comprehensive ART regimen"),
            KeyValueRow(key: "Watch", value: "BOXED — HEPATOTOXICITY (rare severe + fatal); systemic allergic reaction; cardiovascular events; orthostatic hypotension; pancytopenia (rare)")
        ],
        indications: AttributedProse(
            "HIV-1 treatment — treatment-experienced + treatment-naive patients with R5-tropic HIV-1 (CCR5-using virus). TROPISM TESTING required before initiation. Salvage therapy with multidrug resistance. Some pediatric. Limited adoption due to need for tropism testing + multiple competing first-line options per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Selective antagonist of human CCR5 (chemokine co-receptor) on host CD4 T cells + macrophages → blocks gp120 envelope glycoprotein binding → prevents HIV viral entry. Only effective against R5-tropic HIV-1 (uses CCR5 co-receptor); X4-tropic + dual-tropic viruses NOT susceptible.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Most regimens", body: "300 mg PO BID with or without food per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "With strong CYP3A4 inhibitors", body: "150 mg PO BID — protease inhibitors (boosted) + clarithromycin + ketoconazole + itraconazole + nefazodone.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "With strong CYP3A4 inducers", body: "600 mg PO BID — efavirenz, rifampin (without strong CYP3A4 inhibitor), carbamazepine, phenytoin.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Renal", body: "CrCl ≥30 — no adjustment; mild renal impairment OK; severe — consider alternative.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Hepatic", body: "Severe — caution + monitor LFTs.", citationIDs: ["openfda_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; severe hepatic impairment (caution); X4-tropic OR dual-tropic HIV-1 (ineffective); concurrent strong CYP3A4 inducer + strong CYP3A4 inhibitor combinations difficult.",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("BOXED — HEPATOTOXICITY — rare severe + fatal hepatitis; ALT/AST monitoring; systemic allergic reaction may precede hepatic; discontinue for severe.", citationIDs: ["openfda_round30"]),
            AttributedBullet("SYSTEMIC ALLERGIC REACTION — rash, eosinophilia, IgE elevation, hepatic dysfunction; STOP at first signs.", citationIDs: ["openfda_round30"]),
            AttributedBullet("CARDIOVASCULAR events — increased MI + ischemic events; manage CV risk.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — caution + counsel; first doses.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PANCYTOPENIA — rare; monitor CBC.", citationIDs: ["openfda_round30"]),
            AttributedBullet("INFECTIONS — some viral / bacterial infections; counsel.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MALIGNANCY — possible increased risk; long-term data.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MUSCULOSKELETAL — myalgia, cramps reported.", citationIDs: ["openfda_round30"]),
            AttributedBullet("TROPISM TESTING — repeat after virologic failure; tropism can shift over time.", citationIDs: ["specialty_round30"])
        ],
        adverseReactions: AttributedProse(
            "Cough, fever, upper respiratory tract infections, rash, musculoskeletal symptoms, abdominal pain, dizziness, allergic reactions, hepatotoxicity, hypotension.",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 SUBSTRATE — dose adjusted based on coadministered drugs.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INHIBITORS (boosted PIs, clarithromycin, ketoconazole, itraconazole) — 150 mg BID.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (efavirenz, rifampin, carbamazepine, phenytoin) — 600 mg BID.", citationIDs: ["openfda_round30"]),
            AttributedBullet("INTEGRASE INHIBITORS — generally combinable; verify dosing.", citationIDs: ["specialty_round30"]),
            AttributedBullet("NRTIs — generally compatible; sequence rifampin + boosted PIs carefully.", citationIDs: ["specialty_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — HIV viral load + RESISTANCE testing + TROPISM testing (HIV-1 co-receptor tropism); CD4, CBC, LFTs, CMP, lipid panel, comprehensive medications.", citationIDs: ["specialty_round30"]),
            AttributedBullet("TROPISM TESTING ESSENTIAL — Trofile assay or genotypic — only R5-tropic virus susceptible; ~80% of treatment-naive; lower in treatment-experienced.", citationIDs: ["specialty_round30"]),
            AttributedBullet("DOSING based on co-administered ART + concomitant medications — variable; pharmacist consultation.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Monitoring — viral load, LFTs, CBC, lipids regularly; tropism re-testing if virologic failure.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — REPORT yellow eyes/skin, severe rash, fever, lymphadenopathy, fatigue (hepatic + allergic reaction); orthostatic precautions; CV risk reduction.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("LIMITED ROLE — niche use; salvage + tropism-tested; many alternative first-line regimens without tropism testing requirement.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This HIV medicine blocks the virus from entering your immune cells. We did a special blood test (tropism) first to make sure it works against your strain. Call us right away if you get yellow eyes/skin, severe rash, fever, swollen glands — could be liver or allergic problem. Bloodwork regularly. Rise slowly to avoid dizziness.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LenacapavirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "lenacapavir",
        title: "Lenacapavir (Sunlenca)",
        subtitle: "First-in-class HIV capsid inhibitor · LONG-ACTING q6 month SC · multidrug-resistant HIV salvage · injection site reactions · DDI minimal vs other HIV drugs",
        category: "HIV-1 capsid inhibitor — long-acting q6 month for MDR HIV",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "First-in-class HIV-1 capsid inhibitor — binds to multiple conserved sites on viral capsid"),
            KeyValueRow(key: "Use", value: "MULTIDRUG-RESISTANT HIV-1 in heavily treatment-experienced patients with limited treatment options; combined with optimized background regimen"),
            KeyValueRow(key: "Dose", value: "Loading: 600 mg PO day 1 + day 2 + 300 mg PO day 8; THEN 927 mg SUBCUTANEOUS every 26 weeks (~6 MONTHS)"),
            KeyValueRow(key: "Monitor", value: "HIV viral load, CD4, INJECTION SITE reactions, hypersensitivity, drug interactions"),
            KeyValueRow(key: "Watch", value: "INJECTION SITE NODULES (~63% — palpable indurated lumps lasting weeks-months); injection site pain + swelling; persistent levels after discontinuation — RISK of EMERGENCE OF RESISTANCE if not on full background regimen × 18+ months")
        ],
        indications: AttributedProse(
            "Multidrug-resistant HIV-1 infection — heavily treatment-experienced adults with multidrug-resistant HIV-1 failing current regimen + limited treatment options; combined with optimized background antiretroviral therapy (OBR). Specialty centers + careful patient selection per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "First-in-class long-acting HIV-1 capsid inhibitor — binds to multiple highly-conserved sites on HIV-1 capsid hexamer + pentamer subunit. Inhibits multiple stages of viral replication — capsid-dependent uncoating, capsid assembly, nuclear translocation of viral DNA, virion production. Active against all HIV-1 subtypes including those resistant to all other classes.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Initiation (load + transition)", body: "Days 1+2: 600 mg PO (2 × 300 mg tablets) each day; Day 8: 300 mg PO; Day 15: 927 mg SC + monitor; then 927 mg SC every 26 weeks (6 months) per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Maintenance", body: "927 mg SC (two 1.5 mL injections at separate sites) every 26 weeks (~6 months); abdominal SC.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Missed dose", body: "If >28 weeks (vs scheduled 26): missed dose; restart loading regimen + give SC injection ASAP.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pediatric / pregnancy", body: "Limited data; consult specialist.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Renal / hepatic", body: "Mild-moderate — no adjustment; severe — caution.", citationIDs: ["openfda_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to lenacapavir; concurrent strong CYP3A4 inducers (rifampin, carbamazepine, phenytoin, St. John's wort) — reduce levels.",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("INJECTION SITE REACTIONS — ~63%; palpable nodules + induration lasting weeks-months; pain + swelling; abdominal SC preferred; site rotation.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PROLONGED EXPOSURE after discontinuation — detectable levels persist 18+ months; risk of resistance emergence if regimen incomplete; counsel + careful timing of any future regimen change.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DRUG INTERACTIONS — CYP3A4 substrate + inhibitor; relatively limited; strong inducers contraindicated; moderate inhibitors increase levels.", citationIDs: ["openfda_round30"]),
            AttributedBullet("IMMUNE RECONSTITUTION INFLAMMATORY SYNDROME (IRIS) — upon improving HIV control; latent infections become symptomatic.", citationIDs: ["openfda_round30"]),
            AttributedBullet("OPTIMIZED BACKGROUND REGIMEN — lenacapavir must be combined with at least 1 fully active companion ART; monotherapy → resistance emergence.", citationIDs: ["specialty_round30"]),
            AttributedBullet("PREGNANCY — limited data.", citationIDs: ["openfda_round30"]),
            AttributedBullet("BREASTFEEDING — limited data.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Injection site reactions (~63% — pain, erythema, induration, nodules lasting weeks-months), nausea, headache, fatigue.",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INDUCERS — CONTRAINDICATED (rifampin, carbamazepine, phenytoin, phenobarbital, St. John's wort).", citationIDs: ["openfda_round30"]),
            AttributedBullet("MODERATE CYP3A4 INDUCERS (rifabutin, dexamethasone chronic, lumacaftor, mitotane) — caution; alternative.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INHIBITORS (ketoconazole, ritonavir long-term, COBI) — increase levels; monitor.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MAJOR PI/COBI combos may affect; ID specialist consultation.", citationIDs: ["specialty_round30"]),
            AttributedBullet("WARFARIN, statins — may need monitoring.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — comprehensive HIV resistance + tropism testing, CD4, CBC, CMP, LFTs, lipid panel, drug interaction screen, current ART regimen, pregnancy test.", citationIDs: ["specialty_round30"]),
            AttributedBullet("SPECIALTY HIV center — careful patient selection + optimized background regimen; multidisciplinary team.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Initiation regimen — PO load × 8 days → first SC injection day 15; subsequent SC q26 weeks.", citationIDs: ["openfda_round30"]),
            AttributedBullet("SC TECHNIQUE — abdominal SC; two 1.5 mL injections at separate sites; warm to room temperature before injection; rotate quadrants; injection nodules expected; pre-medicate with acetaminophen + cold pack if painful.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Monitoring — HIV viral load + CD4 q3-6 months; injection site assessment.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Counsel — injection site nodules expected + persist weeks-months (normal); REPORT severe persistent inflammation, fever, signs of allergic reaction; medication interactions.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("LONG HALF-LIFE — persistent levels 18+ months after discontinuation; ANY ART changes coordinated with HIV specialist + careful timing of any regimen change.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Patient education — q6 month convenience; commitment to follow-up + companion regimen adherence essential to prevent resistance.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Cost + insurance — very expensive specialty drug; specialty pharmacy + financial assistance + program enrollment.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This is a new long-acting HIV medicine — pills for first 2 weeks, then a shot every 6 months. The shot may cause a hard lump under your skin lasting weeks to months — this is normal but tell us if it's very painful or red/hot. Keep taking your other HIV pills daily — this medicine works WITH them. Tell us every medicine you take. Don't miss appointments — long protection but needs follow-up.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IvermectinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ivermectin",
        title: "Ivermectin (Stromectol)",
        subtitle: "Antiparasitic · strongyloides + scabies + onchocerciasis · single oral dose typically · STRONGYLOIDES HYPERINFECTION emergent in immunocompromised · COVID controversy",
        category: "Antiparasitic — strongyloides + scabies + filariasis + lice",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Macrocyclic lactone (avermectin) — opens glutamate-gated chloride channels in invertebrate neurons → paralysis + death of parasites"),
            KeyValueRow(key: "Use", value: "Strongyloidiasis (intestinal + hyperinfection); scabies (oral; topical permethrin first-line); onchocerciasis; lymphatic filariasis; lice (off-label); hookworm; ascariasis"),
            KeyValueRow(key: "Dose", value: "Strongyloides intestinal: 200 mcg/kg PO once + repeat 2 weeks; HYPERINFECTION: 200 mcg/kg PO daily until clearance; scabies: 200 mcg/kg PO once + repeat 1-2 weeks; onchocerciasis: 150 mcg/kg PO single dose q6-12 months"),
            KeyValueRow(key: "Monitor", value: "Stool / sputum parasitology; clinical response; LFTs; Mazzotti reaction (onchocerciasis)"),
            KeyValueRow(key: "Watch", value: "STRONGYLOIDES HYPERINFECTION emergent — high mortality; rule out before steroids/immunosuppression; LOA LOA encephalopathy in endemic; CYP3A4 substrate")
        ],
        indications: AttributedProse(
            "Strongyloidiasis (Strongyloides stercoralis) — intestinal + disseminated/hyperinfection (immunocompromised). Scabies (oral alternative; topical permethrin first-line). Onchocerciasis (river blindness — Africa, Latin America). Lymphatic filariasis. Lice (off-label). Hookworm + ascariasis (alternative). NOT efficacious for SARS-CoV-2 per primary source.",
            citationIDs: ["specialty_round30", "openfda_round30"]
        ),
        mechanism: AttributedProse(
            "Macrocyclic lactone (avermectin family) — high-affinity binding to glutamate-gated chloride channels in invertebrate nerve + muscle cells → increased chloride influx → hyperpolarization + paralysis + death. Selective for invertebrates (mammals have GABA-gated channels, blood-brain barrier excludes ivermectin from CNS). Effective against extracellular + microfilarial stages.",
            citationIDs: ["openfda_round30"]
        ),
        dosing: [
            DosingBlock(label: "Strongyloides intestinal", body: "200 mcg/kg PO ONCE + repeat dose 2 weeks later; empty stomach for absorption per primary source.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Strongyloides hyperinfection / disseminated", body: "200 mcg/kg PO DAILY until stool/sputum cleared + 2 weeks; sometimes combine SC route in critical illness; specialized infectious disease.", citationIDs: ["specialty_round30"]),
            DosingBlock(label: "Scabies", body: "200 mcg/kg PO ONCE; repeat 1-2 weeks; treat household contacts; environmental decontamination.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Onchocerciasis", body: "150 mcg/kg PO ONCE; repeat every 6-12 months × years (microfilarial only; macrofilarial requires doxycycline 100 mg PO daily × 6 weeks or surgical extraction).", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Lymphatic filariasis", body: "200 mcg/kg PO + albendazole 400 mg PO once annually for mass drug administration.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Lice (head + body, off-label)", body: "200 mcg/kg PO single dose; repeat 7-10 days; alternative to topical permethrin/malathion.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Pediatric", body: "Weight-based; ≥15 kg generally; consult.", citationIDs: ["openfda_round30"]),
            DosingBlock(label: "Renal / hepatic", body: "No specific adjustment; severe — caution.", citationIDs: ["openfda_round30"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to ivermectin; weight <15 kg (relative); pregnancy (Category C — limited data).",
            citationIDs: ["openfda_round30"]
        ),
        warnings: [
            AttributedBullet("STRONGYLOIDES HYPERINFECTION emergent in immunocompromised — high mortality; RULE OUT before initiating steroids / immunosuppression / chemotherapy in patients from endemic areas; ivermectin 200 mcg/kg PO daily until clearance + 2 weeks.", citationIDs: ["specialty_round30"]),
            AttributedBullet("LOA LOA ENCEPHALOPATHY — in endemic areas with concurrent Loa loa microfilaremia (Central Africa); rapid kill → severe brain inflammation; pre-screen Loa loa before mass treatment.", citationIDs: ["openfda_round30"]),
            AttributedBullet("MAZZOTTI REACTION — onchocerciasis treatment; rapid microfilarial death → fever, rash, lymphadenopathy, hypotension, eye irritation; antihistamines + steroids.", citationIDs: ["openfda_round30"]),
            AttributedBullet("HYPERSENSITIVITY — rash, angioedema; uncommon.", citationIDs: ["openfda_round30"]),
            AttributedBullet("NOT EFFICACIOUS for SARS-CoV-2 — large RCTs negative; FDA + WHO + IDSA advise against use; misinformation common.", citationIDs: ["specialty_round30"]),
            AttributedBullet("CYP3A4 SUBSTRATE — strong inhibitors / inducers may alter levels.", citationIDs: ["openfda_round30"]),
            AttributedBullet("PREGNANCY — Category C; limited data; risk-benefit; mass treatment in pregnancy areas avoided.", citationIDs: ["openfda_round30"]),
            AttributedBullet("BREASTFEEDING — minimal milk excretion; usually acceptable.", citationIDs: ["openfda_round30"]),
            AttributedBullet("OVERDOSE — rare from oral; topical concerns minimal; veterinary product NOT for human use.", citationIDs: ["openfda_round30"])
        ],
        adverseReactions: AttributedProse(
            "Headache, dizziness, fatigue, fever, rash, GI upset, Mazzotti reaction (onchocerciasis), anaphylaxis (rare), pruritus.",
            citationIDs: ["openfda_round30"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 INHIBITORS (ketoconazole, ritonavir, clarithromycin) — may increase ivermectin levels; caution.", citationIDs: ["openfda_round30"]),
            AttributedBullet("STRONG CYP3A4 INDUCERS (rifampin, carbamazepine, phenytoin) — may reduce ivermectin; consider higher dose.", citationIDs: ["openfda_round30"]),
            AttributedBullet("ALBENDAZOLE — synergistic; mass drug administration combinations.", citationIDs: ["openfda_round30"]),
            AttributedBullet("DEC (diethylcarbamazine) — additive Mazzotti reaction in onchocerciasis.", citationIDs: ["openfda_round30"])
        ],
        nursingImplications: [
            AttributedBullet("BASELINE — parasitology (stool ova + parasites, sputum if hyperinfection), CBC + eosinophils, LFTs, comprehensive medications.", citationIDs: ["specialty_round30"]),
            AttributedBullet("STRONGYLOIDES SCREEN — patients from endemic areas (Latin America, Asia, Africa, Caribbean) BEFORE corticosteroids / chemotherapy / immunosuppression; serology (Strongyloides IgG) + stool examination; hyperinfection mortality up to 70%.", citationIDs: ["specialty_round30"]),
            AttributedBullet("HYPERINFECTION emergent — high-dose daily ivermectin; sometimes SC formulation in critical illness; supportive care; ICU.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Take EMPTY STOMACH for better absorption; with water; standard outpatient.", citationIDs: ["openfda_round30"]),
            AttributedBullet("Counsel — REPORT severe headache, vision changes, severe rash, breathing trouble; mild symptoms expected.", citationIDs: ["openrn_pharm_round30"]),
            AttributedBullet("Mass drug administration — onchocerciasis + filariasis endemic areas; eradication programs.", citationIDs: ["specialty_round30"]),
            AttributedBullet("Scabies — TREAT CONTACTS + environmental wash all bedding/clothing in hot water; permethrin topical first-line; ivermectin for crusted scabies + extensive disease.", citationIDs: ["specialty_round30"]),
            AttributedBullet("COVID-19 — NOT recommended; counsel patient that large RCTs show no benefit; address misinformation.", citationIDs: ["specialty_round30"])
        ],
        patientTeaching: AttributedProse(
            "This medicine treats parasitic infections — strongyloides worms, scabies, river blindness, lice. Take on EMPTY stomach. Side effects mild usually — headache, GI upset. For scabies — treat all household members + wash bedding/clothes in hot water. We may give you 2 doses 2 weeks apart. Take all doses even if symptoms improve.",
            citationIDs: ["openrn_pharm_round30"]
        ),
        citations: [openfdaR30, openrnPharmR30, specialtyR30, ismpR30],
        lastSourceFidelityReview: "2026-05-13"
    )
}
