import Foundation

// Curator-model drug entries (round 4 expansion).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC stewardship (public
// domain), IDSA / AHA / ACR / ISMP concept citations.

private let openfda = CitationSource(
    id: "openfda_round4",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_round4",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-05-04"
)
private let cdcStew = CitationSource(
    id: "cdc_stew_round4",
    shortName: "CDC Antibiotic Stewardship",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/antimicrobial-resistance/",
    lastRetrieved: "2026-05-04"
)
private let ismp = CitationSource(
    id: "ismp_round4",
    shortName: "ISMP List of High-Alert Medications, 2024",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)

// MARK: - Levofloxacin

public enum LevofloxacinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "levofloxacin",
        title: "Levofloxacin",
        subtitle: "Levaquin · respiratory fluoroquinolone",
        category: "Fluoroquinolone",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Fluoroquinolone (3rd generation)"),
            KeyValueRow(key: "Spectrum", value: "Strep pneumoniae (vs cipro), atypicals (Mycoplasma, Legionella, Chlamydia), gram-negatives, Pseudomonas, anthrax"),
            KeyValueRow(key: "Half-life", value: "~6–8 hr (once-daily dosing)"),
            KeyValueRow(key: "BLACK BOX", value: "Tendinitis, tendon rupture, peripheral neuropathy, CNS effects, aortic dissection, hypoglycemia, QT prolongation")
        ],
        indications: AttributedProse(
            "Community-acquired pneumonia, hospital-acquired pneumonia, complicated skin/soft-tissue infections, complicated UTIs/pyelonephritis, prostatitis, sinusitis (last-resort), acute exacerbation of chronic bronchitis, plague, anthrax (post-exposure).",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial DNA gyrase and topoisomerase IV → blocks DNA replication; bactericidal.",
            citationIDs: ["openfda_round4", "openrn_pharm_round4"]
        ),
        dosing: [
            DosingBlock(label: "CAP / sinusitis / chronic bronchitis", body: "750 mg PO/IV daily × 5 days (CAP), 7–14 days (sinusitis).", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Complicated UTI / pyelonephritis", body: "750 mg PO/IV daily × 5 days OR 250 mg daily × 10 days.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Renal adjustment", body: "Dose reduction required for CrCl <50; consult package insert.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to fluoroquinolones. History of myasthenia gravis (worsening). Caution in tendon disorder history.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("BOXED: tendinitis and tendon rupture (Achilles especially) — risk increased >60 yr, with steroids, transplant; STOP at first tendon pain.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: peripheral neuropathy — can be permanent; STOP at first symptom.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: CNS effects — confusion, agitation, seizures, depression; especially in elderly.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: aortic dissection / aneurysm — small but increased risk; avoid in patients with known aortic disease.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: hypoglycemia (especially with sulfonylureas / insulin) — and HYPERGLYCEMIA reported.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: avoid in mild-moderate infections where alternatives exist (sinusitis, bronchitis, uncomplicated UTI) — risk-benefit shifted.", citationIDs: ["openfda_round4"]),
            AttributedBullet("QT prolongation — avoid with other QT-prolonging drugs.", citationIDs: ["openfda_round4"]),
            AttributedBullet("C. difficile colitis.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "GI upset, headache, dizziness, photosensitivity, rash, tendinopathy, peripheral neuropathy, CNS effects, dysglycemia, QT prolongation, rare hepatotoxicity, rare aortic events.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Antacids, iron, calcium, magnesium, sucralfate, multivitamins — chelate; separate by ≥2 hours (give levofloxacin first).", citationIDs: ["openfda_round4"]),
            AttributedBullet("Corticosteroids — additive tendon rupture risk.", citationIDs: ["openfda_round4"]),
            AttributedBullet("QT-prolonging drugs (azithromycin, methadone, ondansetron, antipsychotics) — additive QT.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Sulfonylureas, insulin — increased hypoglycemia risk.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Warfarin — increased INR.", citationIDs: ["openfda_round4"]),
            AttributedBullet("NSAIDs — additive CNS / seizure risk.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel STOP and call for any tendon pain, especially Achilles — do not continue exercise.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Photoprotection — sunscreen and sun avoidance.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Separate from antacids/iron/calcium/dairy by 2 hours.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Monitor BP, ECG (QT) in at-risk patients.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Glucose checks in diabetics — both hypoglycemia and hyperglycemia possible.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel CNS effects in elderly — falls, confusion; reassess if new.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily. STOP immediately and call your provider for any tendon pain or swelling, numbness or tingling, mood changes, or rapid heartbeat. Drink water. Avoid sun. Don't take with milk, antacids, or iron pills within 2 hours.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn, cdcStew],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cefepime

public enum CefepimeSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cefepime",
        title: "Cefepime",
        subtitle: "Maxipime · 4th-generation cephalosporin · ICU/ED workhorse",
        category: "Cephalosporin (4th gen)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "4th-generation cephalosporin"),
            KeyValueRow(key: "Spectrum", value: "Broad gram-negative (incl. Pseudomonas), gram-positive (MSSA, strep), neutropenic fever"),
            KeyValueRow(key: "Half-life", value: "~2 hr"),
            KeyValueRow(key: "Common use", value: "Hospital-acquired pneumonia, neutropenic fever, complicated UTI, complicated intra-abdominal")
        ],
        indications: AttributedProse(
            "Severe pneumonia (HAP/VAP), febrile neutropenia, complicated UTI/pyelonephritis, complicated intra-abdominal infections (often combined with metronidazole), skin/soft-tissue infections, bacteremia.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Binds penicillin-binding proteins; inhibits cell-wall synthesis. Better gram-negative coverage than 3rd-gen, including Pseudomonas; resists many β-lactamases.",
            citationIDs: ["openfda_round4", "openrn_pharm_round4"]
        ),
        dosing: [
            DosingBlock(label: "Adult — usual", body: "1–2 g IV every 8–12 hours.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Febrile neutropenia / Pseudomonas", body: "2 g IV every 8 hours.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Renal adjustment", body: "Significant renal dose adjustment required at CrCl <60; consult package insert. Cefepime accumulation in renal impairment is the main cause of cefepime neurotoxicity.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Severe (anaphylactic, SJS/TEN) penicillin or cephalosporin reaction. Hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("CEFEPIME NEUROTOXICITY — encephalopathy, myoclonus, seizures, NCSE; especially in renal impairment with under-dosed adjustment. Often missed; consider in any patient on cefepime with new AMS.", citationIDs: ["openfda_round4"]),
            AttributedBullet("C. difficile colitis.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Hypersensitivity, including SJS/TEN (rare).", citationIDs: ["openfda_round4"]),
            AttributedBullet("Coombs-positive hemolytic anemia (rare).", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, rash, transient transaminitis, eosinophilia, injection-site reaction, rare neurotoxicity, rare hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Aminoglycosides — additive nephrotoxicity but synergistic.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Other nephrotoxins — additive renal injury.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Probenecid — reduced clearance.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Verify renal function on initiation and during therapy — under-adjusted dose causes neurotoxicity.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Recognize cefepime-induced encephalopathy — new AMS, myoclonus, or seizures in patient on cefepime warrants review of dosing relative to renal function.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Infuse over 30 minutes; verify allergy history.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Monitor for new diarrhea (C. difficile).", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "This is a strong IV antibiotic for serious infection. Tell us if you notice confusion, muscle twitching, rash, or severe diarrhea. We'll watch your kidney function while you're on it.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn, cdcStew],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Linezolid

public enum LinezolidSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "linezolid",
        title: "Linezolid",
        subtitle: "Zyvox · oxazolidinone · MRSA + VRE",
        category: "Oxazolidinone",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Oxazolidinone (synthetic protein synthesis inhibitor)"),
            KeyValueRow(key: "Spectrum", value: "MRSA, VRE, gram-positives broadly; reserve for resistant organisms"),
            KeyValueRow(key: "Half-life", value: "~5–7 hr"),
            KeyValueRow(key: "Black box", value: "Serotonin syndrome with serotonergic agents · MAOI activity")
        ],
        indications: AttributedProse(
            "VRE infections (E. faecium), nosocomial pneumonia (incl. MRSA), complicated skin/soft-tissue infections (incl. MRSA), community-acquired MRSA pneumonia. Often used when vancomycin not appropriate.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Binds 23S ribosomal RNA of 50S subunit → inhibits formation of 70S initiation complex → blocks protein synthesis. Bacteriostatic vs staph/strep; bactericidal vs strep.",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "600 mg PO/IV every 12 hours × 10–14 days (variable by indication).", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "VRE / pneumonia / SSSI", body: "Same — 600 mg q12h.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Renal / hepatic", body: "No adjustment for renal failure; mild–moderate hepatic OK.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Concurrent or recent (within 14 days) MAOI use. Hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("BOXED: SEROTONIN SYNDROME — linezolid is a weak MAOI; concurrent SSRIs, SNRIs, TCAs, MAOIs, tramadol, meperidine, fentanyl, triptans, methylene blue is HIGH risk. Hold serotonergic agent or use alternative antibiotic when possible.", citationIDs: ["openfda_round4"]),
            AttributedBullet("MYELOSUPPRESSION — particularly thrombocytopenia, with prolonged use (>14 days) or pre-existing low counts. Monitor CBC weekly.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Peripheral and optic neuropathy — with prolonged use; STOP at first signs.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Lactic acidosis — rare; mitochondrial toxicity.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Hypertensive crisis with tyramine-rich foods (aged cheese, fermented, cured meat, draft beer) — counsel low-tyramine diet.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Headache, GI upset, thrombocytopenia (most common with prolonged use), anemia, neutropenia, neuropathy, lactic acidosis (rare).",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Serotonergic agents (SSRIs, SNRIs, TCAs, MAOIs, tramadol, meperidine, fentanyl, triptans, methylene blue) — serotonin syndrome.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Sympathomimetics (pseudoephedrine, phenylephrine) — hypertensive crisis.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Tyramine-rich foods — hypertensive crisis.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Review medication list for serotonergic / sympathomimetic agents BEFORE starting; coordinate with provider to hold or switch.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel low-tyramine diet (avoid aged cheeses, cured meats, fermented soy, draft beer).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Weekly CBC during treatment >2 weeks.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Monitor for serotonin syndrome — agitation, hyperthermia, clonus, autonomic instability.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Excellent oral bioavailability — IV/PO equivalent dosing; transition to oral when patient tolerates.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Tell every provider you're on this — many other drugs interact dangerously. Avoid aged cheeses, cured meats, fermented foods, and draft beer. Stop and call for fever, agitation, racing heart, or numbness/tingling.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn, cdcStew],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Clindamycin

public enum ClindamycinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clindamycin",
        title: "Clindamycin",
        subtitle: "Cleocin · lincosamide · MRSA + anaerobes + dental",
        category: "Lincosamide",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Lincosamide"),
            KeyValueRow(key: "Spectrum", value: "Gram-positives (MSSA, MRSA community, strep), anaerobes (above the diaphragm), Bacteroides, dental flora; toxin-suppression in Group A strep"),
            KeyValueRow(key: "Half-life", value: "~3 hr"),
            KeyValueRow(key: "Notable risk", value: "C. difficile colitis (highest of common antibiotics)")
        ],
        indications: AttributedProse(
            "Skin and soft-tissue infections (MRSA), aspiration pneumonia, dental infections, gynecologic infections, osteomyelitis, bacterial vaginosis, dental endocarditis prophylaxis (penicillin alternative), Group A strep with toxic shock (anti-toxin effect), severe necrotizing fasciitis.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Binds 50S ribosomal subunit → inhibits protein synthesis. Bacteriostatic. Suppresses bacterial toxin production (especially Group A strep).",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "Mild-moderate (oral)", body: "150–450 mg PO every 6 hours.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Severe (IV)", body: "600–900 mg IV every 8 hours.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Endocarditis prophylaxis", body: "600 mg PO 30–60 min before procedure (penicillin alternative).", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "BV (vaginal)", body: "2% cream intravaginally at bedtime × 7 nights.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Caution in history of GI disease (especially colitis) — increased C. diff risk.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("BOXED: SEVERE COLITIS / C. difficile-associated diarrhea — clindamycin has the highest CDAD risk among common antibiotics; counsel and monitor.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Hypersensitivity reactions — including SJS/TEN, DRESS.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Pseudomembranous colitis can occur during therapy or up to 2 months after.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Esophagitis / esophageal ulceration — take with full glass of water.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (very common — sometimes severe), nausea, abdominal pain, rash, transient transaminitis, esophagitis (oral), candidiasis. Rare: SJS/TEN, agranulocytosis, hepatotoxicity.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Erythromycin — antagonism (do not combine).", citationIDs: ["openfda_round4"]),
            AttributedBullet("Neuromuscular blockers — additive paralysis.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Live oral vaccines (typhoid, BCG) — reduced efficacy.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Take WITH a full glass of water and remain upright — esophagitis risk.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("STRONG counseling about diarrhea — call IMMEDIATELY for severe or persistent diarrhea (C. diff often presents during therapy or weeks after).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Take with food to reduce GI upset.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("In Group A strep necrotizing fasciitis or toxic shock — clindamycin is added for ANTI-TOXIN effect alongside other antibiotic; do not omit.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("In MRSA SSTI, verify community resistance pattern locally.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take with a full glass of water. Stay upright for 30 minutes. Take with food if it upsets your stomach. STOP and call right away for severe diarrhea — even weeks after finishing the course. Complete the full prescription.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn, cdcStew],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Voriconazole

public enum VoriconazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "voriconazole",
        title: "Voriconazole",
        subtitle: "Vfend · triazole antifungal · invasive aspergillus",
        category: "Triazole Antifungal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation triazole"),
            KeyValueRow(key: "Spectrum", value: "Aspergillus (FIRST-LINE), Candida (incl. some non-albicans), Fusarium, Scedosporium"),
            KeyValueRow(key: "Half-life", value: "~6 hr (variable by metabolism)"),
            KeyValueRow(key: "Therapeutic monitoring", value: "Trough levels recommended (target 1–5.5 mcg/mL)")
        ],
        indications: AttributedProse(
            "Invasive aspergillosis (first-line). Esophageal candidiasis. Candidemia in non-neutropenic. Serious fungal infections caused by susceptible Scedosporium and Fusarium. Empiric therapy in neutropenic fever with persistent fevers despite antibiotics.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Inhibits fungal cytochrome P450 14α-demethylase → blocks ergosterol synthesis → fungal cell membrane disruption. Wider spectrum and better Aspergillus activity than fluconazole.",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "Loading (IV)", body: "6 mg/kg IV every 12 hours × 2 doses (24 hours).", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Maintenance (IV)", body: "4 mg/kg IV every 12 hours.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Oral", body: "200 mg PO every 12 hours; can increase to 300 mg if inadequate response.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Hepatic / renal", body: "Hepatic adjustment for moderate; AVOID IV in severe renal impairment (cyclodextrin vehicle accumulates) — use oral.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Concurrent CYP3A4 substrates with QT-prolonging effect (e.g., pimozide, quinidine, lurasidone). Concurrent rifampin, carbamazepine, long-acting barbiturates, ritonavir 400 mg BID, sirolimus, ergot alkaloids. Pregnancy. Hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — monitor LFTs; can be severe; discontinue if signs of injury.", citationIDs: ["openfda_round4"]),
            AttributedBullet("VISUAL DISTURBANCES — common (photophobia, blurred vision, color changes); usually transient; counsel.", citationIDs: ["openfda_round4"]),
            AttributedBullet("QT prolongation; arrhythmias; cardiac.", citationIDs: ["openfda_round4"]),
            AttributedBullet("PHOTOSENSITIVITY and skin cancer risk with prolonged use — counsel sun avoidance and dermatology surveillance for >12-week courses.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Periostitis with prolonged use — fluoride accumulation.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Many drug interactions — voriconazole is potent CYP inhibitor.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Visual disturbances, hepatic injury, rash, photosensitivity, hallucinations, peripheral edema, nausea/vomiting.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Substantial CYP3A4 inhibition — many interactions; review carefully before starting.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Statins (simvastatin, lovastatin) — rhabdo risk; switch to rosuvastatin or pravastatin.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Tacrolimus, cyclosporine, sirolimus — significantly raised; reduce dose dramatically.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Warfarin — increased INR.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Phenytoin — bidirectional interaction.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Trough drug levels (TDM) recommended — wide variability in metabolism (CYP2C19 polymorphism); target 1–5.5 mcg/mL.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Take 1 hour BEFORE or AFTER meals for oral (food reduces absorption).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel about visual disturbances and to avoid driving at night.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Skin cancer surveillance for prolonged courses; sun avoidance.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Review entire med list — interaction profile is extensive.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("LFT monitoring at baseline, weekly initially.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take 1 hour before or after meals. You may notice changes in vision, especially light sensitivity — this is usually temporary but tell us. Use sunscreen and avoid sun exposure. Tell every provider you're on this — many medications interact dangerously.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Hydrocodone-Acetaminophen

public enum HydrocodoneAPAPSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hydrocodone-acetaminophen",
        title: "Hydrocodone-Acetaminophen",
        subtitle: "Norco · Vicodin · Lortab · most-prescribed opioid combo (Schedule II)",
        category: "Opioid + Acetaminophen Combination",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "μ-opioid agonist + acetaminophen"),
            KeyValueRow(key: "Onset", value: "30 min PO"),
            KeyValueRow(key: "Half-life", value: "Hydrocodone ~4 hr; APAP ~2 hr"),
            KeyValueRow(key: "Dose ceiling", value: "ACETAMINOPHEN 4 g/day max — many products combine 5/325, 7.5/325, 10/325")
        ],
        indications: AttributedProse(
            "Moderate-to-moderately-severe pain when alternative options (NSAIDs, acetaminophen alone, regional, multimodal) are inadequate or contraindicated.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Hydrocodone — μ-opioid receptor agonist providing analgesia, sedation, respiratory depression. Acetaminophen — central COX inhibitor; analgesic, antipyretic; weak peripheral effect.",
            citationIDs: ["openfda_round4", "openrn_pharm_round4"]
        ),
        dosing: [
            DosingBlock(label: "Adult (Norco 5/325 or 7.5/325 or 10/325)", body: "1 tablet PO every 4–6 hours as needed; max acetaminophen component must NOT exceed 4 g/day.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Elderly / hepatic impairment", body: "Reduce to lowest effective dose; consider acetaminophen-only alternatives.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Severe respiratory depression, acute or severe asthma, GI obstruction (paralytic ileus). Concurrent or recent (14 days) MAOI. Severe hepatic disease (acetaminophen risk). Hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("BOXED: addiction, abuse, misuse — Schedule II controlled substance.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: respiratory depression — assess prior to and within 24–72 hours of initiation; risk highest in opioid-naive, elderly, debilitated, hepatic/renal impairment.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: combining with benzodiazepines or other CNS depressants → fatal respiratory depression.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: ACETAMINOPHEN HEPATOTOXICITY — many patients exceed 4 g/day inadvertently from combination products + OTC; counsel carefully.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Constipation — common; bowel regimen prophylactically.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Neonatal opioid withdrawal syndrome with prolonged maternal use.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, nausea, constipation, dizziness, respiratory depression, dependence, allergic reaction (rare), acetaminophen-induced hepatic injury at high doses.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Benzodiazepines, alcohol, sleep aids, gabapentin/pregabalin — additive respiratory depression.", citationIDs: ["openfda_round4"]),
            AttributedBullet("MAOIs — serotonin syndrome / hypertensive crisis.", citationIDs: ["openfda_round4"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, ritonavir, clarithromycin) — raise hydrocodone levels.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Other acetaminophen products — exceeds 4 g/day; counsel about hidden APAP in OTC cold/flu products.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Assess pain (numeric scale), sedation (Pasero scale), and respiratory rate before each dose; have naloxone available.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("ACETAMINOPHEN ceiling — track total APAP from this product PLUS any OTC (Tylenol, cold/flu products); max 4 g/day (3 g/day in elderly or chronic alcohol use).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Bowel regimen (docusate + senna) at start.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel storage (locked) and risk of pediatric ingestion.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Naloxone co-prescribing for higher-risk patients.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take only as directed. Do NOT take additional Tylenol, NyQuil, or any cold/flu products without checking with your provider — they often contain acetaminophen and you can damage your liver. Don't combine with alcohol or sleep aids. Store locked. Report severe drowsiness or trouble breathing. Naloxone (Narcan) at home is recommended.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cetirizine

public enum CetirizineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cetirizine",
        title: "Cetirizine",
        subtitle: "Zyrtec · second-generation H1 antihistamine · OTC",
        category: "Second-generation Antihistamine",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation H1 antagonist"),
            KeyValueRow(key: "Onset", value: "30–60 min"),
            KeyValueRow(key: "Half-life", value: "~8–10 hr (once-daily)"),
            KeyValueRow(key: "Sedation", value: "Less than first-gen (diphenhydramine) but more than fexofenadine/loratadine")
        ],
        indications: AttributedProse(
            "Allergic rhinitis (seasonal and perennial), urticaria, allergic conjunctivitis. Adjunct in mild allergic reactions / mild anaphylaxis (NOT a substitute for epinephrine).",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Selective H1 receptor antagonist; blocks histamine-mediated vasodilation, increased capillary permeability, smooth-muscle contraction. Less CNS penetration than first-generation antihistamines (less sedation).",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "Adult / ≥6 years", body: "10 mg PO once daily.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Pediatric 2–5 years", body: "2.5 mg PO daily, may increase to 5 mg.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Pediatric 6 months – 23 months", body: "2.5 mg PO daily.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Renal / hepatic adjustment", body: "Reduce dose to 5 mg daily for CrCl <30 or hepatic impairment.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to cetirizine, levocetirizine, hydroxyzine.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("Can cause SEDATION (more than fexofenadine/loratadine; less than diphenhydramine) — counsel re: driving until effects known.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Anticholinergic effects (mild) — dry mouth, urinary retention; caution in elderly per Beers Criteria.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Withdrawal pruritus — chronic users who stop may develop intense itching; resolves over weeks.", citationIDs: ["openrn_pharm_round4"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, dry mouth, fatigue, headache, GI upset.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("CNS depressants (alcohol, opioids, benzodiazepines) — additive sedation.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Other anticholinergics — additive effects.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("OTC; counsel correct dose for pediatric weight.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("In elderly, use cautiously (Beers — anticholinergic).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("NOT a substitute for epinephrine in anaphylaxis — provides histamine blockade for skin/mucosal symptoms but does not treat shock or airway.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel withdrawal pruritus — taper rather than abrupt stop in chronic users.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take once a day. May make you drowsy — try first dose at home. Avoid alcohol. If used long-term, talk to your provider before stopping (some people get severe itching when they stop suddenly).",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tacrolimus

public enum TacrolimusSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tacrolimus",
        title: "Tacrolimus",
        subtitle: "Prograf · Astagraf · calcineurin inhibitor · transplant immunosuppression",
        category: "Calcineurin Inhibitor (Immunosuppressant)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Calcineurin inhibitor"),
            KeyValueRow(key: "Onset", value: "Hours; effect over weeks"),
            KeyValueRow(key: "Half-life", value: "~12 hr (immediate-release)"),
            KeyValueRow(key: "Therapeutic monitoring", value: "Trough levels (target varies by indication and time post-transplant)")
        ],
        indications: AttributedProse(
            "Solid organ transplant rejection prophylaxis (kidney, liver, heart, lung). Atopic dermatitis (topical). Off-label: ulcerative colitis, lupus nephritis, refractory IBD.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Binds FKBP-12 → inhibits calcineurin → reduces IL-2 production and T-cell activation. Net immunosuppression.",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "Initial transplant", body: "Variable by organ and protocol; typically 0.075–0.15 mg/kg/day PO divided BID.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Maintenance", body: "Adjusted to target trough levels (typically 5–15 ng/mL early, lower later).", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Levels", body: "Trough drawn 12 hr after dose (immediate-release) before next dose.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to tacrolimus or cyclodextrin (IV vehicle).",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("BOXED: increased risk of infections (opportunistic — CMV, BK, EBV, fungal, JC virus PML) and malignancy (lymphoma, skin cancer).", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: nephrotoxicity — can be acute or chronic; trough monitoring essential.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Diabetes — new-onset diabetes after transplant; monitor glucose.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Neurotoxicity — tremor, paresthesias, seizures, encephalopathy at higher levels.", citationIDs: ["openfda_round4"]),
            AttributedBullet("HTN, hyperK, hypoMg, hypocalcemia, hyperlipidemia.", citationIDs: ["openfda_round4"]),
            AttributedBullet("QT prolongation.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Tremor, headache, hypertension, hyperglycemia, hyperkalemia, nephrotoxicity, infection susceptibility, malignancy risk, GI upset, alopecia.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, diltiazem, ritonavir, grapefruit juice) — significantly RAISE levels; reduce dose.", citationIDs: ["openfda_round4"]),
            AttributedBullet("CYP3A4 inducers (rifampin, phenytoin, carbamazepine, St. John's wort) — significantly LOWER levels; rejection risk.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Other nephrotoxins (NSAIDs, aminoglycosides, vancomycin, IV contrast) — additive renal injury.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Live vaccines — contraindicated.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification at start, dose change, level result.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Trough levels at consistent timing — typically 12 hr post-dose, BEFORE next dose.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel STRICT med adherence; missed doses → rejection.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Avoid grapefruit juice; review every new medication for interactions.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel infection awareness — seek care for fever, cough, diarrhea, sores; PJP and CMV prophylaxis as ordered.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Skin cancer surveillance, sun protection.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("BP, glucose, K, Mg, renal function monitoring.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same times every day — never miss a dose. Avoid grapefruit juice. Wear sunscreen and a hat outside. Tell every provider, dentist, and pharmacist you take this — almost every other medication interacts. Watch for any infection symptoms and call right away. Get your blood work as scheduled.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sildenafil

public enum SildenafilSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sildenafil",
        title: "Sildenafil",
        subtitle: "Viagra · Revatio · PDE-5 inhibitor · CRITICAL nitrate interaction",
        category: "PDE-5 Inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Phosphodiesterase-5 inhibitor"),
            KeyValueRow(key: "Onset", value: "30–60 min"),
            KeyValueRow(key: "Half-life", value: "~4 hr"),
            KeyValueRow(key: "ABSOLUTE CONTRAINDICATION", value: "Concurrent NITRATES (any form, any dose) — fatal hypotension")
        ],
        indications: AttributedProse(
            "Erectile dysfunction (Viagra). Pulmonary arterial hypertension (Revatio).",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Inhibits PDE-5 → increased cGMP in smooth muscle → vasodilation. In erectile tissue (corpus cavernosum) and pulmonary vasculature.",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "ED", body: "50 mg PO 30–60 min before sexual activity; range 25–100 mg; max once daily.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "PAH (Revatio)", body: "20 mg PO TID; or per facility protocol.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Renal / hepatic / >65 / strong CYP3A4 inhibitor", body: "Start 25 mg.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "CONCURRENT NITRATES IN ANY FORM (sublingual, IV, transdermal, spray) — fatal hypotension. Recent (within 6 months) MI or stroke. Severe hepatic impairment. Severe hypotension. NAION (non-arteritic ischemic optic neuropathy) history. Hypersensitivity. Concurrent guanylate cyclase stimulators (riociguat).",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("FATAL NITRATE INTERACTION — sildenafil enhances nitrate-induced vasodilation; SBP can fall precipitously, leading to MI, stroke, death. Wait at least 24 hours after sildenafil before nitrates; 48 hours for tadalafil (longer half-life).", citationIDs: ["openfda_round4"]),
            AttributedBullet("Hypotension, especially with α-blockers (BPH meds — tamsulosin, doxazosin) and antihypertensives.", citationIDs: ["openfda_round4"]),
            AttributedBullet("PRIAPISM — erection >4 hours; emergency.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Sudden hearing loss — rare; STOP and seek evaluation.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Visual changes, NAION (rare).", citationIDs: ["openfda_round4"]),
            AttributedBullet("CYP3A4 inhibitors (azoles, macrolides, ritonavir) — significantly raise levels; reduce dose.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Headache, flushing, dyspepsia, nasal congestion, dizziness, visual changes (blue tinge, blurred), hearing loss (rare), priapism (rare).",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("NITRATES — absolutely contraindicated; document carefully.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Riociguat (PAH) — contraindicated.", citationIDs: ["openfda_round4"]),
            AttributedBullet("α-blockers (tamsulosin, doxazosin) — additive hypotension; separate by 4 hours.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Strong CYP3A4 inhibitors — raise levels significantly.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Grapefruit juice — modestly raises levels.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY NO NITRATE USE in patients prescribed sildenafil (any indication); patients on chronic ED meds may face emergencies — they should NOT receive nitroglycerin if they took sildenafil within 24 hr (or tadalafil within 48 hr).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("EMS / ED — ASK about ED meds before giving sublingual nitroglycerin; cardiac arrest from inadvertent combination is well-documented.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel about priapism — seek emergency care if erection >4 hours.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel about visual changes and sudden hearing loss — STOP and report.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Take 30–60 min before activity; high-fat meals delay onset.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "TELL every provider, EMS, or ED that you take this. NEVER take with any nitrate (nitroglycerin, isosorbide) — this combination can be fatal. If you have chest pain after taking this, do NOT take nitroglycerin; get to the ED immediately. Stop and seek care for prolonged erection (>4 hours), sudden vision loss, or hearing loss.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Dabigatran

public enum DabigatranSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dabigatran",
        title: "Dabigatran",
        subtitle: "Pradaxa · direct thrombin inhibitor (DOAC) · idarucizumab reversal",
        category: "DOAC — Direct Thrombin Inhibitor",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Direct thrombin inhibitor"),
            KeyValueRow(key: "Onset", value: "1–2 hours"),
            KeyValueRow(key: "Half-life", value: "12–17 hr"),
            KeyValueRow(key: "Reversal", value: "Idarucizumab (Praxbind) 5 g IV — specific reversal agent")
        ],
        indications: AttributedProse(
            "Stroke prevention in non-valvular AFib. DVT/PE treatment after 5–10 days of parenteral anticoagulation. DVT/PE secondary prevention. VTE prophylaxis after hip replacement.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Direct thrombin (factor IIa) inhibitor — binds free and clot-bound thrombin, preventing fibrin formation.",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "Non-valvular AFib (CrCl >30)", body: "150 mg PO BID.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "AFib (CrCl 15–30)", body: "75 mg PO BID.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "DVT/PE treatment", body: "150 mg PO BID after 5–10 days parenteral anticoagulation.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "VTE prophylaxis hip", body: "110 mg PO 1–4 hr post-op then 220 mg daily × 28–35 days.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Active major bleeding. Mechanical heart valves (RE-ALIGN trial — increased thromboembolism). CrCl <15. Hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("BOXED: discontinuation increases thrombotic risk.", citationIDs: ["openfda_round4"]),
            AttributedBullet("BOXED: spinal/epidural hematoma with neuraxial anesthesia or LP.", citationIDs: ["openfda_round4"]),
            AttributedBullet("DYSPEPSIA — common; may improve with food.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Renal impairment — dose-adjust carefully; AVOID at CrCl <15.", citationIDs: ["openfda_round4"]),
            AttributedBullet("CAPSULE INTEGRITY — DO NOT OPEN, CRUSH, OR CHEW (bioavailability dramatically increases → bleeding risk). Swallow whole.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Bleeding (major and minor), dyspepsia (~10%), nausea, GI bleeding (slightly higher than other DOACs).",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("P-gp inhibitors (ketoconazole, itraconazole, dronedarone) — raise dabigatran levels.", citationIDs: ["openfda_round4"]),
            AttributedBullet("P-gp inducers (rifampin) — lower levels; avoid combination.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Other anticoagulants/antiplatelets/NSAIDs — additive bleeding.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["ismp_round4"]),
            AttributedBullet("DO NOT OPEN/CRUSH/CHEW capsule — keep in original bottle/blister; absorb moisture if removed.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Verify renal function before initiation and during therapy.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Hold per protocol before procedures (typically 24–96 hours, longer for renal impairment or high-bleed-risk procedures).", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("REVERSAL for life-threatening bleed — IDARUCIZUMAB 5 g IV (two 2.5 g vials); specific antidote.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Bleeding precautions; counsel.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take twice daily with or without food — food may help if you have stomach upset. Swallow capsule WHOLE — never crush, chew, or open. Keep in original container. Do not stop without talking to provider. Tell every provider before any procedure or surgery.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn, ismp],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Eplerenone

public enum EplerenoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "eplerenone",
        title: "Eplerenone",
        subtitle: "Inspra · selective MRA · alternative to spironolactone (less anti-androgen)",
        category: "Mineralocorticoid Receptor Antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective mineralocorticoid receptor antagonist"),
            KeyValueRow(key: "Onset", value: "Hours; clinical effect over weeks"),
            KeyValueRow(key: "Half-life", value: "~4–6 hr"),
            KeyValueRow(key: "vs spironolactone", value: "Less anti-androgen activity (less gynecomastia / menstrual changes)")
        ],
        indications: AttributedProse(
            "Heart failure with reduced ejection fraction (especially post-MI with LV dysfunction). Hypertension. Often used in patients who cannot tolerate spironolactone gynecomastia.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Selective competitive antagonist at the mineralocorticoid (aldosterone) receptor. Less binding to androgen and progesterone receptors compared to spironolactone.",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "HF / post-MI", body: "Initial 25 mg PO daily, titrate to 50 mg daily in 4 weeks if K <5.0.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Hypertension", body: "Initial 50 mg PO daily; max 100 mg/day.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Renal adjustment", body: "Avoid if CrCl <50 (HTN) or <30 (HF); contraindicated at K >5.0.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Serum K >5.5. CrCl <30. Concurrent strong CYP3A4 inhibitors (ketoconazole, itraconazole). Type 2 diabetes with microalbuminuria (HTN indication only). Hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("HYPERKALEMIA — most serious risk; check K at baseline and 1 week, 1 month after initiation/dose change.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Renal impairment — accumulates; check creatinine.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Concurrent ACEi/ARB — additive hyperK; monitor.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Hyperkalemia, dizziness, fatigue, hypotension, GI upset. Less gynecomastia than spironolactone.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, ritonavir) — raise levels significantly; AVOID combination.", citationIDs: ["openfda_round4"]),
            AttributedBullet("ACE inhibitors, ARBs — additive hyperK.", citationIDs: ["openfda_round4"]),
            AttributedBullet("K supplements, K-rich salt substitutes — hyperK.", citationIDs: ["openfda_round4"]),
            AttributedBullet("NSAIDs — reduced antihypertensive effect, worsened renal function.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Monitor K and creatinine baseline, 1 week, monthly initially.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel against K supplements and K-rich salt substitutes.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Use over spironolactone when gynecomastia or menstrual side effects are problematic.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Hold and notify if K >5.5; may need dose reduction or discontinuation.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same time daily. Avoid potassium salt substitutes and high-potassium supplements. Get blood work as scheduled. Tell your provider about new medications.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ranolazine

public enum RanolazineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "ranolazine",
        title: "Ranolazine",
        subtitle: "Ranexa · chronic stable angina · adjunct after first-line",
        category: "Anti-Anginal (Late Sodium Current Inhibitor)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Late sodium current inhibitor"),
            KeyValueRow(key: "Onset", value: "Days"),
            KeyValueRow(key: "Half-life", value: "~7 hr"),
            KeyValueRow(key: "Niche", value: "Chronic angina inadequately controlled on β-blocker / CCB / nitrates")
        ],
        indications: AttributedProse(
            "Chronic stable angina, typically as add-on to β-blocker, CCB, or nitrate. Off-label: refractory ventricular tachycardia, diabetic neuropathy.",
            citationIDs: ["openfda_round4"]
        ),
        mechanism: AttributedProse(
            "Inhibits the late sodium current in cardiac myocytes → reduces intracellular calcium overload → reduces myocardial oxygen demand WITHOUT significant heart-rate or BP effect (unlike β-blockers, CCBs).",
            citationIDs: ["openfda_round4"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "Initial 500 mg PO BID; titrate to 1000 mg BID as needed.", citationIDs: ["openfda_round4"]),
            DosingBlock(label: "Hepatic / strong CYP3A4 inhibitor", body: "Avoid or significantly reduce.", citationIDs: ["openfda_round4"])
        ],
        contraindications: AttributedProse(
            "Cirrhosis (any). Concurrent strong CYP3A4 inhibitors (ketoconazole, itraconazole, ritonavir, clarithromycin). Concurrent QT-prolonging agents (some). Hypersensitivity.",
            citationIDs: ["openfda_round4"]
        ),
        warnings: [
            AttributedBullet("QT PROLONGATION — modest dose-dependent; baseline ECG and avoid combining with other QT prolongers.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Renal impairment — limited data; use cautiously.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Acute renal failure reported in severe renal impairment.", citationIDs: ["openfda_round4"])
        ],
        adverseReactions: AttributedProse(
            "Dizziness, headache, constipation, nausea, QT prolongation.",
            citationIDs: ["openfda_round4"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP3A4 inhibitors — contraindicated.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Moderate CYP3A4 inhibitors (diltiazem, verapamil, fluconazole) — limit ranolazine to 500 mg BID.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Digoxin, simvastatin — ranolazine raises levels.", citationIDs: ["openfda_round4"]),
            AttributedBullet("Other QT-prolonging drugs — additive.", citationIDs: ["openfda_round4"])
        ],
        nursingImplications: [
            AttributedBullet("Take with or without food; do NOT crush or split tablets.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Avoid grapefruit juice.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("Counsel that ranolazine does NOT relieve acute angina — keep nitroglycerin SL for breakthrough.", citationIDs: ["openrn_pharm_round4"]),
            AttributedBullet("ECG monitoring at baseline and after dose changes.", citationIDs: ["openrn_pharm_round4"])
        ],
        patientTeaching: AttributedProse(
            "Take twice a day. Do not crush or split tablets. Avoid grapefruit juice. Keep your nitroglycerin SL for chest pain — this medication is for prevention, not for acute attacks. Tell your provider about new medications.",
            citationIDs: ["openrn_pharm_round4"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
