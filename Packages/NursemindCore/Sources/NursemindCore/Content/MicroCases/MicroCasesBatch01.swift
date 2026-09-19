import Foundation

private typealias S = MicroCaseSources

/// Batch 01 — 2026-09-18 … 2026-10-02. Derived from the library's scenario
/// entries (failure to rescue, sepsis, hand-off, hypoglycemia, opioid
/// oversedation, seizure, stroke, falls, hyperkalemia, PE, anaphylaxis,
/// delirium, PPH, neutropenic fever, chest drain). Pending Tier A review.
enum MicroCasesBatch01 {
    static let cases: [MicroCase] = [
        MicroCase(
            id: "case-trend-not-threshold",
            title: "The numbers are still in range",
            population: .adult,
            step: .recognizeCues,
            stem: "Post-op day two after an open colectomy, a 68-year-old man on your med-surg unit has been anxious since the start of the night. He describes vague abdominal discomfort. Each vital sign you have charted over the last four hours sits inside the unit's call-the-provider criteria.",
            cues: [
                "Heart rate has climbed from 88 to 116 across four sets of vitals.",
                "Respiratory rate has risen from 16 to 24.",
                "He is restless and keeps asking whether something is wrong.",
                "Blood pressure is unchanged from his baseline so far."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Document the vitals and reassess at the next scheduled check, since none meets the call criteria.",
                      rationale: "Thresholds catch a single abnormal number; they miss a trajectory. Four consecutive rises in heart and respiratory rate are the pattern that precedes failure to rescue, and waiting for a threshold trades away the window in which escalation prevents arrest.",
                      citationIDs: [S.ahrqTeamSTEPPS.id, S.ahrqPSNet.id]),
                .init("Call the surgeon now and describe the trend, using CUS language to state your concern.",
                      rationale: "A rising trend across several sets of vitals is itself a change in status. TeamSTEPPS situation monitoring and the CUS tool exist so a nurse can escalate on concern before any single criterion is met. The surgeon needs the trajectory, not the last reading.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Offer a dose of his ordered pain medication and reassess in an hour.",
                      rationale: "Anchoring the change on expected post-operative pain is exactly the cognitive bias in the original case. Treating the discomfort without escalating the trend delays recognition of an anastomotic leak or early sepsis.",
                      citationIDs: [S.ahrqPSNet.id]),
                .init("Ask the charge nurse to take a look at the end of the shift.",
                      rationale: "A charge nurse consult is a reasonable low-threshold step, but deferring it to the end of the shift ignores the pace of deterioration. If you involve the charge nurse, do it now and in parallel with the provider call.",
                      citationIDs: [S.ahrqTeamSTEPPS.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Trust the trend, not the threshold.",
            relatedEntryIDs: ["scenario:failure-to-rescue-scenario", "communication:cus-assertive", "diagnosis:sepsis"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
            reviewTier: .tierA,
            publishOn: "2026-09-18",
            citations: [S.ahrqTeamSTEPPS, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-not-herself",
            title: "\"She's not herself\"",
            population: .adult,
            step: .analyzeCues,
            stem: "An 82-year-old woman is on day two of antibiotics for community-acquired pneumonia. Her daughter stops you in the hall: her mother is confused and quieter than usual. Vitals are within the unit's criteria. Her admission blood pressure was noticeably higher than today's.",
            cues: [
                "Temperature is only slightly elevated.",
                "Blood pressure is lower than her admission baseline while still in the normal range.",
                "Oxygen saturation is borderline on the supplemental oxygen she was already wearing.",
                "Family reports new confusion; she was oriented yesterday."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Mild somnolence is expected with a hospital stay at her age; continue routine care.",
                      rationale: "Attributing new confusion to age or hospitalization is the most common way early sepsis is missed in older adults, who often present without fever. Routine care here is the delayed recognition the CDC campaign warns about.",
                      citationIDs: [S.cdcSepsis.id]),
                .init("New confusion plus a known infection and a drop from her own baseline is a sepsis screen until proven otherwise.",
                      rationale: "Older adults frequently show sepsis as altered mental status rather than fever, and a fall from personal baseline matters more than an absolute threshold. Screening and escalating now is what shortens time to the bundle.",
                      citationIDs: [S.cdcSepsis.id, S.ahrqTeamSTEPPS.id]),
                .init("The pneumonia is being treated; the confusion is most likely a medication side effect.",
                      rationale: "Medication effects belong on the differential, but the combination of infection, confusion and a slipping blood pressure is too dangerous to explain away before it is screened.",
                      citationIDs: [S.cdcSepsis.id]),
                .init("Her oxygen saturation is acceptable, so the respiratory picture is stable.",
                      rationale: "A borderline saturation on oxygen she was not previously needing is worsening gas exchange, not stability. Reading the number without the oxygen it took to get there hides the change.",
                      citationIDs: [S.cdcSepsis.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Family baseline beats facility thresholds.",
            relatedEntryIDs: ["diagnosis:sepsis", "scenario:sepsis-recognition-scenario", "lab:lactate"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
            reviewTier: .tierA,
            publishOn: "2026-09-19",
            citations: [S.cdcSepsis, S.ahrqTeamSTEPPS]
        ),

        MicroCase(
            id: "case-handoff-missing-trend",
            title: "Numbers without a story",
            population: .adult,
            step: .takeAction,
            stem: "You are giving report on a patient whose heart rate has drifted upward all shift while every reading stayed inside normal limits. The oncoming nurse is reading the flowsheet on the screen as you talk.",
            cues: [
                "Heart rate: 78, 86, 94, 102 across the shift.",
                "The patient asked twice whether his surgeon had been called.",
                "You have not spoken with the provider.",
                "The oncoming nurse has six patients and is moving quickly."
            ],
            prompt: "How should the nurse hand this patient off?",
            options: [
                .init("Point to the flowsheet; the numbers speak for themselves.",
                      rationale: "Discrete readings on a flowsheet do not communicate a trajectory. Hand-off failures in AHRQ case reviews are commonly a trend that was visible but never verbalized.",
                      citationIDs: [S.ahrqTeamSTEPPS.id, S.ahrqPSNet.id]),
                .init("Give a structured SBAR in which the Assessment names the upward trend and the Recommendation is a provider call this hour.",
                      rationale: "SBAR forces the trend into words and ends with what should happen next. Naming the assessment as a trend, and the recommendation as a call with a time, is the difference between a hand-off and a data dump.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Mention that he seems a little anxious and move on to the next patient.",
                      rationale: "Reducing a physiologic trend to a mood observation drops the most important information. The next nurse inherits a patient without the reason to watch him.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Leave a note in the chart so the oncoming nurse can read it later.",
                      rationale: "Written notes are not a substitute for verbal hand-off of a deteriorating trend. The oncoming nurse may not read the note before the next set of vitals.",
                      citationIDs: [S.ahrqPSNet.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Hand off the trend, not the snapshot.",
            relatedEntryIDs: ["communication:sbar", "scenario:handoff-failure-scenario"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-09-20",
            citations: [S.ahrqTeamSTEPPS, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-npo-and-shaky",
            title: "NPO since midnight",
            population: .adult,
            step: .prioritizeHypotheses,
            stem: "A 54-year-old man with type 2 diabetes is NPO for a late-morning procedure. He received his usual morning diabetes medication from the night nurse before the NPO order was clarified. At 0930 he tells you he feels shaky and sweaty.",
            cues: [
                "Diaphoretic, tremulous, mildly irritable.",
                "Heart rate is faster than his earlier reading.",
                "He has had nothing by mouth since midnight.",
                "The procedure is scheduled in ninety minutes."
            ],
            prompt: "What is the nurse's priority?",
            options: [
                .init("Check a fingerstick glucose now and treat per the unit's hypoglycemia protocol if it is low.",
                      rationale: "Shakiness, sweating and tachycardia in a fasting patient who received glucose-lowering medication are hypoglycemia until a glucose says otherwise. Checking and treating per protocol is the priority; the procedure can be renegotiated afterward.",
                      citationIDs: [S.niddkHypoglycemia.id, S.openrnPharmacology.id]),
                .init("Reassure him that pre-procedure anxiety is common and offer a warm blanket.",
                      rationale: "Anxiety can look similar, but the fasting state and the medication history make hypoglycemia the dangerous explanation. Reassurance without a glucose reading risks a seizure or loss of consciousness.",
                      citationIDs: [S.niddkHypoglycemia.id]),
                .init("Call the procedure area to ask whether he can go early.",
                      rationale: "Moving the procedure up does not address a possible low glucose and may put a hypoglycemic patient under sedation.",
                      citationIDs: [S.niddkHypoglycemia.id]),
                .init("Hold all further diabetes medications and document the symptoms.",
                      rationale: "Holding future doses is sensible, but it is not the first step: the medication he already received is the problem, and only a glucose check and treatment address it.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "NPO plus diabetes medication equals check glucose.",
            relatedEntryIDs: ["diagnosis:hypoglycemia", "lab:glucose", "scenario:hypoglycemia-npo-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .glucoseRegulation),
            reviewTier: .tierA,
            publishOn: "2026-09-21",
            citations: [S.niddkHypoglycemia, S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-hard-to-rouse",
            title: "Hard to rouse",
            population: .adult,
            step: .takeAction,
            stem: "Two hours after a scheduled opioid for post-operative pain, a 71-year-old woman is difficult to wake. She opens her eyes to her name, answers in a word, and drifts off mid-sentence. Her pain score before the dose was high.",
            cues: [
                "Respiratory rate is slower than her baseline and breaths are shallow.",
                "Pupils are small.",
                "Oxygen saturation is drifting down on room air.",
                "She had a second sedating medication earlier in the shift."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Stimulate her, apply oxygen, stay with her, and prepare for naloxone per the standing order while calling the rapid response team.",
                      rationale: "Excessive sedation with slowed, shallow breathing after an opioid is respiratory depression. Stimulation, oxygen, continuous presence and readiness to reverse are the immediate actions; escalation follows in the same minute.",
                      citationIDs: [S.cdcOverdose.id, S.openrnPharmacology.id]),
                .init("Let her sleep; she was in significant pain and finally has relief.",
                      rationale: "Sedation is not the same as comfort. Somnolence with a falling respiratory rate is the warning sign that precedes apnea, and it is most dangerous in older adults and with a second sedative on board.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Hold the next opioid dose and document the sedation score.",
                      rationale: "Holding the next dose is necessary but it is not a first action; the dose already given is depressing her breathing now.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Recheck her vitals in thirty minutes to see whether the sedation is wearing off.",
                      rationale: "Waiting thirty minutes with a slowing respiratory rate is the interval in which respiratory arrest occurs. The trend demands action now.",
                      citationIDs: [S.cdcOverdose.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Sedation before respiratory depression; act at sedation.",
            relatedEntryIDs: ["drug:naloxone", "scenario:opioid-oversedation-scenario", "drug:hydromorphone"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-09-22",
            citations: [S.cdcOverdose, S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-seizure-in-bed",
            title: "Generalized seizure in bed",
            population: .adult,
            step: .takeAction,
            stem: "A 34-year-old man admitted for medication adjustment of known epilepsy begins a generalized tonic-clonic seizure in bed. The side rails are up. A family member in the room is frightened and reaches for his mouth to protect his tongue.",
            cues: [
                "Rhythmic jerking of all four limbs.",
                "Lips are dusky; breathing is irregular during the convulsion.",
                "You do not know when it started; the family says \"just now.\"",
                "Nothing is in his mouth."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Stop the family member, note the time, turn him onto his side, and clear the space around him.",
                      rationale: "Seizure first aid is time, side-lying to protect the airway, and a clear space. Nothing goes in the mouth; a bitten tongue heals, an obstructed airway does not.",
                      citationIDs: [S.cdcSeizure.id, S.openrnSkills.id]),
                .init("Hold his limbs still so he does not injure himself.",
                      rationale: "Restraining a convulsing patient causes injury to both of you and does not shorten the seizure.",
                      citationIDs: [S.cdcSeizure.id]),
                .init("Insert an oral airway to protect his tongue.",
                      rationale: "Forcing anything into the mouth during a convulsion breaks teeth and obstructs the airway. This is the intervention the family member was about to attempt.",
                      citationIDs: [S.cdcSeizure.id]),
                .init("Leave to get the emergency medication from the medication room.",
                      rationale: "Leaving the patient alone during a convulsion abandons airway protection. Call for help and medication from the bedside; the timing you note is what determines whether rescue medication is warranted.",
                      citationIDs: [S.cdcSeizure.id, S.openrnSkills.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Time it, turn them, clear the space.",
            relatedEntryIDs: ["diagnosis:status-epilepticus", "scenario:seizure-response-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
            reviewTier: .tierA,
            publishOn: "2026-09-23",
            citations: [S.cdcSeizure, S.openrnSkills]
        ),

        MicroCase(
            id: "case-face-arm-speech",
            title: "Slurred words at lunch",
            population: .adult,
            step: .recognizeCues,
            stem: "A 76-year-old woman admitted for heart failure management is eating lunch when her roommate calls out. The patient's speech is suddenly slurred and she is holding her spoon awkwardly. She insists she is fine and wants to finish eating.",
            cues: [
                "The right side of her mouth droops when she speaks.",
                "Her right arm drifts downward when she holds both arms out.",
                "She was speaking normally at the morning assessment.",
                "She has atrial fibrillation on her problem list."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Note the time she was last seen normal, stop the meal, and activate the stroke response.",
                      rationale: "Face droop, arm drift and speech change are the classic signs, and the time last known well determines eligibility for time-critical treatment. Stopping oral intake protects an airway that may no longer be safe.",
                      citationIDs: [S.nindsStroke.id]),
                .init("Let her finish eating and reassess after lunch.",
                      rationale: "Every minute of delay costs brain tissue, and a patient with new speech and facial changes is at risk of aspiration with each bite.",
                      citationIDs: [S.nindsStroke.id]),
                .init("Check a fingerstick glucose and wait for the result before doing anything else.",
                      rationale: "Glucose is part of the stroke workup, but it is checked alongside activation, not before it. Waiting serially on a single test delays the team.",
                      citationIDs: [S.nindsStroke.id]),
                .init("Ask her to rest and call the provider at the end of rounds.",
                      rationale: "A stroke response is an emergency activation, not a routine provider notification.",
                      citationIDs: [S.nindsStroke.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Last known well, then activate.",
            relatedEntryIDs: ["diagnosis:stroke"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-09-24",
            citations: [S.nindsStroke]
        ),

        MicroCase(
            id: "case-found-on-the-floor",
            title: "Found on the floor",
            population: .adult,
            step: .takeAction,
            stem: "You answer a call light and find an 84-year-old woman sitting on the floor beside her bed. She says she was reaching for her water and slid. She is alert, embarrassed, and asking you to help her up before anyone sees.",
            cues: [
                "She takes a blood thinner for atrial fibrillation.",
                "She rubs the back of her head but denies pain.",
                "Her legs look symmetric; she moves them on request.",
                "Bed alarm was off; the call light was out of reach."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Help her up quickly to spare her embarrassment and do a full assessment in bed.",
                      rationale: "Moving a patient before assessing for injury can worsen a fracture or spinal injury. Dignity matters, but assessment comes first, on the floor.",
                      citationIDs: [S.ahrqFalls.id]),
                .init("Assess her where she is, including head, neck, hips and pain, before any movement; then move her with help and notify the provider.",
                      rationale: "Post-fall assessment happens before repositioning. On an anticoagulant, a head strike raises the concern for intracranial bleeding even without pain, which changes the urgency of provider notification and monitoring.",
                      citationIDs: [S.ahrqFalls.id, S.cdcSTEADI.id]),
                .init("Call for a lift team and file the incident report before touching her.",
                      rationale: "A lift team is appropriate for the move itself, and the report matters, but neither replaces an immediate injury assessment.",
                      citationIDs: [S.ahrqFalls.id]),
                .init("Ask her to stand on her own to see whether she can bear weight.",
                      rationale: "Asking an unassessed patient to stand risks a second fall and worsens any hip injury.",
                      citationIDs: [S.ahrqFalls.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Assess on the floor before you lift.",
            relatedEntryIDs: ["scenario:falls-prevention-scenario", "scenario:anticoag-head-injury-scenario"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-09-25",
            citations: [S.ahrqFalls, S.cdcSTEADI]
        ),

        MicroCase(
            id: "case-peaked-t-waves",
            title: "The tall, pointed T waves",
            population: .adult,
            step: .analyzeCues,
            stem: "A 59-year-old man with end-stage kidney disease missed his dialysis session yesterday. On your morning assessment he reports generalized weakness and a strange tingling around his mouth. You place him on the monitor.",
            cues: [
                "Tall, narrow, peaked T waves on the strip.",
                "Heart rate is slower than his baseline.",
                "He has not urinated since admission.",
                "A morning potassium result is pending."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Wait for the potassium result before notifying anyone; the strip could be a lead placement artifact.",
                      rationale: "Peaked T waves with a missed dialysis session and weakness are treated as hyperkalemia before the lab confirms it. Waiting for a number while the rhythm is changing risks a lethal arrhythmia.",
                      citationIDs: [S.openrnHealthAlterations.id, S.niddkKidney.id]),
                .init("Notify the provider immediately with the strip findings and the missed dialysis, keep him on continuous monitoring, and check that emergency medications are available.",
                      rationale: "ECG changes are the trigger for urgent treatment of hyperkalemia; the nurse's job is fast escalation, continuous monitoring and readiness. The provider decides the treatment.",
                      citationIDs: [S.openrnHealthAlterations.id, S.niddkKidney.id]),
                .init("Encourage him to eat breakfast to help his weakness.",
                      rationale: "Dietary potassium in a patient who cannot clear it worsens the problem, and food is beside the point when the rhythm is changing.",
                      citationIDs: [S.niddkKidney.id]),
                .init("Give his scheduled morning potassium supplement since the level is unknown.",
                      rationale: "Any potassium-containing medication is held and verified when hyperkalemia is suspected; giving it is the error the case exists to prevent.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Peaked T waves are the lab result.",
            relatedEntryIDs: ["diagnosis:hyperkalemia", "lab:potassium", "scenario:hyperkalemia-ekg-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes),
            reviewTier: .tierA,
            publishOn: "2026-09-26",
            citations: [S.openrnHealthAlterations, S.niddkKidney]
        ),

        MicroCase(
            id: "case-sudden-breathless",
            title: "Sudden breathlessness on day three",
            population: .adult,
            step: .prioritizeHypotheses,
            stem: "A 62-year-old woman three days after a hip replacement becomes suddenly short of breath while sitting in the chair. She is anxious and says her chest hurts when she breathes in. She has declined her injections to prevent clots since surgery.",
            cues: [
                "Respiratory rate and heart rate have both jumped in the last ten minutes.",
                "Oxygen saturation has dropped from her baseline on room air.",
                "One calf is warmer and larger than the other.",
                "Lung sounds are clear."
            ],
            prompt: "Which possibility must the nurse act on first?",
            options: [
                .init("Post-operative anxiety; coach slow breathing and reassess.",
                      rationale: "Anxiety does not drop oxygen saturation or produce a unilateral swollen calf. Treating this as anxiety is the delay that turns a pulmonary embolism fatal.",
                      citationIDs: [S.nhlbiVTE.id]),
                .init("Pulmonary embolism; apply oxygen, keep her still, and escalate immediately.",
                      rationale: "Sudden dyspnea, pleuritic chest pain, tachycardia and a falling saturation after orthopedic surgery, with declined clot prophylaxis and a swollen calf, are the textbook picture of PE. Oxygen, rest and immediate escalation come before any test.",
                      citationIDs: [S.nhlbiVTE.id, S.openrnHealthAlterations.id]),
                .init("Atelectasis; encourage incentive spirometry and ambulation.",
                      rationale: "Atelectasis is common after surgery but does not produce sudden pleuritic pain with a swollen calf, and ambulating a patient with a possible embolus is unsafe until it is evaluated.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Pain from the surgical site; give the ordered analgesic and reassess in an hour.",
                      rationale: "Chest pain on inspiration is not hip pain. Analgesia and an hour's wait ignore the falling saturation.",
                      citationIDs: [S.nhlbiVTE.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Sudden dyspnea after surgery: think embolus first.",
            relatedEntryIDs: ["diagnosis:pulmonary-embolism", "scenario:pe-scenario", "drug:enoxaparin"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-09-27",
            citations: [S.nhlbiVTE, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-new-antibiotic-hives",
            title: "Five minutes into the new antibiotic",
            population: .adult,
            step: .takeAction,
            stem: "A 45-year-old man is receiving the first dose of a new intravenous antibiotic. Five minutes in, he says his lips feel tingly and his chest feels tight. You see hives spreading on his neck and arms.",
            cues: [
                "Audible wheeze when he speaks.",
                "Voice sounds hoarse and he is swallowing repeatedly.",
                "Heart rate is rising; he looks frightened.",
                "The infusion is still running."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Stop the infusion, call for help, and prepare to give epinephrine per the anaphylaxis order set while keeping the airway under continuous observation.",
                      rationale: "Hives with airway symptoms during a new drug is anaphylaxis. Stopping the trigger and readying epinephrine, the first-line treatment, are simultaneous first actions; hoarseness and swallowing signal the airway is closing.",
                      citationIDs: [S.niaidAnaphylaxis.id, S.openrnPharmacology.id]),
                .init("Slow the infusion rate and give the ordered antihistamine.",
                      rationale: "Slowing the drug keeps the trigger running, and antihistamines treat itch, not airway swelling. Neither addresses a reaction with wheeze and hoarseness.",
                      citationIDs: [S.niaidAnaphylaxis.id]),
                .init("Sit him up, apply oxygen, and watch whether the hives spread further.",
                      rationale: "Oxygen and positioning help, but observation without stopping the infusion or preparing epinephrine lets a rapidly progressive reaction progress.",
                      citationIDs: [S.niaidAnaphylaxis.id]),
                .init("Call the pharmacy to confirm he has no documented allergy to the drug.",
                      rationale: "The allergy is being documented in front of you. Pharmacy verification comes after the emergency is managed.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Stop the trigger; epinephrine is first-line.",
            relatedEntryIDs: ["diagnosis:anaphylaxis", "drug:epinephrine", "scenario:anaphylaxis-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-09-28",
            citations: [S.niaidAnaphylaxis, S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-pulling-at-lines-overnight",
            title: "Pulling at lines overnight",
            population: .adult,
            step: .analyzeCues,
            stem: "A 79-year-old man admitted for pneumonia was pleasant and oriented on admission two days ago. Tonight he is picking at his IV line, believes he is at his old workplace, and calms for a moment when redirected before drifting again.",
            cues: [
                "Attention comes and goes within the same conversation.",
                "The change began within the last day.",
                "He received a sleep medication last night for the first time.",
                "His daughter says he has never been confused at home."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Sundowning from dementia; apply a soft restraint to protect the IV.",
                      rationale: "A sudden change with fluctuating attention in a patient with no prior confusion is delirium, not dementia, and restraints worsen delirium and injury risk. The daughter's baseline report rules out a chronic process.",
                      citationIDs: [S.niaDelirium.id, S.ahrqPSNet.id]),
                .init("Acute delirium with a likely precipitant: screen for causes, review the new sleep medication with the provider, and use reorientation and family presence.",
                      rationale: "Acute onset, fluctuating course and inattention are the core features of delirium. The nurse's job is to find and report precipitants, of which a new sedating medication and infection are the obvious two, and to keep him safe without restraints.",
                      citationIDs: [S.niaDelirium.id]),
                .init("Normal disorientation from the hospital environment; dim the lights and let him sleep.",
                      rationale: "Hospital disorientation does not explain fluctuating attention and picking at lines. Delirium is a medical event with a cause, and it lengthens stays and raises mortality when it is dismissed.",
                      citationIDs: [S.niaDelirium.id]),
                .init("He is anxious; request a repeat dose of the sleep medication.",
                      rationale: "A sedative-hypnotic is the most likely precipitant. Repeating it deepens the delirium.",
                      citationIDs: [S.niaDelirium.id, S.ahrqPSNet.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Sudden and fluctuating means delirium; find the cause.",
            relatedEntryIDs: ["diagnosis:delirium", "scenario:recognizing-delirium-scenario", "scenario:restraint-safety-scenario"],
            nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .cognition),
            reviewTier: .tierB,
            publishOn: "2026-09-29",
            citations: [S.niaDelirium, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-boggy-fundus",
            title: "Saturating the pad",
            population: .obstetric,
            step: .takeAction,
            stem: "Ninety minutes after a vaginal birth, a 29-year-old woman reports feeling lightheaded when you check on her. The pad you placed thirty minutes ago is saturated and there are clots on the underpad.",
            cues: [
                "Fundus is above the umbilicus and feels soft.",
                "Heart rate is faster than her earlier reading.",
                "She has not urinated since delivery.",
                "Her skin is pale and cool."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Massage the fundus, call for help, and assess bleeding and vitals continuously while the team assembles.",
                      rationale: "A soft, high fundus with heavy bleeding is uterine atony, the leading cause of postpartum hemorrhage. Fundal massage is the immediate nursing action, done while calling for help, and a full bladder is the next thing to fix.",
                      citationIDs: [S.cdcHearHer.id, S.openrnHealthAlterations.id]),
                .init("Change the pad and start timing how quickly the next one saturates.",
                      rationale: "Quantifying blood loss matters, but timing pads while the uterus is not contracting lets the hemorrhage continue.",
                      citationIDs: [S.cdcHearHer.id]),
                .init("Help her to the bathroom to empty her bladder so the uterus can contract.",
                      rationale: "A full bladder does displace the uterus and should be addressed, but walking a lightheaded, tachycardic patient invites a collapse. Empty the bladder in bed after massage and while help is on the way.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Elevate her legs and recheck in fifteen minutes.",
                      rationale: "Positioning does not stop bleeding. Fifteen minutes of atony is a large volume of blood.",
                      citationIDs: [S.cdcHearHer.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Soft fundus, heavy flow: massage and call.",
            relatedEntryIDs: ["diagnosis:postpartum-hemorrhage", "scenario:pph-scenario", "drug:oxytocin"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-09-30",
            citations: [S.cdcHearHer, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-low-grade-fever-chemo",
            title: "A low-grade fever after chemotherapy",
            population: .adult,
            step: .prioritizeHypotheses,
            stem: "A 48-year-old woman ten days after a chemotherapy cycle calls the unit's triage line. She has a low-grade temperature, mild chills, and \"otherwise feels okay.\" Her last blood count showed a very low neutrophil count.",
            cues: [
                "Temperature is only modestly elevated.",
                "She has no cough, no urinary symptoms, no obvious source.",
                "Her most recent neutrophil count was profoundly low.",
                "She would rather wait until morning to avoid the emergency department."
            ],
            prompt: "What is the nurse's priority?",
            options: [
                .init("Advise rest, fluids, and a recheck of temperature in the morning.",
                      rationale: "In a neutropenic patient, a modest fever is often the only sign of a serious infection because there are not enough neutrophils to mount the usual signs. Waiting overnight is the delay that leads to septic shock.",
                      citationIDs: [S.cdcCancerInfection.id, S.cdcSepsis.id]),
                .init("Treat this as neutropenic fever, an emergency: direct her to be evaluated now for cultures and prompt antibiotics.",
                      rationale: "Fever plus neutropenia is an oncologic emergency regardless of how well the patient feels. The absence of a source is expected. Time to antibiotics is what determines outcome.",
                      citationIDs: [S.cdcCancerInfection.id]),
                .init("Suggest an over-the-counter antipyretic and a call back if the fever climbs.",
                      rationale: "Masking the fever removes the only signal she has and does nothing for the infection driving it.",
                      citationIDs: [S.cdcCancerInfection.id]),
                .init("Schedule an outpatient visit for the next available slot.",
                      rationale: "Neutropenic fever is evaluated the same day, not at the next available appointment.",
                      citationIDs: [S.cdcCancerInfection.id, S.cdcSepsis.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Neutropenia turns a low fever into an emergency.",
            relatedEntryIDs: ["diagnosis:neutropenic-fever", "scenario:neutropenic-fever-scenario", "lab:wbc"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
            reviewTier: .tierA,
            publishOn: "2026-10-01",
            citations: [S.cdcCancerInfection, S.cdcSepsis]
        ),

        MicroCase(
            id: "case-chest-drain-disconnects",
            title: "The chest drain comes apart",
            population: .adult,
            step: .takeAction,
            stem: "While repositioning a 66-year-old man with a chest drain for a pneumothorax, the tubing disconnects from the drainage unit and the open end falls onto the bed. He immediately becomes anxious and short of breath.",
            cues: [
                "The open end of the chest tube is exposed to room air.",
                "His breathing is fast and he is guarding the chest.",
                "The drainage unit is intact on the floor.",
                "Oxygen saturation has not yet changed."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Submerge the open end of the tubing in sterile water to restore a water seal while help brings a new unit, and stay with him.",
                      rationale: "A disconnected tube lets air enter the pleural space with each breath. A temporary water seal stops that while a new system is set up, and continuous observation catches a developing tension pneumothorax.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Clamp the chest tube near the chest wall and go get a new drainage unit.",
                      rationale: "Clamping a tube in a patient with an active air leak traps air in the chest and can produce a tension pneumothorax. Clamping is reserved for specific ordered circumstances, not disconnection.",
                      citationIDs: [S.openrnSkills.id, S.ahrqPSNet.id]),
                .init("Reconnect the tubing to the same unit and continue repositioning.",
                      rationale: "The exposed end and the fallen unit are no longer sterile, and reconnecting without checking the system risks contamination and an unrecognized leak.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Apply an occlusive dressing over the insertion site.",
                      rationale: "An occlusive dressing is the response to a tube that has pulled out of the chest, not to tubing that has separated from the drainage unit.",
                      citationIDs: [S.openrnSkills.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Disconnected: water seal. Dislodged: occlusive dressing.",
            relatedEntryIDs: ["procedure:chest-tube-care", "diagnosis:tension-pneumothorax", "scenario:chest-tube-emergency-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-10-02",
            citations: [S.openrnSkills, S.ahrqPSNet]
        ),
    ]
}
