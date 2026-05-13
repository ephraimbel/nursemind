import Foundation

// Curator-model Reference entries (v1.5 expansion).
// Sources: AHRQ TeamSTEPPS (public domain), CDC (public domain), CMS (public domain),
// Joint Commission NPSGs (paraphrase + concept citation), AHA ACLS (concept citation),
// Open RN/OpenStax (CC BY 4.0 / display).

private let ahrqRef = CitationSource(
    id: "ahrq_ref_2",
    shortName: "AHRQ TeamSTEPPS / patient-safety primers",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/",
    lastRetrieved: "2026-05-04"
)
private let cdcRef = CitationSource(
    id: "cdc_ref_2",
    shortName: "CDC clinical and infection-control guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let cmsRef = CitationSource(
    id: "cms_ref_2",
    shortName: "CMS Hospital-Acquired Conditions / SEP-1 (concept citation)",
    publisher: "Centers for Medicare and Medicaid Services",
    license: .publicDomain,
    url: "https://www.cms.gov/",
    lastRetrieved: "2026-05-04"
)
private let jcRef = CitationSource(
    id: "jc_npsg_ref",
    shortName: "Joint Commission National Patient Safety Goals (concept citation)",
    publisher: "The Joint Commission",
    license: .factCitationOnly,
    url: "https://www.jointcommission.org/standards/national-patient-safety-goals/",
    lastRetrieved: "2026-05-04"
)
private let ahaRef = CitationSource(
    id: "aha_ref",
    shortName: "AHA ACLS / BLS algorithms (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/",
    lastRetrieved: "2026-05-04"
)
private let openrnRef2 = CitationSource(
    id: "openrn_ref_2",
    shortName: "Open RN Nursing Fundamentals / Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/?s=fundamentals+nursing+process",
    lastRetrieved: "2026-05-04"
)

private let safetyRefTags = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let mgmtTags = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety)
private let pharmRefTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)

// MARK: - Five (Now Eight/Ten) Rights of Medication Administration

