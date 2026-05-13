import Foundation

// Curator-model procedures + reference (round 21 — critical care procedures + shock + ICU bundle).

private let openrnPRR21 = CitationSource(
    id: "openrn_pr_round21",
    shortName: "Open RN Nursing Skills + Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-05-12"
)
private let cdcPRR21 = CitationSource(
    id: "cdc_pr_round21",
    shortName: "CDC infection prevention + AHA guidelines",
    publisher: "CDC · AHA",
    license: .publicDomain,
    url: "https://www.cdc.gov/infectioncontrol/guidelines/",
    lastRetrieved: "2026-05-12"
)
private let specialtyPRR21 = CitationSource(
    id: "specialty_pr_round21",
    shortName: "SCCM PADIS / ICU Liberation + SSC 2021 + AHA TTM concept citations",
    publisher: "SCCM · AHA · ATS",
    license: .factCitationOnly,
    url: "https://www.sccm.org/Clinical-Resources/Guidelines",
    lastRetrieved: "2026-05-12"
)

private let procTagsR21 = NCLEXTags(
    category: .physiologicalIntegrity,
    subcategory: .reductionOfRiskPotential,
    priorityConcept: .safety
)
private let refTagsR21 = NCLEXTags(
    category: .safeAndEffectiveCare,
    subcategory: .managementOfCare,
    priorityConcept: .safety
)

