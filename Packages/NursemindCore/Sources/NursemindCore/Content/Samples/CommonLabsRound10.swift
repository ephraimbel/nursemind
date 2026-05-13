import Foundation

// Curator-model lab entries (round 10 expansion — toxicology + STI workup).
// Sources: Open RN Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills
// (CC BY 4.0 with AI restriction), CDC + AAPCC concept citations.

private let openrnLabsR10 = CitationSource(
    id: "openrn_labs_round10",
    shortName: "Open RN Health Alterations — toxicology + STI labs",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=anion+gap+RPR+UDS",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR10 = CitationSource(
    id: "openstax_labs_round10",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let cdcLabsR10 = CitationSource(
    id: "cdc_labs_round10",
    shortName: "CDC STI testing + drug-screening guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/std/treatment-guidelines/",
    lastRetrieved: "2026-05-04"
)
private let aapccConceptR10 = CitationSource(
    id: "aapcc_round10",
    shortName: "AAPCC / SAMHSA toxicology guidance (concept citation)",
    publisher: "AAPCC · SAMHSA",
    license: .factCitationOnly,
    url: "https://aapcc.org/clinical-guidelines",
    lastRetrieved: "2026-05-04"
)

private let toxLabR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)
private let infectionLabR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection)
private let acidBaseLabR10 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .acidBase)

// MARK: - Anion Gap