public enum FiveRightsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "rights-of-medication",
        title: "Rights of medication administration",
        subtitle: "Five basic rights · expanded to eight/ten in modern practice",
        eyebrow: "REFERENCE · MEDICATION SAFETY",
        nclexTags: pharmRefTags,
        sections: [
            .keyValueTable(title: "The five basic rights", [
                KeyValueRow(key: "1. Right patient", value: "Two identifiers (name + DOB or MRN). NEVER room number alone."),
                KeyValueRow(key: "2. Right drug", value: "Verify against MAR; check label three times (when retrieving, before preparing, before administering)."),
                KeyValueRow(key: "3. Right dose", value: "Verify dose calculation; question doses outside typical range."),
                KeyValueRow(key: "4. Right route", value: "Verify route is appropriate; clarify ambiguous orders."),
                KeyValueRow(key: "5. Right time", value: "Within facility's window (often 30 min before/after scheduled time, exact for some — insulin, antibiotics, time-critical)")
            ]),
            .keyValueTable(title: "Expanded rights (modern practice)", [
                KeyValueRow(key: "6. Right documentation", value: "Document immediately after administration — name, dose, route, time, response, signature."),
                KeyValueRow(key: "7. Right reason / indication", value: "Verify the medication is being given for an evidence-based reason; question if unclear."),
                KeyValueRow(key: "8. Right response", value: "Assess and document the patient's response — pain relief, BP change, symptom improvement, side effects."),
                KeyValueRow(key: "9. Right to refuse", value: "Patient may refuse any medication after being informed of risks/benefits; document and notify provider."),
                KeyValueRow(key: "10. Right education", value: "Patient understands purpose, side effects, and instructions before discharge.")
            ]),
            .bullets(title: "ISMP high-alert medication safeguards", [
                AttributedBullet("Two-nurse independent double-check at order, dispensing, and administration for ISMP high-alert: insulin, opioids, anticoagulants, chemo, neuromuscular blockers, IV potassium >40 mEq/L, hypertonic saline, parenteral inotropes.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Standardized concentrations and pre-mixed bags reduce error.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Smart pump alerts and dose-error reduction systems must not be over-ridden routinely.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Tall-man lettering for look-alike/sound-alike drugs (HYDROmorphone vs HYDROXYzine; PEDIatric vs ADULT).", citationIDs: ["jc_npsg_ref"])
            ]),
            .bullets(title: "Common error patterns to actively prevent", [
                AttributedBullet("Sound-alike / look-alike confusion — speak names aloud, use generic + brand together.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Verbal orders during emergencies — read back ALL orders; transcribe immediately into chart.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Distractions during medication preparation — quiet zones in many facilities; do not interrupt.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Dose calculation errors — independent double-check on pediatric and weight-based doses.", citationIDs: ["jc_npsg_ref"])
            ]),
            .prose(title: "If a med error occurs", AttributedProse(
                "Notify the provider and assess the patient first. Stay with the patient. Document objectively in the chart what was given and the patient response — do NOT chart 'med error.' Complete the institution's incident report. Just-culture frameworks recognize that systems, not bad nurses, cause most errors; honest reporting makes systems safer.",
                citationIDs: ["jc_npsg_ref", "ahrq_ref_2"]
            ))
        ],
        citations: [jcRef, ahrqRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - National Patient Safety Goals

public enum NPSGsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "npsgs",
        title: "National Patient Safety Goals (NPSGs)",
        subtitle: "Joint Commission · annually updated · core hospital priorities",
        eyebrow: "REFERENCE · ACCREDITATION",
        nclexTags: safetyRefTags,
        sections: [
            .prose(title: "What they are", AttributedProse(
                "The National Patient Safety Goals are issued annually by The Joint Commission (TJC) to focus accredited organizations on the most pressing patient-safety concerns. Compliance is required for accreditation. Goals are concise, actionable, and evidence-based; specific Elements of Performance under each goal define what surveyors will assess.",
                citationIDs: ["jc_npsg_ref"]
            )),
            .keyValueTable(title: "Recurring NPSG themes (concept summary — review the current year list at jointcommission.org)", [
                KeyValueRow(key: "Identify patients correctly", value: "Two patient identifiers (NOT room number) before any treatment. Specifically before transfusions and procedures."),
                KeyValueRow(key: "Improve staff communication", value: "Critical results communicated to responsible provider in defined time; closed-loop verbal/phone orders; standardized handoff."),
                KeyValueRow(key: "Use medications safely", value: "Label all medications/syringes immediately; reduce harm from anticoagulant therapy; reconcile medications across transitions."),
                KeyValueRow(key: "Use alarms safely", value: "Reduce alarm fatigue — appropriate alarm parameters, alarm-management policies, alarm response protocols."),
                KeyValueRow(key: "Prevent infection", value: "Hand hygiene compliance; CLABSI prevention bundle; SSI prevention; CAUTI prevention; MDRO prevention."),
                KeyValueRow(key: "Identify safety risks", value: "Suicide risk screening for behavioral-health patients; PRESSURE injury risk assessment."),
                KeyValueRow(key: "Improve health-care equity", value: "Recent emphasis on disparity reduction across race, ethnicity, language, and disability."),
                KeyValueRow(key: "Universal Protocol", value: "Pre-procedure verification, site marking, time-out — to prevent wrong-patient/site/procedure events.")
            ]),
            .bullets(title: "How nurses operationalize NPSGs", [
                AttributedBullet("Two-identifier verification before EVERY medication, treatment, and specimen collection.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Critical lab/imaging values communicated to provider within facility-defined time (often 30–60 min); document time and recipient.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Medication reconciliation at every transition — admission, transfer, discharge.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Active hand hygiene — observed compliance directly affects accreditation.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Suicide risk screening per protocol (behavioral health units especially).", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Time-out before invasive procedures — full team pause to confirm patient, site, procedure.", citationIDs: ["jc_npsg_ref"])
            ]),
            .prose(title: "Why this matters", AttributedProse(
                "The current NPSG list changes; the underlying principles do not. Goals are derived from sentinel-event data — actual harm patterns. Compliance protects patients and the facility's accreditation status. Document compliance objectively — surveyors look for evidence in the chart, not just policies.",
                citationIDs: ["jc_npsg_ref"]
            ))
        ],
        citations: [jcRef, ahrqRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Universal Protocol / Time-Out

public enum UniversalProtocolSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "universal-protocol",
        title: "Universal Protocol & surgical time-out",
        subtitle: "Wrong-site, wrong-procedure, wrong-patient prevention",
        eyebrow: "REFERENCE · PERIOPERATIVE",
        nclexTags: mgmtTags,
        sections: [
            .prose(title: "The three components", AttributedProse(
                "The Joint Commission's Universal Protocol is a three-step process to prevent wrong-patient, wrong-site, and wrong-procedure events. Required for any invasive procedure (operative or bedside).",
                citationIDs: ["jc_npsg_ref"]
            )),
            .numberedSteps(title: "Step 1: Pre-procedure verification", [
                "Verify the correct patient, procedure, and site using all available documents — consent, history & physical, imaging, surgeon's notes — at every transition.",
                "Verify required equipment, blood products, implants, and special supplies are available.",
                "Verify allergies, anticoagulant status, NPO status, and lab/imaging results."
            ], citationIDs: ["jc_npsg_ref"]),
            .numberedSteps(title: "Step 2: Site marking", [
                "Surgeon (or licensed proceduralist) marks the operative site directly with their initials BEFORE the procedure.",
                "Mark must be visible after prep and draping.",
                "Patient (or family) involvement when possible — confirm site verbally with patient when alert.",
                "Mark all sites involving laterality, multiple structures (fingers, toes), or multiple levels (spine).",
                "Exceptions: emergency, midline structures, single-organ procedures, premature infants — document the exception."
            ], citationIDs: ["jc_npsg_ref"]),
            .numberedSteps(title: "Step 3: Time-out (immediately before procedure)", [
                "ALL team members STOP and actively participate; no other activity.",
                "Verify: correct patient identity, correct site, correct procedure, correct positioning, correct equipment, antibiotic prophylaxis given, blood products available if needed, imaging available.",
                "Any team member may halt if a discrepancy exists — flat hierarchy required.",
                "Document time-out completion with all team members named."
            ], citationIDs: ["jc_npsg_ref"]),
            .bullets(title: "Common failure points", [
                AttributedBullet("Time-out becomes ritualized rather than active — team must engage, not just nod.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Last-minute changes (different surgeon, different room, add-on case) skip verification.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Site marking by anyone other than the proceduralist — common error; only the operator marks.", citationIDs: ["jc_npsg_ref"]),
                AttributedBullet("Bedside procedures (central line, chest tube) often skip the time-out — apply Universal Protocol there too.", citationIDs: ["jc_npsg_ref"])
            ]),
            .prose(title: "Why it works", AttributedProse(
                "Wrong-site and wrong-patient events are sentinel — preventable, devastating, never-events. The Universal Protocol works because it adds redundant verification steps at independent points by independent team members. The time-out is the final checkpoint; treating it as ceremonial defeats its purpose. Make it active, halt for any concern, document precisely.",
                citationIDs: ["jc_npsg_ref"]
            ))
        ],
        citations: [jcRef, ahrqRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ABG Interpretation Algorithm

public enum ABGAlgorithmSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "abg-algorithm",
        title: "ABG interpretation — step-by-step algorithm",
        subtitle: "pH · CO₂ · HCO₃ · compensation",
        eyebrow: "REFERENCE · ACID-BASE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .acidBase),
        sections: [
            .keyValueTable(title: "Normal ranges", [
                KeyValueRow(key: "pH", value: "7.35 – 7.45"),
                KeyValueRow(key: "PaCO₂", value: "35 – 45 mmHg"),
                KeyValueRow(key: "HCO₃⁻", value: "22 – 26 mEq/L"),
                KeyValueRow(key: "PaO₂", value: "80 – 100 mmHg (room air)"),
                KeyValueRow(key: "SaO₂", value: "≥ 95% (room air)"),
                KeyValueRow(key: "Base excess", value: "−2 to +2 mEq/L")
            ]),
            .numberedSteps(title: "Step-by-step interpretation", [
                "Look at pH. <7.35 = acidosis. >7.45 = alkalosis. 7.35–7.45 = compensated or normal.",
                "Look at PaCO₂. >45 = respiratory acidosis. <35 = respiratory alkalosis. Normal in metabolic disorders.",
                "Look at HCO₃⁻. <22 = metabolic acidosis. >26 = metabolic alkalosis. Normal in respiratory disorders.",
                "Identify the PRIMARY disturbance — which value (CO₂ or HCO₃) matches the pH direction (acidosis vs alkalosis)?",
                "Identify COMPENSATION — does the other value (CO₂ or HCO₃) move in the OPPOSITE direction to push pH back toward normal? If yes, partial or full compensation.",
                "Calculate ANION GAP if metabolic acidosis — Na − (Cl + HCO₃). Normal 8–12. >12 = high-anion-gap metabolic acidosis (HAGMA)."
            ], citationIDs: ["openrn_ref_2"]),
            .keyValueTable(title: "Compensation patterns", [
                KeyValueRow(key: "Uncompensated", value: "pH abnormal, only PRIMARY moved (CO₂ or HCO₃); the other is normal."),
                KeyValueRow(key: "Partial compensation", value: "pH abnormal, BOTH CO₂ and HCO₃ moved (in opposite directions of normal)."),
                KeyValueRow(key: "Full compensation", value: "pH NORMAL, both CO₂ and HCO₃ moved opposite of each other."),
                KeyValueRow(key: "Mixed disorder", value: "Both CO₂ and HCO₃ moved in same direction (both worsen pH); requires further analysis.")
            ]),
            .keyValueTable(title: "Common causes by disorder", [
                KeyValueRow(key: "Respiratory acidosis", value: "Hypoventilation — opioid OD, COPD exacerbation, neuromuscular disease, OSA."),
                KeyValueRow(key: "Respiratory alkalosis", value: "Hyperventilation — anxiety, pain, sepsis, PE, salicylate toxicity (early)."),
                KeyValueRow(key: "Metabolic acidosis (HIGH gap — MUDPILES)", value: "Methanol, Uremia, DKA, Propylene glycol, Iron/INH, Lactate, Ethylene glycol, Salicylates."),
                KeyValueRow(key: "Metabolic acidosis (NORMAL gap — HARD-UP)", value: "Hyperalimentation, Acetazolamide, Renal tubular acidosis, Diarrhea, Ureterosigmoid loop, Pancreatic fistula."),
                KeyValueRow(key: "Metabolic alkalosis", value: "Vomiting, NG suction, diuretics, hyperaldosteronism, excess bicarb intake.")
            ]),
            .bullets(title: "Key clinical pearls", [
                AttributedBullet("ROME mnemonic: Respiratory Opposite (pH and CO₂ move opposite directions in respiratory disorder); Metabolic Equal (pH and HCO₃ move same direction in metabolic disorder).", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Acute respiratory acidosis raises HCO₃ by ~1 for every 10 of CO₂ rise; chronic by ~3.5 for every 10.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Severe acidosis (pH <7.20) impairs cardiac contractility and vasopressor response — ICU.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Severe alkalosis (pH >7.55) causes hypocalcemia, arrhythmias, seizures.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Treat the CAUSE, not the number — bicarbonate is rarely indicated for metabolic acidosis.", citationIDs: ["openrn_ref_2"])
            ])
        ],
        citations: [openrnRef2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Insulin Types Comparison

public enum InsulinTypesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "insulin-types",
        title: "Insulin types — onset, peak, duration",
        subtitle: "Rapid · short · intermediate · long-acting · ultra-long",
        eyebrow: "REFERENCE · DIABETES",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .glucoseRegulation),
        sections: [
            .keyValueTable(title: "Rapid-acting (mealtime)", [
                KeyValueRow(key: "Lispro (Humalog)", value: "Onset 10–15 min · Peak 30–90 min · Duration 3–5 hr"),
                KeyValueRow(key: "Aspart (NovoLog)", value: "Onset 10–20 min · Peak 1–3 hr · Duration 3–5 hr"),
                KeyValueRow(key: "Glulisine (Apidra)", value: "Onset 10–15 min · Peak 30–90 min · Duration 3–5 hr"),
                KeyValueRow(key: "Inhaled (Afrezza)", value: "Onset ~12 min · Peak 35–55 min · Duration 1.5–3 hr")
            ]),
            .keyValueTable(title: "Short-acting", [
                KeyValueRow(key: "Regular (Humulin R, Novolin R)", value: "Onset 30 min – 1 hr · Peak 2–4 hr · Duration 6–8 hr"),
                KeyValueRow(key: "U-500 Regular", value: "Concentrated (5× normal); use specialized syringe — error risk")
            ]),
            .keyValueTable(title: "Intermediate", [
                KeyValueRow(key: "NPH (Humulin N, Novolin N)", value: "Onset 1–2 hr · Peak 4–12 hr · Duration 12–18 hr — cloudy, must roll between palms"),
                KeyValueRow(key: "70/30 (NPH + regular)", value: "Premixed; convenient but less flexible")
            ]),
            .keyValueTable(title: "Long-acting basal", [
                KeyValueRow(key: "Glargine U-100 (Lantus, Basaglar)", value: "Onset 1–2 hr · Essentially peakless · Duration ~24 hr"),
                KeyValueRow(key: "Glargine U-300 (Toujeo)", value: "Onset 6 hr · Peakless · Duration up to 36 hr"),
                KeyValueRow(key: "Detemir (Levemir)", value: "Onset 1–2 hr · Slight peak 6–8 hr · Duration 12–24 hr"),
                KeyValueRow(key: "Degludec (Tresiba)", value: "Onset 1 hr · No peak · Duration >42 hr (ultra-long)")
            ]),
            .bullets(title: "Mixing rules", [
                AttributedBullet("CLEAR before CLOUDY — when drawing both clear (regular/rapid) and cloudy (NPH) into one syringe, draw the CLEAR insulin first.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("DO NOT mix glargine, detemir, degludec, or other long-acting analogs with any other insulin in the same syringe.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Roll cloudy insulin (NPH) gently between palms — do NOT shake (creates bubbles, alters dose).", citationIDs: ["openrn_ref_2"])
            ]),
            .bullets(title: "Storage", [
                AttributedBullet("Unopened: refrigerate 36–46°F; do not freeze.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Opened (in use): generally OK at room temperature 28 days (varies by product — check insert); do not expose to direct heat or sunlight.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Pens: room temp once in use; refrigerate spares.", citationIDs: ["openrn_ref_2"])
            ]),
            .bullets(title: "Patient education essentials", [
                AttributedBullet("Two-nurse verification (ISMP high-alert).", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Verify CONCENTRATION (U-100 vs U-200, U-300, U-500); not interchangeable unit-for-unit.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Rotate injection sites — same anatomical area for consistent absorption (e.g., always abdomen for breakfast dose).", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Carry rapid-acting carb at all times; teach 15-15 rule (15 g carb, recheck in 15 min).", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Sick-day plan — never stop basal insulin; check ketones; hydrate; call diabetes team.", citationIDs: ["openrn_ref_2"])
            ])
        ],
        citations: [openrnRef2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric Vital Signs by Age

public enum PediatricVitalsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pediatric-vitals",
        title: "Pediatric vital signs by age",
        subtitle: "Normal HR, RR, BP from neonate to adolescent",
        eyebrow: "REFERENCE · PEDIATRICS",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Why pediatric vitals matter", AttributedProse(
                "Pediatric vital signs change dramatically with age. Tachycardia (and tachypnea) is the earliest sign of compensation in pediatric shock; hypotension is a LATE sign indicating decompensation. Always compare to age-appropriate reference, not adult values.",
                citationIDs: ["openrn_ref_2"]
            )),
            .keyValueTable(title: "Heart rate (awake, beats/min)", [
                KeyValueRow(key: "Neonate (0–1 mo)", value: "100 – 205"),
                KeyValueRow(key: "Infant (1 mo – 1 yr)", value: "100 – 180"),
                KeyValueRow(key: "Toddler (1–3 yr)", value: "98 – 140"),
                KeyValueRow(key: "Preschool (3–5 yr)", value: "80 – 120"),
                KeyValueRow(key: "School age (6–11 yr)", value: "75 – 118"),
                KeyValueRow(key: "Adolescent (12–18 yr)", value: "60 – 100")
            ]),
            .keyValueTable(title: "Respiratory rate (breaths/min)", [
                KeyValueRow(key: "Neonate (0–1 mo)", value: "30 – 60"),
                KeyValueRow(key: "Infant (1 mo – 1 yr)", value: "30 – 53"),
                KeyValueRow(key: "Toddler (1–3 yr)", value: "22 – 37"),
                KeyValueRow(key: "Preschool (3–5 yr)", value: "20 – 28"),
                KeyValueRow(key: "School age (6–11 yr)", value: "18 – 25"),
                KeyValueRow(key: "Adolescent (12–18 yr)", value: "12 – 20")
            ]),
            .keyValueTable(title: "Systolic blood pressure (mmHg, lower limit)", [
                KeyValueRow(key: "Neonate", value: ">60 (term)"),
                KeyValueRow(key: "Infant (1 mo – 1 yr)", value: ">70"),
                KeyValueRow(key: "1–10 yr (formula)", value: "70 + (2 × age in years)"),
                KeyValueRow(key: ">10 yr", value: ">90")
            ]),
            .bullets(title: "Pediatric assessment pearls", [
                AttributedBullet("Capillary refill <2 sec is normal; >2–3 sec suggests poor perfusion.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("HYPOTENSION IS A LATE SIGN — children compensate well until they crash.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Tachycardia is the EARLIEST sign of pediatric shock — investigate, do not dismiss.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Mottled extremities, prolonged cap refill, weak pulses, irritability, poor feeding — early shock signs.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Use age- and length-based equipment (Broselow tape) for emergency dosing and equipment sizing.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Temperature: rectal preferred for accuracy in <3 months; tympanic reasonable in older infants/children.", citationIDs: ["openrn_ref_2"])
            ]),
            .bullets(title: "Pediatric Early Warning Score (PEWS) — concept", [
                AttributedBullet("Validated scoring system using behavior, cardiovascular, and respiratory parameters; triggers escalation.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Low scores warrant routine monitoring; rising scores trigger assessment, provider notification, RRT activation.", citationIDs: ["openrn_ref_2"])
            ])
        ],
        citations: [openrnRef2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Sepsis 1-Hour Bundle

public enum SepsisBundleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "sepsis-bundle",
        title: "Sepsis 1-hour bundle (SEP-1)",
        subtitle: "Surviving Sepsis · CMS quality measure",
        eyebrow: "REFERENCE · SEPSIS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Recognition triggers", AttributedProse(
                "Suspect sepsis in any patient with infection (suspected or confirmed) plus 2+ SIRS criteria, qSOFA ≥2, or SEP-1 organ dysfunction criteria. Older adults may present without fever or leukocytosis — confusion, hypotension, or 'not herself' may be the only signs.",
                citationIDs: ["cms_ref_2", "cdc_ref_2"]
            )),
            .keyValueTable(title: "Screening criteria", [
                KeyValueRow(key: "SIRS (any 2)", value: "Temp >38°C or <36°C · HR >90 · RR >20 · WBC >12 or <4 or >10% bands"),
                KeyValueRow(key: "qSOFA (any 2)", value: "RR ≥22 · altered mental status (GCS <15) · SBP ≤100"),
                KeyValueRow(key: "Severe sepsis", value: "Sepsis + organ dysfunction (lactate ≥2, AKI, hypoxia, coagulopathy, hyperbilirubinemia, AMS)"),
                KeyValueRow(key: "Septic shock", value: "Sepsis + persistent hypotension requiring vasopressors AND lactate >2 despite fluid resuscitation")
            ]),
            .numberedSteps(title: "Within 1 hour of recognition", [
                "Measure LACTATE level. Re-measure if initial lactate >2 mmol/L within 6 hours.",
                "Obtain BLOOD CULTURES (two sets, two sites) BEFORE antibiotics whenever possible.",
                "Administer BROAD-SPECTRUM ANTIBIOTICS (within 1 hour — every hour of delay increases mortality).",
                "Begin rapid IV CRYSTALLOID FLUID 30 mL/kg for hypotension or lactate ≥4 mmol/L.",
                "Apply VASOPRESSORS if hypotensive during or after fluid resuscitation to maintain MAP ≥65 mmHg (norepinephrine first-line)."
            ], citationIDs: ["cms_ref_2"]),
            .bullets(title: "Source control", [
                AttributedBullet("Identify source — chest, urine, abdomen, skin, line, CSF, joint.", citationIDs: ["cms_ref_2"]),
                AttributedBullet("Achieve source control within 6–12 hours — drain abscess, remove infected line, surgical debridement.", citationIDs: ["cms_ref_2"]),
                AttributedBullet("De-escalate antibiotics when culture/sensitivity available.", citationIDs: ["cms_ref_2"])
            ]),
            .bullets(title: "Common pitfalls", [
                AttributedBullet("Delayed recognition — older adults often present atypically; trust the trend.", citationIDs: ["cms_ref_2"]),
                AttributedBullet("Antibiotics not given because cultures not yet drawn — prioritize antibiotics if cultures will delay >45 min.", citationIDs: ["cms_ref_2"]),
                AttributedBullet("Inadequate volume resuscitation — give the full 30 mL/kg unless clear contraindication (decompensated CHF requires modification).", citationIDs: ["cms_ref_2"]),
                AttributedBullet("Vasopressor delay — start at end of bolus if BP not responding; do not chase fluid resuscitation indefinitely.", citationIDs: ["cms_ref_2"])
            ]),
            .prose(title: "Why bundles work", AttributedProse(
                "Each hour of delay in antibiotic administration in septic shock increases mortality by ~7.6%. Bundled protocols ensure all critical interventions happen, in order, on time. The SEP-1 quality measure ties hospital reimbursement to bundle compliance. Document every element with timestamp.",
                citationIDs: ["cms_ref_2", "cdc_ref_2"]
            ))
        ],
        citations: [cmsRef, cdcRef],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - STEMI Door-to-Balloon

public enum STEMIBundleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "stemi-bundle",
        title: "STEMI care bundle — door-to-balloon",
        subtitle: "Time is muscle · 90 min target",
        eyebrow: "REFERENCE · ACS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Recognition", AttributedProse(
                "ST-elevation myocardial infarction (STEMI) requires immediate reperfusion. Time-to-reperfusion is the strongest predictor of survival and ventricular function. Goal: door-to-balloon ≤90 minutes for primary PCI; door-to-needle ≤30 minutes for thrombolytic if PCI unavailable within 120 minutes.",
                citationIDs: ["aha_ref"]
            )),
            .keyValueTable(title: "ECG criteria for STEMI", [
                KeyValueRow(key: "ST elevation", value: "≥1 mm in 2+ contiguous limb leads OR ≥2 mm in 2+ contiguous precordial leads (1.5 mm in V2–V3 in women)"),
                KeyValueRow(key: "New LBBB", value: "With clinical features of MI"),
                KeyValueRow(key: "Posterior MI", value: "ST DEPRESSION in V1–V3 with tall R waves; obtain V7–V9"),
                KeyValueRow(key: "Right ventricular MI", value: "Inferior MI (II, III, aVF) → obtain V4R; ST elevation = RV involvement; AVOID nitroglycerin/diuretics")
            ]),
            .numberedSteps(title: "Initial actions (within 10 minutes of arrival)", [
                "12-lead ECG — within 10 minutes of arrival.",
                "Aspirin 162–325 mg CHEWED.",
                "Oxygen if SpO₂ <90% (not routine if normal).",
                "Continuous cardiac monitoring; defibrillator at bedside.",
                "IV access × 2 (large-bore); blood for troponin, BMP, CBC, coag, type/screen.",
                "Pain control — nitroglycerin SL ×3 every 5 min (if no inferior/RV MI, no recent PDE inhibitors); morphine if persistent.",
                "P2Y12 inhibitor (clopidogrel, prasugrel, ticagrelor) per cath lab/cardiology.",
                "Anticoagulation (heparin, bivalirudin, enoxaparin) per protocol.",
                "Activate cath lab — door-to-balloon ≤90 min target."
            ], citationIDs: ["aha_ref"]),
            .bullets(title: "Reperfusion options", [
                AttributedBullet("Primary PCI — preferred when available within 90 min of first medical contact.", citationIDs: ["aha_ref"]),
                AttributedBullet("Fibrinolytic — if PCI unavailable within 120 min, give within 30 min of arrival (door-to-needle); transfer for rescue PCI if no resolution.", citationIDs: ["aha_ref"]),
                AttributedBullet("Contraindications to fibrinolytic — review carefully (recent stroke, surgery, trauma, severe HTN, etc.).", citationIDs: ["aha_ref"])
            ]),
            .bullets(title: "Inferior / right ventricular MI cautions", [
                AttributedBullet("RV infarct often presents with hypotension, JVD, clear lungs.", citationIDs: ["aha_ref"]),
                AttributedBullet("AVOID nitrates and diuretics — RV is preload-dependent; will crash BP.", citationIDs: ["aha_ref"]),
                AttributedBullet("Treat hypotension with IV FLUIDS first.", citationIDs: ["aha_ref"]),
                AttributedBullet("Obtain right-sided leads (V4R) on any inferior STEMI.", citationIDs: ["aha_ref"])
            ]),
            .bullets(title: "Post-reperfusion / post-MI management", [
                AttributedBullet("Continuous cardiac monitoring × 48–72 hr (arrhythmia risk highest first 48 hr).", citationIDs: ["aha_ref"]),
                AttributedBullet("Beta-blocker, ACE inhibitor (or ARB), statin, dual antiplatelet for secondary prevention.", citationIDs: ["aha_ref"]),
                AttributedBullet("Cardiac rehab referral — improves mortality and function.", citationIDs: ["aha_ref"]),
                AttributedBullet("Watch for complications — papillary muscle rupture, ventricular septal rupture, free wall rupture, LV thrombus, arrhythmias, cardiogenic shock.", citationIDs: ["aha_ref"])
            ])
        ],
        citations: [ahaRef, openrnRef2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ACLS Algorithms Summary

public enum ACLSAlgorithmsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "acls-algorithms",
        title: "ACLS algorithms — summary",
        subtitle: "VF/pulseless VT · PEA/asystole · bradycardia · tachycardia",
        eyebrow: "REFERENCE · CODE BLUE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Universal principles", AttributedProse(
                "Quality CPR is the foundation: push hard (≥2 in), push fast (100–120/min), allow full recoil, minimize interruptions (>10 sec reduces survival), avoid excessive ventilation, rotate compressors every 2 minutes. Defibrillate shockable rhythms ASAP. Identify and treat reversible causes (Hs and Ts).",
                citationIDs: ["aha_ref"]
            )),
            .numberedSteps(title: "VF / Pulseless VT (shockable)", [
                "CPR + rhythm check every 2 min.",
                "Defibrillate (biphasic 120–200 J or per device) ASAP; resume CPR immediately.",
                "Epinephrine 1 mg IV/IO every 3–5 minutes.",
                "Amiodarone 300 mg IV/IO bolus (then 150 mg if recurs) OR Lidocaine 1–1.5 mg/kg IV/IO.",
                "Continue CPR, defibrillate at every rhythm check if shockable, identify reversible causes."
            ], citationIDs: ["aha_ref"]),
            .numberedSteps(title: "PEA / Asystole (non-shockable)", [
                "CPR + rhythm check every 2 min — DO NOT defibrillate.",
                "Epinephrine 1 mg IV/IO every 3–5 minutes (give as soon as feasible).",
                "Aggressively search for and treat reversible causes (Hs and Ts).",
                "Continue CPR; consider termination per protocol after appropriate workup."
            ], citationIDs: ["aha_ref"]),
            .keyValueTable(title: "Reversible causes (Hs and Ts)", [
                KeyValueRow(key: "Hypovolemia", value: "IV fluids; consider blood"),
                KeyValueRow(key: "Hypoxia", value: "Oxygenation, ventilation, secure airway"),
                KeyValueRow(key: "Hydrogen ion (acidosis)", value: "Ventilation; bicarbonate for severe"),
                KeyValueRow(key: "Hypo/hyperkalemia", value: "Calcium, insulin/D50, bicarb (hyperK); KCl (hypoK)"),
                KeyValueRow(key: "Hypothermia", value: "Active warming"),
                KeyValueRow(key: "Tension pneumothorax", value: "Needle decompression then chest tube"),
                KeyValueRow(key: "Tamponade (cardiac)", value: "Pericardiocentesis"),
                KeyValueRow(key: "Toxins", value: "Antidotes — naloxone, calcium, lipid emulsion, sodium bicarbonate"),
                KeyValueRow(key: "Thrombosis (PE)", value: "Thrombolytic during arrest if suspected"),
                KeyValueRow(key: "Thrombosis (MI)", value: "Reperfusion post-arrest")
            ]),
            .numberedSteps(title: "Symptomatic bradycardia (HR <50 with poor perfusion)", [
                "Identify and treat underlying cause (hypoxia, drug toxicity).",
                "Atropine 1 mg IV/IO (may repeat every 3–5 min, max 3 mg).",
                "If atropine ineffective: transcutaneous pacing OR dopamine 5–20 mcg/kg/min OR epinephrine 2–10 mcg/min infusion.",
                "Expert consult; transvenous pacing as needed."
            ], citationIDs: ["aha_ref"]),
            .numberedSteps(title: "Tachycardia with pulse — STABLE", [
                "Narrow regular: vagal maneuvers; adenosine 6 mg IV rapid push (then 12 mg if needed).",
                "Narrow irregular (AFib): rate control with diltiazem or beta-blocker; rhythm control per cardiology.",
                "Wide regular (likely VT): amiodarone 150 mg IV over 10 min OR procainamide; consult cardiology.",
                "Wide irregular (polymorphic VT, AFib with WPW): consult cardiology — DO NOT use AV nodal blockers if WPW."
            ], citationIDs: ["aha_ref"]),
            .numberedSteps(title: "Tachycardia with pulse — UNSTABLE (chest pain, AMS, hypotension, signs of shock)", [
                "Synchronized cardioversion at appropriate energy (narrow regular 50–100 J · narrow irregular 120–200 J · wide regular 100 J · wide irregular: defibrillation dose).",
                "Sedate if alert.",
                "Treat reversible causes."
            ], citationIDs: ["aha_ref"]),
            .bullets(title: "Post-arrest care (ROSC)", [
                AttributedBullet("Targeted temperature management (32–36°C for 24 hr) for unresponsive patients post-arrest.", citationIDs: ["aha_ref"]),
                AttributedBullet("Treat reversible cause — coronary angiography if suspected ACS.", citationIDs: ["aha_ref"]),
                AttributedBullet("Hemodynamic support to MAP ≥65; avoid hypoxemia and hyperoxia (titrate FiO₂ to SpO₂ 94–98%).", citationIDs: ["aha_ref"]),
                AttributedBullet("Glucose control, seizure monitoring, neurologic prognostication after 72 hours.", citationIDs: ["aha_ref"])
            ])
        ],
        citations: [ahaRef, openrnRef2],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Common Lab Panels

public enum LabPanelsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "lab-panels",
        title: "Common lab panels — components",
        subtitle: "BMP · CMP · CBC · LFTs · coag",
        eyebrow: "REFERENCE · LABS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        sections: [
            .keyValueTable(title: "Basic Metabolic Panel (BMP) — 8 components", [
                KeyValueRow(key: "Sodium (Na)", value: "135–145 mEq/L"),
                KeyValueRow(key: "Potassium (K)", value: "3.5–5.0 mEq/L"),
                KeyValueRow(key: "Chloride (Cl)", value: "96–106 mEq/L"),
                KeyValueRow(key: "Bicarbonate (HCO₃)", value: "22–26 mEq/L"),
                KeyValueRow(key: "BUN", value: "10–20 mg/dL"),
                KeyValueRow(key: "Creatinine", value: "0.6–1.2 mg/dL"),
                KeyValueRow(key: "Glucose", value: "70–110 mg/dL fasting"),
                KeyValueRow(key: "Calcium (total)", value: "8.5–10.5 mg/dL")
            ]),
            .keyValueTable(title: "Comprehensive Metabolic Panel (CMP) — BMP + 6 LFT/protein", [
                KeyValueRow(key: "All BMP components", value: "Plus the following:"),
                KeyValueRow(key: "Albumin", value: "3.5–5.0 g/dL"),
                KeyValueRow(key: "Total protein", value: "6.0–8.0 g/dL"),
                KeyValueRow(key: "Bilirubin (total)", value: "0.1–1.2 mg/dL"),
                KeyValueRow(key: "Alkaline phosphatase", value: "40–129 U/L"),
                KeyValueRow(key: "AST (SGOT)", value: "10–40 U/L"),
                KeyValueRow(key: "ALT (SGPT)", value: "7–56 U/L")
            ]),
            .keyValueTable(title: "Complete Blood Count (CBC) — components", [
                KeyValueRow(key: "WBC", value: "4,500–11,000/μL"),
                KeyValueRow(key: "RBC", value: "M 4.7–6.1 · F 4.2–5.4 million/μL"),
                KeyValueRow(key: "Hemoglobin (Hgb)", value: "M 14–18 · F 12–16 g/dL"),
                KeyValueRow(key: "Hematocrit (Hct)", value: "M 41–53% · F 36–46%"),
                KeyValueRow(key: "Platelets", value: "150,000–400,000/μL"),
                KeyValueRow(key: "MCV (mean cell volume)", value: "80–100 fL"),
                KeyValueRow(key: "MCH / MCHC", value: "Mean cell Hgb / Hgb concentration — characterize anemia"),
                KeyValueRow(key: "RDW", value: "Red cell distribution width — variability in size")
            ]),
            .keyValueTable(title: "WBC differential", [
                KeyValueRow(key: "Neutrophils (segs)", value: "55–70%"),
                KeyValueRow(key: "Bands (immature neutrophils)", value: "0–5% — 'left shift' >10% in severe infection"),
                KeyValueRow(key: "Lymphocytes", value: "20–40%"),
                KeyValueRow(key: "Monocytes", value: "2–8%"),
                KeyValueRow(key: "Eosinophils", value: "1–4% — elevated in allergy, parasitic infection"),
                KeyValueRow(key: "Basophils", value: "0.5–1%")
            ]),
            .keyValueTable(title: "Coagulation panel", [
                KeyValueRow(key: "PT", value: "11–13 sec"),
                KeyValueRow(key: "INR", value: "0.8–1.2 normal · 2–3 therapeutic warfarin · 2.5–3.5 mech valve"),
                KeyValueRow(key: "aPTT", value: "25–35 sec normal · 1.5–2.5× control on heparin"),
                KeyValueRow(key: "Fibrinogen", value: "200–400 mg/dL"),
                KeyValueRow(key: "D-dimer", value: "<500 ng/mL FEU normal")
            ]),
            .keyValueTable(title: "Liver function tests (LFTs) extended", [
                KeyValueRow(key: "AST / ALT", value: "Hepatocellular injury — viral hepatitis, drug-induced, ischemia"),
                KeyValueRow(key: "Alkaline phosphatase / GGT", value: "Cholestasis — biliary obstruction, primary biliary cholangitis"),
                KeyValueRow(key: "Bilirubin (direct vs indirect)", value: "Direct = conjugated (post-hepatic) · indirect = unconjugated (pre-hepatic)"),
                KeyValueRow(key: "Albumin", value: "Hepatic synthesis — chronic liver disease, malnutrition"),
                KeyValueRow(key: "INR", value: "Hepatic synthesis (factor VII) — acute liver failure if INR >1.5 + encephalopathy")
            ]),
            .keyValueTable(title: "Cardiac enzymes / markers", [
                KeyValueRow(key: "Troponin I or T", value: "Cardiac muscle injury — most sensitive/specific for MI; rises 2–4 hr, peaks 12–24 hr, lasts days"),
                KeyValueRow(key: "CK-MB", value: "Cardiac muscle injury — useful for reinfarction (troponin stays elevated)"),
                KeyValueRow(key: "BNP / NT-proBNP", value: "Heart failure — ventricular stretch hormone")
            ]),
            .bullets(title: "Pearls", [
                AttributedBullet("Trend matters — single value within 'normal' may be abnormal for a patient (Hgb dropping from 13 to 11 is significant even if 'normal').", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Critical values must be communicated to provider per facility protocol (often <30 min); document call.", citationIDs: ["openrn_ref_2"]),
                AttributedBullet("Specimen handling matters — hemolysis falsely elevates K, LDH, AST; clotted CBC samples invalidate platelets.", citationIDs: ["openrn_ref_2"])
            ])
        ],
        citations: [openrnRef2],
        lastSourceFidelityReview: "2026-05-04"
    )
}
