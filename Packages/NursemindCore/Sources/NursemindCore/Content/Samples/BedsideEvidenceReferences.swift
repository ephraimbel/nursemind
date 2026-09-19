import Foundation

public enum EvidenceDeliriumPreventionWardCareSample {
    public static let entry = ReferenceEntry(
        id: "delirium-prevention-ward-care", title: "Delirium prevention on adult wards",
        subtitle: "Orientation, sensory support, sleep and the limits of bundle evidence", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cognition),
        sections: [
            .bullets(title: "Recognize a change from baseline", [
                AttributedBullet("Delirium develops over hours or days and can fluctuate. Dementia and delirium can coexist. Compare attention, alertness and thinking with the usual state described by the patient, family or prior records; a dementia diagnosis does not explain every new change.", citationIDs: ["bedside_evidence_cognition"])
            ]),
            .bullets(title: "What the research studied", [
                AttributedBullet("A 2021 Cochrane review examined prevention in hospitalized adults outside intensive care and high-dependency units. Fourteen studies involving 3,693 participants contributed to the multicomponent comparison. These were prevention programs, not a treatment trial for established delirium.", citationIDs: ["bedside_evidence_delirium"])
            ]),
            .bullets(title: "Study finding and certainty", [
                AttributedBullet("Multicomponent programs probably reduced delirium incidence: risk ratio 0.57, 95% confidence interval 0.46–0.71. The review rated this moderate-certainty evidence because of risk of bias. This relative effect does not mean a 43-percentage-point reduction for every ward.", citationIDs: ["bedside_evidence_delirium"])
            ]),
            .bullets(title: "Make orientation and communication possible", [
                AttributedBullet("Open RN describes a quiet, adequately lit environment, visible clocks or calendars and familiar visitors. Access to glasses and hearing aids supports communication. Consistent staff, when feasible, can reduce repeated unfamiliar encounters.", citationIDs: ["bedside_evidence_cognition"])
            ]),
            .bullets(title: "Look for a physiological contributor", [
                AttributedBullet("Infection, hypoxia, electrolyte changes, medication effects and sleep disruption can contribute to acute confusion. New mental-status changes require prompt clinical assessment and communication; orientation measures do not replace evaluation of the underlying cause.", citationIDs: ["bedside_evidence_cognition"])
            ]),
            .bullets(title: "Keep prevention outcomes separate", [
                AttributedBullet("The review found little or no clear effect on inpatient mortality, with lower certainty than for delirium incidence. The combined intervention result does not establish that one isolated component has the same benefit or that the findings apply unchanged to ICU care.", citationIDs: ["bedside_evidence_delirium"])
            ]),
            .bullets(title: "Observe over time", [
                AttributedBullet("Symptoms may include sleepiness, altered alertness, disorganized speech or difficulty concentrating as well as agitation. Monitor the cognitive pattern over time and report changes. The care plan needs reassessment when attention or participation worsens, even if the patient is quiet.", citationIDs: ["bedside_evidence_cognition"])
            ]),
            .bullets(title: "Prevention is a coordinated program", [
                AttributedBullet("Programs combined several non-drug measures, and the content varied between trials. The review’s component analysis was exploratory. It should not be read as a ranking that permits replacing the combined approach with whichever single activity is easiest to deliver.", citationIDs: ["bedside_evidence_delirium"])
            ]),
            .bullets(title: "Make baseline information available", [
                AttributedBullet("Family or caregiver observations and earlier records help establish usual cognition. When the baseline is unclear, new confusion still warrants assessment for an acute cause. The clinical evaluation may include examination and targeted tests guided by the history.", citationIDs: ["bedside_evidence_cognition"])
            ])
        ],
        citations: [BedsideEvidenceSources.cognition, BedsideEvidenceSources.delirium],
        lastSourceFidelityReview: "2026-09-19"
    )
}

