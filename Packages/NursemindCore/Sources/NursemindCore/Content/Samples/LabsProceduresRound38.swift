import Foundation

// Curator-model labs + procedures (round 38 — pediatric labs + neonatal/pediatric procedures).

private let openrnLPR38 = CitationSource(
    id: "openrn_lpr38",
    shortName: "Open RN Maternal Newborn + Pediatric Nursing",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/maternalnewborn/",
    lastRetrieved: "2026-05-13"
)
private let cdcLPR38 = CitationSource(
    id: "cdc_lpr38",
    shortName: "CDC + AAP + ACMG concept citations",
    publisher: "CDC · AAP · ACMG",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyLPR38 = CitationSource(
    id: "specialty_lpr38",
    shortName: "AAP + AHA NRP + ACMG + Endocrine Society fact citations",
    publisher: "AAP · AHA NRP · ACMG · Endocrine Society",
    license: .factCitationOnly,
    url: "https://www.aap.org/",
    lastRetrieved: "2026-05-13"
)

private let bilirubinTagsR38 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .neurologicalRegulation
)
private let newbornTagsR38 = NCLEXTags(
    category: .healthPromotion,
    subcategory: .healthPromotion,
    priorityConcept: .safety
)
private let glucoseTagsR38 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .glucoseRegulation
)
private let nrpTagsR38 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .gasExchange
)
private let pedsProcTagsR38 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)

// MARK: - LABS

