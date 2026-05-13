import Foundation

// Curated Peds reference entries — Open RN Pediatric Nursing (CC BY 4.0),
// CDC public-domain. Tier-A RN review pending pre-launch.

private let openrnPeds = CitationSource(
    id: "openrn_peds",
    shortName: "Open RN Nursing Fundamentals — Pediatric chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/?s=pediatric+peds",
    lastRetrieved: "2026-05-04"
)

private let cdcPeds = CitationSource(
    id: "cdc_peds",
    shortName: "CDC — Respiratory Syncytial Virus (RSV) Clinical Overview",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/rsv/hcp/clinical-overview/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Pediatric Weight-Based Dosing

public enum PedsDosingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "peds-weight-based-dosing",
        title: "Pediatric weight-based dosing",
        subtitle: "Math framework, max-dose ceilings, safety checks",
        eyebrow: "REFERENCE · PEDS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .prose(title: "Why pediatric dosing is its own discipline", AttributedProse("Children are not small adults. Drug clearance, volume of distribution, and protein binding shift dramatically through infancy, toddler, and adolescent years. The standard adult dose is meaningless. Always: weight in kg, mg/kg, max-dose ceiling, double-check.", citationIDs: ["openrn_peds"])),
            .numberedSteps(title: "Five-step dose calculation", [
                "Get an actual weight in kg — never \"about\" or estimated. Convert lb → kg by dividing by 2.2.",
                "Confirm the per-kg dose AND the maximum single dose ceiling from the order or reference.",
                "Calculate: dose = weight (kg) × dose per kg.",
                "Compare to the max-dose ceiling — if calculated > max, give the max, not the calculated. \"100 mg/kg\" doesn't mean a 30 kg child gets 3000 mg if the adult max is 1000 mg.",
                "Independent double-check by a second nurse for high-alert pediatric drugs (insulin, opioids, heparin, chemotherapy, electrolytes)."
            ], citationIDs: ["openrn_peds"]),
            .keyValueTable(title: "Common dosing reference points (verify per facility)", [
                KeyValueRow(key: "Acetaminophen — typical", value: "10–15 mg/kg PO q4–6h, max 75 mg/kg/day, max single dose 1000 mg"),
                KeyValueRow(key: "Ibuprofen — typical", value: "5–10 mg/kg PO q6–8h, max 40 mg/kg/day, max single dose 600–800 mg, ≥6 months only"),
                KeyValueRow(key: "Morphine IV — typical", value: "0.05–0.1 mg/kg IV q2–4h, max 0.1 mg/kg/dose typically"),
                KeyValueRow(key: "Epinephrine code dose", value: "0.01 mg/kg (0.1 mL/kg of 1:10,000) IV/IO, max 1 mg"),
                KeyValueRow(key: "Atropine code dose", value: "0.02 mg/kg IV/IO, min 0.1 mg, max 0.5 mg"),
                KeyValueRow(key: "Defibrillation initial energy", value: "2 J/kg first shock, 4 J/kg subsequent, max 10 J/kg or adult dose")
            ]),
            .bullets(title: "Safety checks at the bedside", [
                AttributedBullet("Confirm weight matches what's in the EMR — weigh on admission, not by parent recall.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Use a syringe (not a household spoon) for liquid medications.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Round to a measurable volume (don't try to measure 0.07 mL — round to 0.1).", citationIDs: ["openrn_peds"]),
                AttributedBullet("Look up unfamiliar pediatric drugs every time — the per-kg dose may not be intuitive.", citationIDs: ["openrn_peds"]),
                AttributedBullet("If a calculation \"looks like a lot,\" stop and recheck. Most pediatric overdoses are decimal-point errors (10x).", citationIDs: ["openrn_peds"])
            ]),
            .prose(title: "Broselow tape", AttributedProse("In emergencies (peds code, trauma), the Broselow tape estimates weight from length and provides pre-calculated drug doses, equipment sizes, and energy levels. Lay tape from head to heel; read the color band; use that band's drug doses. Faster and safer than calculating under stress.", citationIDs: ["openrn_peds"]))
        ],
        citations: [openrnPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Croup

public enum CroupSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "croup",
        title: "Croup (laryngotracheobronchitis)",
        subtitle: "Barky cough, stridor, recognition and steroid management",
        eyebrow: "REFERENCE · PEDS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Definition and population", AttributedProse("Viral inflammation of the larynx, trachea, and bronchi — most often parainfluenza virus. Hits children 6 months to 6 years, peaks at age 2. Classic presentation: barky (\"seal-like\") cough, hoarse voice, inspiratory stridor, often worse at night.", citationIDs: ["openrn_peds"])),
            .keyValueTable(title: "Severity assessment (Westley score concept)", [
                KeyValueRow(key: "Mild", value: "Barky cough, hoarse, NO stridor at rest, NO retractions"),
                KeyValueRow(key: "Moderate", value: "Stridor at rest with mild-to-moderate retractions, no agitation"),
                KeyValueRow(key: "Severe", value: "Stridor at rest with marked retractions, agitation, distress"),
                KeyValueRow(key: "Impending respiratory failure", value: "Decreased stridor (silent chest), decreased LOC, cyanosis, exhaustion — emergent")
            ]),
            .bullets(title: "Nursing assessment", [
                AttributedBullet("Listen for stridor at rest vs only with crying — at-rest stridor is more severe.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Inspect for retractions: suprasternal, intercostal, subcostal — count locations and severity.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Check air entry — markedly diminished air movement is more concerning than loud stridor.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Pulse oximetry continuous; capnography if available.", citationIDs: ["openrn_peds"]),
                AttributedBullet("DO NOT examine the throat with a tongue depressor if epiglottitis is suspected (drooling, tripod position, sudden onset, no cough).", citationIDs: ["openrn_peds"]),
                AttributedBullet("Keep the child calm — agitation worsens stridor. Allow caregiver to hold during exam.", citationIDs: ["openrn_peds"])
            ]),
            .keyValueTable(title: "Common treatments", [
                KeyValueRow(key: "Cool mist / humidified air", value: "Comfort measure; evidence is weak but low harm"),
                KeyValueRow(key: "Dexamethasone", value: "0.6 mg/kg PO/IV/IM × 1 dose (max 16 mg). Mainstay for any moderate-severe croup; benefit at all severities."),
                KeyValueRow(key: "Nebulized racemic epinephrine", value: "0.05 mL/kg of 2.25% (max 0.5 mL) in 3 mL NS for moderate-severe. Onset ~30 min, duration ~2 hr — observe for rebound."),
                KeyValueRow(key: "Oxygen", value: "Only if SpO2 <92%; supplemental via blow-by to avoid agitation"),
                KeyValueRow(key: "Discharge after racemic epi", value: "Observe minimum 2–4 hours after last dose to rule out rebound stridor")
            ]),
            .bullets(title: "When to escalate / call rapid response", [
                AttributedBullet("Stridor at rest unresponsive to racemic epi.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Increasing retractions, decreased breath sounds, decreased oxygen saturation despite supplemental O2.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Altered mental status, lethargy, decreased responsiveness — pre-arrest signs.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Drooling, tripod position, sudden severe presentation — rule out epiglottitis or foreign body; intubation may be needed.", citationIDs: ["openrn_peds"])
            ])
        ],
        citations: [openrnPeds, cdcPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bronchiolitis / RSV

public enum BronchiolitisSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "bronchiolitis-rsv",
        title: "Bronchiolitis (RSV)",
        subtitle: "Infants <2 years — supportive care, suction, escalation",
        eyebrow: "REFERENCE · PEDS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Definition", AttributedProse("Lower respiratory tract infection in infants and young children, most often caused by RSV (respiratory syncytial virus). Inflammation and mucus plugging in the small airways cause wheezing, increased work of breathing, and feeding difficulty. Peaks in winter months. Most cases are self-limited; the sickest are infants <3 months, premature, immunocompromised, or with congenital heart disease.", citationIDs: ["openrn_peds", "cdc_peds"])),
            .bullets(title: "Classic presentation", [
                AttributedBullet("URI prodrome (rhinorrhea, mild cough, low fever) for 1–3 days.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Progresses to wheezing, tachypnea, retractions, nasal flaring.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Crackles or wheezing on auscultation; expiratory wheeze classic.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Feeding difficulty — infant cannot suck and breathe at the same time when nasal congestion is severe.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Apnea — especially in young infants (<2 months) and premature; may be the presenting sign.", citationIDs: ["openrn_peds"])
            ]),
            .keyValueTable(title: "Severity at the bedside", [
                KeyValueRow(key: "Mild", value: "Wheezing without distress, feeding well, SpO2 ≥94% on room air"),
                KeyValueRow(key: "Moderate", value: "Increased work of breathing, mild retractions, SpO2 90–93%, decreased PO intake"),
                KeyValueRow(key: "Severe", value: "Marked retractions, grunting, hypoxia <90%, dehydration, lethargy, apnea"),
                KeyValueRow(key: "Respiratory rate red flags by age", value: "<2 mo: >60 · 2–12 mo: >50 · 1–5 yr: >40")
            ]),
            .bullets(title: "Nursing care — mostly supportive", [
                AttributedBullet("Suction nasal passages with bulb syringe before feeds and PRN. Saline nasal drops first if dry. Suction clears the airway and helps feeding.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Position upright (in caregiver's arms or in infant seat at 30°+) to ease breathing.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Small frequent feeds; consider NG feeds if oral feeding causes desaturation.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Strict I&O; monitor for dehydration (number of wet diapers per day; capillary refill).", citationIDs: ["openrn_peds"]),
                AttributedBullet("Supplemental oxygen if SpO2 <90% — start low-flow NC; escalate to high-flow nasal cannula (HFNC) for moderate distress.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Continuous cardiopulmonary monitoring for moderate-to-severe disease; apnea alarms for young infants.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Contact + droplet isolation; cohort RSV-positive patients per infection-control policy.", citationIDs: ["cdc_peds"])
            ]),
            .bullets(title: "What's NOT routinely recommended", [
                AttributedBullet("Bronchodilators (albuterol, racemic epi) — most do not respond; may be tried for individual response only.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Systemic corticosteroids — no evidence of benefit in routine bronchiolitis (different from asthma).", citationIDs: ["openrn_peds"]),
                AttributedBullet("Routine chest X-ray, blood work, viral testing — only if it changes management.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Antibiotics — viral illness; reserve for confirmed bacterial co-infection.", citationIDs: ["openrn_peds"])
            ]),
            .bullets(title: "Escalation triggers", [
                AttributedBullet("SpO2 <90% despite supplemental oxygen.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Apnea episodes (any in <3 months; recurrent in older infants).", citationIDs: ["openrn_peds"]),
                AttributedBullet("Increasing work of breathing on HFNC — consider BiPAP or intubation.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Inability to maintain hydration orally; significant dehydration.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Lethargy or decreased mental status.", citationIDs: ["openrn_peds"])
            ])
        ],
        citations: [openrnPeds, cdcPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric Resuscitation

public enum PedsResuscitationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "peds-resuscitation",
        title: "Pediatric resuscitation",
        subtitle: "Broselow tape, weight-based code drug doses",
        eyebrow: "REFERENCE · PEDS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Why a separate framework", AttributedProse("Pediatric arrests are usually respiratory in origin (asphyxial), not primary cardiac. The choreography is similar to adult ACLS but the doses, energies, and equipment sizes are weight-based. Have the Broselow tape ready; pre-calculate when possible.", citationIDs: ["openrn_peds"])),
            .numberedSteps(title: "First 60 seconds — the BLS sequence", [
                "Recognize: unresponsive + no normal breathing → start CPR.",
                "Compressions: 100–120/min; depth 1/3 AP diameter (~1.5\" infant, ~2\" child); 30:2 single rescuer, 15:2 with two rescuers and BVM.",
                "Open airway, give 2 breaths via BVM with 100% O2.",
                "Attach defibrillator/AED — peds pads if available, otherwise adult pads (anterior-posterior on small children).",
                "Establish IV/IO access (IO is fast; preferred if no IV in <90 sec).",
                "Apply Broselow tape — head to heel; identify color band."
            ], citationIDs: ["openrn_peds"]),
            .keyValueTable(title: "Code drug doses (memorize these)", [
                KeyValueRow(key: "Epinephrine — IV/IO arrest", value: "0.01 mg/kg (0.1 mL/kg of 1:10,000), max 1 mg, every 3–5 min"),
                KeyValueRow(key: "Epinephrine — ETT (if no IV/IO)", value: "0.1 mg/kg (0.1 mL/kg of 1:1,000), max 2.5 mg"),
                KeyValueRow(key: "Atropine — bradycardia from vagal", value: "0.02 mg/kg, min 0.1 mg, max 0.5 mg single dose"),
                KeyValueRow(key: "Amiodarone — V-fib / pulseless VT", value: "5 mg/kg IV/IO bolus, max 300 mg; may repeat ×2"),
                KeyValueRow(key: "Lidocaine — alternative to amiodarone", value: "1 mg/kg IV/IO bolus, max 100 mg"),
                KeyValueRow(key: "Adenosine — SVT (stable)", value: "0.1 mg/kg IV rapid push, max 6 mg first dose; second dose 0.2 mg/kg, max 12 mg"),
                KeyValueRow(key: "Naloxone — opioid OD", value: "0.1 mg/kg, max 2 mg per dose")
            ]),
            .keyValueTable(title: "Energy levels (defibrillation)", [
                KeyValueRow(key: "First shock — VF/pulseless VT", value: "2 J/kg"),
                KeyValueRow(key: "Subsequent shocks", value: "4 J/kg, may increase up to 10 J/kg or adult dose"),
                KeyValueRow(key: "Synchronized cardioversion", value: "0.5–1 J/kg first dose, then 2 J/kg"),
                KeyValueRow(key: "Pad placement", value: "Anterior-posterior preferred for infants/small children if pads overlap on chest")
            ]),
            .bullets(title: "Equipment by Broselow color (general guide)", [
                AttributedBullet("ETT size: (age in years / 4) + 4 for uncuffed, OR (age / 4) + 3.5 for cuffed (child ≥2 yr).", citationIDs: ["openrn_peds"]),
                AttributedBullet("ETT depth (cm at lip): ETT size × 3.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Suction catheter size: 2× the ETT size in French.", citationIDs: ["openrn_peds"]),
                AttributedBullet("LMA, IO needle, BP cuff, defibrillator pads — all sized by Broselow band.", citationIDs: ["openrn_peds"])
            ]),
            .bullets(title: "Watch-fors during peds resuscitation", [
                AttributedBullet("Maintain neutral airway position — head tilt is less useful in infants (large occiput); use shoulder roll.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Avoid hyperventilation — increases intrathoracic pressure, decreases venous return.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Reverse the H's and T's — hypoxia is the most common reversible cause in peds arrest. Hypoglycemia, hypothermia, electrolytes.", citationIDs: ["openrn_peds"]),
                AttributedBullet("Family presence during resuscitation — supported by AHA; offer the option with a dedicated support person.", citationIDs: ["openrn_peds"])
            ])
        ],
        citations: [openrnPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}