public enum AnionGapSample {
    public static let entry: LabEntry = LabEntry(
        id: "anion-gap",
        title: "Anion Gap",
        subtitle: "Calculated · screen for unmeasured-anion metabolic acidosis · MUDPILES",
        specimen: "Serum (gold-top SST) — calculated from BMP",
        nclexTags: acidBaseLabR10,
        referenceRanges: [
            ReferenceRangeRow(value: "Normal: 8–12 mEq/L (with K), or 7–13 mEq/L (without K, depending on lab)", label: "Reference", citationIDs: ["openstax_labs_round10"]),
            ReferenceRangeRow(value: "Anion gap = Na − (Cl + HCO3); some labs include K", label: "Calculation", citationIDs: ["openrn_labs_round10"]),
            ReferenceRangeRow(value: "Always interpret WITH albumin — corrected AG = AG + 2.5 × (4 − measured albumin)", label: "Albumin correction", citationIDs: ["openrn_labs_round10"]),
            ReferenceRangeRow(value: "Delta-delta ratio assesses mixed acid-base disorders", label: "Mixed disorders", citationIDs: ["openrn_labs_round10"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated anion gap (>12)",
                summary: "Indicates metabolic acidosis from accumulation of unmeasured anions. Mnemonic MUDPILES — Methanol, Uremia, DKA / alcoholic ketoacidosis, Propylene glycol / Paraldehyde, Iron / INH, Lactic acidosis, Ethylene glycol, Salicylates per primary source.",
                nursingActions: [
                    "Trend BMP, ABG, lactate, ketones, glucose, salicylate / acetaminophen, methanol / ethylene glycol if suspected",
                    "Coordinate with provider on cause-specific therapy (insulin for DKA, fomepizole for toxic alcohols, dialysis for salicylate / methanol / lactic acidosis from metformin)",
                    "Pair with osmolar gap if toxic alcohol suspected"
                ],
                citationIDs: ["openrn_labs_round10"]
            ),
            InterpretationTier(
                severity: .normal,
                label: "Normal anion gap acidosis (HARDUP / GI losses)",
                summary: "Hyperchloremic non-anion-gap metabolic acidosis — diarrhea (most common), renal tubular acidosis, ureteral diversion, post-hypocapnia, NS-induced (large volume), Addison's, pancreatic fistula. Mnemonic HARDUP — Hyperalimentation/TPN, Acetazolamide / Addison's, RTA, Diarrhea, Ureteroenterostomy, Pancreatic fistula.",
                nursingActions: [
                    "Identify cause; bicarbonate replacement per provider for severe acidosis",
                    "Treat underlying — diarrhea, RTA workup, etc."
                ],
                citationIDs: ["openrn_labs_round10"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Elevated anion gap (MUDPILES)",
                causes: [
                    "Methanol → formate",
                    "Uremia (renal failure)",
                    "DKA, alcoholic / starvation ketoacidosis",
                    "Propylene glycol (high-dose lorazepam infusion)",
                    "Iron, INH, ibuprofen overdose",
                    "Lactic acidosis (sepsis, ischemia, metformin, cyanide, CO)",
                    "Ethylene glycol → glycolate / oxalate",
                    "Salicylate (mixed metabolic acidosis + respiratory alkalosis)"
                ],
                citationIDs: ["openrn_labs_round10"]
            )
        ],
        nursingActions: [
            AttributedBullet("Correct AG for hypoalbuminemia — every 1 g/dL drop in albumin lowers AG by 2.5 mEq/L per primary source.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("In severe acidosis, pair AG with osmolar gap (toxic alcohols), lactate, ketones, salicylate, BUN.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Activate poison control + nephrology / ICU for severe metabolic acidosis with high AG.", citationIDs: ["openrn_labs_round10"])
        ],
        watchFor: [
            AttributedBullet("Severe AG metabolic acidosis with rapid progression — consider dialyzable toxins (methanol, ethylene glycol, salicylate, metformin, lithium).", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Mixed acid-base disorder — assess delta-delta ratio (Δ AG / Δ HCO3); ratio <1 suggests concurrent non-AG acidosis; >2 suggests concurrent metabolic alkalosis.", citationIDs: ["openrn_labs_round10"])
        ],
        citations: [openrnLabsR10, openstaxLabsR10, aapccConceptR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - RPR + Treponemal Testing

public enum RPRSample {
    public static let entry: LabEntry = LabEntry(
        id: "rpr-treponemal",
        title: "RPR / VDRL + Treponemal Testing",
        subtitle: "Syphilis serology · screen → confirm · titer monitors response",
        specimen: "Serum (gold-top SST)",
        nclexTags: infectionLabR10,
        referenceRanges: [
            ReferenceRangeRow(value: "RPR / VDRL: non-reactive (negative) is normal; quantitative titers reported as reciprocal dilution (1:1, 1:2, ... 1:512)", label: "Non-treponemal screen", citationIDs: ["openrn_labs_round10"]),
            ReferenceRangeRow(value: "Treponemal (FTA-ABS, TP-PA, EIA, CIA): non-reactive is normal", label: "Treponemal confirm", citationIDs: ["openrn_labs_round10"]),
            ReferenceRangeRow(value: "Positive treponemal lasts LIFELONG; non-treponemal titer falls with treatment", label: "Lifelong vs response", citationIDs: ["openrn_labs_round10"]),
            ReferenceRangeRow(value: "4-fold (≥2 dilutions) drop in titer at 6–12 months = adequate response per primary source", label: "Treatment response", citationIDs: ["cdc_labs_round10"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive RPR + positive treponemal",
                summary: "Active or treated syphilis. Stage by clinical exam, prior treatment history, and titer pattern. Treat per CDC stage-specific regimens. Repeat serology at 6 and 12 months.",
                nursingActions: [
                    "Treat per CDC stage (single-dose IM benzathine penicillin G for primary / secondary / early latent; weekly × 3 for late latent / tertiary)",
                    "Trend RPR titer — 4-fold drop = adequate response per primary source",
                    "Coordinate partner notification, HIV / STI co-screen"
                ],
                citationIDs: ["cdc_labs_round10"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Reactive RPR + negative treponemal",
                summary: "Likely false-positive RPR (autoimmune disease, pregnancy, IDU, viral infection, age) — NOT syphilis. Reassure, repeat in 4–6 weeks if pretest probability of syphilis is significant.",
                nursingActions: [
                    "Document false-positive; investigate underlying cause",
                    "No treatment for syphilis"
                ],
                citationIDs: ["openrn_labs_round10"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of false-positive RPR (non-treponemal)",
                causes: [
                    "Autoimmune disease — SLE, antiphospholipid syndrome, RA",
                    "Pregnancy",
                    "IV drug use",
                    "Recent viral / bacterial illness, vaccination",
                    "Age",
                    "Lyme disease, leprosy, malaria, TB"
                ],
                citationIDs: ["openrn_labs_round10"]
            )
        ],
        nursingActions: [
            AttributedBullet("CDC recommends reverse-sequence algorithm in many labs — treponemal first (CIA / EIA), then RPR if positive; some clinicians prefer traditional algorithm (RPR first).", citationIDs: ["cdc_labs_round10"]),
            AttributedBullet("Universal syphilis screening at first prenatal visit; rescreen high-risk and at delivery per primary source.", citationIDs: ["cdc_labs_round10"]),
            AttributedBullet("Document pre-treatment titer and date; the trend matters more than absolute value.", citationIDs: ["openrn_labs_round10"])
        ],
        watchFor: [
            AttributedBullet("PROZONE phenomenon — false-negative RPR at very high titers (e.g., congenital syphilis); request lab dilution if clinical suspicion despite negative result per primary source.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Treatment failure or reinfection — rising titer; re-examine, retreat, partner workup.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Neurosyphilis — CSF VDRL (NOT RPR) for diagnosis; LP for advanced disease, neurologic / ophthalmic / otic symptoms, treatment failure per primary source.", citationIDs: ["cdc_labs_round10"])
        ],
        citations: [openrnLabsR10, openstaxLabsR10, cdcLabsR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Urine Drug Screen

public enum UDSSample {
    public static let entry: LabEntry = LabEntry(
        id: "uds",
        title: "Urine Drug Screen (UDS)",
        subtitle: "Immunoassay panel · false positives common · GC-MS confirms",
        specimen: "Random urine",
        nclexTags: toxLabR10,
        referenceRanges: [
            ReferenceRangeRow(value: "Standard panel (\"5-panel\" or \"10-panel\"): amphetamines, cannabinoids (THC), cocaine metabolite, opioids, PCP; expanded panels add benzos, barbiturates, methadone, MDMA, oxycodone", label: "Typical panel", citationIDs: ["openrn_labs_round10"]),
            ReferenceRangeRow(value: "Detection windows vary — amphetamines / cocaine 1–3 days; opioids 1–3 days; benzos 1–7 days (longer with chronic use); THC 1–30+ days (chronic heavy)", label: "Detection windows", citationIDs: ["openrn_labs_round10"]),
            ReferenceRangeRow(value: "POSITIVE immunoassay should be CONFIRMED with GC-MS or LC-MS/MS for definitive identification", label: "Confirmation", citationIDs: ["aapcc_round10"]),
            ReferenceRangeRow(value: "Many SYNTHETIC opioids (fentanyl, methadone, oxycodone, buprenorphine, tramadol) are NOT detected on standard opioid immunoassay — order specific tests if suspected", label: "Synthetic opioid pitfall", citationIDs: ["aapcc_round10"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Positive UDS",
                summary: "Indicates exposure within detection window. Does NOT prove intoxication or impairment at time of test. Many false positives — confirmatory testing recommended for legal / employment / clinical-decision purposes.",
                nursingActions: [
                    "Document result and patient context",
                    "Coordinate with provider for management (taper, MAT, behavioral support, repeat / confirm testing)",
                    "Avoid stigmatizing language — \"positive\" rather than \"dirty\""
                ],
                citationIDs: ["aapcc_round10"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Negative UDS in suspected use",
                summary: "Does NOT exclude use — may be outside detection window, synthetic opioid not on panel, dilute urine, false-negative due to assay cutoff. Combine with clinical exam, history, and confirmatory testing.",
                nursingActions: [
                    "Order specific tests for suspected substances (fentanyl, gabapentin, kratom, novel synthetics)",
                    "Repeat sampling per facility protocol; consider observed collection",
                    "Coordinate with addiction-medicine specialist"
                ],
                citationIDs: ["openrn_labs_round10"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "False-positive UDS — common cross-reactants",
                causes: [
                    "Amphetamines: pseudoephedrine, ephedrine, bupropion, ranitidine, trazodone, selegiline, atomoxetine",
                    "Opioids: poppy seeds, dextromethorphan, quinolones, rifampin",
                    "PCP: ketamine, dextromethorphan, diphenhydramine, venlafaxine, tramadol",
                    "Cannabinoids: dronabinol, NSAIDs, PPIs (rare)",
                    "Benzos: sertraline (rare)"
                ],
                citationIDs: ["openrn_labs_round10"]
            ),
            CauseGroup(
                title: "False-negative — common pitfalls",
                causes: [
                    "Synthetic opioids (fentanyl, methadone, buprenorphine, oxycodone, tramadol) not on standard opioid immunoassay",
                    "Synthetic cannabinoids (\"Spice / K2\") not detected",
                    "Dilute urine, adulterants",
                    "Outside detection window",
                    "Novel substances (designer benzodiazepines, kratom)"
                ],
                citationIDs: ["openrn_labs_round10"]
            )
        ],
        nursingActions: [
            AttributedBullet("Counsel patient about purpose and consent; document chain of custody if for legal / employment per primary source.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("ORDER SPECIFIC fentanyl strip / specific opioid testing if synthetic opioid suspected — fentanyl is the leading cause of overdose deaths and may not show on standard panel.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Avoid clinical decisions based on a single positive immunoassay alone in disputed cases — confirm with GC-MS / LC-MS/MS.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Use respectful language; UDS is part of medical care, not a punishment.", citationIDs: ["openrn_labs_round10"])
        ],
        watchFor: [
            AttributedBullet("Fentanyl-contaminated supply — counsel any patient using non-prescribed substances about overdose risk; co-prescribe naloxone.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Stigmatizing language and assumptions — UDS results inform care, do not define the patient.", citationIDs: ["openrn_labs_round10"]),
            AttributedBullet("Coordinate with addiction-medicine team and harm-reduction services per primary source.", citationIDs: ["openrn_labs_round10"])
        ],
        citations: [openrnLabsR10, openstaxLabsR10, aapccConceptR10],
        lastSourceFidelityReview: "2026-05-04"
    )
}