public enum NeonatalBilirubinSample {
    public static let entry: LabEntry = LabEntry(
        id: "neonatal-bilirubin-monitoring",
        title: "Neonatal bilirubin monitoring (TSB + Bhutani nomogram)",
        subtitle: "Total + conjugated bilirubin · age-in-hours-specific risk · Bhutani nomogram (high vs intermediate vs low risk) · phototherapy + exchange transfusion thresholds · prevent kernicterus",
        specimen: "Heel stick capillary OR venous serum (TSB); transcutaneous bilirubin (TcB) for screening",
        nclexTags: bilirubinTagsR38,
        referenceRanges: [
            ReferenceRangeRow(value: "Term newborn 24 h: <8 mg/dL", label: "Low risk per Bhutani", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Term newborn 48 h: <12 mg/dL", label: "Low risk per Bhutani", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Term newborn 72 h: <14 mg/dL", label: "Low risk per Bhutani", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Term newborn 96 h: <15 mg/dL", label: "Low risk per Bhutani", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Direct (conjugated) bilirubin >2.0 mg/dL OR >20% TSB", label: "PATHOLOGIC — workup biliary atresia + cholestasis", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "TSB >25 mg/dL term, >20 mg/dL preterm", label: "Severe — exchange transfusion threshold", citationIDs: ["specialty_lpr38"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Low risk (<40th percentile Bhutani)",
                summary: "Below intervention threshold; routine monitoring; encourage feeding 8-12 times/day; outpatient follow-up.",
                nursingActions: [
                    "Encourage frequent breastfeeding 8-12x/day",
                    "Outpatient pediatrician follow-up within 48-72 hours of discharge",
                    "Family education on jaundice signs",
                    "TcB or TSB before discharge per institutional protocol"
                ],
                citationIDs: ["specialty_lpr38"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Intermediate-high risk (40-95th percentile)",
                summary: "Increased monitoring + consider phototherapy depending on hours of life + risk factors; close follow-up.",
                nursingActions: [
                    "TSB every 4-12 hours per protocol",
                    "Consider phototherapy per AAP nomogram",
                    "Frequent feeding to promote bilirubin excretion",
                    "Family education + close pediatrician follow-up"
                ],
                citationIDs: ["specialty_lpr38"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Severe (>95th percentile OR meets exchange threshold)",
                summary: "INTENSIVE PHOTOTHERAPY immediately; consider EXCHANGE TRANSFUSION if level approaches/exceeds threshold OR features of acute bilirubin encephalopathy; ICU admission.",
                nursingActions: [
                    "INTENSIVE PHOTOTHERAPY (multiple lights, blanket, undressed except diaper, eye protection)",
                    "Q4-6 hour TSB monitoring",
                    "Hydration adequate (IV if not feeding well)",
                    "Neurologic assessment Q2-4 hours (encephalopathy signs)",
                    "Blood type + Coombs (if mother O-, Rh-)",
                    "EXCHANGE TRANSFUSION if level rising despite intensive phototherapy OR features of acute bilirubin encephalopathy"
                ],
                citationIDs: ["specialty_lpr38"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Physiologic jaundice (most common)",
                causes: ["Increased RBC turnover (fetal Hgb), reduced bilirubin conjugation in immature liver, enterohepatic circulation; peaks day 3-5; resolves by 1-2 weeks"],
                citationIDs: ["specialty_lpr38"]
            ),
            CauseGroup(
                title: "Pathologic causes (workup if appears in first 24 h, severe, or persistent >2 weeks)",
                causes: ["Hemolytic disease (ABO/Rh incompatibility, G6PD deficiency, hereditary spherocytosis, sepsis-induced)", "Increased enterohepatic circulation (poor feeding, ileus, cystic fibrosis, intestinal obstruction)", "Decreased clearance (Gilbert/Crigler-Najjar syndromes, hypothyroidism, sepsis)", "Cholestasis with elevated DIRECT bilirubin (biliary atresia — TIME-CRITICAL Kasai window, choledochal cyst, neonatal hepatitis, alpha-1 antitrypsin, TORCH infections, cystic fibrosis)"],
                citationIDs: ["specialty_lpr38"]
            ),
            CauseGroup(
                title: "Risk factors for severe hyperbilirubinemia",
                causes: ["Gestational age <38 weeks", "Exclusively breastfed + early discharge + suboptimal intake", "Visible jaundice within 24 hours", "Hemolysis (positive Coombs, ABO/Rh, G6PD)", "Cephalhematoma + bruising", "East Asian race", "Sibling history of severe jaundice/phototherapy"],
                citationIDs: ["specialty_lpr38"]
            )
        ],
        nursingActions: [
            AttributedBullet("Universal predischarge bilirubin (TcB or TSB) screening per AAP — combined with hour-specific Bhutani nomogram + risk factor assessment.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Visual assessment unreliable; use TcB or TSB; jaundice progresses cephalocaudally.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Intensive phototherapy — multiple sources (overhead + bilibed/bilibank), maximize skin exposure, eye protection (eye covers/shields), thermoregulation, monitor weight + I/O + skin.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Maintain hydration — frequent breastfeeding 8-12x/day OR formula supplementation; avoid water OR juice (worsens hyponatremia).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Rule out pathologic causes — appearance <24 h, rapid rise, conjugated bilirubin elevation, persistent jaundice >2 weeks, family history; targeted workup.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Direct bilirubin in any newborn with jaundice persisting >14 days (>21 in preterm) — RULE OUT BILIARY ATRESIA (Kasai before 60-90 days for best outcomes).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Family education — jaundice signs, when to call (lethargy, poor feeding, high-pitched cry, arching back, fever), feeding, follow-up importance.", citationIDs: ["openrn_lpr38"])
        ],
        watchFor: [
            AttributedBullet("KERNICTERUS / Acute bilirubin encephalopathy — irreversible neurologic damage from unconjugated bilirubin crossing BBB; classic features — lethargy, hypotonia, poor feeding (early); progressing to hypertonia, retrocollis, opisthotonus, high-pitched cry, fever, seizures, eventually death OR cerebral palsy + intellectual disability + sensorineural hearing loss + dental enamel dysplasia.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PHOTOTHERAPY complications — dehydration, hyperthermia, transient diarrhea, bronze baby syndrome (in cholestasis), retinal damage (eye protection), skin rash, separation from parents (emotional impact); minimize with proper management.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("EXCHANGE TRANSFUSION risks — anemia, thrombocytopenia, electrolyte imbalances (hypocalcemia, hypoglycemia, hyperkalemia), arrhythmia, infection, NEC, vascular complications, mortality 0.3-2%; reserved for severe.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("DIRECT (conjugated) HYPERBILIRUBINEMIA — biliary atresia time-critical (Kasai window); urgent hepatology workup.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("BREAST MILK JAUNDICE (after first week, persists weeks-months) — prolonged unconjugated; usually benign + does NOT require breastfeeding cessation; rule out other causes; reassurance.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("BREASTFEEDING JAUNDICE (first week, suboptimal feeding) — distinguish from breast milk jaundice; encourage MORE breastfeeding (8-12x/day) + lactation consultation; supplementation rarely needed.", citationIDs: ["specialty_lpr38"])
        ],
        citations: [openrnLPR38, cdcLPR38, specialtyLPR38],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NewbornScreeningSample {
    public static let entry: LabEntry = LabEntry(
        id: "newborn-screening-panel",
        title: "Newborn screening (state-mandated heel stick)",
        subtitle: "Universal heel stick at 24-72 h · 30+ disorders (RUSP) · early identification prevents intellectual disability + death · positive screen requires URGENT confirmatory testing",
        specimen: "Heel stick capillary blood on filter paper (Guthrie card)",
        nclexTags: newbornTagsR38,
        referenceRanges: [
            ReferenceRangeRow(value: "All targeted disorders below detection cutoffs", label: "Negative screen (passes all)", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Any disorder above cutoff", label: "POSITIVE — requires immediate confirmatory testing", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Indeterminate/borderline", label: "Repeat heel stick OR confirmatory testing", citationIDs: ["specialty_lpr38"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative screen — all disorders below cutoff",
                summary: "Routine well-baby care; sensitivity not 100% so clinical vigilance maintained; some disorders not on universal panel.",
                nursingActions: [
                    "Provide negative screen result to family",
                    "Continue well-baby care + age-appropriate screening",
                    "Counsel that screening doesn't catch every condition",
                    "Address questions about specific disorders if family history"
                ],
                citationIDs: ["specialty_lpr38"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Positive screen — requires URGENT confirmatory testing",
                summary: "Most positives are FALSE POSITIVES (especially congenital hypothyroidism, CAH, CF), but timely confirmation essential to prevent harm; institutional/state-specific protocols.",
                nursingActions: [
                    "URGENT confirmatory testing — venous blood + targeted assay",
                    "Specialty consultation per disorder (endocrinology, hematology, genetics, neurology)",
                    "Family communication — explain positive screen with reassurance most are false positives but workup essential",
                    "Initiate empiric treatment for time-critical conditions (e.g., levothyroxine for CH, hydrocortisone for CAH) pending confirmation",
                    "Coordinate follow-up + ensure no patient lost to follow-up"
                ],
                citationIDs: ["specialty_lpr38"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Recommended Uniform Screening Panel (RUSP) — core conditions (varies slightly by state)",
                causes: ["ENDOCRINE — congenital hypothyroidism, congenital adrenal hyperplasia (CAH)", "HEMOGLOBINOPATHIES — sickle cell disease, thalassemias, Hgb variants", "AMINO ACID DISORDERS — phenylketonuria (PKU), maple syrup urine disease, homocystinuria, tyrosinemia, citrullinemia, others", "FATTY ACID OXIDATION — MCAD deficiency, LCHAD, VLCAD, SCAD, others", "ORGANIC ACID — propionic + methylmalonic acidemia, isovaleric acidemia, others", "OTHER — biotinidase deficiency, classical galactosemia, cystic fibrosis (IRT + DNA panel), severe combined immunodeficiency (SCID — TREC), spinal muscular atrophy (SMA — increasing inclusion), critical congenital heart disease (pulse oximetry screen, separate from heel stick), Pompe disease, X-linked adrenoleukodystrophy"],
                citationIDs: ["specialty_lpr38"]
            ),
            CauseGroup(
                title: "Test characteristics + caveats",
                causes: ["Sensitivity high but not 100% — clinical vigilance for symptoms that develop", "Specificity variable — false positives common (especially CH, CAH, CF); confirmatory testing required", "Timing — heel stick at 24-72 hours of life (after sufficient feeding for amino acid disorders); some require repeat at 1-2 weeks (CAH, hemoglobinopathies)", "Premature/sick infants — screening may need repeat after stabilization + adequate feeding", "Transfused infant — affects hemoglobin, immune assays for SCID; repeat after several weeks"],
                citationIDs: ["specialty_lpr38"]
            )
        ],
        nursingActions: [
            AttributedBullet("UNIVERSAL screening — heel stick at 24-72 hours of life (some states 24+ for amino acids, 48+ for galactosemia + hemoglobinopathies); document time of birth + time of collection + feeding status.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Proper technique — warm heel (warm cloth × 5 min), prep with alcohol, dry, lateral aspect of heel (avoid central — calcaneus puncture), automatic lancet, large drops to fill all circles on filter paper completely (not layered drops, which cause errors), air dry, send to state lab.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("FAMILY consent + counseling — most states default opt-out (universal); explain purpose, what's tested, possibility of positive screen, importance of follow-up.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("EARLY DISCHARGE policies — if discharged <24 hours, repeat at 1-2 weeks per state requirements; capture infants who miss initial screen.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PREMATURE / NICU infants — initial screen + repeat at 28 days OR weight reaches threshold OR per state protocol; immature enzymes affect sensitivity.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("POSITIVE SCREEN — coordinate with state genetic services + specialist; arrange confirmatory testing within 24-48 hours; family communication; initiate empiric treatment for time-critical (levothyroxine for CH within 14 days; hydrocortisone for CAH; others).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Track + ensure follow-up — many state programs have nurse coordinators; do NOT lose to follow-up.", citationIDs: ["specialty_lpr38"])
        ],
        watchFor: [
            AttributedBullet("MISSED diagnosis — late presentation with brain damage, organ failure, death (PKU + CH + CAH + galactosemia particularly preventable but devastating if missed); treat positives as urgent.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("FALSE POSITIVES common — counsel family with reassurance + arrange confirmatory testing; minimize anxiety while ensuring follow-up.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Pre-discharge screening missed in early discharge — repeat at 1-2 weeks essential; some pediatricians screen at first office visit.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Premature + sick infant — initial screen at 24-48 hours; REPEAT at 28 days OR weight reaches threshold; premature enzymes mature with age.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Adoption + international adoption — ensure newborn screening completed (variable in other countries) OR perform in US.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("State-specific variations — RUSP is recommendation; states vary in panels (most adopt RUSP plus state-specific additions); keep current.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("CRITICAL congenital heart disease (CCHD) — separate pulse oximetry screen at 24+ hours pre-discharge — preductal (right hand) + postductal (foot); identifies cyanotic heart disease.", citationIDs: ["specialty_lpr38"])
        ],
        citations: [openrnLPR38, cdcLPR38, specialtyLPR38],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum NeonatalGlucoseSample {
    public static let entry: LabEntry = LabEntry(
        id: "pediatric-glucose-monitoring",
        title: "Neonatal + pediatric glucose monitoring",
        subtitle: "Neonatal hypoglycemia thresholds (age-of-life specific) · TRANSITIONAL adaptation · feeding + dextrose gel + IV glucose · CRITICAL window for neuroprotection · PERSISTENT requires endocrine workup",
        specimen: "Heel stick capillary OR venous blood",
        nclexTags: glucoseTagsR38,
        referenceRanges: [
            ReferenceRangeRow(value: "Term newborn first 4 h: ≥40 mg/dL", label: "Adequate (transitional)", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Term newborn 4-24 h: ≥45 mg/dL", label: "Adequate", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Term newborn >24 h: ≥50 mg/dL (some 60)", label: "Adequate", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "Older infant + child: ≥60 mg/dL fasting; ≥70 random", label: "Adequate", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "<35-40 mg/dL term newborn", label: "Hypoglycemia — intervention required", citationIDs: ["specialty_lpr38"]),
            ReferenceRangeRow(value: "<25 mg/dL", label: "Severe hypoglycemia — emergency IV dextrose", citationIDs: ["specialty_lpr38"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Glucose at age-appropriate threshold",
                summary: "Normal — continue feeding + monitoring per protocol; transitional hypoglycemia resolves with feeding.",
                nursingActions: [
                    "Continue feeding 8-12x/day (newborns)",
                    "Routine glucose monitoring per protocol if at-risk",
                    "Family teaching on early signs of hypoglycemia"
                ],
                citationIDs: ["specialty_lpr38"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Mild hypoglycemia (35-45 mg/dL term newborn)",
                summary: "Asymptomatic infants — feeding (breastfeed OR formula 5-10 mL/kg) + recheck 30-60 min; persistent → consider dextrose gel.",
                nursingActions: [
                    "Encourage immediate breastfeeding OR formula 5-10 mL/kg",
                    "DEXTROSE GEL 40% (200 mg/kg = 0.5 mL/kg) buccal, then breastfeed (AAP 2014)",
                    "Recheck glucose 30-60 minutes after feeding/gel",
                    "Document oral intake + maintain feeding schedule"
                ],
                citationIDs: ["specialty_lpr38"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Severe (<25 mg/dL) OR symptomatic hypoglycemia",
                summary: "EMERGENCY — IV dextrose; persistent hypoglycemia despite feeding requires NICU admission + IV glucose + endocrine evaluation.",
                nursingActions: [
                    "EMERGENT IV ACCESS + dextrose bolus 200 mg/kg = 2 mL/kg D10W IV push",
                    "Continuous IV dextrose infusion at glucose infusion rate (GIR) 4-6 mg/kg/min initially; titrate up to 8-12+ mg/kg/min if needed",
                    "Frequent glucose checks Q15-30 min until stable + hourly thereafter",
                    "NICU admission for persistent hypoglycemia",
                    "Endocrine consultation for evaluation of hyperinsulinism, metabolic disorders, hypopituitarism",
                    "Workup — insulin + C-peptide + cortisol + GH + acylcarnitines + organic acids + ammonia + lactate AT TIME of hypoglycemia (CRITICAL sample)"
                ],
                citationIDs: ["specialty_lpr38"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Transient neonatal hypoglycemia (most common)",
                causes: ["Inadequate feeding (poor latch, sleepy infant, cesarean delivery without rooming-in)", "Cold stress (hypothermia)", "Prematurity (limited glycogen stores + feeding difficulties)", "Small for gestational age (SGA, low glycogen)", "Late preterm (35-37 weeks) — at risk despite \"near-term\"", "Stress (sepsis, asphyxia, polycythemia)"],
                citationIDs: ["specialty_lpr38"]
            ),
            CauseGroup(
                title: "Maternal factors",
                causes: ["Diabetes (gestational + Type 1/2) — fetal hyperinsulinism → hypoglycemia after birth", "Maternal medications (beta-blockers, glucose infusion)", "Tocolysis (terbutaline)"],
                citationIDs: ["specialty_lpr38"]
            ),
            CauseGroup(
                title: "Persistent hypoglycemia (PERSISTENT >48 hours OR not responding) — workup",
                causes: ["Hyperinsulinism (congenital, persistent hyperinsulinemic hypoglycemia of infancy)", "Endocrine — hypopituitarism, growth hormone deficiency, adrenal insufficiency, congenital hypothyroidism", "Inborn errors of metabolism — fatty acid oxidation defects (MCAD, LCHAD), glycogen storage disease, gluconeogenesis disorders, organic acidemias", "Beckwith-Wiedemann syndrome (macrosomia + macroglossia + hyperinsulinism)", "Sepsis (worsens any hypoglycemia)"],
                citationIDs: ["specialty_lpr38"]
            )
        ],
        nursingActions: [
            AttributedBullet("Universal screening NOT recommended — only AT-RISK infants (LGA, SGA, IDM, late preterm 35-37 wk, <2500 g, sick infants) per AAP guidelines.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Initial check at 30 min after first feeding (within 1-2 h of life); then per protocol (every 3 h × 24 h for IDM; every 3-6 h × 24 h for late preterm/SGA).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Promote early + frequent breastfeeding 8-12x/day; rooming-in; skin-to-skin contact; lactation consultation.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("DEXTROSE GEL 40% (Insta-Glucose, prepared dextrose gel) — 200 mg/kg buccal (0.5 mL/kg of 40% gel) for asymptomatic mild hypoglycemia; breastfeed immediately after; recheck 30-60 min; AAP/PES 2014 endorsed; reduces NICU admission for asymptomatic late preterm + at-risk newborns.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Avoid water OR formula supplementation that interferes with breastfeeding establishment when not indicated; coordinate with lactation.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Symptomatic hypoglycemia OR severe (<25) — IV dextrose immediately; bolus 2 mL/kg D10W + continuous infusion at GIR 4-6 mg/kg/min; titrate.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PERSISTENT hypoglycemia — endocrine consultation + critical sample workup AT TIME of hypoglycemia (insulin, C-peptide, cortisol, GH, beta-OH, lactate, ammonia, ketones, acylcarnitines, organic acids).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Family education — recognize jitteriness/lethargy/poor feeding/cyanosis as signs; importance of feeding schedule + follow-up.", citationIDs: ["openrn_lpr38"])
        ],
        watchFor: [
            AttributedBullet("BRAIN INJURY from severe/prolonged hypoglycemia — irreversible; particularly in symptomatic infants; aggressive treatment + neuroprotection.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("SYMPTOMATIC hypoglycemia (jittery, lethargic, poor feeding, hypotonic, cyanosis, seizures, apnea) — urgent IV treatment regardless of glucose level.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PERSISTENT or RECURRENT hypoglycemia — endocrine consultation; rule out hyperinsulinism, metabolic disorders, hormonal deficiencies.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("REBOUND HYPOGLYCEMIA after IV dextrose bolus — continue continuous infusion + frequent monitoring; do NOT bolus alone without infusion.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("HYPERGLYCEMIA from over-treatment — monitor; reduce GIR.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("CONGENITAL HYPERINSULINISM — most common cause of persistent infant hypoglycemia; diazoxide first-line; octreotide; sometimes pancreatectomy; long-term endocrine.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("INFANT OF DIABETIC MOTHER (IDM) — at-risk; routine glucose protocol; usually resolves within 24-48 hours.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("KETOTIC HYPOGLYCEMIA — common in toddlers (1-5 yr) with prolonged fasting (illness); responds to glucose; usually outgrown.", citationIDs: ["specialty_lpr38"])
        ],
        citations: [openrnLPR38, cdcLPR38, specialtyLPR38],
        lastSourceFidelityReview: "2026-05-13"
    )
}

// MARK: - PROCEDURES

public enum NRPSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "neonatal-resuscitation-nrp",
        title: "Neonatal resuscitation (NRP)",
        subtitle: "AAP-AHA 8th edition · INITIAL STEPS (warm + dry + stimulate + position + clear airway) · PPV first if not breathing/HR<100 · MR. SOPA · compressions if HR<60 · epinephrine UVC",
        nclexTags: nrpTagsR38,
        indications: AttributedProse(
            "Neonatal resuscitation — required for ~10% of newborns (mostly initial steps + PPV); ~1% require advanced resuscitation. NRP (Neonatal Resuscitation Program — AAP/AHA, currently 8th edition 2021) is standardized framework. Goal: establish effective ventilation as primary intervention (most newborn arrests are respiratory). Anticipation + preparation + team approach + early effective ventilation prevent need for advanced steps per primary source.",
            citationIDs: ["specialty_lpr38"]
        ),
        contraindications: AttributedProse(
            "None — NRP applies to any newborn requiring resuscitation; some interventions modified for extreme prematurity (golden hour for thermoregulation), known anomalies (TEF — avoid PPV via mask), congenital diaphragmatic hernia (avoid PPV via mask, emergent intubation).",
            citationIDs: ["specialty_lpr38"]
        ),
        equipment: [
            AttributedBullet("RADIANT WARMER + warm towels + hat (heat loss prevention paramount).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("BULB SYRINGE + suction catheter + meconium aspirator (selected — evidence has shifted away from routine intubation/suctioning even for vigorous meconium-stained infants).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PPV equipment — T-piece resuscitator (Neopuff) OR self-inflating bag + appropriate-sized masks (round preemie + term neonatal); CPAP capability for spontaneous breathing.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Pulse oximetry (preductal — right hand) + cardiac monitor + ECG (NRP 8th edition emphasizes ECG for fastest accurate HR).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("OXYGEN BLENDER (room air for term/late preterm; 21-30% for preterm; titrate up only if not responding); avoid hyperoxia.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Intubation supplies — laryngoscope (Miller 0/1), ETT 2.5-4.0 mm uncuffed, stylet, end-tidal CO2 detector.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Umbilical venous catheter (UVC) supplies — sterile prep, 3.5-5 Fr UVC, syringes for medications.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Medications — epinephrine 1:10,000 (0.1 mg/mL — for IV/IO/UVC; 1 mL/kg ETT NOT preferred), saline for volume.", citationIDs: ["specialty_lpr38"])
        ],
        preProcedure: [
            AttributedBullet("ANTICIPATE — perinatal risk factors (prematurity, infection, maternal substance use, abnormal fetal heart tones, abnormal presentation, multiple gestation, oligo/polyhydramnios, antepartum hemorrhage, magnesium use, narcotic use); communicate with OB team.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("ASSEMBLE TEAM — at least one person whose only responsibility is care of newborn; additional personnel as risk increases (resuscitation team for high-risk).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PRE-RESUSCITATION CHECK — equipment ready, drugs prepared, communication, role assignment, briefing.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("ASSESS at birth — Term gestation? Good tone? Crying/breathing? If YES to all → routine care (delayed cord clamping, skin-to-skin with mother).", citationIDs: ["specialty_lpr38"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Initial steps (within 1 minute of birth — \"Golden Minute\")", body: "If NOT vigorous: WARM + DRY + STIMULATE + POSITION (head neutral or slightly extended, sniffing position) + CLEAR AIRWAY (suction MOUTH then NOSE only if obstructed); maintain temperature (radiant warmer, hat, plastic wrap for premies <32 weeks).", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 2, title: "Assess HR + breathing at 30 seconds", body: "If apnea/gasping OR HR <100 → BEGIN PPV with 21% O2 (term) or 21-30% O2 (preterm) at rate 40-60 breaths/min, peak inspiratory pressure (PIP) ~20-25 cmH2O; visible chest rise + audible breath sounds + improving HR confirm effective ventilation.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 3, title: "MR. SOPA — if PPV not effective", body: "MASK adjustment, REPOSITION head, SUCTION mouth + nose, OPEN mouth slightly + jaw thrust, PRESSURE increase (PIP), AIRWAY alternative (LMA or intubation); reassess after each correction; effective PPV is the SINGLE MOST IMPORTANT intervention.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 4, title: "Reassess at 60 seconds", body: "If HR ≥100 + breathing → continue PPV until adequate spontaneous breathing; transition to CPAP if persistent labored breathing; if HR 60-100 → continue PPV + ensure ventilation is effective; if HR <60 → INTUBATE (or LMA) + start CHEST COMPRESSIONS.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 5, title: "Chest compressions (if HR <60 despite effective PPV × 30 seconds)", body: "TWO-THUMB encircling technique preferred; 1/3 chest depth; 3:1 compression-to-ventilation ratio (90 compressions + 30 breaths/min); INCREASE FiO2 to 100%; reassess HR every 60 seconds.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 6, title: "Epinephrine (if HR <60 despite effective PPV + compressions × 60 seconds)", body: "EPINEPHRINE 0.02 mg/kg IV/IO/UVC (0.2 mL/kg of 1:10,000); UVC PREFERRED route (faster, more reliable); ETT alternative (0.1 mg/kg = 1 mL/kg of 1:10,000) but less reliable; repeat Q3-5 min as needed.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 7, title: "Volume expansion (if hypovolemia suspected)", body: "NORMAL SALINE OR O-NEGATIVE BLOOD 10 mL/kg IV/IO/UVC over 5-10 minutes; suspected with poor response + history of placental abruption + cord compression + placenta previa.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 8, title: "Continued resuscitation + ICU transport", body: "Once HR >100 + spontaneous breathing → reduce O2 to maintain SpO2 in target range; minimize handling; thermoregulation; transport to NICU; comprehensive assessment + parent communication.", citationIDs: ["specialty_lpr38"])
        ],
        postProcedure: [
            AttributedBullet("NICU admission for infants requiring extensive resuscitation; close monitoring + thermoregulation + glucose monitoring.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("ABG at 30 min if PPV needed; assess metabolic acidosis + oxygenation.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Therapeutic hypothermia consideration for moderate-severe HIE (perinatal asphyxia); 33-34°C × 72 hours; specialized centers; within 6 hours of birth.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Family communication — chaplaincy + social work; emotional support; updates frequently; involve in care when stable.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Team debrief — review event + identify learning; emotional support for staff.", citationIDs: ["specialty_lpr38"])
        ],
        documentation: [
            AttributedBullet("APGAR scores at 1, 5, 10 min (and beyond if low at 5 min) — appearance, pulse, grimace, activity, respiration; 0-10 each component 0-2.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Resuscitation chronology — interventions + timing + response.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Medications + doses + routes + times.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Vital signs + assessments + family communication + transport.", citationIDs: ["openrn_lpr38"])
        ],
        watchFor: [
            AttributedBullet("HYPOXIC-ISCHEMIC ENCEPHALOPATHY (HIE) — moderate-severe perinatal asphyxia → therapeutic hypothermia within 6 hours of birth at specialized center; dramatic neuroprotective benefit.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PNEUMOTHORAX from PPV — ALWAYS assess with respiratory deterioration during/after resuscitation; needle aspiration + chest tube.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PERSISTENT BRADYCARDIA despite optimal resuscitation — consider: TEF, congenital diaphragmatic hernia, pneumothorax, hypovolemia, congenital heart disease, hypothermia, severe acidosis, severe anemia.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("MECONIUM ASPIRATION SYNDROME — vigorous infant with meconium-stained fluid no longer routinely intubated/suctioned (NRP 8th edition change); PPV if depressed.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("EXTREME PREMATURITY — \"golden hour\" approach; thermoregulation paramount; gentle ventilation; surfactant; maintain glucose + perfusion; team approach.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("OPIOID-EXPOSED — NALOXONE NOT recommended in NRP 8th edition (no evidence of benefit + concern about precipitating withdrawal seizures); supportive PPV is correct treatment.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("DISCONTINUATION of resuscitation — if HR not detectable after 20 minutes of effective resuscitation, consider discontinuation per ethical framework; team decision; family communication; institutional protocols.", citationIDs: ["specialty_lpr38"])
        ],
        citations: [openrnLPR38, cdcLPR38, specialtyLPR38],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricIVSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pediatric-iv-insertion",
        title: "Pediatric IV insertion",
        subtitle: "Site selection by age · vein evaluation + protection · NUMB CREAM (LMX/EMLA) prior · short flexible catheter · stabilization + protection · DIFFICULT IV — ultrasound + IO",
        nclexTags: pedsProcTagsR38,
        indications: AttributedProse(
            "Pediatric IV insertion — venous access for fluids, medications, blood products, IV nutrition. Age-specific approach: site selection considers age + vein quality + preservation; non-pharm + topical anesthesia minimize distress; multiple attempts limited (4-stick rule typically) before escalating to ultrasound + IO + central. Common indications: dehydration, fever workup, antibiotics, surgical prep, chemo/IV access need per primary source.",
            citationIDs: ["specialty_lpr38"]
        ),
        contraindications: AttributedProse(
            "Cellulitis/skin breakdown over insertion site; previous AV fistula on same extremity; mastectomy on same side (in older children, women); severe coagulopathy uncorrected; severe peripheral vascular disease.",
            citationIDs: ["specialty_lpr38"]
        ),
        equipment: [
            AttributedBullet("Pediatric IV catheter — 24G (newborn-12 mo), 22G (toddler-school age), 20-22G (adolescent); flexible silicone preferred over plastic; 2-3 cm length.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("LMX 4% (lidocaine) cream OR EMLA (lidocaine + prilocaine) — apply 30-60 min before; topical anesthetic.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("VAPOCOOLANT spray (ethyl chloride) — alternative for time-pressured situations; immediate but brief numbing.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Tourniquet (small for pediatrics OR rubber band wrapped around finger for tiny hands), gloves, alcohol prep, gauze, transparent dressing, securement device, IV fluid + tubing primed, syringe with saline flush.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Distraction tools (toys, video, pacifier), warm blanket (vasodilation), comfort hold positioning, parental presence ideally.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Ultrasound (for difficult sticks); intraosseous (IO) device if life-threatening urgency + failed IV (EZ-IO most common).", citationIDs: ["specialty_lpr38"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order + indication; prepare emotional + cognitive support; explain age-appropriate.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("APPLY TOPICAL ANESTHETIC 30-60 min before to multiple potential sites (cover with transparent dressing).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PARENT INVOLVEMENT — comfort hold (chest-to-chest) for infants/toddlers; nearby support for older children; \"comfort hold\" preserves child autonomy + reduces trauma; some prefer parent absent — respect choice.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("DISTRACTION — choose age-appropriate (bubbles, video, toy, story, song); engage child life specialist if available.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Site selection — start DISTAL to preserve proximal sites for future; AVOID dominant hand if possible; consider upper extremity (preferred), lower extremity in non-walking infant; AVOID antecubital (joint flexion + occlusion); SCALP only as last resort in infants (cosmetic + safety).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("WARM extremity to vasodilate (warm pack OR warm towel) — significantly improves success rate.", citationIDs: ["specialty_lpr38"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Position + immobilize", body: "Comfort hold for infant/toddler; older child supported by parent or staff; immobilize extremity GENTLY (not forcefully); maintain dignity + minimize distress.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 2, title: "Apply tourniquet + locate vein", body: "Tourniquet ABOVE intended site (4-6 inches); occlude venous return (pulse should still be palpable); palpate vein (better than visualization); tap vein gently; warm extremity if not done; wait for vein to engorge; ultrasound if difficult.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 3, title: "Skin prep + insertion", body: "Alcohol prep + 30 sec dry; insert at 15-30° angle through skin; immediately reduce angle to nearly parallel (10°) for vein entry; advance slowly until BLOOD FLASHBACK; advance catheter slightly further (to ensure tip in vein, not just bevel); thread catheter while withdrawing needle slowly; release tourniquet; attach saline flush + verify patency (no resistance, no pain, no infiltration).", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 4, title: "Secure + label", body: "Apply transparent dressing over insertion site (visualize vein); secure with hub stabilization device (StatLock or similar) + extra tape if needed; loop tubing to prevent dislodgement from pulling; LABEL date/time/initials/gauge.", citationIDs: ["openrn_lpr38"]),
            ProcedureStep(number: 5, title: "Verify function", body: "Connect tubing + flush 1-2 mL saline; visualize for swelling/blanching/coolness/pain (signs of infiltration); check easy flow; if any concern → REMOVE + restart at different site.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 6, title: "Comfort + reward", body: "Comfort child after; positive reinforcement (sticker, praise, certificate); thank parent for support; document.", citationIDs: ["openrn_lpr38"]),
            ProcedureStep(number: 7, title: "Failed attempts (4-stick rule)", body: "If 2-4 unsuccessful attempts → ESCALATE — call senior nurse/IV team/anesthesia/PICU; use ULTRASOUND guidance; consider IO if life-threatening urgency; consider central line if prolonged need + difficult access.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 8, title: "INTRAOSSEOUS (IO) backup", body: "For LIFE-THREATENING situations + failed IV — proximal tibia (1-2 cm below tibial tuberosity, anteromedial); EZ-IO drill; verify by aspirating bone marrow + free flow infusion; lidocaine 0.5 mg/kg via IO before any infusion (extremely painful); secure + monitor for extravasation/dislodgement; replace with IV/central within 24 hours.", citationIDs: ["specialty_lpr38"])
        ],
        postProcedure: [
            AttributedBullet("Continuous assessment for infiltration/extravasation; check Q1-2H — swelling, pain, redness, blanching, coolness.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Replace IV at 72-96 hours (per CDC) OR per institutional policy OR if any concern.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("FAMILY education — protect IV during play, when to call (pain, swelling, leak, blood return loss).", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Adhesive removal at end — alcohol pad to gently dissolve adhesive; minimize trauma to fragile pediatric skin.", citationIDs: ["openrn_lpr38"])
        ],
        documentation: [
            AttributedBullet("Date/time of insertion + site + gauge + number of attempts + person inserting.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Function — blood return + flush ease + dressing intact.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Patient tolerance + interventions + comfort measures used.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Q-shift assessment + replacement schedule + complications.", citationIDs: ["openrn_lpr38"])
        ],
        watchFor: [
            AttributedBullet("INFILTRATION — fluid into tissue; swelling, coolness, pain, blanching, sluggish flow; STOP infusion + remove + warm/cold compress per fluid type.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("EXTRAVASATION — vesicant fluid into tissue; severe tissue damage potential (vasopressors, calcium, hypertonic saline, vesicant chemo); STOP + ASPIRATE residual + ANTIDOTE per drug + plastic surgery referral if severe.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("PHLEBITIS — chemical or mechanical; redness/pain/warmth along vein; remove IV + warm compress + antibiotics if cellulitis.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("INFECTION — site infection or systemic; warm/red site; remove + culture + antibiotics if needed.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("EMOTIONAL TRAUMA from repeated/painful sticks — long-term phobia; minimize attempts; topical anesthesia; non-pharm; child life specialist.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("DIFFICULT VENOUS ACCESS pattern (DIVA score) — predicts failed sticks; ultrasound + IO + central early.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("INFANT scalp veins — can be used as last resort + cosmetic concern; AVOID temporal artery (palpate before).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Adolescent — large veins comparable to adult; use 18-22G; communicate maturely; respect autonomy.", citationIDs: ["specialty_lpr38"])
        ],
        citations: [openrnLPR38, cdcLPR38, specialtyLPR38],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum PediatricMedAdminSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "pediatric-medication-administration",
        title: "Pediatric medication administration",
        subtitle: "Weight-based dosing · oral syringe + measurement accuracy · IM site selection by age · rectal · creative + non-coercive techniques · safety double-checks",
        nclexTags: pedsProcTagsR38,
        indications: AttributedProse(
            "Pediatric medication administration — fundamental nursing skill requiring weight-based dosing, age-appropriate technique, attention to safety + family-centered approach. ALL pediatric medications double-checked for dose calculation. Multiple routes used — oral, rectal, IM, IV, intranasal, transdermal — each with age-specific considerations. Compliance + safety + minimizing trauma + family education are central per primary source.",
            citationIDs: ["specialty_lpr38"]
        ),
        contraindications: AttributedProse(
            "Allergic reaction to medication; specific contraindications by drug + age (e.g., codeine + tramadol contraindicated in <12 yr; promethazine in <2 yr; aspirin in viral illness — Reye syndrome).",
            citationIDs: ["specialty_lpr38"]
        ),
        equipment: [
            AttributedBullet("Pediatric oral syringe (1 mL, 5 mL, 10 mL) — TWO-CARE numerical accuracy; AVOID dropper/dosing cup which are inaccurate for small volumes; AVOID household teaspoons.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Pediatric IM needle — 22-25G × 5/8-1 inch (depending on age + muscle mass); short needle for infants.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Topical anesthetic (LMX, EMLA) for IM/IV; 30-60 min before procedure.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Distraction tools (bubbles, video, toy, song); comfort hold positioning + family presence; child life specialist when available.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Documentation tools — eMAR with pediatric-specific dose ranges; smart pumps; barcode medication administration.", citationIDs: ["specialty_lpr38"])
        ],
        preProcedure: [
            AttributedBullet("WEIGHT-BASED dose verification — current weight (today's), calculated dose vs maximum dose, two-RN check for high-alert medications + opioids + chemotherapy + insulin + heparin + electrolytes.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("RIGHT 5+ — patient (2 identifiers), drug, dose, route, time, plus right reason + right documentation + right response.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("ALLERGIES verified + reconciled.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Age-appropriate explanation — honest (\"this will pinch\" if it will, not \"won't hurt\"); choices when possible (\"which arm?\"), comfort positioning.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Family + parent involvement — comfort hold + reassurance + sometimes administration if appropriate (PO at home).", citationIDs: ["openrn_lpr38"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "ORAL administration", body: "Use ORAL SYRINGE (1, 5, 10 mL) for accurate measurement; place on inner cheek slowly (small amounts at a time) to avoid choking; pacifier with sweet medication for infants; mix with small amount of food/drink (not full bottle — variable dose); follow with water to ensure full dose; sit upright; AVOID forced administration (aspiration risk).", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 2, title: "RECTAL administration", body: "Acetaminophen, valproate, ondansetron, diazepam (rectal forms); position side-lying with knees flexed; lubricate suppository tip; insert past internal sphincter (1-2 cm in infant, 2-5 cm older); hold buttocks closed × 5-10 min; minimize handling.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 3, title: "IM administration — site selection", body: "VASTUS LATERALIS (anterolateral thigh) preferred for INFANTS + TODDLERS — large muscle mass + away from major vessels/nerves; 22-25G × 5/8-1 inch; max volume 0.5 mL infants, 1 mL toddlers, 2 mL school-age. DELTOID — appropriate for >18 months for some vaccines (tDap, hep B); avoid in infants. VENTROGLUTEAL alternative + relatively safe; not for routine vaccines. AVOID DORSOGLUTEAL in <2 years (sciatic nerve injury risk; underdeveloped muscle).", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 4, title: "IM injection technique", body: "Hold syringe like dart; bunch muscle (in infants/thin); insert at 90° rapidly; aspirate ONLY if drug requires (most don't); inject slowly; remove rapidly; pressure with gauze; apply pressure 30 sec; bandage; comfort + reassurance.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 5, title: "IV administration", body: "Verify line patency + position; flush before + after; appropriate dilution per protocol (avoid concentration too high for small vein); SMART PUMP with pediatric drug library; weight-based dose limits; closely monitor for infiltration + extravasation; reassess.", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 6, title: "INTRANASAL administration", body: "Increasingly used for fentanyl, ketamine, midazolam, naloxone, sumatriptan; rapid onset; avoids IV; max 1 mL per nostril; alternate nostrils; tilt head slightly back; spray with mucosal atomizer device (MAD).", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 7, title: "TRANSDERMAL", body: "Skin patches (fentanyl, scopolamine — older children); rotate sites; document application + removal; AVOID heat (increased absorption).", citationIDs: ["specialty_lpr38"]),
            ProcedureStep(number: 8, title: "Documentation + monitoring", body: "Electronic MAR with timestamp; document patient response + adverse effects; reassess pain/N/V/sedation per medication; family communication.", citationIDs: ["openrn_lpr38"])
        ],
        postProcedure: [
            AttributedBullet("Monitor for therapeutic + adverse effects appropriate to medication.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Comfort + reassurance after procedure; positive reinforcement (sticker, praise).", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Family education on home administration when applicable — technique, timing, side effects, when to call.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("Site assessment after IM (redness, swelling) + IV (infiltration).", citationIDs: ["specialty_lpr38"])
        ],
        documentation: [
            AttributedBullet("Drug name + dose + route + time + site (IM) + nurse signature.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Patient response + adverse effects + interventions.", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("PRN medications — pre + post pain/N-V scores + interval.", citationIDs: ["openrn_lpr38"])
        ],
        watchFor: [
            AttributedBullet("DOSING ERRORS — pediatric medication dosing errors common + serious; weight-based calculation errors, decimal point errors, look-alike-sound-alike (LASA), wrong concentration; SMART PUMPS + EHR + barcode + double-checks essential.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("DOSING UNITS confusion — mg vs mcg vs mEq, mg/kg vs mg/m², trailing/leading zeros (write 0.5, NOT .5; write 1, NOT 1.0); use generic names + tall man lettering.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("OVERDOSE risk — acetaminophen most common (improper measurement, concomitant cold meds with acetaminophen, parental dosing errors at home); REINFORCE one source of acetaminophen at a time + measurement accuracy.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("CONTRAINDICATED meds in pediatrics — codeine + tramadol <12 yr (FDA contraindication, post-tonsillectomy/adenoidectomy <18 yr); promethazine <2 yr (respiratory depression); aspirin in viral illness (Reye syndrome).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Forced administration — aspiration, distress, future medication phobia; AVOID; creative approaches (mix with sweet, use favorite drink, syringe in cheek slowly, video distraction).", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("Family education + empowerment — proper measurement (oral syringe NOT teaspoon), timing, side effects, when to call, storage (locked, out of reach).", citationIDs: ["openrn_lpr38"]),
            AttributedBullet("DEVELOPMENTAL approach — adapt by age + cognitive level; honest, non-coercive, collaborative.", citationIDs: ["specialty_lpr38"]),
            AttributedBullet("VACCINE administration — needle length 5/8 inch IM newborn-2 mo, 1 inch 3-12 mo, 1-1.25 inch toddler+; vastus lateralis preferred for infants; DTaP/HepB/PCV/Hib + others; combine vaccines reduces injections; comfort hold + simultaneous injections + breastfeeding/sucrose for infants.", citationIDs: ["specialty_lpr38"])
        ],
        citations: [openrnLPR38, cdcLPR38, specialtyLPR38],
        lastSourceFidelityReview: "2026-05-13"
    )
}
