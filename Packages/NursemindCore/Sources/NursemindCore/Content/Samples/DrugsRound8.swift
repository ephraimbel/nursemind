import Foundation

// Curator-model drug entries (round 8 expansion — GYN endocrine, oncologic endocrine, rheumatology, gout, biologics).
// Sources: openFDA SPL (CC0), Open RN Pharmacology (CC BY 4.0), CDC contraceptive
// guidance (public domain), ACR / ACOG / ASCO / NOF concept citations.

private let openfda = CitationSource(
    id: "openfda_round8",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR8 = CitationSource(
    id: "openrn_pharm_round8",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=hormonal+rheumatology+biologic+bisphosphonate",
    lastRetrieved: "2026-05-04"
)
private let cdcR8 = CitationSource(
    id: "cdc_round8",
    shortName: "CDC US Medical Eligibility Criteria for Contraceptive Use + ACIP",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/contraception/hcp/usmec/",
    lastRetrieved: "2026-05-04"
)
private let specialtyConceptR8 = CitationSource(
    id: "specialty_concept_round8",
    shortName: "ACR / ACOG / ASCO / NOF guidelines (concept citation)",
    publisher: "American College of Rheumatology · ACOG · ASCO · National Osteoporosis Foundation",
    license: .factCitationOnly,
    url: "https://rheumatology.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

// MARK: - Combined Oral Contraceptive

public enum CombinedOCPSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "combined-oral-contraceptive",
        title: "Combined oral contraceptive (estrogen + progestin)",
        subtitle: "Ethinyl estradiol + progestin · contraception + cycle control",
        category: "Combined hormonal contraceptive",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Estrogen-progestin contraceptive (CHC)"),
            KeyValueRow(key: "Efficacy", value: "Perfect use ~0.3% / typical use ~7% per primary source"),
            KeyValueRow(key: "Boxed warning", value: "Cigarette use + age ≥35 → increased CV risk; AVOID per primary source"),
            KeyValueRow(key: "Other CHC formulations", value: "Patch (Ortho Evra) and ring (NuvaRing) share same risk profile")
        ],
        indications: AttributedProse(
            "Pregnancy prevention; cycle regulation; dysmenorrhea; menorrhagia; PCOS hyperandrogenism; acne; PMDD; menstrual migraine prevention (without aura) per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Estrogen + progestin → suppress LH/FSH → prevent ovulation; thicken cervical mucus; thin endometrium.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Standard cycle", body: "1 active tablet PO daily × 21 days, then 7 days placebo (or hormone-free interval); start day 1 of menses or Sunday after menses begins per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Continuous / extended", body: "Skip placebo to suppress menses; counsel about breakthrough bleeding initially.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "History of VTE / PE / stroke / MI; known thrombophilia; uncontrolled HTN; smoking and age ≥35; migraine with aura; current breast cancer; severe liver disease; <21 days postpartum (or 30 days if other VTE risk); known or suspected pregnancy per primary source.",
            citationIDs: ["openfda_round8", "cdc_round8"]
        ),
        warnings: [
            AttributedBullet("BOXED — cigarette smoking + age ≥35 markedly increases serious cardiovascular events.", citationIDs: ["openfda_round8"]),
            AttributedBullet("VTE / PE risk — highest in first months; counsel ACHES (Abdominal pain, Chest pain, Headache, Eye changes, Severe leg pain) per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Stroke risk in migraine with aura.", citationIDs: ["openfda_round8"]),
            AttributedBullet("HTN, hepatic adenoma, breast cancer (small relative-risk increase).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Reduced efficacy with strong CYP3A4 inducers (rifampin, phenytoin, carbamazepine, St. John's wort, some HIV drugs).", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Breakthrough bleeding, nausea, breast tenderness, mood changes, headache, weight changes, decreased libido.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 INDUCERS — REDUCE efficacy → use BACKUP method (rifampin, phenytoin, carbamazepine, phenobarbital, St. John's wort, certain HIV protease inhibitors).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Lamotrigine — CHC LOWERS lamotrigine levels; seizure risk; consider non-hormonal contraception per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Antibiotics — only rifampin proven to reduce efficacy; routine antibiotics generally do not require backup per primary source.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Use US MEC categories (CDC) to assess safety with comorbidities — Category 1/2 generally safe; 3/4 caution / contraindicated.", citationIDs: ["cdc_round8"]),
            AttributedBullet("Counsel ACHES warning signs at every visit; review missed-pill instructions.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Postpartum — wait 21 days minimum (30 if VTE risk); progestin-only safer in lactation.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Smokers ≥35 → DO NOT prescribe; offer alternative contraception per primary source.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Take your pill at the same time every day. Tell us about leg pain, chest pain, severe headache, vision changes, or severe abdominal pain — these can be warning signs of a clot. Do not smoke if you take this; if you are 35 or older and you smoke, this medicine is unsafe for you. If you forget a pill, take it as soon as you remember. Tell us about all medications, including antibiotics and seizure medications, and supplements like St. John's wort.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, cdcR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Levonorgestrel IUD

public enum LevonorgestrelIUDSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "levonorgestrel-iud",
        title: "Levonorgestrel IUD",
        subtitle: "Mirena / Liletta / Kyleena · LARC · 3–8 years depending on product",
        category: "Long-acting reversible contraception",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Progestin-only intrauterine device (LARC)"),
            KeyValueRow(key: "Duration", value: "Mirena 8 yr (52 mg); Liletta 8 yr; Kyleena 5 yr (19.5 mg); Skyla 3 yr (13.5 mg) per primary source"),
            KeyValueRow(key: "Efficacy", value: "Perfect AND typical use <0.5%/year — most effective reversible method per primary source"),
            KeyValueRow(key: "Other use", value: "Heavy menstrual bleeding (Mirena FDA-approved); endometrial protection in HRT")
        ],
        indications: AttributedProse(
            "Long-acting reversible contraception; treatment of heavy menstrual bleeding (Mirena); endometrial protection during estrogen-only HRT per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Levonorgestrel locally — thickens cervical mucus, inhibits sperm motility, thins endometrium, may suppress ovulation in some users. NOT primarily by ovulation suppression; NOT abortifacient per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Insertion", body: "Inserted by trained provider during menses or any time pregnancy can be excluded; immediate effective contraception if inserted in first 7 days of cycle.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Known or suspected pregnancy; current PID or recurrent endometritis; cervical / uterine cancer; unexplained vaginal bleeding; distorted uterine cavity; current cervicitis (treat first); known hypersensitivity per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("Uterine perforation at insertion (rare); higher risk in lactating women per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Expulsion (~3–6% in first year; higher with heavy menses or fibroids).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Ectopic pregnancy risk if pregnancy occurs (lower overall pregnancy rate, but higher proportion ectopic).", citationIDs: ["openfda_round8"]),
            AttributedBullet("PID risk slightly elevated in first 20 days post-insertion; STI screening per protocol.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Irregular bleeding / spotting (very common first 3–6 months), amenorrhea (~20% by year 1), cramping, ovarian cysts (functional), acne, headache, mood changes.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Minimal — local action; CYP inducers do not significantly affect efficacy unlike COC.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-insertion — counsel on bleeding pattern (irregular early, often lighter later or amenorrhea), expulsion, perforation; STI screening.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Teach STRING CHECK monthly post-insertion; clinician follow-up at 4–6 weeks.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Pain control — consider NSAID 30–60 min pre-insertion; misoprostol per provider for difficult insertion.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("If pregnancy occurs with IUD in place — REMOVE IUD if strings visible (reduces miscarriage / infection risk); rule out ectopic per primary source.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "You can check the strings monthly by reaching into your vagina with clean fingers; tell us if you cannot feel them or if you feel the hard plastic of the device. Bleeding is irregular for the first few months — often lighter eventually, sometimes none. Tell us about severe pelvic pain, fever, foul discharge, or missed period (rule out pregnancy). If you become pregnant, tell us right away.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, cdcR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Medroxyprogesterone (Depot)

public enum MedroxyprogesteroneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "medroxyprogesterone",
        title: "Medroxyprogesterone (depot)",
        subtitle: "Depo-Provera · IM or SQ injection every 3 months",
        category: "Long-acting progestin contraceptive",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Depot progestin"),
            KeyValueRow(key: "Schedule", value: "150 mg IM (or 104 mg SQ) every 11–13 weeks per primary source"),
            KeyValueRow(key: "Efficacy", value: "Perfect ~0.2% / typical ~4%"),
            KeyValueRow(key: "Boxed warning", value: "Bone-mineral-density loss (largely reversible after discontinuation)")
        ],
        indications: AttributedProse(
            "Long-acting contraception; off-label endometriosis pain; menstrual suppression (e.g., transgender care, heavy menses) per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Depot progestin → suppresses LH → prevents ovulation; thickens cervical mucus; thins endometrium.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Adult IM", body: "150 mg IM into deltoid or gluteal every 11–13 weeks per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Adult SQ", body: "104 mg SQ every 12–14 weeks per primary source.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Known or suspected pregnancy; undiagnosed vaginal bleeding; current breast cancer; significant liver disease; known hypersensitivity.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("BOXED — bone-mineral-density loss with prolonged use; consider duration limits and risk-benefit; encourage calcium / vitamin D / weight-bearing exercise per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Delayed return to fertility — may take 6–12 months after last injection.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Weight gain commonly reported (~5 lb / year on average).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Mood changes / depression — counsel and screen.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Irregular bleeding (often amenorrhea by month 12), weight gain, headache, mood changes, decreased libido, injection-site reaction.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Aminoglutethimide — reduces efficacy.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Strong CYP3A4 inducers — possible reduced effect; clinical impact debated; standard injection is high-dose depot.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm not pregnant before each injection; use back-up method × 7 days if dose given >2 weeks late per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Rotate injection sites; deep IM (deltoid or ventrogluteal) for IM form; SQ form has different needle.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Counsel on bone health — calcium 1000–1200 mg/day, vitamin D, weight-bearing exercise.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Schedule next dose at end of visit.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "You will need an injection every 3 months. Bleeding will be irregular at first; many women stop having periods after a year. After stopping, fertility may take up to a year to return — plan accordingly. Eat calcium, get vitamin D, do weight-bearing exercise. Tell us about severe headaches, mood changes, or any unusual bleeding.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, cdcR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tamoxifen

public enum TamoxifenSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tamoxifen",
        title: "Tamoxifen",
        subtitle: "Nolvadex · selective estrogen receptor modulator (SERM)",
        category: "SERM antiestrogen",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective estrogen receptor modulator"),
            KeyValueRow(key: "Indications", value: "Adjuvant + metastatic breast cancer (premenopausal); risk reduction in high-risk women per primary source"),
            KeyValueRow(key: "Boxed warnings", value: "Endometrial cancer + uterine sarcoma; thromboembolic events; stroke"),
            KeyValueRow(key: "Notable", value: "Activated by CYP2D6 → fluoxetine / paroxetine REDUCE active metabolite; avoid these antidepressants per primary source")
        ],
        indications: AttributedProse(
            "Adjuvant treatment of hormone-receptor-positive breast cancer (premenopausal women); metastatic breast cancer; risk reduction in high-risk premenopausal and postmenopausal women; ductal carcinoma in situ per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Antagonist at estrogen receptors in breast tissue (anti-tumor effect); partial agonist in uterus (endometrial proliferation), bone (preserves BMD), and clotting factors (procoagulant).",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Adjuvant breast cancer", body: "20 mg PO daily × 5–10 years per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Risk reduction", body: "20 mg PO daily × 5 years.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "History of DVT / PE / stroke (boxed warning); concurrent warfarin (unless careful monitoring); pregnancy / lactation; known hypersensitivity.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("BOXED — uterine cancer (endometrial cancer and rare uterine sarcoma); REPORT ANY abnormal vaginal bleeding per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("BOXED — VTE / PE / stroke; counsel symptoms.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hot flashes / vasomotor symptoms (very common).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Cataracts; hepatotoxicity (rare); ovarian cysts in premenopausal.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Hot flashes, vaginal dryness, irregular menses, mood changes, decreased libido, cataract risk, transient bone pain at start (\"flare\").",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Strong CYP2D6 inhibitors — REDUCE active metabolite (endoxifen) → reduced efficacy. Fluoxetine / paroxetine specifically AVOID; venlafaxine, citalopram, escitalopram are safer per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Warfarin — INR rises significantly; monitor closely.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Estrogen-containing products — antagonize tamoxifen; AVOID.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Annual gynecology exam; report any post-menopausal bleeding immediately — endometrial cancer evaluation.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Counsel on VTE warning signs — leg pain, dyspnea, chest pain.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Reconcile antidepressants with oncologist — if SSRI needed for hot flashes, choose venlafaxine or escitalopram (NOT fluoxetine / paroxetine).", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Pregnancy is contraindicated — use NON-HORMONAL contraception during therapy and ≥2 months after.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed; expect hot flashes — usually improve over months. Tell us about any unusual vaginal bleeding, leg pain or swelling, chest pain, shortness of breath, or sudden vision changes. Use non-hormonal birth control. Annual GYN check is essential. Tell every provider you take tamoxifen — fluoxetine and paroxetine reduce its effectiveness.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Letrozole

public enum LetrozoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "letrozole",
        title: "Letrozole",
        subtitle: "Femara · aromatase inhibitor · postmenopausal breast cancer",
        category: "Aromatase inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aromatase inhibitor (AI)"),
            KeyValueRow(key: "Indications", value: "Adjuvant + metastatic HR-positive breast cancer in POSTMENOPAUSAL women; ovulation induction (off-label, PCOS) per primary source"),
            KeyValueRow(key: "Notable", value: "Bone-density loss + arthralgia (very common); preserves cardiovascular / endometrial advantage vs tamoxifen"),
            KeyValueRow(key: "Other AIs", value: "Anastrozole (Arimidex), exemestane (Aromasin)")
        ],
        indications: AttributedProse(
            "Adjuvant and metastatic hormone-receptor-positive breast cancer in postmenopausal women; off-label ovulation induction in PCOS (preferred over clomiphene per primary source).",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Inhibits aromatase enzyme → blocks peripheral conversion of androgens to estrogens → markedly reduces circulating estrogen in postmenopausal women (does not work in premenopausal — ovaries override).",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Adjuvant breast cancer", body: "2.5 mg PO daily × 5–10 years per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Ovulation induction (off-label)", body: "2.5–7.5 mg PO daily on cycle days 3–7 per primary source.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Premenopausal status (without ovarian suppression); pregnancy / lactation; hypersensitivity.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("Bone-density loss / fractures — baseline + biennial DXA; calcium / vitamin D; bisphosphonate per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Arthralgia (\"AI arthralgia\") — very common; affects adherence; non-pharmacologic + analgesics; switch class if intolerable.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hot flashes, fatigue, mood changes.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hyperlipidemia, hepatotoxicity (uncommon), cardiovascular events.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Arthralgia, hot flashes, fatigue, weight gain, headache, peripheral edema, hyperlipidemia, bone-density loss.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Estrogen-containing products — antagonize; AVOID.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Tamoxifen — combination not more effective; not recommended together.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm postmenopausal status (FSH if perimenopausal); not effective premenopausally without ovarian suppression.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Baseline DXA, lipids; rescreen biennially.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Counsel on adherence — joint pain is a leading cause of discontinuation; non-pharm (exercise, weight loss, acupuncture), acetaminophen / NSAIDs, switch AI per provider.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Calcium 1000–1200 mg + vitamin D 800–1000 IU daily.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Take once daily. Joint and muscle aches are common — exercise, stretching, and over-the-counter pain medication can help; tell us if pain interferes with activity. Get a bone-density scan as scheduled. Take calcium and vitamin D. Tell us about any unusual fractures, severe joint pain, or heart-related symptoms.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sulfasalazine

public enum SulfasalazineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "sulfasalazine",
        title: "Sulfasalazine",
        subtitle: "Azulfidine · DMARD + IBD agent · sulfa-based",
        category: "DMARD / 5-ASA",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Conventional DMARD; sulfa + 5-ASA"),
            KeyValueRow(key: "Uses", value: "Rheumatoid arthritis, ulcerative colitis, juvenile idiopathic arthritis"),
            KeyValueRow(key: "Notable", value: "G6PD-deficient → hemolysis; AVOID in sulfa allergy"),
            KeyValueRow(key: "Onset (RA)", value: "1–3 months for full benefit")
        ],
        indications: AttributedProse(
            "Mild-to-moderate ulcerative colitis (active and maintenance); rheumatoid arthritis; juvenile idiopathic arthritis; ankylosing spondylitis (mild) per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Cleaved by colonic bacteria into 5-aminosalicylic acid (anti-inflammatory) + sulfapyridine (carrier; main toxicity driver). Mechanism in RA not fully understood — modulates inflammatory cytokines.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Ulcerative colitis (active)", body: "1 g PO TID-QID; titrate from 500 mg to limit GI; maintenance 500 mg–1 g BID per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Rheumatoid arthritis", body: "Initial 500 mg PO daily; titrate to 1 g BID; maximum 3 g/day per primary source.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Sulfa allergy (cross-reactivity); G6PD deficiency (hemolytic anemia); intestinal / urinary obstruction; porphyria; hypersensitivity.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("Severe cutaneous adverse reactions (SJS/TEN, DRESS) — STOP at any rash.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Bone-marrow suppression — agranulocytosis, aplastic anemia; CBC monitoring.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hepatotoxicity — LFT monitoring.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hemolytic anemia in G6PD-deficient patients.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Reversible male infertility (oligospermia).", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "GI (nausea, dyspepsia — very common, dose-related), headache, rash, photosensitivity, leukopenia, anemia, transient LFT elevation, ORANGE-YELLOW skin / urine / contact-lens staining.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Folate — sulfasalazine impairs absorption; supplement folic acid 1 mg PO daily per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Methotrexate — combined with caution; additive hematologic / hepatic toxicity.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Warfarin — INR rises; monitor.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Digoxin — sulfasalazine can reduce digoxin absorption.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + periodic CBC, LFTs, BUN/creatinine; G6PD testing in at-risk populations per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Take with food to reduce GI; titrate slowly; co-administer folic acid 1 mg daily.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Counsel on orange-yellow body fluids (harmless) and contact-lens staining.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("STOP and notify for rash, fever, sore throat, or any sign of serum sickness.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Take with food and a full glass of water. Take folic acid daily as prescribed. Your urine, sweat, and tears may turn orange-yellow — this is harmless but can stain contact lenses. STOP and call us right away for any new rash, fever, mouth sores, severe sore throat, or yellow eyes/skin. Use sun protection.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Adalimumab

public enum AdalimumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "adalimumab",
        title: "Adalimumab",
        subtitle: "Humira · TNF-α inhibitor · subcutaneous biologic",
        category: "TNF inhibitor (biologic DMARD)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Anti-TNF monoclonal antibody"),
            KeyValueRow(key: "Indications", value: "RA, JIA, psoriatic arthritis, AS, Crohn's, UC, plaque psoriasis, hidradenitis suppurativa, uveitis"),
            KeyValueRow(key: "Boxed warnings", value: "Serious infection (TB reactivation, fungal); malignancy (lymphoma in children/adolescents)"),
            KeyValueRow(key: "Pre-treatment", value: "Latent TB screening (PPD or IGRA), HBV serology, vaccinations updated per primary source")
        ],
        indications: AttributedProse(
            "Moderate-to-severe rheumatoid arthritis, psoriatic arthritis, ankylosing spondylitis, Crohn's, ulcerative colitis, plaque psoriasis, juvenile idiopathic arthritis, hidradenitis suppurativa, uveitis per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Recombinant human IgG1 monoclonal antibody binds soluble and membrane-bound TNF-α → blocks TNF-mediated inflammation.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Rheumatoid arthritis (adult)", body: "40 mg SQ EVERY OTHER WEEK; some patients require weekly dosing per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Crohn's / UC (adult)", body: "Loading 160 mg SQ day 1, 80 mg day 15, then 40 mg every other week per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Plaque psoriasis", body: "80 mg SQ once, then 40 mg SQ every other week starting week 2.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Active serious infection (including localized); active TB; hypersensitivity.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("BOXED — serious infections (bacterial, viral, fungal, opportunistic); SCREEN for latent TB and HBV before initiation; counsel symptoms of infection.", citationIDs: ["openfda_round8"]),
            AttributedBullet("BOXED — malignancy; lymphoma (especially HSTCL in adolescents/young adults with IBD on combination immunosuppression).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Heart failure — caution in moderate-severe HF; can worsen.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Demyelinating disease, lupus-like syndrome, hepatitis B reactivation, cytopenias.", citationIDs: ["openfda_round8"]),
            AttributedBullet("AVOID live vaccines — current and during treatment.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Injection-site reaction, headache, rash, nasopharyngitis, infection.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Other biologic DMARDs / JAK inhibitors — additive infection risk; AVOID combination.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Methotrexate — often combined for synergy in RA; standard.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-initiation — TB screen (PPD or IGRA), HBV serology (HBsAg, anti-HBc), update vaccines, HIV per risk per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Teach SQ injection technique; rotate sites (thigh, abdomen); refrigerate; allow to come to room temperature 15–30 min before injection per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("ASK about fever, infection, cough, weight loss at every visit.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Hold for active infection; pause perioperatively per provider.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Inject under the skin every 2 weeks; rotate sites. Take the pen out of the refrigerator 15–30 minutes before injecting so it's not cold. Tell us right away about fever, sore throat, persistent cough, night sweats, weight loss, new lumps, or any infection. Avoid live vaccines (like nasal flu, MMR, varicella). Tell every provider you are on this medication before any procedure.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Etanercept

public enum EtanerceptSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "etanercept",
        title: "Etanercept",
        subtitle: "Enbrel · TNF receptor fusion protein · weekly SQ",
        category: "TNF inhibitor (biologic DMARD)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "TNF-receptor fusion protein"),
            KeyValueRow(key: "Indications", value: "RA, psoriatic arthritis, AS, plaque psoriasis, JIA"),
            KeyValueRow(key: "Boxed warnings", value: "Serious infection; malignancy (similar class as adalimumab)"),
            KeyValueRow(key: "Notable", value: "Less effective for inflammatory bowel disease (do NOT use in Crohn's / UC)")
        ],
        indications: AttributedProse(
            "Rheumatoid arthritis, psoriatic arthritis, ankylosing spondylitis, plaque psoriasis, polyarticular juvenile idiopathic arthritis per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Soluble TNF receptor (TNFR2) fused to IgG1 Fc → binds TNF-α and TNF-β → prevents binding to native TNF receptor → blocks TNF-mediated inflammation.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Adult RA / PsA / AS", body: "50 mg SQ once weekly OR 25 mg SQ twice weekly per primary source.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Sepsis; active serious infection; hypersensitivity. Do NOT use in Crohn's / UC — not effective.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("Same class warnings as adalimumab — serious infection (TB, fungal, opportunistic), malignancy, HF worsening, demyelinating disease, lupus-like syndrome, HBV reactivation.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Pre-treatment — TB and HBV screening, vaccinations.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Injection-site reaction (very common — mild, self-limited), URI, headache, rash.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Other biologic DMARDs — combination NOT recommended.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Same pre-initiation workup as adalimumab.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("SQ teaching — rotate thigh / abdomen / upper outer arm; refrigerate; warm to room temperature 15–30 min before injection.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Hold for active infection; perioperative per surgeon.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Inject once a week (or twice weekly if your dose is split). Rotate sites. Take it out of the fridge ~30 minutes before injection. Tell us right away about fever, persistent cough, night sweats, weight loss, or any infection. Avoid live vaccines.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Allopurinol

public enum AllopurinolSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "allopurinol",
        title: "Allopurinol",
        subtitle: "Zyloprim · xanthine oxidase inhibitor · gout urate-lowering",
        category: "Xanthine oxidase inhibitor",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Xanthine oxidase inhibitor"),
            KeyValueRow(key: "Use", value: "Chronic gout urate-lowering therapy; tumor lysis syndrome prophylaxis"),
            KeyValueRow(key: "Targets", value: "Serum urate <6 mg/dL (or <5 in tophaceous) per primary source"),
            KeyValueRow(key: "AVOID with azathioprine / 6-MP", value: "→ severe BMS; if must combine, REDUCE the thiopurine dose by 75% per primary source")
        ],
        indications: AttributedProse(
            "Chronic management of gout; tumor lysis syndrome prophylaxis in chemotherapy; recurrent calcium oxalate stones with hyperuricosuria per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Inhibits xanthine oxidase → reduces conversion of hypoxanthine and xanthine to uric acid → lowers serum urate.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Gout (adult)", body: "Initial 100 mg PO daily; titrate by 100 mg every 2–5 weeks to target serum urate <6 mg/dL; max 800 mg/day per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "TLS prophylaxis", body: "300 mg PO daily 1–2 days before chemo; continue 3–7 days; renal-dose adjusted.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Renal impairment", body: "Start at 50–100 mg PO daily; titrate cautiously per primary source.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; HLA-B*5801 positive (severe SJS/TEN risk — screen in Asian, Korean, Han Chinese, African per primary source).",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("BOXED-equivalent — severe hypersensitivity / SJS/TEN / DRESS; risk highest in Asian patients (HLA-B*5801) and renal impairment per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Acute gout flare on initiation — co-prescribe NSAID, colchicine, or low-dose steroid for first 3–6 months as flare prophylaxis per primary source.", citationIDs: ["specialty_concept_round8"]),
            AttributedBullet("Hepatotoxicity; bone-marrow suppression (rare).", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Rash, GI upset, headache, transient LFT elevation, gout flare during initiation.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("AZATHIOPRINE / 6-MERCAPTOPURINE — markedly raises 6-MP levels → severe BMS; REDUCE thiopurine dose by 75% if combination required per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Warfarin — INR rises; monitor.", citationIDs: ["openfda_round8"]),
            AttributedBullet("ACE inhibitors / thiazides — increased hypersensitivity risk.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("HLA-B*5801 screening in high-risk ethnic groups before initiation per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Renal-dose adjustment; serial urate q2–5 weeks during titration.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Counsel on PROPHYLAXIS for gout flares (NSAID or colchicine) during first 3–6 months.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("STOP at any rash and notify provider — early hypersensitivity can progress to SJS/TEN.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Take with food and plenty of water. Expect occasional gout attacks for the first 3–6 months — keep taking allopurinol AND your flare medicine. STOP and call us right away for any new rash, fever, blisters, or peeling skin. Get blood tests to check uric acid level. Tell every provider you take this — especially if they consider azathioprine or 6-MP.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Colchicine

public enum ColchicineSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "colchicine",
        title: "Colchicine",
        subtitle: "Colcrys · acute and prophylactic gout · narrow therapeutic index",
        category: "Anti-inflammatory (gout)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Tubulin inhibitor — anti-inflammatory"),
            KeyValueRow(key: "Indications", value: "Acute gout (early in attack); chronic gout flare prophylaxis; familial Mediterranean fever; pericarditis"),
            KeyValueRow(key: "Notable", value: "Narrow therapeutic index — overdose can be fatal"),
            KeyValueRow(key: "Common cause of toxicity", value: "Drug interactions (CYP3A4 / P-gp inhibitors), renal impairment, hepatic impairment")
        ],
        indications: AttributedProse(
            "Acute gout attack (most effective when started within 24 hours); chronic prophylaxis during urate-lowering therapy initiation; familial Mediterranean fever; pericarditis (acute and recurrent) per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Disrupts microtubule formation → inhibits neutrophil migration, phagocytosis, and inflammasome activation → reduces inflammation in acute gout.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Acute gout", body: "1.2 mg PO at first sign of flare, then 0.6 mg PO 1 hour later; max 1.8 mg in 1 hour per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Prophylaxis (chronic)", body: "0.6 mg PO once or twice daily during initiation of urate-lowering therapy.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Renal / hepatic impairment", body: "Significant dose reduction per pharmacy; contraindicated in severe renal failure with concurrent CYP3A4 / P-gp inhibitor per primary source.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Concurrent strong CYP3A4 / P-gp inhibitor with renal or hepatic impairment (BLACK-BOX-equivalent — fatal toxicity reported); severe renal or hepatic impairment alone (use cautiously); hypersensitivity per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("Fatal overdose — narrow margin between therapeutic and toxic; serial dosing during one flare = no benefit, more toxicity per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Bone-marrow suppression, rhabdomyolysis (especially with statins), neuromyopathy (chronic use).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Diarrhea is the most common adverse effect — may signal toxicity.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "Diarrhea (very common, dose-related), nausea, vomiting, abdominal pain, neuromyopathy with chronic use, alopecia.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("STRONG CYP3A4 inhibitors — clarithromycin, itraconazole, ketoconazole, ritonavir, grapefruit — markedly raise colchicine levels; DOSE-REDUCE or AVOID per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("P-glycoprotein inhibitors — cyclosporine; same risk.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Statins — additive myopathy / rhabdomyolysis.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Reconcile EVERY new medication for CYP3A4 / P-gp interactions — fatal overdoses reported.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Counsel that diarrhea may signal early toxicity — STOP and notify if severe.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Renal / hepatic dose reductions per pharmacy.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("DO NOT exceed dosing schedule for an acute flare — additional doses do not improve outcome and increase toxicity.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Take exactly as prescribed for a gout attack — do not double up. Diarrhea, nausea, or muscle weakness may mean too much medicine — STOP and call us. Avoid grapefruit and grapefruit juice. Tell every provider and pharmacist you take colchicine — many medications and supplements raise the level dangerously.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Alendronate

public enum AlendronateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "alendronate",
        title: "Alendronate",
        subtitle: "Fosamax · oral bisphosphonate · osteoporosis",
        category: "Bisphosphonate (oral)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Nitrogen-containing bisphosphonate"),
            KeyValueRow(key: "Indications", value: "Postmenopausal osteoporosis (treatment + prevention); male osteoporosis; glucocorticoid-induced osteoporosis; Paget disease"),
            KeyValueRow(key: "Critical administration", value: "Empty stomach, FULL glass plain water, REMAIN UPRIGHT 30+ minutes — esophagitis prevention"),
            KeyValueRow(key: "Drug holiday", value: "Consider after 3–5 years per primary source")
        ],
        indications: AttributedProse(
            "Treatment and prevention of postmenopausal osteoporosis; osteoporosis in men; glucocorticoid-induced osteoporosis; Paget disease of bone per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Adsorbs to bone hydroxyapatite → inhibits osteoclast-mediated bone resorption → reduces bone turnover and improves bone mineral density.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "Osteoporosis treatment", body: "70 mg PO ONCE WEEKLY OR 10 mg PO daily per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Prevention", body: "35 mg PO weekly OR 5 mg PO daily.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "Paget disease", body: "40 mg PO daily × 6 months.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Inability to remain upright for ≥30 minutes; esophageal abnormalities that delay emptying (stricture, achalasia); severe renal impairment (CrCl <35); hypocalcemia (correct first); hypersensitivity per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("Esophagitis, esophageal ulceration / stricture, GI bleeding — administer correctly to prevent.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Osteonecrosis of the jaw (rare; higher risk with IV bisphosphonates, dental procedures, immunosuppression) — dental clearance before initiation per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Atypical femoral fracture (subtrochanteric / diaphyseal); thigh / groin pain warrants imaging per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hypocalcemia (correct calcium and vitamin D before initiating).", citationIDs: ["openfda_round8"]),
            AttributedBullet("Severe musculoskeletal pain.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "GI — dyspepsia, esophagitis, abdominal pain; transient acute-phase reaction (more common with IV); bone / joint / muscle pain.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Calcium, antacids, iron, food — dramatically reduce absorption; separate by at least 30 minutes per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("NSAIDs — additive GI mucosal injury.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("ADMINISTRATION — first thing in morning, full glass of plain water, NPO for ≥30 minutes, REMAIN UPRIGHT for ≥30 minutes; no other medication, food, calcium, or coffee in that 30 min window per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Co-administer calcium 1000–1200 mg + vitamin D 800–1000 IU daily per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Dental evaluation before initiation; counsel on jaw symptoms and dental procedures.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Reassess bone density and need for continuation (drug holiday) at 3–5 years per primary source.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "Take this medicine first thing in the morning with a full glass of plain WATER (not coffee, juice, or mineral water). DO NOT eat, drink anything else, or take other medicines for at least 30 minutes. Stay UPRIGHT (sitting or standing) for 30 minutes. Take calcium and vitamin D daily, but at a different time of day. Tell us about heartburn, swallowing problems, jaw pain, thigh pain, or any dental procedure planned.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Tocilizumab

public enum TocilizumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "tocilizumab",
        title: "Tocilizumab",
        subtitle: "Actemra · IL-6 receptor antagonist · RA / GCA / cytokine release syndrome",
        category: "IL-6 inhibitor (biologic DMARD)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Humanized monoclonal antibody — anti-IL-6 receptor"),
            KeyValueRow(key: "Indications", value: "RA, JIA, giant-cell arteritis (GCA), CAR-T cell therapy cytokine release syndrome (CRS), polymyalgia rheumatica"),
            KeyValueRow(key: "Routes", value: "IV (RA, GCA, CRS) or SQ (RA, GCA)"),
            KeyValueRow(key: "Boxed warning", value: "Serious infection (bacterial, viral, fungal, opportunistic) — TB / HBV screening before start")
        ],
        indications: AttributedProse(
            "Moderate-to-severe rheumatoid arthritis; giant-cell arteritis; CAR-T cell-induced cytokine release syndrome; systemic and polyarticular juvenile idiopathic arthritis; COVID-19 hospitalized patients with significant inflammation per primary source.",
            citationIDs: ["openfda_round8"]
        ),
        mechanism: AttributedProse(
            "Binds soluble and membrane-bound IL-6 receptor → blocks IL-6-mediated inflammation; IL-6 is a key driver of acute-phase response, T-cell activation, and synovial inflammation.",
            citationIDs: ["openfda_round8"]
        ),
        dosing: [
            DosingBlock(label: "RA — IV", body: "4 mg/kg IV every 4 weeks; titrate to 8 mg/kg per response per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "RA — SQ", body: "162 mg SQ weekly (≥100 kg) or every other week (<100 kg) per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "GCA", body: "162 mg SQ weekly + glucocorticoid taper per primary source.", citationIDs: ["openfda_round8"]),
            DosingBlock(label: "CRS (CAR-T)", body: "8 mg/kg IV (max 800 mg); may repeat if no improvement at 8 hours per primary source.", citationIDs: ["openfda_round8"])
        ],
        contraindications: AttributedProse(
            "Active serious infection; hypersensitivity.",
            citationIDs: ["openfda_round8"]
        ),
        warnings: [
            AttributedBullet("BOXED — serious infection; SCREEN for TB, HBV before initiation; hold for active infection.", citationIDs: ["openfda_round8"]),
            AttributedBullet("GI perforation — caution in diverticulitis history.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hepatotoxicity — monitor LFTs; discontinue for severe elevation per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Neutropenia / thrombocytopenia — monitor CBC.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Hyperlipidemia — monitor lipids and treat per ASCVD risk.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Tocilizumab MASKS the inflammatory response (suppresses CRP) — clinical signs of infection are more important than labs.", citationIDs: ["openfda_round8"])
        ],
        adverseReactions: AttributedProse(
            "URI, headache, hypertension, transient LFT elevation, hyperlipidemia, neutropenia.",
            citationIDs: ["openfda_round8"]
        ),
        drugInteractions: [
            AttributedBullet("Live vaccines — AVOID.", citationIDs: ["openfda_round8"]),
            AttributedBullet("CYP450 substrates — IL-6 normally suppresses CYP enzymes; tocilizumab restores them, lowering levels of warfarin, statins, OCPs, theophylline. Monitor narrow-window drugs per primary source.", citationIDs: ["openfda_round8"]),
            AttributedBullet("Other biologic DMARDs / JAK inhibitors — additive infection risk; AVOID combination.", citationIDs: ["openfda_round8"])
        ],
        nursingImplications: [
            AttributedBullet("Same pre-initiation workup as other biologics — TB, HBV, vaccines updated.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("Monitor CBC, LFTs, lipids at baseline and periodically per primary source.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("CRP / ESR are SUPPRESSED on tocilizumab — clinical exam matters more for infection diagnosis.", citationIDs: ["openrn_pharm_round8"]),
            AttributedBullet("In CRS, expect rapid clinical response within hours of administration.", citationIDs: ["openrn_pharm_round8"])
        ],
        patientTeaching: AttributedProse(
            "This medicine reduces inflammation but also weakens your immune defense. Tell us right away about fever, persistent cough, sore throat, urinary symptoms, severe abdominal pain (especially with diverticulosis history), or any infection. Get blood tests as scheduled. Avoid live vaccines. Tell every provider and pharmacist you take tocilizumab — it changes how some other medications work.",
            citationIDs: ["openrn_pharm_round8"]
        ),
        citations: [openfda, openrnPharmR8, specialtyConceptR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}