public enum EvidenceInpatientFallsPreventionEvidenceSample {
    public static let entry = ReferenceEntry(
        id: "inpatient-falls-prevention-evidence", title: "Inpatient falls: individualized prevention",
        subtitle: "Education, assistance needs and what alarms cannot establish", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .bullets(title: "What the review covered", [
                AttributedBullet("Morris and colleagues reviewed 43 hospital studies; 23 contributed to meta-analyses. Interventions included education, environmental changes, rehabilitation and combined programs. Studies differed substantially in design and care setting; home and residential-care falls were outside the review.", citationIDs: ["bedside_evidence_falls"])
            ]),
            .bullets(title: "The clearest pooled finding", [
                AttributedBullet("Education reduced the rate of falls: rate ratio 0.70, 95% confidence interval 0.51–0.96. The education evidence included patient and staff approaches. A fall rate counts events over exposure time; it is different from the proportion of people who fall.", citationIDs: ["bedside_evidence_falls"])
            ]),
            .bullets(title: "Translate the assessment into assistance", [
                AttributedBullet("Open RN recommends assessing current mobility and ordered assistance or weight-bearing restrictions before activity. Determine which equipment and staff support the person needs now. Prior independence does not establish safe transfers during acute illness.", citationIDs: ["bedside_evidence_mobility"])
            ]),
            .bullets(title: "Watch the response to activity", [
                AttributedBullet("Dizziness, light-headedness, breathlessness and changes in vital signs during activity warrant reassessment. Record tolerance and the assistance actually required. Mobility goals should be realistic for the person’s current condition and revised with the patient and team.", citationIDs: ["bedside_evidence_mobility"])
            ]),
            .bullets(title: "Limits of risk scores and alarms", [
                AttributedBullet("Scored risk tools, bed or chair alarms and sensors did not show significant fall reductions in this review. This does not justify disabling prescribed safeguards. Their presence alone is not evidence that an individualized prevention plan has been completed.", citationIDs: ["bedside_evidence_falls"])
            ]),
            .bullets(title: "Interpret combined programs carefully", [
                AttributedBullet("Some multifactorial trials were favorable and others were not. Differences in staffing and intervention delivery complicated interpretation. The review did not pool fall injuries because definitions varied; fewer falls and fewer injuries are separate outcomes.", citationIDs: ["bedside_evidence_falls"])
            ]),
            .bullets(title: "What combined care may include", [
                AttributedBullet("Included programs addressed combinations of toileting, call-button response, handover, equipment access, footwear, medications and cognition. Results reflected the whole program. The review could not determine which educational design or delivery method was optimal across hospitals.", citationIDs: ["bedside_evidence_falls"])
            ])
        ],
        citations: [BedsideEvidenceSources.falls, BedsideEvidenceSources.mobility],
        lastSourceFidelityReview: "2026-09-19"
    )
}

