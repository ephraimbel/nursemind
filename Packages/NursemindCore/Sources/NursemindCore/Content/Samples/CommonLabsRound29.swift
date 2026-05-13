import Foundation

// Curator-model lab entries (round 29 — endocrine diagnostics).

private let openrnLabsR29 = CitationSource(
    id: "openrn_labs_round29",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR29 = CitationSource(
    id: "specialty_labs_round29",
    shortName: "Endocrine Society + AACE + ENETS concept citations",
    publisher: "Endocrine Society · AACE · ENETS",
    license: .factCitationOnly,
    url: "https://www.endocrine.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR29 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .glucoseRegulation
)

public enum MetanephrinesSample {
    public static let entry: LabEntry = LabEntry(
        id: "plasma-metanephrines",
        title: "Plasma metanephrines + 24-hour urine catecholamines",
        subtitle: "Pheochromocytoma + paraganglioma workup · plasma free metanephrines 1st-line · 4× ULN highly suspicious · supine + medication interference",
        specimen: "Plasma (free metanephrines + normetanephrines) — supine 30 min before draw; 24-hour urine fractionated metanephrines + catecholamines + creatinine; specific collection container with acid preservation",
        nclexTags: labsTagsR29,
        referenceRanges: [
            ReferenceRangeRow(value: "Plasma free metanephrines <0.5 nmol/L (88 pg/mL)", label: "Normal range; ~98% NPV when negative; rules out pheochromocytoma reliably", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "Plasma free normetanephrines <0.9 nmol/L (148 pg/mL)", label: "Normal range; normetanephrine reflects norepinephrine secretion", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "Plasma free metanephrines 4× ULN", label: "HIGHLY SUSPICIOUS for pheochromocytoma — proceed to imaging + localization", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "24-hour urine metanephrines <400 mcg/24h", label: "Normal range (varies by lab); fractionated metanephrines + normetanephrines", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "24-hour urine catecholamines <100 mcg/24h", label: "Normal range; less sensitive than metanephrines (intermittent secretion)", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "Urine VMA — older test", label: "Less sensitive + specific; replaced by metanephrines", citationIDs: ["specialty_labs_round29"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal — pheochromocytoma excluded (≈98% NPV)",
                summary: "Normal plasma free metanephrines have ~98% negative predictive value. Rules out pheochromocytoma in most cases per primary source.",
                nursingActions: [
                    "Reassure if clinical suspicion was low.",
                    "If clinical suspicion HIGH (paroxysmal symptoms, family history MEN-2/VHL/NF-1, adrenal incidentaloma) — repeat OR proceed to imaging anyway.",
                    "Continue routine surveillance in MEN-2 / VHL / NF-1 carriers.",
                    "Document baseline for future comparison."
                ],
                citationIDs: ["specialty_labs_round29"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Elevated — workup pheochromocytoma",
                summary: "Elevated metanephrines (especially >4× ULN) — highly suspicious for pheochromocytoma OR paraganglioma. Confirm + LOCALIZE with imaging + initiate alpha-blockade before any surgical intervention per primary source.",
                nursingActions: [
                    "ENDOCRINOLOGY referral — urgent.",
                    "REPEAT plasma metanephrines in supine position + 24-h urine metanephrines to confirm.",
                    "MEDICATION REVIEW — discontinue interfering drugs (tricyclics, SSRIs, MAOIs, sympathomimetics, levodopa, methyldopa, decongestants) × 2 weeks before repeat.",
                    "AVOID provoking stimuli — sympathomimetics, opioids (some), beta-blockers without alpha-blockade (paradoxical hypertensive crisis).",
                    "IMAGING — adrenal CT or MRI with adrenal protocol; if negative + biochemical positive → DOTATATE PET-CT or MIBG (paraganglioma extra-adrenal localization).",
                    "GENETIC TESTING — MEN-2 (RET), VHL, NF-1, SDHx (familial paragangliomas); 30-40% germline mutations.",
                    "PREOPERATIVE ALPHA-BLOCKADE — phenoxybenzamine OR doxazosin 10-14 days; rehydration; beta-blockade ONLY AFTER alpha (otherwise paradoxical HTN crisis).",
                    "BLOOD PRESSURE MONITORING — paroxysmal HTN crisis precautions; counsel.",
                    "SURGERY — laparoscopic adrenalectomy at experienced center; intraoperative HTN management; postoperative ICU."
                ],
                citationIDs: ["specialty_labs_round29"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Mildly elevated (1-3× ULN)",
                summary: "Mildly elevated metanephrines — diagnostic uncertainty; assess medication interference + reproductive state + comorbidities. Repeat + further testing per primary source.",
                nursingActions: [
                    "MEDICATION review — interference common with mildly elevated values.",
                    "REPEAT supine fasting plasma + 24-h urine; multiple positive results increase confidence.",
                    "CLONIDINE SUPPRESSION TEST — 0.3 mg PO; plasma metanephrines drop in physiologic stress / interference; remain elevated in pheochromocytoma.",
                    "IMAGING with adrenal CT — incidentaloma + family history → workup.",
                    "Genetic testing if young / family history / multifocal."
                ],
                citationIDs: ["specialty_labs_round29"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "True elevation — pheochromocytoma / paraganglioma",
                causes: ["Adrenal pheochromocytoma (~85% of catecholamine-secreting tumors)", "Extra-adrenal paraganglioma (sympathetic — abdominal, thoracic, pelvic; parasympathetic — head + neck)", "MEN-2A / MEN-2B (RET mutation)", "Von Hippel-Lindau syndrome (VHL gene)", "Neurofibromatosis type 1 (NF-1 gene)", "Familial paraganglioma syndromes (SDHB, SDHC, SDHD, SDHAF2, TMEM127, MAX)"],
                citationIDs: ["specialty_labs_round29"]
            ),
            CauseGroup(
                title: "False elevations / interference",
                causes: ["Tricyclic antidepressants (amitriptyline, nortriptyline) — most common", "SNRIs + SSRIs", "MAOIs", "Sympathomimetics (decongestants, amphetamines, methylphenidate)", "Levodopa, methyldopa", "Cocaine, methamphetamine", "Acute illness (severe HF, MI, stroke)", "Caffeine + nicotine 24-48 hours pre-test", "Inadequate supine positioning"],
                citationIDs: ["specialty_labs_round29"]
            )
        ],
        nursingActions: [
            AttributedBullet("WHO TO TEST — paroxysmal HTN + symptoms (HA + sweating + palpitations triad), resistant HTN, severe pressor response to anesthesia/surgery, adrenal incidentaloma, family history pheo / MEN-2 / VHL / NF-1 / SDH, young-onset HTN (<40), HTN with hypokalemia, secondary HTN workup.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PROPER COLLECTION — plasma supine 30 minutes; 24-h urine acidified container; avoid stimulants + interfering drugs.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("Plasma free metanephrines preferred over urine — higher sensitivity + supine collection well-controlled.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("MEDICATION INTERFERENCE — most common cause of false positives; review thoroughly.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PREOPERATIVE PREPARATION — alpha-blockade 10-14 days BEFORE any surgical intervention; rehydration 1-2 L extra fluid/day; beta-blocker ONLY after alpha-blockade established (paradoxical HTN crisis if beta alone).", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("GENETIC TESTING — 30-40% germline mutations; family screening; surveillance protocols.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("MALIGNANT pheo — only definitively diagnosed by METASTASIS (not histology); ~10% malignant; ongoing surveillance.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("HEAD + NECK paragangliomas — typically non-secretory; chemodectoma, carotid body tumor; imaging-based workup.", citationIDs: ["specialty_labs_round29"])
        ],
        watchFor: [
            AttributedBullet("HYPERTENSIVE CRISIS — paroxysmal HTN with stimuli (surgery, anesthesia, contrast, certain medications, opioids, beta-blocker alone); IV phentolamine, nitroprusside, nicardipine.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("ORTHOSTATIC HYPOTENSION — post-operative; alpha-blockade unmasks volume depletion + autonomic dysfunction.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("CATECHOLAMINE CARDIOMYOPATHY — takotsubo-like; reversible with treatment.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("FAMILIAL — 30-40% germline; cascade testing + surveillance.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PEDIATRIC pheo — often familial (VHL, NF-1, SDH); bilateral, paraganglioma > adrenal, malignant risk.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PREGNANCY pheo — high mortality if undiagnosed; emergent multidisciplinary management.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("POSTOPERATIVE HYPOTENSION — anticipate; alpha-blockade discontinued; volume + vasopressors PRN.", citationIDs: ["specialty_labs_round29"])
        ],
        citations: [openrnLabsR29, specialtyLabsR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum IGF1Sample {
    public static let entry: LabEntry = LabEntry(
        id: "igf-1",
        title: "Insulin-like growth factor 1 (IGF-1 / somatomedin C)",
        subtitle: "Acromegaly biomarker · stable 24-hour marker of GH activity · age + sex normalized · pegvisomant monitoring · OGTT confirms",
        specimen: "Serum (any time of day — stable over 24 hours unlike GH pulses); age + sex-normalized reference ranges; fasting not required",
        nclexTags: labsTagsR29,
        referenceRanges: [
            ReferenceRangeRow(value: "Adult IGF-1 stable 24-hour marker", label: "Age + sex normalized; mid-normal range varies by lab; high end normal not abnormal per primary source", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "ELEVATED IGF-1 above age-sex range", label: "Suggests acromegaly (GH excess) or gigantism (pre-epiphyseal closure)", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "LOW IGF-1", label: "GH deficiency (adult or pediatric); malnutrition; severe systemic illness; uncontrolled diabetes; liver / kidney disease", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "Treatment target — pegvisomant + somatostatin analog", label: "Normal age-adjusted range — treatment success in acromegaly", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "Pegvisomant treatment — GH unreliable", label: "GH levels inflate falsely on pegvisomant; IGF-1 is the biomarker", citationIDs: ["specialty_labs_round29"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal IGF-1",
                summary: "Normal IGF-1 in age + sex range — acromegaly unlikely. GH deficiency unlikely in adults. Continue routine surveillance if clinical suspicion or family risk per primary source.",
                nursingActions: [
                    "Reassure if clinical concern minimal.",
                    "If acromegaly features present: repeat IGF-1 + OGTT (oral glucose tolerance test) for GH non-suppression.",
                    "Continue routine surveillance in at-risk patients (MEN-1, family history).",
                    "Adult GH deficiency — clinical features + at-risk history (pituitary surgery, radiation) → additional stimulation testing."
                ],
                citationIDs: ["specialty_labs_round29"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Elevated IGF-1 — workup acromegaly",
                summary: "Elevated IGF-1 above age-sex range suggests acromegaly. CONFIRMATORY testing with OGTT + MRI pituitary required per primary source.",
                nursingActions: [
                    "ENDOCRINOLOGY referral.",
                    "OGTT (75 g oral glucose) — GH measured 0, 30, 60, 90, 120 minutes; failure to suppress GH <1 ng/mL at any time → ACROMEGALY confirmed.",
                    "MRI PITUITARY with gadolinium — identifies adenoma (microadenoma <10 mm vs macroadenoma ≥10 mm; ~75% macroadenomas at diagnosis).",
                    "VISUAL FIELDS — for macroadenomas.",
                    "HYPOPITUITARISM workup — TSH/free T4, ACTH/cortisol, FSH/LH/sex hormones, prolactin.",
                    "COMPLICATIONS — fasting glucose / HbA1c, lipid panel, BP, sleep study, echocardiogram, colonoscopy (5-10 years earlier than standard).",
                    "MEN-1 screening if family history — calcium + PTH + prolactin + pancreatic NET workup.",
                    "Treatment — transsphenoidal pituitary surgery first-line; somatostatin analogs (octreotide, lanreotide) + pegvisomant + radiation for residual."
                ],
                citationIDs: ["specialty_labs_round29"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Low IGF-1 — workup GH deficiency",
                summary: "Low IGF-1 may suggest GH deficiency in adults — particularly with history of pituitary surgery, radiation, TBI, or hypopituitarism causes per primary source.",
                nursingActions: [
                    "Adult GH deficiency clinical features — increased visceral fat, decreased lean mass, fatigue, decreased QOL, dyslipidemia.",
                    "Pituitary stimulation testing — insulin tolerance test (gold standard), GHRH-arginine, glucagon stimulation; specialty.",
                    "Pituitary MRI — anatomic abnormalities.",
                    "Other pituitary axes workup — TSH/free T4, ACTH/cortisol, FSH/LH/sex hormones.",
                    "ADULT GH REPLACEMENT — selected; somatropin daily SC; cancer surveillance + glucose monitoring.",
                    "Pediatric — different workup + GH replacement is standard for confirmed deficiency + short stature."
                ],
                citationIDs: ["specialty_labs_round29"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated IGF-1",
                causes: ["Acromegaly (GH-secreting pituitary adenoma)", "Gigantism (pre-epiphyseal closure GH excess)", "Pregnancy (placental GH)", "Puberty (transient physiologic peak)", "Exogenous GH administration (athletic doping, growth hormone replacement)", "McCune-Albright syndrome", "MEN-1, Carney complex, familial isolated pituitary adenoma"],
                citationIDs: ["specialty_labs_round29"]
            ),
            CauseGroup(
                title: "Low IGF-1",
                causes: ["Adult GH deficiency (pituitary surgery, radiation, TBI, autoimmune)", "Pediatric GH deficiency (short stature)", "Malnutrition + anorexia nervosa + protein-energy malnutrition", "Severe systemic illness (sepsis, cancer cachexia)", "Uncontrolled diabetes + hepatic + renal disease", "Hypothyroidism", "Sleep apnea", "Aging (gradual decline)"],
                citationIDs: ["specialty_labs_round29"]
            )
        ],
        nursingActions: [
            AttributedBullet("IGF-1 IS THE BIOMARKER for acromegaly — stable, integrative reflection of GH activity over 24 hours (GH is pulsatile + unreliable single measurement).", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("AGE + SEX NORMALIZED — pediatric / adolescent IGF-1 much higher physiologically.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("OGTT confirms acromegaly — GH non-suppression with 75g glucose; gold standard.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PEGVISOMANT treatment monitoring — IGF-1 only (GH unreliable on pegvisomant); target normal age-adjusted.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("SOMATOSTATIN ANALOG treatment — both IGF-1 and GH used; target normal IGF-1 + GH <1 ng/mL.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("POSTOPERATIVE — IGF-1 normalization at 3-6 months indicates cure; persistent elevation → residual disease → adjuvant therapy.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("ADULT GH DEFICIENCY — IGF-1 may be normal in many; confirmation requires stimulation test.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("MALNUTRITION — IGF-1 low; corrects with nutrition; sensitive nutrition marker.", citationIDs: ["specialty_labs_round29"])
        ],
        watchFor: [
            AttributedBullet("ACROMEGALY DELAYED DIAGNOSIS — median 5-10 years from onset to diagnosis; aggressive features develop; pursue suspicion.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("CANCER SURVEILLANCE in acromegaly — colon, thyroid, breast cancer increased; colonoscopy earlier + more frequent.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("CARDIOVASCULAR mortality — acromegalic cardiomyopathy; biochemical control reduces.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("OSA + cardiometabolic — common comorbidities; sleep study + comprehensive management.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("HYPOPITUITARISM after surgery / radiation — comprehensive pituitary axis evaluation + replacement.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("ADULT GH REPLACEMENT — cancer surveillance, diabetes monitoring; not for active malignancy.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PREGNANCY — IGF-1 elevated physiologically; cannot use to diagnose acromegaly during pregnancy.", citationIDs: ["specialty_labs_round29"])
        ],
        citations: [openrnLabsR29, specialtyLabsR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ChromograninA5HIAASample {
    public static let entry: LabEntry = LabEntry(
        id: "chromogranin-a-5-hiaa",
        title: "Chromogranin A + 24-hour urine 5-HIAA",
        subtitle: "Carcinoid + neuroendocrine tumor markers · CgA general NET · 5-HIAA serotonin metabolite for carcinoid · PPI affects · diet restrictions urine",
        specimen: "Serum chromogranin A (fasting; off PPI × 2 weeks if possible); 24-hour urine 5-HIAA in acidified container; strict dietary restrictions × 3 days before urine collection",
        nclexTags: labsTagsR29,
        referenceRanges: [
            ReferenceRangeRow(value: "Serum chromogranin A <100 ng/mL", label: "Normal range; varies by lab; assay-dependent; not specific to one NET", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "Elevated CgA (>2-3× ULN)", label: "Suggests NET — but also PPI use (most common false elevation), atrophic gastritis, CKD, liver disease, IBD, sepsis, heart failure", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "24-h urine 5-HIAA <6 mg/24h", label: "Normal range (varies by lab + diet); 5-HIAA is serotonin metabolite", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "5-HIAA elevated (>25 mg/24h)", label: "Highly suggestive of carcinoid syndrome (serotonin-secreting NET, usually mid-gut origin); >100 mg/24h often advanced", citationIDs: ["specialty_labs_round29"]),
            ReferenceRangeRow(value: "PPI elevations of CgA", label: "PPIs cause 2-4× elevation through compensatory hypergastrinemia + chromaffin cell stimulation; major false-positive source", citationIDs: ["specialty_labs_round29"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal — NET unlikely (with reservations)",
                summary: "Normal CgA + 5-HIAA suggests NET unlikely. However, NETs can have normal markers (especially non-functional + small + non-serotonin-secreting). Imaging may identify silent NET per primary source.",
                nursingActions: [
                    "Reassure if clinical suspicion minimal.",
                    "If clinical suspicion HIGH (carcinoid syndrome, MEN-1 family) — repeat + imaging (DOTATATE PET-CT) anyway; markers can be normal in some NETs.",
                    "Continue surveillance in MEN-1 / VHL / NF-1.",
                    "If atypical symptoms or family history → genetic + imaging workup regardless."
                ],
                citationIDs: ["specialty_labs_round29"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Elevated — NET workup",
                summary: "Elevated CgA AND/OR 5-HIAA — workup neuroendocrine tumor. Confirm + LOCALIZE with imaging + biochemical specifics per primary source.",
                nursingActions: [
                    "ENDOCRINOLOGY / oncology / GI referral.",
                    "REVIEW interferences — PPI use (discontinue × 2 weeks before repeating CgA), recent food (urine 5-HIAA needs 3-day restriction), severe systemic illness.",
                    "Repeat CgA OFF PPI when possible.",
                    "DIET RESTRICTION × 3 DAYS for 24-h urine 5-HIAA — avoid bananas, walnuts, pineapples, avocados, eggplant, plums, kiwi, tomatoes, chocolate, coffee, tea, certain drugs (acetaminophen, salicylates, nicotine).",
                    "IMAGING — abdominal CT/MRI, EUS pancreas, DOTATATE PET-CT (preferred for staging + somatostatin receptor + planning PRRT), MIBG scan (older), octreotide scan.",
                    "Specific BIOMARKERS — gastrin (Zollinger-Ellison), insulin + C-peptide (insulinoma), VIP (VIPoma), glucagon (glucagonoma), pancreatic polypeptide, calcitonin (medullary thyroid).",
                    "CARDIAC carcinoid heart disease (~50% of serotonin-secreting metastatic NETs) — echocardiogram, pro-BNP, right-sided valvular disease (tricuspid regurgitation + pulmonic stenosis).",
                    "GENETIC TESTING — MEN-1 (if multiple NETs or pituitary / parathyroid), MEN-2 (medullary thyroid), VHL, NF-1, familial syndromes.",
                    "Treatment depends on tumor type, location, metastasis — surgical resection if localized; somatostatin analogs (octreotide, lanreotide); chemotherapy + targeted (everolimus, sunitinib); PRRT (Lutetium-177 DOTATATE); liver-directed therapies."
                ],
                citationIDs: ["specialty_labs_round29"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated CgA",
                causes: ["Carcinoid + gastroenteropancreatic NETs (~70-90% of NETs)", "Pheochromocytoma + paraganglioma", "Medullary thyroid carcinoma", "Small cell lung cancer", "Prostate cancer (rarely)", "PPI use (major false-positive)", "Atrophic gastritis + Helicobacter pylori", "CKD + liver disease + heart failure + sepsis + IBD"],
                citationIDs: ["specialty_labs_round29"]
            ),
            CauseGroup(
                title: "Elevated 5-HIAA (serotonin)",
                causes: ["Carcinoid syndrome (midgut NET — ileal, appendiceal — most common; also bronchial, ovarian, testicular)", "Hindgut NETs rarely (low serotonin production)", "Pancreatic NETs rarely (more often Whipple triad, gastrinoma features)", "DIETARY foods — bananas, walnuts, pineapples, avocados, plums, kiwi, tomatoes, chocolate, coffee, tea (false positives)", "DRUGS — acetaminophen, salicylates, nicotine, certain antidepressants"],
                citationIDs: ["specialty_labs_round29"]
            )
        ],
        nursingActions: [
            AttributedBullet("STRICT DIETARY RESTRICTIONS × 3 DAYS before 24-h urine 5-HIAA — bananas, walnuts, pineapples, avocados, eggplant, plums, kiwi, tomatoes, chocolate, coffee, tea, vanilla, acetaminophen, salicylates, nicotine; thorough patient education + supply list per primary source.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("DISCONTINUE PPI × 2 WEEKS before CgA if possible — major false-positive source; bridge with H2-blocker or antacid.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("FASTING serum CgA preferred.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("ACIDIFIED CONTAINER for 24-h urine; specimen handling instructions critical.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("CARCINOID SYNDROME SYMPTOMS — flushing (face/upper body), watery diarrhea, wheezing, abdominal pain, right-sided heart failure (carcinoid heart disease), pellagra-like rash; with metastatic mid-gut NET especially.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("OCTREOTIDE rescue for carcinoid crisis — short-acting subcutaneous; pre-procedure prophylaxis for any intervention.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("DOTATATE PET-CT is gold standard imaging for somatostatin-receptor-positive NETs; superior to octreotide scan; staging + planning PRRT.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("MEN-1 SCREENING — if multiple NETs or pituitary / parathyroid; genetic + biochemical surveillance.", citationIDs: ["specialty_labs_round29"])
        ],
        watchFor: [
            AttributedBullet("CARCINOID CRISIS — severe flushing + bronchospasm + hemodynamic instability; precipitated by anesthesia, contrast, palpation, biopsy; OCTREOTIDE prophylaxis pre-procedure + treatment.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("CARCINOID HEART DISEASE — right-sided valvular disease (tricuspid regurgitation, pulmonic stenosis); cardiac surgery + valve replacement.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PELLAGRA — niacin deficiency from tryptophan diversion to serotonin; dermatitis + diarrhea + dementia; supplement niacin.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("LIVER METASTASES common with NETs — liver-directed therapy + chemo + PRRT.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("HYPOGLYCEMIA in insulinoma — emergency; IV dextrose; counsel.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("REFRACTORY PUD in gastrinoma (Zollinger-Ellison) — high-dose PPI; localization + surgery.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("MEN-1 multifocal — lifelong surveillance + management.", citationIDs: ["specialty_labs_round29"]),
            AttributedBullet("PRRT (peptide receptor radionuclide therapy with Lutetium-177 DOTATATE) — transformative for somatostatin-receptor-positive NETs; specialized centers.", citationIDs: ["specialty_labs_round29"])
        ],
        citations: [openrnLabsR29, specialtyLabsR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}
