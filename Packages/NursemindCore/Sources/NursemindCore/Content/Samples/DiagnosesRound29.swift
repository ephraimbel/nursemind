import Foundation

// Curator-model diagnosis entries (round 29 — endocrine depth: pituitary + adrenal + parathyroid + thyroid + NETs).

private let openrnDxR29 = CitationSource(
    id: "openrn_dx_round29",
    shortName: "Open RN Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR29 = CitationSource(
    id: "cdc_dx_round29",
    shortName: "CDC + NIH endocrine concept citations",
    publisher: "CDC · NIH NIDDK",
    license: .publicDomain,
    url: "https://www.niddk.nih.gov/health-information/endocrine-diseases",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR29 = CitationSource(
    id: "specialty_dx_round29",
    shortName: "Endocrine Society + AACE + ATA + NOF concept citations",
    publisher: "Endocrine Society · AACE · ATA · NOF",
    license: .factCitationOnly,
    url: "https://www.endocrine.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-13"
)

private let endocrineTagR29 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .glucoseRegulation)
private let adrenalTagR29 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes)
private let pituitaryTagR29 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let boneTagR29 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .mobility)

public enum PrimaryAldosteronismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "primary-aldosteronism",
        title: "Primary aldosteronism (Conn syndrome)",
        subtitle: "Autonomous aldosterone excess · resistant HTN + hypokalemia · ARR screen · aldosterone-secreting adenoma OR bilateral hyperplasia · surgery vs spironolactone",
        nclexTags: adrenalTagR29,
        definition: AttributedProse(
            "Autonomous aldosterone secretion from adrenal cortex causing inappropriate sodium retention + potassium wasting + hypertension. ~5-10% of hypertensive patients; most underdiagnosed. Classic features — resistant HTN + hypokalemia. Aldosterone-renin ratio (ARR) is screening test. Causes — aldosterone-producing adenoma (Conn syndrome, ~40%), bilateral idiopathic hyperplasia (60%), familial forms (rare). Adrenal venous sampling distinguishes; treatment surgery for unilateral, mineralocorticoid antagonist for bilateral per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Autonomous aldosterone production independent of RAAS regulation → sodium retention + potassium excretion + volume expansion + hypertension. Renin suppressed (negative feedback). Long-term consequences — cardiovascular fibrosis + LVH + stroke + MI risk DISPROPORTIONATE to BP elevation; aldosterone has direct effects beyond BP.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("RESISTANT HYPERTENSION — uncontrolled despite 3+ antihypertensives (including diuretic) OR controlled on 4+ medications.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("HYPOKALEMIA — spontaneous OR diuretic-induced; muscle weakness, cramps, palpitations; only ~30-40% of cases (most ARE NOT hypokalemic).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("HEADACHE, fatigue, polyuria, polydipsia.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("FAMILY HISTORY hypertension; young onset HTN (<40); adrenal incidentaloma; stroke / cardiovascular events.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Metabolic alkalosis from H+/K+ exchange in distal nephron.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — adrenal adenoma (Conn), bilateral hyperplasia, familial hyperaldosteronism (GRA, FH-II, FH-III, FH-IV), age 30-60.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CV consequences — LVH, atrial fibrillation, CHF, stroke, MI — DISPROPORTIONATE to BP severity.", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ALDOSTERONE-RENIN RATIO (ARR) — primary screen; ARR >20-30 with elevated aldosterone (>10 ng/dL) + suppressed renin → suspicious; medication interference is major issue per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CONFIRMATORY testing — oral salt load (urine aldosterone >12 mcg/24h with high salt), saline infusion (aldosterone >10 ng/dL post-infusion), captopril challenge, fludrocortisone suppression test.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEDICATION ADJUSTMENT before testing — spironolactone + eplerenone OFF × 4-6 weeks; ACE-I, ARB, diuretics, beta-blockers ideally OFF (interfere); calcium channel blockers OK + alpha-blockers OK.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("POTASSIUM correction — hypokalemia must be corrected before testing (low K suppresses aldosterone falsely).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ADRENAL CT — adenoma (typically <3 cm) vs bilateral hyperplasia; sensitivity / specificity imperfect.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ADRENAL VENOUS SAMPLING (AVS) — GOLD STANDARD for lateralization; distinguishes unilateral (surgical) vs bilateral (medical); cortisol used as catheterization confirmation.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Familial screening — genetic testing for FH-I (GRA — glucocorticoid-remediable), FH-II, FH-III (KCNJ5), FH-IV.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("CONSIDER PRIMARY ALDOSTERONISM IN — resistant HTN, HTN + hypokalemia (spontaneous or diuretic-induced), HTN + adrenal incidentaloma, HTN + family history early-onset HTN/stroke <40, HTN onset <40, severe HTN >160/100, OSA + HTN.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEDICATION CHANGES — preparation for testing; coordinate with primary care + cardiology.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CV ASSESSMENT — echocardiogram for LVH, atrial fib monitoring, vascular disease screening.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("AVS at experienced center — lateralization for surgical candidates; complex procedure.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + interventional radiology + endocrine surgery.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("UNILATERAL adenoma (Conn syndrome) → LAPAROSCOPIC ADRENALECTOMY — curative in most; pre-op spironolactone to control BP + correct hypokalemia; post-op cure in ~50%, partial improvement in ~50% per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BILATERAL hyperplasia OR poor surgical candidates → MINERALOCORTICOID ANTAGONISTS — SPIRONOLACTONE 25-100 mg daily (titrate); EPLERENONE 25-50 mg BID alternative (more selective, less gynecomastia).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Add OTHER antihypertensives as needed — usually requires combination therapy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("POTASSIUM replacement until aldosterone antagonist suppresses; monitor K + Cr.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LIFESTYLE — sodium restriction <3 g/day, weight loss, exercise, alcohol moderation.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CARDIOVASCULAR risk reduction — statins, antiplatelets, BP target <130/80.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FAMILIAL forms — GRA — dexamethasone 0.125-0.25 mg HS suppresses aldosterone; FH-III often severe early-onset.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Follow-up — BP + electrolytes q3 months initially; CV monitoring lifelong.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("CARDIOVASCULAR consequences DISPROPORTIONATE to BP — LVH, atrial fibrillation, stroke, MI; treat aggressively.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOKALEMIA — arrhythmias, muscle weakness, paralysis; correct + spare K.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SPIRONOLACTONE adverse effects — gynecomastia (~10% males), mastodynia, menstrual irregularities, decreased libido, GI upset; switch to eplerenone if intolerable.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERKALEMIA on mineralocorticoid antagonist — especially with CKD + ACE-I/ARB; monitor.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("POST-ADRENALECTOMY — temporary mineralocorticoid deficiency; sodium retention may decrease; monitor + sometimes fludrocortisone bridge.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("UNDIAGNOSED — many patients with resistant HTN never screened; CV consequences accumulate.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ADRENAL CT vs AVS — CT alone misleading for lateralization; AVS gold standard.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum AcromegalySample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "acromegaly",
        title: "Acromegaly",
        subtitle: "GH-secreting pituitary adenoma · enlarged hands/feet/jaw + soft tissues · IGF-1 elevated · OGTT GH non-suppression · transsphenoidal surgery 1st",
        nclexTags: pituitaryTagR29,
        definition: AttributedProse(
            "Excess growth hormone (GH) secretion in adults from GH-producing pituitary adenoma — gigantism in children before epiphyseal closure. Progressive disfigurement (enlarged hands, feet, jaw, soft tissues, organs) + systemic complications (cardiomyopathy, sleep apnea, diabetes, hypertension, malignancy risk) + premature mortality if untreated. Median delay from onset to diagnosis 5-10 years. Treatment — transsphenoidal surgery first-line, somatostatin analogs + pegvisomant + radiation for residual per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Somatotroph pituitary adenoma → excess GH → liver IGF-1 production → tissue overgrowth + systemic effects. ~99% benign pituitary macroadenomas. Mass effect from tumor → headache, visual field defects, hypopituitarism. GH excess → connective tissue proliferation, organomegaly, insulin resistance.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("Insidious soft tissue + bone overgrowth over years — enlarged HANDS (ring size increases), FEET (shoe size), JAW (prognathism, dental spacing), SUPRAORBITAL ridges, frontal bossing, soft tissue thickening.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("FACIAL changes — coarse features, broad nose, thick lips, macroglossia, deep voice (vocal cord enlargement), increased interdental spacing.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("SKIN — thickening, oily, hyperhidrosis (excessive sweating), acrochordons (skin tags), seborrhea.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MUSCULOSKELETAL — arthralgia, joint enlargement, carpal tunnel syndrome (median nerve compression), back pain.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("METABOLIC — diabetes mellitus / impaired glucose tolerance (~30%), insulin resistance, hyperphosphatemia, hypercalciuria.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CARDIOVASCULAR — hypertension (~30%), cardiomyopathy (acromegalic), LVH, valvular disease, atrial fibrillation, premature CAD.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("RESPIRATORY — obstructive sleep apnea (~60%) from macroglossia + tissue thickening, central sleep apnea, voice changes.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MASS EFFECT — headache (frontal/temporal), visual field defects (bitemporal hemianopia from optic chiasm compression), hypopituitarism (anterior pituitary deficiencies).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MALIGNANCY — increased colon cancer + thyroid cancer + breast cancer risk; surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Risk factors — sporadic >95%; MEN-1 (associated with parathyroid + pancreatic NET); McCune-Albright syndrome; Carney complex.", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL features + IGF-1 elevation — IGF-1 (somatomedin C) is gold-standard biochemical marker; reflects 24-hour GH secretion; age + sex normalized per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ORAL GLUCOSE TOLERANCE TEST (OGTT) — 75g glucose; GH normally suppresses to <1 ng/mL at 2 hours; non-suppression confirms acromegaly.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MRI pituitary with gadolinium — visualizes adenoma (microadenoma <10 mm vs macroadenoma ≥10 mm); ~75% macroadenomas at diagnosis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VISUAL FIELD testing — macroadenoma compression of optic chiasm; bitemporal hemianopia.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOPITUITARISM workup — TSH/free T4, ACTH/cortisol, FSH/LH/testosterone or estradiol, prolactin, ADH if mass effect.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Complications screening — fasting glucose / HbA1c, lipid panel, BP, sleep study, echocardiogram, colonoscopy (5-10 years earlier than usual), DEXA, dental.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 screening if family history — parathyroid (calcium, PTH), pancreatic NET (gastrin, insulin, glucagon, VIP).", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("ENDOCRINOLOGY + NEUROSURGERY referral — early to dedicated pituitary center.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VISUAL FIELDS — emergent if visual changes; surgery indicated.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CARDIOVASCULAR + RESPIRATORY assessment — preoperative; cardiomyopathy + OSA.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("COMPLICATIONS workup — diabetes, sleep apnea, colon cancer screening, cardiovascular.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Comprehensive baseline — IGF-1, pituitary function, MRI, vision, comorbidities.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("TRANSSPHENOIDAL PITUITARY SURGERY — first-line for surgical candidates; cure rate 80% microadenoma, 50% macroadenoma; experienced pituitary surgeon essential per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SOMATOSTATIN ANALOGS — octreotide LAR (Sandostatin LAR) 20-40 mg deep IM q4 weeks OR lanreotide (Somatuline) 120 mg deep SC q4 weeks; pre-op shrinkage; post-op residual; non-surgical; ~50-70% biochemical control.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DOPAMINE AGONISTS — cabergoline; less effective; co-secreting prolactin tumors; adjunct to somatostatin.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PEGVISOMANT (Somavert) — GH receptor antagonist; daily SC; normalizes IGF-1 ~70-90% refractory cases; LFT monitoring; tumor surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PASIREOTIDE — second-generation somatostatin analog; effective in some resistant; hyperglycemia + diabetes risk.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RADIATION THERAPY — stereotactic (gamma knife) or conventional; delayed effect 5-15 years; reserved for residual / refractory; hypopituitarism risk.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("COMPLICATIONS management — diabetes (metformin + SGLT2/GLP-1 RAs), HTN (calcium channel blocker, ACE-I), OSA (CPAP), cardiomyopathy (CHF guidelines), arthritis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CANCER SURVEILLANCE — colonoscopy earlier + more frequent; thyroid + breast surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + neurosurgery + radiation oncology + ENT + cardiology + dental + ophthalmology.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("PERIOPERATIVE — diabetes insipidus (transient/permanent), SIADH, adrenal insufficiency, hypothyroidism, CSF leak — pituitary surgery complications.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOPITUITARISM — radiation OR surgery sequelae; lifelong hormone replacement may be required.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PREMATURE MORTALITY — IGF-1 normalization critical; CV mortality reduced when biochemical control achieved.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MASS EFFECT — visual changes, hypopituitarism if untreated.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SOMATOSTATIN side effects — GI (diarrhea), gallstones (~25%), glucose dysregulation.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PEGVISOMANT — hepatotoxicity (LFT monitoring); does NOT shrink tumor; surveillance MRI.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PSYCHOSOCIAL — body image changes, social isolation, depression; counseling + support.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Cardiomyopathy reversal — partial with biochemical control + standard CHF therapy.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ProlactinomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "prolactinoma",
        title: "Prolactinoma",
        subtitle: "Most common pituitary tumor · galactorrhea + amenorrhea + erectile dysfunction · cabergoline 1st-line · surgery refractory · pregnancy implications",
        nclexTags: pituitaryTagR29,
        definition: AttributedProse(
            "Prolactin-secreting pituitary adenoma — most common functional pituitary tumor (~40% of pituitary adenomas). Microprolactinoma (<10 mm) vs macroprolactinoma (≥10 mm). Causes hypogonadism + galactorrhea via prolactin excess; macroadenomas additional mass effect (visual, hypopituitarism). DOPAMINE AGONISTS (cabergoline 1st-line) achieve normalization + tumor shrinkage in ~80%; surgery for refractory + apoplexy + visual deficits refractory; radiation rare per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Lactotroph cell adenoma → hypersecretion of prolactin (PRL) → suppression of GnRH → reduced LH + FSH → hypogonadism (amenorrhea / oligomenorrhea, infertility, erectile dysfunction, decreased libido) + galactorrhea (direct effect on breast). Macroadenoma mass effect — headache, visual field defects, hypopituitarism.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("WOMEN premenopausal — amenorrhea / oligomenorrhea, infertility, galactorrhea, decreased libido.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MEN — erectile dysfunction, decreased libido, infertility, gynecomastia, galactorrhea (rare), reduced facial / body hair.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("POSTMENOPAUSAL women — mass effect symptoms (HA, visual) as women typically asymptomatic from PRL excess.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PEDIATRIC — delayed puberty, primary amenorrhea, growth delay.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MASS EFFECT — headache, bitemporal hemianopia (optic chiasm compression), hypopituitarism (anterior + posterior).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("OSTEOPOROSIS — long-term hypogonadism + decreased estrogen / testosterone.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — sporadic >95%; MEN-1; familial isolated pituitary adenoma; drugs causing hyperprolactinemia mimics (antipsychotics, antiemetics, opioids, estrogens, verapamil).", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("SERUM PROLACTIN — fasting; concentrations: >200 ng/mL strongly suggests prolactinoma; >500 ng/mL almost diagnostic; >1000 ng/mL macroprolactinoma; mild elevations (25-100) common in many conditions per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RULE OUT mimics — pregnancy (HCG), drugs (antipsychotics — risperidone, haloperidol; antiemetics — metoclopramide; opioids; estrogens; verapamil), primary hypothyroidism (TSH), CKD, cirrhosis, stalk effect (any pituitary mass disrupting dopamine flow).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MACROPROLACTIN screening — non-bioactive aggregate; false elevations; PEG precipitation excludes.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HOOK EFFECT — extremely high PRL can falsely appear normal in immunoassay; dilute sample if very large macroadenoma + apparently normal PRL.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MRI pituitary with gadolinium — identifies microadenoma (<10 mm) or macroadenoma (≥10 mm); incidentalomas common.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VISUAL FIELDS for macroadenoma.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOPITUITARISM workup if macroadenoma — TSH/free T4, ACTH/cortisol, FSH/LH/testosterone or estradiol, GH/IGF-1.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("ENDOCRINOLOGY referral — first-line evaluation + management.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RULE OUT mimics — comprehensive history (medications, pregnancy, breastfeeding, comorbidities).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VISUAL FIELDS + ophthalmology for macroadenomas with HA / vision changes.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PREGNANCY planning — fertility restored on dopamine agonist; counsel + monitor.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("OSTEOPOROSIS prevention — calcium + vitamin D + DEXA + treatment if low bone density.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("CABERGOLINE — first-line; 0.25 mg PO twice weekly → titrate based on prolactin to max 1 mg twice weekly; normalizes PRL + shrinks tumor in ~80% per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BROMOCRIPTINE — alternative; less expensive but more GI side effects + TID dosing; cabergoline preferred.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PROLACTIN monitoring — q4 weeks until normalized → q3-6 months; MRI q6-12 months tumor surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SURGERY (transsphenoidal) — refractory / dopamine agonist intolerance / acute apoplexy / visual emergency / pregnancy contraindication; cure rate 75% microadenoma, 30-50% macroadenoma.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RADIATION — rare; reserved for aggressive / refractory; hypopituitarism risk.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("OSTEOPOROSIS prevention — calcium 1000-1200 mg + vitamin D 800-1000 IU; DEXA; treatment if osteoporosis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOGONADISM bridging — if dopamine agonist not normalizing rapidly, sex hormone replacement; restore bone health.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PREGNANCY — RESTORED FERTILITY on dopamine agonist; usually discontinue at conception for microadenomas; CONTINUE for macroadenomas with visual field monitoring trimesterly; tumor expansion risk.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BREASTFEEDING — generally safe to breastfeed despite microadenoma; macroadenoma tumor expansion monitoring.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("WITHDRAWAL trial — consider after 2+ years of normal PRL + tumor shrinkage; ~30-50% remain in remission.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("APOPLEXY — sudden hemorrhage / infarction of tumor; severe HA + visual loss + meningismus + hypopituitarism; EMERGENCY — surgery + stress steroids.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PREGNANCY — macroadenoma tumor expansion in ~20%; visual field monitoring trimesterly; some restart dopamine agonist.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DOPAMINE AGONIST side effects — orthostatic hypotension (first-dose), nausea, mood changes, IMPULSE CONTROL DISORDERS (gambling, hypersexuality, binge eating, compulsive shopping); cardiac valvulopathy at high doses (Parkinson's).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RESISTANCE — ~10-25% resistant to dopamine agonists; surgery + radiation + alternative DA.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("OSTEOPOROSIS — long-term hypogonadism; calcium + vitamin D + DEXA + treatment.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 — coexisting parathyroid + pancreatic NET; screen if family history.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEDICATION-INDUCED hyperprolactinemia mimics — antipsychotics, antiemetics; review medications.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NephrogenicDISample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "nephrogenic-diabetes-insipidus",
        title: "Nephrogenic diabetes insipidus (NDI)",
        subtitle: "Renal resistance to ADH · polyuria + polydipsia · lithium most common acquired · congenital AVPR2 or AQP2 · thiazide paradoxical + NSAIDs",
        nclexTags: adrenalTagR29,
        definition: AttributedProse(
            "Diabetes insipidus from renal tubular resistance to vasopressin (ADH) — DISTINCT from central DI (ADH deficiency). Polyuria (3-15+ L/day), polydipsia, hypernatremia (if access to water restricted). Causes — drug-induced (LITHIUM most common, demeclocycline, amphotericin B), congenital (X-linked AVPR2 gene; autosomal AQP2 gene), electrolyte (severe hypokalemia, hypercalcemia), chronic renal disease, post-obstructive. Treatment — address cause + thiazide diuretic (paradoxical effect) + amiloride + low-sodium diet + NSAIDs per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "ADH normally binds V2 receptor on principal cells of collecting duct → activates adenylate cyclase → cAMP → aquaporin-2 (AQP2) insertion into apical membrane → water reabsorption. NDI — V2 receptor mutation OR AQP2 mutation OR drug-induced V2 receptor / AQP2 dysfunction (lithium impairs AQP2 trafficking + downregulation). Reduced concentrating ability → dilute urine despite ADH.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("POLYURIA — large volumes >3 L/day; can be 10-15+ L/day; dilute (low specific gravity, low osmolality).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("POLYDIPSIA — compensatory; if access to water limited → severe hypernatremia + dehydration.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("NOCTURIA — frequent night-time voiding; sleep disruption.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("DEHYDRATION + HYPERNATREMIA — if water deprivation or unconscious; severe → confusion, seizures, coma.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("LITHIUM history — chronic > 1 year; ~40% develop NDI; partial improvement on cessation; sometimes irreversible.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("INFANTS (congenital) — feeding difficulties, failure to thrive, irritability, fever, vomiting, dehydration; hypotonic seizures.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — lithium >1 year + adequate trough levels, X-linked male (90% congenital), autosomal recessive (rare), hypokalemia + hypercalcemia, severe CKD, demeclocycline, amphotericin B, foscarnet, ifosfamide, ofloxacin.", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("WATER DEPRIVATION TEST — fluid restriction until weight loss 3-5%; urine + plasma osmolality measured; in NDI urine fails to concentrate (osmolality <300 mOsm/kg) despite plasma osmolality >295 mOsm/kg per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DESMOPRESSIN (DDAVP) CHALLENGE — 4 mcg SC or IV after water deprivation; in NDI urine osmolality fails to increase (<50% rise); in CDI urine osmolality increases >50% (responds to exogenous ADH).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ELECTROLYTES — sodium (hypernatremia), serum osmolality (high), urine osmolality (low <300 mOsm/kg), urine specific gravity (<1.005), urine sodium (variable).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CAUSES screening — lithium level + history, calcium, potassium, BUN/Cr, urine drug screen, renal ultrasound + family history.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("GENETIC TESTING — congenital cases (AVPR2 X-linked, AQP2 autosomal); family screening.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("AQUAPORIN-2 (urinary AQP2) — research test; reduced in NDI; not routinely available.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("FLUID + SODIUM status — severe hypernatremia + dehydration risk.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("INFANT NDI — emergency; risk dehydration + electrolyte emergencies + neurodevelopmental sequelae.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LITHIUM patient — review duration + level + risk-benefit vs continuation; nephrology + psychiatry coordination.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Causes correction — hypokalemia, hypercalcemia, obstructive uropathy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Adequate water access — particularly elderly, pediatric, neurologic.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("ADDRESS UNDERLYING cause — discontinue offending drug (lithium if possible), correct hypokalemia / hypercalcemia, treat obstructive uropathy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LOW-SODIUM diet (1-2 g/day) — reduces filtered load + urine volume.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THIAZIDE DIURETIC (HCTZ 25-50 mg) — paradoxical anti-diuretic effect; reduces urine volume 30-50%; combine with low Na diet + amiloride per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("AMILORIDE — lithium-induced NDI; blocks lithium entry into principal cells via ENaC; potassium-sparing; combine with thiazide.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("NSAIDs (indomethacin 25-50 mg TID) — inhibit prostaglandins which antagonize ADH; reduces urine volume; balance with renal + GI side effects.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DESMOPRESSIN (DDAVP) — typically INEFFECTIVE in NDI; partial NDI may respond.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ADEQUATE FLUID INTAKE — to match urinary losses; especially infants + critically ill + altered mental status.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MULTIDISCIPLINARY — endocrinology + nephrology + psychiatry (lithium) + pediatrics; family education.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LITHIUM ALTERNATIVES — consider valproate, carbamazepine, lamotrigine for bipolar; coordinate psychiatry.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("HYPERNATREMIA + DEHYDRATION — severe; especially limited water access; emergent fluid + electrolyte correction.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LITHIUM partial irreversibility — some recovery on discontinuation; some persistent NDI.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOKALEMIA from thiazide — potassium supplements + ACE-I/ARB if K low.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("NSAIDs adverse effects — renal, GI; balance with NDI benefit.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("INFANTS — neurodevelopmental sequelae from chronic hypernatremia / dehydration; aggressive management.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FAILURE TO THRIVE in pediatric — nutritional + caloric support.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Workplace + lifestyle — water access requirement; counseling + accommodations.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Genetic counseling for congenital — X-linked vs autosomal.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MEN1Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "men-1",
        title: "Multiple endocrine neoplasia type 1 (MEN-1)",
        subtitle: "3 P's — parathyroid + pituitary + pancreatic NET · MEN1 gene · genetic screening · primary HPT 90% · gastrinoma + insulinoma · cabergoline + surgery",
        nclexTags: endocrineTagR29,
        definition: AttributedProse(
            "Autosomal dominant tumor syndrome from MEN1 gene mutation (menin tumor suppressor) — classic \"3 P's\" — Primary hyperparathyroidism (~90%), Pituitary adenoma (~30-40%, especially prolactinoma), Pancreatic / duodenal NET (~70%, especially gastrinoma + insulinoma). Also adrenal, thymic, bronchial NETs. Genetic + biochemical surveillance + earlier intervention than sporadic cases per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Loss-of-function mutation in MEN1 gene (chromosome 11q13) → loss of menin tumor suppressor → loss of growth inhibition → multifocal endocrine tumors. Autosomal dominant inheritance with high penetrance (>90% by age 50); de novo mutations ~10%. Tumors often multifocal + multiglandular.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("PRIMARY HYPERPARATHYROIDISM (~90% by age 50) — earliest manifestation; younger age than sporadic; multigland involvement; hypercalcemia (fatigue, polyuria, kidney stones, osteoporosis, depression).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PANCREATIC / DUODENAL NET (~70%) — gastrinoma (Zollinger-Ellison — refractory peptic ulcer, diarrhea, GERD), insulinoma (hypoglycemia, Whipple triad), non-functioning, glucagonoma, VIPoma; multiple often.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PITUITARY ADENOMA (~30-40%) — prolactinoma most common (galactorrhea, amenorrhea, infertility); GH (acromegaly); ACTH (Cushing); TSH (hyperthyroid); non-functioning.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("ADRENAL — cortical adenomas (functional or non-functional); aldosterone OR cortisol OR androgen secretion possible.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("BRONCHIAL + THYMIC NETs — uncommon but increased risk; thymic NETs aggressive in MEN-1.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CUTANEOUS — angiofibromas (similar to tuberous sclerosis), collagenomas, lipomas, café-au-lait spots.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("FAMILY HISTORY — endocrine tumors, kidney stones, peptic ulcers, hypoglycemia in multiple relatives.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — MEN1 mutation; affected first-degree relative.", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — ≥2 of 3 P's (parathyroid, pituitary, pancreatic NET) — diagnosis MEN-1 per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("GENETIC — MEN1 mutation testing; sequencing + deletion / duplication analysis; >90% mutations identifiable.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FAMILIAL — 1 component tumor + family history of MEN-1.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BIOCHEMICAL surveillance — calcium + PTH (parathyroid), prolactin + IGF-1 + ACTH (pituitary), gastrin + insulin/C-peptide + chromogranin A (pancreatic NET).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("IMAGING — pituitary MRI (q3-5 years), pancreas + abdominal CT/MRI/EUS (q1-3 years), chest CT for thymic / bronchial NET.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SCREENING begins age 5-10 for at-risk relatives; continues lifelong.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Pancreatic NET — fasting gastrin, secretin stimulation (gastrinoma), 72-hour fast (insulinoma), chromogranin A, glucagon, VIP, PP.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("GENETIC TESTING + COUNSELING — confirm diagnosis + identify at-risk relatives; cascade testing.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MULTIDISCIPLINARY MEN clinic — endocrinology + surgery + GI + radiology + oncology; coordinated surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PHEOCHROMOCYTOMA — NOT a MEN-1 feature (it's MEN-2); rare adrenal in MEN-1.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FAMILIAL screening + counseling — first-degree relatives age 5-10.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Cancer surveillance — comprehensive lifelong.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("PRIMARY HYPERPARATHYROIDISM — SUBTOTAL parathyroidectomy (3.5 glands) preferred OR total parathyroidectomy + auto-transplantation; multigland disease; recurrence common ~50% by 10 years; cervical thymectomy at same surgery.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PANCREATIC GASTRINOMA — high-dose PPI + somatostatin analog; surgical resection challenging (often multifocal duodenal); annual imaging; non-functional NETs surgery if >2 cm.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("INSULINOMA — surgical resection (often enucleation); medical (diazoxide, octreotide) bridge.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PROLACTINOMA — cabergoline first-line; surgery refractory; same as sporadic.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("OTHER pituitary tumors — surgery + medical per type.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ADRENAL — selective adrenalectomy if functional / large.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THYMIC NETs — aggressive; surgery + radiation + chemotherapy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BIOCHEMICAL surveillance — annual calcium, PTH, prolactin, IGF-1, ACTH, gastrin, chromogranin, glucose, insulin.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("IMAGING surveillance — pituitary MRI q3-5 years, abdominal CT/MRI/EUS q1-3 years, chest CT q3-5 years.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Cascade family screening — first-degree relatives.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("RECURRENT HYPERPARATHYROIDISM — common ~50% by 10 years; reoperation challenging.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MALIGNANT pancreatic NET — gastrinoma metastasis to liver; aggressive treatment.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THYMIC CARCINOID — aggressive in MEN-1; surveillance + early intervention.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CARDIOVASCULAR + MORTALITY — increased in MEN-1; aggressive surveillance reduces.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PSYCHOSOCIAL — lifelong surveillance burden + uncertainty + family implications.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("INSURANCE / GENETIC privacy — counsel.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CHILDREN of affected — 50% inheritance; screening + counseling.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DIFFERENTIATE from MEN-2 — different gene (RET) + features (medullary thyroid cancer + pheo + hyperparathyroidism MEN-2A; medullary thyroid + pheo + mucosal neuromas MEN-2B).", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MEN2Sample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "men-2",
        title: "Multiple endocrine neoplasia type 2 (MEN-2A + 2B)",
        subtitle: "RET proto-oncogene · medullary thyroid cancer (MTC) + pheochromocytoma · MEN-2A also primary HPT · MEN-2B mucosal neuromas + marfanoid · prophylactic thyroidectomy",
        nclexTags: endocrineTagR29,
        definition: AttributedProse(
            "Autosomal dominant tumor syndromes from RET proto-oncogene mutation. MEN-2A — medullary thyroid carcinoma (MTC ~100%), pheochromocytoma (~50%), primary hyperparathyroidism (~30%); FMTC (familial MTC variant). MEN-2B — MTC (often aggressive infantile), pheochromocytoma (~50%), mucosal neuromas + marfanoid habitus + intestinal ganglioneuromatosis; NO hyperparathyroidism. RET mutation genotype-phenotype correlation guides PROPHYLACTIC THYROIDECTOMY timing per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Gain-of-function activating mutations in RET proto-oncogene (chromosome 10q11.2) → constitutive activation of RET tyrosine kinase → C-cell hyperplasia → medullary thyroid carcinoma + chromaffin cell proliferation → pheochromocytoma; parathyroid hyperplasia (MEN-2A only). Genotype-phenotype correlation — codon-specific risk + age of onset.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("MEDULLARY THYROID CARCINOMA (MTC) — ~100% lifetime risk; calcitonin marker; aggressive variants in MEN-2B (early childhood); MEN-2A typically adolescent-adult onset.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PHEOCHROMOCYTOMA — ~50%; bilateral common; usually presents 30-40s; classic symptoms (headache, sweating, palpitations, hypertension) — but may be asymptomatic on screening; adrenal hyperplasia precursor.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PRIMARY HYPERPARATHYROIDISM (MEN-2A only ~30%) — multigland; hypercalcemia.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CUTANEOUS LICHEN AMYLOIDOSIS — MEN-2A specific marker; pruritic upper back patches.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("HIRSCHSPRUNG DISEASE — congenital aganglionosis; ~7% of MEN-2A.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MEN-2B specific — MUCOSAL NEUROMAS (lips + tongue + buccal mucosa + GI) — pathognomonic; INTESTINAL GANGLIONEUROMATOSIS (megacolon, constipation); MARFANOID habitus (tall, long extremities, joint laxity); medullated corneal nerves.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("FAMILY HISTORY — MTC, pheochromocytoma, sudden infantile death, hypertensive crisis, kidney stones.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — RET mutation; de novo ~10% of MEN-2B (more often de novo than MEN-2A).", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("GENETIC — RET mutation testing; specific codon mutations + correlation with risk; genotype-phenotype guides intervention timing.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MTC — calcitonin (basal + pentagastrin / calcium-stimulated), CEA, thyroid US, FNA biopsy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PHEOCHROMOCYTOMA — plasma metanephrines + 24h urine metanephrines / catecholamines; adrenal CT / MRI; MIBG / DOTATATE PET-CT.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERPARATHYROIDISM — calcium + PTH + 24h urine calcium + DEXA + ultrasound + sestamibi scan (MEN-2A only).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CHILDREN of affected — genetic testing within FIRST YEAR OF LIFE; biochemical screening from infancy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Differentiation MEN-2A vs 2B vs FMTC — clinical features + RET mutation codon + family history.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("GENETIC TESTING — emergency in infants of affected; family cascade.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PROPHYLACTIC THYROIDECTOMY — TIMING based on RET codon risk per ATA stratification — highest risk (codon 918) → infancy; high risk (codons 634, 883) → before age 5; moderate risk → individualized per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PHEOCHROMOCYTOMA workup BEFORE any thyroid surgery — exclude with biochemistry; alpha-blockade if positive; otherwise risk hypertensive crisis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-2B HIGH SUSPICION in pediatric — mucosal neuromas, marfanoid habitus, GI dysmotility; act emergently.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Multidisciplinary MEN clinic.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("PROPHYLACTIC THYROIDECTOMY — based on RET codon risk + ATA stratification; MEN-2B + codon 918 → infancy; codon 634 → before age 5; moderate-risk codons → before adolescence per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MTC TREATMENT — TOTAL THYROIDECTOMY + central neck dissection; lateral neck dissection if positive; calcitonin levels post-op (target undetectable); RAI not effective (C cells don't take up iodine).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("METASTATIC MTC — vandetanib (Caprelsa), cabozantinib (Cometriq), selpercatinib, pralsetinib (RET-specific TKIs); palliative chemo limited.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PHEOCHROMOCYTOMA — LAPAROSCOPIC ADRENALECTOMY (often partial / cortical-sparing for bilateral); ALPHA-BLOCKADE (phenoxybenzamine or doxazosin) 10-14 days preoperative + rehydration + beta-blockade AFTER; ICU postop.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERPARATHYROIDISM (MEN-2A) — selective gland resection; less recurrence than MEN-1.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CONGENITAL MEGACOLON (MEN-2B) — colectomy if symptomatic.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LIFETIME SURVEILLANCE — calcitonin, plasma metanephrines + calcium annually; thyroid US, abdominal MRI / CT periodic.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HORMONE REPLACEMENT — levothyroxine post-thyroidectomy; calcium + vitamin D for parathyroidectomy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + endocrine surgery + medical oncology + genetics + cardiology (pheo cardiomyopathy).", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("HYPERTENSIVE CRISIS from undiagnosed pheochromocytoma — emergent + life-threatening during surgery / labor / stress; alpha-blockade first.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BILATERAL pheochromocytomas — common in MEN-2; cortical-sparing surgery preferred; adrenal insufficiency risk if bilateral total.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MTC mortality — directly related to early thyroidectomy; metastasis irreversible.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-2B SEVERITY — aggressive MTC + intestinal complications + early mortality if not aggressively managed.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Psychosocial — prophylactic surgery in children; lifelong surveillance; family planning.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PHEO RECURRENCE — bilateral disease; ongoing biochemical surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERPARATHYROIDISM in MEN-2A — usually milder + late onset.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("INHERITANCE 50% — cascade testing.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HypoparathyroidismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypoparathyroidism",
        title: "Hypoparathyroidism",
        subtitle: "Low PTH · hypocalcemia + hyperphosphatemia · post-thyroidectomy MOST common · tetany + seizures · calcium + calcitriol · PTH analog teriparatide",
        nclexTags: adrenalTagR29,
        definition: AttributedProse(
            "Reduced or absent parathyroid hormone (PTH) secretion → hypocalcemia + hyperphosphatemia. Most common cause — POST-THYROIDECTOMY / NECK SURGERY (transient or permanent). Other — autoimmune (autoimmune polyglandular syndrome), DiGeorge syndrome, hereditary, infiltrative, radiation. Treatment — calcium + activated vitamin D (calcitriol); recombinant PTH (Natpara / teriparatide off-label) for refractory per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Parathyroid gland injury / removal / autoimmune destruction → reduced PTH → reduced renal tubular calcium reabsorption + increased phosphate retention + reduced 1,25-OH vitamin D synthesis (renal 1-α-hydroxylase) → hypocalcemia + hyperphosphatemia + reduced intestinal calcium absorption.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("HYPOCALCEMIA symptoms — perioral + extremity paresthesias, carpopedal spasm, tetany, laryngospasm, bronchospasm, seizures.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CHVOSTEK SIGN — tapping facial nerve causes facial twitching; classic.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("TROUSSEAU SIGN — BP cuff inflation above SBP × 3 minutes causes carpopedal spasm; classic.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PROLONGED QT — ECG; risk of torsades.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Neuropsychiatric — irritability, depression, fatigue, cognitive impairment.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Severe — laryngospasm, bronchospasm, seizures, respiratory failure, cardiac arrest.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CHRONIC — cataracts, basal ganglia calcifications, brittle nails, dry skin, dental defects (children).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — thyroid / parathyroid surgery (most common), neck radiation, autoimmune polyglandular syndrome (APS-1 includes hypopara + adrenal insufficiency + mucocutaneous candidiasis), DiGeorge (22q11 deletion), hereditary, magnesium deficiency (functional).", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("LABS — low calcium (corrected for albumin OR ionized), low PTH (suppressed, <20 pg/mL), high phosphate, low 1,25-OH vitamin D, normal 25-OH vitamin D, low urine calcium per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MAGNESIUM — must be normal; severe hypomagnesemia causes functional hypoparathyroidism; correct first.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ECG — prolonged QT; arrhythmias.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ETIOLOGY workup — surgical history, autoimmune screen (anti-PTH antibodies, APS-1 panel — calcium-sensing receptor + 21-hydroxylase antibodies), genetic (DiGeorge — 22q11 deletion screen).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DEXA — risk of low bone density due to hypocalcemia.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Brain CT/MRI — basal ganglia calcifications in chronic.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("ACUTE hypocalcemia — emergency; IV CALCIUM GLUCONATE; airway protection; cardiac monitoring.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Magnesium correction first — if low Mg, calcium correction won't work.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Identify CAUSE — surgical, autoimmune, hereditary; correct underlying if possible.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ENDOCRINOLOGY referral for chronic management.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Lifelong follow-up + monitoring.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE SEVERE hypocalcemia (tetany, seizures, QT) — CALCIUM GLUCONATE 1-2 g IV over 10 minutes (slow); continuous infusion 0.5-1.5 mg/kg/hr; monitor; central line preferred (extravasation risk); per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CHRONIC — ORAL CALCIUM (1-3 g elemental calcium daily divided) + ACTIVATED VITAMIN D (calcitriol 0.25-1 mcg daily) per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYDROCHLOROTHIAZIDE — reduces urinary calcium loss; combine with low-sodium diet; helpful in hypercalciuric patients.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MAGNESIUM repletion if low — IV magnesium sulfate; long-term oral.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PHOSPHATE control — dietary restriction (dairy moderation); phosphate binders rarely needed.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RECOMBINANT PTH (rhPTH 1-84 — Natpara) — refractory hypoparathyroidism; daily SC; not widely available; manufacturer issues.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("TERIPARATIDE (PTH 1-34) — off-label for hypoparathyroidism; daily SC.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Monitor — calcium (corrected or ionized) q1-3 months, phosphate, magnesium, BUN/Cr, 24h urine calcium (avoid hypercalciuria + kidney stones), DEXA.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Counsel — medication adherence, signs/symptoms of hypo and hypercalcemia, regular labs.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DENTAL — calcium for tooth development in children; routine dental.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("ACUTE TETANY → respiratory failure / cardiac arrest — emergent IV calcium; monitor cardiac.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERCALCEMIA from overtreatment — fatigue, polyuria, polydipsia, kidney stones; titrate.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERCALCIURIA + nephrolithiasis + nephrocalcinosis — common in chronic management; thiazide + monitor.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BASAL GANGLIA calcifications + extrapyramidal symptoms — chronic hypocalcemia.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CATARACTS — subcapsular; ophthalmologic exam.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BONE DISEASE — adynamic bone in oversuppressed PTH state; DEXA.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("AUTOIMMUNE POLYGLANDULAR (APS-1) — adrenal insufficiency + mucocutaneous candidiasis + hypopara; screen periodically.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PREGNANCY — calcium requirements increase; close monitoring; adjust calcitriol.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SecondaryHPTSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "secondary-hyperparathyroidism",
        title: "Secondary hyperparathyroidism (CKD-MBD)",
        subtitle: "Compensatory PTH rise in CKD · phosphate retention + low calcitriol · vascular calcification + calciphylaxis · phosphate binders + active D + calcimimetics",
        nclexTags: adrenalTagR29,
        definition: AttributedProse(
            "Compensatory PTH elevation from chronic kidney disease (CKD) — driven by phosphate retention + reduced calcitriol + hypocalcemia. Part of CKD-MBD (mineral and bone disorder) spectrum. Long-term consequences — vascular calcification, calciphylaxis, fractures, cardiovascular mortality. Treatment — phosphate restriction + binders + active vitamin D + calcimimetics + parathyroidectomy for severe per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "CKD → reduced phosphate excretion (phosphate retention) → suppresses calcitriol production + binds calcium → hypocalcemia + low calcitriol → parathyroid hyperplasia + PTH oversecretion → bone resorption (high turnover bone disease) + vascular calcification + cardiac + tertiary autonomous secretion in severe CKD.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC early; abnormal labs in CKD surveillance.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("BONE PAIN, fractures (high-turnover bone disease + adynamic bone), osteoporosis, muscle weakness.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PRURITUS — common in dialysis; multifactorial including PTH.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CALCIPHYLAXIS — devastating; ischemic skin necrosis from vascular calcification; legs, abdomen, breast; high mortality.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CARDIOVASCULAR — vascular calcification + cardiac valve calcification + LVH + arrhythmias.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("METASTATIC CALCIFICATIONS — soft tissue, joints (pseudogout-like), kidney parenchyma.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — chronic kidney disease (especially stages 4-5 + dialysis), age, diabetes, vitamin D deficiency, calcium-rich diet (especially if poor binder use).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("TERTIARY HYPERPARATHYROIDISM — autonomous PTH secretion in CKD; persists post-transplant; hypercalcemia + hyperphosphatemia.", citationIDs: ["openrn_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("LABS — elevated iPTH (target stage-dependent per KDIGO — stage 3 normal-2× ULN, stage 4 2-9× ULN, stage 5 / dialysis 2-9× ULN), hypocalcemia OR normocalcemia, hyperphosphatemia, low 1,25-OH vitamin D per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("STAGE-SPECIFIC iPTH TARGETS — KDIGO guidelines; aim for 2-9× ULN in stage 5 / dialysis to avoid both over and under-suppression.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CALCIUM-PHOSPHATE PRODUCT — target <55 mg²/dL²; high product → vascular calcification + calciphylaxis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ALKALINE PHOSPHATASE — bone turnover marker.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("25-OH VITAMIN D — target ≥30 ng/mL; deficiency common.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DEXA — bone density; less reliable in CKD.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VASCULAR CALCIFICATION assessment — lateral abdominal X-ray (aortic calcification), echocardiography.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BONE BIOPSY — gold standard for bone turnover; rarely done; reserved for refractory.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("NEPHROLOGY referral + multidisciplinary CKD care.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CKD-MBD comprehensive workup — calcium + phosphate + PTH + 25-OH-D + alk phos.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VASCULAR CALCIFICATION risk — calcium-phosphate product, vascular imaging.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Dietary phosphate restriction + binder adherence assessment.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Lifelong management — labs every 1-3 months.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("DIETARY PHOSPHATE RESTRICTION — 800-1000 mg/day; avoid high-phosphate foods (dairy, cola, processed); dietitian.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PHOSPHATE BINDERS WITH MEALS — choices: SEVELAMER (non-calcium, preferred for vascular calcification), LANTHANUM CARBONATE (Fosrenol — non-calcium), FERRIC CITRATE (iron-based + repletes iron), CALCIUM ACETATE/CARBONATE (calcium-based — risk of hypercalcemia + vascular calcification, limit), SUCROFERRIC OXYHYDROXIDE (Velphoro) per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ACTIVE VITAMIN D ANALOGS — CALCITRIOL (Rocaltrol) OR PARICALCITOL (Zemplar — selective VDRA, less hypercalcemia) OR DOXERCALCIFEROL; suppress PTH; balance with calcium-phosphate.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CALCIMIMETICS — CINACALCET (Sensipar) PO OR ETELCALCETIDE (Parsabiv) IV during hemodialysis; allosteric calcium-sensing receptor agonist; suppresses PTH without raising calcium-phosphate.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PARATHYROIDECTOMY — refractory severe SHPT (>9× ULN PTH + complications); subtotal (3.5 glands) or total + autotransplant.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CALCIPHYLAXIS treatment — multidisciplinary; SODIUM THIOSULFATE IV during hemodialysis; vitamin K, low-calcium dialysate, cinacalcet, wound care, pain management; high mortality.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VITAMIN D REPLETION — 25-OH vitamin D ≥30 ng/mL with cholecalciferol or ergocalciferol if deficient.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MULTIDISCIPLINARY — nephrology + endocrinology + dietitian + endocrine surgery; KDIGO guidelines.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Transplant — for ESRD; tertiary HPT often resolves but may require parathyroidectomy post-transplant.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("CALCIPHYLAXIS — devastating skin necrosis; high mortality; multifactorial vascular calcification.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VASCULAR CALCIFICATION — coronary, valvular, peripheral; cardiovascular mortality in CKD.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERCALCEMIA from over-suppression OR calcium-based binders + active D — adynamic bone, vascular calcification.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPERPHOSPHATEMIA — vascular calcification + cardiovascular mortality; adherence + diet critical.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FRACTURES — high-turnover bone disease OR adynamic bone; complex bone metabolism in CKD.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEDICATION ADHERENCE — phosphate binders WITH MEALS critical; counseling.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DIET — high-phosphate food avoidance; cooking modifications.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("TERTIARY HYPERPARATHYROIDISM — autonomous; persists post-transplant; may need surgery.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SubacuteThyroiditisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "subacute-thyroiditis",
        title: "Subacute thyroiditis (de Quervain / granulomatous)",
        subtitle: "Painful thyroid · post-viral · triphasic hyperthyroid → euthyroid → hypothyroid → recovery · ESR elevated · NSAIDs / steroids · NO antithyroid drugs",
        nclexTags: endocrineTagR29,
        definition: AttributedProse(
            "Painful inflammatory thyroiditis often post-viral (mumps, coxsackie, adenovirus, COVID-19) — granulomatous histology. Classic triphasic course — hyperthyroid (release of pre-formed hormone, 4-8 weeks) → euthyroid → hypothyroid (depleted hormone, weeks-months) → recovery (~95%); rarely permanent hypothyroidism. NOT autoimmune. Treatment — NSAIDs first, prednisone for severe; NO antithyroid drugs (don't help — thyroid stunned not overactive) per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Post-viral inflammatory destruction of thyroid follicles → release of pre-formed T4 + T3 (hyperthyroid phase) + thyroglobulin → eventual depletion → hypothyroid phase as thyroid recovers and rebuilds stores. Granulomatous inflammation with giant cells on histology. HLA-B35 association.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("ANTERIOR NECK PAIN — pivotal; severe; radiates to jaw, ear, occiput; worse with swallowing, neck movement, palpation.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("TENDER + ENLARGED thyroid on palpation; firm; unilateral or bilateral.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("CONSTITUTIONAL — fever, malaise, fatigue, myalgia, low-grade temperature.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("HYPERTHYROID phase (weeks 1-6) — palpitations, anxiety, heat intolerance, tremor, weight loss, diarrhea — typically MILDER than Graves.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("HYPOTHYROID phase (weeks 6-16) — fatigue, cold intolerance, weight gain, constipation, depression; mild + transient.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("RECOVERY (~95%) — euthyroid within 6-12 months; small percentage permanent hypothyroidism.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Recent VIRAL illness (URI, mumps, coxsackie, COVID-19) preceding by weeks.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — female 3-5× male, age 30-50, HLA-B35, recent viral illness.", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL — painful thyroid + recent viral illness + characteristic course; emergency labs.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THYROID FUNCTION TESTS — phase-dependent: hyperthyroid phase (low TSH + elevated free T4/T3), euthyroid, hypothyroid (high TSH + low free T4).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ESR + CRP — markedly elevated (often ESR >50 mm/hr) — distinguishes from other thyroiditis per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THYROID UPTAKE — LOW radioactive iodine uptake (<5%) — distinguishes from Graves disease (high uptake); pivotal differentiator.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THYROID ULTRASOUND — heterogeneous + hypoechoic + reduced vascularity; rules out abscess + nodule.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ANTI-THYROID antibodies (TPO, Tg) — typically NEGATIVE (not autoimmune); rules out Hashimoto.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THYROGLOBULIN — typically elevated.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Differentials — Hashimoto thyroiditis (autoimmune, antibody+, painless), Graves (high uptake), suppurative thyroiditis (bacterial, abscess, very ill), thyroid cancer (nodule).", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("DIFFERENTIATE from Graves (DON'T give antithyroid drugs in subacute) — RAIU low in subacute vs high in Graves; pivotal for treatment.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Rule out abscess + cancer — ultrasound + needle aspiration if doubt.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Phase identification — guides symptomatic management.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Symptom control — pain + thyroid symptoms.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Counsel triphasic course expectation.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("NSAIDs first-line — IBUPROFEN 600-800 mg q8 hours OR NAPROXEN 500 mg BID; for pain + inflammation; first-line per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PREDNISONE — 40 mg PO daily × 1-2 weeks → taper over 4-8 weeks; for severe pain not responding to NSAIDs; rapid relief.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BETA-BLOCKERS for hyperthyroid symptoms — propranolol 10-40 mg q6-8 hours OR atenolol 25-100 mg daily; treats palpitations + tremor + anxiety.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("NO ANTITHYROID DRUGS (PTU, methimazole) — thyroid is leaking stored hormone, not overproducing; antithyroid drugs DON'T work + may cause hypothyroidism.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("NO RADIOACTIVE IODINE — uptake is low.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LEVOTHYROXINE during transient hypothyroid phase — usually NOT needed (mild + transient); consider if symptomatic OR persistent.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Symptomatic — analgesics, fluids, rest; viral illness supportive care.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Follow-up — TFTs q2-4 weeks during course; ~95% recover within 6-12 months; ~5% permanent hypothyroidism.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Recurrence — rare (~2%); usually self-limited.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("MISDIAGNOSIS as Graves disease + inappropriate antithyroid drugs / I-131 → worsen hypothyroid phase; LOW RAIU pivotal for subacute.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PERMANENT HYPOTHYROIDISM (~5%) — long-term levothyroxine.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ABSCESS / SUPPURATIVE thyroiditis — bacterial; very ill + fluctuant + leukocytosis; needle aspiration + IV antibiotics + surgical drainage.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("THYROID NODULE / CANCER — if nodule on US, FNA biopsy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PROLONGED steroid taper — adrenal suppression precautions.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CARDIAC monitoring — if hyperthyroid phase severe + elderly / CAD.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("POST-COVID — subacute thyroiditis surge reported; awareness.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum InsulinomaSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "insulinoma",
        title: "Insulinoma",
        subtitle: "Insulin-secreting pancreatic NET · Whipple triad · 72-hour fast diagnostic · localization difficult · surgical enucleation curative · MEN-1",
        nclexTags: endocrineTagR29,
        definition: AttributedProse(
            "Insulin-secreting pancreatic neuroendocrine tumor — most common functional pancreatic NET. Whipple triad — symptoms of hypoglycemia + low glucose (<55 mg/dL) + relief with glucose. Most benign + solitary; MEN-1 association in 5-10%. 72-hour fast is gold-standard diagnostic test; surgical resection curative per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Pancreatic islet beta-cell tumor → autonomous insulin secretion independent of glucose level → fasting + postprandial HYPOGLYCEMIA with INAPPROPRIATELY HIGH insulin + C-peptide. Tumor typically small (<2 cm) + benign + solitary; ~10% malignant + ~5-10% MEN-1.",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("HYPOGLYCEMIA SYMPTOMS — adrenergic (sweating, tremor, palpitations, anxiety, hunger) + neuroglycopenic (confusion, dizziness, blurred vision, seizures, loss of consciousness).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("FASTING HYPOGLYCEMIA — early morning, missed meals; classic triad.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("WEIGHT GAIN — chronic insulin excess; counter-intuitive for hypoglycemia.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Symptoms RELIEVED by glucose intake (Whipple triad).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MAY have psychiatric / neurologic misdiagnosis (epilepsy, dementia, anxiety disorder) before insulinoma identified.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — sporadic >90%; MEN-1 (5-10%, often multifocal); familial neuroendocrine syndromes.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 features — primary HPT, pituitary adenoma, other pancreatic NETs (gastrinoma).", citationIDs: ["openrn_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("WHIPPLE TRIAD — symptoms of hypoglycemia + measured glucose <55 mg/dL + relief with glucose; clinical foundation per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("72-HOUR FAST (gold standard diagnostic) — supervised inpatient; q4-6h glucose, insulin, C-peptide, proinsulin, beta-hydroxybutyrate; terminate when glucose <55 + symptoms; INSULIN ≥3 μIU/mL + C-PEPTIDE ≥0.6 ng/mL + PROINSULIN ≥5 pmol/L with INAPPROPRIATELY LOW BHB <2.7 mmol/L confirms endogenous insulin per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SULFONYLUREA SCREEN — exclude exogenous; urine/plasma sulfonylurea levels (chlorpropamide, glipizide, glyburide).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("INSULIN ANTIBODIES — exclude factitious insulin use; autoimmune.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LOCALIZATION — pancreatic CT/MRI (50-80% sensitivity), EUS with FNA (most sensitive ~90%), DOTATATE PET-CT, intra-arterial calcium stimulation with hepatic venous sampling (selective).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 SCREENING — calcium + PTH + prolactin + pituitary MRI + chromogranin A + family history.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Distinguish from POST-PRANDIAL hypoglycemia (post-gastric bypass), reactive hypoglycemia, drug-induced, alcohol, sepsis, adrenal insufficiency.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("HYPOGLYCEMIA SAFETY — avoid driving, machinery; identify symptoms; family / coworker awareness.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Endocrinology + endocrine surgery referral.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LOCALIZATION at experienced pancreatic center — EUS + intraoperative.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 screening — genetic + biochemical.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Pre-operative — frequent small meals + cornstarch + diazoxide bridging.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("SURGICAL RESECTION — first-line + curative for sporadic solitary; enucleation if peripheral / small; pancreatectomy (distal or Whipple) for larger / proximal; intraoperative ultrasound to localize per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DIAZOXIDE (Proglycem) — preoperative bridging + non-surgical / metastatic; 100-200 mg PO TID; inhibits insulin release; side effects — fluid retention, hirsutism, GI.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("OCTREOTIDE / LANREOTIDE — somatostatin analog; may worsen hypoglycemia by suppressing counter-regulatory hormones; cautious; select tumors.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FREQUENT SMALL MEALS + CORNSTARCH (uncooked) at bedtime — slow glucose release.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CONTINUOUS GLUCOSE MONITORING — Dexcom; alarm-driven dietary adjustment.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("METASTATIC INSULINOMA (~10%) — chemotherapy (capecitabine + temozolomide; streptozocin + 5-FU), targeted (everolimus, sunitinib), peptide receptor radionuclide therapy (PRRT — Lutetium-177 DOTATATE).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 — multifocal disease; cautious enucleation; ongoing surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("POST-OP — monitor glucose; rebound hyperglycemia common; transient diabetes possible after Whipple.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOGLYCEMIC EMERGENCY — IV dextrose D50 50 mL bolus + D10 infusion; glucagon if no IV; counsel family/co-workers + identification bracelet.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + endocrine surgery + radiology + medical oncology (metastatic) + genetics (MEN-1).", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("HYPOGLYCEMIC EMERGENCIES — severe; seizures, coma, death; emergency IV dextrose + glucagon.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MISDIAGNOSIS — psychiatric (anxiety, seizure disorder); years of misdiagnosis before insulinoma identified.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LOCALIZATION CHALLENGE — small tumors; experienced center essential.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PANCREATIC SURGERY complications — fistula, pseudocyst, diabetes, exocrine insufficiency.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("METASTATIC — uncommon (~10%); aggressive multimodal therapy; targeted + PRRT advances.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 — multifocal recurrence; ongoing surveillance lifelong.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("WEIGHT GAIN preoperative; weight loss after cure.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DRIVING + occupation — restrictions while hypoglycemia uncontrolled.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ZollingerEllisonSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "zollinger-ellison-syndrome",
        title: "Zollinger-Ellison syndrome (gastrinoma)",
        subtitle: "Gastrin-secreting NET · refractory PUD + diarrhea · pancreas / duodenum · 25% MEN-1 · high-dose PPI · surgery curative if localized",
        nclexTags: endocrineTagR29,
        definition: AttributedProse(
            "Gastrin-secreting neuroendocrine tumor (gastrinoma) — typically in duodenum (~70%) or pancreas (~25%) — causing refractory peptic ulcer disease + diarrhea + GERD from gastric acid hypersecretion. 25-30% associated with MEN-1 (multifocal duodenal tumors). High-dose PPI therapy for acid suppression; surgical resection curative if localized + non-metastatic; metastatic disease (~40% at presentation) requires multimodal therapy per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Pancreatic / duodenal gastrin-secreting NET → constant hypergastrinemia → parietal cell stimulation → gastric acid hypersecretion → multiple peptic ulcers + GERD + secretory diarrhea (acid inactivates pancreatic enzymes + denatures bile). \"Gastrinoma triangle\" — cystic duct + junction 2nd/3rd duodenum + neck of pancreas (90% of tumors).",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("REFRACTORY PEPTIC ULCERS — multiple, atypical locations (jejunum), refractory to standard therapy, recurrent after H. pylori eradication, post-bulbar duodenum.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("SEVERE GERD + esophagitis + Barrett esophagus risk.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("DIARRHEA — secretory, watery, large volume (resolves with PPI); steatorrhea.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Abdominal PAIN — burning, epigastric.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Weight loss, melena, hematemesis (bleeding ulcers).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MEN-1 features — primary HPT, pituitary adenoma, pancreatic NETs (insulinoma + non-functional), often multifocal duodenal gastrinomas.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("FAMILY HISTORY — endocrine tumors, peptic ulcers in young relatives, kidney stones.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — sporadic >70%; MEN-1 25-30%; age 30-50 typical; multiple endocrine cancer relatives.", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("FASTING SERUM GASTRIN — typically >1000 pg/mL (10× ULN) in active disease; values 200-1000 ambiguous (need secretin test) per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SECRETIN STIMULATION TEST — 2 U/kg IV bolus; gastrin rise >200 pg/mL above baseline at 2-15 minutes → positive for gastrinoma (normal individuals don't rise).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("GASTRIC ACID OUTPUT — high (basal >15 mEq/h on PPI > 100 mEq/h off PPI); pH <2; ambulatory pH monitoring.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("STOP PPI 1 WEEK BEFORE gastrin level (false elevation on PPI) — challenging if active GERD; use H2-blocker bridge.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LOCALIZATION — DOTATATE PET-CT (gold standard); EUS, CT/MRI pancreas, octreotide scan (older), selective venous sampling (rare).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CHROMOGRANIN A — elevated; non-specific NET marker.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 screening — calcium + PTH + prolactin + insulin/glucose + pituitary MRI + family history.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Differentiate from H. PYLORI ulcers + NSAID ulcers + chronic atrophic gastritis (high gastrin but low acid).", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("ACID SUPPRESSION priority — high-dose PPI rapid control of acid + symptoms.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 screening — genetic + biochemical.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LOCALIZATION at experienced pancreatic NET center.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("STAGING — liver metastases common at presentation; CT chest/abdomen/pelvis; DOTATATE PET.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + GI + endocrine surgery + medical oncology.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("HIGH-DOSE PPI — OMEPRAZOLE 40-60 mg PO BID OR LANSOPRAZOLE 60-90 mg PO BID OR PANTOPRAZOLE 80-120 mg PO BID; target gastric acid output <10 mEq/h; titrate up per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("IV PPI if NPO / severe — pantoprazole 80 mg IV BID-TID.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SURGICAL RESECTION — first-line for SPORADIC localized; gastrinoma triangle exploration + duodenotomy + intraoperative US; cure rate ~30-50% sporadic; lower with MEN-1 (multifocal).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 SURGICAL controversial — multifocal duodenal; surgery prevents metastasis but rarely curative; lifelong PPI alternative.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("METASTATIC disease (~40% at presentation) — somatostatin analogs (octreotide, lanreotide), liver-directed therapy (TACE, radioembolization, ablation), chemotherapy (capecitabine + temozolomide; streptozocin + 5-FU), targeted (everolimus, sunitinib), PRRT (Lutetium-177 DOTATATE).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PARTIAL GASTRECTOMY — historical; no longer first-line (PPI replaces).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LIFETIME PPI — even after \"curative\" resection; recurrence common.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 — comprehensive multidisciplinary; parathyroid + pituitary management.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Surveillance — gastrin q3-6 months, imaging q6-12 months, endoscopy.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("METASTASIS — liver common (~40%); aggressive multimodal therapy; targeted + PRRT advances.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ULCER COMPLICATIONS — perforation, bleeding, obstruction; emergent.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BARRETT ESOPHAGUS + esophageal cancer — chronic GERD; surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VITAMIN B12 + IRON deficiency — chronic gastric atrophy + PPI; supplement.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PPI long-term concerns — bone loss, infections (C. diff), nephritis; balance with disease severity.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MEN-1 multifocal — surgical cure rare; lifelong PPI + surveillance.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CHRONIC ATROPHIC GASTRITIS — distinct (high gastrin but low acid); differentiate.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LOST TO FOLLOW-UP — lifelong surveillance critical.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PagetDiseaseBoneSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "paget-disease-bone",
        title: "Paget disease of bone (osteitis deformans)",
        subtitle: "Disordered bone remodeling · elevated alk phos + bone pain + deformity · pelvis + skull + spine + femur · bisphosphonates 1st-line · osteosarcoma rare",
        nclexTags: boneTagR29,
        definition: AttributedProse(
            "Localized disorder of accelerated + disorganized bone remodeling — abnormal osteoclast activity + chaotic osteoblast response → enlarged, weak, deformed bones with high vascularity + fracture + arthritis risk. Polyostotic (multiple sites — pelvis, lumbar spine, skull, femur, tibia) > monostotic. Bisphosphonates (zoledronic acid IV single dose preferred) suppress bone turnover. Osteosarcoma transformation rare (<1%) but devastating per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Abnormal osteoclasts (excessive number + size + nuclei) → rapid resorption → compensatory disorganized osteoblast response → woven (vs lamellar) bone deposition → enlarged but mechanically weak bones. Etiology — possible paramyxovirus (canine distemper) trigger in genetically susceptible (SQSTM1 mutations).",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("Often ASYMPTOMATIC — incidental finding on alkaline phosphatase or X-ray; ~70% asymptomatic at diagnosis.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("BONE PAIN — most common symptom; localized to affected bones; aching; worse at night.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("BONE DEFORMITY — bowing of tibia/femur (saber shin), enlarged skull (frontal bossing — hat size increases), kyphosis, leg length discrepancy.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("ARTHRITIS — secondary OA from joint deformity; hip + knee + spine.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("FRACTURES — pathological + stress fractures (chalk-stick); femur most often.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("SKULL — headaches, hearing loss (8th nerve compression), tinnitus, vertigo, vision loss, dental issues.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("WARMTH + ERYTHEMA over affected bone — hypervascularity.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("HIGH-OUTPUT HEART FAILURE — rare; extensive Paget with hypervascularity.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("HYPERCALCEMIA — uncommon; immobilization may precipitate.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — age >50 (rare <40), European ancestry, family history (SQSTM1 mutations 5-25%), male slight predominance.", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ALKALINE PHOSPHATASE elevated — proportional to disease activity + extent; specific bone isoform; treatment response marker per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CALCIUM, PHOSPHATE — usually NORMAL (in contrast to primary HPT).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BONE TURNOVER MARKERS — N-telopeptide (NTX), C-telopeptide (CTX), procollagen type I (P1NP) — elevated.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RADIOGRAPHS — characteristic findings: cortical thickening, coarse trabecular pattern, lytic (osteoporosis circumscripta in skull) + blastic phases, bone enlargement, deformity per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RADIONUCLIDE BONE SCAN — most sensitive for identifying ALL affected sites; intense uptake; staging.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CT/MRI — complications (sarcoma, fracture, neurologic compression).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("BIOPSY — rarely needed; reserved for atypical / sarcoma suspicion.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("EXCLUDE other causes of elevated alkaline phosphatase — hepatobiliary (LFTs), metastatic bone disease, osteomalacia.", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("ENDOCRINOLOGY OR rheumatology referral.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("EXTENT of disease — bone scan to identify all affected sites.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("COMPLICATIONS — neurologic compression (skull), fractures, deformity, OA, hearing.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DENTAL evaluation — before bisphosphonates (ONJ risk).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RENAL function before zoledronic acid.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("INDICATIONS for treatment — symptomatic, weight-bearing bones (femur, tibia), skull, vertebral, lytic, near joints, hypercalcemia, pre-orthopedic surgery; ASYMPTOMATIC with elevated alk phos at high-risk sites — controversial.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ZOLEDRONIC ACID 5 mg IV ONCE — first-line; single infusion induces long remission (years); pre-treatment calcium + vitamin D; renal function check (CrCl >30); LFTs; per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ALENDRONATE 40 mg PO daily × 6 months — alternative.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("RISEDRONATE 30 mg PO daily × 2 months — alternative.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PAMIDRONATE 30 mg IV daily × 3 days — older.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CALCITONIN — second-line; nasal or SC; less effective; FDA cancer concerns.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CALCIUM 1000-1200 mg/day + VITAMIN D 800-2000 IU/day — pretreatment + during.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ANALGESICS — NSAIDs, acetaminophen for pain.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ORTHOPEDIC SURGERY — joint replacement for OA, fracture fixation, osteotomy for severe deformity, decompression for neurologic compression; pretreat with bisphosphonate to reduce bleeding.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PT + ASSISTIVE devices — gait + balance + falls prevention.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HEARING aids if cochlear involvement.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Surveillance — alk phos q3-6 months → annual; symptomatic monitoring.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("OSTEOSARCOMA transformation — rare (<1%) but devastating; new pain, swelling, increased alk phos out of proportion → imaging + biopsy + multidisciplinary oncology; poor prognosis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("NEUROLOGIC COMPRESSION — spine, skull base; emergent neurosurgery + bisphosphonate.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FRACTURES — pathological + stress; surgical fixation; bisphosphonate pre-op.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("OSTEONECROSIS OF JAW (ONJ) on bisphosphonates — rare; pre-treatment dental clearance; good oral hygiene.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ATYPICAL FEMUR FRACTURES on bisphosphonates — rare; bilateral; new thigh/groin pain warrants evaluation.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HYPOCALCEMIA after bisphosphonate — particularly if vitamin D deficient; pre-supplement.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FAMILIAL FORMS — SQSTM1 mutation; family screening; earlier onset.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("HIGH-OUTPUT HEART FAILURE — rare extensive Paget.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HypopituitarismSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "hypopituitarism",
        title: "Hypopituitarism (panhypopituitarism)",
        subtitle: "Multiple anterior pituitary hormone deficiencies · pituitary surgery / radiation / Sheehan / apoplexy · adrenal first replacement · lifelong hormone replacement",
        nclexTags: pituitaryTagR29,
        definition: AttributedProse(
            "Deficiency of one or more anterior pituitary hormones (TSH, ACTH, GH, FSH/LH, prolactin) ± posterior (ADH). Causes — pituitary tumors + surgery + radiation, traumatic brain injury, autoimmune (lymphocytic hypophysitis), infiltrative (sarcoid, hemochromatosis, Langerhans cell histiocytosis), Sheehan syndrome (postpartum pituitary necrosis), pituitary apoplexy, congenital. CRITICAL — ADRENAL replacement FIRST before thyroid (or precipitate adrenal crisis). Lifelong hormone replacement + stress dosing per primary source.",
            citationIDs: ["specialty_dx_round29", "openrn_dx_round29"]
        ),
        pathophysiology: AttributedProse(
            "Anterior pituitary destruction (mass, surgery, radiation, autoimmune, ischemic, infiltrative) → reduced trophic hormone secretion → target gland atrophy + hormone deficiency. Sequence of hormone loss often — GH → LH/FSH → TSH → ACTH → prolactin. Posterior pituitary (vasopressin, oxytocin) — separate (stalk lesions cause central DI).",
            citationIDs: ["specialty_dx_round29"]
        ),
        presentation: [
            AttributedBullet("ACTH/CORTISOL deficiency — fatigue, weakness, hypotension, hyponatremia, hypoglycemia, anorexia, weight loss; ADRENAL CRISIS in stress (illness, surgery, trauma).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("TSH deficiency (central hypothyroidism) — fatigue, cold intolerance, weight gain, constipation, dry skin, hair loss, bradycardia, depression; less severe than primary.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("LH/FSH deficiency (hypogonadism) — WOMEN: amenorrhea, infertility, decreased libido, hot flashes (estrogen def), osteoporosis; MEN: erectile dysfunction, decreased libido, infertility, decreased facial/body hair, fatigue, muscle weakness, gynecomastia.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("GH deficiency (adult) — increased visceral fat, decreased lean mass, fatigue, decreased exercise capacity, impaired quality of life, dyslipidemia, increased CV risk, decreased BMD.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("PROLACTIN deficiency — failure to lactate postpartum (Sheehan syndrome); usually asymptomatic in non-pregnant.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("ADH deficiency (central DI) — polyuria, polydipsia, hypernatremia if access restricted.", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("MASS EFFECT — HA, visual field defects, hypopituitarism (\"stalk effect\" hyperprolactinemia from disrupted dopamine flow).", citationIDs: ["openrn_dx_round29"]),
            AttributedBullet("Risk factors — pituitary adenoma + surgery / radiation, TBI, postpartum hemorrhage (Sheehan), pituitary apoplexy, autoimmune, infiltrative, congenital, snake bite (Russell viper Asia).", citationIDs: ["specialty_dx_round29"])
        ],
        diagnosticCriteria: [
            AttributedBullet("BASAL HORMONES — TSH + free T4 (CENTRAL hypothyroidism — TSH normal/low + free T4 low; differs from primary high TSH), morning cortisol (low if deficient), FSH/LH + testosterone or estradiol, prolactin, IGF-1 (GH proxy), ADH/copeptin per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("STIMULATION TESTS — ACTH stimulation (cosyntropin 250 mcg IM; cortisol <18 mcg/dL at 30-60 min → adrenal insufficiency); insulin tolerance test (gold standard for ACTH + GH); GHRH-arginine for GH; metyrapone overnight; CRH stimulation.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("WATER DEPRIVATION TEST + desmopressin — central DI confirmation if polyuria.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("MRI PITUITARY with gadolinium — identifies tumor, empty sella, stalk lesions, infarction, infiltrative.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("VISUAL FIELDS — for macroadenomas + chiasmal involvement.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Autoimmune workup — anti-pituitary antibodies, IgG4 (hypophysitis), HLA associations.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Iron studies, ferritin (hemochromatosis); ACE (sarcoid); calcium + cancer surveillance (metastatic).", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DEXA — osteoporosis screening (hypogonadism + GH deficiency).", citationIDs: ["specialty_dx_round29"])
        ],
        priorityAssessments: [
            AttributedBullet("ADRENAL CRISIS — life-threatening; emergent IV hydrocortisone + fluids; STRESS DOSING for illness / surgery.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("REPLACE ADRENAL BEFORE THYROID — thyroxine accelerates cortisol clearance + precipitates adrenal crisis if ACTH-deficient.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("ENDOCRINOLOGY referral — comprehensive lifelong management.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PITUITARY MRI + visual fields — anatomy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Counsel medical alert ID + stress dosing + emergency injectable.", citationIDs: ["specialty_dx_round29"])
        ],
        commonInterventions: [
            AttributedBullet("ADRENAL FIRST — HYDROCORTISONE 15-25 mg PO daily divided (10-15 mg AM + 5-10 mg early afternoon) OR prednisone 5 mg AM; stress dosing × 2-3 for illness / surgery; emergency IM/IV hydrocortisone (solu-cortef) 100 mg + ID card per primary source.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LEVOTHYROXINE — start AFTER adrenal replacement adequate; 1.6 mcg/kg/day; monitor free T4 (NOT TSH in central hypothyroidism); target mid-normal range.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SEX HORMONE replacement — women: estrogen + progesterone (combined oral contraceptive or HRT) until menopause age; men: testosterone (gel, injection, patch); restore libido + muscle + bone + mood.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("GH REPLACEMENT (adult) — selected patients with proven deficiency + symptoms (somatropin daily SC); improves QOL + body composition + bone; cancer surveillance + diabetes monitoring.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("DESMOPRESSIN for central DI — PO / nasal / SC / IV; titrate to symptoms + sodium.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("FERTILITY treatment — gonadotropins (FSH + LH or hCG) for desired fertility in hypogonadotropic.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("STRESS DOSING — DOUBLE-TRIPLE hydrocortisone for fever / illness; IM/IV emergency hydrocortisone before surgery or severe illness; medical alert bracelet / wallet card.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Bone health — calcium + vitamin D + DEXA; bisphosphonate / denosumab if osteoporosis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Cardiovascular risk reduction — lipids, BP, diabetes screening, lifestyle.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Multidisciplinary — endocrinology + neurosurgery + ophthalmology + dental + cardiology + bone health.", citationIDs: ["specialty_dx_round29"])
        ],
        watchFor: [
            AttributedBullet("ADRENAL CRISIS — illness, surgery, trauma without stress dosing; emergent IM/IV hydrocortisone + fluids + supportive; lifelong risk.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PITUITARY APOPLEXY — sudden hemorrhage / infarction of tumor; severe HA + visual loss + meningismus + hypopituitarism; EMERGENCY — surgery + stress steroids.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("SHEEHAN SYNDROME — postpartum hypopituitarism after severe PPH; failure to lactate + amenorrhea + adrenal crisis; historically underrecognized.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("LEVOTHYROXINE before adrenal replacement — precipitates adrenal crisis.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("CENTRAL HYPOTHYROIDISM monitoring — free T4 (NOT TSH); target mid-normal.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("GH REPLACEMENT — cancer surveillance, diabetes monitoring; not for active malignancy.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("OSTEOPOROSIS + CV mortality — increased in untreated hypopituitarism; aggressive risk reduction.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("PSYCHOSOCIAL — chronic illness, fertility implications, medical alert anxiety.", citationIDs: ["specialty_dx_round29"]),
            AttributedBullet("Pregnancy — comprehensive multidisciplinary; replace deficient hormones; coordinate MFM + endocrinology.", citationIDs: ["specialty_dx_round29"])
        ],
        citations: [openrnDxR29, cdcDxR29, specialtyDxR29],
        lastSourceFidelityReview: "2026-05-13"
    )
}
