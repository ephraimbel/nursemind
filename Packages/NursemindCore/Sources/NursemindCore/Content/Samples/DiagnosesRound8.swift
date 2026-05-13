import Foundation

// Curator-model diagnosis entries (round 8 expansion — GYN, urology, rheumatology, dermatology).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Nursing
// (CC BY 4.0 with AI restriction), CDC (public domain), ACOG / AUA / ACR / NCCN concept citations.

private let openrnMSr8 = CitationSource(
    id: "openrn_ms_round8",
    shortName: "Open RN Health Alterations / Med-Surg + Maternal-Newborn",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=PCOS+endometriosis+rheumatology+urology",
    lastRetrieved: "2026-05-04"
)
private let openstaxR8 = CitationSource(
    id: "openstax_round8",
    shortName: "OpenStax Maternal Newborn / Clinical Nursing Skills",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/details/books/maternal-newborn-nursing",
    lastRetrieved: "2026-05-04"
)
private let cdcDxR8 = CitationSource(
    id: "cdc_dx_round8",
    shortName: "CDC clinical / women's health guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let specialtyDxR8 = CitationSource(
    id: "specialty_dx_round8",
    shortName: "ACOG / AUA / ACR / NCCN guidelines (concept citation)",
    publisher: "ACOG · AUA · ACR · NCCN",
    license: .factCitationOnly,
    url: "https://www.acog.org/clinical/clinical-guidance",
    lastRetrieved: "2026-05-04"
)

private let gynR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let breastR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)
private let uroR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .elimination)
private let rheumR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility)
private let painR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort)
private let dermR8 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .cellularRegulation)

// MARK: - PCOS

