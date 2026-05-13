import Foundation

// Curator-model diagnosis entries (round 25 — pediatric ortho + congenital cardiac + genetic + behavioral).

private let openrnDxR25 = CitationSource(
    id: "openrn_dx_round25",
    shortName: "Open RN Pediatrics + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pediatric/",
    lastRetrieved: "2026-05-13"
)
private let cdcDxR25 = CitationSource(
    id: "cdc_dx_round25",
    shortName: "CDC + AAP + AHA pediatric concept citations",
    publisher: "CDC · AAP · AHA",
    license: .publicDomain,
    url: "https://www.cdc.gov/birthdefects/",
    lastRetrieved: "2026-05-13"
)
private let specialtyDxR25 = CitationSource(
    id: "specialty_dx_round25",
    shortName: "AAP + AAOS + AHA + ACC + ACR Pediatric guidelines",
    publisher: "AAP · AAOS · AHA · ACC · ACR Peds",
    license: .factCitationOnly,
    url: "https://www.aap.org/en/practice-management/care-delivery-approaches/",
    lastRetrieved: "2026-05-13"
)

private let pedsOrthoR25 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .mobility)
private let pedsCardR25 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion)
private let pedsNeuroR25 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation)
private let pedsImmuneR25 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection)
private let pedsGeneticR25 = NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety)
private let pedsRespR25 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange)

