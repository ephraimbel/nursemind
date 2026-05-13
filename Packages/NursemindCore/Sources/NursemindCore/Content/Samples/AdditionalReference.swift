import Foundation

private let openrnFundamentals = CitationSource(
    id: "openrn_fundamentals",
    shortName: "Open RN Nursing Fundamentals",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://www.ncbi.nlm.nih.gov/books/NBK615342/",
    lastRetrieved: "2026-05-03"
)
private let aha = CitationSource(
    id: "aha_acls",
    shortName: "AHA ACLS / BLS — Code Blue procedures (paraphrased)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://cpr.heart.org/",
    lastRetrieved: "2026-05-03"
)
private let ahrq = CitationSource(
    id: "ahrq_teamstepps",
    shortName: "AHRQ TeamSTEPPS",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-05-03"
)

// MARK: - Pain Scales

public enum PainScalesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pain-scales",
        title: "Pain assessment scales",
        subtitle: "Choose the right scale for the patient",
        eyebrow: "REFERENCE · ASSESSMENT",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .prose(title: "Why scale choice matters", AttributedProse("Pain is what the patient says it is. The right scale depends on the patient's age, cognitive status, and ability to communicate. The wrong scale produces meaningless numbers.", citationIDs: ["openrn_fundamentals"])),
            .keyValueTable(title: "Scale by patient", [
                KeyValueRow(key: "Adult, alert, able to communicate", value: "Numeric Rating Scale (NRS) 0–10"),
                KeyValueRow(key: "Pediatric (3–8 years) or limited language", value: "Wong-Baker FACES Scale"),
                KeyValueRow(key: "Nonverbal adult (intubated, post-stroke)", value: "Critical-Care Pain Observation Tool (CPOT) or Behavioral Pain Scale (BPS)"),
                KeyValueRow(key: "Pediatric (2 months–7 years)", value: "FLACC Behavioral Scale"),
                KeyValueRow(key: "Older adult with dementia", value: "PAINAD (Pain in Advanced Dementia)")
            ]),
            .bullets(title: "NRS — Numeric Rating Scale", [
                AttributedBullet("Ask: 'On a scale of 0 to 10, with 0 being no pain and 10 being the worst pain you can imagine, what's your pain right now?'", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("0 = no pain · 1–3 = mild · 4–6 = moderate · 7–10 = severe.", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Reassess at peak effect of intervention (e.g., 30 min after IV opioid, 60 min after PO).", citationIDs: ["openrn_fundamentals"])
            ]),
            .bullets(title: "FLACC — Face, Legs, Activity, Cry, Consolability (peds)", [
                AttributedBullet("Face: 0 (relaxed) → 2 (grimace, clenched jaw)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Legs: 0 (relaxed) → 2 (kicking, drawn up)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Activity: 0 (lying quietly) → 2 (arched, jerking)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Cry: 0 (no cry) → 2 (steady cry, screams)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Consolability: 0 (content) → 2 (difficult to console)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Total 0–10; same severity bands as NRS.", citationIDs: ["openrn_fundamentals"])
            ]),
            .bullets(title: "CPOT — Critical-Care Pain Observation Tool (nonverbal adult)", [
                AttributedBullet("Facial expression (0–2)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Body movements (0–2)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Muscle tension on passive flexion (0–2)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Compliance with ventilator (intubated) OR vocalization (extubated) (0–2)", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Total 0–8; >2 indicates significant pain — treat.", citationIDs: ["openrn_fundamentals"])
            ]),
            .prose(title: "Documentation pearls", AttributedProse("Always document the scale used (NRS, FLACC, CPOT). Document scale + score + intervention + reassessment score with peak-effect timing. Patient's self-report is the gold standard when possible.", citationIDs: ["openrn_fundamentals"]))
        ],
        citations: [openrnFundamentals],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Vital Signs by Age

public enum VitalSignsByAgeSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "vital-signs-age",
        title: "Vital signs by age",
        subtitle: "Normal ranges for HR, RR, BP from neonate to adult",
        eyebrow: "REFERENCE · VITALS",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Why this matters", AttributedProse("Adult vital sign norms do not apply to children. A heart rate of 130 is tachycardic for an adult but normal for an infant. Always benchmark against the age-appropriate range.", citationIDs: ["openrn_fundamentals"])),
            .keyValueTable(title: "Heart rate (awake, beats/min)", [
                KeyValueRow(key: "Newborn (0–28 days)", value: "100–205"),
                KeyValueRow(key: "Infant (1–12 months)", value: "100–180"),
                KeyValueRow(key: "Toddler (1–3 yr)", value: "98–140"),
                KeyValueRow(key: "Preschool (3–5 yr)", value: "80–120"),
                KeyValueRow(key: "School age (5–12 yr)", value: "75–118"),
                KeyValueRow(key: "Adolescent (12–18 yr)", value: "60–100"),
                KeyValueRow(key: "Adult", value: "60–100")
            ]),
            .keyValueTable(title: "Respiratory rate (breaths/min)", [
                KeyValueRow(key: "Newborn", value: "30–60"),
                KeyValueRow(key: "Infant", value: "30–53"),
                KeyValueRow(key: "Toddler", value: "22–37"),
                KeyValueRow(key: "Preschool", value: "20–28"),
                KeyValueRow(key: "School age", value: "18–25"),
                KeyValueRow(key: "Adolescent", value: "12–20"),
                KeyValueRow(key: "Adult", value: "12–20")
            ]),
            .keyValueTable(title: "Systolic BP (mmHg)", [
                KeyValueRow(key: "Newborn", value: "67–84"),
                KeyValueRow(key: "Infant", value: "72–104"),
                KeyValueRow(key: "Toddler", value: "86–106"),
                KeyValueRow(key: "Preschool", value: "89–112"),
                KeyValueRow(key: "School age", value: "97–120"),
                KeyValueRow(key: "Adolescent", value: "110–131"),
                KeyValueRow(key: "Adult", value: "<120 normal; <130/<80 desirable")
            ]),
            .bullets(title: "Pediatric BP — quick formulas", [
                AttributedBullet("Estimate minimum SBP for child >1 year: 70 + (2 × age in years).", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("BP cuffs sized for child — too small reads falsely high; too large reads falsely low.", citationIDs: ["openrn_fundamentals"])
            ]),
            .bullets(title: "Adult vital sign red flags", [
                AttributedBullet("HR <50 or >120 (in absence of clear cause).", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("RR <10 or >24.", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("SBP <90 or >180; MAP <65.", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("SpO2 <92% on room air (or below patient's baseline).", citationIDs: ["openrn_fundamentals"]),
                AttributedBullet("Temp <36°C (96.8°F) or >38.3°C (100.9°F).", citationIDs: ["openrn_fundamentals"])
            ])
        ],
        citations: [openrnFundamentals],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - Code Blue Roles

public enum CodeBlueRolesSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "code-blue-roles",
        title: "Code blue roles and choreography",
        subtitle: "Who does what during cardiac arrest resuscitation",
        eyebrow: "REFERENCE · EMERGENCY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Why role clarity matters", AttributedProse("In a code, ambiguity kills. Every team should pre-assign or quickly assign roles when entering the room — chaos costs perfusion time. Closed-loop communication and the AHA chain of survival are the structure.", citationIDs: ["aha_acls", "ahrq_teamstepps"])),
            .bullets(title: "Code Team Leader (typically physician or designated)", [
                AttributedBullet("Stands at foot of bed; views the entire scene.", citationIDs: ["aha_acls"]),
                AttributedBullet("Calls the rhythm checks at every 2-minute interval.", citationIDs: ["aha_acls"]),
                AttributedBullet("Orders medications — uses closed-loop ('Give 1 mg epinephrine IV').", citationIDs: ["aha_acls"]),
                AttributedBullet("Decides interventions — defibrillation, intubation, terminating efforts.", citationIDs: ["aha_acls"])
            ]),
            .bullets(title: "Compressor (often the first responder)", [
                AttributedBullet("Performs high-quality CPR — 100–120 per minute, 2-inch depth, full recoil, minimize interruptions.", citationIDs: ["aha_acls"]),
                AttributedBullet("Switches every 2 minutes to maintain quality (rotate during rhythm check).", citationIDs: ["aha_acls"])
            ]),
            .bullets(title: "Airway / breathing", [
                AttributedBullet("Bag-valve-mask 1 breath every 6 seconds (10/min) once intubated; 30:2 if unprotected airway.", citationIDs: ["aha_acls"]),
                AttributedBullet("Capnography to assess CPR quality (target ETCO₂ ≥10 mmHg).", citationIDs: ["aha_acls"]),
                AttributedBullet("Suction available; advanced airway placement when feasible.", citationIDs: ["aha_acls"])
            ]),
            .bullets(title: "Medication / IV access", [
                AttributedBullet("Establish IV or IO access if not already.", citationIDs: ["aha_acls"]),
                AttributedBullet("Prepare and administer drugs as ordered — with closed-loop confirmation ('1 mg epinephrine going in now').", citationIDs: ["aha_acls"]),
                AttributedBullet("Standard ACLS drugs: epinephrine 1 mg every 3–5 min; amiodarone 300 mg then 150 mg for shock-refractory VF/VT.", citationIDs: ["aha_acls"])
            ]),
            .bullets(title: "Recorder / time keeper", [
                AttributedBullet("Documents every event, time, intervention, vital sign, and drug administered.", citationIDs: ["aha_acls"]),
                AttributedBullet("Calls out 2-minute intervals for rhythm/pulse checks and CPR rotation.", citationIDs: ["aha_acls"]),
                AttributedBullet("Tracks medication doses for administration timing.", citationIDs: ["aha_acls"])
            ]),
            .bullets(title: "Defibrillator / monitor", [
                AttributedBullet("Pads on patient ASAP; monitor on screen.", citationIDs: ["aha_acls"]),
                AttributedBullet("Charge to ordered energy; verbalize 'Charged' and 'All clear' before discharge.", citationIDs: ["aha_acls"]),
                AttributedBullet("Use shockable algorithm for VF/pulseless VT only.", citationIDs: ["aha_acls"])
            ]),
            .bullets(title: "Family liaison / runner", [
                AttributedBullet("Communicates with family — keeps them informed, supported.", citationIDs: ["aha_acls"]),
                AttributedBullet("Retrieves additional supplies (medications, equipment) as needed.", citationIDs: ["aha_acls"])
            ]),
            .prose(title: "Closed-loop communication", AttributedProse("Speaker: 'Sarah, give 1 mg of epinephrine now.' Receiver: 'Giving 1 mg of epinephrine.' After: 'Epinephrine 1 mg given at 14:32.' This pattern is non-optional in codes.", citationIDs: ["ahrq_teamstepps"]))
        ],
        citations: [openrnFundamentals, aha, ahrq],
        lastSourceFidelityReview: "2026-05-03"
    )
}

// MARK: - I-PASS Handoff

public enum IPASSHandoffSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ipass",
        title: "I-PASS handoff",
        subtitle: "Standardized end-of-shift / transfer-of-care framework",
        eyebrow: "COMMUNICATION · HANDOFF",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare),
        sections: [
            .prose(title: "What it is", AttributedProse("I-PASS is a standardized handoff framework developed and validated to reduce communication-related medical errors. It supplements (not replaces) bedside report and works for shift change, unit transfer, and provider sign-out.", citationIDs: ["ahrq_teamstepps"])),
            .keyValueTable(title: "I-PASS components", [
                KeyValueRow(key: "I — Illness severity", value: "Stable · Watcher · Unstable"),
                KeyValueRow(key: "P — Patient summary", value: "Brief HPI, current status, plan"),
                KeyValueRow(key: "A — Action list", value: "What needs to be done, who, by when"),
                KeyValueRow(key: "S — Situation awareness / contingency", value: "What might happen, what to do if"),
                KeyValueRow(key: "S — Synthesis by receiver", value: "Read-back: receiver summarizes, asks questions")
            ]),
            .bullets(title: "Illness severity examples", [
                AttributedBullet("Stable: vitals stable, plan clear, no anticipated changes.", citationIDs: ["ahrq_teamstepps"]),
                AttributedBullet("Watcher: at risk for decline (e.g., new sepsis, elevated lactate, pending labs).", citationIDs: ["ahrq_teamstepps"]),
                AttributedBullet("Unstable: requires immediate ongoing intervention.", citationIDs: ["ahrq_teamstepps"])
            ]),
            .bullets(title: "Action list — concrete, time-anchored", [
                AttributedBullet("'Give 8 PM antibiotics' — not 'finish antibiotics.'", citationIDs: ["ahrq_teamstepps"]),
                AttributedBullet("'Recheck lactate at 22:00' — with explicit time and what triggers escalation.", citationIDs: ["ahrq_teamstepps"]),
                AttributedBullet("'Call provider if SBP <90 × 2' — explicit threshold.", citationIDs: ["ahrq_teamstepps"])
            ]),
            .bullets(title: "Situation awareness — anticipate", [
                AttributedBullet("'Lactate may climb if she's not responding to fluids; have norepinephrine ready.'", citationIDs: ["ahrq_teamstepps"]),
                AttributedBullet("'Daughter visiting at 19:00 — anxious about code status conversation.'", citationIDs: ["ahrq_teamstepps"]),
                AttributedBullet("'Foley pulled at noon — if no urine by 18:00, scan and recath.'", citationIDs: ["ahrq_teamstepps"])
            ]),
            .prose(title: "Read-back", AttributedProse("After the giver finishes, the receiver synthesizes back: 'So Mr. [name] is a watcher with sepsis on day 2 of antibiotics; lactate is trending down but I'll recheck at 22:00 and call if it's still elevated. I'll also watch his urine output overnight.' Read-back catches misunderstandings before they cause harm.", citationIDs: ["ahrq_teamstepps"]))
        ],
        citations: [openrnFundamentals, ahrq],
        lastSourceFidelityReview: "2026-05-03"
    )
}