public enum EvidencePressureInjuryRepositioningEvidenceSample {
    public static let entry = ReferenceEntry(
        id: "pressure-injury-repositioning-evidence", title: "Pressure injury prevention: repositioning context",
        subtitle: "Skin assessment, support surfaces and the TEAM-UP trial", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .bullets(title: "Begin with skin and function", [
                AttributedBullet("Document existing wounds and assess skin at admission. Continue assessment during the stay according to condition. Pain, moisture, impaired mobility and nutrition concerns can affect the prevention plan; a turning record alone does not describe tissue condition.", citationIDs: ["bedside_evidence_skin"])
            ]),
            .bullets(title: "What TEAM-UP actually compared", [
                AttributedBullet("TEAM-UP randomized nine nursing homes to repositioning intervals of 2, 3 or 4 hours. The four-week intervention involved 992 residents, high-density foam mattresses and sensor cues for staff. Eligible residents had no current pressure injury and Braden scores of at least 10.", citationIDs: ["bedside_evidence_turning"])
            ]),
            .bullets(title: "Read the result within its setting", [
                AttributedBullet("No new pressure injuries occurred during the intervention in any assigned group. This finding came from supported nursing-home care with specific mattresses and monitoring. It does not establish a universal four-hour schedule for hospitalized patients, severe-risk patients or existing wounds.", citationIDs: ["bedside_evidence_turning"])
            ]),
            .bullets(title: "Reassess the condition, not just the clock", [
                AttributedBullet("Open RN emphasizes assessing current skin and risk factors before implementing care, then modifying interventions when the condition changes. Worsening tissue findings or delayed healing require reassessment and may warrant wound-specialist involvement.", citationIDs: ["bedside_evidence_skin"])
            ]),
            .bullets(title: "Understand study limitations", [
                AttributedBullet("Sensor wear was intermittent for many residents, and monitoring may have increased staff awareness across groups. The intervention was brief. Zero events under these study conditions cannot demonstrate that all repositioning intervals are equivalent in all populations.", citationIDs: ["bedside_evidence_turning"])
            ]),
            .bullets(title: "Include the patient’s experience", [
                AttributedBullet("Ask about pain and the effect of wounds on sleep, activity and daily care. Chronic wounds can restrict independence and social participation. These observations help the team evaluate the burden of care as well as the appearance of the wound.", citationIDs: ["bedside_evidence_skin"])
            ]),
            .bullets(title: "Keep the plan responsive", [
                AttributedBullet("Skin changes and new signs of local or systemic infection need clinical communication. Reassessment includes whether current interventions remain appropriate and whether healing is progressing. Pressure-redistribution and repositioning choices belong to the individualized clinical plan.", citationIDs: ["bedside_evidence_skin"])
            ]),
            .bullets(title: "Distinguish pressure from wound healing", [
                AttributedBullet("Prevention and treatment are related but different questions. Existing wounds require assessment during dressing changes, while intact skin still needs surveillance for breakdown. A wound’s effect on comfort and function should be considered alongside its measured appearance.", citationIDs: ["bedside_evidence_skin"])
            ]),
            .bullets(title: "Do not substitute historical controls for randomization", [
                AttributedBullet("The study also compared pressure-injury experience with a prior baseline period. That historical comparison included a different observation period and the introduction of monitoring, so it cannot isolate the effect of changing the turning interval alone.", citationIDs: ["bedside_evidence_turning"])
            ])
        ],
        citations: [BedsideEvidenceSources.skin, BedsideEvidenceSources.turning],
        lastSourceFidelityReview: "2026-09-19"
    )
}

public enum EvidenceDysphagiaHydrationEvidenceSample {
    public static let entry = ReferenceEntry(
        id: "dysphagia-hydration-evidence", title: "Dysphagia: hydration and thickened fluids",
        subtitle: "Swallowing assessment, intake monitoring and evidence limits", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .nutrition),
        sections: [
            .bullets(title: "Two outcomes need attention", [
                AttributedBullet("A 2022 systematic/scoping review examined hydration in adults with oropharyngeal dysphagia and the effects of thickened fluids. Hydration status and the volume actually consumed were distinct outcomes. A prescribed consistency alone does not establish adequate intake.", citationIDs: ["bedside_evidence_hydration"])
            ]),
            .bullets(title: "What the review found", [
                AttributedBullet("Nine of ten studies evaluating fluid intake reported consumption below basal water requirements. Other included studies reported improved hydration with thickened-fluid therapy. These findings require attention to intake and implementation rather than a blanket claim that thickening always improves or worsens hydration.", citationIDs: ["bedside_evidence_hydration"])
            ]),
            .bullets(title: "What testing can establish", [
                AttributedBullet("A bedside swallow screen identifies risk and may lead to further testing. It does not, by itself, characterize every swallowing disorder. A videofluoroscopic swallow study follows barium-containing foods and liquids during swallowing; FEES uses an endoscope to view swallowing in the throat.", citationIDs: ["bedside_evidence_swallow"])
            ]),
            .bullets(title: "Symptoms worth communicating", [
                AttributedBullet("Swallowing concerns include coughing or choking with eating, a wet or gurgling voice, food sticking, and unexplained weight loss. Testing helps the team identify the problem and choose an appropriate plan. Symptoms and the patient’s history contribute to interpretation.", citationIDs: ["bedside_evidence_swallow"])
            ]),
            .bullets(title: "Do not overextend the evidence", [
                AttributedBullet("The review addressed hydration and intake, not proof of reduced aspiration pneumonia. Included populations and methods varied. Its findings do not authorize changing a prescribed consistency or introducing a free-water protocol without the swallowing team’s assessment.", citationIDs: ["bedside_evidence_hydration"])
            ]),
            .bullets(title: "Prepare for an individualized assessment", [
                AttributedBullet("The evaluating clinician provides test-specific preparation instructions. A list of swallowing symptoms and a complete medication history can help the assessment. Do not assume every dysphagia test requires the same fasting or medication changes.", citationIDs: ["bedside_evidence_swallow"])
            ]),
            .bullets(title: "Continue review when concerns persist", [
                AttributedBullet("The authors emphasize close monitoring of fluid volume because intake can remain low. The clinical plan should account for whether recommended fluids are actually accepted and consumed; an order and a completed hydration assessment are different things.", citationIDs: ["bedside_evidence_hydration"])
            ]),
            .bullets(title: "Keep screening and treatment decisions connected", [
                AttributedBullet("Follow-up testing may distinguish problems with chewing, initiating a swallow or passage through the esophagus. Referral can involve speech-language pathology or another relevant specialist. The appropriate assessment depends on where the suspected problem occurs, rather than on one symptom alone.", citationIDs: ["bedside_evidence_swallow"])
            ])
        ],
        citations: [BedsideEvidenceSources.hydration, BedsideEvidenceSources.swallow],
        lastSourceFidelityReview: "2026-09-19"
    )
}