public enum DDHSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "developmental-dysplasia-hip",
        title: "Developmental dysplasia of the hip (DDH)",
        subtitle: "Newborn / infant hip instability · Barlow / Ortolani · breech / female / family history risk · Pavlik harness if <6 mo",
        nclexTags: pedsOrthoR25,
        definition: AttributedProse(
            "Spectrum of abnormalities of hip joint development — from mild dysplasia (acetabular shallow) to subluxation to complete dislocation. Affects ~1-3% of newborns; female predominance (4:1); breech / family history major risk factors. Early detection + treatment crucial; missed DDH = lifetime hip dysfunction per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — hormonal (maternal estrogen / relaxin → ligamentous laxity), mechanical (breech, oligohydramnios, multiparity → constraint), genetic (family history, polygenic), postnatal (swaddling). Femoral head abnormal contact with acetabulum → progressive deformity if untreated.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("NEWBORN — asymmetric thigh / gluteal folds, leg length discrepancy, limited hip abduction, audible / palpable click on Barlow / Ortolani.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("BARLOW MANEUVER — push posteriorly on adducted hip → DISLOCATES if dislocatable.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("ORTOLANI MANEUVER — abduct + lift on dislocated hip → REDUCES with palpable clunk.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("OLDER INFANT (>3 months) — Galeazzi sign (asymmetric knee height with hips flexed); limited abduction; positive Klisic line.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("WALKING CHILD — Trendelenburg gait, leg length discrepancy, lordosis, toe-walking, limp.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("RISK FACTORS — female (4:1), breech presentation (especially frank), positive family history, oligohydramnios, multiparity, firstborn, postnatal swaddling.", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL exam at every well-child visit through walking age — Barlow / Ortolani <3 months; Galeazzi + abduction limitation >3 months per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ULTRASOUND <4 months — gold standard; ossification incomplete; visualize acetabulum + femoral head.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("HIP X-RAY ≥4 months — when ossification adequate; femoral head ossification center should be in lower-inner quadrant.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("AAP recommends — ULTRASOUND screening for ALL infants with risk factors (breech, family history, female with positive risk) at 6 weeks per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Universal screening NOT recommended — clinical exam at well visits + selective imaging.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("Hip exam at every well-child visit through 12-18 months OR walking.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Risk factor identification — universal hip ultrasound for breech / family history per AAP.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Parent education on swaddling — keep hips loose / flexed; tight straight-leg swaddling = DDH risk per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Orthopedic referral for any abnormal exam OR positive imaging.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("PAVLIK HARNESS — first-line for infants <6 months; abducts + flexes hips → relocates + maintains position; worn 23 hrs/day × 6-12 weeks; orthopedic supervision per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CLOSED REDUCTION + SPICA CAST — for infants 6-18 months OR Pavlik failure; arthrogram-guided; 3-6 months in cast.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("OPEN REDUCTION + osteotomy — for older children OR failed closed reduction; pelvic / femoral osteotomies.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PARENT EDUCATION on PAVLIK HARNESS — proper application + wearing time + skin care + when to remove (none until appointment).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("HIP-HEALTHY swaddling — allow flexion + abduction; AVOID tight straight-leg swaddling per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Carry baby with hips flexed + abducted (e.g., M-position carriers) — promotes proper hip development.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MONITOR — clinical + imaging response; orthopedic follow-up.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("AVASCULAR NECROSIS of femoral head — most concerning Pavlik complication; 5-15% with treatment; lifetime hip dysfunction; vigilant orthopedic monitoring per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FEMORAL NERVE PALSY — Pavlik over-flexion; reversible.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("REDISLOCATION after Pavlik discontinuation — close follow-up.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("LATE PRESENTATION (walking) — significantly higher reduction failure rate; counsel families on early detection + screening.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ADULT DDH — presents with early hip OA + pain in 20s-30s; proactive screening + treatment important.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SKIN BREAKDOWN under Pavlik — assess skin folds + edges; barrier protection.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum SCFESample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "slipped-capital-femoral-epiphysis",
        title: "Slipped capital femoral epiphysis (SCFE)",
        subtitle: "Adolescent obesity + hip / knee pain · NWB + ortho urgent · pin-in-situ surgery · 30% bilateral · screen contralateral",
        nclexTags: pedsOrthoR25,
        definition: AttributedProse(
            "Adolescent hip disorder — femoral head (capital epiphysis) slips posteroinferiorly off the femoral neck through the growth plate. Usually presents in obese 10-16 year-olds; obese adolescents 30-50% bilateral. EMERGENT orthopedic referral; non-weight-bearing immediately; surgical pinning to prevent further slippage + AVN per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Mechanical + hormonal factors — obesity → increased shear forces on growth plate; growth spurt → physis weakest before maturity; endocrine disorders (hypothyroidism, GH deficiency, panhypopituitarism, renal osteodystrophy) → increased risk. Femoral head slips posteriorly + medially while neck rotates anteriorly + laterally.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("OBESE adolescent (BMI >95th percentile common) with hip OR KNEE pain — KNEE PAIN ALONE classic + commonly missed (referred pain) per primary source.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Limp / antalgic gait; external rotation of leg at rest; OBLIGATE external rotation with hip flexion (Drehmann sign).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("STABLE SCFE (~85%) — patient walks (with limp); chronic / progressive.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("UNSTABLE SCFE (~15%) — cannot bear weight; severe acute pain; high AVN risk (~50%).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("BILATERAL in 30-50% — second hip may slip later; close monitoring + screening of contralateral.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Risk factors — obesity (most important), male, African American, age 10-16 years (girls earlier than boys), endocrine disorders.", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HIP X-RAY (AP + FROG-LEG LATERAL views) — Klein line / Trethowan sign; loss of femoral head height in lateral view per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MRI — most sensitive; useful in pre-slip (early) detection.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Always image BILATERAL hips even if symptoms unilateral.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Endocrine workup — TSH, growth hormone in atypical age (<10 or >16) or unusual presentation per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Differentiate — Legg-Calvé-Perthes (younger, ages 4-8), septic arthritis, transient synovitis, femoral neck stress fracture.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("ANY adolescent with hip / KNEE pain — consider SCFE; image hips per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("STABLE vs UNSTABLE — guides surgical urgency + AVN risk.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BILATERAL screening at presentation + ongoing.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Endocrine assessment in atypical cases.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("NON-WEIGHT-BEARING IMMEDIATELY — wheelchair / crutches; prevent further slippage.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("URGENT ORTHOPEDIC REFERRAL — same day; surgical management essential.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PIN-IN-SITU surgical fixation — gold standard; single screw across physis to prevent further slippage; minimal disturbance per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BILATERAL prophylactic pinning — controversial; consider for high-risk (very young, endocrine disorder, severe obesity); ~30-50% develop bilateral.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("UNSTABLE SCFE — emergent surgery; gentle reduction + pinning; AVN risk ~50%.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("WEIGHT MANAGEMENT post-op — multidisciplinary; nutrition, exercise, possibly bariatric surgery later.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Follow-up with serial X-rays for opposite hip + complications.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ENDOCRINE workup if atypical presentation — TSH, GH, panhypopituitarism workup.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("AVASCULAR NECROSIS — most feared complication; ~50% in unstable SCFE despite treatment; ~10% in stable; lifetime hip dysfunction.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CHONDROLYSIS — articular cartilage destruction; reduced ROM; treatment with PT.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CONTRALATERAL SLIP — 30-50% develop opposite hip slip; ongoing monitoring + counseling.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EARLY HIP OSTEOARTHRITIS — common in adulthood after SCFE; counsel + monitor.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MISSED KNEE PAIN — adolescent with knee pain + obesity → IMAGE HIPS; SCFE commonly diagnosed late from referred pain pattern per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOSOCIAL — body image, mobility limitation, missed school; support + counseling.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ClubFootSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "club-foot",
        title: "Club foot (talipes equinovarus)",
        subtitle: "Newborn forefoot adduction + cavus + hindfoot varus + equinus · PONSETI casting + Achilles tenotomy · brace × 4 yrs",
        nclexTags: pedsOrthoR25,
        definition: AttributedProse(
            "Congenital deformity of foot — combined forefoot adduction + cavus (high arch) + hindfoot varus + ankle equinus (\"CAVE\"). Affects ~1 in 1000 newborns; bilateral in ~50%; male predominance. Idiopathic vs syndromic (myelomeningocele, arthrogryposis). Highly treatable with PONSETI METHOD if started early per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial — genetic (family history common; HOXA9, HOXD12 mutations), neuromuscular (myelomeningocele, arthrogryposis), positional (less severe). Bony deformity + ligamentous tightness + muscle imbalance create classic CAVE position.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("CAVE — Cavus (high arch), Adduction (forefoot in), Varus (heel turned in), Equinus (foot pointed down) per primary source.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("CANNOT be passively corrected to neutral — distinguishes from positional deformity.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Affected calf often smaller; affected foot smaller.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Bilateral in ~50%; male:female 2:1.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors — family history, intrauterine constraint (oligohydramnios, multiparity), maternal smoking, neuromuscular conditions (myelomeningocele, arthrogryposis).", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL exam at birth — characteristic CAVE position; cannot dorsiflex past neutral.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ULTRASOUND prenatal — often diagnosed in 2nd trimester anatomy scan; counsel + plan.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("X-RAY — at birth limited (cartilaginous structures); useful later for evaluating treatment response.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Differentiate — positional metatarsus adductus (corrects passively), syndromic vs idiopathic (workup neuromuscular if syndromic features), congenital vertical talus.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("Differentiate idiopathic from syndromic — neurologic exam + spinal exam (myelomeningocele); musculoskeletal eval (arthrogryposis).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Family education + counseling on PONSETI method + brace requirement.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Immediate orthopedic referral — best outcomes start within first weeks of life.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("PONSETI METHOD — gold standard; serial weekly long-leg casts × 4-8 weeks correcting CAVE in sequence; final cast usually requires PERCUTANEOUS ACHILLES TENOTOMY (~80%) per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PONSETI BRACE — Foot Abduction Orthosis (FAO; \"boots + bar\") — 23 hours/day × 3 months → nighttime + naps × 4 YEARS — adherence critical to prevent recurrence.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RECURRENCE — common (~30%) without strict brace adherence; counsel families thoroughly per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ANTERIOR TIBIALIS TRANSFER (later — age 3-4 if dynamic supination); for residual deformity.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MAJOR SURGICAL RELEASE — historic; rarely needed with Ponseti; reserved for refractory / late-presenting / atypical.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PARENT EDUCATION — Ponseti brace adherence is single most important factor for long-term success.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Long-term orthopedic follow-up through adolescence — recurrence assessment.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("RECURRENCE — most common with brace non-adherence; emphasize lifelong stricter monitoring.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RESIDUAL DEFORMITY — may require additional surgery in early childhood (anterior tibialis transfer).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("LEG LENGTH discrepancy + foot SIZE difference — common, manageable.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MYELOMENINGOCELE / arthrogryposis association — neurologic eval; spine assessment in syndromic cases.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOSOCIAL — visible bracing + casting can affect parent-infant bonding; support + reassurance + foundation resources (Ponseti International).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("With proper Ponseti treatment + brace adherence, ~95% of children walk + play normally; adult activity excellent.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ScoliosisSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "scoliosis",
        title: "Idiopathic scoliosis (adolescent)",
        subtitle: "Lateral curvature ≥10° · adolescent female · screening + observation / brace / surgery by Cobb angle · pulmonary risk severe",
        nclexTags: pedsOrthoR25,
        definition: AttributedProse(
            "Lateral spinal curvature ≥10° measured on radiograph (Cobb angle). Adolescent idiopathic scoliosis (AIS) most common type — affects 2-3% of adolescents, female:male 4:1 for curves >20°. Severe scoliosis (>50°) can cause restrictive lung disease + pain in adulthood per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Idiopathic — multifactorial; genetic (family history common), hormonal, biomechanical, neurologic, growth-related. Curve progression proportional to growth + skeletal maturity (Risser stage); progresses most rapidly during pubertal growth spurt.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("Visible curvature — uneven shoulders, asymmetric scapulae, asymmetric waist, prominent rib hump on forward bending (\"Adam's forward bend test\").", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Usually ASYMPTOMATIC for mild-moderate curves; PAIN suggests other diagnosis.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("PRESENTATION — usually detected at school screening, well-child visit, or family observation.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("SEVERE (>70°) — restrictive pulmonary disease, cardiac compression (rare), back pain.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors — female, family history, peak growth period (8-15 years), idiopathic >> congenital / syndromic.", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ADAM'S FORWARD BEND TEST — patient bends forward; asymmetric rib hump = thoracic curve OR lumbar prominence.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("X-RAY (PA + lateral standing) — COBB ANGLE measurement; ≥10° = scoliosis; severity stratified.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RISSER GRADE — iliac apophyseal ossification; predicts skeletal maturity + curve progression risk.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MRI — for atypical presentation (left thoracic curve, neurologic deficits, painful scoliosis, juvenile / infantile onset, congenital anomalies); rule out tumor / syrinx.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("USPSTF (2018) — INSUFFICIENT EVIDENCE for routine screening; selective screening based on family history + risk; clinical exam at well visits per primary source.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("Cobb angle severity classification.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Skeletal maturity (Risser grade, growth velocity, menarche).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Risk of progression — depends on curve size + skeletal maturity.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Pulmonary function in severe (>50°).", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("OBSERVATION — Cobb angle <25° in skeletally immature OR <50° in skeletally mature; X-ray every 6-12 months per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BRACING (Boston, Milwaukee, Charleston) — Cobb angle 25-45° in skeletally immature; goal to PREVENT PROGRESSION (does not correct curve); 18-23 hours/day; adherence critical per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SURGICAL FUSION — Cobb angle >45-50° in skeletally immature OR progressive in skeletally mature; posterior spinal fusion + instrumentation; pedicle screw / hook constructs.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("VEPTR (Vertical Expandable Prosthetic Titanium Rib) — for skeletally immature with severe early-onset; allows continued chest growth.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EARLY-ONSET SCOLIOSIS — different management; growth-friendly implants (VEPTR, MAGEC magnetic rods).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PHYSICAL THERAPY — Schroth method + scoliosis-specific exercises (PSSE) — emerging evidence for adjunctive use.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Adolescent + family counseling + school accommodations + body image support.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("CURVE PROGRESSION — most rapid during pubertal growth spurt; close monitoring if approaching menarche.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RESTRICTIVE LUNG DISEASE — severe curves (>70°); pulmonary function decline; surgical consideration even in skeletally mature.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BRACE NON-ADHERENCE — body image + social challenges; psychological support; thermal sensors document wear.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ADULT BACK PAIN — scoliosis associated with adult back pain especially with curve >50°; surgical consideration.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PREGNANCY in scoliosis — usually well-tolerated; epidural may be challenging with surgery / instrumentation.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ATYPICAL FEATURES (left thoracic curve, painful, neurologic deficits, juvenile onset) — MRI to rule out underlying pathology.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOLOGICAL impact — body image; depression risk; counseling + support.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum JIASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "jia",
        title: "Juvenile idiopathic arthritis (JIA)",
        subtitle: "Chronic arthritis age <16 · 7 subtypes · uveitis screening · DMARDs / biologics · uveitis can blind silently",
        nclexTags: pedsImmuneR25,
        definition: AttributedProse(
            "Chronic arthritis of unknown cause beginning before age 16, persisting >6 weeks, after exclusion of other causes. Most common pediatric rheumatic disease (~1 in 1000 children). Seven ILAR subtypes — oligoarticular (most common), polyarticular RF+, polyarticular RF-, systemic (Still's disease), psoriatic, enthesitis-related, undifferentiated. Multidisciplinary care + biologics dramatically improved outcomes per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Multifactorial autoimmune — genetic (HLA-DRB1, HLA-A2) + environmental (infection, microbiome). T-cell + B-cell dysregulation → synovitis + cartilage destruction + bone erosion. Subtype-specific mechanisms — systemic JIA has more autoinflammatory features (IL-1, IL-6 mediated).",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("OLIGOARTICULAR (≤4 joints) — most common (~50%); knees, ankles most often; ANA+ → uveitis screening important; girls peak 1-3 years.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("POLYARTICULAR RF+ (≥5 joints) — adolescent girls; resembles adult RA; aggressive disease.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("POLYARTICULAR RF- — variable age + course; symmetric small + large joints.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("SYSTEMIC JIA (Still's disease) — ~10%; QUOTIDIAN FEVER (daily spiking, rapid return to normal), SALMON-PINK EVANESCENT RASH, hepatosplenomegaly, lymphadenopathy, serositis (pericarditis, pleuritis), arthritis often initially absent or oligo per primary source.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("PSORIATIC JIA — arthritis + psoriasis or psoriasis family history; nail pitting, dactylitis.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("ENTHESITIS-RELATED — adolescent boys; HLA-B27+; achilles + plantar fascia enthesitis; sacroiliitis (juvenile spondyloarthritis).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("MORNING STIFFNESS, gelling phenomenon (stiffness after rest), refusing to walk in young child, limping.", citationIDs: ["openrn_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ILAR (International League of Associations for Rheumatology) classification — based on # of joints + extra-articular features + serology + family history per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Onset age <16 years; arthritis ≥6 weeks; exclude other causes.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("LABS — CBC (anemia of chronic disease), ESR + CRP (inflammation), ANA (uveitis screening), RF, anti-CCP (RF+ subtype), HLA-B27 (enthesitis-related), ferritin (very high in systemic / MAS).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Imaging — XR for joint damage; ultrasound + MRI more sensitive for synovitis + early erosions.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("OPHTHALMOLOGY EVAL — slit lamp at diagnosis + ongoing per protocol; UVEITIS often asymptomatic but can cause blindness.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Rule out — septic arthritis, transient synovitis, Lyme, post-strep, hemarthrosis, leukemia, sickle cell, CRPS, growing pains.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("PEDIATRIC RHEUMATOLOGY referral — multidisciplinary care.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("OPHTHALMOLOGY screening for UVEITIS — chronic anterior uveitis often asymptomatic; ANA+ oligoarticular highest risk.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Functional assessment — ADLs, school participation, growth, psychosocial.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MAS screening in systemic JIA — fever, hepatosplenomegaly, dropping platelet count, HIGH ferritin, low ESR.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("NSAIDs (ibuprofen, naproxen) — first-line for symptom control; not disease-modifying.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("INTRA-ARTICULAR steroid injection — oligoarticular; rapid + sustained relief.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("METHOTREXATE — first-line DMARD for polyarticular + persistent oligoarticular per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BIOLOGICS — TNF inhibitors (etanercept, adalimumab, infliximab) for refractory; IL-6 (tocilizumab) for systemic; IL-1 (anakinra, canakinumab) for systemic; JAK inhibitors (tofacitinib) emerging.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SYSTEMIC JIA — IL-1 / IL-6 biologics + corticosteroids for severe; AVOID NSAIDs alone (insufficient).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("UVEITIS — topical steroids + cycloplegics; methotrexate + biologics for refractory; OPHTHALMOLOGY long-term.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PT / OT — maintain ROM, function, ADLs.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOSOCIAL support — chronic illness, body image, school accommodations, transition to adult care.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("VACCINATION — keep up-to-date BEFORE biologic initiation; live vaccines AVOID on biologics.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BONE HEALTH — vitamin D + calcium; DEXA in selected; bisphosphonate for osteoporosis.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("UVEITIS — chronic anterior uveitis often ASYMPTOMATIC; can cause cataract, glaucoma, blindness; SCREEN routinely per ACR / AAO protocol per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MACROPHAGE ACTIVATION SYNDROME (MAS) in systemic JIA — life-threatening; features fever, hepatosplenomegaly, dropping platelets, very HIGH ferritin (often >10,000), low ESR; emergent treatment with steroids + anakinra; specialty.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("GROWTH DISTURBANCES — limb length discrepancy from chronic synovitis (overgrowth or undergrowth); micrognathia; growth retardation from chronic disease + steroids.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("INFECTIONS on IMMUNOSUPPRESSION — counsel + monitor; live vaccine avoidance.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CARDIAC complications systemic — pericarditis, myocarditis; echo screening.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("TRANSITION to ADULT rheumatology care — important developmental task; counsel + plan.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FebrileSeizureSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "febrile-seizure",
        title: "Febrile seizure",
        subtitle: "Age 6 mo - 5 yr · simple vs complex · benign typically · NO chronic AED · counsel parents · low epilepsy risk",
        nclexTags: pedsNeuroR25,
        definition: AttributedProse(
            "Seizure in pediatric age 6 months - 5 years associated with fever (≥38°C / 100.4°F) WITHOUT CNS infection, metabolic derangement, prior afebrile seizure history. Affects 2-5% of children; SIMPLE (~80% — generalized, <15 min, single in 24 hrs) typically benign + low recurrence; COMPLEX (focal, >15 min, ≥2 in 24 hrs) higher risk per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Genetic predisposition (familial; ~25-40% have family history) + immature CNS susceptibility to fever-induced seizures. Triggers — viral infections most common (HHV-6, influenza), bacterial illness, post-vaccination fever (especially MMR + DTaP). Underlying mechanism — fever lowers seizure threshold in genetically susceptible CNS.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("AGE 6 months - 5 years (peak 12-18 months).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("FEVER ≥38°C / 100.4°F — often early in illness, may be detected only after seizure.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("SIMPLE FEBRILE SEIZURE — generalized tonic-clonic, <15 minutes, single in 24-hour period; ~80% of febrile seizures.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("COMPLEX FEBRILE SEIZURE — focal features, OR >15 minutes, OR ≥2 in 24 hours; ~20%.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("FEBRILE STATUS EPILEPTICUS — >30 minutes (subset of complex); higher epilepsy risk + neurologic injury.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors — family history of febrile seizures, recent vaccination (MMR, DTaP), high fever (rate of rise > absolute temperature).", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis based on age + fever + seizure characteristics WITHOUT CNS infection / metabolic cause / prior afebrile seizure.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("LP — NOT routine for simple febrile seizure if alert + interactive + 6-12 months OR ≥12 months WITHOUT meningismus per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("LP indicated — meningeal signs, prolonged seizure / unrecovered consciousness, age 6-12 months without immunizations (Hib + pneumococcal), recent antibiotics (could mask meningitis), complex features.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BLOOD TESTS — only as indicated for fever workup, NOT for seizure itself.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EEG — NOT routinely; consider for complex / atypical / status / focal features.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("NEUROIMAGING — NOT routinely; consider for prolonged focal / status / persistent deficit.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("RECOGNITION + classification (simple vs complex).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Identify FEVER SOURCE — viral URI most common; CBC + UA + cultures per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Rule out CNS infection — meningismus, persistent altered mental status; LP if indicated.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Parent education + reassurance — most important component; counsel realistic risks.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("ACUTE SEIZURE — supportive care; protect airway; do NOT restrain; turn to side; monitor; usually self-limited.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("STATUS EPILEPTICUS (>5 min) — IV / IM / IN benzodiazepine (lorazepam 0.05-0.1 mg/kg IV; midazolam 0.2 mg/kg IM/IN) per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FEVER MANAGEMENT — acetaminophen 15 mg/kg PO/PR q4-6h OR ibuprofen 10 mg/kg PO q6h; counsel families that ANTIPYRETICS DO NOT PREVENT recurrence per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("NO CHRONIC AED for SIMPLE febrile seizure — risks outweigh benefits.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("INTERMITTENT diazepam (0.33 mg/kg q8h × 48 hrs at fever onset) — selected high-recurrence risk; NOT routine.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RESCUE meds for prolonged — diazepam rectal gel (Diastat) for known recurrent / prolonged seizures.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PARENT COUNSELING — recurrence in 30%; epilepsy risk only slightly elevated above baseline (~1-2% vs 0.5-1%); benign condition; vaccinations should continue (do not delay due to febrile seizure history).", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("EPILEPSY — slightly increased risk over background (1-2% vs 0.5-1%); higher with complex / status / family history of epilepsy / pre-existing neuro disease.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RECURRENT febrile seizure — 30% of children; higher with younger age at first, lower temperature threshold, family history.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("DRAVET SYNDROME — severe myoclonic epilepsy of infancy; often presents with febrile status epilepticus; SCN1A mutation; specialty referral if recurrent prolonged febrile seizures.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MENINGITIS — vigilantly excluded in young / unimmunized / persistent altered mental status.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PARENTAL ANXIETY — addressed thoroughly; many parents fear cardiac arrest / brain damage; reassurance.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CONTINUE VACCINATIONS — fever from MMR / DTaP can trigger febrile seizure; benefits of vaccination FAR outweigh; no delay needed per primary source.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum VSDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "vsd",
        title: "Ventricular septal defect (VSD)",
        subtitle: "Most common congenital cardiac · holosystolic murmur LLSB · small often closes spontaneously · large = HF + Eisenmenger risk",
        nclexTags: pedsCardR25,
        definition: AttributedProse(
            "Congenital opening between right + left ventricles; most common congenital cardiac defect (~30-40% of CHDs); ~50% close spontaneously by age 2 if small. Severity varies — small (asymptomatic) to large (heart failure, pulmonary hypertension, Eisenmenger syndrome if untreated) per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Communication between LV + RV → left-to-right shunt (from higher LV pressure to lower RV pressure) → increased pulmonary blood flow → pulmonary edema, HF if large; chronic shunt → pulmonary vascular remodeling → eventually pulmonary HTN + reversal to right-to-left shunt (Eisenmenger physiology) if untreated. Subtypes by location — perimembranous (most common), muscular, inlet (AVSD-related), outlet (subpulmonary).",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("SMALL VSD — asymptomatic; loud holosystolic murmur at LLSB; thrill possible; often spontaneously closes.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("MODERATE VSD — fatigue, dyspnea on exertion, sweating with feeding (infants), poor weight gain, FTT, frequent respiratory infections.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("LARGE VSD — congestive heart failure (tachypnea, hepatomegaly, edema), poor feeding, FTT, recurrent pneumonia.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("HOLOSYSTOLIC MURMUR at LLSB — pathognomonic; intensity inversely correlates with VSD size (larger VSD → softer murmur due to less pressure gradient).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("LATE — Eisenmenger physiology — cyanosis, clubbing, polycythemia; irreversible pulmonary HTN.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors / associations — Down syndrome, fetal alcohol syndrome, maternal diabetes, family history, other CHDs.", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECHOCARDIOGRAM — gold standard; visualizes defect + size + shunt direction + pulmonary pressures + ventricular function per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ECG — normal in small; LVH ± RVH in large; right axis deviation in pulmonary HTN.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CXR — normal in small; cardiomegaly + increased pulmonary vascular markings in moderate-large.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CARDIAC CATHETERIZATION — for hemodynamic assessment + interventional closure.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Newborn pulse ox screening — does NOT detect VSD (acyanotic).", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("VSD size + location + hemodynamic significance.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Heart failure assessment — feeding, weight gain, growth, work of breathing.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Pulmonary HTN risk — serial echocardiograms.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Other associated cardiac defects + syndromes.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("SMALL VSD — observe for spontaneous closure; serial echo; ~50% close by age 2; no treatment needed unless complications per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("HF MANAGEMENT for moderate-large — diuretics (furosemide), ACE inhibitor (captopril, enalapril), digoxin (selective use), high-calorie feeds, fortified breast milk / formula.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SURGICAL CLOSURE — large VSD with HF / FTT despite medical management OR pulmonary HTN risk OR persistent significant shunt; usually before age 1-2; cardiopulmonary bypass; patch closure.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PERCUTANEOUS DEVICE CLOSURE — selected muscular VSDs; less commonly for membranous (heart block risk).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SBE PROPHYLAXIS — only for first 6 months after surgical / device closure with residual defect; per AHA guidelines.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EISENMENGER (irreversible pulmonary HTN) — generally inoperable; pulmonary vasodilators (sildenafil, bosentan); heart-lung transplant for end-stage; prevention through timely closure essential.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Multidisciplinary — pediatric cardiology, pediatric cardiac surgery, nutrition, NP, social work.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("HEART FAILURE — large VSDs in infancy; aggressive medical management → surgical closure.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PULMONARY HTN → EISENMENGER — preventable with timely closure; once developed, irreversible + life-threatening.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("INFECTIVE ENDOCARDITIS — small VSD doesn't always require prophylaxis per AHA 2007; consult.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("AORTIC INSUFFICIENCY — supracristal / outlet VSDs; aortic valve prolapse + regurgitation; surgical timing.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FAILURE TO THRIVE — severe in untreated large VSD; nutritional support + surgical timing.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RESIDUAL VSD post-closure — usually small + benign; serial echo.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Adult survivors of repaired VSD — generally normal lives; transition to adult congenital cardiology.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum ASDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "asd",
        title: "Atrial septal defect (ASD)",
        subtitle: "Communication between atria · soft systolic murmur + WIDE FIXED SPLIT S2 · ostium secundum most common · device or surgical closure",
        nclexTags: pedsCardR25,
        definition: AttributedProse(
            "Communication between left + right atria — congenital opening in atrial septum. ~6-10% of CHDs. Subtypes — ostium secundum (most common, ~75%), ostium primum (associated with AV septal defects, Down syndrome), sinus venosus, coronary sinus. Often clinically silent in childhood; presents in adulthood with right-sided HF, atrial arrhythmias, paradoxical embolus per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Left atrium → right atrium shunt (left-to-right) → increased right heart + pulmonary blood flow → progressive RV dilation, RA dilation, atrial fibrillation; pulmonary HTN slowly develops over decades; rarely Eisenmenger reversal in 4th-5th decade.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("CHILDHOOD — usually asymptomatic; soft systolic ejection murmur at upper LSB (increased pulmonary flow); WIDE FIXED SPLIT S2 (pathognomonic) — splitting does not vary with respiration per primary source.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("ADULT — exercise intolerance, palpitations, atrial fibrillation, right-sided HF, paradoxical embolus / stroke; pulmonary HTN.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("FAILURE TO THRIVE in large defects, FREQUENT respiratory infections.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("OSTIUM PRIMUM — often with AVSD + Down syndrome; cleft mitral valve; complete AV septal defect features.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors — Down syndrome, Holt-Oram syndrome (ASD + upper limb defects), fetal alcohol syndrome, maternal rubella, family history.", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("ECHOCARDIOGRAM — gold standard; transthoracic vs transesophageal for better visualization; defect size + location + shunt direction + pulmonary pressures.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ECG — RIGHT BUNDLE BRANCH BLOCK (RBBB), right axis deviation, RA / RV enlargement.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CXR — cardiomegaly + increased pulmonary vascularity (pulmonary plethora).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CARDIAC CATHETERIZATION — for adult evaluation, hemodynamic assessment, intervention.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BUBBLE STUDY (saline contrast echo) — confirms shunt + paradoxical embolus risk.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("ASD type + size + hemodynamic significance.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Right heart function + pulmonary pressures.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Atrial arrhythmia + paradoxical embolus risk.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Associated cardiac + syndromic features.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("SMALL ASD (<5 mm) — observe; many close spontaneously in childhood; no closure needed.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MODERATE-LARGE ASD with hemodynamic significance — closure recommended in childhood or adulthood per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PERCUTANEOUS DEVICE CLOSURE — for ostium secundum with adequate rims; outpatient procedure; first-line when feasible.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SURGICAL CLOSURE — primary repair OR patch; for primum / sinus venosus / coronary sinus types; cardiopulmonary bypass.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("AVSD repair — complex surgery for ostium primum + AV valve repair; pediatric cardiac surgery.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ATRIAL FIBRILLATION — anticoagulation, rate / rhythm control; ASD closure may reduce recurrence.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PULMONARY HTN — pulmonary vasodilators if irreversible; treatment vs closure decision based on PVR.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SBE PROPHYLAXIS — generally NOT needed for ASD per current AHA; selective for first 6 months post-closure with residual defect.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("ATRIAL FIBRILLATION — increases with age + RA dilation; CHADS-VASc + anticoagulation; closure may reduce burden.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PARADOXICAL EMBOLUS / cryptogenic stroke — ASD increases risk; bubble study confirms; closure for selected cryptogenic stroke (RoPE score).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PULMONARY HTN → EISENMENGER — slowly develops; serial echo.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RIGHT HEART FAILURE in adult — exercise intolerance, peripheral edema, hepatic congestion.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ADULT presentation — many adults newly diagnosed with ASD; closure benefits at almost any age (with normal pulmonary pressures).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PREGNANCY — usually well-tolerated even with unrepaired moderate ASD; close cardiology follow-up; avoid large defects with pulmonary HTN.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum HSPSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "henoch-schonlein-purpura",
        title: "Henoch-Schönlein purpura (IgA vasculitis)",
        subtitle: "Pediatric IgA-mediated small vessel vasculitis · purpura + abdominal pain + arthralgia + nephritis · supportive · monitor renal × 6 mo",
        nclexTags: pedsImmuneR25,
        definition: AttributedProse(
            "Most common pediatric systemic vasculitis — IgA immune complex-mediated small vessel vasculitis. Classic tetrad — palpable purpura (lower extremities + buttocks, NON-thrombocytopenic), abdominal pain, arthralgia / arthritis, renal involvement. Affects ~10-20 / 100,000 children; typically age 3-10; usually preceded by URI per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "IgA immune complex deposition in small vessels → leukocytoclastic vasculitis. Triggered by — preceding URI (most common; group A strep, viral), drugs, vaccines, malignancy. IgA1 with abnormal galactosylation; complement activation; small vessel inflammation in skin, gut, joints, kidney.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("PALPABLE PURPURA on dependent areas (LOWER EXTREMITIES + BUTTOCKS) — non-thrombocytopenic; cardinal feature; develops over hours-days.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("ABDOMINAL PAIN (~60-80%) — colicky, severe; can mimic surgical abdomen; intussusception risk (ileo-ileal more than ileo-colic).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("ARTHRALGIA / ARTHRITIS (~70-80%) — knees, ankles; transient; non-erosive.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("RENAL involvement (~30-50%) — hematuria, proteinuria, sometimes nephrotic / nephritic syndrome; develops over weeks; usually transient but persistent in ~5%.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Other — orchitis, scrotal edema, GI bleed, intussusception, uncommon CNS / pulmonary involvement.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Preceding URI in 1-3 weeks before onset (~50-90%).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors — age 3-10 years, recent URI, male:female 1.5:1, fall / winter peaks.", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("EULAR / PReS / PRINTO 2008 — palpable purpura + at least 1 of (abdominal pain, IgA on biopsy, arthralgia/arthritis, renal involvement) per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CLINICAL diagnosis based on tetrad; biopsy not usually required.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("LABS — CBC (NORMAL platelet count — distinguishes from ITP), BUN/Cr, urinalysis (hematuria + proteinuria), inflammatory markers (ESR, CRP), strep throat culture if recent URI.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BIOPSY — if atypical; skin (leukocytoclastic vasculitis with IgA deposits) or kidney (mesangial IgA — similar to IgA nephropathy).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Imaging — abdominal ultrasound for intussusception if severe abdominal pain.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Differentiate — ITP (low platelets), meningococcemia (toxic + petechial), Kawasaki disease (different criteria), other vasculitides, child abuse (purpura distribution).", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("Hemodynamic stability + vital signs.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Abdominal exam — surgical abdomen, intussusception.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Renal — urinalysis at presentation + serial; BP monitoring.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Skin distribution + character of rash.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("SUPPORTIVE care — most cases self-limited; resolve in 4-6 weeks per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PAIN control — acetaminophen, ibuprofen for arthralgia + mild abdominal pain.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ORAL CORTICOSTEROIDS (prednisone 1-2 mg/kg/day × 1-2 weeks then taper) — for severe abdominal pain, severe orchitis, severe arthritis, possibly significant renal disease per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("HYDRATION + monitoring; admit for severe abdominal pain, GI bleeding, intussusception, severe renal disease.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RENAL INVOLVEMENT — most resolves spontaneously; severe (nephrotic / nephritic / RPGN) → cyclophosphamide / azathioprine / MMF + steroids; specialty nephrology.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("INTUSSUSCEPTION — air enema reduction; surgical if failed.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FOLLOW-UP urinalysis + BP × 6 MONTHS to detect persistent renal involvement per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Counsel families — usually benign self-limited; small risk of long-term renal disease (~5%); follow-up essential.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("HSP NEPHRITIS — most concerning long-term; ~5% develop CKD; URINALYSIS + BP every 1-2 weeks × 6 months per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("INTUSSUSCEPTION — ileo-ileal (atypical location); abdominal ultrasound if concerning abdominal pain; air or contrast enema reduction.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("GI BLEEDING — usually mild; rare significant; monitor.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RECURRENCE in 30% — usually milder; reassure.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PROGRESSIVE RENAL DISEASE — adult HSP / IgA nephropathy ENRICHED for renal involvement vs pediatric.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ORCHITIS — testicular pain + swelling; counsel; usually self-limited; rule out testicular torsion.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum MarfanSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "marfan-syndrome",
        title: "Marfan syndrome",
        subtitle: "Connective tissue · FBN1 mutation · tall + arm span > height + arachnodactyly · AORTIC ROOT DILATION → DISSECTION · echo + ophth + ortho",
        nclexTags: pedsGeneticR25,
        definition: AttributedProse(
            "Autosomal dominant connective tissue disorder caused by FBN1 mutation (fibrillin-1); affects skeletal, ocular, cardiovascular, pulmonary, dural, skin systems. ~1 in 5,000 incidence; AORTIC ROOT DILATION → AORTIC DISSECTION is the most life-threatening complication. Multidisciplinary care + β-blocker + ARB + activity modification + surgical aortic root replacement when indicated have transformed life expectancy per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "FBN1 mutation → defective fibrillin-1 → abnormal microfibril assembly + increased TGF-β signaling → connective tissue weakness. Cardiovascular — aortic root dilation + dissection, mitral valve prolapse / regurgitation. Skeletal — bone overgrowth + ligamentous laxity. Ocular — lens subluxation. Pulmonary — pneumothorax, blebs. Dural — dural ectasia.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("SKELETAL — tall stature, ARM SPAN > HEIGHT, ARACHNODACTYLY (long fingers — Steinberg + Walker-Murdoch signs), pectus excavatum / carinatum, scoliosis, joint hypermobility, high-arched palate, dental crowding.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("OCULAR — LENS SUBLUXATION (ectopia lentis — typically upward) ~60%, myopia, retinal detachment, glaucoma, cataracts.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("CARDIOVASCULAR — AORTIC ROOT DILATION (~80% of adults; progressive), aortic regurgitation, aortic dissection (life-threatening), MITRAL VALVE PROLAPSE / regurgitation, dilated cardiomyopathy.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("PULMONARY — spontaneous pneumothorax (~10%), pulmonary blebs.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("DURAL ECTASIA (~75%) — back pain, lower extremity numbness; MRI confirms.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("SKIN — striae atrophicae unrelated to weight changes, hernias.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("FAMILY HISTORY — autosomal dominant; ~25% are de novo mutations.", citationIDs: ["openrn_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("REVISED GHENT NOSOLOGY 2010 — combination of aortic root dilation, ectopia lentis, FBN1 mutation, family history, systemic score per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ECHOCARDIOGRAM — aortic root + ascending aortic dimensions; mitral valve.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("OPHTHALMOLOGY — slit lamp for ectopia lentis; dilated fundoscopy.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MRI — dural ectasia.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Genetic testing — FBN1 sequencing; counsels at-risk family members.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Differentiate — Loeys-Dietz syndrome (TGFBR1/2 mutations; similar phenotype but more aggressive aortic disease), Ehlers-Danlos vascular type (COL3A1), Marfanoid habitus without Marfan, MEN 2B, homocystinuria (lens subluxation typically downward).", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("AORTIC ROOT dimension at diagnosis + serial echo q6-12 months.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("OPHTHALMOLOGY referral + annual follow-up.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FAMILY screening — first-degree relatives — echo + ophthalmology + genetics.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ACTIVITY restriction + cardiac surveillance + transition to adult care planning.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("β-BLOCKERS (atenolol, propranolol) — slow aortic root dilation; lifelong; standard of care per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ARBs (losartan) — alternative or addition; slow dilation; ongoing trials.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ACTIVITY RESTRICTION — AVOID isometric / contact / collision sports + heavy weightlifting + Valsalva activities; AEROBIC moderate-intensity OK; counsel + family education per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SURGICAL AORTIC ROOT REPLACEMENT — when aortic root reaches ~5.0 cm in adults (or 4.5 cm with risk factors); David valve-sparing OR mechanical / bioprosthetic root replacement.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EMERGENT REPAIR for type A AORTIC DISSECTION — high mortality without rapid surgery.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MITRAL VALVE repair / replacement for severe regurgitation.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("OPHTHALMOLOGY — ectopia lentis + retinal detachment monitoring; spectacles / contact lenses; cataract surgery.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ORTHOPEDICS — scoliosis, pectus, joint laxity; bracing + surgery as needed.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PNEUMOTHORAX — chest tube; pleurodesis for recurrent.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PREGNANCY — high-risk (aortic dissection); MFM + cardiology; consider closure of aortic root before pregnancy if marginal; counseling.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("GENETIC COUNSELING — autosomal dominant; family screening; preimplantation diagnosis available.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("AORTIC DISSECTION — life-threatening; classic tearing chest / back pain; widened mediastinum; emergent surgical repair; MORTALITY high without rapid intervention per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PROGRESSIVE AORTIC DILATION — serial echo + protected activity; β-blocker + ARB; surgical replacement at threshold.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PNEUMOTHORAX — sudden chest pain + dyspnea; recurrent; pleurodesis.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RETINAL DETACHMENT + GLAUCOMA + cataract — annual ophthalmology; emergent eval for sudden vision change.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PREGNANCY — high risk for aortic catastrophe; pre-pregnancy counseling + planned aortic surgery for marginal aortas; intensive obstetric + cardiac monitoring.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOSOCIAL — chronic illness, activity restrictions, body image, family planning; adolescent + young adult support.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FAMILY screening — autosomal dominant; affected relatives + de novo mutation considerations; genetic counseling.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum TurnerSyndromeSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "turner-syndrome",
        title: "Turner syndrome (45,X)",
        subtitle: "Female · short stature + ovarian failure + webbed neck · COARCTATION + bicuspid AV · GH + estrogen replacement · multidisciplinary care",
        nclexTags: pedsGeneticR25,
        definition: AttributedProse(
            "Chromosomal disorder — partial or complete absence of one X chromosome (45,X most common; mosaic variants 45,X/46,XX). Affects ~1 in 2500 live female births. Characteristic features — short stature, ovarian failure, webbed neck, lymphedema, congenital cardiac (~50% — coarctation, bicuspid AV), endocrine, renal, autoimmune, learning disabilities. Multidisciplinary care + GH + estrogen replacement transform outcomes per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Loss or partial deletion of one X chromosome → haploinsufficiency of X-linked genes that escape X-inactivation (especially SHOX gene → short stature; KDM6A → cardiac development); ovarian dysgenesis with primordial follicle apoptosis → primary ovarian insufficiency.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("SHORT STATURE — universal; ~20 cm below mid-parental height predictions; SHOX-mediated.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("OVARIAN FAILURE — primary amenorrhea, lack of secondary sexual development; some retain ovarian function (mosaic).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("FACIAL FEATURES — broad forehead, high arched palate, low-set ears, ptosis, micrognathia.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("NECK — WEBBED NECK (pterygium colli), low posterior hairline, short neck.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("CHEST — broad shield chest, widely spaced nipples, possible pectus.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("EXTREMITIES — Madelung deformity (short arms), cubitus valgus (increased carrying angle), short 4th metacarpal, lymphedema (NEONATE — puffy hands + feet).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("CARDIAC (~50%) — bicuspid aortic valve (~30%), coarctation of aorta (~10%), aortic dilation (life-threatening — like Marfan).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("RENAL (~30%) — horseshoe kidney, duplicated collecting system.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("ENDOCRINE — DIABETES (T2DM higher risk), HASHIMOTO thyroiditis (~30%), osteoporosis (post-menopause).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("LEARNING — normal IQ but specific cognitive deficits (visuospatial, math).", citationIDs: ["openrn_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("KARYOTYPE — 45,X (50%) OR mosaic (45,X/46,XX or other variants — 50%) per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PRENATAL DIAGNOSIS — increased nuchal translucency on first-trimester US, hydrops fetalis, cystic hygroma, structural anomalies → NIPT / amniocentesis / CVS for confirmation.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("POSTNATAL DIAGNOSIS — distinguishing features in newborn (lymphedema, webbed neck) → karyotype.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("DELAYED DIAGNOSIS common — short stature + amenorrhea / primary ovarian failure → chromosomal eval.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FSH / LH elevated post-puberty (primary ovarian insufficiency); estradiol low.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("CARDIAC eval — echo at diagnosis + cardiac MRI; serial monitoring for aortic dilation.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("RENAL ultrasound + screening at diagnosis.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ENDOCRINE — TSH, glucose annually; thyroid antibodies.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("AUDIOLOGY — recurrent otitis + sensorineural hearing loss; serial testing.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("DEVELOPMENTAL + EDUCATIONAL eval; specific learning disabilities.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("GROWTH HORMONE — early initiation (typically age 4-6) improves final adult height by ~5-10 cm; continued through puberty per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ESTROGEN REPLACEMENT — initiate around age 11-12 to allow pubertal development + bone health; transdermal estradiol preferred; add progesterone post-menarche; continue until typical menopausal age per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CARDIAC management — β-blocker + ARB for aortic dilation (similar to Marfan); surgical aortic repair for severe aortic dilation; coarctation repair when indicated.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("THYROID — Hashimoto common; levothyroxine for hypothyroidism.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("DIABETES — diet + exercise + metformin or insulin per type.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BONE HEALTH — calcium + vitamin D; estrogen essential; DEXA periodically.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOLOGICAL + EDUCATIONAL support — learning disabilities, social skills, body image; specialty.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FERTILITY — natural pregnancy rare; oocyte donation common; high-risk pregnancy due to aortic dissection — pre-pregnancy cardiac eval mandatory; some recommend AGAINST pregnancy in patients with cardiac risk per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MULTIDISCIPLINARY clinic — pediatric endocrinology, cardiology, gynecology, genetics, audiology, ophthalmology, mental health.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("AORTIC DISSECTION — major cause of mortality in adult Turner; serial monitoring; pregnancy particularly high risk per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("INFERTILITY — primary ovarian failure; counsel + reproductive options (oocyte donation); preimplantation considerations.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("AUTOIMMUNE — Hashimoto, T1DM, celiac, IBD; screen periodically.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("OSTEOPOROSIS post-estrogen — lifelong estrogen replacement until natural menopause age; calcium / vitamin D / DEXA.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOLOGICAL — body image, fertility loss, learning differences; ongoing support.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("HEARING LOSS — recurrent otitis in childhood; sensorineural in adulthood; serial audiology.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Y-CHROMOSOMAL MOSAICISM — increased gonadoblastoma risk; consider gonadectomy; specialty.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum FASDSample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "fetal-alcohol-spectrum-disorder",
        title: "Fetal alcohol spectrum disorder (FASD)",
        subtitle: "PRENATAL ALCOHOL exposure · spectrum FAS / pFAS / ARND · facial features + growth + neurodevelopmental · 100% PREVENTABLE",
        nclexTags: pedsNeuroR25,
        definition: AttributedProse(
            "Spectrum of conditions caused by prenatal alcohol exposure — fetal alcohol syndrome (FAS — most severe), partial FAS (pFAS), alcohol-related neurodevelopmental disorder (ARND), alcohol-related birth defects (ARBD). Affects up to 1-5% of US live births (likely underdiagnosed). 100% PREVENTABLE through abstinence in pregnancy. Lifelong neurodevelopmental disability + secondary disabilities per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Alcohol freely crosses placenta → direct teratogenic effect on developing fetal CNS + craniofacial structures + organs. Mechanisms — neuronal apoptosis, oxidative stress, growth factor disruption, stem cell damage. Severity depends on TIMING (1st trimester for facial features + organ defects; 3rd trimester for brain growth), QUANTITY, PATTERN (binge worse than chronic low-level), maternal genetics, nutrition. NO SAFE AMOUNT identified.",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("CLASSIC FAS (most severe) — characteristic FACIAL FEATURES + GROWTH RESTRICTION + CNS abnormalities + prenatal alcohol exposure history per primary source.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("FACIAL FEATURES — short palpebral fissures, smooth philtrum, thin upper lip vermilion border, midface flattening; subtle in older children + may resolve.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("GROWTH RESTRICTION — birth weight + length + head circumference <10th percentile; persistent into childhood.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("CNS ABNORMALITIES — microcephaly, intellectual disability (mean IQ ~70), learning disabilities, ADHD-like, executive dysfunction, behavioral problems, autism spectrum overlap.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("CONGENITAL DEFECTS — cardiac (VSD, ASD), skeletal, renal, ocular (strabismus, ptosis).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("PARTIAL FAS / ARND — some features without full criteria; behavioral / cognitive impairments dominate.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("SECONDARY disabilities — mental health (depression, anxiety, addiction), legal problems, school failure, employment difficulties; preventable with early intervention.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors — maternal alcohol use disorder, low SES, isolated maternal social network, cultural acceptability of drinking, lack of prenatal care.", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("CLINICAL diagnosis — multidisciplinary team; IOM (Institute of Medicine) criteria — facial features, growth, CNS, alcohol exposure history per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FASD 4-DIGIT diagnostic code — assesses 4 domains (growth, face, CNS, alcohol exposure) on 4-point Likert scale.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("DEVELOPMENTAL evaluation — IQ, executive function, behavior, adaptive skills.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Imaging — MRI may show microcephaly, corpus callosum abnormalities.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Differentiate — Fragile X, autism, ADHD without FASD, lead poisoning, malnutrition, other genetic syndromes (Williams, Noonan).", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Prenatal alcohol exposure — sometimes unknown / undisclosed; CDC criteria can be met without confirmed exposure if other features present.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("Early identification + multidisciplinary diagnosis.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Developmental evaluation + early intervention referral.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Educational planning + IEP / 504 plan.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Family + caregiver support; siblings may also have FASD if maternal use ongoing.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("PREVENTION — alcohol abstinence in pregnancy; ALL pregnant + planning-pregnancy women counseled on NO SAFE AMOUNT per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EARLY INTERVENTION — birth-3 services for developmental delays; school-age special education + IEP / 504.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MULTIDISCIPLINARY CARE — developmental pediatrics, child psychiatry, OT / PT / SLP, neurology, geneticists, social work.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOSTIMULANT for ADHD-like — may help inattention but variable response; trial cautiously.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BEHAVIORAL INTERVENTIONS — structured environment, predictable routines, simplified instructions, visual aids, FASD-trained therapists.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ADAPTIVE skills training — life skills, vocational training, supported employment.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MATERNAL TREATMENT — for ongoing AUD; protect siblings + future pregnancies; SUD treatment + abstinence support; long-acting injectable contraception during recovery.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CAREGIVER + family support — high stress; respite; FASD support groups.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SECONDARY DISABILITY PREVENTION — early diagnosis + supportive environment + interventions reduce mental health, legal, school failure outcomes per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Transition planning — adult care, supported living, vocational, financial.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("INTELLECTUAL + LEARNING DISABILITIES — lifelong; appropriate educational + vocational support.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MENTAL HEALTH comorbidities — depression, anxiety, ADHD, substance use disorder; integrated treatment.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("LEGAL problems — disinhibition + poor judgment + substance abuse; prevention through structure + supervision.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EDUCATIONAL FAILURE — early intervention + IEP / 504 + behavioral support reduces.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("EMPLOYMENT difficulties — supported employment + vocational rehab.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PREMATURE MORTALITY — accidents, suicide, substance overdose; ongoing support + monitoring.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("MATERNAL CONTINUED ALCOHOL USE → FUTURE PREGNANCIES affected; SUD treatment + LARC contraception during recovery.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("STIGMA — counsel families compassionately; mother often did not know about pregnancy when drinking; 100% preventable through prevention messaging not blame.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricFBASample {
    public static let entry: DiagnosisEntry = DiagnosisEntry(
        id: "pediatric-foreign-body-aspiration",
        title: "Pediatric foreign body aspiration",
        subtitle: "Toddler · sudden choking + cough + wheeze · partial vs complete obstruction · BRONCHOSCOPY emergent if airway compromise · prevent",
        nclexTags: pedsRespR25,
        definition: AttributedProse(
            "Inhalation of foreign material into respiratory tract — most commonly food (peanuts, hot dogs, grapes, hard candy) or small toys / objects in toddlers (peak 1-3 years). Major cause of accidental death in young children. PARTIAL obstruction → cough, wheeze, possible delayed presentation. COMPLETE obstruction → silent choking → cardiopulmonary arrest if not relieved per primary source.",
            citationIDs: ["specialty_dx_round25", "openrn_dx_round25"]
        ),
        pathophysiology: AttributedProse(
            "Foreign body lodges in airway — most commonly RIGHT MAIN BRONCHUS (more vertical course) in older children + adults; varies in toddlers. Causes — partial obstruction (air can pass with effort + check-valve effect), complete obstruction (airway emergency), or delayed presentation (post-obstructive pneumonia, atelectasis, recurrent infections).",
            citationIDs: ["specialty_dx_round25"]
        ),
        presentation: [
            AttributedBullet("CLASSIC TRIAD — sudden choking, cough, wheeze in TODDLER WITHOUT URI symptoms.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Choking history — caregiver may witness; child eating / playing with small object.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("PARTIAL OBSTRUCTION — cough, wheeze (often unilateral on auscultation), stridor (upper airway), decreased breath sounds, hyperinflation on imaging (check-valve).", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("COMPLETE OBSTRUCTION — silent (cannot make sound), respiratory distress, cyanosis, loss of consciousness; AIRWAY EMERGENCY.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("DELAYED PRESENTATION (days-weeks) — recurrent pneumonia in same lung region, persistent cough, post-obstructive atelectasis or hyperinflation.", citationIDs: ["openrn_dx_round25"]),
            AttributedBullet("Risk factors — age 1-3 years (peak), small objects accessible, eating while running / playing, foods high-risk for aspiration (peanuts, hot dogs, grapes, hard candy, popcorn, raw carrots).", citationIDs: ["specialty_dx_round25"])
        ],
        diagnosticCriteria: [
            AttributedBullet("HISTORY — witnessed choking event highly suggestive even with current normal exam.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PHYSICAL EXAM — unilateral wheeze, decreased breath sounds, hyperinflation; can be NORMAL.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CXR — INSPIRATORY + EXPIRATORY views OR LATERAL DECUBITUS (younger); look for hyperinflation (check-valve), atelectasis, mediastinal shift, focal consolidation; only ~20% radiopaque (most foreign bodies invisible) per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CT chest — for atypical presentations + delayed diagnosis + complications.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BRONCHOSCOPY — definitive diagnosis + treatment; rigid bronchoscopy with general anesthesia for removal.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Differentiate — asthma exacerbation, pneumonia, croup, viral URI; HIGH index of suspicion for FB based on history.", citationIDs: ["specialty_dx_round25"])
        ],
        priorityAssessments: [
            AttributedBullet("ABCs — airway patency + adequacy of breathing.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Severity of obstruction — partial vs complete.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Hemodynamic stability + oxygenation.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("Witnessed choking + history of swallowed object.", citationIDs: ["specialty_dx_round25"])
        ],
        commonInterventions: [
            AttributedBullet("COMPLETE OBSTRUCTION (silent + cannot breathe / cough) — IMMEDIATE BLS algorithm — back blows + abdominal thrusts (children >1 year) OR chest compressions (infants); CPR if unconscious; CALL FOR HELP per AHA guidelines per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PARTIAL OBSTRUCTION + ABLE TO COUGH — encourage coughing, do NOT do back blows / abdominal thrusts (may dislodge to complete); transport to ER.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BRONCHOSCOPY — emergent rigid bronchoscopy by ENT or pulmonology; under general anesthesia; first-line for foreign body removal.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("FLEXIBLE BRONCHOSCOPY — diagnostic + small distal foreign bodies; often used to confirm before rigid for retrieval.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("ANTIBIOTICS — for post-obstructive pneumonia after object removal; broad-spectrum then targeted.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BRONCHODILATORS, STEROIDS — for residual airway inflammation.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CHEST PHYSIOTHERAPY post-removal.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PREVENTION counseling — keep small objects out of toddler reach; supervise eating; AVOID high-risk foods (peanuts, hot dogs, grapes whole, hard candy, popcorn) in age <3-4 per AAP per primary source.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("CPR + CHOKING PREVENTION TRAINING for caregivers + childcare providers.", citationIDs: ["specialty_dx_round25"])
        ],
        watchFor: [
            AttributedBullet("CARDIOPULMONARY ARREST — complete obstruction unrelieved within minutes; CPR + emergent bronchoscopy / surgical airway.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PNEUMOTHORAX during bronchoscopy — chest tube as needed.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("POST-OBSTRUCTIVE PNEUMONIA — antibiotics + bronchoscopy + bronchial toilet.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("DELAYED PRESENTATION — recurrent pneumonia / persistent cough → bronchoscopy required to diagnose; often missed for weeks-months.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("BRONCHIECTASIS from chronic obstruction + infection — long-term complication.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("SECONDARY foreign body migration during transport / induction — secure airway + monitor.", citationIDs: ["specialty_dx_round25"]),
            AttributedBullet("PSYCHOLOGICAL — caregiver guilt + anxiety; counseling + support.", citationIDs: ["specialty_dx_round25"])
        ],
        citations: [openrnDxR25, cdcDxR25, specialtyDxR25],
        lastSourceFidelityReview: "2026-05-13"
    )
}
