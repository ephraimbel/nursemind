import Foundation

// Curator-model scenarios — AHRQ TeamSTEPPS / PSNet patient-safety case format.
// Batch 5 balances the specialties the scenario library underweights: peds ×2
// (respiratory distress, neonatal fever), OB ×1 (magnesium toxicity), oncology
// ×1 (neutropenic fever), renal ×1 (dialysis-day errors), neuro ×2 (seizure
// response, anticoagulated head injury), ortho ×1 (compartment syndrome),
// airway ×1 (tracheostomy emergency), behavioral safety ×1 (restraints).
// Selection rule: each is a recurring, literature-documented failure mode not
// covered by batches 1–4, teachable as a pattern. All citations license-
// correct (AHRQ public domain, CDC public domain, NINDS public domain, Open RN
// CC BY 4.0). Tier-A RN review pending pre-publication for the emergency-
// response scenarios (trach, magnesium toxicity, neonatal fever, seizure).

private let ahrqPSNet5 = CitationSource(
    id: "ahrq_psnet_5",
    shortName: "AHRQ Patient Safety Network — Cases & Commentaries",
    detail: "AHRQ peer-reviewed patient-safety case repository",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://psnet.ahrq.gov/",
    lastRetrieved: "2026-07-03"
)

private let ahrqTeamSTEPPS5 = CitationSource(
    id: "ahrq_teamstepps_scenarios_5",
    shortName: "AHRQ TeamSTEPPS — Patient Safety Case Scenarios",
    detail: "AHRQ TeamSTEPPS course materials and patient-safety case studies",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/teamstepps-program/index.html",
    lastRetrieved: "2026-07-03"
)

private let openrnScenarios5 = CitationSource(
    id: "openrn_scenarios_5",
    shortName: "Open RN — Nursing Fundamentals & Health Alterations chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/",
    lastRetrieved: "2026-07-03"
)

private let openrnSkills5 = CitationSource(
    id: "openrn_skills_5",
    shortName: "Open RN — Nursing Skills (tracheostomy, seizure, restraint chapters)",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingskills/",
    lastRetrieved: "2026-07-03"
)

private let cdcEpilepsy5 = CitationSource(
    id: "cdc_seizure_first_aid_5",
    shortName: "CDC — Epilepsy: Seizure First Aid",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/epilepsy/",
    lastRetrieved: "2026-07-03"
)

private let cdcRSV5 = CitationSource(
    id: "cdc_rsv_5",
    shortName: "CDC — RSV in Infants and Young Children",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/rsv/",
    lastRetrieved: "2026-07-03"
)

private let cdcCancer5 = CitationSource(
    id: "cdc_cancer_infection_5",
    shortName: "CDC — Preventing Infections in Cancer Patients",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/cancer/",
    lastRetrieved: "2026-07-03"
)

private let nindsTBI5 = CitationSource(
    id: "ninds_tbi_5",
    shortName: "NIH/NINDS — Traumatic Brain Injury information pages",
    publisher: "National Institute of Neurological Disorders and Stroke",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/health-information/disorders/traumatic-brain-injury-tbi",
    lastRetrieved: "2026-07-03"
)

// MARK: - Pediatric respiratory distress

public enum PedsRespiratoryDistressScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "peds-respiratory-distress-scenario",
        title: "Infant respiratory distress — the baby who got 'quieter'",
        subtitle: "In infants, silence is not improvement — it's fatigue",
        eyebrow: "SCENARIO · PEDS",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .gasExchange
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 4-month-old admitted with RSV bronchiolitis has had a loud night: RR 68, nasal flaring, subcostal retractions, crackles and wheeze throughout, SpO2 93% on low-flow oxygen. She refuses most of her feeds. Toward the morning the night nurse charts 'infant resting more comfortably — less retracting, quieter breath sounds.' At handoff the day nurse goes to see her and finds an infant who is pale, floppy, breathing shallowly at 38 with minimal effort, and difficult to rouse for a feed. SpO2 is 89% and drifting. A rapid response is called; she is escalated to high-flow support in the PICU for impending respiratory failure. The case review centers on one line: the 'quieter' infant was not improving — she was exhausting.",
                citationIDs: ["ahrq_psnet_5", "cdc_rsv_5", "openrn_scenarios_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Decreasing retractions and a quieter chest were read as recovery. In an infant who has been working hard for hours, decreased effort with worsening color and tone means the respiratory muscles are failing — infants fatigue fast because their reserve is small.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("The falling respiratory rate reassured instead of alarmed. A rate that drops from 68 toward 'normal' without genuine clinical improvement is a late and dangerous sign, not a trend to celebrate.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Feeding was charted but not weighted as a vital sign. An infant who cannot feed because of work of breathing is telling you exactly how sick she is — refusing feeds is respiratory distress data, and it also means dehydration is compounding the picture.", citationIDs: ["cdc_rsv_5", "openrn_scenarios_5"]),
                AttributedBullet("SpO2 carried the assessment. Infants compensate and hold their saturation until late; work of breathing — flaring, retractions, grunting, head bobbing — deteriorates first, and the monitor stays falsely reassuring.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("No structured reassessment interval was set overnight for a bronchiolitis infant on night 2 — typically the peak-severity window of the illness.", citationIDs: ["cdc_rsv_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Assess work of breathing head to toe, undressed to the waist: flaring, grunting, head bobbing, retractions (subcostal, intercostal, suprasternal), abdominal breathing, and color — and count the respiratory rate for a full minute, because infant breathing is irregular.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Treat these as pre-arrest red flags in an infant: grunting (auto-PEEP against a closing airway), apnea spells, bradycardia, decreasing effort after a period of hard work, and altered tone or responsiveness.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Track feeding volume and effort as part of the respiratory assessment; suction the nose before feeds — infants are obligate nasal breathers, and secretions alone can tip them over.", citationIDs: ["cdc_rsv_5", "openrn_skills_5"]),
                AttributedBullet("Know the high-risk groups who crash fastest: under ~2 months, former preemies, congenital heart or lung disease, neuromuscular weakness — and lower your escalation threshold accordingly, including for apnea, which can be the presenting sign of RSV in the youngest infants.", citationIDs: ["cdc_rsv_5"]),
                AttributedBullet("Escalate on trajectory, not thresholds: 'she was retracting hard at midnight and now she's limp and quiet' is a rapid-response sentence even if no single number looks catastrophic.", citationIDs: ["ahrq_teamstepps_scenarios_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Pediatric respiratory failure is usually a story of compensation running out. The infant announces the problem with effort — flaring, retracting, grunting — and then, when the muscles tire, the announcement stops. The most dangerous moment can look like the calmest. Assess effort, not just numbers; treat 'quieter' as a question, not an answer; and remember that in a working infant, normal-looking is only good news when everything else is improving too.",
                citationIDs: ["openrn_scenarios_5", "cdc_rsv_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5, openrnSkills5, cdcRSV5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Neutropenic fever

public enum NeutropenicFeverScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "neutropenic-fever-scenario",
        title: "Neutropenic fever — 'she looks fine' at 100.6",
        subtitle: "When there are no neutrophils, fever is the whole alarm",
        eyebrow: "SCENARIO · ONCOLOGY",
        nclexTags: NCLEXTags(
            category: .safeAndEffectiveCare,
            subcategory: .safetyAndInfectionControl,
            priorityConcept: .infection
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 52-year-old woman is admitted for chemotherapy complications; she is ten days from her last cycle — the expected nadir — with this morning's ANC reported at 200. At 20:00 her temperature is 100.6°F. She feels 'a little tired' but is comfortable, chatting, vital signs otherwise unremarkable. The nurse plans to recheck the temperature in an hour before 'bothering the on-call.' At the recheck she is 101.4, rigoring, and her BP has fallen to 92/54. Blood cultures are drawn, broad-spectrum antibiotics are started, and she spends two days in the ICU for septic shock. The review question: what should have happened at 100.6?",
                citationIDs: ["ahrq_psnet_5", "cdc_cancer_infection_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Fever in severe neutropenia was triaged like fever in a normal host. With an ANC of 200 there are effectively no neutrophils to mount inflammation — no pus, no infiltrate, often no localizing signs. Fever may be the only evidence of an infection that is already in the blood.", citationIDs: ["cdc_cancer_infection_5", "openrn_scenarios_5"]),
                AttributedBullet("'She looks fine' was allowed to overrule the number. Neutropenic patients look fine until they are in septic shock precisely because the usual inflammatory signals are absent.", citationIDs: ["ahrq_psnet_5"]),
                AttributedBullet("The recheck-in-an-hour plan cost the golden hour. Neutropenic fever is treated as a medical emergency: cultures and empiric broad-spectrum antibiotics promptly — commonly within an hour of fever per facility protocol — because deterioration to shock is fast.", citationIDs: ["cdc_cancer_infection_5"]),
                AttributedBullet("The nadir context was on the chart and not used. Day 7–14 post-chemo is when the count bottoms out; a fever inside that window should be pre-loaded as 'neutropenic fever until proven otherwise.'", citationIDs: ["openrn_scenarios_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Know the working definition and your protocol's version of it: a single temperature at or above roughly 101°F, or a sustained temperature at or above 100.4°F, in a patient with an ANC under 500 (or expected to fall under 500) is neutropenic fever and triggers the pathway immediately.", citationIDs: ["cdc_cancer_infection_5"]),
                AttributedBullet("Sequence matters, speed matters more: notify immediately, obtain cultures per protocol (peripheral plus each lumen of any central line) — and never let culture logistics delay the antibiotics.", citationIDs: ["cdc_cancer_infection_5", "openrn_scenarios_5"]),
                AttributedBullet("Assess the sites where neutropenic infections hide with minimal signs: mucositis and the oral cavity, central line sites (redness may be subtle), the perianal area (visual inspection — no rectal temperatures, suppositories, or digital exams, which can seed bacteremia through fragile mucosa).", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Maintain protective practices around the patient: meticulous hand hygiene, no fresh flowers or standing water, screen visitors and staff for illness, and dedicated equipment per facility policy.", citationIDs: ["cdc_cancer_infection_5"]),
                AttributedBullet("Educate the patient and family before discharge windows: any fever at home during the nadir is an emergency-department event, not a wait-until-morning event.", citationIDs: ["cdc_cancer_infection_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Neutropenia deletes the body's early-warning system and the clinician's usual evidence. What remains is one number and one signal: the ANC that says the patient can't fight, and the fever that says something is winning. The correct emotional register for neutropenic fever is the same as for chest pain — move now, look reassured later. An hour of hesitation is the difference between a fever protocol and an ICU admission.",
                citationIDs: ["cdc_cancer_infection_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5, cdcCancer5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Dialysis day errors

public enum DialysisDayScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "dialysis-day-scenario",
        title: "Dialysis day — the BP cuff on the fistula arm",
        subtitle: "Access protection, held meds, and the post-dialysis crash",
        eyebrow: "SCENARIO · RENAL",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .fluidElectrolytes
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 68-year-old man with ESRD is admitted to med-surg for cellulitis; he dialyzes Monday-Wednesday-Friday through a left forearm fistula. Wednesday morning, a float nurse — his usual nurse is off — takes his 06:00 vitals with the automatic cuff on the left arm, then administers his full scheduled antihypertensives at 08:00 because they were due on the MAR. He goes to dialysis at 09:00. Forty minutes into the run he becomes hypotensive, nauseated, and cramping; the session is cut short. Back on the unit that afternoon, he stands to use the bathroom, feels faint, and is lowered to the floor by an aide. The dialysis unit also reports the fistula thrill feels weaker than his baseline record.",
                citationIDs: ["ahrq_psnet_5", "openrn_scenarios_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Vital signs were taken on the access arm. BP cuffs, venipuncture, and IV lines on a fistula arm risk thrombosing the access — the patient's lifeline. This is a never-event for AV access, and the weakened thrill afterward is exactly the feared signal.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Scheduled antihypertensives were given right before dialysis without clarification. Dialysis removes volume; a patient walking in fully beta-blocked and vasodilated has had his compensatory reserve medicated away — intradialytic hypotension is the predictable result.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Post-dialysis orthostatic risk wasn't anticipated. After a run — especially one complicated by hypotension — patients are volume-down and prone to orthostatic syncope; the first ambulation needed assistance and a check, not an independent walk.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("The float assignment carried no renal-specific handoff: which arm, which meds are dialysis-day holds, and what this patient's baseline thrill and post-run pattern look like.", citationIDs: ["ahrq_teamstepps_scenarios_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Protect the access arm absolutely: no BP, no needles, no lines — sign above the bed, band on the wrist per policy, and the whole team told. Assess the fistula every shift: palpate the thrill, auscultate the bruit, and report any change from baseline immediately.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Treat dialysis-day medications as a standing clarification: many antihypertensives and other agents are held until after the run, and some drugs are dosed post-dialysis because the run removes them. The MAR schedule is not the decision — the provider's dialysis-day plan is.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Bracket the run with data: pre- and post-dialysis weight and vitals, and a post-run assessment for hypotension, cramping, dizziness, and access-site bleeding — hold pressure and escalate for bleeding that doesn't stop promptly.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("First ambulation after dialysis is assisted, with orthostatic awareness: sit, dangle, stand with support, and abort on symptoms.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Handoffs for dialysis patients name the four essentials out loud: access site and its baseline, dialysis schedule, dialysis-day med plan, and target weight/fluid limits.", citationIDs: ["ahrq_teamstepps_scenarios_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "A dialysis patient on a general unit lives by rules that the unit's routines will quietly violate: the automatic cuff doesn't know which arm is the fistula, and the MAR doesn't know the patient dialyzes at nine. The nurse is the translation layer. Access protection, dialysis-day medication clarification, and post-run orthostatic caution are three habits that prevent three separate emergencies — and all three failed here on a single Wednesday.",
                citationIDs: ["openrn_scenarios_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Seizure response

public enum SeizureResponseScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "seizure-response-scenario",
        title: "Seizure — what the first five minutes are for",
        subtitle: "Protect, position, time — and know when it becomes status",
        eyebrow: "SCENARIO · NEURO",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .neurologicalRegulation
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 29-year-old man admitted for alcohol use disorder begins a generalized tonic-clonic seizure in the hallway on hospital day 2. A visitor shouts for help. The first staff to arrive try to hold his arms still 'so he doesn't hurt himself,' and someone runs for a padded tongue blade to 'protect his airway.' The unit's charge nurse arrives, clears the crowd, redirects: lower him fully to the floor, something soft under the head, on his side, nothing in the mouth, and 'someone look at a clock — now.' The seizure self-terminates at just over three minutes. He is post-ictally confused; the team checks a glucose, applies oxygen, keeps him side-lying, and monitors until he clears. The debrief focuses on the first responders' instincts — both classic, both wrong.",
                citationIDs: ["cdc_seizure_first_aid_5", "ahrq_psnet_5"]
            )),
            .bullets(title: "What went wrong (and almost went wrong)", [
                AttributedBullet("Restraining a convulsing patient doesn't stop the seizure and can injure joints and soft tissue — the seizure ends when the brain ends it. Restraint is for protecting the patient from hazards, not from movement.", citationIDs: ["cdc_seizure_first_aid_5"]),
                AttributedBullet("Putting anything in the mouth — tongue blades, fingers, airways — is a reliable way to break teeth, obstruct the airway, or get bitten. The 'swallowing the tongue' fear is a myth; the tongue is anchored.", citationIDs: ["cdc_seizure_first_aid_5"]),
                AttributedBullet("Nobody was timing. Duration is the single most decision-relevant number in a seizure: it defines when a self-limited event becomes status epilepticus and emergency medication territory.", citationIDs: ["cdc_seizure_first_aid_5", "openrn_skills_5"]),
                AttributedBullet("The context was a setup that should have had seizure precautions already active: alcohol withdrawal on day 2 is a known seizure window.", citationIDs: ["openrn_scenarios_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("During: lower to a safe surface, clear hard objects, pad the head, loosen anything at the neck, turn to the side as soon as possible so secretions drain, and time it from the first movement. Stay with the patient; send someone else for help and the emergency equipment.", citationIDs: ["cdc_seizure_first_aid_5", "openrn_skills_5"]),
                AttributedBullet("Know the status threshold: a convulsive seizure lasting five minutes or more, or repeated seizures without full recovery between them, is status epilepticus — activate the emergency response and prepare to give emergency antiseizure medication per protocol.", citationIDs: ["cdc_seizure_first_aid_5"]),
                AttributedBullet("After: airway and breathing first (suction ready, oxygen as needed, keep side-lying), then vitals, then a glucose — hypoglycemia both mimics and causes seizures — then injury survey including the tongue, head, and shoulders.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Observe like a witness, because you are one: onset, spread, eye deviation, incontinence, duration, and how the post-ictal period evolves — this description drives the diagnostic workup.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Seizure precautions for at-risk patients before the event: padded rails per policy, suction and oxygen set up at the bedside, IV access maintained — withdrawal, eclampsia risk, known epilepsy with missed doses, TBI, and hyponatremia are the usual suspects.", citationIDs: ["openrn_scenarios_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Seizure first aid is deliberately humble: you cannot stop the seizure, so your job is to stop the harm — the fall, the aspiration, the hard corner, the well-meaning tongue blade. The two skilled acts are positioning and timing. Position buys safety; the clock buys the decision, because minute five changes everything. And the best seizure response is the one set up in advance, on the patient everyone knew was at risk.",
                citationIDs: ["cdc_seizure_first_aid_5", "openrn_skills_5"]
            ))
        ],
        citations: [ahrqPSNet5, cdcEpilepsy5, openrnScenarios5, openrnSkills5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Anticoagulated head injury

public enum AnticoagulatedHeadInjuryScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "anticoag-head-injury-scenario",
        title: "The fall that 'wasn't a big deal' — head strike on anticoagulation",
        subtitle: "A normal exam right after the fall proves nothing",
        eyebrow: "SCENARIO · NEURO",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .neurologicalRegulation
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 78-year-old woman on apixaban for atrial fibrillation slips in her hospital bathroom and bumps her head on the sink edge. She never loses consciousness, has no complaints beyond embarrassment, and her immediate neuro exam is normal. The event is charted as a no-injury fall; the provider is notified and, told 'no LOC, exam normal,' defers imaging. Neuro checks are ordered but recorded only twice. Four hours later the CNA mentions she 'seems more confused than earlier.' Thirty minutes after that she has a headache, then vomits. Stat CT: subdural hematoma. She goes emergently to neurosurgery after anticoagulation reversal per protocol, and survives with a long rehabilitation.",
                citationIDs: ["ahrq_psnet_5", "ninds_tbi_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("The reassuring immediate exam was treated as the verdict. Intracranial bleeding on anticoagulation is frequently delayed — the classic pattern is a lucid interval followed by decline as the hematoma expands. The normal exam is the starting photograph, not the outcome.", citationIDs: ["ninds_tbi_5", "ahrq_psnet_5"]),
                AttributedBullet("'No LOC' was allowed to downgrade the event. Loss of consciousness is not required for a significant bleed, particularly in older adults on anticoagulants, where even minor mechanisms cause subdurals — age-related atrophy stretches the bridging veins and gives blood room to accumulate silently.", citationIDs: ["ninds_tbi_5"]),
                AttributedBullet("The essential clinical fact — anticoagulated head strike — was flattened out of the provider notification. The SBAR should have led with it.", citationIDs: ["ahrq_teamstepps_scenarios_5"]),
                AttributedBullet("Ordered neuro checks decayed into paperwork. The entire value of serial checks is trend detection; sporadic documentation means the trend is invisible until it's dramatic.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("The CNA's 'more confused than earlier' floated for half an hour. In a post-fall anticoagulated patient, any new confusion is a stat escalation, not an observation to age.", citationIDs: ["ahrq_teamstepps_scenarios_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Hard-code the rule: head strike + anticoagulation (or antiplatelet therapy, or known coagulopathy) = provider notification that says exactly that, with imaging and observation decisions made on that basis — commonly CT and structured serial monitoring regardless of how well the patient looks.", citationIDs: ["ninds_tbi_5", "openrn_scenarios_5"]),
                AttributedBullet("Run neuro checks like a protocol, not a vibe: LOC and orientation, pupils, motor strength and symmetry, speech — same elements, documented every interval, compared against the last set.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Teach the whole team the deterioration signals: worsening or new headache, vomiting, new confusion or drowsiness, unequal pupils, weakness on one side — and treat any of them as a stat provider call and likely rapid response.", citationIDs: ["ninds_tbi_5"]),
                AttributedBullet("Know the late signs so you never wait for them: Cushing's triad — hypertension with widening pulse pressure, bradycardia, irregular respirations — is herniation physiology, not an early warning.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Know where reversal happens: anticoagulation reversal agents and protocols are time-critical in intracranial bleeding — the earlier the escalation, the more the reversal is worth.", citationIDs: ["openrn_scenarios_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Anticoagulation changes the physics of a minor fall: the same bump that means nothing in most patients can mean a slowly expanding hematoma in this one — and the bleed's favorite trick is looking fine for hours. The discipline is refusing to let a normal early exam close the case. The exam that matters is the sixth one, compared honestly against the first, by a team that knows exactly which words ('on apixaban, struck her head') must never be dropped from the story.",
                citationIDs: ["ninds_tbi_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5, nindsTBI5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Restraint safety

public enum RestraintSafetyScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "restraint-safety-scenario",
        title: "Restraints — treating agitation without asking why",
        subtitle: "Agitation is a symptom; restraint is a last resort with a clock on it",
        eyebrow: "SCENARIO · SAFETY",
        nclexTags: NCLEXTags(
            category: .safeAndEffectiveCare,
            subcategory: .safetyAndInfectionControl,
            priorityConcept: .safety
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "An 81-year-old man, post-op day 1 from bowel surgery, becomes agitated overnight — pulling at his IV, trying to climb out of bed, calling out. The night team applies bilateral soft wrist restraints under a verbal order and returns to a heavy assignment; documentation shows one check in four hours. Toward morning he is found having partially slid down the bed with the restraint straps taut across his forearms, hands dusky, and he is more agitated than ever. When the day team properly assesses him, they find a distended bladder — he hasn't voided since the catheter was removed — an SpO2 of 88%, and a pain score never assessed overnight. A bladder scan, catheterization, oxygen, and analgesia resolve most of the agitation within the hour. The restraints come off.",
                citationIDs: ["ahrq_psnet_5", "openrn_skills_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Agitation was treated as the diagnosis instead of a symptom. In a post-op older adult, the reversible drivers are a short list — hypoxia, urinary retention, pain, hypoglycemia, medication effects, withdrawal, and emerging delirium — and none of them were assessed before the wrists were tied.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Restraint became a staffing tool. The purpose of restraint is imminent-harm prevention after less restrictive measures fail — not to make a heavy assignment manageable, which is precisely the use regulation exists to prevent.", citationIDs: ["openrn_skills_5", "ahrq_psnet_5"]),
                AttributedBullet("Monitoring collapsed. A restrained patient requires scheduled checks per policy — circulation, skin, positioning, range of motion, hydration, toileting, and continued necessity — because the restraint itself creates new dangers: entrapment, strangulation, neurovascular injury, aspiration, and deconditioning.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("The order pathway was informal. Restraint orders are time-limited, require face-to-face provider evaluation within the regulatory window, must be renewed with reassessment, and can never be written PRN.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Restraint escalated the problem it was meant to solve — restrained patients commonly become more agitated, not less, and his dusky hands show the physical cost accruing unobserved.", citationIDs: ["ahrq_psnet_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Assess before restraining, every time: vitals with SpO2, glucose if indicated, bladder scan, pain, medication review, and a delirium screen. Treating the cause usually treats the behavior.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Exhaust the alternatives and document them: reorientation, family or sitter at the bedside, moving the patient closer to the station, toileting rounds, pain control, sleep protection, hiding-in-plain-sight for lines (sleeves, wraps), and de-escalation.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("If restraint is genuinely required: least restrictive device, correct application with two fingers of slack secured to the bed frame (never the rails), a proper time-limited order, and monitoring on the policy schedule with real content in the notes.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Work toward removal from the moment of application: trial releases at every check, and discontinue at the earliest safe opportunity — the order expiring is not the goal line; the patient no longer needing it is.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Debrief restraint events: what drove the behavior, what alternative was missed, and what the plan is for the next night — because post-op night two is coming.", citationIDs: ["ahrq_teamstepps_scenarios_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "The agitated patient is trying to tell you something — often 'I can't breathe,' 'I'm in pain,' or 'my bladder is full' — in the only language available. Restraint silences the messenger without reading the message, and adds its own hazards to whatever was already wrong. The standard is uncomfortable on a busy night and correct anyway: assess first, try everything less restrictive, restrain only for imminent harm, monitor like it's an intervention with complications — because it is — and take them off the moment you can.",
                citationIDs: ["openrn_skills_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5, openrnSkills5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Neonatal fever

public enum NeonatalFeverScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "neonatal-fever-scenario",
        title: "Fever in a 3-week-old — there is no 'watch and wait'",
        subtitle: "Under 28 days, one temperature changes everything",
        eyebrow: "SCENARIO · PEDS",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .infection
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 21-day-old boy is brought to the ED at 22:00. His mother reports he 'felt warm' and nursed poorly today; a home rectal temperature read 100.5°F. In triage he is afebrile at 99.9°F rectally, sleeping, with a soft fontanel and no distress. The waiting room is full. A newer triage nurse assigns a lower acuity — 'afebrile now, looks comfortable' — and the family waits ninety minutes. When he's finally roomed, he is mottled, feeding refusal is total, and his temperature is 96.8°F. The team recognizes the picture immediately: a full sepsis evaluation is initiated and empiric antibiotics are started per protocol. Cultures later confirm bacteremia. He recovers after a week in the NICU.",
                citationIDs: ["ahrq_psnet_5", "openrn_scenarios_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("A documented home fever in a neonate was discounted because triage was afebrile. In the first 28 days, any rectal temperature of 100.4°F or higher — by anyone's thermometer, at any point — is an emergency that mandates a full evaluation. A normal number later doesn't unring the bell.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("'Looks comfortable' was weighted heavily in an age group where looking fine means almost nothing. Neonates lack the immune maturity to localize infection or mount reliable signs; serious bacterial infection routinely hides behind a sleeping, quiet baby.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("The falling temperature reassured instead of alarmed. Hypothermia in a neonate is at least as ominous as fever — temperature instability in either direction is the sepsis signal.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Poor feeding was recorded as history rather than read as a cardinal sign. In neonates, the sensitive indicators are behavioral: feeding decline, lethargy, irritability, 'just not acting right' per the parent — and parental concern itself carries diagnostic weight.", citationIDs: ["ahrq_psnet_5", "openrn_scenarios_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Triage rule with no exceptions: 28 days or younger + reported or measured temperature ≥100.4°F (38.0°C) rectally = highest-acuity track, immediate provider evaluation, full sepsis workup per protocol. The history of fever counts as the fever.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Take hypothermia seriously: a neonate who can't hold temperature is failing a basic regulatory task — assess for sepsis, not just for blankets.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Anticipate the workup so it moves fast: blood cultures, urine by catheterization, lumbar puncture per provider, and empiric antibiotics promptly — delay to antibiotics is the modifiable mortality factor.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Assess the neonate's vital signs in context: normal ranges differ (HR 110–160, RR 30–60), mottling and poor perfusion are late findings, and a full-minute apical rate and respiratory count are the standard.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Listen to the parent as a monitoring device: 'he's not himself' from the person who feeds this baby eight times a day is high-quality data, and dismissing it is a recurring theme in pediatric sepsis case reviews.", citationIDs: ["ahrq_psnet_5", "ahrq_teamstepps_scenarios_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Neonatal fever is one of the few places in medicine where a single data point overrides the entire clinical gestalt. The 21-day-old cannot wall off an infection, cannot show you convincing signs, and can move from 'sleeping comfortably' to septic shock inside a waiting-room wait. The rule exists because the exam fails here: under 28 days, fever — reported or measured, present or resolved — buys the full evaluation, every time, with hypothermia and feeding refusal treated as members of the same family.",
                citationIDs: ["openrn_scenarios_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Tracheostomy emergency

public enum TracheostomyEmergencyScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "trach-emergency-scenario",
        title: "Tracheostomy emergency — the fresh trach that came out",
        subtitle: "Why 'put it back in' is the most dangerous instinct in the room",
        eyebrow: "SCENARIO · AIRWAY",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .gasExchange
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 66-year-old man, post-op day 4 from tracheostomy placement after prolonged ventilation, is being repositioned when the tube dislodges completely. The first nurse's instinct is to push it back in; it meets resistance and she stops — remembering that a stoma this fresh has no mature tract, and blind reinsertion can create a false passage into the soft tissue of the neck that ventilates nothing while looking like an airway. She calls the airway emergency overhead, applies oxygen to the face (his upper airway is anatomically intact — he is not a laryngectomy patient), covers the stoma with gauze, and supports his breathing until the emergency team secures the airway. The bedside kit — obturator, same-size and one-size-smaller spare trachs, suction — is opened on arrival. He does well.",
                citationIDs: ["ahrq_psnet_5", "openrn_skills_5"]
            )),
            .bullets(title: "Why the details matter", [
                AttributedBullet("A tracheostomy tract takes roughly a week or more to mature. Before that, the tissue planes collapse when the tube comes out, and forced blind reinsertion risks a false passage — the tube sits in the neck, not the trachea, and positive pressure inflates tissue instead of lungs.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("The single most important anatomical question is: does this patient have an intact upper airway (tracheostomy) or no upper airway at all (total laryngectomy)? A trach patient can often be oxygenated and bag-mask ventilated from the face with the stoma covered; a laryngectomy patient can only be oxygenated at the stoma — face oxygen does nothing.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Resistance is the stop signal. Meeting resistance and stopping — rather than pushing harder — is what kept this event an emergency instead of a catastrophe.", citationIDs: ["ahrq_psnet_5"]),
                AttributedBullet("The emergency happened during repositioning, the highest-risk routine moment for any airway device — the ties, the slack, and who is watching the tube were all decidable in advance.", citationIDs: ["ahrq_teamstepps_scenarios_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Every tracheostomy bedside, every shift, verify the kit: obturator taped where visible, spare tube same size plus one size smaller, suction working, oxygen available, and a sign stating trach type/size and whether the patient is a laryngectomy — this check is as non-negotiable as the code cart.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Fresh trach dislodgement (before tract maturity): do not force reinsertion. Call the airway emergency, oxygenate by the route the anatomy allows, cover the stoma, and let the team with airway expertise re-establish it — often over a guide or with equipment at hand.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Suspected obstruction pathway, in order: remove the inner cannula (most obstructions live there), attempt suction, escalate immediately if not resolved — with cuff and humidification management per policy to prevent the plug forming at all.", citationIDs: ["openrn_skills_5"]),
                AttributedBullet("Secure before you move: check tie tension (snug but a finger's width), route the circuit with slack, and assign one person to own the airway during every reposition, transfer, and transport.", citationIDs: ["openrn_skills_5", "ahrq_teamstepps_scenarios_5"]),
                AttributedBullet("Watch for the complications that follow any trach event: subcutaneous emphysema (crepitus spreading in the neck/chest), bleeding, worsening respiratory distress — each is an escalation, not an observation.", citationIDs: ["openrn_skills_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Tracheostomy emergencies punish improvisation and reward preparation. The instinct to shove the tube back is powerful and, in a fresh stoma, dangerous — the skilled move is knowing the anatomy question (upper airway or not?), oxygenating by the route that anatomy allows, and calling the people whose job is the tract. Everything that made this case survivable was arranged before it happened: the kit at the bedside, the sign on the wall, and a nurse who knew what resistance means.",
                citationIDs: ["openrn_skills_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnSkills5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Compartment syndrome

public enum CompartmentSyndromeScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "compartment-syndrome-scenario",
        title: "Compartment syndrome — pain that outruns the injury",
        subtitle: "The opioid that keeps not working is the assessment finding",
        eyebrow: "SCENARIO · ORTHO",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .perfusion
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 24-year-old man is admitted overnight after a tibial fracture from a soccer collision, splinted in the ED, surgery planned for the morning. He rates his pain 6/10 at admission; two hours later it's 9/10 despite analgesia. The night nurse medicates again. An hour later he's calling out — 'it's burning, it's too tight' — and reports pins and needles in his foot. Another dose is given; a note reads 'pain poorly controlled, will reassess.' At 05:30 the day nurse performs a full neurovascular exam: the calf is tense and firm, passive dorsiflexion of the toes produces severe pain, sensation is decreased in the first web space, and pulses are present. She recognizes the pattern, calls the surgeon immediately, and loosens the splint wrappings per order while the OR is readied. Fasciotomy confirms anterior compartment syndrome — caught with the limb still salvageable.",
                citationIDs: ["ahrq_psnet_5", "openrn_scenarios_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Escalating pain was managed as an analgesia problem instead of assessed as a perfusion problem. Pain out of proportion to the injury, and pain that escalates despite appropriate opioids, is the earliest and most reliable sign of compartment syndrome.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Repeated medication without a neurovascular exam masked the trajectory. Each dose bought silence, not safety — and in a compartment, hours are tissue.", citationIDs: ["ahrq_psnet_5"]),
                AttributedBullet("Paresthesia ('pins and needles') was charted without being recognized as the second stage: nerve ischemia has begun. The classic sequence runs pain → paresthesia → pallor/paralysis → pulselessness, and the late signs mean muscle is already dying.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Waiting for absent pulses would have been the fatal error for the limb — pulses commonly persist until very late because compartment pressure exceeds capillary pressure long before it exceeds arterial pressure.", citationIDs: ["openrn_scenarios_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Scheduled neurovascular checks on every casted, splinted, or high-risk limb (tibial fractures, forearm fractures, crush injuries, vascular injuries, tight dressings): the 6 Ps — pain, pressure, paresthesia, pallor, paralysis, pulses — with side-to-side comparison, documented every interval.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Test the sentinel sign deliberately: pain on passive stretch of the digits (dorsiflex the toes for the leg, extend the fingers for the forearm) — severe pain on this maneuver in a firm compartment is compartment syndrome until proven otherwise.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Immediate nursing moves while escalating: keep the limb at heart level — not elevated, which reduces arterial inflow into an already-starved compartment — remove or loosen circumferential constriction per order (bivalve the cast, release wrappings), and do not apply ice.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Escalate as a surgical emergency: notify the provider with the specific findings ('tense compartment, pain on passive stretch, new paresthesia'), because the definitive treatment is fasciotomy and the window is hours.", citationIDs: ["openrn_scenarios_5", "ahrq_teamstepps_scenarios_5"]),
                AttributedBullet("Treat the analgesia record as an assessment instrument: a patient whose requirement is climbing hour over hour has a reason — find it before the next dose hides it.", citationIDs: ["ahrq_psnet_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "Compartment syndrome is a diagnosis the nurse usually makes first, because its earliest evidence lives in nursing data: the pain score that keeps climbing, the PRN log that keeps growing, the patient who says 'too tight' and 'burning.' The trap is treating that evidence — every dose that quiets the alarm costs the compartment another hour. Assess the limb every time pain escalates, stretch the digits, keep it at heart level, and say the words that move a surgeon: pain out of proportion, firm compartment, new paresthesia.",
                citationIDs: ["openrn_scenarios_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Magnesium toxicity in preeclampsia

public enum MagnesiumToxicityScenarioSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "magnesium-toxicity-scenario",
        title: "Magnesium infusion — the reflexes nobody checked",
        subtitle: "The antidote belongs at the bedside before the first sign of toxicity",
        eyebrow: "SCENARIO · OB",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .pharmacologicalAndParenteralTherapies,
            priorityConcept: .safety
        ),
        sections: [
            .prose(title: "The situation", AttributedProse(
                "A 31-year-old woman with severe preeclampsia is receiving a magnesium sulfate infusion for seizure prophylaxis after delivery. Her urine output drifts down through the evening — 40, then 25, then 20 mL/hr — attributed to 'a long delivery.' The hourly assessments become abbreviated on a busy unit: vitals are charted, but deep tendon reflexes go unexamined for several hours and the flowsheet rows sit blank. At 02:00 the nurse finds her difficult to rouse, breathing 9 times a minute, with absent patellar reflexes. The infusion is stopped immediately, the rapid response is called, calcium gluconate is given per protocol, and she recovers without harm. The review finds the toxicity was predictable: magnesium is renally cleared, and her kidneys had been announcing the problem all evening.",
                citationIDs: ["ahrq_psnet_5", "openrn_scenarios_5"]
            )),
            .bullets(title: "What went wrong", [
                AttributedBullet("Falling urine output was explained away instead of connected to the drug. Magnesium is excreted by the kidneys; oliguria in a patient on a magnesium infusion means the drug is accumulating even though the pump rate never changed — and preeclampsia itself impairs renal function.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("The toxicity ladder was never watched. Magnesium announces itself in order: loss of deep tendon reflexes first, then respiratory depression, then cardiac compromise. DTRs are the early-warning system, and they were the exact assessment skipped.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Hourly monitoring became hourly charting. The protocol elements — DTRs, respiratory rate, urine output, level of consciousness — exist as a set because each covers a different rung of the ladder; dropping one blinds a rung.", citationIDs: ["ahrq_psnet_5"]),
                AttributedBullet("Drowsiness at 02:00 had a convenient explanation available — exhausted postpartum patient at night — and the convenient explanation nearly won. On magnesium, altered arousal is toxicity until assessed otherwise.", citationIDs: ["ahrq_psnet_5"])
            ]),
            .bullets(title: "What good performance looks like", [
                AttributedBullet("Run the full magnesium check on schedule, every time: deep tendon reflexes present, respiratory rate at or above 12, urine output at or above roughly 30 mL/hr, and normal level of consciousness — with serum levels drawn per protocol and the provider notified when any element trends off.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Treat urine output as the leading indicator: a sustained fall on a renally-cleared infusion is grounds to notify the provider and reassess the rate before signs of toxicity appear, not after.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Keep the antidote where the emergency will be: calcium gluconate immediately available at the bedside per protocol for the duration of the infusion — its entire value is in the first minutes.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("First moves at any toxicity sign: stop the infusion, support airway and breathing, call for help, give the antidote per protocol, and continue seizure precautions — stopping magnesium does not remove the preeclampsia it was treating.", citationIDs: ["openrn_scenarios_5"]),
                AttributedBullet("Remember the fetus/newborn side of the drug when it runs antepartum: magnesium crosses the placenta, and the neonatal team should know the exposure.", citationIDs: ["openrn_scenarios_5"])
            ]),
            .prose(title: "The lesson", AttributedProse(
                "A magnesium infusion is a controlled poisoning with a therapeutic purpose, which is why its monitoring is structured as a ladder: reflexes go first, breathing second, the heart last. The nurse's job is to live on the first rung — checking DTRs that will almost always be present, watching a urine output that quietly determines the drug's fate — so the second rung never arrives. The blank flowsheet rows were the event; 02:00 was just when it became visible.",
                citationIDs: ["openrn_scenarios_5", "ahrq_psnet_5"]
            ))
        ],
        citations: [ahrqPSNet5, ahrqTeamSTEPPS5, openrnScenarios5],
        lastSourceFidelityReview: "2026-07-03"
    )
}
