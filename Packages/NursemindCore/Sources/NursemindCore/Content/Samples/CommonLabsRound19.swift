import Foundation

// Curator-model lab entries (round 19 — repro endo + nephrology + men's health).

private let openrnLabsR19 = CitationSource(
    id: "openrn_labs_round19",
    shortName: "Open RN Health Alterations + Maternity",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyLabsR19 = CitationSource(
    id: "specialty_labs_round19",
    shortName: "ASRM / KDIGO / Endocrine Society / AUA concept citations",
    publisher: "ASRM · KDIGO · Endocrine Society · AUA",
    license: .factCitationOnly,
    url: "https://www.endocrine.org/clinical-practice-guidelines",
    lastRetrieved: "2026-05-04"
)

private let labsTagsR19 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .elimination
)

public enum AMHSample {
    public static let entry: LabEntry = LabEntry(
        id: "amh",
        title: "Anti-Müllerian hormone (AMH)",
        subtitle: "Ovarian reserve marker · IVF planning · PCOS · cycle-independent",
        specimen: "Serum (no fasting needed; cycle-independent)",
        nclexTags: labsTagsR19,
        referenceRanges: [
            ReferenceRangeRow(value: ">3.5 ng/mL", label: "High (PCOS suspicion)", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "1.5–4.0 ng/mL", label: "Normal reproductive-age", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "0.5–1.0 ng/mL", label: "Low / diminished ovarian reserve", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "<0.5 ng/mL", label: "Very low / approaching menopause", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "Undetectable", label: "Postmenopausal or after bilateral oophorectomy", citationIDs: ["openrn_labs_round19"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal AMH for age",
                summary: "Adequate ovarian reserve for reproductive-age woman. Provides one data point for fertility counseling; does NOT predict pregnancy success per primary source.",
                nursingActions: [
                    "Counsel that AMH alone does not predict natural conception or IVF success.",
                    "Pair with antral follicle count (AFC) on ultrasound + age + history for full reserve assessment.",
                    "Discuss family planning timeline."
                ],
                citationIDs: ["specialty_labs_round19"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated AMH",
                summary: "PCOS suspicion (especially with anovulation + hyperandrogenism); higher OHSS risk during ovulation induction. Granulosa cell tumor rare cause per primary source.",
                nursingActions: [
                    "Workup for PCOS — clinical / biochemical hyperandrogenism, ultrasound polycystic morphology.",
                    "If undergoing IVF, lower-dose stimulation protocol to reduce OHSS risk.",
                    "Counsel insulin resistance + metabolic risks of PCOS."
                ],
                citationIDs: ["specialty_labs_round19"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Low AMH (diminished reserve)",
                summary: "Diminished ovarian reserve — less responsive to fertility stimulation. Doesn't preclude pregnancy but informs timing + IVF protocol decisions per primary source.",
                nursingActions: [
                    "Refer to reproductive endocrinology for fertility counseling.",
                    "Discuss timing of conception attempts; egg freezing options.",
                    "Higher gonadotropin dose / antagonist protocol may be needed for IVF.",
                    "AMH does not predict natural fertility absolutely — many conceive naturally."
                ],
                citationIDs: ["specialty_labs_round19"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated AMH",
                causes: ["PCOS", "Granulosa cell tumor (rare)", "Some hormonal contraceptives reduce slightly"],
                citationIDs: ["specialty_labs_round19"]
            ),
            CauseGroup(
                title: "Reduced AMH",
                causes: ["Advancing reproductive age", "Smoking", "Prior ovarian surgery", "Chemotherapy / radiation", "Premature ovarian insufficiency", "Endometriosis with ovarian involvement", "BRCA mutation carriers (slightly lower)"],
                citationIDs: ["specialty_labs_round19"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — serum; no fasting; can be drawn any cycle day (vs FSH which is cycle-day-dependent).", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Pair with AFC + clinical history for full ovarian reserve assessment.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Counsel — AMH does not predict natural fertility; helps inform IVF planning.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Hormonal contraceptives may slightly reduce AMH — interpret in context.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Repeat trends over time more useful than single value.", citationIDs: ["openrn_labs_round19"])
        ],
        watchFor: [
            AttributedBullet("PCOS workup — elevated AMH supports diagnosis but is not a Rotterdam criterion; clinical + ultrasound correlation.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Premature ovarian insufficiency — low AMH + low estradiol + high FSH in women <40.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Cancer treatment counseling — fertility preservation discussion before chemo / RT for women.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Counsel realistic expectations — AMH guidance + emotional support for fertility journey.", citationIDs: ["openrn_labs_round19"])
        ],
        citations: [openrnLabsR19, specialtyLabsR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum UPCRSample {
    public static let entry: LabEntry = LabEntry(
        id: "urine-protein-creatinine",
        title: "Spot urine protein-creatinine ratio (UPCR / UACR)",
        subtitle: "Surrogate for 24-hour protein · CKD staging + diabetic nephropathy screening",
        specimen: "Spot urine (random) sample; first-morning preferred for variability reduction",
        nclexTags: labsTagsR19,
        referenceRanges: [
            ReferenceRangeRow(value: "UPCR <0.15 g/g", label: "Normal", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "UPCR 0.15–0.5 g/g", label: "Mild proteinuria", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "UPCR 0.5–3.5 g/g", label: "Moderate proteinuria", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "UPCR >3.5 g/g", label: "Nephrotic-range proteinuria", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "UACR <30 mg/g", label: "Normoalbuminuria", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "UACR 30–300 mg/g", label: "Moderately increased albuminuria", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "UACR >300 mg/g", label: "Severely increased albuminuria", citationIDs: ["specialty_labs_round19"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal UPCR / UACR",
                summary: "No significant proteinuria. Continue routine screening at recommended intervals (annually for diabetes, hypertension; less frequent for general per primary source.",
                nursingActions: [
                    "Document baseline; annual screening for diabetic / hypertensive patients.",
                    "Reassess if symptomatic kidney disease.",
                    "Continue lifestyle + BP / glucose management."
                ],
                citationIDs: ["specialty_labs_round19"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Moderately increased albuminuria (microalbuminuria)",
                summary: "Early sign of diabetic / hypertensive nephropathy; CV risk marker; opportunity for nephroprotective therapy per primary source.",
                nursingActions: [
                    "Confirm with 2 of 3 abnormal samples to establish persistent.",
                    "Initiate / optimize ACE inhibitor or ARB; SGLT2 in T2DM.",
                    "Tight BP + glucose control; address CV risk factors.",
                    "Monitor q3–6 months; expect reduction with treatment."
                ],
                citationIDs: ["specialty_labs_round19"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Nephrotic-range proteinuria (>3.5 g/g)",
                summary: "Significant glomerular disease — diabetic nephropathy, FSGS, membranous, minimal change, lupus nephritis, amyloidosis; renal biopsy often needed per primary source.",
                nursingActions: [
                    "Nephrology consultation; expedited workup including renal biopsy.",
                    "Address complications — anasarca, hypoalbuminemia, hyperlipidemia, hypercoagulability (consider anticoagulation if albumin <2.5).",
                    "Maximize RAS blockade + restrict sodium + appropriate protein intake.",
                    "Monitor for AKI on RAS blockade initiation."
                ],
                citationIDs: ["specialty_labs_round19"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Glomerular proteinuria (most clinically significant)",
                causes: ["Diabetic nephropathy", "Hypertensive nephrosclerosis", "Glomerulonephritis (IgAN, FSGS, membranous, MCD, lupus, ANCA)", "Amyloidosis"],
                citationIDs: ["specialty_labs_round19"]
            ),
            CauseGroup(
                title: "Tubular proteinuria",
                causes: ["Tubulointerstitial nephritis", "Acute tubular necrosis", "Heavy metal toxicity", "Multiple myeloma (Bence-Jones)"],
                citationIDs: ["specialty_labs_round19"]
            ),
            CauseGroup(
                title: "Transient / benign",
                causes: ["Fever", "Vigorous exercise", "Orthostatic proteinuria (young adults)", "UTI", "Pregnancy", "CHF exacerbation"],
                citationIDs: ["openrn_labs_round19"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — random spot urine adequate; first-morning preferred to reduce orthostatic confounding.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Confirm persistent — 2 of 3 abnormal samples needed for diagnosis of CKD per KDIGO.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Pair with eGFR + urinalysis + clinical context.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Annual screening — DM, HTN, age >60, family history, glomerular disease history.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Trend over time + with treatment — therapeutic monitoring.", citationIDs: ["openrn_labs_round19"])
        ],
        watchFor: [
            AttributedBullet("PROGRESSION to CKD — proteinuria + eGFR decline; nephrology referral when UACR >300 OR eGFR <30 OR rapid decline per primary source.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("NEPHROTIC SYNDROME — anasarca, hypoalbuminemia, hyperlipidemia, hypercoagulability; biopsy for cause; specific treatment per disease.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("PREGNANCY proteinuria — preeclampsia evaluation if new ≥300 mg/24h or ≥0.3 g/g UPCR after 20 weeks per primary source.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("FALSE POSITIVE — UTI, hematuria, contamination, alkaline urine.", citationIDs: ["openrn_labs_round19"])
        ],
        citations: [openrnLabsR19, specialtyLabsR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum TestosteroneSample {
    public static let entry: LabEntry = LabEntry(
        id: "testosterone-total",
        title: "Testosterone (total + free)",
        subtitle: "Hypogonadism + ED workup · women's androgen excess · DRAW MORNING fasting",
        specimen: "Serum; MORNING (8 AM) fasting preferred (diurnal variation)",
        nclexTags: labsTagsR19,
        referenceRanges: [
            ReferenceRangeRow(value: "Adult men total: 264–916 ng/dL (varies by lab)", label: "Reference range adult men", citationIDs: ["openrn_labs_round19"]),
            ReferenceRangeRow(value: "Total <264 ng/dL on 2 morning samples + symptoms", label: "Hypogonadism (Endocrine Society)", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "Adult women total: 9–55 ng/dL", label: "Reference range adult women", citationIDs: ["openrn_labs_round19"]),
            ReferenceRangeRow(value: "Women >55 ng/dL", label: "Hyperandrogenism — workup PCOS / ovarian / adrenal source", citationIDs: ["specialty_labs_round19"]),
            ReferenceRangeRow(value: "Free testosterone (when needed) — varies by assay", label: "Use when SHBG abnormal", citationIDs: ["specialty_labs_round19"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal testosterone for age + sex",
                summary: "No biochemical evidence of hypogonadism / hyperandrogenism. Continue evaluation of presenting symptoms for non-androgen causes per primary source.",
                nursingActions: [
                    "Reassess symptoms; consider alternative diagnoses for ED, fatigue, mood changes (depression, sleep disorders, drug effects).",
                    "If clinical picture compelling, consider second confirmatory test or free testosterone."
                ],
                citationIDs: ["specialty_labs_round19"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Low testosterone in men",
                summary: "Hypogonadism — confirmed with 2 morning total testosterone <264 + symptoms. Determine primary (testicular) vs secondary (HPG axis) per primary source.",
                nursingActions: [
                    "Confirm with 2nd morning sample.",
                    "Workup — LH + FSH (high in primary, low/normal in secondary), prolactin, ferritin (hemochromatosis), pituitary MRI if secondary.",
                    "Optimize comorbidities — sleep apnea, weight, diabetes, opioid use, depression.",
                    "Discuss testosterone replacement risks / benefits if confirmed (CV + fertility considerations)."
                ],
                citationIDs: ["specialty_labs_round19"]
            ),
            InterpretationTier(
                severity: .high,
                label: "High testosterone in women",
                summary: "Workup for PCOS (most common); congenital adrenal hyperplasia; ovarian / adrenal androgen-producing tumor (especially if rapid onset / virilization) per primary source.",
                nursingActions: [
                    "DHEA-S, 17-OHP, prolactin, transvaginal ultrasound (ovarian), CT abdomen if tumor suspected.",
                    "Address virilization — hirsutism management, contraception, fertility counseling.",
                    "Treat underlying — OCPs / spironolactone for PCOS; surgery for tumor."
                ],
                citationIDs: ["specialty_labs_round19"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Low testosterone in men (hypogonadism)",
                causes: ["Primary — Klinefelter, testicular trauma / radiation / chemo, infection, autoimmune", "Secondary — pituitary tumor, hyperprolactinemia, hemochromatosis, severe systemic illness", "Functional — obesity, OSA, opioids, glucocorticoids, severe illness"],
                citationIDs: ["specialty_labs_round19"]
            ),
            CauseGroup(
                title: "High testosterone in women",
                causes: ["PCOS (most common)", "Congenital adrenal hyperplasia", "Cushing's syndrome", "Ovarian tumor (Sertoli-Leydig)", "Adrenal tumor", "Anabolic steroid use"],
                citationIDs: ["specialty_labs_round19"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen — MORNING (8 AM) fasting; diurnal variation peaks AM in men.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Confirm low testosterone with 2 morning samples + symptoms before diagnosing hypogonadism per primary source.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Avoid measurement during acute illness — falsely low.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Free testosterone — when SHBG abnormal (obesity / hyperthyroidism reduce SHBG; aging / liver disease / estrogens raise SHBG) per primary source.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("Counsel — testosterone therapy is NOT a cure for normal aging changes; clear hypogonadism + symptoms required.", citationIDs: ["specialty_labs_round19"])
        ],
        watchFor: [
            AttributedBullet("TESTOSTERONE THERAPY risks — CV events (mixed evidence), polycythemia (Hct >54), prostate cancer (controversial), infertility from spermatogenesis suppression.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("KLINEFELTER (47,XXY) — primary hypogonadism + tall + small testes + gynecomastia; karyotype.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("PROLACTINOMA — prolactin >100; pituitary MRI + cabergoline / bromocriptine.", citationIDs: ["specialty_labs_round19"]),
            AttributedBullet("OPIOID-INDUCED HYPOGONADISM — chronic opioid use; address opioid use; testosterone therapy if needed.", citationIDs: ["openrn_labs_round19"])
        ],
        citations: [openrnLabsR19, specialtyLabsR19],
        lastSourceFidelityReview: "2026-05-04"
    )
}
