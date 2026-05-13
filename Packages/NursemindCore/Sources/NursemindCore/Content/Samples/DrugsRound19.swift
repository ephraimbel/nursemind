import Foundation

// Curator-model drug entries (round 19 — reproductive / OB + GU + bone health).

private let openfdaR19 = CitationSource(
    id: "openfda_round19",
    shortName: "FDA SPL — generic labeling (per drug)",
    publisher: "openFDA Drug Label API",
    license: .cc0,
    url: "https://api.fda.gov/drug/label.json",
    lastRetrieved: "2026-05-04"
)
private let openrnPharmR19 = CitationSource(
    id: "openrn_pharm_round19",
    shortName: "Open RN Nursing Pharmacology",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=ob+gu+bone",
    lastRetrieved: "2026-05-04"
)
private let specialtyR19 = CitationSource(
    id: "specialty_round19",
    shortName: "ACOG / AUA / NAMS / Endocrine Society / NOF concept citations",
    publisher: "ACOG · AUA · NAMS · Endocrine Society · NOF",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)

public enum MifepristoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mifepristone",
        title: "Mifepristone",
        subtitle: "Mifeprex / Korlym · progesterone receptor antagonist · medical abortion + Cushing's hyperglycemia",
        category: "Antiprogestin (progesterone receptor antagonist)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic steroid; progesterone receptor antagonist"),
            KeyValueRow(key: "Indications", value: "Medical termination of pregnancy ≤70 days (with misoprostol); endogenous Cushing's-related hyperglycemia (Korlym)"),
            KeyValueRow(key: "Boxed", value: "Serious infection + bleeding with medical abortion regimen; REMS program"),
            KeyValueRow(key: "Notable", value: "State + federal restrictions on medical abortion vary; counseling required")
        ],
        indications: AttributedProse(
            "Medical termination of intrauterine pregnancy ≤70 days gestation when given with misoprostol; treatment of hyperglycemia secondary to endogenous Cushing's syndrome (Korlym formulation) per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Competitive progesterone receptor antagonist → blocks progesterone-required maintenance of endometrium / decidua + cervical softening. Also glucocorticoid receptor antagonist → counters cortisol effects in Cushing's.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Medical abortion", body: "200 mg PO × 1 followed by misoprostol 800 mcg buccal 24–48 hours later per primary source.", citationIDs: ["specialty_round19"]),
            DosingBlock(label: "Cushing's (Korlym)", body: "300 mg PO daily; titrate to 1200 mg max; do NOT exceed 20 mg/kg/day per primary source.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Confirmed or suspected ectopic pregnancy / IUD in place; chronic adrenal failure; concurrent long-term corticosteroid therapy; bleeding diathesis or anticoagulation; porphyria; mifepristone hypersensitivity per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("BOXED — serious + potentially fatal infections + heavy bleeding with medical abortion; expectant counseling + emergency access per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("REMS — Mifepristone-Misoprostol; certified prescriber + pharmacy + patient agreement form per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Adrenal insufficiency in Cushing's setting — requires supplemental glucocorticoids if symptomatic; DEXAMETHASONE not effective (drug blocks GR).", citationIDs: ["specialty_round19"]),
            AttributedBullet("Hypokalemia common in Cushing's regimen.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Endometrial thickening + bleeding in long-term Cushing's use.", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Cramping, bleeding, nausea / vomiting, diarrhea (medical abortion); fatigue, hypokalemia, edema, headache, hypertension, endometrial thickening (Cushing's).",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 strong inhibitors (ketoconazole, ritonavir) — increase mifepristone levels; reduce dose / avoid.", citationIDs: ["openfda_round19"]),
            AttributedBullet("CYP3A4 inducers (rifampin) — reduce levels.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Long-term corticosteroids — antagonized; AVOID combination.", citationIDs: ["openfda_round19"]),
            AttributedBullet("QT-prolonging drugs — additive risk (Korlym).", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Medical abortion — confirm pregnancy + dating + R/O ectopic; counsel expected bleeding / cramping; prescribe misoprostol; arrange follow-up to confirm completion + emergency access.", citationIDs: ["specialty_round19"]),
            AttributedBullet("REMS prescriber + pharmacy enrollment; written informed consent per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Cushing's — monitor potassium + glucose + BP + endometrial thickness; do not use dexamethasone for adrenal insufficiency (block GR — use hydrocortisone IV high-dose).", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel — emergency department threshold for soaked >2 maxipads/hour, fever, severe pain, or persistent gestational symptoms.", citationIDs: ["openfda_round19"])
        ],
        patientTeaching: AttributedProse(
            "Take mifepristone first; take misoprostol 24–48 hours later as directed. You should expect heavy bleeding + cramping when misoprostol is taken. Call us right away for fever, soaking through 2 thick pads / hour for 2 hours, severe pain, weakness, or feeling persistent pregnancy symptoms. We'll see you for follow-up to confirm completion.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DinoprostoneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "dinoprostone",
        title: "Dinoprostone",
        subtitle: "Cervidil / Prepidil · prostaglandin E2 · cervical ripening · uterine tachysystole risk",
        category: "Prostaglandin E2 (cervical ripening agent)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic prostaglandin E2 (PGE2)"),
            KeyValueRow(key: "Indications", value: "Cervical ripening at term for induction of labor; second-trimester pregnancy termination; missed abortion management"),
            KeyValueRow(key: "Forms", value: "Cervidil (controlled-release vaginal insert 10 mg); Prepidil (endocervical gel 0.5 mg); Prostin E2 (suppository for second trimester)"),
            KeyValueRow(key: "Watch", value: "Tachysystole, fetal heart rate abnormalities, retained insert")
        ],
        indications: AttributedProse(
            "Cervical ripening at or near term in patients with medical / obstetric indication for induction of labor (Bishop score ≤6); second-trimester pregnancy termination; expulsion of intrauterine fetal demise / missed abortion ≤28 weeks per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Local prostaglandin E2 effect on cervix → softening + effacement + dilation; stimulates myometrial contractions.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Cervidil insert", body: "10 mg controlled-release vaginal insert × 1; remove at active labor / 12 hours / fetal heart rate concerns / tachysystole per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Prepidil gel", body: "0.5 mg endocervical; may repeat after 6 hours (max 1.5 mg / 24 hr).", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Second-trimester (Prostin E2)", body: "20 mg vaginal suppository q3–5h until expulsion; max 240 mg or 48 hours per primary source.", citationIDs: ["specialty_round19"])
        ],
        contraindications: AttributedProse(
            "Contraindications to vaginal delivery; prior cesarean / uterine surgery (relative — increased rupture risk); active herpes outbreak; placenta previa; vasa previa; abnormal fetal heart rate / fetal distress; ruptured membranes (relative); 6+ deliveries; oxytocin use (separate by 30 min) per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("Uterine TACHYSYSTOLE / hyperstimulation — fetal heart rate abnormalities; remove insert + position change + IV fluids + terbutaline if needed per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Uterine rupture — particularly in TOLAC; AVOID prostaglandins per ACOG.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Continuous EFM during cervical ripening; oxytocin separated by 30+ min after insert removal per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Bronchospasm in asthma (rare).", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Uterine tachysystole, fetal heart rate abnormalities, GI upset, fever, headache, hypotension, retained insert.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("Oxytocin — additive uterotonic; separate by 30+ min after insert removal per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Other prostaglandins (misoprostol) — DO NOT use simultaneously per primary source.", citationIDs: ["specialty_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Continuous fetal heart rate + uterine activity monitoring during cervical ripening per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Cervidil retrieval string — verify before insertion + secure for retrieval; remove at labor / 12 hours / abnormalities.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Patient supine + lateral 30 min post-Cervidil insertion; ambulate 30 min later if no contractions; sit-up positioning afterward.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Tachysystole protocol — remove insert + lateral positioning + IV fluids + O2 + terbutaline 0.25 mg SQ + immediate provider notification.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Wait 30 min after Cervidil removal before starting oxytocin per primary source.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "We're going to put a small medication insert in your vagina to help your cervix soften + open. We'll keep your baby + your contractions on the monitor the whole time. Tell us if contractions feel really painful + close together, your water breaks, or you feel something coming out.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AnastrozoleSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "anastrozole",
        title: "Anastrozole",
        subtitle: "Arimidex · aromatase inhibitor · postmenopausal HR+ breast cancer · bone loss",
        category: "Aromatase inhibitor (oral non-steroidal AI)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective non-steroidal aromatase inhibitor"),
            KeyValueRow(key: "Indications", value: "Adjuvant + metastatic hormone-receptor-positive breast cancer in postmenopausal women"),
            KeyValueRow(key: "Notable", value: "ONLY effective in postmenopausal women — ovarian suppression required premenopausal"),
            KeyValueRow(key: "Watch", value: "Bone loss / osteoporosis, arthralgias, hot flashes")
        ],
        indications: AttributedProse(
            "Adjuvant treatment of hormone receptor-positive early breast cancer in postmenopausal women; first-line treatment of advanced HR+ breast cancer in postmenopausal women per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Selective non-steroidal aromatase inhibitor → blocks peripheral conversion of androgens to estrogens (the principal source of estrogen in postmenopausal women) → reduces tumor estrogen exposure.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "1 mg PO daily for 5 (or 10) years per primary source.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Premenopausal status (ineffective without ovarian suppression); pregnancy; hypersensitivity per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("Bone loss + osteoporosis + fracture risk — baseline + periodic DEXA; calcium + vitamin D + bisphosphonate if osteopenia / osteoporosis per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Arthralgias + myalgias — common; affects adherence; sometimes requires switch to alternative AI or tamoxifen.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Cardiovascular disease — slightly increased ischemic events vs tamoxifen per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Hypercholesterolemia.", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Hot flashes, arthralgia, myalgia, fatigue, vaginal dryness, decreased libido, mood changes, hypercholesterolemia, bone loss, hair thinning.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("Tamoxifen — antagonizes anastrozole effect; do not combine.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Estrogen-containing products — antagonize; AVOID HRT during therapy.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline + 1–2 year DEXA scan; bone-protective therapy + calcium + vitamin D as indicated.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel arthralgia management — exercise, NSAIDs, omega-3, acupuncture; switch to alternative AI if intolerable.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Adherence — duration 5–10 years; non-adherence high in arthralgia.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Counsel non-hormonal alternatives for vasomotor symptoms (SSRIs, SNRIs, gabapentin, clonidine).", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth once a day for 5 to 10 years as we discussed. Aches in joints + muscles are common — gentle exercise often helps. Take calcium + vitamin D and get a bone-density scan as scheduled. Tell us about chest pain, severe joint pain that limits you, or vaginal bleeding. Avoid estrogen pills + creams while on this medicine.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LeuprolideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "leuprolide",
        title: "Leuprolide",
        subtitle: "Lupron / Eligard · GnRH agonist · prostate cancer + endometriosis + central precocious puberty · flare effect",
        category: "GnRH agonist (gonadal suppression)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic GnRH agonist"),
            KeyValueRow(key: "Indications", value: "Advanced prostate cancer; endometriosis pain; uterine fibroids preoperative; central precocious puberty; gender-affirming care"),
            KeyValueRow(key: "Notable", value: "Initial \"flare\" effect (gonadal stimulation) before suppression; co-administer flutamide for prostate cancer"),
            KeyValueRow(key: "Forms", value: "Depot IM 1, 3, 4, 6-month formulations")
        ],
        indications: AttributedProse(
            "Palliative therapy of advanced prostate cancer; endometriosis pain; uterine fibroid management before surgery; central precocious puberty; selected use in gender-affirming care per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Continuous GnRH receptor stimulation → initial increase in LH/FSH (flare) over 1–2 weeks → receptor downregulation + desensitization → suppression of LH/FSH → reduced sex hormone production (medical castration).",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Prostate cancer (depot)", body: "7.5 mg IM monthly OR 22.5 mg q3 months OR 30 mg q4 months OR 45 mg q6 months per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Endometriosis", body: "3.75 mg IM monthly OR 11.25 mg q3 months × 6 months.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Central precocious puberty", body: "Weight-based per labeling.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Pregnancy / breastfeeding; undiagnosed abnormal vaginal bleeding; hypersensitivity per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("FLARE EFFECT — initial 1–2 weeks of testosterone / estradiol surge; in prostate cancer can cause bone pain / urinary obstruction / spinal cord compression — pre-treat with anti-androgen (bicalutamide, flutamide) starting before / with leuprolide per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Bone loss / osteoporosis with chronic use; bone-density screening + calcium + vitamin D + bisphosphonate per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Cardiovascular events — increased CV mortality + diabetes; manage CV risk factors per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("QTc prolongation — caution with QT-prolonging drugs.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Endometriosis — \"add-back\" therapy (norethindrone) reduces vasomotor + bone effects.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Hyperglycemia + diabetes — monitor.", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Hot flashes, sexual dysfunction, decreased libido, fatigue, mood changes, depression, bone pain (flare), gynecomastia, weight gain, hypertension, hyperglycemia, bone loss.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("Hormone-modulating drugs — additive sexual / bone effects.", citationIDs: ["openfda_round19"]),
            AttributedBullet("QT-prolonging drugs — additive QTc.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Pre-treat prostate cancer with bicalutamide × 7 days before + 4–6 weeks after first leuprolide to prevent flare consequences per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("IM gluteal or deltoid; rotate sites; pump on schedule (monthly to q6 months).", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Monitor — testosterone / estradiol levels (suppression confirmation), PSA in prostate cancer, bone density, glucose + lipids + BP.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Endometriosis — limit duration ≤6 months without add-back; add-back norethindrone reduces side effects + bone loss per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel non-hormonal alternatives for vasomotor symptoms; bone-protective measures.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "We give this through a shot every 1, 3, 4, or 6 months. For the first 1–2 weeks, your symptoms may briefly get worse before they get better — you may need another medicine to prevent that. Hot flashes + sexual changes are common. Tell us about chest pain, severe bone pain, sudden weakness in your legs, or new loss of bladder / bowel control.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum EstradiolHRTSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "estradiol-hrt",
        title: "Estradiol (menopausal HRT)",
        subtitle: "Estrace / patches / vaginal · vasomotor + GU atrophy · pair with progestin if uterus · VTE + breast cancer signal",
        category: "Estrogen replacement (HRT)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "17-β estradiol (oral, transdermal, vaginal, gel, spray)"),
            KeyValueRow(key: "Indications", value: "Vasomotor symptoms; vulvovaginal atrophy; osteoporosis prevention (selected); premature ovarian insufficiency"),
            KeyValueRow(key: "Boxed", value: "VTE / stroke / breast cancer / endometrial cancer (if unopposed estrogen + uterus)"),
            KeyValueRow(key: "Notable", value: "ALWAYS pair with progestin in patients with uterus; transdermal lower VTE risk than oral")
        ],
        indications: AttributedProse(
            "Moderate-severe vasomotor symptoms of menopause; vulvovaginal atrophy / GSM (low-dose vaginal first-line for isolated GU symptoms); osteoporosis prevention in selected patients with vasomotor symptoms; primary ovarian insufficiency replacement until average menopause age per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Replaces declining endogenous estradiol → restores estrogen receptor activity in vasomotor center, urogenital tissue, bone, vascular endothelium, brain.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Oral systemic (Estrace)", body: "0.5–2 mg PO daily; lowest effective dose for symptom control.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Transdermal patch (Climara, Vivelle-Dot)", body: "0.025–0.1 mg/day; change weekly or twice-weekly per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Vaginal (low-dose for GSM)", body: "Estradiol cream 2 g vaginally nightly × 2 weeks then 2×/week; estradiol ring (Estring) every 90 days per primary source.", citationIDs: ["specialty_round19"]),
            DosingBlock(label: "+ Progestin (if uterus)", body: "Norethindrone or micronized progesterone or combination patch — required for endometrial protection per primary source.", citationIDs: ["specialty_round19"])
        ],
        contraindications: AttributedProse(
            "Known / suspected breast cancer (history); known / suspected estrogen-dependent neoplasia; abnormal undiagnosed genital bleeding; active or history of VTE / stroke / MI; thrombophilic disorders; hepatic dysfunction; pregnancy per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("BOXED — increased risk VTE / stroke / breast cancer in WHI study; lowest effective dose × shortest time per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("BOXED — endometrial cancer in patients with uterus on UNOPPOSED estrogen; ALWAYS combine with progestin per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Transdermal lower VTE risk than oral — preferred in higher-risk patients per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Initiate <60 years OR within 10 years of menopause for best benefit-risk; reassess annually.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Vaginal low-dose minimally absorbed — generally safe even in patients with breast cancer history (per oncologist) per primary source.", citationIDs: ["specialty_round19"])
        ],
        adverseReactions: AttributedProse(
            "Breast tenderness, headache, nausea, breakthrough bleeding (initial), VTE / stroke / MI (small absolute risk), gallstones, weight gain, mood changes.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 inducers (rifampin, anticonvulsants, St. John's wort) — reduce levels.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Other estrogen-containing drugs — additive risk.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Aromatase inhibitors — antagonize each other; do not combine.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel risks + benefits of HRT before initiation; document shared decision making per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Annual reassessment + breast / pelvic exam + mammogram per age guidelines.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Patch site rotation; avoid waist + breasts; mounted on dry skin.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Vaginal preparations — apply at bedtime; counsel transfer risk to partners.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Counsel signs of VTE / stroke / breast lump → emergent evaluation.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "We use the lowest dose for the shortest time you need it. If you have your uterus, you must take a progesterone-type medicine too — otherwise this can cause uterine cancer. Tell us right away about chest pain, leg swelling, breathing trouble, severe headache, vision changes, or breast lump. Get your annual mammograms + pelvic exams.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LevonorgestrelSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "levonorgestrel",
        title: "Levonorgestrel (emergency contraception + IUD)",
        subtitle: "Plan B One-Step · 1.5 mg PO ASAP up to 72–120 hr · Mirena / Liletta IUD 3–8 years",
        category: "Synthetic progestin",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Synthetic levo progestin"),
            KeyValueRow(key: "Indications", value: "Emergency contraception (Plan B); long-acting reversible contraception (LNG-IUD); HMB / endometriosis pain"),
            KeyValueRow(key: "Notable", value: "OTC for emergency contraception in US; reduces but does not eliminate pregnancy risk; less effective in BMI ≥30"),
            KeyValueRow(key: "Forms", value: "Plan B One-Step 1.5 mg PO; LNG-IUD (Mirena, Liletta, Kyleena, Skyla) 3–8 years")
        ],
        indications: AttributedProse(
            "Emergency contraception within 72 hours (effective up to 120 hours but decreasing efficacy); long-acting reversible intrauterine contraception; treatment of heavy menstrual bleeding + dysmenorrhea per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Progestin → suppresses LH surge + ovulation when given before LH surge; thickens cervical mucus; alters endometrium. IUD adds local foreign-body effect + reduced endometrial proliferation.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Emergency contraception", body: "1.5 mg PO × 1 ASAP, up to 120 hours after intercourse (most effective <72 hours) per primary source.", citationIDs: ["specialty_round19"]),
            DosingBlock(label: "LNG-IUD", body: "Mirena 52 mg / 8 years; Liletta 52 mg / 8 years; Kyleena 19.5 mg / 5 years; Skyla 13.5 mg / 3 years per primary source.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Hypersensitivity; pregnancy (does not interrupt established pregnancy); IUD — pregnancy, current PID / cervicitis / known intrauterine anatomy distortion / uterine cavity infection / uterine cancer / hepatic disease / known / suspected breast cancer per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("EFFICACY — less effective in BMI ≥30 (consider ulipristal acetate or copper IUD instead) per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Does NOT interrupt established pregnancy; does NOT prevent STIs.", citationIDs: ["openfda_round19"]),
            AttributedBullet("LNG-IUD — perforation rare but possible; expulsion ~5%; PID risk first 20 days post-insertion.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Ectopic pregnancy — if pregnancy occurs with IUD in place, ectopic risk high; emergent evaluation per primary source.", citationIDs: ["specialty_round19"])
        ],
        adverseReactions: AttributedProse(
            "Nausea (less than estrogen-containing methods), headache, breast tenderness, irregular bleeding (especially first 3–6 months IUD), abdominal pain, mood changes.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("CYP3A4 inducers (rifampin, anticonvulsants, St. John's wort, efavirenz) — reduce efficacy of EC + ongoing contraception; alternative method recommended.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Anti-inflammatory (NSAIDs) — may modestly reduce IUD efficacy on prostaglandin-mediated effects.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("EC — counsel time-sensitivity, BMI consideration, follow-up if no menses 3 weeks; pregnancy test; ongoing contraception.", citationIDs: ["specialty_round19"]),
            AttributedBullet("LNG-IUD insertion — confirm pregnancy negative + screen STI + counsel expected bleeding pattern (first 3–6 months irregular, then often amenorrhea).", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel — IUD does not prevent STIs; condoms recommended.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("STI testing at time of insertion or before; treat infections before insertion.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Follow-up 4–6 weeks post-insertion to verify strings + tolerance.", citationIDs: ["openrn_pharm_round19"])
        ],
        patientTeaching: AttributedProse(
            "For Plan B — take it as soon as possible, ideally within 72 hours after unprotected sex; less effective the longer you wait. It does NOT prevent STIs and does NOT cause an abortion. If your period is more than a week late, take a pregnancy test. For the IUD — irregular bleeding is common in the first 3–6 months. Tell us about severe pelvic pain, fever, missed periods, or strings you can't feel.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ClomipheneSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "clomiphene",
        title: "Clomiphene citrate",
        subtitle: "Clomid · SERM ovulation induction · multiple gestation + OHSS risk · monitor with US",
        category: "Selective estrogen receptor modulator (SERM, ovulation induction)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "SERM (estrogen receptor agonist + antagonist)"),
            KeyValueRow(key: "Indications", value: "Ovulation induction in anovulatory infertility (PCOS, hypothalamic amenorrhea selected)"),
            KeyValueRow(key: "Notable", value: "First-line in PCOS infertility per ACOG (with letrozole increasingly preferred)"),
            KeyValueRow(key: "Watch", value: "Multiple gestation (~10%), ovarian hyperstimulation syndrome (OHSS), visual disturbances")
        ],
        indications: AttributedProse(
            "Treatment of anovulatory infertility — first-line in PCOS (or letrozole increasingly preferred); selective use in hypothalamic dysfunction. Off-label for male hypogonadism per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Estrogen receptor antagonist at hypothalamus → disrupts negative feedback → increased GnRH → increased FSH + LH → follicular development + ovulation.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "50 mg PO daily × 5 days starting cycle day 3–5; titrate to 100 mg / 150 mg next cycle if no ovulation; max 6 cycles per primary source.", citationIDs: ["specialty_round19"])
        ],
        contraindications: AttributedProse(
            "Pregnancy; hepatic disease; abnormal undiagnosed bleeding; ovarian cysts (other than PCOS); pituitary tumor; thyroid / adrenal dysfunction not controlled per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("Multiple gestation ~10% (mostly twins); OHSS uncommon but possible per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Visual disturbances — blurred vision, scotomata; reversible; discontinue if persistent.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Anti-estrogen effects on cervical mucus + endometrium can paradoxically reduce conception; letrozole increasingly preferred for PCOS infertility per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Long-term use (>6 cycles) — possible association with ovarian cancer; avoid >6 cycles.", citationIDs: ["specialty_round19"])
        ],
        adverseReactions: AttributedProse(
            "Hot flashes, mood changes, headache, breast tenderness, abdominal bloating / pain (OHSS), visual disturbances, multiple gestation.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("Other ovulation-inducing agents — additive multiple gestation + OHSS risk.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Hormonal contraceptives — antagonize.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm pregnancy NEGATIVE before each cycle; baseline pelvic ultrasound for ovarian cysts.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Mid-cycle monitoring — basal body temperature, LH surge / urine LH kit, sometimes ultrasound + serum estradiol per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel multiple gestation risk + OHSS warning signs (severe abdominal pain, distention, dyspnea, decreased urine).", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Limit to 6 cycles; refer to reproductive endocrinology if no success.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel — STOP if visual changes; resume only after ophthalmology clearance.", citationIDs: ["openfda_round19"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth for 5 days each cycle as we discussed. We may use ultrasound + LH ovulation tests to time intercourse. Twins are more common with this medicine. Tell us about severe abdominal pain or swelling, breathing trouble, or vision changes — stop the medicine and call us.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum FinasterideSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "finasteride",
        title: "Finasteride",
        subtitle: "Proscar (5 mg) BPH · Propecia (1 mg) male pattern hair · 5α-reductase inhibitor · pregnancy hazard",
        category: "5α-reductase inhibitor (Type II)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Type II 5α-reductase inhibitor"),
            KeyValueRow(key: "Indications", value: "BPH (5 mg); male pattern hair loss (1 mg); off-label androgenic alopecia in women + transgender care"),
            KeyValueRow(key: "Boxed-equivalent", value: "Pregnancy contact hazard — crushed / broken pills + men's semen; female partners of childbearing age"),
            KeyValueRow(key: "Notable", value: "PSA decreases ~50% — multiply observed PSA × 2 for screening interpretation")
        ],
        indications: AttributedProse(
            "Symptomatic benign prostatic hyperplasia (5 mg); male pattern androgenic alopecia (1 mg); off-label combination with α-blocker for BPH; selective use in androgenic alopecia in women + gender-affirming care per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Inhibits Type II 5α-reductase → reduces conversion of testosterone to dihydrotestosterone (DHT) → reduces prostate volume + scalp hair miniaturization. Effect on prostate over months; on hair over 6–12 months.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "BPH", body: "5 mg PO daily; benefit gradual over 6–12 months per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Hair loss", body: "1 mg PO daily; effect over 6–12 months; lifelong therapy needed.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Pregnancy in female partners (Cat X); pediatric use; hypersensitivity per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("PREGNANCY — pregnant or potentially pregnant women must NOT handle crushed / broken tablets; men's semen contains drug — counsel partners trying to conceive per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Sexual dysfunction — decreased libido, erectile dysfunction, ejaculatory disorders; persistent in some patients (\"post-finasteride syndrome\") per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Depression + suicidality — counsel + monitor.", citationIDs: ["openfda_round19"]),
            AttributedBullet("PSA — drug reduces PSA ~50%; multiply observed × 2 for screening interpretation per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("High-grade prostate cancer — slight increase in REDUCE / PCPT trials; clinical significance debated per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Breast tenderness / gynecomastia.", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Sexual dysfunction (libido, ED, ejaculation), gynecomastia, breast tenderness, depression, hypersensitivity, headache.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("None significant pharmacokinetic.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Counsel pregnancy precautions — pregnant women must NOT handle broken / crushed tablets; counsel partners.", citationIDs: ["specialty_round19"]),
            AttributedBullet("PSA interpretation — multiply observed × 2 to compare with pre-treatment per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Symptom assessment for BPH (AUA-SI / IPSS) periodically; effect over 6–12 months.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Counsel — sexual side effects often improve with continuation but may persist; mood changes worth reporting.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth daily. Don't expect immediate results — for prostate / hair, it can take 6 to 12 months. Pregnant women + those who could become pregnant should NOT handle broken or crushed pills. Tell us about sexual side effects, mood changes, or breast tenderness. If you get a PSA test, tell the lab + doctor you're on this medicine.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum MirabegronSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "mirabegron",
        title: "Mirabegron",
        subtitle: "Myrbetriq · β3 agonist · OAB · alternative to anticholinergic · BP elevation",
        category: "β3-adrenergic agonist (overactive bladder)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Selective β3-adrenergic receptor agonist"),
            KeyValueRow(key: "Indications", value: "Overactive bladder with urge urinary incontinence + frequency; pediatric neurogenic detrusor overactivity"),
            KeyValueRow(key: "Notable", value: "Less anticholinergic burden than oxybutynin / tolterodine — preferred in elderly / cognitively at-risk"),
            KeyValueRow(key: "Watch", value: "Hypertension, urinary retention, angioedema (rare), CYP2D6 inhibitor")
        ],
        indications: AttributedProse(
            "Treatment of overactive bladder with symptoms of urge incontinence, urgency, urinary frequency in adults; neurogenic detrusor overactivity in pediatric patients ≥3 years per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Selective β3-adrenergic agonist → relaxes detrusor smooth muscle during storage → increased bladder capacity + reduced urgency. Avoids anticholinergic effects of older OAB drugs.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Adult", body: "25 mg PO daily; titrate to 50 mg after 8 weeks per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Hepatic / renal", body: "Severe renal — 25 mg max; severe hepatic — avoid.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Pediatric", body: "Weight-based per labeling.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Severe uncontrolled hypertension (SBP ≥180 or DBP ≥110); hypersensitivity; end-stage renal disease per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("Hypertension — modest BP elevation; check baseline + during therapy; AVOID in severe uncontrolled HTN per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Urinary retention — caution in BPH or other bladder outlet obstruction.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Angioedema — rare but reported; discontinue if occurs.", citationIDs: ["openfda_round19"]),
            AttributedBullet("CYP2D6 inhibitor — increases metoprolol, desipramine, antiarrhythmics.", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Hypertension, headache, UTI, tachycardia, nasopharyngitis, dry mouth (less than anticholinergics), constipation, urinary retention, angioedema (rare).",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("CYP2D6 substrates (metoprolol, desipramine, propafenone) — increase levels; reduce dose or monitor.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Other OAB anticholinergics — additive urinary retention; combination occasionally used by specialty.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Digoxin — increased levels.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Baseline BP + during therapy; counsel report severe BP rise.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Bladder diary 3 days pre + during therapy to assess response.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Behavioral therapy first-line + adjunct — fluid management, bladder training, pelvic floor exercises.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel report urinary retention symptoms (decreased stream, hesitancy, retention).", citationIDs: ["openfda_round19"]),
            AttributedBullet("Preferred over anticholinergics in elderly / cognitively impaired.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth once daily. Behavioral changes — fluid timing, bladder training, pelvic floor exercises — work alongside this medicine. Tell us about high blood pressure, severe headache, swelling of face / lips, or trouble urinating. It may take a few weeks to feel the full effect.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum OxybutyninSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "oxybutynin",
        title: "Oxybutynin",
        subtitle: "Ditropan / Oxytrol · anticholinergic OAB · Beers caution in elderly · ER + transdermal options",
        category: "Anticholinergic (overactive bladder)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Tertiary amine antimuscarinic (M3 selective + non-selective)"),
            KeyValueRow(key: "Indications", value: "Overactive bladder, neurogenic bladder, primary nocturnal enuresis (≥6 years), pediatric detrusor overactivity, hyperhidrosis"),
            KeyValueRow(key: "Notable", value: "Beers list — caution in elderly (cognitive impairment); ER + patch reduce side effects"),
            KeyValueRow(key: "Watch", value: "Anticholinergic burden — dry mouth, constipation, blurred vision, urinary retention, cognitive effects")
        ],
        indications: AttributedProse(
            "Overactive bladder with urge incontinence + frequency; neurogenic detrusor overactivity; primary nocturnal enuresis (children); off-label hyperhidrosis per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Antimuscarinic → blocks M3 receptors on detrusor → relaxes bladder smooth muscle + increases capacity. Antispasmodic local effect on detrusor.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "IR oral", body: "5 mg PO BID-TID; max 20 mg/day; lower in elderly.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "ER (Ditropan XL)", body: "5–30 mg PO daily; reduces peak side effects.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Transdermal patch (Oxytrol)", body: "3.9 mg/day patch — change twice weekly; lower CNS side effects per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Topical gel", body: "3% gel applied daily.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Urinary retention; gastric retention or other obstructive GI conditions; uncontrolled narrow-angle glaucoma; myasthenia gravis; hypersensitivity per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("Anticholinergic burden — dry mouth, constipation, blurred vision, urinary retention, hot flushes (decreased sweating); heatstroke risk.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Cognitive impairment + dementia association in older adults — Beers list per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Caution in renal / hepatic impairment (lower doses).", citationIDs: ["openfda_round19"]),
            AttributedBullet("CYP3A4 metabolized — interactions with strong inhibitors / inducers.", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Dry mouth (very common), constipation, urinary retention, blurred vision, drowsiness, dizziness, dyspepsia, dry eyes, heat intolerance, cognitive impairment.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("Other anticholinergics (TCAs, antihistamines) — additive burden.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Strong CYP3A4 inhibitors (azoles, macrolides) — increase levels.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Cholinesterase inhibitors (donepezil) — antagonize.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Mirabegron + behavioral first-line in elderly; oxybutynin if anticholinergic preferred.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Bladder diary + behavioral interventions.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Counsel hot environments + heatstroke prevention; constipation management; sugar-free gum / sips for dry mouth.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("ER / patch lower side effects than IR oral.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Re-evaluate cognitive status periodically in elderly + reduce burden if any decline per primary source.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "Take by mouth as directed. Drink water, chew sugar-free gum for dry mouth. Avoid getting overheated — this medicine reduces sweating. Use the bathroom on a schedule to retrain your bladder. Tell us about confusion, severe constipation, trouble urinating, or eye pain.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum RisedronateSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "risedronate",
        title: "Risedronate",
        subtitle: "Actonel · oral bisphosphonate · postmenopausal + glucocorticoid osteoporosis · esophagitis + ONJ",
        category: "Bisphosphonate (osteoporosis)",
        isHighAlert: false,
        quickReference: [
            KeyValueRow(key: "Class", value: "Aminobisphosphonate"),
            KeyValueRow(key: "Indications", value: "Postmenopausal osteoporosis prevention + treatment; men's osteoporosis; glucocorticoid-induced osteoporosis; Paget disease"),
            KeyValueRow(key: "Notable", value: "Oral; weekly OR monthly dosing; strict administration to prevent esophagitis"),
            KeyValueRow(key: "Watch", value: "Esophagitis, ONJ, atypical femur fracture, hypocalcemia")
        ],
        indications: AttributedProse(
            "Treatment + prevention of postmenopausal osteoporosis; men's osteoporosis; glucocorticoid-induced osteoporosis; Paget disease of bone per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Aminobisphosphonate → binds hydroxyapatite in bone → inhibits osteoclast-mediated bone resorption → increases bone mineral density + reduces fracture risk.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Standard", body: "5 mg PO daily OR 35 mg PO weekly OR 150 mg PO monthly per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Paget", body: "30 mg PO daily × 2 months; may repeat after 2-month observation.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Administration", body: "Take FIRST thing AM with 6–8 oz water; remain UPRIGHT 30 min; nothing PO 30 min per primary source.", citationIDs: ["specialty_round19"])
        ],
        contraindications: AttributedProse(
            "Esophageal motility disorders / strictures; inability to remain upright 30 min; hypocalcemia; severe renal impairment (CrCl <30); pregnancy / breastfeeding (relative); hypersensitivity per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("Esophagitis / ulceration — strict upright administration + adequate water; STOP for dysphagia / new heartburn / chest pain per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Osteonecrosis of the jaw (ONJ) — rare in oral bisphosphonates (more common with high-dose IV); dental evaluation pre-therapy in high-risk + drug holiday for major dental work per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Atypical femur fracture — long-term use (>5 years); thigh / groin pain → imaging; consider drug holiday after 5 years per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Hypocalcemia — confirm normal Ca + vitamin D before starting + correct deficiency.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Acute-phase reaction — flu-like symptoms after first dose (more common with IV).", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Esophagitis, dyspepsia, abdominal pain, musculoskeletal pain, headache, hypocalcemia, ONJ (rare), atypical fracture (rare).",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("Calcium / iron / antacids / dairy — REDUCE absorption; separate by 30 min minimum per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Aspirin / NSAIDs — additive GI effects.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Strict administration teach-back — full glass water + upright 30 min + nothing PO 30 min per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Confirm calcium + vitamin D adequate before + during therapy.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Baseline + 1–2 year DEXA; T-score + FRAX score for fracture risk.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Drug holiday after 3–5 years if low-risk; continue 5–10 years if high-risk per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Dental clearance + counsel ONJ; encourage routine dental care BEFORE major procedures.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "Take this on an empty stomach FIRST thing in the morning, with a full 6–8 oz glass of water. Stay UPRIGHT (sit, stand, or walk) for 30 minutes — don't lie down, eat, drink (other than water), or take other medicines for 30 minutes. Take calcium + vitamin D as directed. Tell us about new heartburn, swallowing trouble, thigh / groin pain, or before any major dental work.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum DenosumabSample {
    public static let entry: DrugEntry = DrugEntry(
        id: "denosumab",
        title: "Denosumab",
        subtitle: "Prolia / Xgeva · RANKL inhibitor · postmenopausal + cancer-related bone disease · DON'T STOP without bridge",
        category: "RANKL inhibitor (osteoclast antagonist)",
        isHighAlert: true,
        quickReference: [
            KeyValueRow(key: "Class", value: "Human monoclonal anti-RANKL antibody"),
            KeyValueRow(key: "Indications", value: "Postmenopausal osteoporosis (Prolia); men's osteoporosis; bone metastases (Xgeva); giant cell tumor; multiple myeloma bone disease"),
            KeyValueRow(key: "Boxed-equivalent", value: "Severe hypocalcemia + multiple vertebral fractures on rapid discontinuation without bridge"),
            KeyValueRow(key: "Notable", value: "SQ q6 months (Prolia) or q4 weeks (Xgeva); never miss / stop without alternative")
        ],
        indications: AttributedProse(
            "Treatment of postmenopausal osteoporosis at high fracture risk (Prolia, 60 mg q6 months); men's osteoporosis; cancer bone metastases + giant cell tumor + multiple myeloma bone disease (Xgeva, 120 mg q4 weeks); selected glucocorticoid-induced osteoporosis per primary source.",
            citationIDs: ["openfda_round19", "specialty_round19"]
        ),
        mechanism: AttributedProse(
            "Human IgG2 monoclonal antibody binds RANKL → blocks RANK-RANKL-RANK signaling on osteoclast precursors → inhibits osteoclast formation + activity → reduces bone resorption.",
            citationIDs: ["openfda_round19"]
        ),
        dosing: [
            DosingBlock(label: "Osteoporosis (Prolia)", body: "60 mg SQ q6 months; calcium 1000 mg + vitamin D 400 IU daily required per primary source.", citationIDs: ["openfda_round19"]),
            DosingBlock(label: "Bone metastases (Xgeva)", body: "120 mg SQ q4 weeks per primary source.", citationIDs: ["openfda_round19"])
        ],
        contraindications: AttributedProse(
            "Hypocalcemia (must correct before initiation); pregnancy; hypersensitivity per primary source.",
            citationIDs: ["openfda_round19"]
        ),
        warnings: [
            AttributedBullet("BOXED-EQUIVALENT — severe hypocalcemia + multiple vertebral fractures on discontinuation WITHOUT bisphosphonate bridge; transition planning critical per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Hypocalcemia — pre-treat + correct + supplement with calcium + vitamin D; severe in CKD per primary source.", citationIDs: ["openfda_round19"]),
            AttributedBullet("ONJ — particularly with concurrent chemo / radiation / steroids; dental evaluation pre-therapy + drug holiday for major dental procedures per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Atypical femur fracture — long-term use; thigh / groin pain → imaging.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Serious infections — increased risk; cellulitis especially.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Dermatologic — eczema, dermatitis, rashes.", citationIDs: ["openfda_round19"])
        ],
        adverseReactions: AttributedProse(
            "Back pain, musculoskeletal pain, hypocalcemia, hypercholesterolemia, cystitis, nasopharyngitis, dermatitis, ONJ, atypical fracture.",
            citationIDs: ["openfda_round19"]
        ),
        drugInteractions: [
            AttributedBullet("Other osteoclast inhibitors (bisphosphonates) — additive bone effects.", citationIDs: ["openfda_round19"]),
            AttributedBullet("Immunosuppressants — additive infection risk.", citationIDs: ["openfda_round19"])
        ],
        nursingImplications: [
            AttributedBullet("Confirm calcium + vitamin D BEFORE EACH DOSE; ensure adequate intake.", citationIDs: ["specialty_round19"]),
            AttributedBullet("Strict q6 month schedule (Prolia) — DO NOT MISS; if stopping or delayed, transition to bisphosphonate bridge to prevent rebound vertebral fractures per primary source.", citationIDs: ["specialty_round19"]),
            AttributedBullet("SQ injection upper arm / thigh / abdomen; rotate sites.", citationIDs: ["openrn_pharm_round19"]),
            AttributedBullet("Dental clearance pre-therapy; counsel ONJ + dental hygiene + delay major dental procedures or bridge.", citationIDs: ["specialty_round19"]),
            AttributedBullet("DEXA + clinical reassessment q1–2 years; transition planning at 5–10 years.", citationIDs: ["specialty_round19"])
        ],
        patientTeaching: AttributedProse(
            "We give this through your skin every 6 months. Take calcium + vitamin D every day to prevent low calcium. NEVER skip or stop this medicine without talking to us first — stopping suddenly can cause spine fractures. Get dental work done BEFORE starting if possible; tell your dentist you're on this medicine. Tell us about thigh / groin pain, jaw pain, or unusual rashes.",
            citationIDs: ["openrn_pharm_round19"]
        ),
        citations: [openfdaR19, openrnPharmR19, specialtyR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}
