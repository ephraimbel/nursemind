import Foundation

// Pediatric/NICU drug-reference entries — Open RN (CC BY 4.0), openFDA package
// inserts (public domain), CDC public-domain (immunizations, perinatal). All
// dosing is presented as ranges with clear "verify per facility protocol /
// pharmacist" framing — never as directive output. Tier-A RN review pending
// pre-launch for high-stakes peds/NICU dosing entries.

private let openrnPharmPeds = CitationSource(
    id: "openrn_pharm_peds",
    shortName: "Open RN Pharmacology — Pediatric Considerations chapter",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingpharmacology/?s=pediatric+dosing+weight",
    lastRetrieved: "2026-05-04"
)

private let fdaPedsLabels = CitationSource(
    id: "fda_peds_labels",
    shortName: "FDA Drug Labels — Pediatric Use sections (DailyMed)",
    detail: "FDA Structured Product Labeling — pediatric dosing per package insert",
    publisher: "U.S. Food & Drug Administration",
    license: .publicDomain,
    url: "https://dailymed.nlm.nih.gov/dailymed/",
    lastRetrieved: "2026-05-04"
)

private let cdcVaccines = CitationSource(
    id: "cdc_vaccines",
    shortName: "CDC — Childhood (Birth–18) Immunization Schedule",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/vaccines/hcp/imz-schedules/child-adolescent-age.html",
    lastRetrieved: "2026-05-04"
)

