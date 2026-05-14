import Foundation

// Curator-model procedures (round 37 part A — feeding tubes + EKG + cardiopulm procedures).

private let openrnP37A = CitationSource(
    id: "openrn_p37a",
    shortName: "Open RN Nursing Skills",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-13"
)
private let cdcP37A = CitationSource(
    id: "cdc_p37a",
    shortName: "CDC + AHRQ + ASGE concept citations",
    publisher: "CDC · AHRQ · ASGE",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-13"
)
private let specialtyP37A = CitationSource(
    id: "specialty_p37a",
    shortName: "ASGE + AAOS + ASA + AHA + ENA + INS fact citations",
    publisher: "ASGE · AAOS · ASA · AHA · ENA · INS",
    license: .factCitationOnly,
    url: "https://www.asge.org/",
    lastRetrieved: "2026-05-13"
)

private let procTagsR37 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)

public enum PEGTubeManagementSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "peg-tube-management",
        title: "PEG (percutaneous endoscopic gastrostomy) tube management",
        subtitle: "PEG vs surgical gastrostomy · bumper assessment · stoma care · feeding · medication administration · complication prevention + replacement",
        nclexTags: procTagsR37,
        indications: AttributedProse(
            "PEG tubes are placed endoscopically (vs. surgical gastrostomy) for long-term enteral nutrition (>4-6 weeks anticipated need); typical patients include neurologic dysphagia (stroke, ALS, dementia, head + neck cancer), prolonged critical illness, severe protein-calorie malnutrition. Provides nutrition, hydration, and medication administration when oral route inadequate or unsafe per primary source.",
            citationIDs: ["specialty_p37a"]
        ),
        contraindications: AttributedProse(
            "Severe ascites, peritonitis, intestinal obstruction (relative), inability to oppose stomach to abdominal wall, severe coagulopathy, unstable cardiopulmonary status; contraindications to endoscopy.",
            citationIDs: ["specialty_p37a"]
        ),
        equipment: [
            AttributedBullet("PEG tube (typically 18-24 Fr) with internal bumper + external bolster; Y-port adapter for medications + flushing.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Sterile saline + 60 mL syringe for flushing; gauze, mild soap, water for stoma care.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Enteral feeding pump + bag + tubing (continuous or bolus); chlorhexidine wipes for medication preparation.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Replacement equipment — replacement PEG tube (same Fr size) or balloon-tip gastrostomy tube; obturator for replacement.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Crushing tool for medication administration; appropriate medication forms (liquid preferred when possible).", citationIDs: ["openrn_p37a"])
        ],
        preProcedure: [
            AttributedBullet("Verify tube placement, type, French size; document at admission.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Pre-feeding assessment — gastric residual volume (GRV) per institutional protocol (typically 250-500 mL holds feeding); reassess in 4 hours.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Verify tube position before each medication or feeding administration — measure external length + compare to documented baseline.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Hand hygiene + clean technique (not sterile after initial healing).", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Position head of bed 30-45° during + 30-60 minutes after feeding to prevent aspiration.", citationIDs: ["specialty_p37a"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Daily stoma assessment + care", body: "Inspect site for redness, drainage, granulation tissue, bleeding, leakage, skin breakdown; clean with mild soap + water (or saline) using cotton swabs; rotate external bolster gently to prevent pressure necrosis; allow 1-2 cm of mobility (not too tight, not too loose); pat dry; can leave open to air after healed.", citationIDs: ["openrn_p37a"]),
            ProcedureStep(number: 2, title: "Bumper / bolster assessment", body: "External bolster should sit ~1-2 cm above skin to allow air circulation + prevent pressure injury; rotate 90° daily; if too tight → pressure necrosis + buried bumper syndrome; if too loose → leakage + tube migration.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 3, title: "Medication administration", body: "Liquid forms preferred; tablets crushed individually then suspended in water (NEVER crush enteric-coated, sustained-release, sublingual, capsules with beads); FLUSH 15-30 mL water before + 5-10 mL between each medication + 15-30 mL after; do not mix medications together; verify position before administration.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 4, title: "Feeding administration — bolus", body: "30-45° HOB elevation; verify position; check residual; flush 30 mL water; administer 250-300 mL feed over 15-30 min by gravity; flush 30 mL water after; reassess tolerance.", citationIDs: ["openrn_p37a"]),
            ProcedureStep(number: 5, title: "Feeding administration — continuous", body: "Pump-controlled rate (typical 50-150 mL/hr); change tubing + bag Q24h; refill bag with no more than 4 hours of feed at room temperature (bacterial growth); flush 30 mL water Q4h; gradual rate advancement.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 6, title: "Tube troubleshooting — clogged tube", body: "Flush with warm water 30-60 mL using gentle in/out push (DO NOT force — perforation risk); pancreatic enzyme + sodium bicarbonate combination (specific protocol — Pancrelipase + sodium bicarbonate suspension) for stubborn clogs; if unsuccessful + critical access → tube replacement.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 7, title: "Tube replacement (if dislodged)", body: "If <2-4 weeks post-PEG insertion → DO NOT replace (immature stoma, risk peritonitis); if >4 weeks → can typically replace at bedside with balloon-tip tube; insert immediately to prevent stoma closure (closes within hours); verify placement before use; provider for confirmation/imaging if any concerns.", citationIDs: ["specialty_p37a"])
        ],
        postProcedure: [
            AttributedBullet("Position upright 30-60 min after each feeding.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Document GRV + tolerance + complications + interventions.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Daily weights, I/O, electrolytes for refeeding syndrome risk.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Site care education + replacement awareness for caregiver.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Long-term tube replacement schedule per institutional protocol (typically every 6-12 months for balloon tubes; PEG tubes can last years).", citationIDs: ["specialty_p37a"])
        ],
        documentation: [
            AttributedBullet("Tube type, French size, insertion date, external length, last replacement.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Site assessment, bumper position, feeding tolerance, GRV, intake/output.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Medications administered, flushing, complications.", citationIDs: ["specialty_p37a"])
        ],
        watchFor: [
            AttributedBullet("BURIED BUMPER SYNDROME — internal bolster migrates into stomach wall; pain + leakage + obstruction; endoscopic correction.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("SITE INFECTION — redness + warmth + purulent drainage + fever; antibiotics + meticulous care.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("LEAKAGE — gastric content around tube; address bumper tightness + replace tube if oversized stoma.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("DISLODGEMENT — early (<4 weeks) is emergency, late (>4 weeks) replace promptly.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("TUBE OCCLUSION — preventable with adequate flushing; warm water + enzyme/bicarbonate for unclogging.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("ASPIRATION pneumonia — head of bed elevation + slow feed + GRV monitoring + cuff inflation if intubated.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("REFEEDING SYNDROME — severe malnourished patients; gradual rate advancement; monitor electrolytes (especially phosphate, magnesium, potassium).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Granulation tissue at stoma — silver nitrate cautery or topical steroids; addresses irritation source (loose tube, friction).", citationIDs: ["specialty_p37a"])
        ],
        citations: [openrnP37A, cdcP37A, specialtyP37A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum JejunostomyTubeCareSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "jejunostomy-tube-care",
        title: "Jejunostomy (J-tube) management",
        subtitle: "Surgical or PEG-J · post-pyloric feeding · CONTINUOUS feeding only (no bolus) · smaller bore (8-12 Fr) · medication challenges · meticulous care",
        nclexTags: procTagsR37,
        indications: AttributedProse(
            "Jejunostomy tubes deliver nutrition directly into jejunum, bypassing stomach + duodenum; surgical (Witzel) or PEG-J (PEG with jejunal extension); used for high aspiration risk, severe gastroparesis, gastric outlet obstruction, post-Whipple, severe pancreatitis (avoid stomach), trauma. Preferred over gastric feeding when delayed gastric emptying poses aspiration risk per primary source.",
            citationIDs: ["specialty_p37a"]
        ),
        contraindications: AttributedProse(
            "Distal small bowel obstruction, severe inflammatory bowel disease in jejunum, surgical bowel anastomosis distal to tube position, severe coagulopathy.",
            citationIDs: ["specialty_p37a"]
        ),
        equipment: [
            AttributedBullet("J-tube (typically 8-14 Fr — SMALLER than gastrostomy); pump-controlled feeding system mandatory.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Continuous feeding pump (gravity feeds NOT appropriate for J-tubes — small bore).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("60 mL syringe for flushing (avoid smaller syringes — high pressure risk for tube damage).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Sterile saline or water for flushing; warm water at 30-37°C optimal.", citationIDs: ["openrn_p37a"])
        ],
        preProcedure: [
            AttributedBullet("Verify tube type (J-tube vs G-tube vs PEG-J); J-tube ALWAYS continuous feeding, NEVER bolus.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Verify tube position — measure external length + compare to baseline; concerns about migration → consult provider + imaging.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Confirm formula concentration appropriate for jejunal delivery (some require dilution to prevent diarrhea).", citationIDs: ["specialty_p37a"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Continuous feeding setup", body: "Pump-controlled rate (typical 25-100 mL/hr starting → advance gradually); flush 30 mL warm water Q4h; change tubing + bag Q24h; never mix medications with feed.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 2, title: "Medication administration", body: "ALWAYS check that medication is appropriate for jejunal delivery (some drugs absorbed primarily in stomach/duodenum — reduced bioavailability via J-tube — e.g., levothyroxine, iron, certain antifungals); LIQUID forms strongly preferred (small bore tube clogs easily); flush 15 mL warm water before + after; STOP feeding 30 min before + after if drug-feed interaction known (e.g., phenytoin, levothyroxine, fluoroquinolones).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 3, title: "Stoma care", body: "Same as PEG/G-tube — daily cleaning with mild soap + water; assess for skin breakdown + leakage; rotate bolster; pat dry.", citationIDs: ["openrn_p37a"]),
            ProcedureStep(number: 4, title: "Tube unclogging", body: "Warm water flush 30-60 mL with gentle in/out push; pancreatic enzyme + bicarbonate combination for stubborn clogs; AVOID forcing — high pressure risks tube perforation through small bore; if unsuccessful → replacement.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 5, title: "Replacement", body: "More complex than gastrostomy — surgical J-tubes typically NOT replaced at bedside; PEG-J extension can be replaced; if dislodged → emergent surgical or interventional radiology consultation; do NOT attempt blind reinsertion.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 6, title: "Diarrhea management", body: "Common with J-tube feeds — too rapid rate, hyperosmolar formula, lactose intolerance; SLOW rate, dilute formula, switch to elemental/peptide formula, fiber addition, rule out C. diff.", citationIDs: ["specialty_p37a"])
        ],
        postProcedure: [
            AttributedBullet("Document — feeding rate, tolerance, GI symptoms, weight, electrolytes.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Position 30-45° (some practitioners advocate semi-Fowler for J-tube as pyloric bypass reduces aspiration risk).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Refeeding syndrome monitoring — phosphate, magnesium, potassium daily for first week in malnourished.", citationIDs: ["specialty_p37a"])
        ],
        documentation: [
            AttributedBullet("Tube type, position, French size, insertion + replacement dates.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Feeding rate, total volume, GI tolerance, GI symptoms.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Stoma assessment, bolster position, complications, interventions.", citationIDs: ["specialty_p37a"])
        ],
        watchFor: [
            AttributedBullet("DIARRHEA most common complication — slow rate + change formula + rule out C. diff.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Tube CLOGGING — small bore particularly prone; meticulous flushing; AVOID forcing.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("ABDOMINAL DISTENSION + cramping — slow rate; fiber-containing formulas may help.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("DUMPING SYNDROME-like — rapid jejunal feeding can cause hypotension, tachycardia, sweating; slow rate.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Drug bioavailability concerns — jejunal delivery bypasses gastric/duodenal absorption sites; pharmacist consultation for high-stakes medications.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("DISLODGEMENT — emergent surgical/IR consultation; do NOT replace blindly.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Site infection + leakage — same management as G-tube; meticulous care.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Bowel obstruction (rare) — abdominal pain + distension + emesis; emergent imaging + surgical evaluation.", citationIDs: ["specialty_p37a"])
        ],
        citations: [openrnP37A, cdcP37A, specialtyP37A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum EKG12LeadProcedureSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ekg-12-lead-procedure",
        title: "12-lead EKG procedure",
        subtitle: "Electrode placement (10 leads → 12 views) · skin prep · troubleshooting artifact · serial EKGs · door-to-EKG ≤10 min for chest pain",
        nclexTags: procTagsR37,
        indications: AttributedProse(
            "12-lead electrocardiogram (EKG/ECG) — non-invasive cardiac assessment recording electrical activity from 12 perspectives using 10 electrodes. Indications — chest pain (door-to-EKG ≤10 min), syncope, palpitations, dyspnea, suspected MI/arrhythmia/ischemia, pre-op assessment, electrolyte abnormalities, drug toxicity, pacemaker evaluation. Critical timing in acute coronary syndrome workup per primary source.",
            citationIDs: ["specialty_p37a"]
        ),
        contraindications: AttributedProse(
            "None absolute — non-invasive + safe; relative — extensive thoracic burns or wounds preventing electrode placement (use alternative locations + document).",
            citationIDs: ["specialty_p37a"]
        ),
        equipment: [
            AttributedBullet("12-lead EKG machine (typically combined unit with monitor + recorder).", citationIDs: ["openrn_p37a"]),
            AttributedBullet("10 disposable adhesive electrodes (4 limb + 6 precordial); pre-gelled.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Skin prep — alcohol pad + abrasive paper if hairy/oily skin; razor for hair removal at electrode sites if needed.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Patient gown + privacy.", citationIDs: ["openrn_p37a"])
        ],
        preProcedure: [
            AttributedBullet("Verify patient identification (2 identifiers); explain procedure briefly + reassure (rapid + painless).", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Position supine OR semi-Fowler (if dyspneic); arms relaxed at sides; legs uncrossed; minimize movement during recording.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Expose chest + ankles (privacy maintained); remove jewelry that may interfere.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Skin prep at electrode sites — wipe with alcohol; abrasive paper if needed; shave if hairy; ensure skin is dry.", citationIDs: ["openrn_p37a"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Limb leads (4)", body: "Right arm (RA) — wrist OR shoulder area; Left arm (LA) — wrist OR shoulder area; Right leg (RL) — ankle (ground); Left leg (LL) — ankle. Mnemonic: White-on-Right, Smoke-over-Fire (Black on top of Red — left chest), Snow-over-Grass (White on top of Green — right chest in some montages).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 2, title: "Precordial (chest) leads (6)", body: "V1 — 4th intercostal space (ICS) RIGHT sternal border. V2 — 4th ICS LEFT sternal border. V4 — 5th ICS LEFT midclavicular line. V3 — midway between V2 + V4. V5 — 5th ICS LEFT anterior axillary line (same horizontal level as V4). V6 — 5th ICS LEFT midaxillary line (same horizontal level as V4 + V5). KEY landmark — angle of Louis (sternal angle) marks 2nd ICS; count down to 4th ICS.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 3, title: "Right-sided + posterior leads (selected)", body: "Right-sided V4R for suspected RV infarction (inferior MI) — mirror image of V4 on right side. Posterior leads V7-V9 for posterior MI suspicion (large R waves V1-V2) — V7 posterior axillary line, V8 midscapular, V9 paravertebral; same horizontal level.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 4, title: "Recording", body: "Patient still + breathing normally; reduce muscle tension + tremor; record 10-12 second strip; review on screen for artifact + lead misplacement; obtain printout; verify patient name + date/time.", citationIDs: ["openrn_p37a"]),
            ProcedureStep(number: 5, title: "Troubleshooting artifact", body: "Wandering baseline — patient movement, respiratory artifact, poor electrode contact (re-prep skin); muscle tremor — relax patient, warm room, minimize movement (Parkinson's, anxiety); 60 Hz interference — unplug nearby electronics, check ground; lead reversal (RA/LA reversed) — negative QRS in lead I (look for inverted P + QRS).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 6, title: "Serial EKG", body: "Repeat in 10-30 min for evolving ACS or rhythm changes; compare to baseline + prior; STEMI evolves over minutes-hours; T-wave changes early.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 7, title: "Communication + provider review", body: "URGENT EKG (chest pain, syncope, dyspnea) — review with provider WITHIN MINUTES; STEMI activation if criteria met; do NOT remove electrodes if serial planned.", citationIDs: ["specialty_p37a"])
        ],
        postProcedure: [
            AttributedBullet("Remove electrodes gently if EKG complete; clean any residual gel.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Ensure patient comfort + privacy.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("File EKG in chart; provider notification + interpretation; serial monitoring if indicated.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("If continuous cardiac monitoring needed → place telemetry leads.", citationIDs: ["openrn_p37a"])
        ],
        documentation: [
            AttributedBullet("Time of EKG, indication, patient position, complications.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("EKG findings (rate, rhythm, QRS, ST changes) + comparison to prior.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Provider notification + interpretation + actions taken.", citationIDs: ["openrn_p37a"])
        ],
        watchFor: [
            AttributedBullet("DOOR-TO-EKG ≤10 minutes for chest pain — quality + safety metric; affects STEMI outcomes.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("LEAD MISPLACEMENT — incorrect V leads particularly common; affects interpretation + treatment; verify landmarks; left arm/right arm reversal causes incorrect axis interpretation.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("MISSING right-sided leads in inferior MI — V4R is critical for diagnosing RV infarction; affects nitroglycerin safety (avoid in RV MI — preload-dependent).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Posterior MI often missed — large R wave + ST depression V1-V2 with reciprocal ST elevation V7-V9; obtain posterior leads.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("WOMEN'S BREAST tissue — if significant breast tissue, place electrodes UNDER the breast (not over) for accurate readings.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("PACEMAKER/ICD patients — note in chart; appears as pacing spike + wide QRS (paced rhythm); native rhythm assessment requires temporary pacing pause if needed.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Serial EKGs for evolving ACS — repeat 10-30 min; compare; document changes.", citationIDs: ["specialty_p37a"])
        ],
        citations: [openrnP37A, cdcP37A, specialtyP37A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum CentralLineRemovalSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "central-line-removal-procedure",
        title: "Central line removal procedure",
        subtitle: "Trendelenburg + Valsalva · air embolism prevention · sterile technique · pressure × 5 min · catheter tip culture if infection · documentation",
        nclexTags: procTagsR37,
        indications: AttributedProse(
            "Central venous catheter removal — when no longer indicated, completion of therapy, suspected catheter-related infection (CLABSI), thrombosis, malposition, mechanical failure. Daily review of catheter necessity reduces CLABSI risk; early removal central to bundle compliance per primary source.",
            citationIDs: ["specialty_p37a"]
        ),
        contraindications: AttributedProse(
            "Active bleeding diathesis without correction; ongoing critical infusions requiring central access; coagulopathy uncorrected (consider INR <1.5, platelets >50,000 for elective removal).",
            citationIDs: ["specialty_p37a"]
        ),
        equipment: [
            AttributedBullet("Sterile gloves + sterile dressing supplies + occlusive dressing (PETROLATUM gauze + transparent dressing).", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Suture removal kit if sutures present; 4×4 gauze + tape.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Sterile scissors for catheter tip culture (if indicated).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Sterile container with culture medium for tip culture.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Eye protection + mask for sterility.", citationIDs: ["openrn_p37a"])
        ],
        preProcedure: [
            AttributedBullet("Verify provider order for removal; verify last anticoagulation dose; check coagulation labs if indicated.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Discuss procedure with patient — brief discomfort, pressure required after removal.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Position patient — TRENDELENBURG (head-down 15-30°) for IJ + subclavian removal (engorges veins, reduces air embolism risk); supine for femoral.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Patient instruction — VALSALVA maneuver during removal (hold breath + bear down) for IJ + subclavian; not needed for femoral.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Discontinue all infusions; flush each lumen with saline; cap or close clamps.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Hand hygiene + don sterile gloves + sterile field.", citationIDs: ["openrn_p37a"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Remove dressing + assess site", body: "Carefully remove transparent dressing; assess insertion site for redness, drainage, induration; assess catheter for migration (compare external length to baseline).", citationIDs: ["openrn_p37a"]),
            ProcedureStep(number: 2, title: "Remove sutures (if present)", body: "Sterile suture removal; document number removed.", citationIDs: ["openrn_p37a"]),
            ProcedureStep(number: 3, title: "Patient positioning + Valsalva instruction", body: "Trendelenburg position; ask patient to take a deep breath + hold + BEAR DOWN (Valsalva) — increases intrathoracic pressure + venous pressure, reduces air embolism risk; if patient cannot perform Valsalva → exhale during removal (do NOT inhale during removal).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 4, title: "Catheter removal", body: "During Valsalva — withdraw catheter SMOOTHLY + STEADILY in one continuous motion; release Valsalva ONLY after catheter completely out + occlusive dressing applied; AVOID jerking + interrupting (risk catheter fracture).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 5, title: "Immediate occlusive dressing", body: "Apply pressure with sterile gauze OVER PETROLATUM gauze occlusive dressing IMMEDIATELY upon removal; PETROLATUM creates air-tight seal preventing air entrainment through fistulous tract; hold pressure 5+ minutes (longer for coagulopathy + heparin).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 6, title: "Catheter tip culture (if infection suspected)", body: "Cut tip with sterile scissors (5 cm distal segment) into sterile container; send for semi-quantitative or quantitative culture; >15 CFU = positive (Maki technique); paired blood cultures help confirm CLABSI.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 7, title: "Inspect catheter for completeness", body: "Verify catheter tip + entire length intact; if fragmentation/missing piece → CXR or imaging (catheter embolism risk); IR retrieval if confirmed.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 8, title: "Site care + monitoring", body: "Apply transparent dressing OVER occlusive petrolatum gauze; instruct patient to remain in Trendelenburg or supine 30-60 minutes; monitor for chest pain, dyspnea, neurological changes (air embolism signs); leave occlusive dressing 24+ hours; assess insertion site daily until healed.", citationIDs: ["specialty_p37a"])
        ],
        postProcedure: [
            AttributedBullet("Trendelenburg or supine position 30-60 minutes minimum; ambulation as tolerated after.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Monitor vital signs Q15 min × 1 hour; assess for air embolism signs (chest pain, dyspnea, hypoxia, mill wheel murmur, neuro changes).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Site assessment — bleeding, hematoma, swelling, drainage; daily until healed.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Document — date/time, position, catheter intact, complications.", citationIDs: ["openrn_p37a"])
        ],
        documentation: [
            AttributedBullet("Indication for removal, time of removal, patient tolerance, position used.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Catheter intactness, tip culture sent if applicable.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Site assessment, dressing applied, patient monitoring + outcome.", citationIDs: ["openrn_p37a"])
        ],
        watchFor: [
            AttributedBullet("AIR EMBOLISM — sudden chest pain + dyspnea + hypoxia + mill wheel murmur + altered mental status; LEFT LATERAL Trendelenburg position + 100% O2 + emergent treatment.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Catheter FRAGMENTATION — broken pieces in vasculature; CXR + IR retrieval; rare but serious.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("HEMORRHAGE — coagulopathy + anticoagulation; correct before elective removal; pressure + hold longer.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("PNEUMOTHORAX — particularly if subclavian; CXR if respiratory symptoms develop.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Persistent BLEEDING — pressure, suture if needed, vascular surgery for refractory.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("INFECTION — catheter tip culture + paired blood cultures; if persistent bacteremia → ECHO for endocarditis.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Femoral lines — bleeding/hematoma risk; sandbag + bedrest 4-6 hours typical.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("ANTICOAGULATION timing — hold heparin/LMWH per protocol; restart after pressure × 4-6 hours OR per provider.", citationIDs: ["specialty_p37a"])
        ],
        citations: [openrnP37A, cdcP37A, specialtyP37A],
        lastSourceFidelityReview: "2026-05-13"
    )
}

public enum LumbarPunctureAssistRound37Sample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "lumbar-puncture-assist",
        title: "Lumbar puncture (LP) — nursing assist",
        subtitle: "Positioning · landmark identification (L3-L4 or L4-L5) · sterile technique · CSF collection (4 tubes) · post-LP positioning + headache prevention · monitoring",
        nclexTags: procTagsR37,
        indications: AttributedProse(
            "Lumbar puncture — diagnostic + therapeutic CSF access. Indications — meningitis/encephalitis suspicion, SAH (after negative CT >6 hr post-onset), MS, GBS, idiopathic intracranial hypertension (IIH; therapeutic + diagnostic), intrathecal medications, CSF leak. Done at L3-L4 OR L4-L5 interspace (below spinal cord termination at L1-L2 in adults). Nursing role — positioning, sterile field assistance, specimen handling, post-procedure care per primary source.",
            citationIDs: ["specialty_p37a"]
        ),
        contraindications: AttributedProse(
            "INCREASED ICP with mass lesion (herniation risk — obtain CT first if focal deficits, papilledema, recent seizure, immunocompromise, age >60, decreased LOC); coagulopathy (correct INR <1.4, platelets >50,000); infection at puncture site; spinal abnormality preventing safe access.",
            citationIDs: ["specialty_p37a"]
        ),
        equipment: [
            AttributedBullet("LP tray — spinal needle (18-22 gauge atraumatic preferred to reduce post-LP headache), manometer for opening pressure, 4 sterile collection tubes (numbered 1-4), local anesthetic (lidocaine 1-2%), syringes + needles, sterile drape, antiseptic prep (chlorhexidine).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Sterile gloves, mask, gown, eye protection.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Pillow for between knees if lateral position; pillows for head + abdominal support.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Sterile dressing for site + dressing + tape.", citationIDs: ["openrn_p37a"])
        ],
        preProcedure: [
            AttributedBullet("Verify consent + procedure understanding.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Verify CT obtained when indicated (focal deficits, AMS, papilledema); coagulation labs reviewed.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Assess + document baseline neurologic status, vital signs, last meal, allergies (especially lidocaine).", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Patient teaching — what to expect, importance of stillness during needle insertion, post-LP positioning + headache prevention.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Empty bladder before procedure.", citationIDs: ["openrn_p37a"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Positioning", body: "LATERAL DECUBITUS (preferred — left side typically) — fetal position with knees drawn to chest, chin to chest, back arched outward (cat position); curves spine + opens interspaces. SITTING — patient leaning forward over bedside table with pillow; opens lumbar interspaces; preferred for obese patients but cannot measure opening pressure accurately.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 2, title: "Landmark identification", body: "Provider identifies iliac crests (L4 or L4-L5 interspace level — Tuffier's line); palpates spinous processes; selects L3-L4 OR L4-L5 (below spinal cord termination at L1-L2).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 3, title: "Sterile prep", body: "Chlorhexidine prep wide area; sterile drape; sterile field; provider dons sterile gloves, mask, gown, eye protection.", citationIDs: ["openrn_p37a"]),
            ProcedureStep(number: 4, title: "Local anesthesia", body: "Lidocaine 1-2% subcutaneous wheel + deeper infiltration; allow 1-2 minutes for effect.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 5, title: "Spinal needle insertion + opening pressure", body: "Provider inserts spinal needle perpendicular to skin + slight cephalad angle; advances through ligaments (loss of resistance pop into subarachnoid space); removes stylet; CSF flows; attaches manometer; measures OPENING PRESSURE (normal 10-25 cm H2O lateral position).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 6, title: "CSF collection — 4 numbered tubes", body: "Tube 1 — cell count + differential. Tube 2 — protein + glucose + lactate. Tube 3 — Gram stain + culture + special studies. Tube 4 — additional cell count (if RBC declining tube 1→4 = traumatic tap; if RBC stable = SAH); xanthochromia by spectrophotometry. ~1-2 mL per tube typically; record total volume.", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 7, title: "Closing pressure + needle removal", body: "Closing pressure measured (normal 8-15 cm H2O); stylet replaced; needle withdrawn; sterile dressing applied; no specific aftercare required (ambulation typical).", citationIDs: ["specialty_p37a"]),
            ProcedureStep(number: 8, title: "Specimen labeling + transport", body: "Label tubes 1-4 with patient identifiers + time + collection order; transport immediately to lab; communicate urgency to lab if meningitis/encephalitis (priority Gram stain + cultures).", citationIDs: ["specialty_p37a"])
        ],
        postProcedure: [
            AttributedBullet("Position SUPINE or PRONE 1-2 hours post-LP per institutional protocol (mixed evidence on prevention of post-LP headache; bedrest does not significantly help; HYDRATION + atraumatic needle most evidence-based prevention).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("ENCOURAGE FLUIDS — oral or IV; caffeine 200-300 mg PO/IV may help post-LP headache.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Monitor neurological status, headache severity, vital signs every 30-60 minutes for 2 hours; then per institutional protocol.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Site assessment — bleeding, hematoma, CSF leak; sterile dressing.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Symptom management — analgesics for headache (acetaminophen + NSAIDs); blood patch for refractory severe headache.", citationIDs: ["specialty_p37a"])
        ],
        documentation: [
            AttributedBullet("Position used, opening + closing pressures, CSF appearance, volume collected, complications.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Patient tolerance, neurologic status, vital signs.", citationIDs: ["openrn_p37a"]),
            AttributedBullet("Post-procedure assessment, interventions, outcomes.", citationIDs: ["openrn_p37a"])
        ],
        watchFor: [
            AttributedBullet("POST-LP HEADACHE — most common complication (~10-30%); positional (worse upright, better supine); from CSF leak; HYDRATION + caffeine + analgesics; blood patch for severe (>72 hours, no improvement).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("CEREBRAL HERNIATION — rare but catastrophic in patients with mass lesion + increased ICP; CT FIRST in high-risk patients (focal deficits, AMS, papilledema, immunocompromise).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Bleeding / spinal hematoma — rare; coagulopathy patients at risk; correct INR/platelets first.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Infection — meningitis from procedure (very rare with sterile technique).", citationIDs: ["specialty_p37a"]),
            AttributedBullet("CSF leak / persistent leak — sterile dressing + supine; rarely needs intervention.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Cranial nerve palsies — abducens nerve (CN VI) palsy from low CSF pressure; transient.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("Traumatic tap — RBC tube 1 > tube 4 progressively; vs SAH (RBC stable across tubes); xanthochromia + spectrophotometry definitive.", citationIDs: ["specialty_p37a"]),
            AttributedBullet("In suspected meningitis — DO NOT delay antibiotics for LP; if cannot perform LP within 30 min, give empiric antibiotics + dexamethasone first.", citationIDs: ["specialty_p37a"])
        ],
        citations: [openrnP37A, cdcP37A, specialtyP37A],
        lastSourceFidelityReview: "2026-05-13"
    )
}
