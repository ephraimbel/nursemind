import Foundation

// Curator-model procedures + reference (round 16 — toxicology + ID + dermatology + safety).

private let openrnPRR16 = CitationSource(
    id: "openrn_pr_round16",
    shortName: "Open RN Health Alterations + Fundamentals",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-05-04"
)
private let specialtyPRR16 = CitationSource(
    id: "specialty_pr_round16",
    shortName: "AACT / IDSA / CDC / AAD concept citations",
    publisher: "AACT · IDSA · CDC · AAD",
    license: .factCitationOnly,
    url: "https://www.cdc.gov/infectioncontrol/guidelines/",
    lastRetrieved: "2026-05-04"
)

private let procTagsR16 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR16 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum ThoracentesisSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "thoracentesis",
        title: "Thoracentesis",
        subtitle: "Pleural fluid sampling / drainage · ultrasound-guided · pneumothorax + re-expansion edema risk",
        nclexTags: procTagsR16,
        indications: AttributedProse(
            "Diagnostic — analysis of new pleural effusion (transudate vs exudate per Light's criteria, infection, malignancy). Therapeutic — relief of dyspnea from large effusion. Ultrasound-guided is standard of care per primary source.",
            citationIDs: ["specialty_pr_round16"]
        ),
        contraindications: AttributedProse(
            "Severe coagulopathy (INR >2, plt <50K — relative); uncooperative patient; small loculated effusion not safely accessible; overlying skin infection at insertion site per primary source.",
            citationIDs: ["specialty_pr_round16"]
        ),
        equipment: [
            AttributedBullet("Thoracentesis kit (sterile drape, syringes, needle / catheter, vacuum bottles or drainage bag).", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Ultrasound machine + sterile probe cover.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Local anesthetic (1% lidocaine) + chlorhexidine + sterile gloves / gown.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Specimen tubes — pH (heparinized syringe + ice), cell count, chemistry (LDH, glucose, protein, total protein), culture / Gram stain, cytology.", citationIDs: ["specialty_pr_round16"])
        ],
        preProcedure: [
            AttributedBullet("Informed consent — risks (pneumothorax 5–10%, bleeding, infection, re-expansion edema, organ injury, vasovagal).", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Time-out + verify patient + side; review imaging.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Position upright leaning over bedside table; arms supported.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Monitor vitals + SpO2 + IV access; have pneumothorax response equipment + chest tube kit available.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Hold anticoagulation per protocol; correct severe coagulopathy when possible.", citationIDs: ["specialty_pr_round16"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Ultrasound localization", body: "Identify largest pocket of fluid + measure depth + mark site (typically posterior axillary line, 1 rib space below upper border of fluid + above 9th rib).", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 2, title: "Sterile prep + drape", body: "Chlorhexidine prep × 30 sec dry × 30 sec; full sterile drape; sterile probe cover for real-time guidance if needed.", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 3, title: "Local anesthesia", body: "Infiltrate skin + subcutaneous + parietal pleura along superior margin of rib (avoid neurovascular bundle) with 1% lidocaine.", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 4, title: "Needle / catheter placement", body: "Advance needle / catheter over rib + into pleural space until fluid return; transition to catheter; remove needle to avoid inadvertent injury.", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 5, title: "Drainage", body: "Drain via vacuum bottle or syringe; LIMIT to 1.5 L per session OR until pleural pressure <-20 cmH2O OR cough / chest pain (re-expansion edema risk) per primary source.", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 6, title: "Removal + dressing", body: "Remove during expiration / Valsalva to minimize air entry; sterile occlusive dressing.", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 7, title: "Post-procedure imaging", body: "Chest X-ray (or post-procedure ultrasound) — rule out pneumothorax + assess fluid removal per primary source.", citationIDs: ["specialty_pr_round16"])
        ],
        postProcedure: [
            AttributedBullet("Monitor SpO2, vital signs, respiratory effort × 2–4 hours; counsel signs of pneumothorax (sudden dyspnea, chest pain, cough).", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Send specimens — pH on ice, cell count, chemistry (LDH, glucose, protein), culture, cytology per indication.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Position upright + monitor for re-expansion pulmonary edema (rare, large drainage).", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Patient education — return for severe pain, breathing trouble, fever.", citationIDs: ["openrn_pr_round16"])
        ],
        documentation: [
            AttributedBullet("Indication, ultrasound findings, volume + character of fluid, complications, post-procedure CXR result.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Specimens sent + pending results.", citationIDs: ["openrn_pr_round16"])
        ],
        watchFor: [
            AttributedBullet("PNEUMOTHORAX — most common complication; chest tube if symptomatic / large per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("RE-EXPANSION PULMONARY EDEMA — limit drainage to 1.5 L; STOP for cough / chest pain.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Bleeding — intercostal artery injury (avoid lower margin of rib); hemothorax if persistent.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Empyema — track culture; tube thoracostomy if indicated.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Vasovagal — IV fluid + position supine.", citationIDs: ["openrn_pr_round16"])
        ],
        citations: [openrnPRR16, specialtyPRR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum ParacentesisSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "paracentesis",
        title: "Paracentesis",
        subtitle: "Ascitic fluid sampling / drainage · diagnostic SBP rule-out · albumin replacement after large-volume",
        nclexTags: procTagsR16,
        indications: AttributedProse(
            "Diagnostic — new ascites; suspected SBP (any cirrhotic with ascites + fever / abdominal pain / AMS); evaluation of malignancy. Therapeutic — relief of tense / refractory ascites compromising respiration / function per primary source.",
            citationIDs: ["specialty_pr_round16"]
        ),
        contraindications: AttributedProse(
            "Severe DIC; ruptured viscus; uncooperative patient; pregnancy (relative — modify approach). Coagulopathy is generally NOT a contraindication for diagnostic paracentesis per primary source.",
            citationIDs: ["specialty_pr_round16"]
        ),
        equipment: [
            AttributedBullet("Paracentesis kit (catheter, drainage tubing, vacuum bottles).", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Ultrasound machine + sterile probe cover (preferred for safe site).", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Sterile drape, gloves, gown, chlorhexidine, 1% lidocaine.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Specimen tubes — cell count + differential, total protein, albumin, culture / Gram stain (blood culture bottles for SBP), cytology, glucose, LDH, amylase per indication.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("25% albumin for large-volume paracentesis (>5 L).", citationIDs: ["specialty_pr_round16"])
        ],
        preProcedure: [
            AttributedBullet("Informed consent — bleeding (1%), infection (rare), bowel perforation (<1%), vasovagal, post-paracentesis circulatory dysfunction (large-volume).", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Empty bladder before procedure (avoid bladder injury).", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Position supine with slight tilt to side of preferred entry; insertion site usually LEFT lower quadrant lateral to rectus per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Ultrasound to identify safe pocket of fluid + avoid abdominal wall vessels; mark site.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Vital signs + IV access for large-volume; cross-match if severe coagulopathy.", citationIDs: ["openrn_pr_round16"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Sterile prep + drape", body: "Chlorhexidine prep × 30 sec dry; full sterile drape.", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 2, title: "Z-tract technique + local anesthesia", body: "Pull skin caudally; infiltrate skin + subcutaneous + peritoneum with 1% lidocaine; release skin after needle removal — creates Z-tract sealing fluid leak per primary source.", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 3, title: "Insert catheter", body: "Advance needle / catheter at right angle; aspirate continuously; transition to catheter once fluid returns; remove needle.", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 4, title: "Drainage", body: "Diagnostic — ~50–100 mL sample. Therapeutic — drain to symptom relief (often 4–8 L); replace 6–8 g albumin per liter drained beyond 5 L per primary source.", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 5, title: "Specimen handling", body: "Cell count + differential (PMN >250 = SBP), inoculate blood culture bottles AT BEDSIDE (improves yield), total protein, albumin (calculate SAAG), cytology / additional studies per indication.", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 6, title: "Removal + dressing", body: "Remove catheter, apply pressure ×30 sec, sterile dressing.", citationIDs: ["openrn_pr_round16"])
        ],
        postProcedure: [
            AttributedBullet("Monitor vital signs + symptoms × 2–4 hours; discharge if stable.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Albumin 25% replacement — 6–8 g per liter beyond 5 L drained (post-paracentesis circulatory dysfunction prevention) per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Patient education — return for fever, severe abdominal pain, persistent leak from site.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("If SBP suspected, start empiric ceftriaxone IV pending cultures per primary source.", citationIDs: ["specialty_pr_round16"])
        ],
        documentation: [
            AttributedBullet("Indication, volume + character of fluid, ultrasound findings, complications, albumin replaced, specimens sent.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Patient response + post-procedure status.", citationIDs: ["openrn_pr_round16"])
        ],
        watchFor: [
            AttributedBullet("SBP — PMN >250 in ascitic fluid → empiric ceftriaxone + albumin per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("BLEEDING — abdominal wall vessel injury; ultrasound guidance reduces.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("BOWEL PERFORATION — rare; abdominal pain, fever, leukocytosis post-procedure → CT.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("POST-PARACENTESIS CIRCULATORY DYSFUNCTION — hyponatremia, AKI, encephalopathy; albumin prophylaxis per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Persistent ascitic fluid leak — Z-tract technique + temporary stoma dressing.", citationIDs: ["openrn_pr_round16"])
        ],
        citations: [openrnPRR16, specialtyPRR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum LumbarPunctureSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "lumbar-puncture-csf",
        title: "Lumbar puncture (CSF analysis)",
        subtitle: "L3-L4 / L4-L5 · meningitis + SAH + idiopathic IH workup · post-LP headache common",
        nclexTags: procTagsR16,
        indications: AttributedProse(
            "Diagnostic — meningitis / encephalitis, SAH (CT-negative), GBS / MS / autoimmune neurologic, idiopathic intracranial hypertension. Therapeutic — IIH (drainage), intrathecal medication / chemotherapy. CT before LP if focal neuro / immunocompromised / age >60 / new seizure / AMS to rule out mass lesion per primary source.",
            citationIDs: ["specialty_pr_round16"]
        ),
        contraindications: AttributedProse(
            "Increased ICP from mass lesion / focal deficits (herniation risk); coagulopathy (INR >1.5, plt <40K — relative); local infection at puncture site; spinal epidural abscess per primary source.",
            citationIDs: ["specialty_pr_round16"]
        ),
        equipment: [
            AttributedBullet("Spinal needle (22G atraumatic preferred — reduces post-LP headache).", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Manometer for opening pressure measurement.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Sterile drape, gloves, chlorhexidine, 1% lidocaine.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Four collection tubes (numbered 1–4) — cell count, chemistry (glucose / protein), microbiology, special studies (cytology / PCR / oligoclonal bands).", citationIDs: ["specialty_pr_round16"])
        ],
        preProcedure: [
            AttributedBullet("Consent — post-LP headache (10–30%), bleeding, infection, herniation (rare), nerve injury, paresthesia.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("CT before LP if indicated (focal deficits, papilledema, immunocompromised, AMS, age >60, recent seizure) per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Hold anticoagulation per protocol; correct coagulopathy.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Position lateral decubitus (back arched, knees to chest) OR seated leaning forward — opening pressure only valid in lateral decubitus.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Identify L3-L4 or L4-L5 interspace (Tuffier's line — iliac crests at L4).", citationIDs: ["specialty_pr_round16"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Sterile prep + drape", body: "Chlorhexidine prep × 30 sec dry; full sterile drape.", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 2, title: "Local anesthesia", body: "Infiltrate skin + subcutaneous + ligamentous tissue with 1% lidocaine.", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 3, title: "Insert spinal needle", body: "Advance midline at slight cephalad angle (toward umbilicus) with bevel parallel to spinal fibers; pop through ligamentum flavum + dura → CSF return; if bone, redirect.", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 4, title: "Opening pressure", body: "Attach manometer; record pressure (lateral decubitus only — normal 6–25 cmH2O); have patient relax.", citationIDs: ["specialty_pr_round16"]),
            ProcedureStep(number: 5, title: "Collect CSF", body: "Collect 1–2 mL into each of 4 numbered tubes; observe clarity (clear, cloudy, bloody, xanthochromic).", citationIDs: ["openrn_pr_round16"]),
            ProcedureStep(number: 6, title: "Closing + removal", body: "Closing pressure if therapeutic; remove needle; apply pressure + sterile dressing.", citationIDs: ["openrn_pr_round16"])
        ],
        postProcedure: [
            AttributedBullet("Patient may sit / walk; bed rest does NOT prevent post-LP headache (myth) per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Encourage hydration; caffeine for symptomatic post-LP headache; epidural blood patch for refractory.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("Send specimens — cell count + differential, glucose / protein, Gram stain + culture, special studies per indication.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Counsel return for severe headache, fever, neck stiffness, leg weakness, urinary retention, drainage from site.", citationIDs: ["openrn_pr_round16"])
        ],
        documentation: [
            AttributedBullet("Indication, position, opening pressure, CSF appearance + volume, complications, specimens.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("Patient response + post-procedure neurological exam.", citationIDs: ["openrn_pr_round16"])
        ],
        watchFor: [
            AttributedBullet("POST-LP HEADACHE — positional, frontal/occipital; treat with hydration + caffeine; epidural blood patch if refractory >24–48 hours per primary source.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("HERNIATION — rare; CT first in high-risk patients; new focal deficits / pupillary asymmetry / decreased LOC post-LP → emergent imaging.", citationIDs: ["specialty_pr_round16"]),
            AttributedBullet("BLEEDING (epidural / subdural) — increased risk with coagulopathy; back / leg pain + neurologic deficit → emergent MRI.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("INFECTION — meningitis from procedure (rare with sterile technique); spinal epidural abscess.", citationIDs: ["openrn_pr_round16"]),
            AttributedBullet("TRAUMATIC TAP — RBC clearing in serial tubes; xanthochromia separates true SAH from traumatic.", citationIDs: ["specialty_pr_round16"])
        ],
        citations: [openrnPRR16, specialtyPRR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum AntidoteQuickReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "antidote-quick-reference",
        title: "Toxicology antidote quick reference",
        subtitle: "Common antidotes by toxin · indications + dose pearls · poison-control consultation",
        eyebrow: "REFERENCE · TOXICOLOGY",
        nclexTags: refTagsR16,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Quick reference for common toxicological antidotes. ALWAYS consult Poison Control (1-800-222-1222 in US) and clinical toxicology for dosing + ongoing management. Indications + doses below are typical adult initial — confirm at time of administration per primary source.",
                citationIDs: ["specialty_pr_round16"]
            )),
            .keyValueTable(title: "Antidote · indication · initial dose pearl", [
                KeyValueRow(key: "N-acetylcysteine (NAC)", value: "Acetaminophen overdose · IV 21-hour 3-bag (150 → 50 → 100 mg/kg) OR PO 72-hour"),
                KeyValueRow(key: "Naloxone", value: "Opioid overdose · 0.04–0.4 mg IV/IM/IN; titrate to RR; longer-acting opioids may need infusion"),
                KeyValueRow(key: "Flumazenil", value: "Benzodiazepine overdose · 0.2 mg IV; LIMITED USE — seizure risk in dependence / mixed OD"),
                KeyValueRow(key: "Fomepizole", value: "Methanol / ethylene glycol · 15 mg/kg IV load → 10 mg/kg q12h × 4 → 15 mg/kg q12h"),
                KeyValueRow(key: "Hydroxocobalamin (Cyanokit)", value: "Cyanide / smoke inhalation · 5 g IV over 15 min; turns urine red × 35 days"),
                KeyValueRow(key: "Atropine", value: "Cholinergic crisis (OP / carbamate, nerve agent) · 2–5 mg IV q3–5 min until DRYING"),
                KeyValueRow(key: "Pralidoxime (2-PAM)", value: "Organophosphate poisoning · 30 mg/kg IV bolus → 8 mg/kg/hr; not for carbamates"),
                KeyValueRow(key: "Sodium bicarbonate", value: "TCA toxicity, salicylate toxicity · QRS widening / acidosis; bolus + infusion"),
                KeyValueRow(key: "Calcium chloride / gluconate", value: "CCB toxicity, hyperkalemic arrest, hypocalcemia · 1–3 g chloride OR 3–9 g gluconate IV"),
                KeyValueRow(key: "High-dose insulin / euglycemic", value: "CCB / BB toxicity · 1 U/kg bolus + 0.5–10 U/kg/hr + dextrose"),
                KeyValueRow(key: "Glucagon (high-dose)", value: "BB toxicity · 5–10 mg IV bolus + 2–10 mg/hr; vomiting common"),
                KeyValueRow(key: "Lipid emulsion 20%", value: "Lipophilic toxin cardiotoxicity (BB/CCB/local anesthetic) · 1.5 mL/kg bolus + 0.25 mL/kg/min"),
                KeyValueRow(key: "Glucarpidase", value: "Methotrexate toxicity with AKI · 50 U/kg IV; avoid leucovorin ±2 hours"),
                KeyValueRow(key: "Vitamin K", value: "Warfarin / superwarfarin / vitamin K deficiency · 1–10 mg PO/IV slow"),
                KeyValueRow(key: "Protamine", value: "Heparin reversal · 1 mg per 100 units heparin (max 50 mg/dose); slow IV"),
                KeyValueRow(key: "Idarucizumab", value: "Dabigatran reversal · 5 g IV ×1"),
                KeyValueRow(key: "Andexanet alfa", value: "Rivaroxaban / apixaban reversal (life-threatening) · weight-based bolus + infusion"),
                KeyValueRow(key: "Digoxin Fab (DigiBind / DigiFab)", value: "Digoxin toxicity · 5–10 vials empirical; calculate by level + ingestion amount"),
                KeyValueRow(key: "Methylene blue", value: "Methemoglobinemia (severe / symptomatic >30%) · 1–2 mg/kg IV"),
                KeyValueRow(key: "Physostigmine", value: "Pure anticholinergic delirium · 0.5–2 mg IV slow; AVOID in TCA / mixed OD"),
                KeyValueRow(key: "Octreotide", value: "Sulfonylurea-induced hypoglycemia · 50–100 mcg SQ q6h"),
                KeyValueRow(key: "Hyperbaric oxygen (HBO)", value: "CO poisoning (severe / pregnancy / persistent symptoms) · per HBO center protocol")
            ]),
            .bullets(title: "Universal toxicology pearls", [
                AttributedBullet("Always call Poison Control (1-800-222-1222 in US) for current guidance.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Universal screen — acetaminophen + salicylate + ECG + glucose + drug-level (specific) + co-ingestion screen.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Decontamination — activated charcoal within 1–2 hours if airway protected; whole-bowel irrigation for sustained-release / packers.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Avoid syrup of ipecac (no longer recommended).", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("ICU monitoring for severe toxicity; ECMO + advanced support for refractory cardiogenic shock.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Mental health evaluation post-stabilization for intentional ingestions; safety planning + admission.", citationIDs: ["openrn_pr_round16"])
            ])
        ],
        citations: [openrnPRR16, specialtyPRR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum WoundCarePressureInjurySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "wound-care-pressure",
        title: "Pressure injury staging + wound care",
        subtitle: "NPIAP 2016 staging · prevention bundle · moist wound healing",
        eyebrow: "REFERENCE · WOUND CARE",
        nclexTags: refTagsR16,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Pressure injury (PI) — localized injury to skin / soft tissue over bony prominence, from prolonged pressure / shear / friction. NPIAP staging guides intervention. Prevention is primary nursing responsibility per primary source.",
                citationIDs: ["specialty_pr_round16"]
            )),
            .keyValueTable(title: "NPIAP 2016 staging", [
                KeyValueRow(key: "Stage 1", value: "Non-blanchable erythema of intact skin"),
                KeyValueRow(key: "Stage 2", value: "Partial-thickness skin loss with exposed dermis (shallow open ulcer or intact / ruptured serum-filled blister)"),
                KeyValueRow(key: "Stage 3", value: "Full-thickness skin loss; subcutaneous fat visible; granulation tissue + epibole common; tunneling possible"),
                KeyValueRow(key: "Stage 4", value: "Full-thickness skin + tissue loss with exposed bone, tendon, or muscle; tunneling / undermining / osteomyelitis possible"),
                KeyValueRow(key: "Unstageable", value: "Full-thickness loss obscured by slough / eschar; cannot determine depth until base visible"),
                KeyValueRow(key: "Deep tissue injury (DTI)", value: "Persistent non-blanchable deep red / maroon / purple discoloration; intact skin or blood-filled blister; can deteriorate quickly")
            ]),
            .bullets(title: "Prevention bundle (SKIN)", [
                AttributedBullet("S — Surface — pressure-redistribution mattress / chair cushion for at-risk patients.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("K — Keep moving — turn / reposition q2h; off-loading; HOB ≤30° unless contraindicated; minimize shear.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("I — Incontinence + moisture management — gentle skin cleansers, barrier creams; treat incontinence-associated dermatitis.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("N — Nutrition — assess + treat protein-energy malnutrition; protein 1.25–1.5 g/kg/day; vitamin C, zinc.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Risk assessment — Braden scale on admission + each shift in acute / each visit in long-term care.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Heel offloading — heel pillows or boots for at-risk patients.", citationIDs: ["openrn_pr_round16"])
            ]),
            .bullets(title: "Wound care principles", [
                AttributedBullet("Cleanse with normal saline OR commercial wound cleanser (avoid hydrogen peroxide / cytotoxics on healing tissue).", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Debride non-viable tissue (autolytic with hydrogels, mechanical, sharp by trained provider, enzymatic, biologic).", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Maintain moist wound bed — alginate / foam for high exudate; hydrogel for dry; transparent film for stage 1/2.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Pack tunneling / undermining loosely; do NOT pack tightly (impedes drainage + delays healing).", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("Dressing change frequency — based on exudate, dressing type, contamination; avoid unnecessary disturbance.", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("Negative-pressure wound therapy — selected stage 3/4 wounds; not on infected / malignant / fistulae.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Photograph + measure wound (length × width × depth) at baseline + weekly to track healing.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Assess for infection — increased erythema, drainage, odor, fever, leukocytosis; biopsy / culture if suspected.", citationIDs: ["specialty_pr_round16"])
            ]),
            .bullets(title: "Special considerations", [
                AttributedBullet("Stage 1 / 2 — focus on prevention + protection; usually heal with appropriate care.", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("Stage 3 / 4 — multidisciplinary wound team; surgical consultation + osteomyelitis evaluation.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Eschar on heels — DO NOT debride if dry, stable, intact (limb-threatening if vasculopathy); off-load.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Document — staging, location, measurements, exudate, surrounding skin, pain, treatment plan.", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("Hospital-acquired pressure injuries (HAPI) — never event; CMS payment penalties; aggressive prevention.", citationIDs: ["specialty_pr_round16"])
            ])
        ],
        citations: [openrnPRR16, specialtyPRR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum IsolationPrecautionsHierarchySample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "isolation-hierarchy",
        title: "Isolation precautions hierarchy",
        subtitle: "Standard · Contact · Droplet · Airborne · Protective · CDC core elements",
        eyebrow: "REFERENCE · INFECTION CONTROL",
        nclexTags: refTagsR16,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "CDC tiered system — Standard precautions for ALL patients; transmission-based precautions added for known / suspected pathogen routes. Always use highest level needed; combinations possible (e.g., contact + droplet for respiratory MRSA pneumonia) per primary source.",
                citationIDs: ["specialty_pr_round16"]
            )),
            .bullets(title: "Standard precautions (ALL patients, ALL encounters)", [
                AttributedBullet("Hand hygiene — alcohol-based rub OR soap/water (soap/water for C. diff, B. anthracis spores, visibly soiled hands).", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("PPE — gloves, gown, mask, eye protection based on anticipated exposure to body fluids / secretions / non-intact skin.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Safe injection practices — single-use syringe, aseptic technique, sharps disposal.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Respiratory hygiene / cough etiquette — patients cover cough / sneeze; offer mask + tissues; segregate symptomatic.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Environmental cleaning + equipment disinfection between patients.", citationIDs: ["openrn_pr_round16"])
            ]),
            .bullets(title: "Contact precautions", [
                AttributedBullet("Indications — MRSA, VRE, ESBL, CRE, C. difficile, RSV, scabies, lice, herpes simplex (mucocutaneous), draining wounds, GI / respiratory / skin infections by direct contact spread.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("PPE — gown + gloves on entry; mask if also droplet.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Private room preferred; cohort if needed.", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("Dedicated equipment (BP cuff, stethoscope) when possible.", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("C. difficile — SOAP AND WATER (alcohol does not kill spores); bleach environmental disinfection.", citationIDs: ["specialty_pr_round16"])
            ]),
            .bullets(title: "Droplet precautions", [
                AttributedBullet("Indications — influenza, pertussis, mumps, rubella, meningococcal, group A strep (until 24h on abx), respiratory diphtheria, plague.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("PPE — surgical mask within 6 feet of patient.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Private room preferred; can cohort with same pathogen.", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("Mask patient during transport.", citationIDs: ["openrn_pr_round16"])
            ]),
            .bullets(title: "Airborne precautions", [
                AttributedBullet("Indications — TB, varicella (chickenpox + disseminated zoster), measles, smallpox, viral hemorrhagic fevers, COVID-19 (per current guidance).", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("PPE — N95 fit-tested respirator (or PAPR) for all entries.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Negative-pressure airborne infection isolation room (AIIR) with 6–12 air changes / hour.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Door closed at all times; minimize entries.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Mask patient during transport; limit transport.", citationIDs: ["openrn_pr_round16"]),
                AttributedBullet("Aerosol-generating procedures — additional PPE; HEPA-filtered space.", citationIDs: ["specialty_pr_round16"])
            ]),
            .bullets(title: "Protective (reverse) isolation", [
                AttributedBullet("Indications — severe immunosuppression (HSCT, neutropenia <500); protect patient from environmental pathogens.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Positive-pressure room with HEPA filtration.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("No fresh flowers, fruits / vegetables (raw), or live plants per primary source.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Visitor screening for infection symptoms; restrict children + ill visitors.", citationIDs: ["openrn_pr_round16"])
            ]),
            .bullets(title: "Practical pearls", [
                AttributedBullet("Donning order — gown → mask → goggles → gloves; doffing reverse + careful to avoid contamination.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Hand hygiene 5 moments — before patient contact, before clean / aseptic procedure, after body-fluid risk, after patient contact, after contact with patient surroundings.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Discontinuation criteria — pathogen-specific (e.g., 3 negative MRSA cultures vs persistent precautions throughout admission).", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Bundle compliance — daily auditing improves outcomes; CLABSI / CAUTI / VAP / SSI prevention bundles.", citationIDs: ["specialty_pr_round16"])
            ])
        ],
        citations: [openrnPRR16, specialtyPRR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}

public enum HealthLiteracyTeachBackSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "health-literacy-teach-back",
        title: "Health literacy + teach-back",
        subtitle: "Plain language · teach-back · Ask Me 3 · navigate health system",
        eyebrow: "REFERENCE · PATIENT EDUCATION",
        nclexTags: refTagsR16,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Health literacy is the ability to obtain + understand + use health information to make decisions. Limited health literacy is a strong predictor of poor outcomes, hospital readmission, mortality. Universal precautions — assume limited literacy, use plain language with all patients per primary source.",
                citationIDs: ["specialty_pr_round16"]
            )),
            .bullets(title: "Plain-language principles", [
                AttributedBullet("Use everyday words — \"high blood pressure\" not \"hypertension\"; \"small bowel\" not \"distal small intestine.\"", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Short sentences + active voice; one idea per sentence.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Limit jargon; define unavoidable terms (\"high blood sugar — your body has too much sugar in the blood\").", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Use numbers carefully — \"1 in 10 people\" rather than \"10%\"; avoid relative risks.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Pictures + diagrams for procedures, anatomy, medication scheduling.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Limit information to 2–3 key points per encounter.", citationIDs: ["openrn_pr_round16"])
            ]),
            .bullets(title: "Teach-back method", [
                AttributedBullet("After teaching, ask: \"To make sure I explained it well, can you tell me in your own words what you'll do when you get home?\"", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Frame as YOUR check on your teaching, NOT a test of patient.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("If misunderstanding — re-teach using different words / methods; ask again.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Best practice — at every visit, every important teaching moment.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Patients can teach-back — pump on / off, daily insulin technique, when to call provider, signs of worsening.", citationIDs: ["openrn_pr_round16"])
            ]),
            .bullets(title: "Ask Me 3 (patient framework)", [
                AttributedBullet("1. What is my main problem?", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("2. What do I need to do?", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("3. Why is it important for me to do this?", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Encourage patients to ask these questions; provide visual reminders in waiting areas.", citationIDs: ["specialty_pr_round16"])
            ]),
            .bullets(title: "Cultural + linguistic competence", [
                AttributedBullet("Professional medical interpreter — required for limited English proficiency; do NOT use family members for sensitive medical information.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Translated materials at appropriate reading level (5th–6th grade typical).", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Cultural humility — ask about beliefs / preferences / practices; don't assume.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Health beliefs vary by culture — alternative practices common; integrate respectfully.", citationIDs: ["openrn_pr_round16"])
            ]),
            .bullets(title: "System navigation support", [
                AttributedBullet("Health navigator / community health worker — bridge medical-social services.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Written discharge instructions — large print, plain language, visual cues.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Medication reconciliation at every transition; pillbox / blister pack for polypharmacy.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Follow-up call within 48–72 hours of discharge — reduces readmission.", citationIDs: ["specialty_pr_round16"]),
                AttributedBullet("Address social determinants — transportation, food security, housing, child care, financial barriers.", citationIDs: ["openrn_pr_round16"])
            ])
        ],
        citations: [openrnPRR16, specialtyPRR16],
        lastSourceFidelityReview: "2026-05-04"
    )
}