public enum EvidenceDischargeCommunicationEvidenceSample {
    public static let entry = ReferenceEntry(
        id: "discharge-communication-evidence", title: "Discharge communication: a usable transition plan",
        subtitle: "Medication access, pending results, follow-up and readmission evidence", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Why the handoff needs more than paperwork", [
                AttributedBullet("The RED toolkit distinguishes the patient’s after-hospital plan from the clinical discharge summary. The patient-facing plan explains what happens next; the summary communicates the hospital course to clinicians. Both need to support the transition.", citationIDs: ["bedside_evidence_red"])
            ]),
            .bullets(title: "Study population and finding", [
                AttributedBullet("Becker and colleagues included 60 randomized trials in a 2021 review. Nineteen trials with 3,953 participants contributed to the readmission analysis. Communication interventions were associated with lower readmissions: risk ratio 0.69, 95% confidence interval 0.56–0.84.", citationIDs: ["bedside_evidence_discharge"])
            ]),
            .bullets(title: "Make follow-up achievable", [
                AttributedBullet("Confirm appointment details, preparation and transportation with the patient. Identify pending tests and who will review the results. Arrange required services and equipment with the discharge team, and clarify the contact route when a problem arises.", citationIDs: ["bedside_evidence_red"])
            ]),
            .bullets(title: "Make the medication plan usable", [
                AttributedBullet("Review the final medication plan with the patient and resolve access barriers, including cost or obtaining supplies. Explain changes and address concerns. Caregivers who will help at home need appropriate involvement in the teaching.", citationIDs: ["bedside_evidence_red"])
            ]),
            .bullets(title: "Separate a program result from a single technique", [
                AttributedBullet("Trials tested varied approaches, including medication counseling, disease education and communication techniques. The pooled result does not identify one universally best script or establish that handing over written instructions alone produces the same effect. Some trials had high or unclear risk of bias.", citationIDs: ["bedside_evidence_discharge"])
            ]),
            .bullets(title: "Check understanding and close the handoff", [
                AttributedBullet("Use the patient’s explanation of the plan to identify misunderstandings. Language assistance and clear written material support teaching. Communicate the plan to the clinicians accepting care so that follow-up is connected to the hospital decisions.", citationIDs: ["bedside_evidence_red"])
            ]),
            .bullets(title: "Read the outcome accurately", [
                AttributedBullet("Observed readmission proportions were 9.1% in intervention groups and 13.5% in controls. These are pooled study observations, not an individual forecast. Better adherence and satisfaction were also reported; the source does not prove every readmission is preventable.", citationIDs: ["bedside_evidence_discharge"])
            ]),
            .bullets(title: "Identify the barriers before discharge", [
                AttributedBullet("The discharge educator works with the multidisciplinary team to identify service gaps and practical barriers. A follow-up appointment is not an effective plan if the patient cannot get there or does not know the required preparation.", citationIDs: ["bedside_evidence_red"])
            ]),
            .bullets(title: "Match the time frame", [
                AttributedBullet("The review’s main patient-relevant outcomes were assessed around 30 days after discharge. Results from those trials should not be relabeled as long-term effectiveness. Differences in underlying illnesses and intervention content limit transfer of one pooled estimate to every service.", citationIDs: ["bedside_evidence_discharge"])
            ])
        ],
        citations: [BedsideEvidenceSources.red, BedsideEvidenceSources.discharge],
        lastSourceFidelityReview: "2026-09-19"
    )
}

