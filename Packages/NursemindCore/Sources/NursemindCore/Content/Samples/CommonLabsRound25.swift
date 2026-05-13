import Foundation

// Curator-model lab entries (round 25 — pediatric screening).

private let openrnLabsR25 = CitationSource(
    id: "openrn_labs_round25",
    shortName: "Open RN Pediatrics + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pediatric/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLabsR25 = CitationSource(
    id: "specialty_labs_round25",
    shortName: "AAP + ACOG + AAOG concept citations",
    publisher: "AAP · ACOG · ACMG",
    license: .factCitationOnly,
    url: "https://www.aap.org/en/practice-management/care-delivery-approaches/",
    lastRetrieved: "2026-05-13"
)

private let labsTagsR25 = NCLEXTags(
    category: .healthPromotion,
    subcategory: .healthPromotion,
    priorityConcept: .safety
)

public enum NewbornHearingScreenSample {
    public static let entry: LabEntry = LabEntry(
        id: "newborn-hearing-screen",
        title: "Newborn hearing screen (OAE + AABR)",
        subtitle: "Universal screening before 1 month · OAE outpatient · AABR for NICU + failed OAE · diagnose by 3 mo · intervene by 6 mo (1-3-6)",
        specimen: "Otoacoustic emissions (OAE) — bedside; or Automated Auditory Brainstem Response (AABR) — for NICU + failed OAE",
        nclexTags: labsTagsR25,
        referenceRanges: [
            ReferenceRangeRow(value: "PASS", label: "Adequate hearing for screening; routine pediatric care + monitoring", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "REFER (failed)", label: "Repeat with AABR before discharge OR follow-up audiology by 1 month", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "Diagnostic audiology by 3 months", label: "Confirms hearing loss type + severity (mild / moderate / severe / profound)", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "Intervention by 6 months", label: "Hearing aids / cochlear implants / sign language / family services to optimize language outcomes", citationIDs: ["specialty_labs_round25"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "PASS",
                summary: "Adequate hearing detected for screening criteria. Routine pediatric care + ongoing developmental surveillance for delayed-onset hearing loss per primary source.",
                nursingActions: [
                    "Document PASS result in EHR + parental discharge summary.",
                    "Counsel parents on developmental hearing milestones (responds to sound by 4 months, babbles by 6 months, first words by 12-18 months).",
                    "Risk factors that warrant ongoing surveillance — NICU admission, family history hearing loss, congenital infections (CMV, syphilis, rubella, toxoplasmosis), craniofacial anomalies, ototoxic drug exposure.",
                    "Schedule routine hearing screen at well visits per AAP."
                ],
                citationIDs: ["specialty_labs_round25"]
            ),
            InterpretationTier(
                severity: .high,
                label: "REFER (failed) — needs follow-up",
                summary: "Failed OAE before discharge — possible debris in canal, fluid behind tympanic membrane, OR true hearing loss. Repeat with AABR before discharge if possible OR refer to outpatient audiology within 1 month per primary source.",
                nursingActions: [
                    "Schedule outpatient diagnostic audiology by 1 month (1-3-6 standard).",
                    "Counsel parents — common false positives (debris, fluid); important to follow-up to rule out true hearing loss.",
                    "If true hearing loss confirmed — early intervention by 6 months; hearing aids, sign language, cochlear implants, family services.",
                    "Address parent + family hearing loss; consider deaf community resources.",
                    "ENT + GENETICS evaluation for severe / profound congenital hearing loss."
                ],
                citationIDs: ["specialty_labs_round25"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Risk factors for congenital / early hearing loss",
                causes: ["NICU admission >5 days", "Family history hereditary hearing loss", "In utero infections (CMV, rubella, syphilis, herpes, toxoplasmosis)", "Craniofacial anomalies (cleft lip / palate, microtia)", "Ototoxic medications (gentamicin, tobramycin, vancomycin, loop diuretics)", "Bacterial meningitis", "Hyperbilirubinemia requiring exchange transfusion", "Down syndrome + other syndromes", "Persistent hyperbilirubinemia"],
                citationIDs: ["specialty_labs_round25"]
            ),
            CauseGroup(
                title: "Causes of false positive REFER",
                causes: ["Vernix / amniotic fluid in ear canal", "Middle ear effusion", "Ambient noise during screening", "Newborn movement / crying"],
                citationIDs: ["specialty_labs_round25"]
            )
        ],
        nursingActions: [
            AttributedBullet("UNIVERSAL screening — OAE before discharge for ALL newborns; AABR for NICU > 5 days OR failed OAE per primary source.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("1-3-6 RULE — screen by 1 month, diagnose by 3 months, intervene by 6 months.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("OAE — measures cochlear (outer hair cell) function; insensitive to neural pathway loss.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("AABR — measures CNVIII + brainstem auditory pathway; preferred for NICU + complex.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("Screen quietly + during natural sleep; minimize movement / crying.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("Document PASS / REFER in EHR + state newborn screening registry.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("Counsel parents — pass result doesn't rule out delayed-onset hearing loss; ongoing developmental monitoring + screening at well visits per AAP.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("Coordinate with state Early Hearing Detection + Intervention (EHDI) program.", citationIDs: ["specialty_labs_round25"])
        ],
        watchFor: [
            AttributedBullet("LOST TO FOLLOW-UP — common gap; ~50% of REFERs do not complete diagnostic audiology; emphasize importance + ensure scheduled appointments per primary source.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("DELAYED-ONSET hearing loss — may not present at birth; risk factors above; ongoing hearing surveillance.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("CONGENITAL CMV — leading non-genetic cause of pediatric sensorineural hearing loss; some recommend universal CMV screening.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("OTITIS MEDIA EFFUSION — common cause of acquired hearing loss in toddlers; serial otoscopy + tympanometry; tympanostomy tubes for refractory.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("LANGUAGE DELAY — counsel parents to monitor + report; speech evaluation + audiology testing.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("EARLY INTERVENTION — language outcomes substantially better when intervention by 6 months vs delayed; emphasize urgency to families.", citationIDs: ["specialty_labs_round25"])
        ],
        citations: [openrnLabsR25, specialtyLabsR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TcBBilirubinSample {
    public static let entry: LabEntry = LabEntry(
        id: "tcb-bilirubin",
        title: "Transcutaneous bilirubin (TcB) + serum bilirubin in newborn",
        subtitle: "Hyperbilirubinemia screening + monitoring · TcB before discharge + 24-48h post-discharge · phototherapy + exchange transfusion thresholds",
        specimen: "Transcutaneous bilirubin (TcB) at sternum / forehead — non-invasive bedside; or serum total bilirubin (TSB) for confirmation + management",
        nclexTags: labsTagsR25,
        referenceRanges: [
            ReferenceRangeRow(value: "Variable by hours of age + gestation + risk factors", label: "Plot on Bhutani nomogram or AAP 2022 hyperbilirubinemia guidelines for phototherapy / exchange transfusion thresholds", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "TcB <12 mg/dL term newborn", label: "Generally low risk; recheck per protocol", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "TcB 12-15 mg/dL", label: "Confirm with TSB; assess risk factors", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "TcB ≥15 mg/dL OR TcB within 3 mg/dL of phototherapy threshold", label: "Confirm with TSB; consider phototherapy per AAP 2022 nomogram", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "TSB phototherapy threshold (per nomogram)", label: "Initiate phototherapy", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "TSB exchange transfusion threshold (~2-3 mg/dL above phototherapy)", label: "Exchange transfusion + intensive phototherapy", citationIDs: ["specialty_labs_round25"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Below phototherapy threshold",
                summary: "Normal physiologic jaundice course. Continue routine breastfeeding / formula support; recheck per discharge plan + AAP follow-up schedule per primary source.",
                nursingActions: [
                    "Continue feeding support — frequent feeding (8-12 times daily); breastfeeding-jaundice prevention.",
                    "Counsel parents — physiologic jaundice peaks day 3-5; usually resolves by 1-2 weeks; persistent jaundice >2-3 weeks needs eval.",
                    "Schedule recheck per AAP — typically at 24-48 hours post-discharge for early-discharge babies.",
                    "Identify warning signs — lethargy, poor feeding, decreased urine output, scalloped abdomen."
                ],
                citationIDs: ["specialty_labs_round25"]
            ),
            InterpretationTier(
                severity: .high,
                label: "At or above phototherapy threshold",
                summary: "Initiate phototherapy per AAP 2022 hyperbilirubinemia guidelines. Continue feeding to support hydration + bilirubin elimination. Monitor TSB every 4-6 hours during therapy per primary source.",
                nursingActions: [
                    "INITIATE phototherapy — single OR double bank lights; expose maximum skin (diaper only); eye protection; reposition q2-4h.",
                    "FEEDING — continue every 2-3 hours; supplement with formula or expressed breast milk if dehydration / weight loss >7-8% from birth.",
                    "MONITOR — TSB every 4-6 hours initially; daily once stable; weight; intake / output.",
                    "TYPE + DAT — to identify ABO / Rh / minor antigen incompatibility; helps assess hemolysis risk + need for IVIG.",
                    "EXCHANGE TRANSFUSION threshold (~2-3 mg/dL above phototherapy) — emergent; bilirubin-induced neurologic dysfunction (BIND) risk; specialty NICU.",
                    "CRIGLER-NAJJAR or hereditary hemolytic anemias workup if persistent / atypical hyperbilirubinemia.",
                    "AAP 2022 thresholds INTEGRATE risk factors (gestation, age in hours, risk for hemolysis) — use specific nomograms."
                ],
                citationIDs: ["specialty_labs_round25"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Physiologic jaundice (most common, benign)",
                causes: ["Increased RBC turnover (HbF transitioning to HbA)", "Immature hepatic UDP-glucuronosyltransferase activity", "Reduced bilirubin excretion early in life", "Onset after 24 hours, peaks day 3-5, resolves by 1-2 weeks"],
                citationIDs: ["specialty_labs_round25"]
            ),
            CauseGroup(
                title: "Pathologic causes",
                causes: ["Hemolytic disease (ABO/Rh/minor antigen incompatibility, G6PD deficiency, hereditary spherocytosis)", "Sepsis", "Hypothyroidism", "Cephalohematoma / large bruising", "Polycythemia", "Breast milk jaundice (later, persistent, benign)", "Crigler-Najjar / Gilbert syndrome", "Biliary atresia (>2 weeks; conjugated hyperbili = surgical emergency)"],
                citationIDs: ["specialty_labs_round25"]
            )
        ],
        nursingActions: [
            AttributedBullet("UNIVERSAL screening — TcB or TSB BEFORE discharge per AAP 2022 + risk-zone interpretation per primary source.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("FOLLOW-UP — per discharge nomogram zone; high-risk zone needs 24-48 hour outpatient recheck.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("AAP 2022 NOMOGRAMS — separate phototherapy + exchange transfusion thresholds based on hours of age + gestation + risk factors.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("FEEDING SUPPORT — frequent (8-12 times/day); supplement if dehydration / weight loss >7-8%.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("PHOTOTHERAPY — single bank for moderate; double bank + intensive for severe; continue until TSB <2 mg/dL below initiation threshold.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("EXCHANGE TRANSFUSION — emergent NICU; BIND prevention; specialist team.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("HEMOLYSIS workup — type + DAT, peripheral smear, hereditary spherocytosis screen if family history, G6PD if at-risk ethnic group.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("CONJUGATED HYPERBILI (>1 mg/dL OR 20% of total) — pathologic; biliary atresia urgent workup; differential = neonatal hepatitis, infections, metabolic.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("Counsel parents — kernicterus prevention through monitoring + intervention; visible jaundice + feeding support + follow-up.", citationIDs: ["specialty_labs_round25"])
        ],
        watchFor: [
            AttributedBullet("KERNICTERUS — bilirubin-induced neurologic dysfunction (BIND); preventable; emergent treatment if approaching exchange transfusion threshold per primary source.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("BILIARY ATRESIA — conjugated hyperbilirubinemia >2-3 weeks; pale stools + dark urine; surgical emergency (Kasai procedure within 60 days for best outcomes).", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("BREASTFEEDING JAUNDICE (early — first week, dehydration / inadequate intake) vs BREAST MILK JAUNDICE (late — weeks 2+, benign).", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("EARLY DISCHARGE — high risk for missing peak bilirubin; mandatory 24-48 hour outpatient recheck.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("HEMOLYTIC DISEASE — Rh-negative mother + Rh+ baby (RhoGAM prevents); ABO incompatibility (most common; mother O, baby A or B); IVIG considered.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("LATE-PRETERM (35-36 weeks) — higher risk than term; closer monitoring; lower phototherapy thresholds.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("PARENT EDUCATION — feeding support + warning signs + return precautions; lactation consultant referral.", citationIDs: ["specialty_labs_round25"])
        ],
        citations: [openrnLabsR25, specialtyLabsR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum KaryotypeMicroarraySample {
    public static let entry: LabEntry = LabEntry(
        id: "karyotype-microarray",
        title: "Karyotype + chromosomal microarray (CMA)",
        subtitle: "Genetic workup · structural anomalies + intellectual disability + multiple congenital anomalies + RPL · CMA detects microdeletions + duplications",
        specimen: "Peripheral blood (lymphocytes for karyotype + microarray); amniotic fluid or CVS prenatally; postmortem skin / placenta for stillbirth; bone marrow for cancer karyotype",
        nclexTags: labsTagsR25,
        referenceRanges: [
            ReferenceRangeRow(value: "46,XX or 46,XY normal female / male", label: "Normal karyotype", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "Trisomy (47, +21 / 18 / 13)", label: "Trisomy 21 (Down) / 18 (Edwards) / 13 (Patau)", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "Sex chromosome aneuploidy (45,X / 47,XXY / 47,XXX / 47,XYY)", label: "Turner / Klinefelter / Triple X / XYY", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "Translocation, inversion, deletion, duplication (karyotype)", label: "Structural chromosomal abnormality", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "Pathogenic CNV (microarray)", label: "Microdeletion / microduplication; ~10-15% of unexplained ID / autism / multiple congenital anomalies", citationIDs: ["specialty_labs_round25"]),
            ReferenceRangeRow(value: "VUS (variant of uncertain significance)", label: "CNV of unknown clinical impact; genetic counseling needed", citationIDs: ["specialty_labs_round25"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Normal karyotype + microarray",
                summary: "Rules out major chromosomal aneuploidy + most CNVs. Does NOT exclude single-gene disorders (require gene panel / whole exome sequencing) or epigenetic disorders. Genetic counseling for further workup if clinical concerns persist per primary source.",
                nursingActions: [
                    "Counsel that normal karyotype + CMA does not rule out single-gene disorders or imprinting / epigenetic disorders.",
                    "Consider next-tier testing — gene panel or whole exome sequencing for high suspicion.",
                    "Genetic counseling for family + future pregnancy planning.",
                    "Multidisciplinary developmental pediatrics + early intervention for clinical features."
                ],
                citationIDs: ["specialty_labs_round25"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Pathogenic chromosomal abnormality",
                summary: "Confirmed chromosomal disorder — guides medical care + family counseling + recurrence risk + prenatal options for future pregnancies. Multidisciplinary care + early intervention essential per primary source.",
                nursingActions: [
                    "GENETIC COUNSELING — explain results, recurrence risk, family screening, future pregnancy options (PGT, prenatal diagnosis).",
                    "Multidisciplinary CARE — coordinate genetics, developmental pediatrics, cardiology, audiology, ophthalmology, endocrinology, mental health based on syndrome.",
                    "EARLY INTERVENTION — birth-3 services for developmental delays.",
                    "FAMILY support + condition-specific resources (Down syndrome organizations, Marfan Foundation, Turner Society, etc.).",
                    "ADVOCACY — IEP / 504 plan, special services, transition planning to adult care.",
                    "FINANCIAL + insurance counseling — many syndromes qualify for SSI + Medicaid waivers."
                ],
                citationIDs: ["specialty_labs_round25"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Indications for karyotype + CMA",
                causes: ["Multiple congenital anomalies", "Unexplained intellectual disability or developmental delay", "Autism spectrum disorder (CMA first-line per ACMG)", "Recurrent pregnancy loss (≥2 — parental + POC analysis)", "Stillbirth (POC for genetic etiology)", "Suspected aneuploidy syndrome (Down, Turner, Klinefelter, etc.)", "Cancer karyotype (specific malignancies — CML, ALL)", "Family history of chromosomal disorder + reproductive planning"],
                citationIDs: ["specialty_labs_round25"]
            ),
            CauseGroup(
                title: "Differences — karyotype vs CMA",
                causes: ["KARYOTYPE — visualizes whole chromosome structure; detects aneuploidy + balanced + unbalanced translocations + large deletions / duplications (>5 Mb); cannot detect smaller CNVs", "CMA — higher resolution; detects CNVs as small as 50-100 Kb; cannot detect balanced translocations + inversions; first-line for unexplained ID / autism / multiple anomalies per ACMG"],
                citationIDs: ["specialty_labs_round25"]
            )
        ],
        nursingActions: [
            AttributedBullet("ORDER appropriate test — KARYOTYPE for suspected aneuploidy + balanced translocation + RPL parental; MICROARRAY first-line for unexplained ID / autism / multiple congenital anomalies per ACMG per primary source.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("PRENATAL — amniocentesis at 15-20 weeks (CVS earlier 10-13); both karyotype + CMA possible.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("STILLBIRTH workup — POC for chromosomal microarray essential; counseling.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("PRE-TEST counseling — informed consent, what tests can + can't tell, implications of results, family + reproductive planning.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("RESULTS turnaround — karyotype 1-3 weeks; FISH (specific aneuploidy) hours-days; microarray 2-3 weeks; quantitative PCR rapid.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("GENETIC COUNSELING for ANY abnormal result — interpretation, recurrence risk, family implications, reproductive options.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("VARIANTS OF UNCERTAIN SIGNIFICANCE (VUS) — common with microarray; genetic counseling for parental testing + clinical correlation.", citationIDs: ["specialty_labs_round25"])
        ],
        watchFor: [
            AttributedBullet("INCIDENTAL FINDINGS — non-paternity, consanguinity, adult-onset disease predisposition; counsel + informed consent BEFORE testing.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("MOSAICISM — different cell lines with different karyotypes; may be missed in single tissue; FISH on multiple tissues if suspected.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("FRAGILE X — separate testing (CGG repeat); not detected by karyotype or CMA.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("WHOLE EXOME / GENOME SEQUENCING — for negative karyotype + CMA with high suspicion; emerging clinical use; expensive + complex interpretation.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("RECURRENT PREGNANCY LOSS — parental karyotype identifies balanced translocation in ~5% of couples; reproductive options change.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("CANCER karyotype — specific translocations (Philadelphia chromosome / BCR-ABL in CML) targeted with imatinib; precision oncology.", citationIDs: ["specialty_labs_round25"]),
            AttributedBullet("PSYCHOLOGICAL impact — abnormal results can cause significant distress; ensure counseling + support resources.", citationIDs: ["specialty_labs_round25"])
        ],
        citations: [openrnLabsR25, specialtyLabsR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}
