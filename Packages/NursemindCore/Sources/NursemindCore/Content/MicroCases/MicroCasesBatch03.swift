import Foundation

private typealias S = MicroCaseSources

/// Batch 03 — 2026-10-18 … 2026-11-01. Pending Tier A review where marked.
enum MicroCasesBatch03 {
    static let cases: [MicroCase] = [
        MicroCase(
            id: "case-drooling-child",
            title: "The child who will not lie down",
            population: .pediatric,
            step: .recognizeCues,
            stem: "A 4-year-old arrives with his mother for a sore throat and fever that came on this afternoon. He is sitting bolt upright on her lap, leaning forward with his chin out, and refuses to swallow. His mother says he was fine at breakfast.",
            cues: [
                "Drooling, with a muffled voice.",
                "A soft, high-pitched sound on inspiration.",
                "He looks frightened and very still.",
                "He is not fully up to date on childhood vaccines."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Keep him upright on his mother, do not examine the throat or lay him down, and summon the provider and airway support immediately.",
                      rationale: "Sudden fever with drooling, tripod posture, muffled voice and stridor is a supraglottic airway emergency until proven otherwise. Disturbing the child or the throat can close the airway; the priority is calm, position and an airway-capable team at the bedside.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Use a tongue blade and light to look at his throat for exudate.",
                      rationale: "Instrumenting the throat can precipitate complete obstruction in epiglottitis. No throat exam until the airway team is present.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Lay him flat on the stretcher to obtain vital signs and start an IV.",
                      rationale: "Forcing a child in tripod position to lie flat, and the distress of an IV, both threaten a tenuous airway.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Offer cool fluids to soothe the throat and reassess in twenty minutes.",
                      rationale: "A child who cannot swallow his own saliva will not drink, and twenty minutes is longer than this airway may hold.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Drooling and tripod: hands off, team in.",
            relatedEntryIDs: ["diagnosis:croup"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-10-18",
            citations: [S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-after-the-central-line",
            title: "Short of breath after the line",
            population: .adult,
            step: .recognizeCues,
            stem: "Twenty minutes after a central line was placed in the right subclavian vein, a 63-year-old man becomes short of breath and says the right side of his chest feels sharp. The insertion site is clean and dry.",
            cues: [
                "Breath sounds are quieter on the right.",
                "Respiratory rate and heart rate are climbing.",
                "Oxygen saturation is falling.",
                "The post-insertion chest film has not yet been done."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Pain from the procedure; give the ordered analgesic.",
                      rationale: "Unilateral diminished breath sounds with falling saturation after a subclavian line is a pneumothorax until imaged. Analgesia treats a symptom while the lung collapses.",
                      citationIDs: [S.openrnSkills.id, S.ahrqPSNet.id]),
                .init("Probable pneumothorax from the insertion; apply oxygen, sit him up, escalate now, and watch for tracheal shift and hypotension.",
                      rationale: "Pneumothorax is a known complication of subclavian access. Oxygen, positioning and immediate escalation are the nursing response, with continuous watch for the signs that it is becoming a tension pneumothorax.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Anxiety after an invasive procedure; coach slow breathing.",
                      rationale: "Anxiety does not silence one lung. Objective asymmetry rules out a purely emotional explanation.",
                      citationIDs: [S.ahrqPSNet.id]),
                .init("Flush the line to make sure it is patent.",
                      rationale: "Line patency is unrelated to the respiratory change and using the line before the film confirms position is itself unsafe.",
                      citationIDs: [S.openrnSkills.id])
            ],
            bestOptionIndex: 1,
            takeaway: "One quiet lung after a subclavian line.",
            relatedEntryIDs: ["diagnosis:tension-pneumothorax", "procedure:central-line-insertion", "diagnosis:pneumothorax"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-10-19",
            citations: [S.openrnSkills, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-damp-dressing",
            title: "The dressing that lifted",
            population: .adult,
            step: .takeAction,
            stem: "During your assessment of a 57-year-old woman receiving chemotherapy through a central line, you find the transparent dressing lifted at one edge and damp underneath. The dressing was changed two days ago and is otherwise labeled correctly.",
            cues: [
                "The insertion site is visible under the lifted edge and looks pink.",
                "She showered this morning without covering the site.",
                "She is afebrile.",
                "The next scheduled dressing change is in five days."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Change the dressing now using sterile technique and reinforce with her how to protect the site when bathing.",
                      rationale: "A damp, loose or soiled central line dressing is changed immediately, not at the next scheduled date; moisture and a lifted seal are a direct path for bloodstream infection. Teaching closes the loop.",
                      citationIDs: [S.cdcHAI.id, S.openrnSkills.id]),
                .init("Tape the lifted edge down and leave the scheduled change in place.",
                      rationale: "Taping over a compromised, damp dressing seals moisture against the site and defeats the purpose of the barrier.",
                      citationIDs: [S.cdcHAI.id]),
                .init("Remove the dressing and leave the site open to air to dry.",
                      rationale: "An uncovered central line site is an open door for organisms. The site is never left uncovered.",
                      citationIDs: [S.cdcHAI.id]),
                .init("Document the finding and ask the provider whether the line should be removed.",
                      rationale: "A pink site without fever is not an indication to remove the line. The indicated action is a prompt dressing change.",
                      citationIDs: [S.openrnSkills.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Damp, loose or soiled: change it now.",
            relatedEntryIDs: ["procedure:central-line-dressing"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .infection),
            reviewTier: .tierB,
            publishOn: "2026-10-20",
            citations: [S.cdcHAI, S.openrnSkills]
        ),

        MicroCase(
            id: "case-heparin-and-a-headache",
            title: "A headache on the heparin drip",
            population: .adult,
            step: .recognizeCues,
            stem: "A 69-year-old woman on a continuous heparin infusion for a pulmonary embolism slipped in the bathroom an hour ago and struck the back of her head on the sink. She waved it off. Now she has a headache and is quieter than usual.",
            cues: [
                "She is slower to answer and asks the same question twice.",
                "One pupil looks slightly larger than the other.",
                "The heparin is infusing as ordered.",
                "Her last coagulation result was at the top of the target range."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Stop the heparin infusion, notify the provider immediately for urgent head imaging, and perform neurological checks continuously.",
                      rationale: "A head strike on anticoagulation with new headache, slowed cognition and pupil asymmetry is an intracranial bleed until imaged. Stopping the infusion is within nursing judgment when the drug is the danger; the provider is called in the same breath.",
                      citationIDs: [S.openrnPharmacology.id, S.ahrqPSNet.id]),
                .init("Give the ordered mild analgesic for the headache and recheck in an hour.",
                      rationale: "An hour on a heparin drip with an expanding bleed is catastrophic. Analgesia also masks the symptom that is tracking the bleed.",
                      citationIDs: [S.ahrqPSNet.id]),
                .init("Increase neurological checks to every two hours and continue the infusion.",
                      rationale: "More frequent checks without stopping the drug or imaging the head document the decline rather than prevent it.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Ask her to rate the headache and offer a dark, quiet room.",
                      rationale: "Comfort measures are not the priority when the differential is intracranial hemorrhage.",
                      citationIDs: [S.ahrqPSNet.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Head strike on heparin: stop, image, watch.",
            relatedEntryIDs: ["drip:heparin-drip", "scenario:anticoag-head-injury-scenario", "lab:aptt"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .clottingHemostasis),
            reviewTier: .tierA,
            publishOn: "2026-10-21",
            citations: [S.openrnPharmacology, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-glucose-falling-fast",
            title: "Falling fast on the insulin drip",
            population: .adult,
            step: .evaluateOutcomes,
            stem: "A 44-year-old man is on an insulin infusion for diabetic ketoacidosis. His hourly glucose has dropped much faster over the last two checks than the protocol expects. He says he feels shaky and has a headache.",
            cues: [
                "The last two hourly readings fell steeply.",
                "He is sweating and irritable.",
                "The dextrose-containing fluid ordered for this stage has not been started.",
                "The infusion pump shows the rate matching the protocol table."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Treat the symptoms per the hypoglycemia protocol, follow the insulin protocol's instruction for a rapid fall, and notify the provider about the missing dextrose fluid.",
                      rationale: "A steep glucose fall on an insulin drip with symptoms is impending hypoglycemia. The protocol defines what the nurse does at this point; the missing dextrose-containing fluid is the cause to report. Neurologic symptoms and rapid shifts also raise the concern for cerebral edema in DKA.",
                      citationIDs: [S.niddkDKA.id, S.openrnPharmacology.id]),
                .init("Continue the drip as the table directs; the goal is to bring glucose down.",
                      rationale: "The goal in DKA is a controlled, gradual decline, not the fastest one. Following the rate while ignoring the trajectory and symptoms is how patients become hypoglycemic on protocol.",
                      citationIDs: [S.niddkDKA.id]),
                .init("Stop the insulin entirely until his glucose normalizes.",
                      rationale: "Stopping insulin in DKA before ketosis resolves allows acidosis to return. Protocols adjust the rate and add dextrose rather than stop the drug; the nurse follows the protocol and the provider, not an independent stop.",
                      citationIDs: [S.niddkDKA.id]),
                .init("Give him a snack and recheck in an hour.",
                      rationale: "Oral carbohydrate is not the protocol's tool during a DKA infusion, and an hour is too long with symptoms present.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "On an insulin drip, the slope matters.",
            relatedEntryIDs: ["drip:insulin-drip", "lab:glucose", "diagnosis:dka"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .glucoseRegulation),
            reviewTier: .tierA,
            publishOn: "2026-10-22",
            citations: [S.niddkDKA, S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-pale-hand-on-pressor",
            title: "The hand goes pale",
            population: .adult,
            step: .takeAction,
            stem: "A 72-year-old woman in septic shock is receiving a vasopressor through a peripheral IV in her forearm while central access is arranged. On your check the skin around the IV is pale and cool, and she says the arm burns.",
            cues: [
                "Blanching and swelling around the insertion site.",
                "The pump has not alarmed.",
                "Capillary refill in that hand is sluggish.",
                "Her blood pressure is currently at goal."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Stop the infusion at that site, leave the catheter in place, notify the provider immediately, and establish another site so the pressor is not interrupted for long.",
                      rationale: "Pallor, swelling and burning around a vasopressor IV is extravasation, which causes tissue necrosis. The drug stops at that site, the catheter stays for possible antidote infiltration per order, and the pressor moves to another site promptly because the patient still needs it.",
                      citationIDs: [S.openrnPharmacology.id, S.openrnSkills.id]),
                .init("Flush the line to confirm patency and continue if it flushes easily.",
                      rationale: "Flushing pushes more vasoconstrictor into the tissue. An easy flush does not exclude extravasation.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Apply warm compresses and continue the infusion at a slower rate.",
                      rationale: "Slowing the drug still delivers it into the tissue, and comfort measures do not reverse vasoconstriction.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Remove the IV immediately and apply pressure.",
                      rationale: "Pulling the catheter before the provider decides on antidote infiltration removes the access that treatment may use, and pressure does nothing for the vasoconstriction.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Pale and burning on a pressor: stop it.",
            relatedEntryIDs: ["drip:norepinephrine-drip", "diagnosis:sepsis"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-10-23",
            citations: [S.openrnPharmacology, S.openrnSkills]
        ),

        MicroCase(
            id: "case-troponin-climbs",
            title: "The second troponin",
            population: .adult,
            step: .analyzeCues,
            stem: "A 61-year-old man was admitted overnight for chest pain to rule out a heart attack. His first cardiac marker was normal. The repeat result has just come back elevated. He tells you the pressure in his chest is back and he feels sweaty.",
            cues: [
                "Second troponin is higher than the first.",
                "Chest pressure has returned and radiates to his jaw.",
                "He is diaphoretic and restless.",
                "The provider has not yet seen the new result."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Notify the provider immediately with the rising marker and recurrent symptoms, obtain a 12-lead ECG per protocol, and keep him on continuous monitoring.",
                      rationale: "A rising troponin with recurrent ischemic symptoms is an evolving myocardial infarction. The ECG identifies whether it is a time-critical STEMI; the provider needs both the lab and the symptoms now.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Wait for the provider to review the result on morning rounds.",
                      rationale: "Time is myocardium. Rounds are hours away and the symptoms are back now.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Give the as-needed antacid; the pressure could be reflux.",
                      rationale: "Reflux does not raise troponin. Treating an evolving infarction as heartburn is a recognized anchoring error.",
                      citationIDs: [S.openrnHealthAlterations.id, S.ahrqPSNet.id]),
                .init("Encourage him to walk to see whether the pain is positional.",
                      rationale: "Exertion during active ischemia increases oxygen demand and can extend the infarct.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Rising troponin plus symptoms: ECG and escalate.",
            relatedEntryIDs: ["lab:troponin", "lab:troponin-hs"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-10-24",
            citations: [S.openrnHealthAlterations, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-seizure-with-preeclampsia",
            title: "The seizure on the antepartum unit",
            population: .obstetric,
            step: .takeAction,
            stem: "A 27-year-old woman at 35 weeks admitted for severe preeclampsia begins a generalized seizure while you are in the room. She had complained of a headache and \"spots in her vision\" ten minutes earlier.",
            cues: [
                "Tonic-clonic activity of all limbs.",
                "The fetal monitor shows a drop in fetal heart rate.",
                "Her magnesium infusion has not yet been started; it was ordered on admission.",
                "The side rails are padded and up."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Call for help, protect her airway by turning her to her side, note the time, and prepare for the ordered magnesium as soon as the team arrives.",
                      rationale: "This is eclampsia. Airway protection and positioning during the convulsion come first; the anticonvulsant is magnesium and it is given by the team as soon as the seizure allows. The fetal heart rate usually recovers once the maternal seizure ends.",
                      citationIDs: [S.cdcHearHer.id, S.openrnHealthAlterations.id]),
                .init("Prepare for an emergency cesarean immediately because of the fetal heart rate.",
                      rationale: "Maternal stabilization comes before delivery decisions; fetal bradycardia during the seizure typically resolves as the mother recovers.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Hold her still to stop the convulsion.",
                      rationale: "Restraining a convulsing patient causes injury and does not shorten the seizure.",
                      citationIDs: [S.cdcHearHer.id]),
                .init("Insert an oral airway before the team arrives.",
                      rationale: "Nothing goes into the mouth during a convulsion; side-lying protects the airway.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Eclampsia: airway, side, time, then magnesium.",
            relatedEntryIDs: ["diagnosis:eclampsia", "drug:magnesium-sulfate", "diagnosis:preeclampsia"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
            reviewTier: .tierA,
            publishOn: "2026-10-25",
            citations: [S.cdcHearHer, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-bleeding-gums-on-warfarin",
            title: "Bleeding gums on warfarin",
            population: .adult,
            step: .analyzeCues,
            stem: "A 74-year-old man on long-term warfarin for a mechanical heart valve was admitted for pneumonia and started on a new antibiotic three days ago. This morning he shows you that his gums bled when he brushed his teeth, and he has a new bruise on his forearm.",
            cues: [
                "Today's INR result is far above his target range.",
                "He has not changed his warfarin dose.",
                "The new antibiotic is known to interact with warfarin.",
                "He denies black stools or blood in his urine."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Hold this morning's warfarin pending provider review, report the INR, the bleeding and the interacting antibiotic now, and assess for other bleeding.",
                      rationale: "A supratherapeutic INR with visible bleeding after a new interacting drug is an adverse drug interaction in progress. Holding a dose pending review and escalating with the whole picture is the nursing action; reversal decisions belong to the provider.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Give the warfarin as scheduled because his valve requires anticoagulation.",
                      rationale: "The valve needs anticoagulation in range, not above it. Giving more while he is already bleeding compounds the harm.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Ask him to use a softer toothbrush and reassess tomorrow.",
                      rationale: "Gum bleeding is the visible sign of a systemic problem. Tomorrow's INR may be higher still.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Stop the antibiotic yourself since it is the cause.",
                      rationale: "Stopping the antibiotic is the provider's decision; the pneumonia still needs treatment. Report the interaction.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "New drug, new bleeding: hold, report, assess.",
            relatedEntryIDs: ["drug:warfarin", "lab:inr"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .clottingHemostasis),
            reviewTier: .tierA,
            publishOn: "2026-10-26",
            citations: [S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-the-seizure-that-will-not-stop",
            title: "Five minutes and counting",
            population: .adult,
            step: .recognizeCues,
            stem: "A 29-year-old woman with epilepsy began a generalized seizure that you timed from its start. You turned her to her side and cleared the bed. The convulsion has now lasted five minutes with no sign of slowing.",
            cues: [
                "Continuous convulsive activity since onset.",
                "Lips are dusky.",
                "The rescue medication is ordered and in the room.",
                "No one else is at the bedside yet."
            ],
            prompt: "What does the five-minute mark mean for the nurse?",
            options: [
                .init("This is status epilepticus; call for the emergency team now and give the ordered rescue medication per the standing order.",
                      rationale: "A convulsive seizure lasting five minutes or longer is treated as status epilepticus, a medical emergency in which delay increases neuronal injury. The ordered rescue medication and the emergency team are the response at this mark, not after it.",
                      citationIDs: [S.cdcSeizure.id, S.openrnSkills.id]),
                .init("Continue to protect her and wait; most seizures stop on their own.",
                      rationale: "Most seizures do stop within a couple of minutes, which is exactly why one that reaches five minutes is different.",
                      citationIDs: [S.cdcSeizure.id]),
                .init("Begin chest compressions because her lips are dusky.",
                      rationale: "Cyanosis during a convulsion reflects the seizure's effect on breathing, not cardiac arrest. Compressions on a convulsing patient with a pulse cause harm.",
                      citationIDs: [S.cdcSeizure.id]),
                .init("Go find the provider to ask whether the rescue medication should be given.",
                      rationale: "A standing order exists so no one has to leave the bedside to ask. Call from the room.",
                      citationIDs: [S.openrnSkills.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Five minutes of convulsion is an emergency.",
            relatedEntryIDs: ["diagnosis:status-epilepticus", "scenario:seizure-response-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
            reviewTier: .tierA,
            publishOn: "2026-10-27",
            citations: [S.cdcSeizure, S.openrnSkills]
        ),

        MicroCase(
            id: "case-cold-in-recovery",
            title: "Shivering in recovery",
            population: .adult,
            step: .prioritizeHypotheses,
            stem: "An 81-year-old woman arrives in the recovery unit after a three-hour abdominal operation. She is shivering hard and her core temperature is well below normal. She is drowsy and her heart rhythm shows occasional extra beats.",
            cues: [
                "Skin is cool and mottled at the knees.",
                "Shivering is vigorous.",
                "Blood pressure is lower than her pre-operative reading.",
                "The operating room was cold and she received unwarmed fluids."
            ],
            prompt: "What is the nurse's priority?",
            options: [
                .init("Begin active rewarming with warmed blankets or forced air and warmed fluids per order, monitor the rhythm continuously, and rewarm gradually.",
                      rationale: "Post-operative hypothermia in an older adult increases cardiac irritability, bleeding and infection risk, and shivering multiplies oxygen demand. Active, gradual rewarming with continuous monitoring is the priority.",
                      citationIDs: [S.openrnFundamentals.id, S.openrnHealthAlterations.id]),
                .init("Give the ordered opioid to stop the shivering.",
                      rationale: "Opioids may reduce shivering but do not correct the temperature, and they add sedation and respiratory depression to a drowsy, cold patient.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Apply a heating pad directly to her abdomen for fast warming.",
                      rationale: "Direct focal heat burns fragile skin and rewarms unevenly. Rewarming is systemic and gradual.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Increase her oxygen and wait for her to warm naturally.",
                      rationale: "Passive rewarming is too slow for a patient this cold with rhythm changes; oxygen alone does not address the cause.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Cold and irritable rhythm: rewarm actively, gradually.",
            relatedEntryIDs: ["diagnosis:hypothermia"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
            reviewTier: .tierB,
            publishOn: "2026-10-28",
            citations: [S.openrnFundamentals, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-swallow-screen-first",
            title: "The breakfast tray after a stroke",
            population: .adult,
            step: .takeAction,
            stem: "A 70-year-old man admitted overnight with a stroke has a breakfast tray delivered to his room. He is hungry and reaches for the coffee. His speech is mildly slurred and the left side of his face droops. No swallow evaluation has been documented.",
            cues: [
                "Facial droop on the left.",
                "He coughed once when sipping water during your assessment.",
                "The tray is regular consistency with thin liquids.",
                "The speech pathologist has not yet seen him."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Keep him NPO, remove the tray, and complete the bedside swallow screen or obtain the ordered evaluation before any oral intake.",
                      rationale: "Dysphagia after stroke is common and aspiration pneumonia is a leading preventable complication. Facial weakness and a cough with water are warning signs; nothing by mouth until a screen is passed.",
                      citationIDs: [S.nindsStroke.id, S.openrnHealthAlterations.id]),
                .init("Let him eat slowly while you watch for coughing.",
                      rationale: "Silent aspiration produces no cough. Watching does not substitute for a screen.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Thicken the coffee and allow the rest of the tray.",
                      rationale: "Modifying a diet is done after a screen determines what is safe, not as a guess.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Allow small sips of water only, since water is harmless if aspirated.",
                      rationale: "Aspirated liquids of any kind carry oral bacteria into the lungs. Water is not exempt.",
                      citationIDs: [S.nindsStroke.id])
            ],
            bestOptionIndex: 0,
            takeaway: "After a stroke, screen before the tray.",
            relatedEntryIDs: ["diagnosis:stroke", "diagnosis:aspiration-pneumonia"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .gasExchange),
            reviewTier: .tierB,
            publishOn: "2026-10-29",
            citations: [S.nindsStroke, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-restless-not-in-pain",
            title: "Restless, yawning, sweating",
            population: .adult,
            step: .analyzeCues,
            stem: "A 35-year-old man admitted for a hand infection tells you on his second morning that his whole body aches and he cannot sit still. He is yawning constantly, sweating, and his eyes are watering. He asks for something for pain.",
            cues: [
                "Dilated pupils and goosebumps on his arms.",
                "Runny nose and repeated yawning.",
                "Abdominal cramping and loose stools since last night.",
                "His admission history notes daily opioid use he did not want to discuss."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Worsening infection; escalate for sepsis.",
                      rationale: "Yawning, lacrimation, dilated pupils and piloerection are not sepsis signs. Misreading withdrawal as infection leads to the wrong treatment.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Opioid withdrawal; assess with a structured withdrawal scale, notify the provider, and discuss treatment options with the patient without judgment.",
                      rationale: "The cluster of autonomic and gastrointestinal signs after a day without his usual opioid is withdrawal. It is treatable, and identifying it respectfully improves his engagement with care for the infection too.",
                      citationIDs: [S.openrnHealthAlterations.id, S.cdcOverdose.id]),
                .init("Drug-seeking behavior; decline the request and document it.",
                      rationale: "Labeling a patient in withdrawal as drug-seeking is stigmatizing and clinically wrong. Withdrawal is a physiologic state with a treatment.",
                      citationIDs: [S.cdcOverdose.id]),
                .init("Anxiety about the surgery on his hand; offer reassurance.",
                      rationale: "Anxiety does not cause piloerection, rhinorrhea and diarrhea together.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Yawning, tearing, goosebumps: withdrawal, not attitude.",
            relatedEntryIDs: ["diagnosis:opioid-withdrawal", "diagnosis:opioid-use-disorder"],
            nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .painComfort),
            reviewTier: .tierB,
            publishOn: "2026-10-30",
            citations: [S.openrnHealthAlterations, S.cdcOverdose]
        ),

        MicroCase(
            id: "case-read-back",
            title: "The order you thought you heard",
            population: .adult,
            step: .takeAction,
            stem: "A provider calls the unit from another floor with a verbal order for a high-alert medication for your patient. The line is poor and the unit is noisy. You believe you heard the drug and the dose, but one word was unclear.",
            cues: [
                "The provider sounds hurried and about to hang up.",
                "The medication is on the unit's high-alert list.",
                "A colleague is standing nearby.",
                "The electronic order will not appear for some time."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Read the complete order back, ask the provider to confirm each element, and clarify the unclear word before ending the call; enter it as a verbal order only if policy allows.",
                      rationale: "Read-back and verification are the check-back loop for verbal orders, and they matter most for high-alert drugs on a bad line. An unclear element is clarified, never assumed.",
                      citationIDs: [S.ahrqTeamSTEPPS.id, S.openrnPharmacology.id]),
                .init("Enter what you heard and let pharmacy catch any problem.",
                      rationale: "Pharmacy is a safety net, not a substitute for verification at the point the order is received.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Ask the colleague what they think the provider meant.",
                      rationale: "A colleague who was not on the call cannot verify it. Verification comes from the person who gave the order.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Give the medication as you understood it since the provider was in a hurry.",
                      rationale: "The provider's hurry is not a reason to accept an unclear order for a high-alert drug.",
                      citationIDs: [S.openrnPharmacology.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Read it back; clarify every unclear word.",
            relatedEntryIDs: ["communication:sbarq", "communication:sbar"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-10-31",
            citations: [S.ahrqTeamSTEPPS, S.openrnPharmacology]
        ),

        MicroCase(
            id: "case-lactate-result",
            title: "The lactate comes back",
            population: .adult,
            step: .evaluateOutcomes,
            stem: "A 66-year-old woman with a urinary tract infection had a sepsis screen triggered two hours ago. Fluids and antibiotics were started. The initial lactate you drew returns markedly elevated. She is still confused, and her blood pressure has only partly recovered.",
            cues: [
                "Lactate is well above the normal range.",
                "Blood pressure improved after the first fluid bolus but remains below her baseline.",
                "Urine output over two hours is minimal.",
                "The provider ordered the first bundle elements and left the floor."
            ],
            prompt: "What should the nurse do with the result?",
            options: [
                .init("Report the elevated lactate to the provider now as a critical value, anticipate a repeat lactate and reassessment of perfusion, and continue frequent vital signs.",
                      rationale: "An elevated lactate marks tissue hypoperfusion and defines a higher-risk sepsis pathway with repeat measurement and reassessment. Incomplete blood pressure recovery and low urine output say resuscitation is not finished; the provider needs that picture now.",
                      citationIDs: [S.cdcSepsis.id]),
                .init("File the result; the bundle has already been started.",
                      rationale: "Starting the bundle is not completing it. The lactate changes what happens next.",
                      citationIDs: [S.cdcSepsis.id]),
                .init("Increase the fluid rate yourself until the pressure normalizes.",
                      rationale: "Further fluid is a provider decision that depends on reassessment, particularly in a patient who may not tolerate volume.",
                      citationIDs: [S.cdcSepsis.id]),
                .init("Wait for the next scheduled labs to see whether it trends down.",
                      rationale: "A repeat lactate is ordered on purpose within a defined window, not at the next routine draw.",
                      citationIDs: [S.cdcSepsis.id])
            ],
            bestOptionIndex: 0,
            takeaway: "A high lactate reopens the sepsis plan.",
            relatedEntryIDs: ["lab:lactate", "diagnosis:sepsis"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-11-01",
            citations: [S.cdcSepsis]
        ),
    ]
}