private let aapBeyondReach = CitationSource(
    id: "aap_neonatal_general",
    shortName: "AAP / NRP Neonatal Care — facts paraphrased into nursing workflow",
    detail: "Standard newborn-prophylaxis practice (vitamin K, erythromycin eye ointment, hepatitis B birth dose) is universally adopted; concept citation only",
    publisher: "American Academy of Pediatrics / NRP",
    license: .factCitationOnly,
    url: "https://www.aap.org/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Pediatric Analgesia & Antipyretic

public enum PedsAnalgesicDosingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "peds-analgesic-dosing",
        title: "Pediatric analgesia & antipyretic dosing",
        subtitle: "Reference ranges for acetaminophen, ibuprofen, opioids",
        eyebrow: "REFERENCE · PEDS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .painComfort),
        sections: [
            .prose(title: "How to use this", AttributedProse("Pediatric analgesia is weight-based and bounded by max-dose ceilings. The math is the easy part — the safety check is the harder part. Always confirm the actual weight, calculate against the per-kg dose AND the max single-dose ceiling, and double-check before high-alert doses (especially opioids).", citationIDs: ["openrn_pharm_peds"])),
            .keyValueTable(title: "Acetaminophen (Tylenol) — first-line for mild pain and fever", [
                KeyValueRow(key: "Oral / rectal route", value: "10–15 mg/kg every 4–6 hours"),
                KeyValueRow(key: "IV (Ofirmev) — children ≥2 yr, ≥10 kg", value: "12.5 mg/kg every 4 hours OR 15 mg/kg every 6 hours; max 75 mg/kg/day or 3.75 g/day, whichever is less"),
                KeyValueRow(key: "Max daily dose", value: "75 mg/kg/day, NOT to exceed 4 g/day in adolescents/adults"),
                KeyValueRow(key: "Max single dose", value: "Typical 1000 mg ceiling regardless of weight"),
                KeyValueRow(key: "Onset / duration (oral)", value: "Onset ~30 min, peak ~1 hr, duration 4–6 hr"),
                KeyValueRow(key: "Watch for", value: "Hepatotoxicity in overdose; check current acetaminophen-containing products before next dose")
            ]),
            .keyValueTable(title: "Ibuprofen (Motrin / Advil) — for ≥6 months", [
                KeyValueRow(key: "Oral", value: "5–10 mg/kg every 6–8 hours"),
                KeyValueRow(key: "Max daily dose", value: "40 mg/kg/day, max 2400 mg in adolescents"),
                KeyValueRow(key: "Max single dose", value: "Typical 600–800 mg ceiling"),
                KeyValueRow(key: "Onset / duration", value: "Onset ~30 min, duration 6–8 hr"),
                KeyValueRow(key: "Avoid in", value: "Infants <6 months, dehydration, GI bleed risk, severe asthma, kidney disease, active varicella infection (Reye-related concerns)")
            ]),
            .keyValueTable(title: "Opioids — only when non-opioid inadequate; high-alert", [
                KeyValueRow(key: "Morphine IV", value: "0.05–0.1 mg/kg every 2–4 hours, max single dose typically 0.1 mg/kg or 5 mg"),
                KeyValueRow(key: "Morphine PO", value: "0.2–0.5 mg/kg every 3–4 hours"),
                KeyValueRow(key: "Fentanyl IV", value: "0.5–1 mcg/kg every 1–2 hours, max single dose typically 50–100 mcg"),
                KeyValueRow(key: "Hydromorphone IV", value: "0.015 mg/kg every 3–6 hours, max single dose typically 0.015 mg/kg or 1 mg"),
                KeyValueRow(key: "Naloxone (rescue)", value: "0.1 mg/kg IV/IO/IM, max 2 mg")
            ]),
            .bullets(title: "Safety checks every time", [
                AttributedBullet("Confirm actual measured weight in kg — never \"about\" or by parent recall.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Calculate the per-kg dose AND check it doesn't exceed the max single-dose ceiling.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Double-check by a second nurse for opioid doses — institutional standard.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Use a 1 mL syringe for liquid medications <10 mL — household spoons are unreliable.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Confirm the formulation concentration (e.g., infant Tylenol drops vs children's Tylenol suspension) — concentrations are NOT the same.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("If a calculation \"looks like a lot,\" stop and recheck. Most pediatric overdoses are 10× decimal-point errors.", citationIDs: ["openrn_pharm_peds"])
            ]),
            .bullets(title: "Watch-fors after administration", [
                AttributedBullet("Acetaminophen: hepatotoxicity in overdose (24–72 hr post-ingestion); track total daily dose across all combination products.", citationIDs: ["fda_peds_labels"]),
                AttributedBullet("Ibuprofen: GI distress, kidney injury (especially in dehydration), platelet effect; avoid in volume-depleted children.", citationIDs: ["fda_peds_labels"]),
                AttributedBullet("Opioids: respiratory depression (RR <12 in older children, <20 in infants), excessive sedation, constipation. Continuous SpO₂ if >0.05 mg/kg morphine equivalents.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Have naloxone immediately accessible whenever giving opioids to a peds patient — count and locate at start of shift.", citationIDs: ["openrn_pharm_peds"])
            ]),
            .bullets(title: "Reassessment timing", [
                AttributedBullet("PO opioids: 60 min after dose.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("IV opioids: 15–30 min after dose.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("PO acetaminophen/ibuprofen: 30–60 min for analgesic effect; 30–60 min for fever response.", citationIDs: ["openrn_pharm_peds"])
            ])
        ],
        citations: [openrnPharmPeds, fdaPedsLabels],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric IV Fluids

public enum PedsIVFluidsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "peds-iv-fluids",
        title: "Pediatric IV fluids — maintenance and resuscitation",
        subtitle: "Holliday-Segar (4-2-1), bolus protocol, fluid choice",
        eyebrow: "REFERENCE · PEDS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .fluidElectrolytes),
        sections: [
            .prose(title: "Why this calculation is mandatory", AttributedProse("Pediatric fluid math affects every infusion, every bolus, every nutritional plan. Adult \"give a liter\" thinking causes harm in kids. Holliday-Segar's 4-2-1 rule is the universal starting point for hourly maintenance; bolus is volume-per-kg with hard caps to avoid overload.", citationIDs: ["openrn_pharm_peds"])),
            .keyValueTable(title: "Maintenance fluid — Holliday-Segar 4-2-1 rule (per hour)", [
                KeyValueRow(key: "First 10 kg", value: "4 mL/kg/hr"),
                KeyValueRow(key: "Next 10 kg (10–20 kg)", value: "Add 2 mL/kg/hr"),
                KeyValueRow(key: "Each kg over 20", value: "Add 1 mL/kg/hr"),
                KeyValueRow(key: "Quick examples", value: "10 kg → 40 mL/hr · 20 kg → 60 mL/hr · 30 kg → 70 mL/hr · 50 kg → 90 mL/hr"),
                KeyValueRow(key: "24-hour version (4-2-1 × 24)", value: "Or use 100/50/20: first 10 kg = 100 mL/kg/day, next 10 = 50, each kg over = 20")
            ]),
            .keyValueTable(title: "IV fluid choice — typical (verify per protocol)", [
                KeyValueRow(key: "Maintenance (most patients)", value: "Isotonic: 0.9% NS or LR with D5 added if NPO/glucose support needed (e.g., D5 LR, D5 0.45% NS for some institutions)"),
                KeyValueRow(key: "Resuscitation bolus", value: "0.9% NS or LR (isotonic crystalloid) — NOT D5 fluids"),
                KeyValueRow(key: "Hyponatremic dehydration", value: "0.9% NS for resuscitation; correction rate per protocol"),
                KeyValueRow(key: "DKA — special protocol", value: "Slower fluid replacement than typical resuscitation — typically 1.5–2× maintenance after initial 10 mL/kg bolus to reduce cerebral edema risk"),
                KeyValueRow(key: "Neonatal (≤28 days)", value: "Neonatal-specific protocols — D10 1/4 NS commonly; consult pharmacy/NICU protocol")
            ]),
            .keyValueTable(title: "Bolus for shock / dehydration", [
                KeyValueRow(key: "Initial bolus", value: "20 mL/kg of 0.9% NS or LR — given as fast as possible (\"push\")"),
                KeyValueRow(key: "Reassess after each bolus", value: "Vitals, mental status, capillary refill, urine output"),
                KeyValueRow(key: "May repeat", value: "Up to 60 mL/kg total in shock; consider blood products and vasopressors at >40 mL/kg if unresponsive"),
                KeyValueRow(key: "Cardiogenic shock or DKA", value: "Smaller boluses (10 mL/kg); risk of pulmonary edema and (in DKA) cerebral edema"),
                KeyValueRow(key: "Newborn / NICU", value: "10 mL/kg per bolus typically; cardiac etiology must be considered")
            ]),
            .bullets(title: "Nursing implementation", [
                AttributedBullet("Use a programmable infusion pump for ALL pediatric infusions. Never \"set the drip\" by gravity for maintenance fluids.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Set high-alert pump limits — many pumps have peds modes with hard maximums.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Round to the actual mL/hr the pump can deliver (typically nearest 1 mL/hr); document the calculated rate.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Use buretrols (Soluset) for infants — limits delivery if pump fails.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Empty the buretrol of all but the next 1–2 hours of fluid in infants — reduces accidental infusion volume.", citationIDs: ["openrn_pharm_peds"])
            ]),
            .bullets(title: "Monitoring during fluid administration", [
                AttributedBullet("Strict I&O — every void, every diaper weighed (1 g = 1 mL).", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Daily weight at the same time, same scale, ideally undressed.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Vitals + mental status + cap refill — pre- and post-bolus reassessment is mandatory.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Urine output target: >1 mL/kg/hr in infants and children; >0.5 mL/kg/hr in adolescents.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Watch for fluid overload: increased respiratory rate, crackles, periorbital edema, bulging fontanelle, sudden weight gain.", citationIDs: ["openrn_pharm_peds"])
            ])
        ],
        citations: [openrnPharmPeds],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NICU First-Day Medications

public enum NICUFirstDayMedsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "nicu-first-day-meds",
        title: "NICU first-day medications",
        subtitle: "Vitamin K, erythromycin eye, Hep B vaccine, surfactant criteria",
        eyebrow: "REFERENCE · NICU",
        nclexTags: NCLEXTags(category: .healthPromotion, priorityConcept: .infection),
        sections: [
            .prose(title: "What every newborn gets in the first hours", AttributedProse("Standard newborn prophylaxis is universal across US hospitals: vitamin K to prevent hemorrhagic disease, erythromycin eye ointment to prevent neonatal conjunctivitis, hepatitis B vaccine to begin the immunization series. These are nurse-administered with a clear safety bundle around them. Surfactant is rescue therapy for preterm respiratory distress, given by NICU teams.", citationIDs: ["aap_neonatal_general", "openrn_pharm_peds"])),
            .keyValueTable(title: "Vitamin K (phytonadione) — prevents hemorrhagic disease of newborn", [
                KeyValueRow(key: "Dose", value: "1 mg IM (single dose) for term newborn — within 1 hour of birth ideally"),
                KeyValueRow(key: "Dose for preterm <1500 g", value: "0.5 mg IM"),
                KeyValueRow(key: "Site", value: "Vastus lateralis (mid-anterolateral thigh) — NOT gluteus (immature, sciatic nerve risk)"),
                KeyValueRow(key: "Needle", value: "23-25 gauge, 5/8 inch typically"),
                KeyValueRow(key: "Why IM not oral", value: "Oral protocols require multi-dose schedule; IM single dose is more reliable; PO is alternative if parents refuse IM (counsel risks)"),
                KeyValueRow(key: "Refusal counseling", value: "Untreated newborns have ~80× higher risk of vitamin K deficient bleeding (VKDB), including life-threatening intracranial hemorrhage in the first weeks of life")
            ]),
            .keyValueTable(title: "Erythromycin 0.5% ophthalmic ointment — prevents neonatal conjunctivitis", [
                KeyValueRow(key: "Indication", value: "Prevention of gonococcal and chlamydial ophthalmia neonatorum"),
                KeyValueRow(key: "Dose", value: "1 cm ribbon to lower conjunctival sac of EACH eye, single application"),
                KeyValueRow(key: "Timing", value: "Within 1 hour of birth ideally; can be delayed up to 1 hour for first family bonding"),
                KeyValueRow(key: "Technique", value: "Sterile pre-loaded tubes; do not touch eye with applicator tip; clean from inner to outer canthus first"),
                KeyValueRow(key: "After application", value: "Brief blurring is normal; do NOT wipe excess away — can affect efficacy"),
                KeyValueRow(key: "Mandated", value: "Required by state law in most US states regardless of maternal STI testing")
            ]),
            .keyValueTable(title: "Hepatitis B vaccine — first dose of series", [
                KeyValueRow(key: "Dose", value: "0.5 mL IM single-dose pediatric vial"),
                KeyValueRow(key: "Site", value: "Vastus lateralis"),
                KeyValueRow(key: "Timing", value: "Within 24 hours of birth for all medically stable newborns ≥2000 g"),
                KeyValueRow(key: "If mom HBsAg POSITIVE", value: "Hepatitis B vaccine + Hepatitis B Immunoglobulin (HBIG) within 12 hours of birth — separate sites"),
                KeyValueRow(key: "If mom HBsAg unknown", value: "Vaccine within 12 hours; HBIG if mom tests positive (within 7 days for term, immediately for preterm)"),
                KeyValueRow(key: "Series schedule", value: "Birth dose, 1–2 months, 6–18 months")
            ]),
            .keyValueTable(title: "Surfactant — rescue for preterm RDS", [
                KeyValueRow(key: "Indication", value: "Preterm <34 weeks with respiratory distress syndrome (RDS) — given via ETT, prophylactic or rescue"),
                KeyValueRow(key: "Common products", value: "Beractant (Survanta), poractant alfa (Curosurf), calfactant (Infasurf)"),
                KeyValueRow(key: "Administration", value: "Intratracheal via ETT in 4 aliquots with position change between (head and chest in different positions to distribute), OR via INSURE technique"),
                KeyValueRow(key: "Pre-administration", value: "Confirm ETT placement, suction airway, pre-oxygenate, gather all positioning team"),
                KeyValueRow(key: "Post-administration", value: "Do NOT suction for 1–2 hours; expect rapid improvement in compliance — adjust ventilator settings to prevent volutrauma; monitor for transient bradycardia/desat during instillation")
            ]),
            .bullets(title: "Universal nursing safety", [
                AttributedBullet("Verify mother's name + ID on baby's armband against all medication labels — wrong-baby errors happen.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Document time of birth and time of each medication; the sequence and intervals matter for legal/regulatory documentation.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Family education before each med: name, purpose, what to expect, that it's mandated/recommended.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Document refusal carefully if family declines any prophylaxis — most institutions require physician notification and signed acknowledgement of risk.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Vital signs before and after — particularly RR and SpO₂; note any reaction to administration.", citationIDs: ["openrn_pharm_peds"])
            ])
        ],
        citations: [aapBeyondReach, openrnPharmPeds, cdcVaccines],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pediatric Antibiotic Dosing Reference

public enum PedsAntibioticReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "peds-antibiotic-reference",
        title: "Pediatric antibiotic dosing reference",
        subtitle: "Common antibiotics — typical mg/kg, max, frequency, watch-fors",
        eyebrow: "REFERENCE · PEDS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .infection),
        sections: [
            .prose(title: "Approach", AttributedProse("Pediatric antibiotic dosing is mg/kg with hard max-dose ceilings. Indication, organism susceptibility, and patient factors (renal function, allergies, age) all change the choice. The values below are reference ranges from FDA labels and Open RN — always verify with pharmacy and facility antibiogram.", citationIDs: ["openrn_pharm_peds"])),
            .keyValueTable(title: "Amoxicillin (PO)", [
                KeyValueRow(key: "Standard dose", value: "25–50 mg/kg/day divided every 8 or 12 hours"),
                KeyValueRow(key: "High-dose (otitis media, sinusitis)", value: "80–90 mg/kg/day divided every 12 hours"),
                KeyValueRow(key: "Max single dose", value: "1000 mg typically"),
                KeyValueRow(key: "Common indications", value: "Acute otitis media, strep pharyngitis, mild community-acquired pneumonia"),
                KeyValueRow(key: "Watch for", value: "Penicillin allergy (true allergy ~1%); GI upset; non-allergic rash with EBV; resistance pattern of local antibiogram")
            ]),
            .keyValueTable(title: "Amoxicillin-clavulanate (Augmentin) (PO)", [
                KeyValueRow(key: "Dose (based on amoxicillin component)", value: "45 mg/kg/day divided every 12 hours OR 90 mg/kg/day for resistant pathogens"),
                KeyValueRow(key: "Max", value: "Adult dose ~875 mg of amoxicillin component"),
                KeyValueRow(key: "Watch for", value: "Diarrhea (significantly more than amoxicillin alone); take with food to reduce GI upset; do not crush XR formulation")
            ]),
            .keyValueTable(title: "Cefdinir / Cefuroxime (PO cephalosporins)", [
                KeyValueRow(key: "Cefdinir", value: "14 mg/kg/day divided every 12 or 24 hours; max 600 mg/day"),
                KeyValueRow(key: "Cefuroxime", value: "20–30 mg/kg/day divided every 12 hours; max 1000 mg/day"),
                KeyValueRow(key: "Watch for", value: "Cross-reactivity in penicillin allergy is low (~1–2%) but true cephalosporin allergy is a contraindication; iron-containing foods reduce cefdinir absorption (separate by 2 hr)")
            ]),
            .keyValueTable(title: "Ceftriaxone (Rocephin) (IV / IM)", [
                KeyValueRow(key: "Standard dose", value: "50–75 mg/kg every 24 hours"),
                KeyValueRow(key: "Severe infection / meningitis", value: "100 mg/kg/day divided every 12 hours; max 4 g/day"),
                KeyValueRow(key: "Common indications", value: "Severe bacterial infections, meningitis, pyelonephritis, gonorrhea"),
                KeyValueRow(key: "Watch for", value: "Do NOT mix with calcium-containing IV solutions in neonates (precipitation risk); biliary sludge with prolonged use")
            ]),
            .keyValueTable(title: "Azithromycin (PO / IV)", [
                KeyValueRow(key: "Standard 5-day", value: "10 mg/kg day 1, then 5 mg/kg days 2–5; max 500 mg day 1, 250 mg subsequent"),
                KeyValueRow(key: "Atypical pneumonia (Mycoplasma)", value: "10 mg/kg/day × 5 days"),
                KeyValueRow(key: "Watch for", value: "QT prolongation (especially with other QT-prolonging drugs); GI upset; hepatotoxicity")
            ]),
            .keyValueTable(title: "Clindamycin (PO / IV)", [
                KeyValueRow(key: "Standard PO", value: "8–25 mg/kg/day divided every 6–8 hours; max 1.8 g/day"),
                KeyValueRow(key: "Severe (MRSA-suspect skin/soft tissue)", value: "30–40 mg/kg/day IV divided every 6–8 hours"),
                KeyValueRow(key: "Watch for", value: "C. difficile infection (highest-risk antibiotic for CDI); diarrhea; pseudomembranous colitis post-treatment")
            ]),
            .keyValueTable(title: "Vancomycin IV — for serious gram-positive infections", [
                KeyValueRow(key: "Pediatric dose", value: "10–15 mg/kg every 6 hours (adjust per trough or AUC monitoring)"),
                KeyValueRow(key: "Neonate dose", value: "Per gestational age + post-natal age tables — pharmacy-driven"),
                KeyValueRow(key: "Infusion rate", value: "Over at least 60 minutes (at least 90 minutes for doses >1 g) to prevent vancomycin infusion reaction"),
                KeyValueRow(key: "Trough goal", value: "Typically 10–20 mcg/mL (depends on indication; AUC-based monitoring increasingly preferred)"),
                KeyValueRow(key: "Watch for", value: "Vancomycin infusion reaction (red, flushing, often face/upper body — slow rate, give antihistamine); nephrotoxicity; ototoxicity at high troughs")
            ]),
            .bullets(title: "Universal nursing principles for peds antibiotics", [
                AttributedBullet("Confirm allergy history at every administration — patients change accounts; family adds info.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Verify weight matches EMR; recheck dose calculation against ceiling.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Liquid concentrations vary widely by manufacturer — always read the bottle, not memory.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Confirm completion of culture before first dose if possible (don't lose the sample), but do NOT delay first antibiotic dose for sepsis.", citationIDs: ["openrn_pharm_peds"]),
                AttributedBullet("Family teaching: complete the full course even if child feels better; refrigerate suspensions if labeled; common side effects.", citationIDs: ["openrn_pharm_peds"])
            ])
        ],
        citations: [openrnPharmPeds, fdaPedsLabels],
        lastSourceFidelityReview: "2026-05-04"
    )
}
