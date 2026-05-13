import Foundation

// Curator-model drug entries (round 20 — STIs + GI + addiction medicine + immunizations).

private let openfdaR20 = CitationSource(
    id: "openfda_round20",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-12"
)
private let openrnPharmR20 = CitationSource(
    id: "openrn_pharm_round20",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=STI+addiction+vaccine",
    lastRetrieved: "2026-05-12"
)
private let cdcR20 = CitationSource(
    id: "cdc_round20",
    shortName: "CDC STI Treatment + ACIP Immunization Guidelines",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/std/treatment-guidelines/",
    lastRetrieved: "2026-05-12"
)
private let specialtyR20 = CitationSource(
    id: "specialty_round20",
    shortName: "SAMHSA / ASAM / ACIP concept citations",
    publisher: "SAMHSA · ASAM · ACIP",
    license: .factCitationOnly,
    url: "https://www.samhsa.gov/medications-substance-use-disorders",
    lastRetrieved: "2026-05-12"
)

public enum PenicillinGBenzathineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "penicillin-g-benzathine",
        title: "Penicillin G benzathine",
        subtitle: "Bicillin L-A · long-acting IM · syphilis + GAS prophylaxis · NEVER IV (fatal)",
        category: "Long-acting penicillin (IM only)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Long-acting penicillin (IM depot)"),
            KeyValueRow(key: "Indications", value: "Syphilis (all stages except neurosyphilis); secondary GAS prevention in rheumatic fever; group A strep pharyngitis selective"),
            KeyValueRow(key: "Boxed", value: "NOT FOR IV USE — IV administration is FATAL"),
            KeyValueRow(key: "Notable", value: "Dosing differs for early vs late syphilis; latent / tertiary requires 3 weekly doses")
        ],
        indications: AttributedProse(
            "Primary, secondary, and early latent syphilis; late latent + tertiary syphilis (3-dose course); congenital syphilis (with adjusted dosing); secondary prophylaxis of rheumatic fever; group A streptococcal pharyngitis (selective use) per CDC STI Treatment Guidelines 2021 per primary source.",
            citationIDs: ["openfda_round20", "cdc_round20"]
        ),
        mechanism: AttributedProse(
            "Beta-lactam — binds penicillin-binding proteins → inhibits bacterial cell wall synthesis → bactericidal. Benzathine ester gives slow depot release lasting 2–4 weeks per IM dose.",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "Primary / secondary / early latent syphilis", body: "2.4 million units IM × 1 (single dose) per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Late latent / tertiary syphilis (NOT neurosyphilis)", body: "2.4 million units IM weekly × 3 doses per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "NEUROSYPHILIS — NOT this drug", body: "Use aqueous crystalline penicillin G IV q4h × 10–14 days; benzathine penetrates CNS poorly per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Rheumatic fever prophylaxis", body: "1.2 million units IM every 3–4 weeks for years per primary source.", citationIDs: ["specialty_round20"]),
            DosingBlock(label: "Pediatric syphilis", body: "50,000 units/kg IM (max 2.4 million units); congenital syphilis uses aqueous penicillin G IV.", citationIDs: ["cdc_round20"])
        ],
        contraindications: AttributedProse(
            "Severe penicillin allergy (anaphylaxis history). Intravenous administration is ABSOLUTELY contraindicated — has caused cardiopulmonary arrest + death. Documented hypersensitivity to penicillins per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("BOXED — NOT FOR IV USE. IV administration causes cardiac arrest + death from inadvertent intra-arterial injection / embolic phenomena. ONLY IM, deep + slow injection per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Jarisch-Herxheimer reaction — fever + headache + myalgia within 24h of first syphilis treatment; counsel + acetaminophen; usually self-limited per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Anaphylaxis — penicillin most common drug allergy; ~10% report PCN allergy but <10% of those truly are; skin testing if uncertain per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Pregnancy — syphilis treatment is the SAME (PCN-allergic pregnant patients MUST be desensitized) — alternatives are NOT effective per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Clostridioides difficile colitis possible — counsel patient on diarrhea evaluation.", citationIDs: ["openfda_round20"])
        ],
        adverseReactions: AttributedProse(
            "Injection site pain (universal — large volume), Jarisch-Herxheimer reaction, hypersensitivity (rash → anaphylaxis), serum sickness, hemolytic anemia (rare), neutropenia (rare), seizures (very high doses).",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Probenecid — increases penicillin levels (intended at one time, less common now).", citationIDs: ["openfda_round20"]),
            AttributedBullet("Methotrexate — penicillin may reduce MTX clearance; monitor.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Oral contraceptives — possible reduced efficacy (modest); counsel backup contraception.", citationIDs: ["openrn_pharm_round20"])
        ],
        nursingImplications: [
            AttributedBullet("VERIFY route IM — never IV, never IA, never SC. Aspirate before injection to confirm not intravascular per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Deep IM ventrogluteal or upper outer quadrant of buttock; warm syringe to body temp; slow injection to reduce pain.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Observe patient ≥30 minutes post-injection for anaphylaxis; have epinephrine + crash cart available.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Counsel Jarisch-Herxheimer reaction in syphilis — fever + myalgia 6–24 hours after; not allergy; supportive care.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Partner notification + treatment — public health reporting required for syphilis.", citationIDs: ["cdc_round20"]),
            AttributedBullet("HIV screening — co-infection common with syphilis.", citationIDs: ["cdc_round20"])
        ],
        patientTeaching: AttributedProse(
            "We give this in your muscle (usually the buttock) — it will sting. You may feel feverish + achy within 24 hours — this is normal + means the medicine is working. Tell us about hives, breathing trouble, or swelling immediately. Your partner(s) need testing + treatment too — we'll help with that confidentially.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, cdcR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MetronidazoleBVR20Sample {
    public static let entry: DrugEntry = DrugEntry(
        id: "metronidazole-bv",
        title: "Metronidazole (BV + trichomoniasis)",
        subtitle: "Flagyl · nitroimidazole · BV first-line + trich · disulfiram-like reaction · avoid 1st trimester",
        category: "Nitroimidazole antibiotic / antiprotozoal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nitroimidazole — bactericidal anaerobic + antiprotozoal"),
            KeyValueRow(key: "Indications", value: "Bacterial vaginosis; trichomoniasis; C. difficile (alternative to vanco); anaerobic intra-abdominal; H. pylori (combo); amebiasis; giardiasis"),
            KeyValueRow(key: "Notable", value: "CDC STI 2021 recommends 7-day BV regimen over single-dose"),
            KeyValueRow(key: "Watch", value: "Disulfiram-like reaction with alcohol; metallic taste; peripheral neuropathy on long courses")
        ],
        indications: AttributedProse(
            "Bacterial vaginosis (oral or vaginal gel); trichomoniasis (treat partners simultaneously); pelvic inflammatory disease (combo); C. difficile (alternative to vancomycin / fidaxomicin); anaerobic intra-abdominal infections; H. pylori eradication (combo); amebiasis; giardiasis per CDC STI Treatment Guidelines 2021 per primary source.",
            citationIDs: ["openfda_round20", "cdc_round20"]
        ),
        mechanism: AttributedProse(
            "Prodrug — anaerobic bacteria + protozoa reduce nitro group → toxic radicals → DNA damage + cell death. Activity restricted to organisms with anaerobic energy metabolism (selective toxicity).",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "BV oral", body: "500 mg PO BID × 7 days per primary source (CDC 2021 first-line) per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "BV intravaginal", body: "0.75% gel one applicator (5 g) intravaginally daily × 5 days.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Trichomoniasis (women)", body: "500 mg PO BID × 7 days (CDC 2021 updated — was single-dose; 7-day is now preferred for women) per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Trichomoniasis (men)", body: "2 g PO × 1 dose (single dose still preferred for men).", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "C. difficile (mild-moderate)", body: "500 mg PO TID × 10 days; vancomycin / fidaxomicin preferred first-line per primary source.", citationIDs: ["specialty_round20"])
        ],
        contraindications: AttributedProse(
            "First-trimester pregnancy (relative — controversial; second/third trimester acceptable for symptomatic infection); concurrent alcohol use (disulfiram-like reaction); hypersensitivity to nitroimidazoles per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("Disulfiram-like reaction with alcohol — flushing, tachycardia, hypotension, vomiting; AVOID alcohol during therapy + 72h after per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Peripheral neuropathy with prolonged courses (>1 week high-dose) — discontinue if symptoms develop.", citationIDs: ["openfda_round20"]),
            AttributedBullet("CNS toxicity (rare) — encephalopathy, seizures, cerebellar signs with high doses / prolonged use.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Carcinogenicity in animals — clinical relevance unclear; avoid unnecessary use.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Treat sexual partners — trichomoniasis is sexually transmitted; abstain until both partners treated + asymptomatic per primary source.", citationIDs: ["cdc_round20"])
        ],
        adverseReactions: AttributedProse(
            "Metallic taste (very common), nausea, diarrhea, headache, dark urine (harmless), dizziness, peripheral neuropathy, rare CNS effects, disulfiram-like alcohol reaction.",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("ALCOHOL — disulfiram-like reaction; avoid during + 72h after.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Warfarin — increased anticoagulant effect; INR monitoring + dose adjustment.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Lithium — increased lithium levels; toxicity risk.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Disulfiram — psychotic reactions when combined; avoid.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Phenytoin / phenobarbital — accelerated metronidazole clearance.", citationIDs: ["openfda_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Strict alcohol counsel — including mouthwash, cough syrups, sauces; risk persists 72h after last dose.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Partner treatment for trichomoniasis; expedited partner therapy (EPT) where state permits per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("BV — counsel high recurrence rate (~30% at 3 months); probiotic + condom + smoking cessation reduce.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Take with food to reduce GI upset; counsel metallic taste + dark urine as normal.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Pregnancy — okay in 2nd/3rd trimester for symptomatic BV / trich; 1st trimester case-by-case per primary source.", citationIDs: ["cdc_round20"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth as directed. DO NOT drink alcohol while taking this OR for 3 days after — even cough syrup or mouthwash with alcohol can make you very sick (flushing, vomiting, racing heart). Your urine may turn dark + you'll have a metallic taste — both harmless. Tell your sexual partner(s) so they can be treated too. Avoid sex until you and your partner finish treatment and have no symptoms.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, cdcR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ImiquimodSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "imiquimod",
        title: "Imiquimod",
        subtitle: "Aldara · topical immune modifier · HPV genital warts + AK + sBCC · local skin reaction expected",
        category: "Topical immune response modifier (TLR-7 agonist)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Toll-like receptor 7 (TLR-7) agonist — topical"),
            KeyValueRow(key: "Indications", value: "External genital warts (HPV); actinic keratosis; superficial basal cell carcinoma"),
            KeyValueRow(key: "Notable", value: "Patient-applied at home; expect LOCAL SKIN REACTION (erythema, erosion); not allergic"),
            KeyValueRow(key: "Schedule", value: "Genital warts — 3×/week at bedtime up to 16 weeks; AK — varies by regimen")
        ],
        indications: AttributedProse(
            "External + perianal genital warts (HPV); actinic keratosis on face / scalp; superficial basal cell carcinoma per primary source. Off-label — molluscum contagiosum, vulvar/vaginal intraepithelial neoplasia, leishmaniasis.",
            citationIDs: ["openfda_round20", "cdc_round20"]
        ),
        mechanism: AttributedProse(
            "TLR-7 agonist → activates innate immune response → induces interferon-α + cytokines → cell-mediated immunity targets HPV-infected or atypical keratinocytes. No direct antiviral effect.",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "External genital warts", body: "5% cream applied 3×/week at bedtime; leave on 6–10 hours; wash off in AM; up to 16 weeks per primary source.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Actinic keratosis", body: "3.75% cream daily × 2-week cycles × 2; OR 5% cream 2×/week × 16 weeks per primary source.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Superficial BCC", body: "5% cream 5×/week × 6 weeks; only for confirmed superficial BCC with biopsy.", citationIDs: ["openfda_round20"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; do not apply to mucosal surfaces (vagina, urethra, anal mucosa, mouth); pediatric use for cervical / vaginal warts not established per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("Local skin reactions — erythema, erosion, edema, scabbing — EXPECTED (immune response is the mechanism); does NOT mean allergy; rest period if severe per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Flu-like systemic reactions — fatigue, headache, myalgia, fever; especially in early weeks.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Photosensitivity — sun protection during therapy; AK on face area particularly.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Hypopigmentation / hyperpigmentation possible at treated sites — sometimes permanent.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Sexual activity — avoid intercourse during treatment hours (cream on skin can weaken condoms / diaphragms).", citationIDs: ["cdc_round20"]),
            AttributedBullet("Latex condom + diaphragm — imiquimod cream WEAKENS latex; counsel.", citationIDs: ["openfda_round20"])
        ],
        adverseReactions: AttributedProse(
            "Application site reactions (erythema, erosion, scabbing, edema), pruritus, burning, pain, flu-like systemic symptoms, photosensitivity, pigmentation changes, headache.",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Latex condoms / diaphragms — weakened by cream; non-latex barrier methods during therapy hours.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Other topical agents — apply separately; do not occlude after imiquimod.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Immunosuppression (HIV, transplant) — modify regimen; specialist guidance.", citationIDs: ["specialty_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Wash hands before + after application; thin layer to clean dry skin; rub in until invisible.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Apply at bedtime; wash off after 6–10 hours; do NOT cover with bandage / occlusive dressing.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Counsel expected skin reaction — redness, scabbing is desired immune response; rest period if severe.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Avoid sexual contact during application hours; non-latex barrier methods during therapy weeks.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Treatment is patient-applied — verify understanding + technique; provide demonstration if needed.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("HPV vaccination — protect against future strains; counsel HPV vaccine.", citationIDs: ["cdc_round20"])
        ],
        patientTeaching: AttributedProse(
            "Apply a thin layer to the wart area at bedtime 3 nights a week; wash hands before + after. Wash the area in the morning. You can expect redness, scabbing, even some erosion — that's the medicine working; not an allergy. Avoid sex during application hours. This cream weakens latex condoms, so use polyurethane or have your partner use non-latex. Tell us if pain is severe or skin breaks down badly. Get the HPV vaccine if you haven't already.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, cdcR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TinidazoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tinidazole",
        title: "Tinidazole",
        subtitle: "Tindamax · nitroimidazole · single-dose trich / BV · longer half-life than metronidazole",
        category: "Nitroimidazole antibiotic / antiprotozoal",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Second-generation nitroimidazole"),
            KeyValueRow(key: "Indications", value: "Trichomoniasis; bacterial vaginosis; giardiasis; amebiasis"),
            KeyValueRow(key: "Notable", value: "Longer half-life (12–14h) → shorter regimens than metronidazole; better tolerated"),
            KeyValueRow(key: "Watch", value: "Same disulfiram-like reaction with alcohol; pregnancy 1st trimester avoid")
        ],
        indications: AttributedProse(
            "Trichomoniasis (alternative to metronidazole); bacterial vaginosis; giardiasis; intestinal + hepatic amebiasis per primary source.",
            citationIDs: ["openfda_round20", "cdc_round20"]
        ),
        mechanism: AttributedProse(
            "Same mechanism as metronidazole — anaerobic reduction → toxic radicals → DNA damage in anaerobic bacteria + protozoa. Longer half-life enables shorter / single-dose regimens.",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "Trichomoniasis", body: "2 g PO × 1 dose; treat partners simultaneously per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Bacterial vaginosis", body: "1 g PO daily × 5 days OR 2 g PO daily × 2 days per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Giardiasis", body: "2 g PO × 1 dose.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Amebiasis", body: "2 g PO daily × 3 days; longer for hepatic abscess.", citationIDs: ["openfda_round20"])
        ],
        contraindications: AttributedProse(
            "First-trimester pregnancy; concurrent alcohol; hypersensitivity to nitroimidazoles per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("Disulfiram-like reaction with alcohol — avoid during + 72h after per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Carcinogenicity in animals — relevance unclear; avoid unnecessary courses.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Peripheral neuropathy with prolonged use.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Cross-resistance with metronidazole common.", citationIDs: ["cdc_round20"])
        ],
        adverseReactions: AttributedProse(
            "Metallic taste, nausea, abdominal cramping, dizziness, fatigue — generally less than metronidazole.",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Alcohol — disulfiram-like reaction.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Warfarin — INR monitoring.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Phenytoin / phenobarbital — reduced tinidazole levels.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Lithium — increased levels.", citationIDs: ["openfda_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Take with food to reduce GI upset.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Strict alcohol counsel including mouthwash + cough syrup; 72h after.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Partner notification + treatment for trich.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Avoid breastfeeding 3 days after dose (drug excreted in milk).", citationIDs: ["openfda_round20"])
        ],
        patientTeaching: AttributedProse(
            "Take with food. NO alcohol during treatment or for 3 days after — even mouthwash + cough syrup with alcohol. Your partner needs treatment too if this is for trichomoniasis. If you're breastfeeding, pump + dump for 3 days after the dose.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, cdcR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum CefdinirSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "cefdinir",
        title: "Cefdinir",
        subtitle: "Omnicef · oral 3rd-gen cephalosporin · peds otitis + community resp · iron causes red stool",
        category: "Oral 3rd-generation cephalosporin",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Third-generation cephalosporin (oral)"),
            KeyValueRow(key: "Indications", value: "Acute otitis media (pediatric); CAP; sinusitis; pharyngitis (alt to PCN); uncomplicated skin/soft tissue infection"),
            KeyValueRow(key: "Notable", value: "Iron + dairy reduce absorption; reddish stool with iron is harmless"),
            KeyValueRow(key: "Watch", value: "Cross-reactivity with PCN ~1–3%; C. difficile colitis")
        ],
        indications: AttributedProse(
            "Acute otitis media (especially in PCN-allergic pediatric patients); community-acquired pneumonia; acute bacterial sinusitis; group A strep pharyngitis (alternative to penicillin in non-severe allergic patients); uncomplicated skin / soft-tissue infections per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        mechanism: AttributedProse(
            "Beta-lactam — binds penicillin-binding proteins → inhibits cell-wall synthesis → bactericidal. Broader gram-negative coverage than 1st/2nd-gen cephalosporins.",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "300 mg PO BID OR 600 mg PO daily × 5–10 days per primary source.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Pediatric (≥6 months)", body: "14 mg/kg/day PO divided BID OR daily (max 600 mg/day) × 5–10 days per primary source.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Renal adjustment", body: "Reduce dose / extend interval if CrCl <30.", citationIDs: ["openfda_round20"])
        ],
        contraindications: AttributedProse(
            "Severe hypersensitivity to cephalosporins or PCN (anaphylaxis history); hypersensitivity to cefdinir per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("PCN cross-reactivity 1–3% — most PCN-allergic patients tolerate cephalosporins safely; consider severity of prior reaction per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("C. difficile colitis — counsel diarrhea reporting; treat if severe.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Reddish stool — harmless reaction between cefdinir + iron in formula / supplements; counsel parents.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Renal adjustment in CKD; SJS / TEN (rare).", citationIDs: ["openfda_round20"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (most common), nausea, headache, rash, vulvovaginal candidiasis, transient reddish stool (with iron), rare C. difficile colitis.",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Iron supplements / iron-fortified foods — reduces absorption; separate by 2 hours per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Magnesium / aluminum antacids — reduce absorption; separate by 2 hours.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Probenecid — increases cefdinir levels (clinical relevance limited).", citationIDs: ["openfda_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel reddish stool with iron — harmless; common parental concern in peds.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Separate from iron / antacids / dairy by 2 hours.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Pediatric suspension — shake well; refrigerate; discard after 10 days.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Complete full course even if symptoms resolve.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Watch for severe diarrhea = potential C. diff; counsel reporting.", citationIDs: ["openfda_round20"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth as directed for the full course — even if you feel better. Don't take with iron, antacids, or large amounts of dairy within 2 hours of the dose. The medicine can mix with iron to make stools look red — this is harmless. Tell us about severe diarrhea, rash, or trouble breathing.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum PEG3350Sample {
    public static let entry: DrugEntry = DrugEntry(
        id: "polyethylene-glycol-3350",
        title: "Polyethylene glycol 3350 (PEG-3350)",
        subtitle: "MiraLAX · osmotic laxative · constipation first-line · safe long-term + peds",
        category: "Osmotic laxative",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Osmotic polymer laxative"),
            KeyValueRow(key: "Indications", value: "Occasional constipation; chronic constipation; bowel prep (high-dose); pediatric functional constipation"),
            KeyValueRow(key: "Notable", value: "First-line by AGA + ACG for chronic constipation; safe + effective long-term"),
            KeyValueRow(key: "Schedule", value: "17 g (one capful) PO daily — onset 1–3 days")
        ],
        indications: AttributedProse(
            "Occasional + chronic constipation in adults + pediatrics; opioid-induced constipation (adjunct); fecal impaction (high-dose); bowel preparation (split-dose 4 L for colonoscopy) per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        mechanism: AttributedProse(
            "Inert high-molecular-weight polymer not absorbed from GI tract → retains water in intestinal lumen by osmotic effect → softens stool + increases stool volume → stimulates peristalsis.",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "Adult constipation", body: "17 g (one capful) dissolved in 4–8 oz fluid PO daily; up to 14 days OTC, longer with provider per primary source.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Pediatric (≥6 months — off-label)", body: "0.4–1 g/kg/day PO; max 17 g/day; widely used despite OTC labeling for adults only per primary source.", citationIDs: ["specialty_round20"]),
            DosingBlock(label: "Fecal impaction (clean-out)", body: "1–1.5 g/kg/day × 3–6 days under provider supervision.", citationIDs: ["specialty_round20"]),
            DosingBlock(label: "Colonoscopy prep (PEG-electrolyte)", body: "4 L PEG-electrolyte solution split-dose; uses different formulation with electrolytes (GoLYTELY / NuLYTELY).", citationIDs: ["openfda_round20"])
        ],
        contraindications: AttributedProse(
            "Known or suspected bowel obstruction; ileus; gastric retention; intestinal perforation; severe inflammatory bowel disease flare; toxic megacolon; hypersensitivity per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("Stop + reassess if no bowel movement after 1 week of daily use.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Rectal bleeding while on therapy — investigate (PEG didn't cause; concurrent pathology).", citationIDs: ["openfda_round20"]),
            AttributedBullet("Electrolyte abnormalities — minimal because PEG isn't absorbed; high-dose prep can cause issues.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Bowel-prep aspiration risk — older / debilitated / NPO; consider NG administration.", citationIDs: ["openfda_round20"])
        ],
        adverseReactions: AttributedProse(
            "Bloating, cramping, flatulence, diarrhea, nausea (mostly with rapid-dose / bowel prep). Long-term daily use is well-tolerated.",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Generally no significant pharmacokinetic interactions — PEG not absorbed.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Other laxatives — additive effect; usually unnecessary.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Medication absorption — bowel prep may reduce absorption of co-administered drugs; separate by 1+ hour around prep.", citationIDs: ["specialty_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel adequate hydration — works by drawing water in; needs water on board.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Onset 1–3 days — set expectations; not for acute relief.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Pediatric — first-line per NASPGHAN for functional constipation; long-term use safe.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Combine with fiber + fluid + activity — multimodal management.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Bowel prep — split-dose strategy (half night before, half AM of procedure) improves visualization + tolerability.", citationIDs: ["specialty_round20"])
        ],
        patientTeaching: AttributedProse(
            "Mix one capful in 4–8 oz of water, juice, or coffee daily. It takes 1–3 days to work, so be patient. Drink plenty of fluids throughout the day. Add more fiber + move your body more. Tell us if there's no bowel movement after a week, severe pain, or rectal bleeding. Safe for kids if your provider recommends it.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum DisulfiramSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "disulfiram",
        title: "Disulfiram",
        subtitle: "Antabuse · aldehyde dehydrogenase inhibitor · AUD aversion therapy · NEVER without informed consent",
        category: "Aldehyde dehydrogenase inhibitor (AUD)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aldehyde dehydrogenase inhibitor"),
            KeyValueRow(key: "Indications", value: "Adjunctive therapy for alcohol use disorder (AUD) — aversion strategy in motivated abstinence-committed patients"),
            KeyValueRow(key: "Notable", value: "Must NEVER be given without patient knowledge + informed consent; risk of fatal reaction"),
            KeyValueRow(key: "Watch", value: "Disulfiram-ethanol reaction can be severe / fatal; hepatotoxicity")
        ],
        indications: AttributedProse(
            "Adjunctive therapy in alcohol use disorder for patients committed to total abstinence + motivated to use a deterrent. Naltrexone + acamprosate generally preferred first-line per primary source.",
            citationIDs: ["openfda_round20", "specialty_round20"]
        ),
        mechanism: AttributedProse(
            "Irreversibly inhibits aldehyde dehydrogenase → ethanol metabolism stops at acetaldehyde → acetaldehyde accumulation → flushing, tachycardia, hypotension, vomiting (\"disulfiram-ethanol reaction\"). Effect lasts up to 2 weeks after last dose.",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "250 mg PO daily; range 125–500 mg/day per primary source.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Initiation", body: "Wait ≥12 hours after last alcohol intake; start at low dose + titrate up.", citationIDs: ["openfda_round20"])
        ],
        contraindications: AttributedProse(
            "Recent alcohol consumption (within 12 hours); concurrent metronidazole / paraldehyde / alcohol-containing products; severe myocardial disease / coronary occlusion; psychosis; hypersensitivity; pregnancy (relative) per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("BOXED-EQUIVALENT — Severe disulfiram-ethanol reaction can be fatal — never administer without patient's full knowledge + consent per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Hepatotoxicity — including fatal hepatitis; baseline + periodic LFTs.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Psychiatric — psychosis, depression, paranoia; mental health screening before + during.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Peripheral + optic neuropathy with prolonged use.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Reactions to TRACE alcohol — mouthwash, vinegar, cough syrups, hand sanitizer skin exposure, aftershave, perfume; counsel meticulously per primary source.", citationIDs: ["specialty_round20"])
        ],
        adverseReactions: AttributedProse(
            "Drowsiness, headache, metallic / garlic taste, peripheral neuropathy, optic neuritis, psychosis (rare), hepatotoxicity, severe disulfiram-ethanol reaction (flushing, tachycardia, vomiting, hypotension, dyspnea, arrhythmia, death in severe cases).",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("ALCOHOL in ANY form — disulfiram-ethanol reaction. Counsel meticulously — mouthwash, cough syrup, vinegar, hand sanitizer, aftershave, communion wine.", citationIDs: ["openfda_round20"]),
            AttributedBullet("METRONIDAZOLE — psychotic reactions; combination CONTRAINDICATED.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Phenytoin / warfarin / isoniazid — inhibited metabolism; increased toxicity.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Theophylline — increased levels.", citationIDs: ["openfda_round20"])
        ],
        nursingImplications: [
            AttributedBullet("INFORMED CONSENT essential — document patient understanding + commitment to abstinence + family awareness if patient agrees.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Baseline + every 2-week LFTs first 8 weeks; symptom-based ongoing.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Counsel meticulous alcohol avoidance — including topical / inhaled / mouthwash / sauces / cough syrup; reactions persist 2 weeks after last dose.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Medical-alert ID — emergency providers need to know in case of trauma / surgery / unexpected exposure.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Naltrexone + acamprosate preferred first-line — discuss alternatives before initiating.", citationIDs: ["specialty_round20"])
        ],
        patientTeaching: AttributedProse(
            "This medicine makes you very sick if you drink ANY alcohol — even tiny amounts in mouthwash, cough syrup, sauces, vinegar, or hand sanitizer. The reaction (flushing, vomiting, racing heart, breathing trouble) can be dangerous or fatal. You must commit to total abstinence. The effect lasts about 2 weeks after the last dose. Carry medical-alert ID. Tell us about yellow eyes / skin, dark urine, mood changes, or strange visions.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum BuprenorphineNaloxoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "buprenorphine-naloxone",
        title: "Buprenorphine-naloxone",
        subtitle: "Suboxone / Zubsolv · MAT for OUD · sublingual · induction requires moderate withdrawal",
        category: "Partial μ-opioid agonist + abuse-deterrent (MAT for OUD)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Partial μ-agonist (buprenorphine) + μ-antagonist (naloxone)"),
            KeyValueRow(key: "Indications", value: "Medication-assisted treatment for opioid use disorder (OUD); maintenance + induction"),
            KeyValueRow(key: "Notable", value: "Naloxone added to deter IV/IN misuse — sublingual route makes naloxone inactive; injection precipitates withdrawal"),
            KeyValueRow(key: "Schedule", value: "Schedule III; prescribing no longer requires DEA X-waiver as of 2023")
        ],
        indications: AttributedProse(
            "Treatment of opioid use disorder — induction + maintenance therapy. First-line MAT per SAMHSA / ASAM. Naloxone component is inactive when used sublingually but provides abuse deterrence if injected per primary source.",
            citationIDs: ["openfda_round20", "specialty_round20"]
        ),
        mechanism: AttributedProse(
            "Buprenorphine — partial μ-opioid agonist with high receptor affinity → blocks effect of additional opioids + ceiling effect on respiratory depression. Naloxone — μ-antagonist; inactive sublingually but precipitates withdrawal if injected (abuse deterrence).",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "Induction (Day 1)", body: "4 mg SL × 1 in moderate withdrawal (COWS ≥8); titrate by 2–4 mg q2h up to 8–12 mg total day 1 per primary source.", citationIDs: ["specialty_round20"]),
            DosingBlock(label: "Maintenance", body: "12–24 mg SL daily; max 24 mg/day per primary source.", citationIDs: ["specialty_round20"]),
            DosingBlock(label: "Sublingual film / tablet", body: "Place under tongue; let dissolve 5–10 minutes; do NOT chew or swallow.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Long-acting injectable (Sublocade)", body: "100–300 mg SQ monthly; for stable patients on transmucosal therapy 7+ days.", citationIDs: ["openfda_round20"])
        ],
        contraindications: AttributedProse(
            "Severe hepatic impairment; hypersensitivity to buprenorphine or naloxone; concurrent benzodiazepines / other CNS depressants (relative — caution + careful dosing) per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("PRECIPITATED WITHDRAWAL — induction must occur in moderate withdrawal (COWS ≥8 typical); too-early dosing precipitates severe withdrawal per primary source.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Respiratory depression — combined with benzodiazepines / alcohol / other CNS depressants is the leading cause of buprenorphine-related death.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Hepatotoxicity — periodic LFTs, especially with concurrent hepatic disease.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Neonatal abstinence syndrome — pregnancy use; coordinate maternal + neonatal care.", citationIDs: ["openfda_round20"]),
            AttributedBullet("X-waiver no longer required (2023 changes) — but training + comfort with OUD management still important.", citationIDs: ["specialty_round20"])
        ],
        adverseReactions: AttributedProse(
            "Constipation, headache, nausea, sweating, insomnia, anxiety, sedation, withdrawal symptoms (precipitated or rebound), QT prolongation (rare), peripheral edema, hepatic enzyme elevation.",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Benzodiazepines + alcohol + CNS depressants — additive respiratory depression; leading cause of overdose death; counsel + monitor.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides) — increase buprenorphine levels.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Strong CYP3A4 inducers (rifampin, anticonvulsants) — decrease buprenorphine levels.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Methadone — different mechanism; switching requires careful protocol.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Naltrexone — antagonist; precipitates withdrawal; avoid in recent users.", citationIDs: ["specialty_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Verify moderate withdrawal (COWS ≥8) before induction dose — precipitated withdrawal otherwise per primary source.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Sublingual administration — hold under tongue 5–10 min; do NOT chew / swallow / drink for 5+ min after.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Counsel concurrent benzodiazepine + alcohol risk — most common cause of overdose death on this medication.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Coordinate behavioral therapy + peer support; MAT alone is medication, recovery is whole-person.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Pregnancy — buprenorphine preferred MAT in pregnancy; neonatal abstinence syndrome anticipated + manageable.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Co-prescribe naloxone — patient + family member + bystander education on overdose response.", citationIDs: ["specialty_round20"])
        ],
        patientTeaching: AttributedProse(
            "Place the film or tablet under your tongue and let it dissolve completely — usually 5–10 minutes. Don't chew, swallow, or drink for 5 minutes after. Do NOT take with alcohol or benzodiazepines (like Xanax, Valium, Klonopin) — that combination can kill you. Tell every provider you take this. Keep naloxone at home + tell your family how to use it. Counseling + peer support work alongside the medicine — recovery is more than the pill.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum VareniclineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "varenicline",
        title: "Varenicline",
        subtitle: "Chantix · partial nicotinic agonist · smoking cessation · vivid dreams + mood changes",
        category: "α4β2 nicotinic acetylcholine receptor partial agonist",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Partial agonist at α4β2 nicotinic ACh receptors"),
            KeyValueRow(key: "Indications", value: "Smoking cessation in adults"),
            KeyValueRow(key: "Notable", value: "FDA removed boxed psychiatric warning in 2016 — net mental-health benefit per EAGLES trial"),
            KeyValueRow(key: "Schedule", value: "1-week titration, then 12 weeks; second 12-week course for maintenance")
        ],
        indications: AttributedProse(
            "Smoking cessation in adults. Most effective monotherapy for tobacco dependence per Cochrane + USPSTF per primary source.",
            citationIDs: ["openfda_round20", "specialty_round20"]
        ),
        mechanism: AttributedProse(
            "Partial agonist at α4β2 nicotinic ACh receptor → modest stimulation reduces cravings + withdrawal; also blocks nicotine binding (smoking less rewarding). Dual mechanism — partially treats withdrawal AND reduces reinforcement.",
            citationIDs: ["openfda_round20"]
        ),
        dosing: [
            DosingBlock(label: "Standard regimen", body: "Day 1–3: 0.5 mg PO daily; Day 4–7: 0.5 mg PO BID; Day 8 + onward: 1 mg PO BID × 12 weeks per primary source.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Quit date", body: "Start medication 1 week before quit date OR up to 35 days before — flexible target quit approach per primary source.", citationIDs: ["specialty_round20"]),
            DosingBlock(label: "Extended therapy", body: "Additional 12 weeks for maintenance (24 weeks total) for those who quit successfully.", citationIDs: ["openfda_round20"]),
            DosingBlock(label: "Renal", body: "Reduce to 0.5 mg PO BID if CrCl <30; max 0.5 mg/day in dialysis.", citationIDs: ["openfda_round20"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; ESRD on hemodialysis (relative — modified dose) per primary source.",
            citationIDs: ["openfda_round20"]
        ),
        warnings: [
            AttributedBullet("Psychiatric — FDA removed boxed warning 2016 after EAGLES trial showed net mental-health benefit; still monitor mood + suicidality particularly in psychiatric history per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Vivid dreams / nightmares — common (~10%); usually transient.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Cardiovascular — modest increase in major cardiovascular events; balance against smoking risk per primary source.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Seizures — small risk; caution in seizure history.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Combine with behavioral counseling + quitline (1-800-QUIT-NOW); doubles success rate.", citationIDs: ["specialty_round20"])
        ],
        adverseReactions: AttributedProse(
            "Nausea (very common, ~30%; reduces over time with food), insomnia, vivid dreams, headache, abnormal dreams, constipation, mood changes / depression (rare).",
            citationIDs: ["openfda_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Insulin — possible reduced requirement; monitor glucose.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Alcohol — increased intoxication / blackouts in some patients; counsel.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Nicotine replacement therapy — combination safe; sometimes more effective.", citationIDs: ["specialty_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Take with full glass of water + after meals — reduces nausea.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Set realistic quit date — typically 1-2 weeks into therapy; flexible target approach works for ambivalent patients.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Counsel vivid dreams + nausea — usually transient; do not stop without trying full course.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Pair with behavioral support — quitline, app, group, telehealth; doubles efficacy.", citationIDs: ["specialty_round20"]),
            AttributedBullet("Screen mood changes especially in psychiatric history; safety planning for at-risk.", citationIDs: ["specialty_round20"])
        ],
        patientTeaching: AttributedProse(
            "Take with food + a full glass of water — helps with nausea. We'll set a quit date together. Don't stop the medicine on your quit day — keep taking it for the full 12 weeks (or more if it's working). You may have vivid dreams — usually they go away. Tell us about new sadness, agitation, or thoughts of self-harm. Call 1-800-QUIT-NOW or text QUITNOW for free counseling alongside the medicine.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, specialtyR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum MMRVaccineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mmr-vaccine",
        title: "MMR vaccine (measles, mumps, rubella)",
        subtitle: "Live attenuated · 2 doses 12–15 mo + 4–6 yr · post-exposure prophylaxis · contraindicated in pregnancy",
        category: "Live attenuated viral vaccine",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Live attenuated viral vaccine (measles + mumps + rubella)"),
            KeyValueRow(key: "Indications", value: "Routine pediatric immunization; adult catch-up; post-exposure prophylaxis"),
            KeyValueRow(key: "Notable", value: "Pregnancy contraindicated; immunocompromised contraindicated; 2-dose series provides ~97% protection"),
            KeyValueRow(key: "Schedule", value: "Dose 1: 12–15 months; Dose 2: 4–6 years (or any time after first 4 weeks)")
        ],
        indications: AttributedProse(
            "Routine childhood immunization at 12–15 months + 4–6 years per ACIP. Adult catch-up if no documentation of immunity (born 1957+). Post-exposure prophylaxis within 72 hours of measles exposure. Pre-conception immunity check for women of reproductive age per primary source.",
            citationIDs: ["cdc_round20", "openfda_round20"]
        ),
        mechanism: AttributedProse(
            "Live attenuated viruses → mild subclinical infection → robust + long-lasting humoral + cell-mediated immunity. Two doses produce ~97% measles immunity, ~88% mumps, ~97% rubella.",
            citationIDs: ["cdc_round20"]
        ),
        dosing: [
            DosingBlock(label: "Pediatric schedule", body: "0.5 mL SQ; Dose 1 at 12–15 months; Dose 2 at 4–6 years (minimum 28 days after dose 1) per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Adult catch-up", body: "1 or 2 doses ≥28 days apart depending on risk (healthcare workers, students, international travelers get 2; general adult born 1957+ at least 1) per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Post-exposure prophylaxis", body: "Within 72 hours of measles exposure for susceptible contacts; IGIM if >72 hours or contraindicated.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Outbreak / travel", body: "Dose 1 may be given as early as 6 months if traveling to outbreak area; revaccinate at 12+ months.", citationIDs: ["cdc_round20"])
        ],
        contraindications: AttributedProse(
            "Pregnancy (do not give; avoid pregnancy 4 weeks post-vaccination); severe immunocompromise (HIV CD4 <200, primary immunodeficiency, active malignancy / chemotherapy, high-dose steroids); severe egg allergy (rare cause now — egg-free formulations available); anaphylaxis to prior dose / gelatin / neomycin; recent IVIG / blood products (defer 3–11 months depending on product) per primary source.",
            citationIDs: ["cdc_round20"]
        ),
        warnings: [
            AttributedBullet("Pregnancy — counsel + screen; avoid pregnancy 4 weeks post-vaccination (though no fetal harm documented to date) per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Immunocompromise — live vaccine; can cause vaccine-strain infection in severely immunocompromised; HIV CD4 ≥200 acceptable.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Febrile seizure risk — small increased risk 6–14 days post-vaccination (especially MMR+V combined); routine separate or combined per provider per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Thrombocytopenia (rare) — usually self-limited 2-3 weeks post-vaccination.", citationIDs: ["openfda_round20"]),
            AttributedBullet("AVOID confusion with the (now discredited) autism link — MMR does NOT cause autism per overwhelming evidence per primary source.", citationIDs: ["cdc_round20"])
        ],
        adverseReactions: AttributedProse(
            "Injection site reaction, low-grade fever (5–15%), mild rash 7–14 days post-vaccination, transient arthralgia, rare febrile seizure, very rare thrombocytopenia, very rare anaphylaxis.",
            citationIDs: ["cdc_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Immunoglobulin / blood products — defer MMR 3–11 months after; antibodies interfere with vaccine response.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Other live vaccines — same day OR ≥4 weeks apart; do not give 1-3 weeks apart (interference).", citationIDs: ["cdc_round20"]),
            AttributedBullet("Immunosuppressants — avoid during therapy; defer or give pre-treatment.", citationIDs: ["cdc_round20"]),
            AttributedBullet("TST / IGRA — MMR can suppress TB skin test reactivity for 4–6 weeks; place TST same day OR ≥4 weeks after.", citationIDs: ["cdc_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Verify immunization records; screen for contraindications (pregnancy, immunocompromise, recent IVIG).", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("SQ administration in outer upper arm (≥12 months) or anterolateral thigh (younger).", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Counsel adverse effects — fever + rash 7–14 days is normal vaccine response, NOT failure or infection.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Document lot # + administration site + date in immunization registry.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Healthcare worker requirement — 2 documented doses or serologic proof of immunity.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Pre-conception screening — check immunity in women of reproductive age; offer MMR if non-immune + not pregnant.", citationIDs: ["cdc_round20"])
        ],
        patientTeaching: AttributedProse(
            "MMR is given as a shot under the skin of the upper arm. Side effects are usually mild — sore arm, low fever, sometimes a mild rash 1–2 weeks later. Two doses give about 97% protection against measles, mumps, and rubella for life. If you're a woman who could become pregnant, don't get pregnant for 4 weeks after the vaccine. The myth that MMR causes autism has been thoroughly disproven by huge studies — please ask if you have questions.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, cdcR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum HPVVaccineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "hpv-vaccine",
        title: "HPV vaccine (Gardasil 9)",
        subtitle: "Recombinant 9-valent · 2 or 3 doses · cervical / oropharyngeal / anal cancer prevention",
        category: "Recombinant non-replicating viral vaccine (9-valent)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Recombinant 9-valent human papillomavirus vaccine"),
            KeyValueRow(key: "Indications", value: "Routine immunization to prevent HPV-associated cervical, oropharyngeal, anal, vaginal, vulvar, penile cancer + genital warts"),
            KeyValueRow(key: "Schedule", value: "Routine ages 9–12 (2-dose series if started <15) OR 11–26 (3-dose if started ≥15); shared decision 27–45"),
            KeyValueRow(key: "Notable", value: "Best protection if completed before first sexual activity")
        ],
        indications: AttributedProse(
            "Prevention of HPV-associated cancers (cervical, oropharyngeal, anal, vaginal, vulvar, penile) + genital warts. Routine immunization at age 9–12 (preferred ages); catch-up through age 26; shared decision making 27–45 per ACIP / CDC per primary source.",
            citationIDs: ["cdc_round20", "openfda_round20"]
        ),
        mechanism: AttributedProse(
            "Recombinant virus-like particles (no DNA) of 9 HPV types (6, 11, 16, 18, 31, 33, 45, 52, 58) → robust antibody response. Types 16 + 18 cause most HPV cancers; 6 + 11 cause most genital warts.",
            citationIDs: ["cdc_round20"]
        ),
        dosing: [
            DosingBlock(label: "Age 9–14 — 2-dose schedule", body: "0.5 mL IM × 2 doses 6–12 months apart per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Age 15–26 (or any age starting later) — 3-dose", body: "0.5 mL IM at 0, 1–2, and 6 months per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Age 27–45", body: "Shared decision-making — individual benefit varies; counsel sexual history + risk factors per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Immunocompromised", body: "Always 3-dose regardless of age starting per primary source.", citationIDs: ["cdc_round20"])
        ],
        contraindications: AttributedProse(
            "Severe hypersensitivity to vaccine components or prior dose; pregnancy (defer; not a teratogen but lack of pregnancy data) per primary source.",
            citationIDs: ["cdc_round20"]
        ),
        warnings: [
            AttributedBullet("Syncope post-vaccination — adolescents particularly; observe sitting / lying 15 minutes per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Pregnancy — defer remaining doses until after pregnancy; not teratogenic but limited data.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Anaphylaxis — rare; ensure emergency epinephrine + observation.", citationIDs: ["openfda_round20"]),
            AttributedBullet("Continued cervical cancer screening per guidelines — vaccine prevents but doesn't cure existing infection; doesn't cover all HPV types.", citationIDs: ["cdc_round20"])
        ],
        adverseReactions: AttributedProse(
            "Injection site pain / swelling / erythema (very common), headache, fatigue, fever, syncope (especially adolescents), rare anaphylaxis.",
            citationIDs: ["cdc_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Other vaccines — can be co-administered with Tdap, MenACWY at same visit (routine adolescent platform).", citationIDs: ["cdc_round20"]),
            AttributedBullet("Hormonal contraceptives — no interaction.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Immunosuppressants — reduced immunogenicity; still recommended.", citationIDs: ["cdc_round20"])
        ],
        nursingImplications: [
            AttributedBullet("Administer IM deltoid (or anterolateral thigh if smaller); 1-inch 22-25 gauge needle.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Sitting / lying position during + 15 min after — syncope risk in adolescents per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Document HPV vaccine on adolescent platform — co-administer Tdap + MenACWY at 11–12 visit.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Counsel BOTH parents + adolescent — vaccine is for cancer prevention; not endorsing sexual activity; works best before exposure.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Document lot # + administration site + date in immunization registry; track 2-dose completion in younger / 3-dose in older.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Encourage cervical screening per guidelines even in vaccinated patients.", citationIDs: ["cdc_round20"])
        ],
        patientTeaching: AttributedProse(
            "This is a shot in your upper arm to prevent cancers caused by HPV — cervical, throat, anal, others. Best given before you start having sex but works well at older ages too. Most common side effect is sore arm. Some people feel lightheaded after — that's why we ask you to sit / lie 15 minutes. Two shots if you start before 15; three if you start later. Continue to get cervical exams as recommended — the vaccine doesn't cover every HPV type.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, cdcR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum InfluenzaVaccineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "influenza-vaccine",
        title: "Influenza vaccine (annual)",
        subtitle: "Inactivated · annual · all ≥6 months · multiple formulations · NAV for needle-phobic age 2–49",
        category: "Inactivated / live attenuated viral vaccine (annual)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Inactivated quadrivalent or trivalent (most common); live attenuated (NAV) for select age range"),
            KeyValueRow(key: "Indications", value: "Annual immunization of everyone ≥6 months without contraindications"),
            KeyValueRow(key: "Notable", value: "Strain composition updated annually per WHO recommendations; protection wanes over season"),
            KeyValueRow(key: "Forms", value: "IIV (standard, high-dose for 65+, adjuvanted, cell-based, recombinant), LAIV (FluMist intranasal age 2–49)")
        ],
        indications: AttributedProse(
            "Annual influenza immunization for everyone ≥6 months of age without contraindications per ACIP. Strongly emphasized in pregnancy, ≥65, chronic disease, immunocompromise, healthcare workers, household contacts of high-risk per primary source.",
            citationIDs: ["cdc_round20", "openfda_round20"]
        ),
        mechanism: AttributedProse(
            "Inactivated — non-replicating antigens → humoral immune response to current season's strains. Live attenuated (LAIV) — cold-adapted, replicates only in cool nasopharynx → mucosal IgA + serum antibodies. Strain composition updated annually.",
            citationIDs: ["cdc_round20"]
        ),
        dosing: [
            DosingBlock(label: "Standard adult IM", body: "0.5 mL IM deltoid annually; ideally September–October before flu season per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "Pediatric (6 mo–8 yr first vaccination)", body: "Two 0.5 mL doses 4 weeks apart in first season; one dose annually thereafter.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "≥65 years preferred", body: "High-dose (Fluzone HD) OR adjuvanted (Fluad) OR recombinant (Flublok) — higher immunogenicity per primary source.", citationIDs: ["cdc_round20"]),
            DosingBlock(label: "LAIV (FluMist)", body: "0.2 mL intranasally; age 2–49 non-pregnant non-immunocompromised; preferred for needle-phobic adolescents.", citationIDs: ["cdc_round20"])
        ],
        contraindications: AttributedProse(
            "Severe hypersensitivity to prior dose or vaccine components; severe egg allergy (rare CI now — egg-free formulations available); GBS within 6 weeks of prior flu vaccine (relative); LAIV — pregnancy, immunocompromise, asthma in <5 (avoid), aspirin therapy in children per primary source.",
            citationIDs: ["cdc_round20"]
        ),
        warnings: [
            AttributedBullet("Egg allergy — historically a contraindication; current ACIP says most egg-allergic patients can receive any age-appropriate flu vaccine; severe egg allergy → recombinant (Flublok) or cell-based (Flucelvax) per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("GBS within 6 weeks of prior flu vaccine — relative contraindication; weigh risk vs benefit.", citationIDs: ["cdc_round20"]),
            AttributedBullet("LAIV — additional contraindications: pregnancy, immunocompromise, recent aspirin (children), age <2 or ≥50.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Strain mismatch in some seasons — vaccine effectiveness varies 40–60% on average; even modest protection reduces hospitalization + death per primary source.", citationIDs: ["cdc_round20"])
        ],
        adverseReactions: AttributedProse(
            "Injection site soreness (most common), low-grade fever, myalgia, headache, fatigue 1–2 days post-vaccination. LAIV — rhinorrhea, sore throat, cough. Rare anaphylaxis; rare GBS (~1 per million doses).",
            citationIDs: ["cdc_round20"]
        ),
        drugInteractions: [
            AttributedBullet("Other vaccines — can be co-administered with COVID-19, Tdap, MenACWY, HPV at same visit.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Antivirals (oseltamivir) — do not give LAIV within 48 hours after antiviral; effect on replication.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Immunosuppressants — reduced immunogenicity; still recommended; consider high-dose formulation.", citationIDs: ["cdc_round20"])
        ],
        nursingImplications: [
            AttributedBullet("IM deltoid; LAIV intranasal divided between nostrils.", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Annual reminder system; ideally before flu season peak (Sept–Oct).", citationIDs: ["openrn_pharm_round20"]),
            AttributedBullet("Counsel pregnancy — inactivated only; flu vaccine provides protection to mother + newborn via transplacental antibodies per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("65+ — recommend high-dose / adjuvanted / recombinant formulations per primary source.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Counsel — annual immunization; protection wanes; egg allergy generally not a barrier.", citationIDs: ["cdc_round20"]),
            AttributedBullet("Document lot # + site + date in registry.", citationIDs: ["openrn_pharm_round20"])
        ],
        patientTeaching: AttributedProse(
            "Get a flu shot every fall — protection wears off over the year. Your arm may be sore for a day or two. The vaccine cannot give you the flu (the inactivated version has no live virus). If you're pregnant, the shot protects you and your baby. If you're 65+, ask about the high-dose version. If you're severely allergic to eggs, there are egg-free versions. Best time is September or October before flu peaks.",
            citationIDs: ["openrn_pharm_round20"]
        ),
        citations: [openfdaR20, openrnPharmR20, cdcR20],
        lastSourceFidelityReview: "2026-05-12"
    )
}