public enum EvidenceTeachBackAndShowMeEvidenceSample {
    public static let entry = ReferenceEntry(
        id: "teach-back-and-show-me-evidence", title: "Teach-back and show-me: checking understanding",
        subtitle: "A repeatable teaching cycle with implementation evidence", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Use a teaching check, not a memory test", [
                AttributedBullet("Teach-back asks the person to explain the plan in their own words. It checks the clarity of the explanation. A yes-or-no question about understanding cannot show how the person will carry out the plan.", citationIDs: ["bedside_evidence_teach"])
            ]),
            .bullets(title: "What the review included", [
                AttributedBullet("Talevski and colleagues reviewed 20 studies across varied populations and settings. Four were rated high quality, nine moderate and seven weak. Nineteen reported a benefit on at least one outcome, but the different outcomes cannot be combined into one universal effect size.", citationIDs: ["bedside_evidence_teach_study"])
            ]),
            .bullets(title: "Teach in small parts", [
                AttributedBullet("Explain a manageable portion of information, invite the person’s explanation, clarify gaps using different wording, and check again before adding more. Written material can remain available; verbatim reading does not demonstrate understanding.", citationIDs: ["bedside_evidence_teach"])
            ]),
            .bullets(title: "Match the check to the task", [
                AttributedBullet("For a practical skill, ask for a demonstration using the relevant equipment or teaching materials. Show-me can uncover difficulties that a correct verbal answer misses. Supportive wording keeps responsibility for clear teaching with the clinician.", citationIDs: ["bedside_evidence_teach"])
            ]),
            .bullets(title: "What implementation evidence adds", [
                AttributedBullet("Training, clinician support, audits and feedback were common implementation strategies. Reporting was incomplete, so the review could not determine a single best strategy for embedding teach-back. Describing the method in a policy is different from knowing whether staff use it consistently.", citationIDs: ["bedside_evidence_teach_study"])
            ]),
            .bullets(title: "Build repeatable practice", [
                AttributedBullet("AHRQ describes staff training, coaching by experienced colleagues and observation with feedback. Teach-back can be used by clinical and nonclinical staff, including when explaining appointment preparation. Practice helps the approach become familiar.", citationIDs: ["bedside_evidence_teach"])
            ]),
            .bullets(title: "Avoid overstating the results", [
                AttributedBullet("Studies assessed knowledge, recall, self-care and selected health outcomes. The mix of designs and variable quality limits causal certainty and generalization. A successful teach-back confirms current understanding; it does not by itself prove later adherence or guarantee fewer admissions.", citationIDs: ["bedside_evidence_teach_study"])
            ]),
            .bullets(title: "Check delivery as well as results", [
                AttributedBullet("Only half of included studies described implementation strategies. The review distinguished whether teach-back was delivered from what outcomes were measured. That reporting gap makes it difficult to explain why a successful local approach would reproduce its results elsewhere.", citationIDs: ["bedside_evidence_teach_study"])
            ]),
            .bullets(title: "Use the patient’s words", [
                AttributedBullet("AHRQ recommends changing the explanation when a misunderstanding appears, then inviting another explanation. Simply asking someone to repeat the clinician’s wording can conceal uncertainty. The check belongs throughout teaching, not only after a long set of instructions.", citationIDs: ["bedside_evidence_teach"])
            ])
        ],
        citations: [BedsideEvidenceSources.teach, BedsideEvidenceSources.teach_study],
        lastSourceFidelityReview: "2026-09-19"
    )
}

