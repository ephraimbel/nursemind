import Foundation

private typealias S = MicroCaseSources

/// Batch 02 — 2026-10-03 … 2026-10-17. Pending Tier A review where marked.
enum MicroCasesBatch02 {
    static let cases: [MicroCase] = [
        MicroCase(
            id: "case-magnesium-reflexes",
            title: "The reflexes are gone",
            population: .obstetric,
            step: .recognizeCues,
            stem: "A 31-year-old woman with severe preeclampsia has been receiving a magnesium infusion for several hours to prevent seizures. At your hourly check she is drowsy and says her whole body feels heavy and warm.",
            cues: [
                "Patellar reflexes cannot be elicited on either side.",
                "Respiratory rate is lower than the previous hour.",
                "Urine output over the last hours has been scant.",
                "She answers questions slowly but correctly."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Stop the magnesium infusion, notify the provider immediately, and have the reversal agent at the bedside.",
                      rationale: "Absent deep tendon reflexes with a slowing respiratory rate are the signs of magnesium toxicity, and reduced urine output means the drug is accumulating. Stopping the infusion is a nursing action; the antidote is prepared while the provider is called.",
                      citationIDs: [S.openrnPharmacology.id, S.cdcHearHer.id]),
                .init("Document the reflex finding and recheck in an hour, since drowsiness is expected on magnesium.",
                      rationale: "Drowsiness alone can be expected; loss of reflexes with respiratory slowing is not. An hour of continued infusion in a patient who is not clearing the drug risks respiratory arrest.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Increase her oxygen and continue the infusion at the ordered rate.",
                      rationale: "Oxygen does not address the cause. The infusion itself is the problem while reflexes are absent.",
                      citationIDs: [S.openrnPharmacology.id]),
                .init("Encourage oral fluids to improve her urine output.",
                      rationale: "Oral fluids will not correct the toxicity already present and do nothing for the respiratory slowing.",
                      citationIDs: [S.cdcHearHer.id])
            ],
            bestOptionIndex: 0,
            takeaway: "No reflexes on magnesium: stop and call.",
            relatedEntryIDs: ["drip:magnesium-sulfate-drip", "diagnosis:preeclampsia", "scenario:magnesium-toxicity-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety),
            reviewTier: .tierA,
            publishOn: "2026-10-03",
            citations: [S.openrnPharmacology, S.cdcHearHer]
        ),

        MicroCase(
            id: "case-infant-working-to-breathe",
            title: "The quiet infant",
            population: .pediatric,
            step: .recognizeCues,
            stem: "A 4-month-old admitted with bronchiolitis has been fussy and wheezy all shift. At your next check he is quiet, no longer crying, and his mother says he finally seems to be settling down.",
            cues: [
                "Nasal flaring and retractions between the ribs are still present.",
                "Respiratory rate has fallen from very fast to near normal.",
                "He is limp in his mother's arms and hard to engage.",
                "Lips have a slight blue tinge."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("He is improving; the slower breathing means the airway is opening.",
                      rationale: "A falling respiratory rate in an infant who is still retracting and flaring, now limp and dusky, is fatigue, not improvement. Infants tire and stop compensating; this is impending respiratory failure.",
                      citationIDs: [S.cdcRSV.id, S.openrnHealthAlterations.id]),
                .init("He is tiring and heading toward respiratory failure; escalate now and prepare for airway support.",
                      rationale: "Decreasing effort with persistent signs of distress, lethargy and cyanosis are the late signs that precede arrest in infants. Immediate escalation and airway readiness are the response.",
                      citationIDs: [S.cdcRSV.id]),
                .init("He is comfortable because the mother is holding him; let him sleep.",
                      rationale: "Quiet and limp is not the same as comfortable. The absence of crying is a warning in an infant who has been working to breathe.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("He needs suctioning; clear his nose and reassess in thirty minutes.",
                      rationale: "Suction may help earlier in bronchiolitis, but it does not treat exhaustion, and thirty minutes is too long to wait on an infant who is dusky.",
                      citationIDs: [S.cdcRSV.id])
            ],
            bestOptionIndex: 1,
            takeaway: "A tiring infant goes quiet, not better.",
            relatedEntryIDs: ["diagnosis:bronchiolitis", "scenario:peds-respiratory-distress-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-10-04",
            citations: [S.cdcRSV, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-fruity-breath",
            title: "Fruity breath and a stomachache",
            population: .pediatric,
            step: .analyzeCues,
            stem: "A 12-year-old with type 1 diabetes is brought to the emergency department by her father for vomiting and abdominal pain since last night. She has been drinking a lot of water for days. Her father wonders if it is a stomach bug going around school.",
            cues: [
                "Breathing is deep and rapid without visible distress.",
                "Her breath has a sweet, fruity odor.",
                "She is drowsy but answers questions.",
                "Her insulin pump site was changed three days ago and \"has been acting up.\""
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Viral gastroenteritis; start oral rehydration and antiemetics.",
                      rationale: "Vomiting with days of thirst, deep rapid breathing and fruity breath in a child with type 1 diabetes is diabetic ketoacidosis until proven otherwise. Treating it as a stomach bug is the classic missed diagnosis.",
                      citationIDs: [S.niddkDKA.id]),
                .init("Diabetic ketoacidosis; obtain an immediate glucose and ketone check and escalate to the provider for the DKA pathway.",
                      rationale: "Kussmaul breathing, fruity breath, polydipsia and vomiting with a possibly failed insulin delivery form the classic picture. Confirming glucose and ketones and moving onto the pathway quickly is what the nurse controls.",
                      citationIDs: [S.niddkDKA.id, S.openrnHealthAlterations.id]),
                .init("Appendicitis; keep her NPO and request a surgical consult.",
                      rationale: "Abdominal pain in DKA is common and resolves with treatment. A surgical consult before a glucose check delays the treatment that resolves both the pain and the danger.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Dehydration from vomiting; encourage sports drinks in the waiting room.",
                      rationale: "Sugar-containing fluids in undiagnosed DKA worsen the hyperglycemia, and a drowsy child with deep breathing should not be in a waiting room.",
                      citationIDs: [S.niddkDKA.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Vomiting plus type 1 diabetes: check ketones.",
            relatedEntryIDs: ["diagnosis:dka", "scenario:peds-dka-scenario", "drip:insulin-drip"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .glucoseRegulation),
            reviewTier: .tierA,
            publishOn: "2026-10-05",
            citations: [S.niddkDKA, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-pain-out-of-proportion",
            title: "Pain out of proportion",
            population: .adult,
            step: .recognizeCues,
            stem: "A 23-year-old man with a casted tibial fracture from a motorcycle crash rates his leg pain as the worst he has felt, an hour after his last analgesic. He is sweating and cannot get comfortable. His toes are visible below the cast.",
            cues: [
                "Pain increases sharply when you passively stretch his toes.",
                "He describes the leg as tight and burning.",
                "Toes are pink with brisk capillary refill.",
                "Pedal pulse is present."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Give an additional dose of the ordered analgesic and reassess in an hour.",
                      rationale: "Pain that outpaces analgesia and worsens with passive stretch is the earliest sign of compartment syndrome. Medicating and waiting masks the sign while pressure rises and tissue dies.",
                      citationIDs: [S.openrnHealthAlterations.id, S.ahrqPSNet.id]),
                .init("Notify the provider immediately for evaluation of compartment syndrome, keep the limb at heart level, and loosen nothing without an order except to report the cast is tight.",
                      rationale: "Pain with passive stretch and a tight, burning leg is compartment syndrome until measured otherwise. Pulses and color are late to change and their presence is not reassuring. This is a time-critical surgical emergency.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Elevate the leg above the heart to reduce the swelling.",
                      rationale: "Elevating above the heart lowers arterial inflow to a compartment that already has poor perfusion. The limb is kept at heart level.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Document the pink toes and strong pulse as evidence of adequate circulation.",
                      rationale: "Distal pulses persist until compartment pressure is far above the point of muscle damage. Charting them as reassurance is the anchoring error in the original case.",
                      citationIDs: [S.ahrqPSNet.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Pain with passive stretch beats a present pulse.",
            relatedEntryIDs: ["diagnosis:compartment-syndrome", "scenario:compartment-syndrome-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-10-06",
            citations: [S.openrnHealthAlterations, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-quiet-hemorrhage",
            title: "Nothing on the dressing",
            population: .adult,
            step: .analyzeCues,
            stem: "Six hours after a laparoscopic procedure, a 38-year-old woman is increasingly restless and asks for water repeatedly. Her surgical dressings are dry. She says she feels fine but cannot get comfortable in any position.",
            cues: [
                "Heart rate has risen steadily each hour.",
                "Blood pressure has slipped just below her pre-operative baseline.",
                "Her abdomen is more distended than at the last check.",
                "She has produced very little urine since surgery."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Post-anesthesia restlessness and thirst; offer ice chips and reassess.",
                      rationale: "Restlessness, thirst, rising heart rate and falling urine output are the compensated signs of blood loss. A dry dressing says nothing about bleeding inside the abdomen.",
                      citationIDs: [S.openrnHealthAlterations.id, S.ahrqPSNet.id]),
                .init("Possible internal hemorrhage; notify the surgeon now with the trend and prepare for fluid resuscitation and labs.",
                      rationale: "Tachycardia with a drifting pressure, oliguria and growing distension after abdominal surgery is occult bleeding until excluded. Blood pressure holds until late; the nurse escalates on the compensation, not the collapse.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Bladder distension; perform a bladder scan and straight-catheterize if full.",
                      rationale: "A bladder scan is reasonable and quick, but oliguria with tachycardia and hypotension points to volume loss, not retention. It should not delay the surgeon call.",
                      citationIDs: [S.openrnHealthAlterations.id]),
                .init("Uncontrolled pain; give the ordered analgesic and reposition.",
                      rationale: "She denies pain. Treating restlessness as pain sedates a patient who is compensating for blood loss and hides the trend.",
                      citationIDs: [S.ahrqPSNet.id])
            ],
            bestOptionIndex: 1,
            takeaway: "A dry dressing does not rule out bleeding.",
            relatedEntryIDs: ["scenario:covert-hemorrhage-scenario", "lab:lactate"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
            reviewTier: .tierA,
            publishOn: "2026-10-07",
            citations: [S.openrnHealthAlterations, S.ahrqPSNet]
        ),

        MicroCase(
            id: "case-two-days-sober",
            title: "Two days after the last drink",
            population: .adult,
            step: .recognizeCues,
            stem: "A 52-year-old man admitted for pancreatitis told the admitting nurse he drinks \"a few beers.\" On his second hospital night he is sweaty, tremulous and cannot sleep. He asks whether he can go outside for a cigarette.",
            cues: [
                "Fine tremor of both hands.",
                "Heart rate and blood pressure are both higher than admission.",
                "He is anxious and startles at noises.",
                "He mentions seeing shadows move in the corner of the room."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Score him with the unit's withdrawal assessment tool now and notify the provider of the result and the visual disturbance.",
                      rationale: "Tremor, autonomic hyperactivity, anxiety and early perceptual disturbance two days after the last drink is alcohol withdrawal on its way to delirium tremens. Structured scoring guides treatment; the provider needs the score and the hallucination now.",
                      citationIDs: [S.niaaaWithdrawal.id, S.openrnHealthAlterations.id]),
                .init("Give the as-needed sleep medication and dim the lights.",
                      rationale: "Sedating for sleep without assessing withdrawal misses the diagnosis and does not prevent seizures or progression.",
                      citationIDs: [S.niaaaWithdrawal.id]),
                .init("Reassure him that nicotine cravings cause restlessness and offer a patch.",
                      rationale: "Nicotine withdrawal does not produce tremor, hallucinations and autonomic instability. Offering a patch is fine, but it is not the priority.",
                      citationIDs: [S.niaaaWithdrawal.id]),
                .init("Ask him to be honest about how much he drinks before doing anything.",
                      rationale: "The history matters, but confronting him delays assessment and treatment of withdrawal that is already visible.",
                      citationIDs: [S.openrnHealthAlterations.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Tremor on night two: score for withdrawal.",
            relatedEntryIDs: ["diagnosis:alcohol-withdrawal", "scenario:ciwa-monitoring-scenario"],
            nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
            reviewTier: .tierA,
            publishOn: "2026-10-08",
            citations: [S.niaaaWithdrawal, S.openrnHealthAlterations]
        ),

        MicroCase(
            id: "case-chills-during-transfusion",
            title: "Chills ten minutes in",
            population: .adult,
            step: .takeAction,
            stem: "A 70-year-old woman is receiving a unit of packed red cells for symptomatic anemia. About ten minutes after the transfusion began she develops chills, says her back aches, and feels anxious.",
            cues: [
                "Temperature has risen since the pre-transfusion check.",
                "Heart rate is up; blood pressure is slightly lower.",
                "She reports flank and low back pain.",
                "The blood is still infusing."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Stop the transfusion, keep the IV open with normal saline through new tubing, stay with her, and notify the provider and blood bank.",
                      rationale: "Fever, back pain and hemodynamic change early in a transfusion are treated as an acute reaction. Stopping the blood is the first action; the line stays open, and the unit and tubing are kept for the blood bank.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Slow the transfusion and give the ordered antipyretic.",
                      rationale: "Slowing keeps incompatible blood infusing. Back pain with fever is not a reaction to slow through.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Apply a warm blanket for the chills and recheck vitals in fifteen minutes.",
                      rationale: "Chills at the start of a transfusion are a reaction sign, not a comfort issue. Fifteen minutes is the time in which a hemolytic reaction becomes shock.",
                      citationIDs: [S.openrnSkills.id]),
                .init("Flush the blood through the existing tubing to finish the unit quickly.",
                      rationale: "This delivers more of the suspect product. The remaining blood in the tubing must not reach the patient.",
                      citationIDs: [S.openrnSkills.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Reaction signs: stop the blood, keep the line.",
            relatedEntryIDs: ["diagnosis:transfusion-reaction", "procedure:blood-transfusion"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety),
            reviewTier: .tierA,
            publishOn: "2026-10-09",
            citations: [S.openrnSkills]
        ),

        MicroCase(
            id: "case-red-heel",
            title: "The heel that stays red",
            population: .adult,
            step: .evaluateOutcomes,
            stem: "A 77-year-old man with heart failure has been on bed rest for three days. During morning care you notice a reddened area over his right heel. He does not feel it and says it does not hurt.",
            cues: [
                "The redness does not blanch when you press it.",
                "Skin is intact.",
                "He has diminished sensation in both feet from long-standing diabetes.",
                "He is repositioned when he asks, which is rarely."
            ],
            prompt: "Which interpretation and step come first?",
            options: [
                .init("Stage 1 pressure injury; offload the heel completely, start a scheduled repositioning plan, and document the finding with the risk assessment.",
                      rationale: "Non-blanchable redness over a bony prominence in intact skin is a stage 1 pressure injury. Heels are offloaded entirely, and repositioning moves from on-request to scheduled. Neuropathy means he cannot report the warning pain.",
                      citationIDs: [S.ahrqPressureInjury.id, S.openrnFundamentals.id]),
                .init("Reactive redness from the mattress; it will fade once he sits up.",
                      rationale: "Blanchable redness fades; non-blanchable redness is tissue damage that has already begun.",
                      citationIDs: [S.ahrqPressureInjury.id]),
                .init("Massage the area to improve circulation.",
                      rationale: "Massage over a pressure injury damages fragile tissue further and is contraindicated.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Apply a heel protector and continue repositioning when he asks.",
                      rationale: "Protectors cushion but do not offload, and on-request turning is what allowed the injury. The schedule must change.",
                      citationIDs: [S.ahrqPressureInjury.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Non-blanchable means injury; offload the heel.",
            relatedEntryIDs: ["diagnosis:pressure-injury", "scenario:pressure-injury-prevention-scenario"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
            reviewTier: .tierB,
            publishOn: "2026-10-10",
            citations: [S.ahrqPressureInjury, S.openrnFundamentals]
        ),

        MicroCase(
            id: "case-what-to-delegate",
            title: "Four tasks, one assistant",
            population: .adult,
            step: .generateSolutions,
            stem: "You are the RN for five patients with one nursing assistant. Four things need doing now: a bath for a stable patient, vital signs on a patient one hour post-transfusion, the first ambulation of a patient after a fall yesterday, and admission teaching for a new insulin start.",
            cues: [
                "The assistant is competent and asks what to take.",
                "The post-transfusion patient had no reaction during the transfusion.",
                "The fall patient has not been out of bed since the fall.",
                "The insulin patient's spouse is at the bedside and anxious."
            ],
            prompt: "Which task is appropriate to delegate to the assistant?",
            options: [
                .init("The bath for the stable patient.",
                      rationale: "Routine hygiene for a stable patient is squarely within an assistant's scope. The other three require RN assessment or teaching at this moment.",
                      citationIDs: [S.openrnManagement.id]),
                .init("The first ambulation after yesterday's fall.",
                      rationale: "A first walk after a fall is an assessment of gait and safety, not a routine task. The RN evaluates it before it can be delegated.",
                      citationIDs: [S.openrnManagement.id, S.ahrqFalls.id]),
                .init("Vital signs on the post-transfusion patient, since the transfusion went smoothly.",
                      rationale: "Assistants can take vital signs, but interpreting post-transfusion vitals for a delayed reaction is an RN judgment; delegating the numbers without the interpretation is where errors occur. At minimum the RN sets the parameters and reviews them immediately.",
                      citationIDs: [S.openrnManagement.id]),
                .init("The insulin teaching, because the spouse is there to help.",
                      rationale: "Patient education for a new high-alert medication is never delegated.",
                      citationIDs: [S.openrnManagement.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Delegate tasks, never assessment or teaching.",
            relatedEntryIDs: ["scenario:delegation-scenario", "scenario:prioritization-scenario"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-10-11",
            citations: [S.openrnManagement, S.ahrqFalls]
        ),

        MicroCase(
            id: "case-who-first",
            title: "Four call lights at once",
            population: .adult,
            step: .prioritizeHypotheses,
            stem: "Returning from a break you find four call lights on. One patient wants help to the bathroom, one reports new chest pressure that started five minutes ago, one has an IV pump alarming for occlusion, and one asks for pain medication that is due.",
            cues: [
                "The chest-pressure patient was admitted with a cardiac history.",
                "The bathroom patient is a fall risk and has been waiting.",
                "The pump alarm is on a maintenance fluid line.",
                "The pain-medication patient rates pain as moderate."
            ],
            prompt: "Whom does the nurse see first?",
            options: [
                .init("The patient with new chest pressure.",
                      rationale: "New chest pressure in a cardiac patient is a potential threat to circulation and life; it outranks comfort, convenience and equipment. Assessing it first is the ABC logic of prioritization.",
                      citationIDs: [S.openrnManagement.id]),
                .init("The fall-risk patient who needs the bathroom, before he tries alone.",
                      rationale: "A real safety concern, and it should be delegated immediately to an assistant, but it does not outrank a possible cardiac event for the RN's own first minutes.",
                      citationIDs: [S.openrnManagement.id, S.ahrqFalls.id]),
                .init("The occluded IV pump, because alarms must be silenced.",
                      rationale: "An occluded maintenance line is an equipment issue with no immediate physiologic threat.",
                      citationIDs: [S.openrnManagement.id]),
                .init("The patient whose pain medication is due, to stay on schedule.",
                      rationale: "Moderate pain matters and will be addressed soon, but it is stable and expected; it does not compete with new chest pressure.",
                      citationIDs: [S.openrnManagement.id])
            ],
            bestOptionIndex: 0,
            takeaway: "New chest pressure beats every other light.",
            relatedEntryIDs: ["scenario:prioritization-scenario"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .perfusion),
            reviewTier: .tierB,
            publishOn: "2026-10-12",
            citations: [S.openrnManagement, S.ahrqFalls]
        ),

        MicroCase(
            id: "case-call-rapid-response",
            title: "Not sick enough to call?",
            population: .adult,
            step: .takeAction,
            stem: "A 58-year-old man admitted with cellulitis tells you he feels \"a little off\" and cannot say why. His vitals have shifted modestly since the morning. You feel uneasy but nothing on the flowsheet crosses a calling threshold, and the provider is in a procedure.",
            cues: [
                "Heart rate is higher and blood pressure lower than this morning's readings.",
                "He is slightly confused about the day.",
                "Skin over the infected leg is more red and warm than yesterday.",
                "The rapid response team is available for any staff concern."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Activate the rapid response team on the basis of worry and the changes, and keep him on close monitoring while they arrive.",
                      rationale: "Staff worry is an explicit activation criterion in rapid response systems, because concern precedes the numbers. Early activation for a spreading infection with early confusion and hemodynamic drift is exactly what the system is for.",
                      citationIDs: [S.ahrqTeamSTEPPS.id, S.cdcSepsis.id]),
                .init("Wait until the provider finishes the procedure, then page.",
                      rationale: "Waiting on an unavailable provider is a common thread in failure-to-rescue reviews. Rapid response exists so the nurse does not have to wait.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Recheck vitals every fifteen minutes and call only if a threshold is crossed.",
                      rationale: "Thresholds are late. Trending toward them with new confusion is the moment to escalate, not the moment to schedule more vitals.",
                      citationIDs: [S.ahrqTeamSTEPPS.id, S.cdcSepsis.id]),
                .init("Ask the charge nurse whether you are overreacting.",
                      rationale: "Consulting the charge nurse is fine in parallel, but seeking permission to worry delays the call.",
                      citationIDs: [S.ahrqTeamSTEPPS.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Worry is a rapid response criterion.",
            relatedEntryIDs: ["scenario:rapid-response-scenario", "diagnosis:sepsis", "communication:chain-of-command-escalation"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-10-13",
            citations: [S.ahrqTeamSTEPPS, S.cdcSepsis]
        ),

        MicroCase(
            id: "case-the-anxious-label",
            title: "Charted as anxious",
            population: .adult,
            step: .analyzeCues,
            stem: "A 41-year-old woman with a documented anxiety disorder is admitted overnight with shortness of breath that the emergency department attributed to a panic attack. On your assessment she is calm but still breathing faster than normal, and says the breathlessness is worse lying flat.",
            cues: [
                "Respiratory rate remains elevated while she is calm.",
                "Oxygen saturation is lower than expected for her age.",
                "She has been on an oral contraceptive and recently drove eleven hours.",
                "Her legs are not swollen."
            ],
            prompt: "Which interpretation should drive the nurse's next step?",
            options: [
                .init("Her anxiety diagnosis explains the tachypnea; provide reassurance and relaxation coaching.",
                      rationale: "Anchoring on a psychiatric label while the respiratory findings persist at rest is diagnostic anchoring, the error the original case documents. Anxiety does not lower oxygen saturation in a calm patient.",
                      citationIDs: [S.ahrqPSNet.id]),
                .init("The persistent tachypnea, low saturation and clot risk factors need a fresh evaluation; report them now as new findings, not as anxiety.",
                      rationale: "Objective respiratory abnormality in a calm patient with venous thromboembolism risk factors warrants reevaluation for pulmonary embolism. The nurse's job is to present the findings without the label.",
                      citationIDs: [S.ahrqPSNet.id, S.nhlbiVTE.id]),
                .init("Deconditioning from the long drive; encourage ambulation.",
                      rationale: "A long drive is a risk factor for clots, not an explanation for hypoxemia. Ambulating before evaluation is unsafe.",
                      citationIDs: [S.nhlbiVTE.id]),
                .init("Continue the emergency department plan; they saw her first.",
                      rationale: "Prior assessments inform but do not close the question when new objective data disagree.",
                      citationIDs: [S.ahrqPSNet.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Labels explain feelings, not oxygen saturation.",
            relatedEntryIDs: ["scenario:diagnostic-anchoring-scenario", "diagnosis:pulmonary-embolism"],
            nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
            reviewTier: .tierA,
            publishOn: "2026-10-14",
            citations: [S.ahrqPSNet, S.nhlbiVTE]
        ),

        MicroCase(
            id: "case-before-the-restraint",
            title: "Before the restraint",
            population: .adult,
            step: .generateSolutions,
            stem: "An 83-year-old woman recovering from hip surgery keeps trying to climb out of bed at night and has pulled at her IV twice. The night charge nurse suggests soft wrist restraints so staff can get through the shift.",
            cues: [
                "She says she needs to get to the bathroom.",
                "She has not been offered toileting in four hours.",
                "Her hearing aids are on the bedside table.",
                "She is more settled when her granddaughter sits with her."
            ],
            prompt: "What should the nurse do first?",
            options: [
                .init("Apply the soft restraints and obtain the order afterward.",
                      rationale: "Restraints are a last resort after alternatives fail, require an order and ongoing assessment, and increase injury and delirium. Applying them to manage staffing is not a clinical indication.",
                      citationIDs: [S.openrnFundamentals.id, S.ahrqPSNet.id]),
                .init("Address the unmet needs first: scheduled toileting, hearing aids in, bed alarm on, and family or a sitter at the bedside.",
                      rationale: "The behaviors have a cause: an unmet toileting need, sensory deprivation and isolation. Meeting them is both the standard of care and the effective intervention; restraints would treat the symptom and worsen the cause.",
                      citationIDs: [S.openrnFundamentals.id, S.ahrqFalls.id]),
                .init("Request a sedative so she sleeps through the night.",
                      rationale: "Chemical restraint carries the same ethical and safety problems, and sedatives raise fall and delirium risk in older adults.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Raise all four side rails to keep her in bed.",
                      rationale: "Four raised rails are a restraint and increase the height of any fall when she climbs over them.",
                      citationIDs: [S.ahrqFalls.id])
            ],
            bestOptionIndex: 1,
            takeaway: "Meet the need before you restrain.",
            relatedEntryIDs: ["scenario:restraint-safety-scenario", "scenario:falls-prevention-scenario", "diagnosis:delirium"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-10-15",
            citations: [S.openrnFundamentals, S.ahrqPSNet, S.ahrqFalls]
        ),

        MicroCase(
            id: "case-two-challenge",
            title: "Say it twice",
            population: .adult,
            step: .takeAction,
            stem: "During a rapid medication order for a deteriorating patient, the provider reads out a drug you believe the patient is allergic to. You mention the allergy. The provider, focused on the monitor, says \"it's fine\" and continues.",
            cues: [
                "The allergy is listed on the wristband and in the chart.",
                "The room is loud and the provider is under pressure.",
                "The medication has been drawn up and is in your hand.",
                "No one else has heard your concern."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Restate the concern clearly a second time, naming the allergy, and hold the medication until it is acknowledged; escalate up the chain if it is not.",
                      rationale: "The Two-Challenge Rule exists for this moment: a safety concern is voiced twice, and if it is still not acknowledged the nurse stops the line and escalates. Holding a drug you believe is contraindicated is within scope and expected.",
                      citationIDs: [S.ahrqTeamSTEPPS.id]),
                .init("Give the medication; the provider has taken responsibility by saying it is fine.",
                      rationale: "\"It's fine\" is not an acknowledgment of the specific concern, and the nurse who administers shares responsibility for harm.",
                      citationIDs: [S.ahrqTeamSTEPPS.id, S.ahrqPSNet.id]),
                .init("Quietly substitute a similar medication you know the patient tolerates.",
                      rationale: "Substituting without an order is outside scope and hides the problem from the team.",
                      citationIDs: [S.openrnManagement.id]),
                .init("File a safety report after the event.",
                      rationale: "Reporting afterward is appropriate, but it does not protect the patient in front of you.",
                      citationIDs: [S.ahrqTeamSTEPPS.id])
            ],
            bestOptionIndex: 0,
            takeaway: "Voice it twice, then stop the line.",
            relatedEntryIDs: ["communication:two-challenge-rule", "scenario:medication-near-miss-scenario", "communication:cus-assertive"],
            nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare, priorityConcept: .safety),
            reviewTier: .tierB,
            publishOn: "2026-10-16",
            citations: [S.ahrqTeamSTEPPS, S.ahrqPSNet, S.openrnManagement]
        ),

        MicroCase(
            id: "case-comfort-focused",
            title: "\"Do something\"",
            population: .adult,
            step: .generateSolutions,
            stem: "An 88-year-old man with end-stage heart failure has chosen comfort-focused care and has a documented do-not-resuscitate order. Overnight his breathing becomes noisy and irregular. His son, at the bedside, begs you to \"do something.\"",
            cues: [
                "The patient is unresponsive and appears unaware of the secretions.",
                "His son is crying and repeating that his father is choking.",
                "Comfort medications are ordered and available.",
                "The goals-of-care note was written two days ago."
            ],
            prompt: "What should the nurse do?",
            options: [
                .init("Explain what the breathing means, reposition the patient, use the ordered comfort measures for secretions and distress, and stay with the son.",
                      rationale: "Noisy breathing near death is usually not distressing to the patient but is to the family. The nurse honors the plan of care by treating symptoms, repositioning, explaining the process and supporting the son. \"Doing something\" here is comfort and presence.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Call a code because the family is asking you to.",
                      rationale: "A code contradicts the patient's documented decision. Family distress is addressed with information and support, not by overriding the patient's wishes.",
                      citationIDs: [S.openrnFundamentals.id, S.openrnManagement.id]),
                .init("Suction the airway deeply to clear the secretions.",
                      rationale: "Deep suctioning at end of life is uncomfortable and rarely helps; positioning and ordered medications are preferred.",
                      citationIDs: [S.openrnFundamentals.id]),
                .init("Ask the son to wait outside so he is not upset by the sounds.",
                      rationale: "Separating a family member from a dying parent to manage the nurse's discomfort denies both of them the moment. Explanation and presence are the intervention.",
                      citationIDs: [S.openrnFundamentals.id])
            ],
            bestOptionIndex: 0,
            takeaway: "At the end, doing something means comfort.",
            relatedEntryIDs: ["scenario:end-of-life-scenario", "scenario:difficult-family-scenario"],
            nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .painComfort),
            reviewTier: .tierB,
            publishOn: "2026-10-17",
            citations: [S.openrnFundamentals, S.openrnManagement]
        ),
    ]
}