public enum ArterialLineInsertionSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "arterial-line-insertion",
        title: "Arterial line insertion + management",
        subtitle: "Continuous BP + ABG access · radial preferred · Allen's test · maintain heparinized flush",
        nclexTags: procTagsR21,
        indications: AttributedProse(
            "Continuous BP monitoring in hemodynamic instability (shock, vasoactive infusions, complex surgery). Frequent arterial blood sampling for ABG, lactate, cultures. Beat-to-beat BP measurement for titration of antihypertensives or vasopressors per primary source.",
            citationIDs: ["specialty_pr_round21"]
        ),
        contraindications: AttributedProse(
            "Absolute — local infection at site, Raynaud's / severe vasospasm. Relative — coagulopathy / anticoagulation (use smaller catheter, prolonged pressure), absent collateral circulation (positive Allen's test), AV fistula site, recent surgery on extremity.",
            citationIDs: ["specialty_pr_round21"]
        ),
        equipment: [
            AttributedBullet("Arterial catheter (typically 20 g radial; 18 g femoral); guidewire (over-wire technique).", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Pressure tubing + transducer + heparinized flush bag (500 mL NS with 1-2 units heparin/mL OR heparin-free) at 300 mmHg pressure.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Sterile gloves, mask, drape, chlorhexidine prep, lidocaine 1% for local anesthesia.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Ultrasound for guidance (significantly improves first-pass success).", citationIDs: ["specialty_pr_round21"])
        ],
        preProcedure: [
            AttributedBullet("Verify orders, identity, allergies, coagulation status.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Hand hygiene + sterile technique.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Allen's test for radial — assess ulnar collateral (clinically less predictive than ultrasound).", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("Position wrist hyperextended 30° on rolled towel; dorsal aspect down.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Pre-zero + level transducer at phlebostatic axis (4th ICS midaxillary).", citationIDs: ["openrn_pr_round21"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Prep + drape", body: "Chlorhexidine prep generously, allow dry; sterile drape; full barrier precautions (mask + cap + sterile gloves + drape) per CLABSI bundle.", citationIDs: ["cdc_pr_round21"]),
            ProcedureStep(number: 2, title: "Local anesthesia", body: "Infiltrate 0.5-1 mL lidocaine 1% over palpable pulse; allow effect.", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 3, title: "Locate vessel", body: "Palpate radial pulse OR use ultrasound (preferred). Ultrasound shows pulsating, non-compressible artery in cross-section.", citationIDs: ["specialty_pr_round21"]),
            ProcedureStep(number: 4, title: "Insert needle", body: "30-45° angle to skin, bevel up, advance toward palpated pulse / under ultrasound. Watch for flashback in needle hub.", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 5, title: "Advance + thread catheter", body: "Once flash, lower angle to 10-15°, advance slightly to ensure intraluminal position; thread catheter OVER needle (Angiocath) OR thread guidewire then catheter (Seldinger).", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 6, title: "Connect + flush", body: "Connect pressure tubing; verify pulsatile waveform; flush briefly; secure with sutures or transparent dressing.", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 7, title: "Zero + calibrate", body: "Open transducer to air at phlebostatic axis (4th ICS midaxillary), zero, then close to atmosphere + open to patient. Verify waveform is square (does NOT damp).", citationIDs: ["specialty_pr_round21"])
        ],
        postProcedure: [
            AttributedBullet("Document insertion site, date / time, catheter size, attempts, complications.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("CONTINUOUS waveform monitoring; alarm parameters set.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Q1H assess perfusion distal to insertion — color, warmth, pulse, capillary refill.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("Daily review of indication — remove ASAP to reduce infection / thrombosis risk.", citationIDs: ["cdc_pr_round21"]),
            AttributedBullet("Site dressing change per CLABSI protocol; chlorhexidine sponge optional.", citationIDs: ["cdc_pr_round21"])
        ],
        documentation: [
            AttributedBullet("Site, catheter type / size, attempts, complications, perfusion check, waveform quality.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Daily indication review; site assessment; dressing changes.", citationIDs: ["cdc_pr_round21"]),
            AttributedBullet("BP comparisons — arterial line vs cuff at insertion (should be within ~10 mmHg).", citationIDs: ["specialty_pr_round21"])
        ],
        watchFor: [
            AttributedBullet("DISTAL ISCHEMIA — hand pale, cool, painful, weak pulse, prolonged capillary refill; emergent removal.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("THROMBOSIS — uncommon clinically significant; ultrasound if concern.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("HEMATOMA / BLEEDING — apply firm pressure 5+ min on removal; longer if anticoagulated.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("DAMPED WAVEFORM — air bubble, kink, clot, hypotension; troubleshoot before disconnecting.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("INFECTION — site erythema, drainage; remove + culture tip.", citationIDs: ["cdc_pr_round21"]),
            AttributedBullet("ARTERIAL INJECTION — never inject medications via art line (rare but devastating tissue necrosis); label LARGE \"ARTERIAL\" + use dedicated tubing.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("FALSELY LOW BP — over-dampening (air, clot); square wave test fails (>3 oscillations or no return).", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("FALSELY HIGH BP — under-dampening (loose connections, long tubing); square wave test shows >3 oscillations.", citationIDs: ["specialty_pr_round21"])
        ],
        citations: [openrnPRR21, cdcPRR21, specialtyPRR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum SpontaneousBreathingTrialSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "spontaneous-breathing-trial",
        title: "Spontaneous breathing trial (SBT)",
        subtitle: "Daily readiness · PSV or T-piece 30-120 min · RSBI <105 · extubation criteria · cuff leak before extubation",
        nclexTags: procTagsR21,
        indications: AttributedProse(
            "Daily assessment of readiness to liberate from mechanical ventilation per primary source. Conducted on patients meeting criteria — improving underlying illness, adequate oxygenation, hemodynamic stability, neurologic status appropriate. Critical step in preventing prolonged unnecessary ventilation per primary source.",
            citationIDs: ["specialty_pr_round21"]
        ),
        contraindications: AttributedProse(
            "Failure of readiness criteria — FiO2 >50%, PEEP >8, hemodynamic instability (vasopressor escalation), active myocardial ischemia, increased ICP, recent surgery requiring continued sedation.",
            citationIDs: ["specialty_pr_round21"]
        ),
        equipment: [
            AttributedBullet("Mechanical ventilator — set to spontaneous mode (PSV) or T-piece configuration.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Capnography for end-tidal CO2 monitoring.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Bag-mask + suction + intubation supplies at bedside in case of failure.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Continuous SpO2 + ECG + arterial line BP.", citationIDs: ["openrn_pr_round21"])
        ],
        preProcedure: [
            AttributedBullet("Confirm SAT (spontaneous awakening trial) successfully done first — sedation reduction enables SBT.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("Verify readiness criteria — see above.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("Position semi-Fowler (head of bed 30-45°) to optimize diaphragm.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Baseline vital signs, RR, SpO2, tidal volume, comfort assessment.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Educate patient if alert.", citationIDs: ["openrn_pr_round21"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Change vent mode", body: "Switch to PSV 5-8 cmH2O + PEEP 5 cmH2O OR T-piece (no support). Per institutional protocol.", citationIDs: ["specialty_pr_round21"]),
            ProcedureStep(number: 2, title: "Trial duration", body: "Continue 30-120 minutes per protocol; most centers 30 minutes if first-trial successful per primary source.", citationIDs: ["specialty_pr_round21"]),
            ProcedureStep(number: 3, title: "Monitor closely", body: "RR, tidal volume, RSBI (RR/Vt in L), SpO2, BP, HR, mental status, work of breathing, comfort.", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 4, title: "Apply success criteria", body: "RR <30-35, SpO2 >90% on FiO2 <50%, BP within 20% baseline, HR <140, no severe agitation / accessory use, no diaphoresis. RSBI <105 = strong predictor of success per primary source.", citationIDs: ["specialty_pr_round21"]),
            ProcedureStep(number: 5, title: "Cuff leak test", body: "Before extubation in long-term intubation / known difficult airway / pediatric — release cuff, measure expired volume; leak >130 mL or 12% suggests airway patent. No leak = consider steroids 24h before extubation.", citationIDs: ["specialty_pr_round21"]),
            ProcedureStep(number: 6, title: "Decision", body: "If passing — proceed to extubation OR continue spontaneous mode per provider. If failing — return to assist mode + rest + repeat in 24 hrs after addressing cause.", citationIDs: ["specialty_pr_round21"])
        ],
        postProcedure: [
            AttributedBullet("Document SBT outcome, parameters, decision.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("If extubated — high-flow nasal cannula or NIV transition; close monitoring × 24-48 hrs.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("If failed — assess cause (work of breathing, cardiac, weakness, anxiety), address before next attempt.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("Continued failure → consider tracheostomy after 14 days per primary source.", citationIDs: ["specialty_pr_round21"])
        ],
        documentation: [
            AttributedBullet("Pre-SBT readiness criteria, SBT parameters + duration, response, decision.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Reasons for failure if applicable + plan for next attempt.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("Cuff leak result + steroid plan if minimal leak.", citationIDs: ["specialty_pr_round21"])
        ],
        watchFor: [
            AttributedBullet("RAPID DECOMPENSATION — return to vent + assess; common in marginal patients.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("POST-EXTUBATION STRIDOR — laryngeal edema; racemic epinephrine + steroids + reintubation if severe.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("REINTUBATION — within 48 hrs of extubation; associated with significantly higher mortality.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("DELIRIUM / AGITATION at sedation lift — common; address before SBT vs proceed cautiously.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("DIAPHRAGM DYSFUNCTION — prolonged failure; PT/OT + nutrition support; potential ICUAW.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("ANXIETY component — coordinate with non-pharm + minimum sedation; family presence helpful.", citationIDs: ["specialty_pr_round21"])
        ],
        citations: [openrnPRR21, cdcPRR21, specialtyPRR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ETTCuffSample {
    public static let entry: ProcedureEntry = ProcedureEntry(
        id: "ett-cuff-management",
        title: "ETT cuff pressure management",
        subtitle: "20-30 cmH2O target · q4-8h cuff manometer check · prevent VAP + tracheal injury · routine bundle",
        nclexTags: procTagsR21,
        indications: AttributedProse(
            "Maintenance of appropriate endotracheal tube cuff pressure — balances seal (preventing micro-aspiration of subglottic secretions and ventilator-associated pneumonia) against ischemic mucosal injury. VAP prevention bundle component per primary source.",
            citationIDs: ["specialty_pr_round21"]
        ),
        contraindications: AttributedProse(
            "No absolute contraindications. Caution — recent tracheal surgery, severe tracheal injury, very small pediatric uncuffed ETT.",
            citationIDs: ["specialty_pr_round21"]
        ),
        equipment: [
            AttributedBullet("Cuff manometer — analog or digital; calibrated per facility.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Sterile gloves, mask (during oral / airway care).", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Subglottic suction (EVAC) ETT preferred for prolonged ventilation per VAP bundle.", citationIDs: ["specialty_pr_round21"])
        ],
        preProcedure: [
            AttributedBullet("Hand hygiene; don gloves + mask.", citationIDs: ["cdc_pr_round21"]),
            AttributedBullet("Verify ETT depth + position (cm at lip / teeth match documented).", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Assess for air leak — auscultation, ventilator volume curve.", citationIDs: ["openrn_pr_round21"])
        ],
        steps: [
            ProcedureStep(number: 1, title: "Attach manometer", body: "Connect cuff manometer to pilot balloon valve. Read pressure.", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 2, title: "Read pressure", body: "Target 20-30 cmH2O (NOT mmHg). Below 20 = high VAP / aspiration risk; above 30 = tracheal mucosal ischemia.", citationIDs: ["specialty_pr_round21"]),
            ProcedureStep(number: 3, title: "Adjust", body: "If <20: add air via manometer; if >30: release small volume. Re-measure.", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 4, title: "Document", body: "Pre-adjustment + post-adjustment pressures + time.", citationIDs: ["openrn_pr_round21"]),
            ProcedureStep(number: 5, title: "Frequency", body: "Q4-8h per facility; immediately post-positioning change or suspected leak.", citationIDs: ["specialty_pr_round21"]),
            ProcedureStep(number: 6, title: "Continuous monitoring (selected)", body: "Continuous cuff pressure monitors available; useful in extended ventilation + high VAP risk.", citationIDs: ["specialty_pr_round21"])
        ],
        postProcedure: [
            AttributedBullet("Hand hygiene; document.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Assess for air leak audible or on ventilator.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Subglottic suction continuous (or q1-2h) per VAP bundle.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("HOB 30-45° unless contraindicated — aspiration prevention.", citationIDs: ["specialty_pr_round21"])
        ],
        documentation: [
            AttributedBullet("Time, cuff pressure pre + post adjustment, volume added / removed, ETT depth.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("Subglottic suction volume + color; document with cuff check.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("VAP bundle compliance — daily.", citationIDs: ["cdc_pr_round21"])
        ],
        watchFor: [
            AttributedBullet("PERSISTENT LOW PRESSURE despite re-inflation — pilot balloon failure / cuff leak → notify provider for tube exchange.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("TRACHEAL STENOSIS — long-term complication; symptoms post-extubation (stridor, dyspnea); ENT eval.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("TRACHEOESOPHAGEAL FISTULA — rare but serious; ETT cuff over-inflation chronic; persistent air leak + reflux of secretions.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("INADVERTENT EXTUBATION — confirm depth daily; secure ETT.", citationIDs: ["openrn_pr_round21"]),
            AttributedBullet("CUFF HERNIATION over Murphy eye — partial airway obstruction; rare; emergent recheck.", citationIDs: ["specialty_pr_round21"]),
            AttributedBullet("AUTO-DEFLATION over time — slow leak; periodic re-measurement essential.", citationIDs: ["openrn_pr_round21"])
        ],
        citations: [openrnPRR21, cdcPRR21, specialtyPRR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ShockClassificationSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "shock-classification",
        title: "Shock classification + initial resuscitation",
        subtitle: "4 shock types · early recognition · fluid + vasopressor + source control · MAP ≥65 · lactate clearance",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR21,
        sections: [
            .prose(title: "Definition + recognition", AttributedProse(
                "Shock = life-threatening circulatory failure with inadequate oxygen delivery to tissues. Recognized by clinical signs (hypotension, oliguria, AMS, cool / mottled skin, elevated lactate, capillary refill >3 sec) NOT just BP per primary source. Early recognition + intervention determine outcome.",
                citationIDs: ["specialty_pr_round21"]
            )),
            .keyValueTable(title: "Four shock categories", [
                KeyValueRow(key: "HYPOVOLEMIC", value: "Volume loss — hemorrhagic, GI loss, third-spacing, burns, dehydration. Treatment: STOP THE BLEED + volume resuscitation"),
                KeyValueRow(key: "CARDIOGENIC", value: "Pump failure — MI, severe HF, arrhythmia, valvular. Treatment: revascularization + inotropes + cautious volume"),
                KeyValueRow(key: "OBSTRUCTIVE", value: "Mechanical obstruction — tamponade, tension pneumo, massive PE, AS. Treatment: RELIEVE the obstruction"),
                KeyValueRow(key: "DISTRIBUTIVE", value: "Vasoplegia — septic, neurogenic, anaphylactic. Treatment: source control + vasopressors + volume")
            ]),
            .keyValueTable(title: "Distinguishing features", [
                KeyValueRow(key: "Hypovolemic", value: "Cold extremities, FLAT neck veins, narrow pulse pressure, oliguria, tachycardia"),
                KeyValueRow(key: "Cardiogenic", value: "Cold extremities, FULL neck veins, pulmonary edema, S3, oliguria"),
                KeyValueRow(key: "Obstructive (tamponade / PE / pneumo)", value: "FULL neck veins, hypotension, signs of underlying cause (Beck's triad, RV strain, tension features)"),
                KeyValueRow(key: "Distributive (septic)", value: "WARM extremities early → cold late, flushed → mottled, bounding → weak pulses, fever, leukocytosis")
            ]),
            .bullets(title: "Initial assessment + workup", [
                AttributedBullet("ABC + vital signs + IV access (2 large-bore) + monitor placement.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Labs — ABG / VBG (lactate), CBC, CMP, coag, type + crossmatch, troponin, BNP, lipase, beta-hCG, cultures.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Imaging — CXR, bedside US (RUSH protocol — heart, IVC, lungs, abdomen, vascular).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Identify category EARLY — guides therapy.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Hemodynamic targets", [
                AttributedBullet("MAP ≥65 mmHg (higher if chronic HTN — individualized).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Urine output ≥0.5 mL/kg/hr — marker of tissue perfusion.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Lactate clearance > raw value; downward trend = improving perfusion.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Capillary refill <3 sec; improving mental status; warm extremities returning.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("ScvO2 65-75% (one data point, not sole target).", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Fluid resuscitation principles", [
                AttributedBullet("30 mL/kg balanced crystalloid (LR / plasmalyte) for distributive / hypovolemic per SSC 2021.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("BALANCED solutions preferred over normal saline — less hyperchloremic acidosis.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Reassess after EACH bolus — fluid-responsive vs fluid-overloaded.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Passive leg raise / pulse pressure variation / IVC ultrasound — fluid responsiveness tests.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("AVOID over-resuscitation — pulmonary edema, abdominal compartment syndrome.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Cardiogenic + obstructive — CAUTIOUS fluid; vasopressors / source treatment earlier.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Vasopressor selection by shock type", [
                AttributedBullet("SEPTIC — norepi first; vasopressin 0.03 units/min second; epi third.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("CARDIOGENIC — norepi for BP support; dobutamine / milrinone for inotropic support.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("NEUROGENIC — norepi (need β1 + α); atropine for bradycardia.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("ANAPHYLACTIC — epinephrine first (IM thigh 0.3-0.5 mg, repeat q5-15 min; drip if refractory).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("RV FAILURE — norepi + dobutamine / milrinone; avoid hypoxia / hypercapnia / acidosis (worsen PVR).", citationIDs: ["specialty_pr_round21"])
            ])
        ],
        citations: [openrnPRR21, cdcPRR21, specialtyPRR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum ABCDEFBundleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "abcdef-bundle",
        title: "ABCDEF (ICU Liberation) bundle",
        subtitle: "PADIS 2018 · Assess pain · Both SAT/SBT · Choice of sedation · Delirium · Early mobility · Family engagement",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR21,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Evidence-based ICU care bundle (SCCM ICU Liberation) — coordinated implementation reduces delirium, ventilator days, mortality, ICU + hospital LOS, ICUAW, post-ICU syndrome. Endorsed by SCCM PADIS guidelines per primary source.",
                citationIDs: ["specialty_pr_round21"]
            )),
            .keyValueTable(title: "Six bundle elements", [
                KeyValueRow(key: "A — Assess + manage Pain", value: "Validated tool (NRS / CPOT / BPS); treat first; pain often presents as agitation"),
                KeyValueRow(key: "B — Both SAT + SBT", value: "Daily Spontaneous Awakening Trial (sedation off) PAIRED with Spontaneous Breathing Trial"),
                KeyValueRow(key: "C — Choice of analgesia + sedation", value: "Fentanyl + propofol / dexmedetomidine preferred; AVOID benzodiazepines"),
                KeyValueRow(key: "D — Delirium assess + manage", value: "CAM-ICU q shift; non-pharm first; antipsychotics only for severe agitation"),
                KeyValueRow(key: "E — Early mobility + exercise", value: "Within 24-48 hrs of admission; even ventilated patients; PT/OT consult"),
                KeyValueRow(key: "F — Family engagement + empowerment", value: "Open visitation, family meetings, included in rounds + decision-making")
            ]),
            .bullets(title: "Element A — Pain assessment + management", [
                AttributedBullet("Validated tool — Numeric Rating Scale (NRS) if communicative; CPOT or BPS if non-communicative.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Treat pain FIRST — many \"agitated\" patients are in pain.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Multimodal — opioid (fentanyl) + acetaminophen scheduled + regional anesthesia + non-pharm.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Target — adequate pain control without excessive sedation.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Element B — SAT + SBT (paired daily)", [
                AttributedBullet("SAT first — interrupt sedation; assess for awakening criteria; if pass, proceed to SBT.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("SBT — see SBT procedure entry.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Pairing SAT + SBT reduces ventilator days by ~3 days on average per primary source.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Contraindications to SAT — active seizures, alcohol withdrawal, neuromuscular blockade, increased ICP.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Element C — Sedation choice", [
                AttributedBullet("PROPOFOL or DEXMEDETOMIDINE preferred over benzodiazepines (less delirium per primary source).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Lightest sedation possible to maintain comfort + safety — target RASS 0 to -2.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Continuous infusions over bolus; avoid \"benzodiazepine stacking\".", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Alcohol / benzo withdrawal — different protocol; benzos appropriate.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Element D — Delirium", [
                AttributedBullet("CAM-ICU q shift + PRN; document.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Non-pharmacologic first — orientation, family presence, glasses / hearing aids, sleep hygiene, early mobility.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Address reversible causes — hypoxia, pain, withdrawal, sepsis, medications, electrolytes.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Antipsychotics (quetiapine, olanzapine, haloperidol) — REACTIVE for severe agitation only; not prophylactic per primary source.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Element E — Early mobility", [
                AttributedBullet("Begin within 24-48 hrs of ICU admission — even ventilated, vasopressor-dependent.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Progressive — passive ROM → active ROM → sitting up → dangling → standing → walking.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("PT/OT collaboration — ICU-trained therapists; bedside ventilator-compatible equipment.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Reduces ICUAW, delirium duration, ventilator days, hospital LOS, post-ICU syndrome.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Element F — Family engagement", [
                AttributedBullet("Open / flexible visitation per evidence — does not increase infection / disturbance.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Family meetings within 72 hrs of admission + as conditions change.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Include in rounds + decisions per patient preference; cultural sensitivity.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("ICU diary maintained by family + staff — reduces PTSD post-ICU.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Post-ICU clinic / follow-up — assess + manage PICS (Post-ICU Syndrome).", citationIDs: ["specialty_pr_round21"])
            ])
        ],
        citations: [openrnPRR21, cdcPRR21, specialtyPRR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum VasopressorSelectionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "vasopressor-selection",
        title: "Vasopressor + inotrope selection",
        subtitle: "Match agent to shock physiology · MAP ≥65 · perfusion not just BP · escalation + de-escalation",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR21,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Vasoactive drug selection depends on shock physiology — distributive (vasoplegia) needs vasoconstrictors, cardiogenic needs inotrope ± vasopressor, obstructive often needs both while addressing cause. Target MAP ≥65 (or higher per individual baseline) + perfusion improvement per primary source.",
                citationIDs: ["specialty_pr_round21"]
            )),
            .keyValueTable(title: "Catecholamine receptor profiles", [
                KeyValueRow(key: "Norepinephrine", value: "Strong α1 (vasoconstriction) + modest β1 (inotropy) — IDEAL for vasoplegia + mild inotropic support"),
                KeyValueRow(key: "Epinephrine", value: "Dose-dependent — low β1/β2 (inotropy + bronchodilation); high α1; useful refractory shock + post-arrest"),
                KeyValueRow(key: "Phenylephrine", value: "Pure α1 (vasoconstriction only); useful for tachyarrhythmia-prone patients + AS / HCM"),
                KeyValueRow(key: "Dopamine", value: "Dose-dependent — low D1 (renal, now disproven); mid β1 (inotropy); high α1; high arrhythmia rate"),
                KeyValueRow(key: "Vasopressin", value: "V1 (catecholamine-independent vasoconstriction); fixed dose adjunct; no inotropy"),
                KeyValueRow(key: "Dobutamine", value: "β1 (inotropy) + mild β2 (vasodilation); inotrope, NOT vasopressor; pair with norepi"),
                KeyValueRow(key: "Milrinone", value: "PDE-3 inhibitor; inotrope + arterial / pulmonary vasodilator; useful in RV failure + chronic β-blocker patients")
            ]),
            .keyValueTable(title: "Shock-state-specific selection", [
                KeyValueRow(key: "Septic shock", value: "1st: Norepi · 2nd: Vasopressin (fixed 0.03 units/min) · 3rd: Epinephrine · Add hydrocortisone for refractory · per SSC 2021"),
                KeyValueRow(key: "Cardiogenic shock", value: "Norepi for BP + dobutamine OR milrinone for inotropy; consider mechanical support (IABP, Impella, ECMO)"),
                KeyValueRow(key: "Neurogenic shock", value: "Norepi (best for combined α + β1); MAP target 85-90; atropine PRN for bradycardia"),
                KeyValueRow(key: "Anaphylactic shock", value: "Epinephrine 0.3-0.5 mg IM thigh repeat q5-15 min; epi infusion if refractory"),
                KeyValueRow(key: "Right ventricular failure", value: "Norepi + dobutamine OR milrinone; avoid hypoxia / hypercapnia / acidosis (raise PVR); inhaled NO selective pulmonary vasodilator"),
                KeyValueRow(key: "Distributive (other)", value: "Norepi first-line; consider methylene blue 1.5-2 mg/kg IV for vasoplegia post-CPB / anaphylaxis refractory")
            ]),
            .bullets(title: "Initiation + titration principles", [
                AttributedBullet("FLUID FIRST when appropriate — 30 mL/kg crystalloid for distributive / hypovolemic; cautious in cardiogenic / obstructive.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Start vasopressor when fluid alone inadequate to maintain MAP ≥65.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("CENTRAL LINE preferred — peripheral acceptable short-term per recent evidence (PIVOT trial).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("ARTERIAL LINE for accurate BP monitoring + ABG / lactate sampling.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Titrate every 5 min to target MAP; reassess perfusion (mental status, urine output, lactate, capillary refill).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Add second agent when first reaches moderate-high dose — not waiting for maximum dose.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Escalation strategy (refractory shock)", [
                AttributedBullet("Escalate norepi to ~0.5 mcg/kg/min → add vasopressin 0.03 units/min.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Persistent refractory → add epinephrine (especially RV / mixed shock).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Add hydrocortisone 200 mg/day IV — vasopressor-refractory septic shock per primary source.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Consider angiotensin II (Giapreza) — for catecholamine-refractory distributive shock.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Consider methylene blue 1-2 mg/kg IV — vasoplegia (e.g., post-CPB, anaphylaxis).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Reconsider diagnosis — undiagnosed bleeding, ongoing infection source, adrenal insufficiency, anaphylactic component.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "De-escalation", [
                AttributedBullet("Wean in reverse order — typically epi → vasopressin → norepi as patient improves.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Wean slowly; avoid abrupt vasopressin discontinuation (rebound hypotension).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Reassess fluid balance + perfusion trends — over-resuscitation worsens outcomes.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("De-escalate hydrocortisone over 24-48 hrs as vasopressors weaning.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Extravasation management (any vasopressor)", [
                AttributedBullet("STOP infusion immediately; DO NOT flush line; aspirate any residual via cannula then remove.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("PHENTOLAMINE 5-10 mg in 10 mL NS — infiltrate SQ around extravasation; antidote for α-agonist tissue ischemia.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Restart through new IV site (central preferred).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Plastic surgery consult for large extravasation; serial assessment.", citationIDs: ["specialty_pr_round21"])
            ])
        ],
        citations: [openrnPRR21, cdcPRR21, specialtyPRR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}

public enum TTMProtocolSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "targeted-temperature-management",
        title: "Targeted temperature management (TTM) post-arrest",
        subtitle: "32-36°C × 24 hrs · cool then maintain · avoid rebound hyperthermia · neuroprognostication delayed",
        eyebrow: "REFERENCE · CRITICAL CARE",
        nclexTags: refTagsR21,
        sections: [
            .prose(title: "Overview", AttributedProse(
                "Active temperature control in comatose patients post-ROSC after cardiac arrest. Target 32-36°C maintained 24 hrs per AHA 2020 (single best target debated by TTM2 trial — 33 vs 37.5 with avoidance of fever similar outcomes in select patients). Reduces brain injury from reperfusion + neuroinflammation per primary source.",
                citationIDs: ["specialty_pr_round21"]
            )),
            .keyValueTable(title: "Phases of TTM", [
                KeyValueRow(key: "1 — Induction", value: "Achieve target 32-36°C as soon as possible after ROSC; intravascular catheter or surface cooling; cold IV fluids 30 mL/kg 4°C NS / LR"),
                KeyValueRow(key: "2 — Maintenance", value: "24 hours at target ±0.5°C; controlled temperature management device essential"),
                KeyValueRow(key: "3 — Rewarming", value: "Slow controlled rewarming 0.25-0.5°C/hr over 12-24 hrs to 36-37°C"),
                KeyValueRow(key: "4 — Normothermia", value: "Maintain ≤37.5°C for 72 hrs after rewarming — fever worsens outcomes")
            ]),
            .bullets(title: "Patient selection", [
                AttributedBullet("Comatose post-ROSC (no purposeful response to verbal commands).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("All rhythms (shockable + non-shockable) — though strongest evidence in VF / VT.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Both out-of-hospital + in-hospital arrests.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Exclusions — pregnancy, active hemorrhage, terminal illness, severe coagulopathy, refractory hemodynamic instability.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Cooling methods", [
                AttributedBullet("Intravascular cooling catheters (Coolgard, Thermogard) — most precise; femoral / IJ.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Surface cooling devices (Arctic Sun) — less invasive; equally effective.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Cold IV fluids 30 mL/kg 4°C NS / LR — induction adjunct; not alone.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Ice packs to groins / axillae / neck — adjunctive only.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Cooled CRRT circuit — adjunctive in AKI patients.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Hemodynamic + medication adjustments", [
                AttributedBullet("Bradycardia common (HR 40-60) — usually no treatment needed unless hypotensive.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Diuresis common — replace volume + electrolytes; expect ↑ urine output.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("ELECTROLYTE shifts — K+, Mg, phos drop during cooling; rise during rewarming — anticipate.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("INSULIN resistance — hyperglycemia common; target 140-180.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Drug metabolism SLOWED — propofol + midazolam levels build up; reduce doses.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("SHIVERING — increases metabolic demand + raises temp; sedation (propofol, dexmedetomidine), meperidine, magnesium, surface counter-warming face.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Buspirone + magnesium + dexmedetomidine — combined anti-shivering regimen.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("NMBA for refractory shivering — short-term only; not routine.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Monitoring during TTM", [
                AttributedBullet("Continuous core temp — bladder, esophageal, or rectal probe (NOT oral / axillary).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("ECG monitoring — QT prolongation common; avoid QT-prolonging meds.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("ABP + ICP if available.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Frequent labs — ABG, electrolytes, glucose, lactate.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("EEG continuous — seizure surveillance; myoclonic status epilepticus poor prognosis.", citationIDs: ["specialty_pr_round21"])
            ]),
            .bullets(title: "Neuroprognostication AFTER TTM", [
                AttributedBullet("WAIT ≥72 hrs AFTER rewarming + off sedation — earlier prognostication unreliable per primary source.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("MULTIMODAL — clinical exam (absent pupillary + corneal reflexes), EEG (burst-suppression, status), MRI (diffuse cortical injury), SSEPs (bilateral absent N20), NSE (>60 ng/mL).", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("NO single test sufficient — multiple modalities concordant + clinical context.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("Family meetings ongoing; defer prognostic statements; integrate palliative care.", citationIDs: ["specialty_pr_round21"]),
                AttributedBullet("MYOCLONIC STATUS EPILEPTICUS — historically poor prognosis but not absolute; treat + reassess.", citationIDs: ["specialty_pr_round21"])
            ])
        ],
        citations: [openrnPRR21, cdcPRR21, specialtyPRR21],
        lastSourceFidelityReview: "2026-05-12"
    )
}