public enum EvidenceMedicationReconciliationTransitionEvidenceSample {
    public static let entry = ReferenceEntry(
        id: "medication-reconciliation-transition-evidence", title: "Medication reconciliation across transitions",
        subtitle: "A shared list, defined responsibility and discrepancy evidence", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Establish a shared medication record", [
                AttributedBullet("MATCH recommends a centrally available medication list that physicians, nurses and pharmacists use together. Reliable new information should update that record with an audit trail. Parallel lists that disagree undermine subsequent ordering and discharge decisions.", citationIDs: ["bedside_evidence_match"])
            ]),
            .bullets(title: "What MARQUIS2 studied", [
                AttributedBullet("MARQUIS2 was a quality-improvement study at 18 North American hospitals or hospital systems. It combined a refined toolkit with mentored implementation. Investigators sampled 4,947 patients before and after implementation; it was not an individually randomized medication trial.", citationIDs: ["bedside_evidence_marquis"])
            ]),
            .bullets(title: "What changed", [
                AttributedBullet("Unintentional discrepancies declined from 2.85 to 0.98 per patient over the intervention. Interrupted time-series analysis at 17 sites estimated an adjusted incidence rate ratio of 0.95 per month, with a 95% confidence interval of 0.93–0.97, beyond baseline temporal trends.", citationIDs: ["bedside_evidence_marquis"])
            ]),
            .bullets(title: "Assign responsibility for the transition", [
                AttributedBullet("Define who obtains and verifies the medication history, reconciles orders, resolves discrepancies and teaches the final plan. Integrate those responsibilities into admission, internal transfer and discharge workflows. The process must fit the actual setting and available staff.", citationIDs: ["bedside_evidence_match"])
            ]),
            .bullets(title: "Include the patient and caregiver", [
                AttributedBullet("Educate patients and caregivers about their part in reconciliation. Make information sources and verification visible within the shared workflow. Electronic reminders can support the process, but a populated record still needs confirmation that its information is accurate and complete.", citationIDs: ["bedside_evidence_match"])
            ]),
            .bullets(title: "Know what this outcome does not prove", [
                AttributedBullet("The primary outcome was medication discrepancies, not a demonstrated reduction in mortality. Secular changes and differences between sites may influence a before-and-after study. The association supports further implementation work but does not isolate the effect of one toolkit component.", citationIDs: ["bedside_evidence_marquis"])
            ]),
            .bullets(title: "Carry verified information forward", [
                AttributedBullet("The shared list is the reference point for ordering and the discharge regimen. New information discovered by one discipline should be available to the others. Reconciliation requires communicating and resolving differences, not simply copying the prior list.", citationIDs: ["bedside_evidence_match"])
            ]),
            .bullets(title: "Interpret the adjusted change", [
                AttributedBullet("The monthly estimate came from an interrupted time-series model, not a 5-percentage-point fall in a patient’s medication risk. Patient-level interventions and system changes occurred together, and associations became stronger as implementation progressed.", citationIDs: ["bedside_evidence_marquis"])
            ]),
            .bullets(title: "Make the workflow consistent", [
                AttributedBullet("MATCH describes electronic, paper and hybrid approaches. The central requirements are a shared record, clear responsibilities and a process that clinicians can follow during routine work. Software availability alone does not complete those responsibilities.", citationIDs: ["bedside_evidence_match"])
            ])
        ],
        citations: [BedsideEvidenceSources.match, BedsideEvidenceSources.marquis],
        lastSourceFidelityReview: "2026-09-19"
    )
}