public enum PCOSSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pcos",
        title: "Polycystic ovary syndrome (PCOS)",
        subtitle: "Hyperandrogenism + ovulatory dysfunction · metabolic + reproductive",
        nclexTags: gynR8,
        definition: AttributedProse(
            "Common endocrine disorder of reproductive-age women. Diagnosed by Rotterdam criteria — ≥2 of 3: oligo-/anovulation, clinical or biochemical hyperandrogenism, polycystic ovaries on ultrasound, after exclusion of other causes per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Insulin resistance + altered LH:FSH ratio → ovarian theca-cell androgen overproduction → anovulation, hirsutism, acne. Long-term: metabolic syndrome, T2DM, dyslipidemia, NAFLD, OSA, endometrial hyperplasia / cancer (unopposed estrogen), infertility.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Menstrual irregularity — oligomenorrhea, amenorrhea, anovulation.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hyperandrogenism — hirsutism (male-pattern facial / body hair), acne, androgenic alopecia.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Infertility — anovulatory.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Metabolic — central obesity, acanthosis nigricans, T2DM, dyslipidemia, HTN.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Mood — increased depression / anxiety prevalence.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Rotterdam criteria — 2 of 3: oligo/anovulation, hyperandrogenism (clinical or labs), polycystic ovaries on US (≥12 follicles or ovarian volume >10 mL).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Exclude other causes — thyroid (TSH), prolactin, late-onset CAH (17-OH progesterone), Cushing, ovarian / adrenal tumor.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Comorbidity screen — fasting glucose / 2-hr OGTT, lipid panel, BP, depression screen, OSA screen per primary source.", citationIDs: ["specialty_dx_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Menstrual history — duration of cycles, last menstrual period; pregnancy test in any new amenorrhea.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("BMI, blood pressure, signs of insulin resistance (acanthosis nigricans).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hirsutism severity (Ferriman-Gallwey scale), acne, alopecia.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Goals — fertility now / later, symptom relief, metabolic risk reduction.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Lifestyle — weight loss (5–10%) often restores ovulation; structured exercise and diet are first-line per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Combined oral contraceptive — first-line for menstrual regularity and hyperandrogenism in patients NOT seeking pregnancy; reduces endometrial cancer risk per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Metformin — for metabolic dysfunction, prediabetes, and may improve menstrual regularity per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Spironolactone — for hirsutism / acne (must use with effective contraception — teratogenic) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Ovulation induction — letrozole FIRST-LINE (per ASRM) over clomiphene; metformin co-treatment in some cases per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Annual screening — A1c or 2-hr OGTT, lipids, BP, depression, OSA risk per primary source.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("ENDOMETRIAL HYPERPLASIA / CANCER — unopposed estrogen from anovulation; cyclic progestin or COC reduces risk; biopsy any abnormal bleeding.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("T2DM — lifetime risk markedly elevated; screen every 1–3 years.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pregnancy complications — gestational diabetes, preeclampsia, preterm birth; close monitoring.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Mental health — screen and treat depression / anxiety; quality-of-life impact is significant.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Endometriosis

public enum EndometriosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "endometriosis",
        title: "Endometriosis",
        subtitle: "Cyclic pelvic pain · dysmenorrhea · infertility · laparoscopy",
        nclexTags: gynR8,
        definition: AttributedProse(
            "Estrogen-dependent disorder defined by endometrial-like tissue OUTSIDE the uterus — most often pelvic peritoneum, ovaries (endometriomas), uterosacral ligaments. Causes cyclic inflammation, scarring, and pain per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Multiple theories — retrograde menstruation, lymphovascular spread, coelomic metaplasia, immune dysregulation. Ectopic endometrial tissue responds to cyclic estrogen → bleeding into peritoneum → inflammation, adhesions, fibrosis, neuroangiogenesis (chronic pain).",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Cyclic pelvic pain — typically worsening over years; may become constant.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Dysmenorrhea — severe, often refractory to NSAIDs.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Dyspareunia — deep penetrating pain.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Dyschezia (painful defecation) and dysuria, especially during menses.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Infertility (~30–50% of women with endometriosis).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Atypical — chest pain (catamenial pneumothorax), umbilical bleeding (rare).", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical suspicion based on symptoms and exam (deeply infiltrating nodules, fixed retroverted uterus, adnexal masses).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pelvic US identifies endometriomas; deep transvaginal US or MRI for deep infiltrating disease per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("LAPAROSCOPY with histologic confirmation is the gold standard but is no longer required to start empirical therapy per primary source.", citationIDs: ["specialty_dx_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain — cyclic vs constant, severity, impact on function, current management.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Reproductive goals — fertility planning influences treatment.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Mood, sleep, sexual function, quality-of-life.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("First-line — NSAIDs + COC continuous or cyclic; progestin-only (norethindrone, medroxyprogesterone) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Second-line — GnRH agonists / antagonists (leuprolide, elagolix) with add-back therapy to mitigate hypoestrogenic side effects per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Surgical — laparoscopic excision / ablation; helpful for pain and fertility per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Definitive — hysterectomy with bilateral salpingo-oophorectomy for severe refractory disease in patients DONE with childbearing.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Multidisciplinary — pelvic-floor PT, mental health, pain management for chronic pain.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Fertility — ART (IVF) often required for severe disease.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("Recurrence after surgery — 50% within 5 years without ongoing hormonal suppression.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Endometrioma rupture — acute severe pelvic pain; ED workup.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Bowel / urinary obstruction in deep infiltrating disease.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Mental-health impact — chronic pain disorder; depression / anxiety are common; address proactively.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Uterine Fibroids

public enum FibroidsSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "uterine-fibroids",
        title: "Uterine fibroids (leiomyomas)",
        subtitle: "Benign smooth-muscle tumors · heavy bleeding · pressure symptoms",
        nclexTags: gynR8,
        definition: AttributedProse(
            "Benign monoclonal smooth-muscle tumors of the myometrium — the most common benign tumor in women. Estrogen- and progesterone-responsive; typically regress after menopause per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Hormonally driven proliferation of myometrial smooth-muscle cells. Subtypes by location: submucosal (most symptomatic for bleeding), intramural, subserosal, pedunculated, cervical.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Heavy menstrual bleeding (HMB) — large clots, prolonged menses.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pelvic pressure / fullness; bulk symptoms (urinary frequency, constipation, back pain).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Dysmenorrhea, dyspareunia.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Iron-deficiency anemia from chronic blood loss.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Reproductive — implantation failure, miscarriage, preterm labor (especially submucosal fibroids).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Many fibroids are asymptomatic and identified incidentally.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Pelvic exam — enlarged irregular uterus.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pelvic ultrasound (transvaginal) — first-line imaging.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("MRI for surgical planning, multiple / large fibroids.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Saline-infusion sonohysterography or hysteroscopy for submucosal fibroids.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Bleeding pattern, anemia (CBC, iron studies), quality of life.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Bulk symptoms; reproductive / fertility goals.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Comorbidities affecting surgical risk.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Asymptomatic — observation; serial pelvic exam.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Iron supplementation for anemia.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Medical — NSAIDs for cramping; combined OCP, levonorgestrel IUD, GnRH agonists / antagonists (with add-back), tranexamic acid for bleeding per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Procedural — uterine artery embolization (preserves uterus, fertility implications); MR-guided focused ultrasound.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Surgical — myomectomy (preserves uterus for fertility); hysterectomy (definitive, when childbearing complete) per primary source.", citationIDs: ["specialty_dx_round8"])
        ],
        watchFor: [
            AttributedBullet("Severe anemia from menorrhagia — transfusion if Hgb <7 with symptoms; treat underlying.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Acute degeneration / torsion of pedunculated fibroid — severe pain; ED workup.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pregnancy — fibroid degeneration causes pain and preterm labor; supportive care.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Leiomyosarcoma — rare but considered with rapid growth in postmenopausal women.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Menopause

public enum MenopauseSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "menopause",
        title: "Menopause / vasomotor symptoms",
        subtitle: "12 months amenorrhea · vasomotor / GU symptoms · hormone therapy",
        nclexTags: gynR8,
        definition: AttributedProse(
            "Permanent cessation of menses; clinical diagnosis after 12 consecutive months of amenorrhea (typical age 45–55). Perimenopause is the transition years prior. Vasomotor symptoms (hot flashes, night sweats) are the hallmark; genitourinary syndrome of menopause (GSM) is common per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Ovarian follicle depletion → loss of cyclic estrogen and progesterone → elevated FSH and LH. Estrogen withdrawal accounts for vasomotor instability, atrophic genitourinary changes, accelerated bone loss, and CV risk profile shift.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Vasomotor — hot flashes, night sweats; can persist 5–15+ years.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Sleep disturbance, fatigue, mood changes.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Genitourinary syndrome — vaginal dryness, dyspareunia, urinary urgency, recurrent UTI, vulvovaginal atrophy.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Bone — accelerated loss; osteoporosis risk rises; consider DXA at 65 (or earlier with risk factors).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Cardiovascular — risk profile worsens; lipid changes, BP, glucose.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — 12 consecutive months of amenorrhea in absence of other cause.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("FSH not routinely needed for diagnosis; useful in atypical presentations (early menopause <40, symptomatic but cycling).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Rule out pregnancy in any perimenopausal patient with new amenorrhea.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Symptom severity, impact on quality of life and sleep.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("CV risk, breast / endometrial cancer history (informs HT decisions).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Bone-density risk factors (DXA timing).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Sexual health — partner status, dyspareunia, lubrication.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Lifestyle — sleep hygiene, layered clothing, fans, exercise, caffeine / alcohol moderation.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hormone therapy (HT) — most effective for vasomotor symptoms; estrogen alone if hysterectomized, estrogen + progestin if uterus intact (endometrial protection); use lowest effective dose for shortest time, individualized risk-benefit per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Non-hormonal — SSRI/SNRI (paroxetine FDA-approved), gabapentin, oxybutynin, fezolinetant (NK3 receptor antagonist) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("GSM — vaginal moisturizers + lubricants; topical low-dose vaginal estrogen for refractory symptoms (low systemic absorption) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Bone health — calcium 1200 mg + vitamin D 800–1000 IU; weight-bearing exercise; bisphosphonate per DXA / FRAX.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("CV risk reduction — diet, exercise, statin per ASCVD risk, BP / glucose management.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("Postmenopausal bleeding — ALWAYS abnormal; transvaginal US ± biopsy to rule out endometrial cancer.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("HT contraindications — VTE history, breast / endometrial cancer, undiagnosed bleeding, severe liver disease.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Premature menopause (<40) — increased CV / osteoporotic risk; HT until typical menopause age unless contraindicated.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Breast Cancer

public enum BreastCancerSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "breast-cancer",
        title: "Breast cancer",
        subtitle: "Most common cancer in U.S. women · receptor status drives treatment",
        nclexTags: breastR8,
        definition: AttributedProse(
            "Malignant proliferation of breast epithelial cells; most common cancer in women in the U.S. and second-leading cause of cancer mortality. Subtype (HR-positive, HER2-positive, triple-negative) drives systemic treatment selection per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Carcinoma in situ (DCIS) → invasive ductal or lobular carcinoma → lymph-node involvement → distant metastasis (bone, lung, liver, brain). Risk factors: age, family history (BRCA1/2), early menarche / late menopause, nulliparity, alcohol, obesity, prior radiation, dense breast tissue.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Painless palpable breast mass — most common; firm, irregular, fixed.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Nipple changes — retraction, scaling (Paget's disease), bloody discharge.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Skin changes — peau d'orange (lymphedema), erythema, ulceration.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Axillary lymphadenopathy.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Inflammatory breast cancer — rapid-onset diffuse erythema, warmth, peau d'orange (no mass needed); aggressive subtype.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Many cancers found by screening before symptoms.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Diagnostic mammography ± ultrasound; MRI in dense breasts / high-risk.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Core-needle biopsy is gold standard for diagnosis.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Receptor profile — ER, PR, HER2, Ki-67; oncotype recurrence score.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Staging — TNM; CT / bone scan / PET if metastasis suspected.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Breast exam — palpable mass, lymphadenopathy, skin changes.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Family history — first-degree, BRCA1/2, multiple cancers, male breast cancer; refer for genetic counseling per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Psychosocial — body image, fertility planning, support system.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Surgery — lumpectomy (breast-conserving) + radiation OR mastectomy ± reconstruction per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Sentinel lymph-node biopsy ± axillary dissection.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Adjuvant systemic therapy — tailored by receptor status. ER/PR-positive: tamoxifen (premenopausal) or aromatase inhibitor (postmenopausal). HER2-positive: trastuzumab + chemotherapy. Triple-negative: chemotherapy ± immunotherapy per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Lymphedema prevention and management — referral to certified lymphedema therapist; avoid BP / IV / venipuncture in affected arm per primary source.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Survivorship — bone health (especially with AI), CV monitoring (anthracyclines, trastuzumab), psychological support, ongoing surveillance.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("Inflammatory breast cancer — RAPID worsening; do not mistake for mastitis/cellulitis if not lactating.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Brain metastases — headache, focal deficit, seizure; especially HER2-positive and triple-negative.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Bone metastases — pain, pathologic fracture, hypercalcemia, cord compression.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Cardiotoxicity — trastuzumab + anthracyclines; baseline + serial echocardiograms.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Psychosocial — high rates of depression, anxiety; integrate behavioral health support.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Kidney Stones

public enum KidneyStonesSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "kidney-stones",
        title: "Kidney stones (nephrolithiasis)",
        subtitle: "Renal colic · CT non-contrast · stone composition guides prevention",
        nclexTags: uroR8,
        definition: AttributedProse(
            "Crystalline aggregates that form in the urinary tract. Calcium oxalate is the most common (~75%); others — calcium phosphate, uric acid, struvite (infection-related), cystine. Lifetime prevalence ~10% in adults, with high recurrence per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Supersaturation of urinary solutes + reduced inhibitors → crystal nucleation, aggregation, and stone formation. Risk factors: dehydration, high-protein / high-sodium diet, obesity, hyperparathyroidism, RTA, gout (uric acid), recurrent UTI (struvite).",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Renal colic — severe waxing / waning flank pain radiating to groin / testicle / labia; patient writhing, unable to find comfortable position (vs peritonitis where patient lies still).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hematuria (gross or microscopic).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Nausea / vomiting.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Dysuria, urgency, frequency if stone in distal ureter.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Fever / sepsis if obstructed AND infected — UROLOGIC EMERGENCY.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Non-contrast CT abdomen/pelvis (CT KUB) — gold standard; identifies size, location, hydronephrosis.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("UA — hematuria, crystals, leukocyte esterase / nitrites if infected.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("BMP, calcium, phosphate, uric acid, PTH if recurrent; 24-hr urine for stone risk in recurrent stone formers.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Stone strain urine and analyze recovered stones.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain control; vital signs (fever, hypotension → infected obstruction).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hydration status; nausea / vomiting tolerance for PO.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Renal function; rule out other causes of flank pain (AAA in older adult, pyelonephritis, ectopic pregnancy).", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Pain — NSAIDs (ketorolac IV) preferred over opioids when no contraindication per primary source; opioid adjunct.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Antiemetic — ondansetron.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("IV hydration if dehydrated; otherwise PO fluids — overhydration does NOT speed passage.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Medical expulsive therapy — alpha-1 blocker (tamsulosin) for distal ureteral stones 5–10 mm per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Strain urine for stone analysis.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Urology consult — emergent for obstructed + infected stone (decompression with ureteral stent or percutaneous nephrostomy); semi-urgent for AKI, intractable pain, large stones (>10 mm).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Definitive treatment — shockwave lithotripsy, ureteroscopy / laser, percutaneous nephrolithotomy depending on size / location.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Prevention — increase fluids to 2.5–3 L/day; reduce sodium and animal protein; specific diet by stone composition (citrus / citrate for calcium oxalate; alkalinize urine for uric acid; antibiotics for struvite); thiazide / allopurinol per primary source.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("INFECTED OBSTRUCTED STONE — fever + obstruction = urosepsis emergency; emergent decompression + IV antibiotics.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("AKI from bilateral obstruction or single functioning kidney — emergent.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Stone recurrence — 50% within 5 years without prevention; stone analysis + 24-hr urine guide therapy.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Prostatitis

public enum ProstatitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "prostatitis",
        title: "Prostatitis",
        subtitle: "Acute bacterial · chronic bacterial · CP/CPPS · prolonged antibiotics",
        nclexTags: uroR8,
        definition: AttributedProse(
            "Inflammation of the prostate. Categorized as acute bacterial prostatitis (NIH Cat I), chronic bacterial prostatitis (Cat II), chronic prostatitis / chronic pelvic pain syndrome (Cat III — most common; non-bacterial), and asymptomatic inflammatory prostatitis (Cat IV) per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Acute bacterial — typically gram-negative (E. coli, Klebsiella) ascending from urethra. Chronic bacterial — recurrent UTI from prostatic reservoir. CP/CPPS — multifactorial, often non-infectious; nervous, immune, and muscular components.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Acute bacterial — fever, chills, perineal / pelvic / low-back pain, dysuria, urinary urgency / frequency, retention; tender boggy prostate on DRE (do NOT vigorously massage — bacteremia risk).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Chronic bacterial — recurrent UTI with same organism; intermittent pelvic / perineal pain; dysuria.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("CP/CPPS — chronic pelvic pain ≥3 months without infection; voiding symptoms variable.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("UA, urine culture; pre- and post-prostatic-massage urine in chronic forms (Meares-Stamey 4-glass or 2-glass).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("CBC, basic chemistry; PSA may be elevated acutely.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Imaging not routinely required; CT / TRUS for abscess if not improving.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("DRE — boggy, tender prostate in acute; otherwise often non-specific.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Acute — sepsis screen, hemodynamic stability, urinary retention.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Chronic / CPPS — pain pattern, voiding symptoms, sexual function, mood / depression.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Sexual / partner history; prior treatment courses and durations.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Acute bacterial — empirical fluoroquinolone (ciprofloxacin, levofloxacin) or TMP-SMX × 4–6 weeks (longer courses penetrate prostate) per primary source; IV antibiotics for sepsis.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Chronic bacterial — fluoroquinolone × 6 weeks per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("CP/CPPS — multimodal: alpha-1 blocker (tamsulosin), pelvic-floor PT, anti-inflammatories, neuropathic-pain agents, behavioral therapy per primary source.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Acute retention — straight catheterization or suprapubic per provider (avoid trauma).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hydration; pain control; warm sitz baths; stool softener.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("PROSTATIC ABSCESS — fever despite antibiotics; obtain TRUS or CT; surgical drainage by urology.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Bacteremia / sepsis from acute bacterial prostatitis — IV antibiotics, ICU as needed.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("CPPS chronicity — frustrating; multidisciplinary approach + mental health support improves outcomes.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Testicular Torsion

public enum TesticularTorsionSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "testicular-torsion",
        title: "Testicular torsion",
        subtitle: "Surgical emergency · 6-hour window · sudden severe scrotal pain",
        nclexTags: uroR8,
        definition: AttributedProse(
            "Twisting of the spermatic cord → compromised testicular blood supply → ischemia and infarction. Surgical emergency; testicular salvage falls steeply after 6 hours of ischemia per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Bell-clapper deformity (transverse intratunical orientation) predisposes; spontaneous torsion or after activity / cold. Cord twist → venous obstruction → arterial compromise → infarction within 6–12 hours.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Sudden, severe testicular pain — often awakens patient, may radiate to lower abdomen.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Nausea / vomiting (very common).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Affected testicle high-riding, transverse lie, swollen, exquisitely tender.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("ABSENT cremasteric reflex (stroking inner thigh — no testicular elevation) — sensitive but not specific.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Negative Prehn sign (lifting testicle does NOT relieve pain — vs epididymitis where it does).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Peak ages — neonatal and adolescent (12–18) per primary source.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL DIAGNOSIS — do NOT delay surgery for imaging if high suspicion.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Color Doppler ultrasound — reduced / absent intratesticular blood flow; useful when diagnosis uncertain BUT must not delay urology consult.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Time of pain onset — directly informs salvage probability.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pain control; vital signs.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Differential — epididymitis (gradual onset, fever, dysuria, positive Prehn), testicular tumor, hernia, hydrocele.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("EMERGENT urology consult — surgical detorsion + bilateral orchiopexy is definitive per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Manual detorsion attempt (if surgery delayed) — \"open the book\" maneuver, rotate affected testicle outward (laterally) per primary source; success indicated by pain relief.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("NPO; pain control; antiemetics; IV access for surgery.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Testicular salvage rates: ~95% if <6 hr; ~50% at 8–12 hr; <10% after 24 hr per primary source.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("DELAY = LOSS — every hour matters; activate OR while completing workup.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Recurrent / intermittent torsion — historic episodes of similar pain that resolved; bilateral orchiopexy still indicated.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Loss of testicle → orchiectomy and consideration of prosthetic implant; counseling on contralateral fixation to prevent future torsion.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Osteoarthritis

public enum OsteoarthritisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "osteoarthritis",
        title: "Osteoarthritis (OA)",
        subtitle: "Degenerative joint disease · weight-bearing joints · activity worsens",
        nclexTags: rheumR8,
        definition: AttributedProse(
            "Degenerative disease of articular cartilage and subchondral bone leading to joint pain, stiffness, and disability. Most commonly affects weight-bearing joints (knees, hips, lumbar spine) and hands (DIP, PIP, base of thumb) per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Cartilage breakdown → reactive subchondral bone changes (sclerosis, osteophytes), synovial inflammation, joint space narrowing, deformity. Risk factors: age, female sex, obesity, prior joint injury, occupational / repetitive stress, genetic predisposition.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Joint pain WORSE WITH ACTIVITY, BETTER WITH REST (vs RA — better with activity).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Brief morning stiffness <30 minutes (vs RA stiffness ≥1 hour).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Crepitus on movement.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hands — Heberden nodes (DIP), Bouchard nodes (PIP); base of thumb (squaring).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("No systemic features (no fever, no fatigue) — important distinction from inflammatory arthritis.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical — typical history + exam.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Plain radiographs — joint-space narrowing, osteophytes, subchondral sclerosis, cysts (NOT erosions — those suggest inflammatory).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Inflammatory markers (ESR, CRP) typically NORMAL; useful to rule out inflammatory arthritis.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain severity, function (ADLs, gait, stairs), affected joints.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Mechanical issues — instability, locking (rule out meniscus / loose body).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Weight, comorbidities affecting pharmacotherapy (renal, GI, CV).", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("LIFESTYLE — weight loss (1 lb lost = 4 lb less knee load), low-impact aerobic exercise (walking, swimming, cycling), strengthening (quads for knee OA), tai chi, yoga per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Topical NSAID — first-line for hand and knee OA per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Oral NSAIDs at lowest effective dose; PPI cover for GI risk; AVOID in CKD, HF, recent CV event.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Acetaminophen — modest benefit; preferred when NSAIDs contraindicated.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Intra-articular corticosteroid injection — short-term relief; no more than 3–4 / year per joint per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Hyaluronic acid injection — limited evidence; some patients benefit per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Duloxetine for chronic OA pain — neuropathic adjunct.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Physical / occupational therapy; assistive devices (cane in opposite hand for knee/hip OA).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Joint replacement — for refractory disabling pain not responsive to conservative measures.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("NSAID adverse effects — GI bleed, AKI, HF, HTN, CV events; minimize duration / dose.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Opioid prescribing — strongly discouraged for chronic OA per primary source; risk far exceeds benefit long-term.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Mechanical worsening / instability — orthopedic referral; consider imaging for meniscal tear or AVN.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Fibromyalgia

public enum FibromyalgiaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "fibromyalgia",
        title: "Fibromyalgia",
        subtitle: "Chronic widespread pain · central sensitization · multimodal management",
        nclexTags: painR8,
        definition: AttributedProse(
            "Chronic disorder of widespread pain, fatigue, sleep disturbance, and cognitive symptoms attributable to central nervous system pain processing dysregulation. Diagnostic criteria from ACR (2016) emphasize widespread pain index + symptom severity over tender points per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Central sensitization — augmented CNS processing of nociceptive input + altered descending inhibition. Often follows physical or emotional stressor / trauma. Strong overlap with mood, anxiety, IBS, migraine, TMJ.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Widespread musculoskeletal pain bilateral, above and below waist, axial — for ≥3 months.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Profound fatigue; non-restorative sleep.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("\"Fibro fog\" — cognitive difficulty, memory problems.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Mood — depression, anxiety in ~50%.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Comorbidities — IBS, chronic headaches, TMJ, restless legs, dyspareunia, paresthesias.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACR 2016 — Widespread Pain Index + Symptom Severity Score; symptoms ≥3 months; not better explained by another disease.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("EXCLUDE — hypothyroidism (TSH), inflammatory arthritis (ESR/CRP, RF, ANA only if suspected — routine ANA NOT indicated as it has high false-positive rate), polymyalgia rheumatica (in older adults).", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Pain pattern, sleep quality, fatigue, cognitive symptoms, mood (PHQ-9, GAD-7).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Functional impact — work, relationships, physical activity.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Comorbid pain conditions and prior treatment history.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("PATIENT EDUCATION — central pain processing model; framing reduces stigma and improves outcomes per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Aerobic exercise — most evidence-based intervention; start LOW, progress SLOW; low-impact (walking, swimming, cycling) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Cognitive-behavioral therapy + sleep hygiene + stress management.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Pharmacology — duloxetine, milnacipran (SNRI; FDA-approved); pregabalin, gabapentin (FDA-approved); amitriptyline (off-label, sleep + pain) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("AVOID OPIOIDS — they worsen central sensitization and cause dependence; insufficient benefit per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Treat comorbid depression / anxiety; address sleep apnea if present.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Multidisciplinary care — rheumatology, PT, psychology, primary care.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("Suicide risk — chronic pain + depression; ASK and address.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Concurrent inflammatory disease — re-evaluate if signs of synovitis, abnormal labs develop.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Validation matters — patients often dismissed; therapeutic alliance is key to engagement.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ankylosing Spondylitis

public enum AnkylosingSpondylitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "ankylosing-spondylitis",
        title: "Ankylosing spondylitis (AS)",
        subtitle: "Axial spondyloarthritis · sacroiliitis · HLA-B27 · TNF / IL-17 biologics",
        nclexTags: rheumR8,
        definition: AttributedProse(
            "Chronic inflammatory disease of the spine and sacroiliac joints — the prototype axial spondyloarthritis. Strong association with HLA-B27. Onset typically before age 45 per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Inflammation at entheses (where ligaments and tendons attach to bone) and joints → erosive change, then fibrosis and ossification → bony bridging (\"bamboo spine\") and loss of mobility. Strong genetic component with HLA-B27 (~90% of AS patients vs ~8% general population).",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Inflammatory back pain — gradual onset, age <45, morning stiffness >30 min, BETTER with exercise, awakens patient at night.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Buttock pain (sacroiliitis), often alternating sides.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Reduced spinal mobility; loss of lumbar lordosis; thoracic kyphosis with progression.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Enthesitis — Achilles, plantar fascia.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Acute anterior uveitis (~30%) — painful red eye with photophobia; refer to ophthalmology.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Other associations — IBD, psoriasis, aortitis, restrictive lung physiology.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ASAS criteria — chronic back pain + age onset <45 + sacroiliitis on MRI / X-ray OR HLA-B27 + clinical features per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("X-ray sacroiliac joints — erosions, sclerosis, ankylosis (late); MRI more sensitive for early disease.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("ESR / CRP often elevated; HLA-B27 supports diagnosis (not required).", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Spinal mobility — Schober test, occiput-to-wall, chest expansion.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Eye — uveitis screening question / referral.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Functional assessment — work, sleep, ADLs.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Exercise + posture — physical therapy is essential to maintain mobility per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("NSAIDs (continuous) — first-line; may slow radiographic progression per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("TNF inhibitors (adalimumab, etanercept, infliximab) for inadequate response to NSAIDs per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("IL-17 inhibitors (secukinumab, ixekizumab) — alternative biologic class per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("JAK inhibitors (upadacitinib, tofacitinib) — available; weigh CV / cancer risk per FDA label.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Conventional DMARDs (sulfasalazine, methotrexate) — limited efficacy in axial disease; useful for peripheral arthritis.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Smoking cessation — accelerates disease progression.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("ACUTE UVEITIS — emergent ophthalmology referral; topical steroid + cycloplegic per primary source.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Cervical-spine fragility — fused spine fractures with minor trauma; CT not X-ray for trauma evaluation.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Aortic regurgitation, conduction disease — ECG and echo periodically.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Restrictive lung disease from chest-wall stiffness; smoking dramatically worsens.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sjögren Syndrome

public enum SjogrenSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "sjogren-syndrome",
        title: "Sjögren syndrome",
        subtitle: "Autoimmune sicca · dry eyes / mouth · anti-SSA/SSB · lymphoma risk",
        nclexTags: rheumR8,
        definition: AttributedProse(
            "Systemic autoimmune disease characterized by lymphocytic infiltration of exocrine glands → reduced lacrimal and salivary secretion (sicca). Can be primary or secondary (associated with RA, SLE, scleroderma) per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "Lymphocytic infiltration of glands (salivary, lacrimal, others) → glandular dysfunction. Extra-glandular involvement: arthritis, vasculitis, peripheral neuropathy, interstitial lung disease, renal tubular acidosis. Increased risk (≈16x) of B-cell non-Hodgkin lymphoma (especially MALT) per primary source.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Dry eyes (xerophthalmia) — gritty / sandy sensation, burning, redness.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Dry mouth (xerostomia) — difficulty swallowing dry foods, dental caries acceleration, oral candidiasis.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Parotid / submandibular gland enlargement.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Fatigue, joint pain, Raynaud's phenomenon, vaginal dryness.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Extra-glandular — vasculitic rash, peripheral neuropathy, ILD, RTA.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ACR/EULAR 2016 — combination of: anti-SSA antibody, focal lymphocytic sialoadenitis on labial biopsy, ocular staining score, Schirmer test, unstimulated salivary flow.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Labs — anti-SSA (Ro), anti-SSB (La); ANA often positive; RF often positive; hypergammaglobulinemia.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Sicca symptom severity — dental health, eye health, swallowing.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Extra-glandular features — neurologic, pulmonary, renal, hematologic, lymphadenopathy / lymphoma signs.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Medication review — anticholinergics worsen sicca; minimize.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Sicca symptoms — artificial tears (preservative-free), cyclosporine eye drops (Restasis), punctal plugs; saliva substitutes, sugar-free gum, frequent hydration; pilocarpine / cevimeline (cholinergic) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Aggressive dental care — fluoride, caries prevention, regular cleanings.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Hydroxychloroquine for arthralgia, fatigue, mild systemic symptoms per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Severe systemic — methotrexate, azathioprine, mycophenolate, rituximab depending on involvement per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Ophthalmology and dental referrals are essential parts of care.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("MALT LYMPHOMA — persistent parotid enlargement, palpable mass, lymphadenopathy, cytopenias; biopsy.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Renal tubular acidosis — hypokalemic non-anion-gap acidosis; can present with nephrocalcinosis or fragility fractures.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pregnancy — anti-SSA crosses placenta; risk of neonatal lupus / congenital heart block; counsel and coordinate maternal-fetal medicine.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ANCA-Associated Vasculitis

public enum ANCAVasculitisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "anca-vasculitis",
        title: "ANCA-associated vasculitis",
        subtitle: "GPA / MPA / EGPA · small-vessel vasculitis · steroids + induction",
        nclexTags: rheumR8,
        definition: AttributedProse(
            "Group of small-vessel vasculitides associated with antineutrophil cytoplasmic antibodies — granulomatosis with polyangiitis (GPA), microscopic polyangiitis (MPA), and eosinophilic granulomatosis with polyangiitis (EGPA / Churg-Strauss). Multi-organ involvement; high mortality if untreated per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "ANCA antibodies activate primed neutrophils → degranulation and endothelial injury → small-vessel vasculitis with necrosis. GPA — granulomas + ENT/lung/kidney; MPA — predominantly renal-pulmonary, no granulomas; EGPA — eosinophilia, asthma, sinusitis.",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Constitutional — fever, weight loss, malaise, myalgia.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("ENT (GPA) — sinusitis, epistaxis, saddle-nose deformity, hearing loss, subglottic stenosis.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pulmonary — cough, hemoptysis, dyspnea, nodules / cavities (GPA), diffuse alveolar hemorrhage, asthma + eosinophilia (EGPA).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Renal — pauci-immune crescentic glomerulonephritis (most patients) → AKI, hematuria, proteinuria.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Skin — palpable purpura.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Neurologic — mononeuritis multiplex.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ANCA testing — c-ANCA (PR3) typically GPA; p-ANCA (MPO) typically MPA / EGPA.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Tissue biopsy (kidney, skin, lung) confirms diagnosis and guides treatment.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Imaging — CT chest, sinus imaging.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Labs — UA (active sediment), creatinine, ESR/CRP, eosinophil count (EGPA), IgE.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Renal function (creatinine, UA) — pauci-immune GN can progress over days.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Pulmonary status — hemoptysis, dyspnea, hypoxia.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Neurologic — focal weakness, sensory loss (mononeuritis multiplex).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Infection screen before immunosuppression.", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("INDUCTION — high-dose corticosteroid + RITUXIMAB or cyclophosphamide per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Plasma exchange — for severe renal disease (creatinine >5.7) or pulmonary hemorrhage per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("MAINTENANCE — rituximab (preferred), azathioprine, methotrexate per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Avacopan — C5a receptor antagonist; steroid-sparing per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("PJP, fungal, HBV prophylaxis for immunosuppressed patients per primary source.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Vaccines updated before immunosuppression when feasible.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("RAPIDLY PROGRESSIVE GLOMERULONEPHRITIS — emergent nephrology consult; can lose kidney function in days.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("DIFFUSE ALVEOLAR HEMORRHAGE — life-threatening; ICU + plasmapheresis per provider.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Subglottic stenosis (GPA) — stridor, hoarseness; surgical intervention.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Relapse — long-term surveillance even after remission; ANCA titer trends help but are not perfect.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Psoriasis

public enum PsoriasisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "psoriasis",
        title: "Psoriasis",
        subtitle: "Chronic inflammatory skin · plaque type most common · systemic disease",
        nclexTags: dermR8,
        definition: AttributedProse(
            "Chronic immune-mediated inflammatory disorder of the skin (and joints in 30%). Plaque psoriasis is the most common phenotype. Recognized as a systemic disease with associations: psoriatic arthritis, metabolic syndrome, CVD, depression, IBD per primary source.",
            citationIDs: ["openrn_ms_round8", "specialty_dx_round8"]
        ),
        pathophysiology: AttributedProse(
            "T-cell-driven inflammation (IL-17 / IL-23 / TNF axes) → keratinocyte hyperproliferation and altered differentiation → thickened epidermis with parakeratosis (silvery scale).",
            citationIDs: ["openrn_ms_round8"]
        ),
        presentation: [
            AttributedBullet("Plaque type — well-demarcated erythematous plaques with SILVERY-WHITE SCALE on extensor surfaces (elbows, knees), scalp, lumbosacral, umbilicus, gluteal cleft.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Auspitz sign — pinpoint bleeding when scale removed.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Nail involvement — pitting, onycholysis, oil spots, subungual hyperkeratosis.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Other types — guttate (post-strep, drop-shaped), inverse (intertriginous), pustular, erythrodermic (medical emergency).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Psoriatic arthritis (~30%) — DIP / asymmetric oligoarthritis / dactylitis / enthesitis / axial.", citationIDs: ["openrn_ms_round8"])
        ],
        diagnosticCriteria: [
            AttributedBullet("Clinical diagnosis based on appearance, distribution, nail findings.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Skin biopsy if uncertain; typically not required.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Severity by BSA + PASI; impact on QOL via DLQI.", citationIDs: ["openrn_ms_round8"])
        ],
        priorityAssessments: [
            AttributedBullet("Skin distribution and severity; nail and scalp involvement.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Joint pain — screen for psoriatic arthritis (PEST tool).", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Metabolic / cardiovascular comorbidities; depression.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Triggers — strep infection, lithium, beta-blockers, antimalarials, withdrawal from oral steroids, alcohol, smoking, stress, trauma (Koebner phenomenon).", citationIDs: ["openrn_ms_round8"])
        ],
        commonInterventions: [
            AttributedBullet("Mild-moderate (limited BSA) — topical corticosteroids (potency by site), vitamin D analogs (calcipotriene), tar, salicylic acid, calcineurin inhibitors (face / intertriginous) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Phototherapy (NB-UVB) for moderate disease per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Systemic for moderate-severe — methotrexate, cyclosporine, apremilast, acitretin per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Biologics — TNF inhibitors (adalimumab, etanercept, infliximab), IL-17 inhibitors (secukinumab, ixekizumab, brodalumab), IL-23 inhibitors (guselkumab, risankizumab, tildrakizumab) per primary source.", citationIDs: ["specialty_dx_round8"]),
            AttributedBullet("Education — chronic disease, triggers; lifestyle (weight, alcohol, smoking) modifies severity.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Psoriatic arthritis — coordinate with rheumatology; biologics treat both skin and joints.", citationIDs: ["openrn_ms_round8"])
        ],
        watchFor: [
            AttributedBullet("ERYTHRODERMIC PSORIASIS — >75% body surface area; thermoregulatory failure, fluid loss, infection risk; INPATIENT care per primary source.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("Generalized pustular psoriasis — high fever, skin pain, leukocytosis; emergency.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("AVOID systemic corticosteroids — can trigger erythrodermic / pustular flare on withdrawal per primary source.", citationIDs: ["openrn_ms_round8"]),
            AttributedBullet("CV risk — patients with severe psoriasis have ~2x MI risk; aggressive risk-factor management.", citationIDs: ["openrn_ms_round8"])
        ],
        citations: [openrnMSr8, specialtyDxR8],
        lastSourceFidelityReview: "2026-05-04"
    )
}
