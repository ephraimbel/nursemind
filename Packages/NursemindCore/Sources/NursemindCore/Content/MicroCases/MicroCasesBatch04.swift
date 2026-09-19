import Foundation

private typealias S = MicroCaseSources

/// Batch 04 — 2026-11-02 … 2026-11-16. Pending Tier A review where marked.
enum MicroCasesBatch04 {
    static let cases: [MicroCase] = [
        MicroCase(
            id: "case-three-week-old-fever",
            title: "A three-week-old with a fever",
            population: .neonatal,
            step: .prioritizeHypotheses,
            stem: "A mother calls the pediatric advice line about her 3-week-old, who feels warm and has been feeding less today. A rectal temperature at home was above the normal range. The baby is sleeping more than usual but wakes when handled.",
            cues: [
                "Age under one month.",
                "Feeding roughly half of the usual volume today.",
                "No cough, rash or vomiting reported.",
                "The mother asks whether she can watch overnight and call in the morning."
            ],
            prompt: "What is the nurse's priority?",
            options: [
                .init("Direct the family to emergency evaluation now; a fever in an infant under one month is a potential serious infection regardless of how well the baby looks.",
                      rationale: "Neonates cannot localize or wall off infection, and sepsis or meningitis can present with only fever and poor feeding. Evaluation the same day, not the next, is the standard.",
                      citationIDs: [S.openrnHealthAlterations.id, S.cdcSepsis.id]),
                .init("Advise an antipyretic and a recheck of the temperature in four hours.",
                      rationale: "Masking the fever removes the only sign and delays evaluation of a possibly septic neonate.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Reassure her that fevers are common with growth spurts at this age.",
                      rationale: "There is no benign explanation for fever in a neonate that a nurse can offer over the phone.",
                      citationIDs: [S.cdcSepsis.id]),
                .init("Schedule a clinic visit for the next available appointment.",
                      rationale: "A neonate with fever is seen the same day in a setting that can obtain cultures.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Fever under one month: evaluate today.",
            relatedEntryIDs: ["scenario:neonatal-fever-scenario", "diagnosis:neonatal-sepsis-r13"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
            reviewTier: .tierA,
            publishOn: "2026-11-02",
            citations: [S.openrnHealthAlterations, S.cdcSepsis]
        ),

        MicroCase(
            id: "case-dialysis-morning",
            title: "The morning of dialysis",
            population: .adult,
            step: .generateSolutions,
            stem: "A 64-year-old man on hemodialysis is scheduled for his session in an hour. His morning medications include a blood pressure medication and a water-soluble vitamin. His pre-dialysis blood pressure this morning is on the low side of his usual.",
            cues: [
                "He became lightheaded during his last session.",
                "The dialysis unit removes several liters of fluid each treatment.",
                "The order set does not specify timing relative to dialysis.",
                "The nephrologist rounds after the session."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Verify with the provider whether the antihypertensive should be held until after dialysis, and give the water-soluble vitamin after the session as well.",
                      rationale: "Antihypertensives before dialysis can cause intradialytic hypotension, and water-soluble vitamins are removed by the treatment. Timing relative to dialysis is a verification the nurse raises, not a decision the nurse makes alone.",
                      citationIDs: [S.niddkKidney.id, S.openrnPharmacology.id]),
                .init("Give all morning medications as scheduled; the order says morning.",
                      rationale: "A scheduled time does not account for dialysis. Giving a blood pressure drug before a large fluid removal invites a hypotensive episode.",
                      citationIDs: [S.niddkKidney.id]),
                .init("Hold every medication until the nephrologist rounds.",
                      rationale: "Blanket holding may omit drugs that should be given. Verification is specific, not wholesale.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Give the medications with extra water to help them absorb before the session.",
                      rationale: "Extra fluid in a dialysis patient adds to the volume that must be removed and worsens the hypotension risk.",
                      citationIDs: [S.niddkKidney.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Dialysis day changes the timing question.",
            relatedEntryIDs: ["scenario:dialysis-day-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .fluidElectrolytes),
            reviewTier: .tierB,
            publishOn: "2026-11-03",
            citations: [S.niddkKidney, S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-mother-who-cannot-sleep",
            title: "The mother who has not slept",
            population: .obstetric,
            step: .recognizeCues,
            stem: "At a postpartum check nine days after delivery, a 33-year-old woman tells you she has barely slept, is \"full of energy,\" and has been rearranging the nursery all night. She mentions that the baby has been sending her messages. Her partner looks exhausted and worried.",
            cues: [
                "Rapid, pressured speech.",
                "A belief that the infant is communicating with her.",
                "Days without meaningful sleep.",
                "She denies any intent to harm herself or the baby."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Normal new-parent exhaustion and excitement; encourage rest and a follow-up in two weeks.",
                      rationale: "Pressured speech and a fixed false belief about the infant are psychotic features, not fatigue. Two weeks is far too long.",
                      citationIDs: [S.cdcHearHer.id, S.openrnHealthAlterations.id]),
                .init("Possible postpartum psychosis, a psychiatric emergency; arrange same-day psychiatric evaluation and do not leave her alone with the infant in the meantime.",
                      rationale: "Postpartum psychosis presents within weeks of birth with sleeplessness, mood elevation and delusions, often involving the baby. Denial of intent does not lower the risk; same-day evaluation and continuous supervision are the standard.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Postpartum depression; give her the screening questionnaire and a hotline number.",
                      rationale: "Depression screening does not capture psychosis, and a hotline number is not an adequate plan for a delusional parent with a newborn.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Sleep deprivation; recommend the partner take the night feeds.",
                      rationale: "Sleep would help, but the delusion is the finding that makes this an emergency.",
                      citationIDs: [S.cdcHearHer.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Delusions after birth are an emergency, today.",
            relatedEntryIDs: ["diagnosis:postpartum-psychosis", "diagnosis:postpartum-depression"],
            nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
            reviewTier: .tierA,
            publishOn: "2026-11-04",
            citations: [S.cdcHearHer, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-reassess-the-pain",
            title: "Thirty minutes later",
            population: .adult,
            step: .evaluateOutcomes,
            stem: "You gave a 46-year-old woman her ordered analgesic for severe post-operative pain thirty minutes ago and moved on to other patients. Passing her room, you see her lying rigid with her eyes closed, jaw clenched, hands gripping the sheet.",
            cues: [
                "She has not used the call light.",
                "Her breathing is shallow and guarded.",
                "When asked, she says the medication \"took the edge off\" and rates the pain as still severe.",
                "The next dose is not due for hours."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Treat the reassessment as the finding it is: document the inadequate response, use non-drug measures now, and contact the provider about the plan since the ordered regimen is not working.",
                      rationale: "Reassessment after an intervention is the point of the intervention. Severe pain after a full dose means the plan needs revision, and guarded, shallow breathing after surgery is its own risk. The nurse escalates rather than waiting for the next scheduled dose.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Note that she said it helped and let her rest until the next dose.",
                      rationale: "\"Took the edge off\" with a severe rating is not relief. Accepting it closes the loop on inadequate control.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Assume she is exaggerating because she did not call.",
                      rationale: "Many patients in severe pain go still and silent rather than call. Behavior is a pain cue, not a contradiction.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Give an extra dose from the next scheduled time.",
                      rationale: "Borrowing from the next dose without an order is outside scope and does not fix a regimen that is inadequate.",
                      citationIDs: [S.openrnFundamentals.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Reassessment is where the plan gets fixed.",
            relatedEntryIDs: ["scenario:pain-reassessment-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
            reviewTier: .tierB,
            publishOn: "2026-11-05",
            citations: [S.openrnFundamentals]
        ),

        MicroCase(
            id: "case-shouting-in-the-hall",
            title: "Shouting in the hallway",
            population: .adult,
            step: .generateSolutions,
            stem: "The adult son of a patient whose discharge was delayed is shouting at the unit clerk and demanding to see \"whoever is in charge.\" Other visitors are watching. His father, in the room behind him, looks embarrassed and asks him to stop.",
            cues: [
                "He is loud but has made no threats and is not blocking anyone.",
                "He says he took the day off work for a discharge that did not happen.",
                "No one has explained the reason for the delay.",
                "Security is a phone call away."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Approach calmly, invite him somewhere private, listen without interrupting, and explain the reason for the delay and the plan.",
                      rationale: "De-escalation starts with lowering the audience and acknowledging the grievance, which here is legitimate and unexplained. Information and a plan address the cause; a calm, non-defensive posture keeps it verbal.",
                      citationIDs: [S.ahrqTeamSTEPPS.id, S.openrnManagement.id]),
                .init("Call security immediately to remove him from the unit.",
                      rationale: "Security is for threats or physical escalation. Calling them for an angry but non-threatening family member escalates the situation and damages trust.",
                      citationIDs: [S.openrnManagement.id]),
                .init("Tell him firmly that this behavior is unacceptable and he must leave.",
                      rationale: "Confrontation in front of an audience invites escalation. Set limits after acknowledgment, if needed.",
                      citationIDs: [S.openrnManagement.id]),
                .init("Ignore him and let the clerk handle it.",
                      rationale: "Leaving a clerk to absorb an escalating situation is unfair to the clerk and leaves the cause unaddressed.",
                      citationIDs: [S.ahrqTeamSTEPPS.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Move it private, listen, then explain.",
            relatedEntryIDs: ["scenario:difficult-family-scenario"],
            nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-11-06",
            citations: [S.ahrqTeamSTEPPS, S.openrnManagement]
        ),

        MicroCase(
            id: "case-first-in-the-room",
            title: "First in the room",
            population: .adult,
            step: .takeAction,
            stem: "You walk into a room and find a 58-year-old man slumped in bed, unresponsive to your voice and a firm shoulder shake. He is not breathing normally. You are alone; the code cart is down the hall.",
            cues: [
                "No response to voice or touch.",
                "Occasional gasping breaths.",
                "No pulse you can feel in the ten seconds you check.",
                "The call light is within reach."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Call for help and the code team using the emergency call, then begin chest compressions immediately without waiting for the cart.",
                      rationale: "Unresponsive with agonal gasps and no pulse is cardiac arrest. Activating the response and starting high-quality compressions within seconds are the two actions that determine survival; the cart and the team come to you.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Run to get the code cart, then start compressions when you return.",
                      rationale: "Every second without compressions costs survival. The cart is brought by responders; the first person stays and compresses.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Give two rescue breaths and check for a pulse again for a full minute.",
                      rationale: "Prolonged pulse checks and breaths-first delay compressions. Ten seconds to check, then compress.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Check the chart for his code status before doing anything.",
                      rationale: "Unless a documented do-not-resuscitate order is known to you, resuscitation starts. Someone else verifies status once the team is present.",
                      citationIDs: [S.openrnManagement.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Call, then compress; the cart comes to you.",
            relatedEntryIDs: ["scenario:code-blue-team-scenario", "scenario:rapid-response-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-11-07",
            citations: [S.openrnSkills, S.openrnManagement]
        ),

        MicroCase(
            id: "case-aptt-critical",
            title: "A critical value on the heparin drip",
            population: .adult,
            step: .takeAction,
            stem: "The lab calls with a critical coagulation result for a 55-year-old woman on a continuous heparin infusion: the value is far above the therapeutic range. She reports no bleeding. The infusion is running at the rate the protocol set six hours ago.",
            cues: [
                "Critically prolonged clotting time.",
                "No visible bleeding; gums, urine and stool unremarkable on assessment.",
                "The protocol includes instructions for results above range.",
                "The next scheduled check is in six hours."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Follow the heparin protocol's instruction for a critical result now, notify the provider, and assess for occult bleeding, including neurological status.",
                      rationale: "A critically prolonged clotting time on heparin carries a high bleeding risk even without visible bleeding. The protocol defines the immediate nursing response, the provider is informed, and the assessment includes the brain and the gut where bleeding hides.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Continue the infusion; she is not bleeding, so the value is not a problem yet.",
                      rationale: "The value is the problem before the bleeding is. Waiting for hemorrhage to act defeats the purpose of monitoring.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Increase the rate slightly since the protocol table is for the next check.",
                      rationale: "Any increase with a critical value is dangerous and contrary to every heparin protocol.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Ask the lab to rerun the sample before doing anything.",
                      rationale: "A rerun may be requested, but the protocol action and provider notification do not wait for it.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "A critical value is treated before the bleed.",
            relatedEntryIDs: ["lab:aptt", "drip:heparin-drip", "drug:heparin"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .clottingHemostasis),
            reviewTier: .tierA,
            publishOn: "2026-11-08",
            citations: [S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-epidural-and-the-injection",
            title: "The injection and the epidural",
            population: .adult,
            step: .takeAction,
            stem: "A 67-year-old woman after knee replacement has an epidural catheter in place for pain. Her scheduled anticoagulant injection for clot prevention is due. The anesthesia team plans to remove the epidural later today.",
            cues: [
                "The epidural catheter is still in place.",
                "The injection is scheduled at its usual time.",
                "No note addresses timing of the injection around catheter removal.",
                "She has full movement and sensation in both legs."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Hold the injection and verify timing with anesthesia and the provider before giving it, because anticoagulants around epidural placement or removal carry a risk of spinal hematoma.",
                      rationale: "Anticoagulant dosing near neuraxial catheter removal is timed deliberately to avoid bleeding into the spinal canal. When the order is silent, the nurse verifies before giving rather than after.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Give the injection on time; clot prevention after knee surgery is essential.",
                      rationale: "Clot prevention matters, which is why the timing is coordinated rather than skipped. Giving it without checking the removal plan risks a catastrophic spinal bleed.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Remove the epidural yourself so the injection can be given.",
                      rationale: "Epidural removal belongs to the anesthesia team and is itself timed around anticoagulation.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Skip today's dose and resume tomorrow.",
                      rationale: "Omitting the dose without a plan leaves her unprotected. Verification produces a plan; skipping does not.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Anticoagulant plus epidural: verify the timing first.",
            relatedEntryIDs: ["drug:enoxaparin", "procedure:epidural-catheter-management"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety),
            reviewTier: .tierA,
            publishOn: "2026-11-09",
            citations: [S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-morphine-and-the-kidneys",
            title: "Sleepier every day",
            population: .adult,
            step: .analyzeCues,
            stem: "A 79-year-old man with advanced chronic kidney disease has received a scheduled opioid for a rib fracture for four days. Each day he has been harder to wake. His family thinks he is finally resting; he has not asked for a breakthrough dose in two days.",
            cues: [
                "Sedation has increased daily on an unchanged dose.",
                "His kidney function is poor and getting worse this admission.",
                "Respiratory rate is at the low edge of normal.",
                "He has small pupils and twitching in his hands."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Good pain control; continue the regimen as ordered.",
                      rationale: "Progressive sedation on a stable dose is accumulation, not control. Rising sedation with twitching and a low respiratory rate is toxicity developing.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Opioid accumulation from poor kidney clearance; hold the next dose, notify the provider, and monitor sedation and breathing closely.",
                      rationale: "Some opioids and their metabolites accumulate in kidney failure, producing worsening sedation and myoclonus over days on an unchanged dose. Holding and reporting is the nursing action; the provider adjusts the drug or dose.",
                      citationIDs: [S.openrnPharmacology.id, S.niddkKidney.id]),
                .init("Depression from the hospital stay; request a psychiatric consult.",
                      rationale: "Sedation with small pupils and twitching is pharmacologic, not psychiatric.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("He is sleeping well because the pain has resolved; reduce nursing checks.",
                      rationale: "Reducing surveillance on a patient with rising sedation and a falling respiratory rate is the opposite of what is needed.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Sleepier daily on the same dose: accumulation.",
            relatedEntryIDs: ["drug:morphine", "drug:naloxone"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-11-10",
            citations: [S.openrnPharmacology, S.niddkKidney]
        ),

        MicroCase(
            id: "case-glucose-on-steroids",
            title: "Sugars climbing on the steroid",
            population: .adult,
            step: .analyzeCues,
            stem: "A 60-year-old woman without a diabetes diagnosis was started on a high-dose steroid two days ago for a flare of her lung disease. Her afternoon fingerstick glucose readings have climbed each day and she is now thirsty and urinating frequently.",
            cues: [
                "Afternoon glucose readings rising day over day.",
                "Morning readings are only mildly elevated.",
                "New thirst and frequent urination.",
                "No glucose-lowering medication is ordered."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Report the pattern to the provider, continue scheduled glucose checks, and anticipate an order for management of steroid-induced hyperglycemia.",
                      rationale: "Steroids raise glucose most in the afternoon and evening. A rising pattern with symptoms needs a treatment plan, which is the provider's call; the nurse supplies the trend and keeps monitoring.",
                      citationIDs: [S.openrnPharmacology.id, S.niddkDKA.id]),
                .init("Restrict her fluids to reduce the urination.",
                      rationale: "Fluid restriction in a hyperglycemic, polyuric patient risks dehydration; the urination is the symptom, not the problem.",
                      citationIDs: [S.niddkDKA.id]),
                .init("Stop the steroid since it is causing the glucose rise.",
                      rationale: "Abruptly stopping a steroid is dangerous and is the provider's decision; the lung disease still needs treatment.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Give a dose of insulin from the unit's stock to bring it down.",
                      rationale: "Insulin is a high-alert medication given only on a specific order.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Steroids push afternoon sugars; report the pattern.",
            relatedEntryIDs: ["lab:glucose", "drug:prednisone"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .glucoseRegulation),
            reviewTier: .tierB,
            publishOn: "2026-11-11",
            citations: [S.openrnPharmacology, S.niddkDKA]
        ),

        MicroCase(
            id: "case-look-alike-vials",
            title: "Two vials, similar names",
            population: .adult,
            step: .takeAction,
            stem: "You are preparing an intravenous opioid for a patient with severe pain. The dispensing cabinet offers two vials with similar names and near-identical labels in adjacent bins. You have already drawn up a dose when you notice the vial in your hand is not the drug ordered.",
            cues: [
                "The two drugs differ greatly in potency.",
                "Both are on the high-alert list.",
                "The patient is asking when the medication is coming.",
                "A colleague is available to double-check."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Discard the drawn-up dose per policy, obtain the correct drug, complete an independent double-check with a colleague, and report the near miss so the storage can be fixed.",
                      rationale: "A wrong-vial catch is a near miss, and the fix is to start over with the right drug, verify it independently, and report it so the look-alike storage is changed. Pressure from the wait is not a reason to shortcut.",
                      citationIDs: [S.openrnPharmacology.id, S.ahrqPSNet.id]),
                .init("Give the drawn-up dose anyway since the drugs are in the same class.",
                      rationale: "Drugs in the same class can differ many-fold in potency. Same class is not the same drug.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Relabel the syringe with the ordered drug name and give it.",
                      rationale: "Relabeling a syringe to match an order it does not contain is falsification and a direct route to harm.",
                      citationIDs: [S.ahrqPSNet.id]),
                .init("Quietly put the wrong vial back and say nothing, since no harm occurred.",
                      rationale: "Unreported near misses leave the trap in place for the next nurse. Reporting is how look-alike storage gets separated.",
                      citationIDs: [S.ahrqPSNet.id])
            ],
            bestOptionIndex: 0,
            takeaway: "A near miss is a report, not secret.",
            relatedEntryIDs: ["drug:hydromorphone", "drug:morphine", "scenario:medication-near-miss-scenario"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
            reviewTier: .tierA,
            publishOn: "2026-11-12",
            citations: [S.openrnPharmacology, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-insulin-and-no-tray",
            title: "The tray that never came",
            population: .adult,
            step: .generateSolutions,
            stem: "A 58-year-old woman with diabetes receives rapid-acting insulin with meals. Her lunch tray has not arrived, she says she feels queasy and does not want to eat, and the mealtime insulin is due on your medication list.",
            cues: [
                "Pre-meal glucose is within her usual range.",
                "She has vomited once this morning.",
                "The order is written as a mealtime dose without a hold parameter.",
                "The kitchen says the tray is delayed."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Hold the mealtime insulin, notify the provider about the nausea and the missed meal, and continue glucose monitoring.",
                      rationale: "Rapid-acting insulin given to a patient who will not eat causes hypoglycemia. When the order lacks a hold parameter, the nurse holds and verifies rather than gives and hopes.",
                      citationIDs: [S.openrnPharmacology.id, S.niddkHypoglycemia.id]),
                .init("Give the insulin now so it is on time, and encourage her to eat when the tray arrives.",
                      rationale: "Insulin timed to a meal that may not happen is the classic setup for a low.",
                      citationIDs: [S.niddkHypoglycemia.id]),
                .init("Give half the dose as a compromise.",
                      rationale: "Changing the dose is prescribing. The nurse holds and asks; the provider decides.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Offer crackers so the insulin can be given.",
                      rationale: "A few crackers do not cover a mealtime dose, and a nauseated patient may not keep them down.",
                      citationIDs: [S.niddkHypoglycemia.id])
            ],
            bestOptionIndex: 0,
            takeaway: "No meal, no mealtime insulin; hold and ask.",
            relatedEntryIDs: ["drug:insulin-regular", "diagnosis:hypoglycemia"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .glucoseRegulation),
            reviewTier: .tierA,
            publishOn: "2026-11-13",
            citations: [S.openrnPharmacology, S.niddkHypoglycemia]
        ),

        MicroCase(
            id: "case-after-the-tap",
            title: "After the thoracentesis",
            population: .adult,
            step: .evaluateOutcomes,
            stem: "A 72-year-old man had fluid drained from his right chest at the bedside an hour ago. He was comfortable afterward. Now he tells you he is more short of breath than before the procedure and has a dry cough.",
            cues: [
                "Breath sounds on the right are quieter than immediately after the procedure.",
                "Respiratory rate is climbing.",
                "The puncture site dressing is dry.",
                "A post-procedure chest film was ordered but not yet done."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Apply oxygen, keep him upright, notify the provider now, and expedite the chest film for pneumothorax.",
                      rationale: "New dyspnea and diminished breath sounds after a thoracentesis point to a pneumothorax from the needle. The nurse supports oxygenation and escalates; the film confirms and the provider decides on a chest drain.",
                      citationIDs: [S.openrnSkills.id, S.openrnHealthAlterations.id]),
                .init("Reassure him that a cough is expected after drainage and recheck in an hour.",
                      rationale: "A cough alone can follow re-expansion, but worsening dyspnea with a quieter lung is not expected and an hour is too long.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Lay him flat on the affected side to splint the chest.",
                      rationale: "Lying flat worsens breathing; upright positioning helps ventilation while help arrives.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Change the dressing to check for leakage.",
                      rationale: "A dry dressing and a chest that is filling with air are unrelated; the dressing is not the problem.",
                      citationIDs: [S.openrnSkills.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Worse after the tap: think pneumothorax.",
            relatedEntryIDs: ["diagnosis:pneumothorax", "procedure:chest-tube-insertion"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-11-14",
            citations: [S.openrnSkills, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-extra-beats-low-magnesium",
            title: "Extra beats and a low magnesium",
            population: .adult,
            step: .analyzeCues,
            stem: "A 49-year-old man admitted with alcohol-related pancreatitis has been vomiting for two days. On the monitor you notice more frequent extra beats than yesterday. His morning labs include a magnesium result below the normal range.",
            cues: [
                "Increasing ventricular ectopy on the monitor.",
                "Low magnesium on this morning's labs.",
                "He reports muscle cramps and tingling.",
                "His potassium is also low-normal."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Notify the provider now with the rhythm change and the electrolyte results together, keep him on continuous monitoring, and anticipate replacement orders.",
                      rationale: "Low magnesium, often with low potassium, makes the heart irritable and is a common cause of ectopy in alcohol use and vomiting. The rhythm change and the lab belong in the same report; replacement is ordered by the provider.",
                      citationIDs: [S.openrnHealthAlterations.id, S.niaaaWithdrawal.id]),
                .init("Document the ectopy as benign and recheck the magnesium tomorrow.",
                      rationale: "Increasing ectopy with a low magnesium is not benign; it can progress to dangerous rhythms.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Encourage foods high in magnesium.",
                      rationale: "A vomiting patient cannot correct a symptomatic deficiency through diet, and the rhythm change needs a faster response.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Give the magnesium from the floor stock since the level is low.",
                      rationale: "Electrolyte replacement, especially intravenous, is ordered by the provider with a specific dose and rate; it is not given from stock on a lab value.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Ectopy plus low magnesium: report them together.",
            relatedEntryIDs: ["lab:magnesium", "diagnosis:torsades-de-pointes", "diagnosis:hypokalemia"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes),
            reviewTier: .tierA,
            publishOn: "2026-11-15",
            citations: [S.openrnHealthAlterations, S.niaaaWithdrawal]
        ),

        MicroCase(
            id: "case-sbar-at-three-am",
            title: "The three a.m. call",
            population: .adult,
            step: .takeAction,
            stem: "At three in the morning you need to call the covering provider, who does not know your patient, about a 63-year-old woman whose oxygen requirement has doubled over the shift. You have her chart open and the last set of vitals in front of you.",
            cues: [
                "She was admitted two days ago with pneumonia.",
                "Oxygen has gone from a low flow to a high flow to keep her saturation up.",
                "She is more tired but oriented.",
                "The provider will decide between a chest film now and waiting for the day team."
            ],
            prompt: "How should the nurse open the call?",
            options: [
                .init("Situation, background, assessment, recommendation: who she is, why she is here, the oxygen trend and your assessment, and what you are asking for now.",
                      rationale: "SBAR gives a provider who does not know the patient what they need in the order they need it, and ends with a specific request. It is the structure that gets an action at three in the morning.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Read the last twelve hours of vital signs from the flowsheet.",
                      rationale: "A list of numbers without an assessment or a request leaves the provider to reconstruct the story from scratch.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Apologize for calling so late and ask whether they want to know about the patient.",
                      rationale: "Apology and hedging waste the provider's attention and bury the concern. Lead with the situation.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Ask the provider to come see her without giving details over the phone.",
                      rationale: "Withholding details prevents the provider from deciding what to do; a specific recommendation is part of the call.",
                      citationIDs: [S.ahrqTeamSTEPPS.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Situation first, recommendation last, every call.",
            relatedEntryIDs: ["communication:sbar", "communication:sbarq"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .gasExchange),
            reviewTier: .tierB,
            publishOn: "2026-11-16",
            citations: [S.ahrqTeamSTEPPS]
        ),
    ]
}