public enum EvidencePostDischargeFollowUpEvidenceSample {
    public static let entry = ReferenceEntry(
        id: "post-discharge-follow-up-evidence", title: "Post-discharge calls: follow-up and evidence",
        subtitle: "Medication barriers, unresolved needs and what one call can achieve", eyebrow: "REFERENCE · BEDSIDE EVIDENCE",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
        sections: [
            .bullets(title: "Know the evidence question", [
                AttributedBullet("A 2024 VA evidence synthesis examined contact within the first 7 days after an acute medical hospitalization. It included 13 studies, of which 11 were randomized trials. Most interventions were a single telephone contact in the first 3 days.", citationIDs: ["bedside_evidence_contacts"])
            ]),
            .bullets(title: "What the review found", [
                AttributedBullet("Brief post-discharge contact did not reduce 30-day readmission or emergency-department use compared with usual care in the pooled analysis. Certainty was moderate. Evidence for improved satisfaction was limited; a completed phone call should not be presented as proven prevention of readmission.", citationIDs: ["bedside_evidence_contacts"])
            ]),
            .bullets(title: "Prepare from the actual handoff", [
                AttributedBullet("RED’s follow-up guidance recommends reviewing the discharge summary, after-hospital plan and educator’s notes before calling. Resolve conflicting medication lists with the responsible team. Confirm language needs and access to an interpreter instead of assuming a telephone conversation will be understood.", citationIDs: ["bedside_evidence_call"])
            ]),
            .bullets(title: "Ask about implementation at home", [
                AttributedBullet("Review changes in health, how medications are actually being taken, appointments and whether home services or equipment arrived. Invite discussion of costs, side effects and confusing instructions. Use the patient’s explanation to clarify understanding of the existing plan.", citationIDs: ["bedside_evidence_call"])
            ]),
            .bullets(title: "Escalate and communicate unresolved needs", [
                AttributedBullet("New or worsening symptoms require the appropriate clinical triage pathway. Medication discrepancies and service gaps should be communicated to the responsible clinician or team. The caller’s role includes follow-through and documenting the issue and response in the clinical record.", citationIDs: ["bedside_evidence_call"])
            ]),
            .bullets(title: "Keep the populations separate", [
                AttributedBullet("No included study focused on acute psychiatric hospitalization. These findings therefore do not answer whether a specific mental-health follow-up intervention prevents harm after psychiatric discharge. Most studies tested brief contact, not a prolonged transitional-care program.", citationIDs: ["bedside_evidence_contacts"])
            ]),
            .bullets(title: "Evaluate the purpose of the contact", [
                AttributedBullet("Implementation details were poorly reported in the underlying studies. The review does not prove that every follow-up model is ineffective, or identify the best content for every patient. Readmission, emergency use, satisfaction and resolution of practical problems are different outcomes.", citationIDs: ["bedside_evidence_contacts"])
            ]),
            .bullets(title: "Close the loop after the call", [
                AttributedBullet("RED describes sending the receiving clinician a summary of the call, including concerns, actions and medication issues, and involving other care-team members where needed. Identifying a barrier is only part of the handoff; responsibility for resolving it must be clear.", citationIDs: ["bedside_evidence_call"])
            ])
        ],
        citations: [BedsideEvidenceSources.contacts, BedsideEvidenceSources.call],
        lastSourceFidelityReview: "2026-09-19"
    )
}

extension ContentRegistry {
    static func bundledBedsideEvidence() -> [LibraryEntry] {
        [
            .reference(EvidenceDeliriumPreventionWardCareSample.entry),
            .reference(EvidenceInpatientFallsPreventionEvidenceSample.entry),
            .reference(EvidencePressureInjuryRepositioningEvidenceSample.entry),
            .reference(EvidenceDysphagiaHydrationEvidenceSample.entry),
            .reference(EvidenceDischargeCommunicationEvidenceSample.entry),
            .reference(EvidenceTeachBackAndShowMeEvidenceSample.entry),
            .reference(EvidenceMedicationReconciliationTransitionEvidenceSample.entry),
            .reference(EvidencePostDischargeFollowUpEvidenceSample.entry)
        ]
    }
}
