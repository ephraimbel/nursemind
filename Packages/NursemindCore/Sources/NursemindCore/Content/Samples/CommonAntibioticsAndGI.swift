import Foundation

// Curator-model antibiotic + GI/respiratory drug entries (round 3 expansion).
// Sources: openFDA SPL (CC0), Open RN Nursing Pharmacology (CC BY 4.0), CDC
// antibiotic stewardship (public domain), IDSA/GOLD/GINA concept citations.

private let openfda = CitationSource(
    id: "openfda_round3a",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrn = CitationSource(
    id: "openrn_pharm_round3a",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=antibiotic+gastrointestinal+ppi",
    lastRetrieved: "2026-05-04"
)
private let cdcAB = CitationSource(
    id: "cdc_ab_round3a",
    shortName: "CDC Antibiotic Stewardship and Resistance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/antimicrobial-resistance/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Amoxicillin

public enum AmoxicillinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "amoxicillin",
        title: "Amoxicillin",
        subtitle: "Amoxil · Moxatag · aminopenicillin",
        category: "Aminopenicillin",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aminopenicillin (β-lactam)"),
            KeyValueRow(key: "Spectrum", value: "Strep, enterococci, H. flu, E. coli (susceptible), Listeria, oral anaerobes; H. pylori (in combo)"),
            KeyValueRow(key: "Half-life", value: "~1 hr")
            // TODO: restore note — KeyValueRow(key: "Note", value: "Most prescribed antibiotic in US outpatient")
        ],
        indications: AttributedProse(
            "Otitis media (first-line in pediatrics), sinusitis, strep pharyngitis (alternative when penicillin VK not used), pneumonia (community-acquired in select), UTIs (susceptible organisms), dental prophylaxis for endocarditis, H. pylori eradication (combination), Lyme disease.",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Binds bacterial penicillin-binding proteins → inhibits cell wall peptidoglycan cross-linking → bactericidal against actively dividing organisms.",
            citationIDs: ["openfda_round3a", "openrn_pharm_round3a"]
        ),
        dosing: [
            DosingBlock(label: "Adult — usual", body: "500 mg PO every 8 hours OR 875 mg PO every 12 hours.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Pediatric otitis / sinusitis / pharyngitis", body: "Per AAP guidance: weight-based; high-dose 80–90 mg/kg/day divided BID for AOM in many algorithms.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Endocarditis prophylaxis", body: "2 g PO 30–60 min before procedure (per AHA criteria).", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce dose / extend interval at CrCl <30; consult package insert.", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "History of severe (anaphylactic, SJS/TEN, serum sickness) penicillin or cephalosporin reaction. Hypersensitivity to amoxicillin.",
            citationIDs: ["openfda_round3a"]
        ),
        warnings: [
            AttributedBullet("Anaphylaxis — most serious reaction; risk increases with prior IgE-mediated penicillin reaction.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("MORBILLIFORM RASH in patients with viral illness (especially mononucleosis / EBV) — almost universal with amoxicillin in EBV; not a true allergy but document.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("C. difficile colitis can occur during or after therapy.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Hypersensitivity reactions — rash, urticaria, angioedema, SJS/TEN (rare).", citationIDs: ["openfda_round3a"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (common), nausea, vomiting, rash, vaginal candidiasis, mild transaminase elevation, rarely C. difficile colitis or anaphylaxis.",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid — reduces renal clearance, raises levels.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Allopurinol — increased risk of rash.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Methotrexate — amoxicillin can raise levels.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Oral contraceptives — theoretical reduction in efficacy; counsel backup contraception during course.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("CLARIFY allergy history — distinguish 'true' anaphylaxis from intolerance (GI upset, viral rash); the latter does not preclude future use.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Take with or without food; with food reduces GI upset.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Complete the full course even if symptoms resolve to prevent resistance and treatment failure.", citationIDs: ["cdc_ab_round3a"]),
            AttributedBullet("Monitor for new diarrhea — possible C. difficile.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Suspension: shake well, refrigerate, expires 14 days.", citationIDs: ["openrn_pharm_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Take at the same times each day until finished, even if you feel better. Take with food if it upsets your stomach. Refrigerate liquid form; throw out after 14 days. Stop and call your provider for severe diarrhea, rash, or trouble breathing.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn, cdcAB],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Amoxicillin-Clavulanate (Augmentin)

public enum AugmentinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "amoxicillin-clavulanate",
        title: "Amoxicillin-Clavulanate",
        subtitle: "Augmentin · β-lactam + β-lactamase inhibitor",
        category: "Aminopenicillin + β-lactamase inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aminopenicillin + clavulanic acid (β-lactamase inhibitor)"),
            KeyValueRow(key: "Spectrum", value: "Amoxicillin spectrum + β-lactamase-producing strains (H. flu, M. catarrhalis, anaerobes, Bacteroides, MSSA)"),
            KeyValueRow(key: "Half-life", value: "~1–1.5 hr"),
            KeyValueRow(key: "GI side effects", value: "More than amoxicillin alone (clavulanate-driven)")
        ],
        indications: AttributedProse(
            "Sinusitis (first-line for many adults), otitis media (especially recurrent or complicated), human/animal bite wounds, complicated UTI, intra-abdominal infections (oral when appropriate), aspiration pneumonia (community), some skin/soft-tissue infections.",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Amoxicillin inhibits cell-wall synthesis (bactericidal). Clavulanic acid binds and inactivates bacterial β-lactamases, restoring activity against β-lactamase-producing organisms.",
            citationIDs: ["openfda_round3a", "openrn_pharm_round3a"]
        ),
        dosing: [
            DosingBlock(label: "Adult (875/125 BID — most common)", body: "875 mg amoxicillin / 125 mg clavulanate PO every 12 hours.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Adult (500/125 TID)", body: "500/125 mg PO every 8 hours.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "High-dose (e.g., sinusitis)", body: "2000/125 mg PO every 12 hours (extended-release).", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Pediatric", body: "Weight-based; ratios chosen to minimize clavulanate dose (and GI side effects).", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce dose at CrCl <30.", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "Severe penicillin allergy. Prior cholestatic jaundice / hepatic dysfunction with amoxicillin-clavulanate (NOT all amoxicillin reactions). Hypersensitivity.",
            citationIDs: ["openfda_round3a"]
        ),
        warnings: [
            AttributedBullet("HEPATOTOXICITY — most common DILI in many series; cholestatic injury can occur weeks after course completion. Monitor LFTs in prolonged or repeat courses.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Diarrhea — substantially more than amoxicillin alone; consider probiotics; counsel patient.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("C. difficile colitis.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Anaphylaxis and hypersensitivity reactions.", citationIDs: ["openfda_round3a"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (very common), nausea, vomiting, vaginal candidiasis, rash, hepatotoxicity (especially cholestatic, sometimes delayed), C. difficile.",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Same as amoxicillin (probenecid, allopurinol-rash, methotrexate, oral contraceptives).", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Warfarin — increased INR.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("TAKE WITH FOOD — significantly reduces GI side effects (the clavulanate is the offender).", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Counsel about delayed-onset hepatic injury — yellowing of skin/eyes weeks after the course warrants evaluation.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Verify allergy and the specific reaction (diarrhea / rash / true anaphylaxis).", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Complete the full course; do not save leftovers for self-treatment.", citationIDs: ["cdc_ab_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Take at the START of a meal — this dramatically reduces stomach upset and diarrhea. Complete the full course. Stop and call your provider for yellowing of skin/eyes, severe diarrhea, or trouble breathing — and tell them you're on Augmentin.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn, cdcAB],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Cephalexin (Keflex)

public enum CephalexinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cephalexin",
        title: "Cephalexin",
        subtitle: "Keflex · 1st-generation oral cephalosporin",
        category: "Cephalosporin (1st gen, oral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "First-generation oral cephalosporin"),
            KeyValueRow(key: "Spectrum", value: "MSSA, strep, some gram-negatives (E. coli, Klebsiella, Proteus)"),
            KeyValueRow(key: "Half-life", value: "~1 hr"),
            KeyValueRow(key: "Common use", value: "Skin/soft-tissue infections, UTI, mastitis")
        ],
        indications: AttributedProse(
            "Uncomplicated skin and soft-tissue infections (cellulitis from MSSA or strep), UTI, prophylaxis for endocarditis (penicillin alternative), mastitis, otitis media (alternative).",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Inhibits bacterial cell wall synthesis by binding penicillin-binding proteins → bactericidal.",
            citationIDs: ["openfda_round3a"]
        ),
        dosing: [
            DosingBlock(label: "Adult — usual", body: "500 mg PO every 6 hours OR 250 mg every 6 hours for milder infections.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Pediatric", body: "Weight-based (25–100 mg/kg/day divided every 6–12 hours).", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce dose / extend interval at CrCl <50.", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "Severe (anaphylactic, SJS/TEN) cephalosporin or penicillin reaction. Hypersensitivity.",
            citationIDs: ["openfda_round3a"]
        ),
        warnings: [
            AttributedBullet("Cross-reactivity with penicillin allergy <2%; check the SPECIFIC reaction before assuming contraindication.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("C. difficile colitis.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Hypersensitivity, rash, anaphylaxis (rare).", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Seizures with very high doses in renal impairment.", citationIDs: ["openfda_round3a"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea, nausea, vomiting, rash, vaginal candidiasis; rare hypersensitivity; rare C. difficile.",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid — reduces renal clearance.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Metformin — cephalexin can raise levels; monitor in renal impairment.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel that 4×-daily dosing affects adherence — set reminders.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Take with or without food.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Suspension: shake well; refrigerate; 14-day shelf life.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Counsel on cellulitis warning signs — expanding redness, fever, streaking warrants follow-up.", citationIDs: ["openrn_pharm_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Take 4 times a day, evenly spaced. Finish the entire prescription. If your skin infection is worse, spreading, or you develop fever, call your provider — you may need a different antibiotic.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn, cdcAB],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Doxycycline

public enum DoxycyclineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "doxycycline",
        title: "Doxycycline",
        subtitle: "Vibramycin · tetracycline antibiotic",
        category: "Tetracycline",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Tetracycline (long-acting)"),
            KeyValueRow(key: "Spectrum", value: "Atypicals (Mycoplasma, Chlamydia, Rickettsia), Lyme (Borrelia), MRSA (community), CAP, acne, malaria prophylaxis"),
            KeyValueRow(key: "Half-life", value: "~16–22 hr (BID dosing)"),
            KeyValueRow(key: "Photosensitivity warning", value: "Counsel sunscreen and avoidance")
        ],
        indications: AttributedProse(
            "Lyme disease (first-line in adults), Rocky Mountain spotted fever, ehrlichiosis, anaplasmosis, atypical pneumonia (Mycoplasma, Chlamydia, Legionella), chlamydia (alt to azithromycin), pelvic inflammatory disease (in combo), severe acne, malaria prophylaxis, anthrax (post-exposure).",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Binds 30S ribosomal subunit → inhibits bacterial protein synthesis → bacteriostatic.",
            citationIDs: ["openfda_round3a"]
        ),
        dosing: [
            DosingBlock(label: "Adult — usual", body: "100 mg PO twice daily.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Severe / serious", body: "100 mg IV every 12 hours.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Acne", body: "50–100 mg PO daily.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Malaria prophylaxis", body: "100 mg PO daily, starting 1–2 days before travel, during, and 4 weeks after.", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (after first trimester); breastfeeding (relative — minimal transfer; current evidence does not require avoidance for short courses). Children <8 years (tooth discoloration, enamel hypoplasia, bone growth — though for some serious infections like RMSF, doxycycline is recommended even in young children per CDC). Hypersensitivity to tetracyclines.",
            citationIDs: ["openfda_round3a", "cdc_ab_round3a"]
        ),
        warnings: [
            AttributedBullet("Tooth discoloration / enamel hypoplasia — especially with prolonged or repeat exposure in <8 years; for short course of severe disease (RMSF) the benefit outweighs.", citationIDs: ["openfda_round3a", "cdc_ab_round3a"]),
            AttributedBullet("PHOTOSENSITIVITY — common; counsel sunscreen, hat, avoid mid-day sun.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Esophageal irritation / ulceration — TAKE UPRIGHT WITH FULL GLASS OF WATER, NOT AT BEDTIME.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Intracranial hypertension (pseudotumor cerebri) — rare but possible; visual changes, headache.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("C. difficile possible.", citationIDs: ["openfda_round3a"])
        ],
        adverseReactions: AttributedProse(
            "GI upset (nausea, vomiting, diarrhea), photosensitivity rash, candidiasis (oral, vaginal), tooth discoloration in young children, esophageal injury, rarely intracranial hypertension.",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Antacids, calcium, iron, zinc, magnesium, dairy — chelate doxycycline; reduce absorption. Separate by ≥2 hours.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Warfarin — increases INR.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Hormonal contraceptives — theoretical reduction (less than older sources suggested); backup contraception is reasonable during course.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("CYP3A4 inducers (rifampin, carbamazepine, phenytoin) — reduce doxycycline levels.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("Take WITH a full glass of water and remain UPRIGHT for at least 30 minutes — esophageal injury is preventable.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Take with food (improves tolerability without significantly impairing absorption — modern guidance).", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Separate from antacids/iron/calcium/dairy by 2 hours.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Counsel sunscreen, hat, sun avoidance during course and a week after.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("In Lyme disease — early oral course often curative; track erythema migrans resolution and constitutional symptoms.", citationIDs: ["openrn_pharm_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Take with a full glass of water and stay sitting up for 30 minutes. Take with food if it upsets your stomach. Use sunscreen — your skin will burn faster while on this medication. Don't take with milk, antacids, or iron/calcium pills within 2 hours. Stop and call for severe headache or vision changes.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn, cdcAB],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Nitrofurantoin (Macrobid)

public enum NitrofurantoinSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "nitrofurantoin",
        title: "Nitrofurantoin",
        subtitle: "Macrobid · Macrodantin · UTI-specific antibiotic",
        category: "Nitrofuran Antibiotic",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nitrofuran"),
            KeyValueRow(key: "Spectrum", value: "Uncomplicated UTI (E. coli, Enterococcus, S. saprophyticus). NOT useful for pyelonephritis (poor renal parenchymal levels)"),
            KeyValueRow(key: "Renal threshold", value: "AVOID if CrCl <60 (some sources <30); inadequate urine concentration"),
            KeyValueRow(key: "Common color change", value: "Dark/brown urine — harmless; counsel")
        ],
        indications: AttributedProse(
            "Uncomplicated cystitis (lower UTI). Long-term suppression for recurrent UTI. NOT for pyelonephritis or systemic infection — does not achieve therapeutic blood/tissue levels.",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Reduced inside bacteria to reactive intermediates that damage bacterial DNA, ribosomes, and other proteins. Concentrates in urine, hence its niche in cystitis.",
            citationIDs: ["openfda_round3a"]
        ),
        dosing: [
            DosingBlock(label: "Macrobid (sustained-release) — usual", body: "100 mg PO twice daily × 5 days for cystitis.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Macrodantin (immediate-release)", body: "50–100 mg PO four times daily × 7 days.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Suppression", body: "50–100 mg PO at bedtime.", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "CrCl <60 (some sources <30) — avoid; inadequate urinary concentration and increased toxicity. Pregnancy at term (38–42 weeks) — neonatal hemolysis. Infants <1 month — hemolytic anemia. G6PD deficiency. Hypersensitivity.",
            citationIDs: ["openfda_round3a"]
        ),
        warnings: [
            AttributedBullet("PULMONARY TOXICITY — acute (allergic pneumonitis: fever, cough, dyspnea within hours-days; reverses with discontinuation) OR chronic (interstitial fibrosis with prolonged use, may not reverse). Stop and notify provider for any new respiratory symptoms.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Hepatotoxicity — chronic use; cholestatic injury or chronic active hepatitis; check LFTs in long-term suppression.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Peripheral neuropathy — particularly with prolonged use, renal impairment, diabetes; potentially irreversible.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Hemolytic anemia in G6PD deficiency.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Avoid in pyelonephritis — does not work systemically.", citationIDs: ["openrn_pharm_round3a"])
        ],
        adverseReactions: AttributedProse(
            "Nausea, headache, brown/dark urine (harmless), photosensitivity, rare pulmonary toxicity, rare hepatotoxicity, rare neuropathy, hemolytic anemia in G6PD deficiency.",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Magnesium-containing antacids — reduce absorption.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Probenecid, sulfinpyrazone — reduce urinary excretion of nitrofurantoin (decreases efficacy in UTI).", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Quinolones — antagonism reported in vitro.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY this is uncomplicated cystitis — NOT pyelonephritis (fever, flank pain, vomiting). If pyelo suspected, switch antibiotic.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Verify renal function — avoid CrCl <60.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Take WITH FOOD or milk — improves absorption and tolerability.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Counsel that brown urine is normal and harmless.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Counsel to STOP and call for new cough or shortness of breath (acute pulmonary reaction).", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("In long-term suppression, monitor for chronic pulmonary, hepatic, neurologic toxicity.", citationIDs: ["openrn_pharm_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. Your urine may turn dark or brown — that's harmless. Stop and call your provider RIGHT AWAY if you develop a new cough or trouble breathing. Complete the full 5 days. If your back hurts or you develop fever during treatment, call — your infection may be in your kidneys and need a different antibiotic.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn, cdcAB],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Omeprazole

public enum OmeprazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "omeprazole",
        title: "Omeprazole",
        subtitle: "Prilosec · proton pump inhibitor (PPI)",
        category: "PPI",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Proton pump inhibitor"),
            KeyValueRow(key: "Onset", value: "1 hr; full effect 2–4 days"),
            KeyValueRow(key: "Half-life", value: "~1 hr (effect persists due to irreversible binding)")
            // TODO: restore note — KeyValueRow(key: "Administration", value: "Take 30–60 min before first meal of the day")
        ],
        indications: AttributedProse(
            "GERD, peptic ulcer disease, H. pylori eradication (combination), Zollinger-Ellison syndrome, NSAID-induced ulcer prevention, stress ulcer prophylaxis (off-label).",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Irreversibly binds H+/K+ ATPase ('proton pump') on parietal cells → suppresses gastric acid secretion. Effect lasts 24+ hours despite short plasma half-life.",
            citationIDs: ["openfda_round3a", "openrn_pharm_round3a"]
        ),
        dosing: [
            DosingBlock(label: "GERD / esophagitis", body: "20 mg PO daily × 4–8 weeks.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Peptic ulcer", body: "20–40 mg PO daily × 4–8 weeks.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "H. pylori (with antibiotics)", body: "20 mg PO BID × 10–14 days as part of combination.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Maintenance", body: "20 mg PO daily.", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to omeprazole or other PPIs. Concurrent rilpivirine.",
            citationIDs: ["openfda_round3a"]
        ),
        warnings: [
            AttributedBullet("Long-term use (>1 year) associated with: B12 deficiency, hypomagnesemia, osteoporosis-related fractures (hip, wrist, spine), increased C. diff risk, increased pneumonia risk, possible CKD.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Interaction with CLOPIDOGREL — omeprazole inhibits CYP2C19, reducing clopidogrel activation; pantoprazole preferred when PPI needed in patients on clopidogrel.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Acute interstitial nephritis (rare).", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Cutaneous lupus erythematosus / rebound acid hypersecretion when stopped.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("'PPI deprescribing' — re-evaluate need at 8 weeks; many can stop or step down.", citationIDs: ["openrn_pharm_round3a"])
        ],
        adverseReactions: AttributedProse(
            "Headache, abdominal pain, nausea, diarrhea, constipation; long-term: hypoMg, B12 deficiency, fracture risk, increased C. diff and pneumonia.",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Clopidogrel — reduces antiplatelet effect (use pantoprazole if PPI needed).", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Methotrexate — omeprazole can raise levels.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Drugs requiring acidic environment for absorption (ketoconazole, atazanavir, iron) — reduced absorption.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Warfarin — modest INR increase.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Tacrolimus — omeprazole can raise levels.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("Take 30–60 minutes before the FIRST meal of the day for best effect.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Capsules should be swallowed whole; can open and sprinkle on applesauce for swallowing difficulty (do not crush granules).", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Counsel re-evaluation at 8 weeks — long-term PPI is overused; assess if still needed.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("In patients on chronic PPI, consider Mg, B12, and fall-risk monitoring.", citationIDs: ["openrn_pharm_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Take 30–60 minutes before breakfast. Don't crush or chew the capsule. Plan to talk to your provider after 8 weeks about whether you still need it. Tell your provider if you take a heart medication called clopidogrel — a different acid medication may be safer.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tiotropium

public enum TiotropiumSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tiotropium",
        title: "Tiotropium",
        subtitle: "Spiriva · long-acting muscarinic antagonist (LAMA)",
        category: "LAMA Bronchodilator",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting muscarinic antagonist"),
            KeyValueRow(key: "Onset", value: "30 min"),
            KeyValueRow(key: "Duration", value: "24 hours (once-daily dosing)"),
            KeyValueRow(key: "Use", value: "Maintenance — NOT a rescue inhaler")
        ],
        indications: AttributedProse(
            "Maintenance treatment of COPD (reduces exacerbations). Approved for asthma in select patients (add-on to ICS-LABA when not controlled).",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Long-acting anticholinergic — selectively binds muscarinic M3 receptors on airway smooth muscle, blocking acetylcholine-mediated bronchoconstriction.",
            citationIDs: ["openfda_round3a", "openrn_pharm_round3a"]
        ),
        dosing: [
            DosingBlock(label: "Spiriva HandiHaler (capsule, dry powder)", body: "1 capsule (18 mcg) inhaled once daily — load capsule into device, do not swallow.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Spiriva Respimat (mist inhaler)", body: "2 inhalations (2.5 mcg each) once daily.", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity to tiotropium, ipratropium, or atropine derivatives.",
            citationIDs: ["openfda_round3a"]
        ),
        warnings: [
            AttributedBullet("NOT for acute exacerbation — use albuterol for rescue.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Acute angle-closure glaucoma — counsel symptoms.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Urinary retention, especially in BPH.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Paradoxical bronchospasm.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Renal impairment (CrCl <60) — monitor for systemic anticholinergic effects.", citationIDs: ["openfda_round3a"])
        ],
        adverseReactions: AttributedProse(
            "Dry mouth (most common), urinary retention, constipation, blurred vision, paradoxical bronchospasm (rare), candidiasis (rare).",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticholinergics — additive systemic anticholinergic effects.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("Verify patient understands MAINTENANCE — they still need albuterol for sudden symptoms.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("HandiHaler: capsule goes into the device — patient should NOT swallow capsule.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Use at the same time each day; rinse mouth after to reduce dry mouth.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Avoid spraying/exhaling near eyes — can precipitate angle closure.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Counsel that benefit accrues over weeks; assess inhaler technique each visit.", citationIDs: ["openrn_pharm_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Use once a day. The capsule goes INTO the device — never swallow it. This is your daily controller — keep using albuterol for sudden symptoms. Rinse your mouth after each use. Don't aim it at your eyes. Tell your provider about prostate problems or glaucoma.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Montelukast

public enum MontelukastSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "montelukast",
        title: "Montelukast",
        subtitle: "Singulair · leukotriene receptor antagonist",
        category: "Leukotriene Receptor Antagonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Leukotriene receptor antagonist (LTRA)"),
            KeyValueRow(key: "Onset", value: "Hours; clinical effect over days–weeks"),
            KeyValueRow(key: "Half-life", value: "~5 hr"),
            KeyValueRow(key: "Boxed warning", value: "Neuropsychiatric events — sleep disturbance, mood changes, suicidality (FDA 2020)")
        ],
        indications: AttributedProse(
            "Asthma maintenance (especially with allergic component, exercise-induced bronchospasm, allergic rhinitis-asthma overlap), allergic rhinitis. NOT a rescue.",
            citationIDs: ["openfda_round3a"]
        ),
        mechanism: AttributedProse(
            "Selective antagonist at the cysteinyl leukotriene CysLT1 receptor → blocks bronchoconstriction, mucus secretion, and inflammation mediated by leukotrienes.",
            citationIDs: ["openfda_round3a"]
        ),
        dosing: [
            DosingBlock(label: "Adult (asthma, allergic rhinitis)", body: "10 mg PO once daily in the evening.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Pediatric 6–14 years", body: "5 mg chewable PO once daily in the evening.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Pediatric 2–5 years", body: "4 mg chewable or granules PO once daily in the evening.", citationIDs: ["openfda_round3a"]),
            DosingBlock(label: "Exercise-induced bronchospasm", body: "10 mg PO at least 2 hours before exercise (do NOT use if already on daily montelukast).", citationIDs: ["openfda_round3a"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity. Phenylketonuria (chewable contains phenylalanine — confirm formulation).",
            citationIDs: ["openfda_round3a"]
        ),
        warnings: [
            AttributedBullet("BOXED WARNING (2020): SERIOUS NEUROPSYCHIATRIC EVENTS — agitation, depression, sleep disturbance, suicidal thoughts, behavior changes. Reserve for patients in whom benefit outweighs risk; counsel patient/family directly; discontinue and reassess if symptoms develop.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Hepatic dysfunction (rare).", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Eosinophilic conditions (Churg-Strauss / EGPA) reported, especially with steroid taper.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Not for acute asthma attack.", citationIDs: ["openfda_round3a"])
        ],
        adverseReactions: AttributedProse(
            "Headache, abdominal pain, dyspepsia, sleep disturbance, mood changes, agitation, depression, rare suicidal ideation, rare hepatic dysfunction, rare eosinophilic vasculitis.",
            citationIDs: ["openfda_round3a"]
        ),
        drugInteractions: [
            AttributedBullet("Phenobarbital, rifampin — reduce levels.", citationIDs: ["openfda_round3a"]),
            AttributedBullet("Gemfibrozil — increases levels.", citationIDs: ["openfda_round3a"])
        ],
        nursingImplications: [
            AttributedBullet("DIRECTLY counsel patient and family about neuropsychiatric warning — especially adolescents and parents of children.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Take in the evening for asthma; not a rescue.", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Continue inhaled corticosteroids (do not substitute montelukast for ICS).", citationIDs: ["openrn_pharm_round3a"]),
            AttributedBullet("Document baseline mood; reassess at each visit.", citationIDs: ["openrn_pharm_round3a"])
        ],
        patientTeaching: AttributedProse(
            "Take in the evening. Watch for changes in mood, sleep, or behavior — call your provider right away if you or your child notice depression, agitation, or thoughts of self-harm. This is for prevention; keep using your rescue inhaler for sudden symptoms.",
            citationIDs: ["openrn_pharm_round3a"]
        ),
        citations: [openfda, openrn],
        lastSourceFidelityReview: "2026-05-04"
    )
}
