import Foundation

// Curator-model antimicrobial drug entries (v1.5 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology — Antimicrobials (CC BY 4.0),
// IDSA guidelines (concept citation), CDC infection control (public domain).

private let openfda = CitationSource(
    id: "openfda_anti",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_anti",
    shortName: "Open RN Nursing Pharmacology — Antimicrobials",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK595000/",
    lastRetrieved: "2026-05-04"
)
private let cdcAntibioticStewardship = CitationSource(
    id: "cdc_antibiotic_stewardship",
    shortName: "CDC Antibiotic Stewardship and Resistance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/antimicrobial-resistance/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Metronidazole

public enum MetronidazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "metronidazole",
        title: "Metronidazole",
        subtitle: "Flagyl · nitroimidazole",
        category: "Antibiotic / Antiprotozoal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nitroimidazole"),
            KeyValueRow(key: "Spectrum", value: "Anaerobes (Bacteroides, Clostridium), C. difficile, protozoa (Giardia, Trichomonas, Entamoeba)"),
            KeyValueRow(key: "Half-life", value: "~8 hr"),
            KeyValueRow(key: "Routes", value: "PO, IV, topical, intravaginal")
        ],
        indications: AttributedProse(
            "Anaerobic bacterial infections (intra-abdominal, pelvic, brain abscess), C. difficile colitis (oral), bacterial vaginosis, trichomoniasis, giardiasis, amebiasis. Used in combination for H. pylori eradication.",
            citationIDs: ["openfda_anti"]
        ),
        mechanism: AttributedProse(
            "Reduced inside anaerobic organisms to a reactive intermediate that damages microbial DNA — bactericidal/protozoacidal.",
            citationIDs: ["openfda_anti", "openrn_pharm_anti"]
        ),
        dosing: [
            DosingBlock(label: "Anaerobic infection", body: "500 mg PO/IV every 8 hours.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "C. difficile (initial, mild)", body: "500 mg PO TID × 10–14 days (vancomycin or fidaxomicin generally preferred per current IDSA guidance).", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Trichomoniasis", body: "2 g PO × 1 (single dose) — treat partner.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Bacterial vaginosis", body: "500 mg PO BID × 7 days OR 0.75% gel intravaginally daily × 5 days.", citationIDs: ["openfda_anti"])
        ],
        contraindications: AttributedProse(
            "First trimester of pregnancy (relative). Hypersensitivity. Concurrent disulfiram or alcohol use (within 3 days of completion). Cockayne syndrome (boxed warning — fatal hepatotoxicity).",
            citationIDs: ["openfda_anti"]
        ),
        warnings: [
            AttributedBullet("Boxed warning: possible carcinogen in animal studies — use only when needed.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Severe disulfiram-like reaction with alcohol — flushing, nausea, vomiting, tachycardia. Avoid alcohol DURING and for 3 days after.", citationIDs: ["openfda_anti", "openrn_pharm_anti"]),
            AttributedBullet("Peripheral neuropathy with prolonged or high-dose use — usually reversible if drug stopped.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Seizures, encephalopathy, optic neuropathy — discontinue if neurologic signs develop.", citationIDs: ["openfda_anti"])
        ],
        adverseReactions: AttributedProse(
            "Metallic taste, nausea, anorexia, headache, dark/red-brown urine (harmless), peripheral neuropathy, candidiasis (vaginal/oral), neutropenia (rare), pancreatitis (rare).",
            citationIDs: ["openfda_anti"]
        ),
        drugInteractions: [
            AttributedBullet("Alcohol — disulfiram-like reaction; avoid during and 3 days after.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Warfarin — increases INR; monitor closely.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Lithium — metronidazole can raise lithium levels.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Phenytoin, carbamazepine — alter metronidazole metabolism.", citationIDs: ["openfda_anti"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel STRONGLY about avoiding alcohol — including alcohol-containing mouthwashes and OTC liquid medications — during and 3 days after completion.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Take with food to reduce GI upset.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Monitor INR if patient is on warfarin.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Reassure that dark/red-brown urine is a harmless drug effect.", citationIDs: ["openrn_pharm_anti"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. NO alcohol — including mouthwash and liquid cough/cold meds — during this antibiotic and for 3 days after the last dose. Your urine may turn darker; this is harmless. Report numbness, tingling, severe headache, or seizures.",
            citationIDs: ["openrn_pharm_anti"]
        ),
        citations: [openfda, openrn, cdcAntibioticStewardship],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Azithromycin

public enum AzithromycinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "azithromycin",
        title: "Azithromycin",
        subtitle: "Zithromax · Z-Pak · macrolide",
        category: "Macrolide Antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Macrolide"),
            KeyValueRow(key: "Spectrum", value: "Atypical CAP (Mycoplasma, Chlamydia, Legionella), strep, H. influenzae, M. catarrhalis, MAC"),
            KeyValueRow(key: "Half-life", value: "Tissue half-life ~3 days (long)"),
            KeyValueRow(key: "Note", value: "QT prolongation — use cautiously with other QT-prolonging drugs")
        ],
        indications: AttributedProse(
            "Community-acquired pneumonia (often combined with β-lactam for atypical coverage), acute exacerbations of COPD/bronchitis, pharyngitis (penicillin alternative), uncomplicated chlamydia, gonorrhea (in combination), traveler's diarrhea (alternative), MAC prophylaxis/treatment in HIV.",
            citationIDs: ["openfda_anti"]
        ),
        mechanism: AttributedProse(
            "Binds to the 50S ribosomal subunit, inhibiting bacterial protein synthesis — bacteriostatic (bactericidal at high concentrations against susceptible organisms).",
            citationIDs: ["openfda_anti", "openrn_pharm_anti"]
        ),
        dosing: [
            DosingBlock(label: "CAP / bronchitis (Z-Pak)", body: "500 mg PO × 1 day, then 250 mg PO daily × 4 days.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Severe pneumonia (IV)", body: "500 mg IV every 24 hours for at least 2 days, then transition to oral.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Chlamydia", body: "1 g PO × 1.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Pharyngitis (penicillin alternative)", body: "12 mg/kg PO daily × 5 days.", citationIDs: ["openfda_anti"])
        ],
        contraindications: AttributedProse(
            "Prior cholestatic jaundice/hepatic dysfunction with macrolides. Hypersensitivity to macrolides.",
            citationIDs: ["openfda_anti"]
        ),
        warnings: [
            AttributedBullet("QT prolongation and torsades de pointes — risk highest in elderly, electrolyte derangement, structural heart disease, other QT-prolonging drugs.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Hepatotoxicity — discontinue if signs of hepatitis (jaundice, dark urine, tender RUQ).", citationIDs: ["openfda_anti"]),
            AttributedBullet("C. difficile colitis can occur during or after therapy.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Infantile hypertrophic pyloric stenosis (IHPS) reported in infants — use cautiously in <6 weeks.", citationIDs: ["openfda_anti"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, abdominal pain, headache, taste perversion, transient LFT elevation, rare QT prolongation, rare hepatotoxicity.",
            citationIDs: ["openfda_anti"]
        ),
        drugInteractions: [
            AttributedBullet("Other QT-prolonging drugs (amiodarone, fluoroquinolones, antipsychotics, methadone) — additive QT effect.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Warfarin — may increase INR; monitor.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Digoxin — azithromycin may raise levels (less than erythromycin/clarithromycin).", citationIDs: ["openfda_anti"]),
            AttributedBullet("Aluminum/magnesium antacids — reduce peak; separate by 2 hours.", citationIDs: ["openfda_anti"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline ECG and electrolytes if cardiac risk factors are present.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Take 1 hour before or 2 hours after antacids; food may delay absorption (immediate-release).", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Monitor for signs of hepatotoxicity and C. difficile colitis (new diarrhea).", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Reinforce completion of full course even if symptoms improve.", citationIDs: ["cdc_antibiotic_stewardship"])
        ],
        patientTeaching: AttributedProse(
            "Complete the full course. Take at the same time each day. Report severe diarrhea, yellowing of skin/eyes, dark urine, palpitations, or fainting. Tell your provider if you take heart-rhythm medications.",
            citationIDs: ["openrn_pharm_anti"]
        ),
        citations: [openfda, openrn, cdcAntibioticStewardship],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cefazolin

public enum CefazolinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cefazolin",
        title: "Cefazolin",
        subtitle: "Ancef · Kefzol · 1st-generation cephalosporin",
        category: "Cephalosporin (1st gen)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "1st-generation cephalosporin"),
            KeyValueRow(key: "Spectrum", value: "Gram-positive (MSSA, strep), some gram-negative (E. coli, Klebsiella, Proteus)"),
            KeyValueRow(key: "Half-life", value: "1.5–2 hr"),
            KeyValueRow(key: "Surgical prophylaxis", value: "60 min before incision; redose at 4 hr or with major blood loss")
        ],
        indications: AttributedProse(
            "Surgical prophylaxis (most common — clean and clean-contaminated procedures), skin and soft tissue infections (MSSA, strep), UTI, bone and joint infection, endocarditis prophylaxis (alternative).",
            citationIDs: ["openfda_anti"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial cell wall synthesis by binding to penicillin-binding proteins → bactericidal.",
            citationIDs: ["openfda_anti", "openrn_pharm_anti"]
        ),
        dosing: [
            DosingBlock(label: "Surgical prophylaxis", body: "2 g IV (3 g if ≥120 kg) within 60 minutes of incision; redose every 4 hours intra-op or with significant blood loss.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Treatment of infection", body: "1–2 g IV every 8 hours.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Renal impairment", body: "Extend interval based on CrCl per package insert.", citationIDs: ["openfda_anti"])
        ],
        contraindications: AttributedProse(
            "History of severe (anaphylaxis, SJS/TEN) hypersensitivity to cephalosporins or penicillins.",
            citationIDs: ["openfda_anti"]
        ),
        warnings: [
            AttributedBullet("Cross-reactivity with penicillin allergy is low (<2%) but possible — clarify allergy history before administration.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("C. difficile colitis can occur during or after therapy.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Seizures with high doses in renal impairment.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Coombs-positive hemolytic anemia (rare).", citationIDs: ["openfda_anti"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, rash, transient LFT elevation, eosinophilia, injection site irritation, rare anaphylaxis, rare C. difficile colitis.",
            citationIDs: ["openfda_anti"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid — reduces renal clearance; raises levels.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Aminoglycosides — synergistic but additive nephrotoxicity.", citationIDs: ["openfda_anti"])
        ],
        nursingImplications: [
            AttributedBullet("Verify allergy history — clarify reaction (rash vs anaphylaxis) before giving any cephalosporin if penicillin allergy listed.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Surgical prophylaxis: ensure infusion completes within 60 minutes BEFORE incision.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Infuse over 30 minutes; rapid IV push can cause vein irritation.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Monitor for new diarrhea — consider C. difficile.", citationIDs: ["openrn_pharm_anti"])
        ],
        patientTeaching: AttributedProse(
            "Complete the full course as directed. Report severe diarrhea, rash, swelling, or trouble breathing. Tell every provider about your allergy history.",
            citationIDs: ["openrn_pharm_anti"]
        ),
        citations: [openfda, openrn, cdcAntibioticStewardship],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sulfamethoxazole-Trimethoprim (Bactrim)

public enum BactrimSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sulfamethoxazole-trimethoprim",
        title: "Sulfamethoxazole-Trimethoprim",
        subtitle: "Bactrim · Septra · TMP-SMX · sulfa antibiotic combination",
        category: "Sulfonamide / Folate Antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Sulfonamide + folate antagonist"),
            KeyValueRow(key: "Spectrum", value: "UTI organisms, MRSA (skin), PJP, Stenotrophomonas, some MSSA"),
            KeyValueRow(key: "Half-life", value: "TMP 8–10 hr · SMX 10 hr"),
            KeyValueRow(key: "Tablet strengths", value: "SS = 80/400 mg · DS = 160/800 mg")
        ],
        indications: AttributedProse(
            "Uncomplicated UTI (first-line in many regions), prostatitis, MRSA skin/soft-tissue infections, Pneumocystis jirovecii pneumonia (PJP) treatment and prophylaxis, traveler's diarrhea, otitis media, certain pneumonias.",
            citationIDs: ["openfda_anti"]
        ),
        mechanism: AttributedProse(
            "Sulfamethoxazole inhibits dihydropteroate synthase; trimethoprim inhibits dihydrofolate reductase. Sequential block of bacterial folate synthesis is synergistically bactericidal.",
            citationIDs: ["openfda_anti", "openrn_pharm_anti"]
        ),
        dosing: [
            DosingBlock(label: "Uncomplicated UTI", body: "1 DS tablet (160/800 mg) PO BID × 3 days (women) or 7–14 days (men, complicated).", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "MRSA skin infection", body: "1–2 DS tablets PO BID × 5–14 days based on severity.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "PJP treatment", body: "15–20 mg/kg/day TMP component IV/PO divided every 6–8 hours × 21 days.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "PJP prophylaxis", body: "1 SS or DS tablet PO daily, or 1 DS PO three times weekly.", citationIDs: ["openfda_anti"])
        ],
        contraindications: AttributedProse(
            "Sulfa allergy, megaloblastic anemia from folate deficiency, pregnancy at term and infants <2 months (kernicterus risk), severe hepatic or renal impairment, history of drug-induced thrombocytopenia.",
            citationIDs: ["openfda_anti"]
        ),
        warnings: [
            AttributedBullet("Hypersensitivity reactions including SJS/TEN, fulminant hepatic necrosis, blood dyscrasias — discontinue at first sign of rash.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Hyperkalemia — TMP has potassium-sparing effect; risk especially in elderly, renal impairment, ACEi/ARB.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Hypoglycemia, especially in elderly and patients on sulfonylureas.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Photosensitivity — counsel sunscreen.", citationIDs: ["openfda_anti"])
        ],
        adverseReactions: AttributedProse(
            "Rash (common), nausea, diarrhea, hyperkalemia, hyponatremia, AKI, photosensitivity, blood dyscrasias (rare but serious), SJS/TEN (rare).",
            citationIDs: ["openfda_anti"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — significantly increases INR; monitor.", citationIDs: ["openfda_anti"]),
            AttributedBullet("ACE inhibitors, ARBs, K-sparing diuretics, K supplements — additive hyperkalemia.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Sulfonylureas — additive hypoglycemia.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Methotrexate — additive folate antagonism, marrow toxicity.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Phenytoin — Bactrim raises levels.", citationIDs: ["openfda_anti"])
        ],
        nursingImplications: [
            AttributedBullet("Verify allergy history — sulfa allergy is a hard contraindication.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Encourage hydration — reduces crystalluria/renal stones.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Monitor potassium and creatinine, especially in elderly and on ACEi/ARB/spironolactone.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Discontinue and notify provider for any new rash — risk of SJS.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Counsel on photoprotection.", citationIDs: ["openrn_pharm_anti"])
        ],
        patientTeaching: AttributedProse(
            "Drink plenty of water. Use sunscreen and avoid prolonged sun. Stop and call your provider for ANY new rash. Complete the full course. Report unusual bleeding, severe diarrhea, or weakness.",
            citationIDs: ["openrn_pharm_anti"]
        ),
        citations: [openfda, openrn, cdcAntibioticStewardship],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Acyclovir

public enum AcyclovirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "acyclovir",
        title: "Acyclovir",
        subtitle: "Zovirax · nucleoside analog antiviral",
        category: "Antiviral",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nucleoside analog"),
            KeyValueRow(key: "Spectrum", value: "HSV-1, HSV-2, VZV (chickenpox, shingles)"),
            KeyValueRow(key: "Half-life", value: "~3 hr (longer in renal impairment)"),
            KeyValueRow(key: "IV form risk", value: "Crystalline nephropathy — hydrate well")
        ],
        indications: AttributedProse(
            "Genital herpes (initial and suppressive), herpes zoster (shingles), varicella (chickenpox in immunocompromised or adults), HSV encephalitis (IV), neonatal herpes (IV), HSV in immunocompromised.",
            citationIDs: ["openfda_anti"]
        ),
        mechanism: AttributedProse(
            "Activated by viral thymidine kinase to acyclovir triphosphate, which inhibits viral DNA polymerase and is incorporated into viral DNA, terminating replication. Selective for virus-infected cells.",
            citationIDs: ["openfda_anti", "openrn_pharm_anti"]
        ),
        dosing: [
            DosingBlock(label: "Genital HSV (initial)", body: "400 mg PO TID × 7–10 days.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Genital HSV (suppression)", body: "400 mg PO BID.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Herpes zoster", body: "800 mg PO 5 times daily × 7–10 days; start within 72 hours of rash onset.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "HSV encephalitis", body: "10 mg/kg IV every 8 hours × 14–21 days.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Renal impairment", body: "Dose reduction required when CrCl <50.", citationIDs: ["openfda_anti"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to acyclovir or valacyclovir.",
            citationIDs: ["openfda_anti"]
        ),
        warnings: [
            AttributedBullet("Crystalline nephropathy with rapid IV infusion or dehydration — infuse over at least 1 hour and ensure adequate hydration.", citationIDs: ["openfda_anti", "openrn_pharm_anti"]),
            AttributedBullet("Neurotoxicity (tremor, confusion, hallucinations, seizures) especially in renal impairment.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Thrombotic thrombocytopenic purpura / hemolytic uremic syndrome (TTP/HUS) reported in immunocompromised.", citationIDs: ["openfda_anti"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, vomiting, headache, malaise, IV: phlebitis at site, AKI, neurotoxicity. Topical: stinging.",
            citationIDs: ["openfda_anti"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid — reduces renal clearance, raises levels.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Other nephrotoxins (NSAIDs, aminoglycosides, contrast) — additive renal injury.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Mycophenolate, tenofovir — possible additive nephrotoxicity.", citationIDs: ["openfda_anti"])
        ],
        nursingImplications: [
            AttributedBullet("Hydrate well — IV at least 1 L over the infusion plus more for several hours after; PO encourage 2–3 L/day.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Infuse IV over at least 60 minutes — never bolus.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Monitor renal function (BUN/creatinine) and urine output.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Start within 72 hours of zoster rash for best benefit.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Lesions remain contagious until crusted; standard plus contact precautions for disseminated zoster or in immunocompromised.", citationIDs: ["cdc_antibiotic_stewardship"])
        ],
        patientTeaching: AttributedProse(
            "Drink plenty of water. Start as soon as you feel a herpes outbreak coming on for best effect. Do not share towels/linens during an outbreak. Suppressive therapy reduces but does not eliminate transmission.",
            citationIDs: ["openrn_pharm_anti"]
        ),
        citations: [openfda, openrn, cdcAntibioticStewardship],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fluconazole

public enum FluconazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "fluconazole",
        title: "Fluconazole",
        subtitle: "Diflucan · triazole antifungal",
        category: "Antifungal (Triazole)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Triazole antifungal"),
            KeyValueRow(key: "Spectrum", value: "Candida (most species), Cryptococcus, Coccidioides"),
            KeyValueRow(key: "Half-life", value: "~30 hr (once-daily dosing)"),
            KeyValueRow(key: "Bioavailability", value: ">90% PO — IV/PO bioequivalent")
        ],
        indications: AttributedProse(
            "Vulvovaginal candidiasis (single dose), oropharyngeal/esophageal candidiasis, candidemia and invasive candidiasis, cryptococcal meningitis (consolidation/maintenance), coccidioidomycosis. Prophylaxis in select immunocompromised patients.",
            citationIDs: ["openfda_anti"]
        ),
        mechanism: AttributedProse(
            "Inhibits fungal cytochrome P450 14α-demethylase → blocks ergosterol synthesis → fungal cell membrane disruption.",
            citationIDs: ["openfda_anti", "openrn_pharm_anti"]
        ),
        dosing: [
            DosingBlock(label: "Vaginal candidiasis", body: "150 mg PO × 1.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Oropharyngeal candidiasis", body: "200 mg PO × 1, then 100 mg PO daily × 7–14 days.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Esophageal candidiasis", body: "200–400 mg PO/IV × 1, then 100–200 mg daily × 14–21 days.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Candidemia (non-neutropenic)", body: "800 mg PO/IV × 1, then 400 mg daily × at least 14 days after first negative blood culture.", citationIDs: ["openfda_anti"]),
            DosingBlock(label: "Renal impairment", body: "Reduce dose by 50% when CrCl <50.", citationIDs: ["openfda_anti"])
        ],
        contraindications: AttributedProse(
            "Concurrent QT-prolonging CYP3A4 substrates (e.g., cisapride, pimozide, quinidine, erythromycin). Hypersensitivity to azoles.",
            citationIDs: ["openfda_anti"]
        ),
        warnings: [
            AttributedBullet("Hepatotoxicity — monitor LFTs; discontinue if signs of hepatitis.", citationIDs: ["openfda_anti"]),
            AttributedBullet("QT prolongation and torsades, especially with electrolyte derangement or other QT-prolonging drugs.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Pregnancy — high doses associated with congenital anomalies; single 150 mg dose generally considered low-risk but minimize use in pregnancy.", citationIDs: ["openfda_anti"]),
            AttributedBullet("SJS/TEN reported.", citationIDs: ["openfda_anti"])
        ],
        adverseReactions: AttributedProse(
            "Headache, nausea, abdominal pain, diarrhea, rash, transient LFT elevation, rarely hepatotoxicity, QT prolongation, alopecia (high doses).",
            citationIDs: ["openfda_anti"]
        ),
        drugInteractions: [
            AttributedBullet("Warfarin — significantly increases INR.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Sulfonylureas — increases hypoglycemia risk.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Phenytoin, carbamazepine — fluconazole raises levels.", citationIDs: ["openfda_anti"]),
            AttributedBullet("Statins (simvastatin, lovastatin) — risk of rhabdomyolysis.", citationIDs: ["openfda_anti"]),
            AttributedBullet("QT-prolonging drugs — additive QT effect.", citationIDs: ["openfda_anti"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline and periodic LFTs in prolonged use.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Review medication list for interactions — fluconazole inhibits multiple CYP enzymes.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Monitor INR if patient on warfarin.", citationIDs: ["openrn_pharm_anti"]),
            AttributedBullet("Counsel on completing course even if symptoms resolve.", citationIDs: ["openrn_pharm_anti"])
        ],
        patientTeaching: AttributedProse(
            "Take as directed; complete the course. Report yellow skin/eyes, dark urine, or right-sided abdominal pain. Tell your provider about all medications you take — fluconazole interacts with many.",
            citationIDs: ["openrn_pharm_anti"]
        ),
        citations: [openfda, openrn, cdcAntibioticStewardship],
        lastSourceFidelityReview: "2026-05-04"
    )
}
