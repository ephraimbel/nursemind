import Foundation

// Curated patient-education reference entries — Open RN (CC BY 4.0), CDC
// public-domain, NIH/NHLBI public-domain. Used for discharge teaching across
// settings. Tier-A RN review pending pre-launch.

private let openrnTeaching = CitationSource(
    id: "openrn_teaching",
    shortName: "Open RN — Patient Teaching & Self-Management chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=patient+teaching+discharge",
    lastRetrieved: "2026-05-04"
)

private let cdcDiabetes = CitationSource(
    id: "cdc_diabetes_management",
    shortName: "CDC — Diabetes Self-Management Education & Support",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/diabetes/dsmes-toolkit/",
    lastRetrieved: "2026-05-04"
)

private let nhlbiHF = CitationSource(
    id: "nhlbi_heart_failure",
    shortName: "NIH/NHLBI — Heart Failure: Living With",
    publisher: "National Heart, Lung, and Blood Institute",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/heart-failure/living-with",
    lastRetrieved: "2026-05-04"
)

private let nhlbiCOPD = CitationSource(
    id: "nhlbi_copd",
    shortName: "NIH/NHLBI — COPD: Living With & Treatments",
    publisher: "National Heart, Lung, and Blood Institute",
    license: .publicDomain,
    url: "https://www.nhlbi.nih.gov/health/copd/treatment",
    lastRetrieved: "2026-05-04"
)

// MARK: - Heart Failure Discharge Teaching

public enum HeartFailureTeachingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "heart-failure-teaching",
        title: "Heart failure discharge teaching",
        subtitle: "Daily weights, sodium, fluid, medication, when to call",
        eyebrow: "REFERENCE · TEACHING",
        nclexTags: NCLEXTags(category: .healthPromotion, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Why teaching prevents readmission", AttributedProse("HF readmissions in the first 30 days are often preventable: missed daily weights catch fluid overload too late; high-sodium meals trigger congestion; missed diuretic doses unravel weeks of optimization. Teach-back at discharge is the safety net.", citationIDs: ["nhlbi_heart_failure"])),
            .bullets(title: "Daily weights — the single most important teaching", [
                AttributedBullet("Weigh every morning, AT THE SAME TIME, in the SAME CLOTHES, AFTER urinating, BEFORE eating or drinking.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Use the same scale every day. Write the number down.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Call the clinic if: gain ≥2 lb in 1 day OR ≥5 lb in 1 week.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("This is the earliest sign of fluid building up — earlier than swelling or shortness of breath.", citationIDs: ["nhlbi_heart_failure"])
            ]),
            .keyValueTable(title: "Sodium and fluid restriction", [
                KeyValueRow(key: "Sodium", value: "Limit to 2,000 mg/day (some patients 1,500). Read labels — \"sodium\" not \"salt.\""),
                KeyValueRow(key: "Hidden sodium sources", value: "Canned soup, deli meat, frozen meals, pickles, soy sauce, restaurant food, condiments"),
                KeyValueRow(key: "Fluid", value: "Often 1.5–2 L/day total (per provider). Includes ALL liquids: water, coffee, tea, soup, ice cream, popsicles, gelatin"),
                KeyValueRow(key: "Tracking", value: "Use a marked water bottle. Don't count fluid in your meals separately if it's in the limit.")
            ]),
            .bullets(title: "Medications — take exactly as prescribed", [
                AttributedBullet("Diuretic (Lasix / furosemide): take in the morning to avoid nighttime urination. Don't skip even if feeling well.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("ACE inhibitor / ARB (lisinopril, losartan): may cause dry cough; report severe lightheadedness.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Beta-blocker (metoprolol, carvedilol): take with food; report HR <50 or extreme fatigue.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Spironolactone: increases potassium — avoid salt substitutes (often potassium chloride).", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Bring all medication bottles to every appointment.", citationIDs: ["openrn_teaching"])
            ]),
            .bullets(title: "Activity and lifestyle", [
                AttributedBullet("Aerobic activity (walking, biking) most days as tolerated. Cardiac rehab if ordered.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Limit alcohol or avoid (per provider).", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Quit smoking — community resources (1-800-QUIT-NOW). Smoking cessation is the single biggest modifiable risk factor.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Get the flu shot annually and pneumococcal vaccines per schedule — respiratory infections trigger HF exacerbations.", citationIDs: ["nhlbi_heart_failure"])
            ]),
            .bullets(title: "Call the clinic — early warning signs", [
                AttributedBullet("Weight gain ≥2 lb overnight or ≥5 lb in a week.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Increased shortness of breath, especially at rest or lying flat (orthopnea).", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Need to sleep on more pillows than usual to breathe.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("New or worsening leg/foot/ankle swelling.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Persistent dry cough or wet/wheezing cough.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("New fatigue making daily tasks much harder.", citationIDs: ["nhlbi_heart_failure"])
            ]),
            .bullets(title: "Call 911 — emergency signs", [
                AttributedBullet("Severe shortness of breath that doesn't improve with sitting up.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Chest pain that doesn't go away with rest or your nitro.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Fainting or near-fainting.", citationIDs: ["nhlbi_heart_failure"]),
                AttributedBullet("Confusion or extreme anxiety.", citationIDs: ["nhlbi_heart_failure"])
            ])
        ],
        citations: [openrnTeaching, nhlbiHF],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Diabetes Self-Management Teaching

public enum DiabetesTeachingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "diabetes-self-management-teaching",
        title: "Diabetes self-management teaching",
        subtitle: "Insulin, glucose monitoring, sick days, hypoglycemia",
        eyebrow: "REFERENCE · TEACHING",
        nclexTags: NCLEXTags(category: .healthPromotion, priorityConcept: .glucoseRegulation),
        sections: [
            .prose(title: "What every diabetes patient needs to leave with", AttributedProse("Self-management is the entire treatment plan. The patient is making 1,000 decisions a day that the clinician never sees. Teach the seven AADE skills: healthy eating, being active, monitoring, taking medication, problem-solving, reducing risks, and healthy coping.", citationIDs: ["cdc_diabetes_management"])),
            .keyValueTable(title: "Glucose monitoring basics", [
                KeyValueRow(key: "Fingerstick technique", value: "Wash hands with warm water (not alcohol — affects reading). Use side of fingertip, not pad. Rotate fingers."),
                KeyValueRow(key: "Typical targets (per provider)", value: "Fasting/pre-meal 80–130 mg/dL; 2-hr post-meal <180 mg/dL; A1C <7%"),
                KeyValueRow(key: "When to check", value: "Per provider — typically AC and HS for insulin users; less for non-insulin"),
                KeyValueRow(key: "CGM (continuous glucose monitor)", value: "Time-in-range >70% is the target. Calibrate per device. Interstitial reading lags blood by ~10–15 min")
            ]),
            .bullets(title: "Insulin teaching", [
                AttributedBullet("Rotate sites within an area (e.g., abdomen) to prevent lipohypertrophy. Move ~1 inch each time.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Inject at 90° angle if normal weight; 45° for thin patients.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Don't aspirate. Don't massage after injection.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Refrigerate unopened vials/pens. Once opened, store at room temp 28 days for most insulins (check label).", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Mixing NPH and regular insulin in same syringe: clear before cloudy (regular drawn first, then NPH).", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Check for cloudy appearance in clear insulins (regular, glargine, lispro, aspart) — discard if cloudy.", citationIDs: ["openrn_teaching"])
            ]),
            .keyValueTable(title: "Hypoglycemia (BG <70)", [
                KeyValueRow(key: "Symptoms", value: "Shakiness, sweating, hunger, anxiety, irritability, palpitations, confusion, slurred speech"),
                KeyValueRow(key: "Severe", value: "Loss of consciousness, seizure"),
                KeyValueRow(key: "Rule of 15", value: "15 g fast carbs → wait 15 min → recheck. If still <70, repeat. If >70, eat protein + carb meal/snack"),
                KeyValueRow(key: "15 g fast carbs", value: "4 oz juice OR 4 oz regular soda OR 3–4 glucose tablets OR 1 tbsp honey OR 1 tbsp sugar in water"),
                KeyValueRow(key: "DON'T", value: "Don't use diet soda, sugar-free anything, fat-containing foods (slows absorption)"),
                KeyValueRow(key: "Severe (unconscious)", value: "Glucagon kit (subq or IM); call 911. Do NOT put food in mouth of unconscious patient")
            ]),
            .bullets(title: "Sick-day rules", [
                AttributedBullet("Continue insulin even if not eating — illness raises blood sugar.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Check blood sugar every 2–4 hours.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Drink fluids — sugar-free if blood sugar high, sugar-containing if low.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Check ketones (urine or blood) if BG >240 (type 1) or vomiting (any).", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Call provider if: vomiting >2 times, BG >240 with positive ketones, fever >101.5, can't keep fluids down.", citationIDs: ["cdc_diabetes_management"])
            ]),
            .bullets(title: "Foot care — life-or-limb teaching", [
                AttributedBullet("Inspect feet daily — top, bottom, between toes. Use mirror for soles. Look for cuts, blisters, redness, drainage.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Wash daily with warm (not hot) water; dry thoroughly between toes.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Moisturize tops and bottoms of feet — NOT between toes (encourages fungus).", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Cut nails straight across (not into corners). Have podiatrist cut if vision/dexterity poor.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Never go barefoot, even at home. Check shoes for foreign objects before wearing.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Annual comprehensive foot exam by provider.", citationIDs: ["cdc_diabetes_management"])
            ]),
            .bullets(title: "Call provider", [
                AttributedBullet("BG >300 or <60 not responding to treatment.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Positive ketones with hyperglycemia.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Foot wound, redness, drainage, or pain.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Repeated hypoglycemia.", citationIDs: ["cdc_diabetes_management"]),
                AttributedBullet("Symptoms of DKA (type 1): nausea, vomiting, fruity breath, fast deep breathing.", citationIDs: ["cdc_diabetes_management"])
            ])
        ],
        citations: [openrnTeaching, cdcDiabetes],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - COPD Discharge Teaching

public enum COPDTeachingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "copd-discharge-teaching",
        title: "COPD discharge teaching",
        subtitle: "Inhaler technique, energy conservation, action plan",
        eyebrow: "REFERENCE · TEACHING",
        nclexTags: NCLEXTags(category: .healthPromotion, priorityConcept: .gasExchange),
        sections: [
            .prose(title: "Living well with COPD", AttributedProse("COPD progresses, but exacerbations are largely preventable. Teaching focuses on inhaler technique (most patients use them wrong), trigger avoidance, energy conservation, and the COPD action plan — green/yellow/red zones for what to do based on symptoms.", citationIDs: ["nhlbi_copd"])),
            .numberedSteps(title: "Metered-dose inhaler (MDI) technique", [
                "Shake the inhaler well.",
                "Exhale fully, away from the inhaler.",
                "Place mouthpiece between teeth, lips sealed (or use spacer — strongly recommended).",
                "Press inhaler down at start of slow inhalation.",
                "Inhale slowly and deeply over 3–5 seconds.",
                "Hold breath for 10 seconds (or as long as comfortable).",
                "Exhale slowly.",
                "Wait 30–60 seconds before second puff if ordered.",
                "Rinse mouth with water and spit out (especially after corticosteroid inhalers — prevents thrush)."
            ], citationIDs: ["openrn_teaching"]),
            .keyValueTable(title: "Inhaler types", [
                KeyValueRow(key: "MDI (e.g., albuterol HFA)", value: "Press + inhale coordinated. Use spacer for better delivery."),
                KeyValueRow(key: "DPI (e.g., Advair Diskus)", value: "Breath-activated. NO spacer. Inhale FAST and deep, not slow."),
                KeyValueRow(key: "Soft mist (Spiriva Respimat)", value: "Slow and deep, like MDI. Press + inhale coordinated."),
                KeyValueRow(key: "Nebulizer", value: "Tidal breathing for 10–15 min until medication finishes. Good for acute distress.")
            ]),
            .keyValueTable(title: "COPD action plan — green / yellow / red", [
                KeyValueRow(key: "GREEN — doing well", value: "Usual symptoms, sleeping well, doing usual activities. Continue baseline meds."),
                KeyValueRow(key: "YELLOW — caution", value: "More cough/sputum/wheezing/SOB OR change in sputum color. Increase rescue inhaler; start steroid burst per plan; call clinic."),
                KeyValueRow(key: "RED — danger", value: "Severe SOB at rest, no relief from rescue inhaler, can't speak full sentences, blue lips, confusion. CALL 911 OR GO TO ER.")
            ]),
            .bullets(title: "Trigger avoidance", [
                AttributedBullet("Smoking cessation — single biggest modifiable factor. Resources: 1-800-QUIT-NOW.", citationIDs: ["nhlbi_copd"]),
                AttributedBullet("Avoid second-hand smoke, wood smoke, strong perfumes, household cleaning fumes.", citationIDs: ["nhlbi_copd"]),
                AttributedBullet("Cold/dry air — cover mouth/nose with scarf in winter.", citationIDs: ["nhlbi_copd"]),
                AttributedBullet("Annual flu shot, pneumonia vaccine per schedule, COVID-19 vaccines.", citationIDs: ["nhlbi_copd"]),
                AttributedBullet("Hand hygiene during cold/flu season.", citationIDs: ["nhlbi_copd"])
            ]),
            .bullets(title: "Energy conservation (the 4 P's)", [
                AttributedBullet("Plan: schedule activities for highest-energy time of day; rest before big tasks.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Prioritize: do most important things first; skip non-essentials.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Pace: alternate activity with rest; pursed-lip breathing during exertion.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Position: lean forward on elbows during SOB (tripod position); use shower bench, raised toilet seat.", citationIDs: ["openrn_teaching"])
            ]),
            .bullets(title: "Pursed-lip breathing", [
                AttributedBullet("Inhale slowly through nose for 2 counts.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Pucker lips like blowing out a candle.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Exhale slowly through pursed lips for 4 counts.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Use during SOB, exertion, or anxiety. Lengthens expiration, opens small airways.", citationIDs: ["openrn_teaching"])
            ]),
            .bullets(title: "Home oxygen safety (if applicable)", [
                AttributedBullet("No smoking — within 8 feet of any oxygen equipment.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Keep oxygen away from open flames, stoves, candles, heating sources.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Don't use petroleum-based products (Vaseline, oil-based lotions) on face — flammable with O2.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Secure tubing — falls are common; use long enough tubing or extender.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Stick to prescribed L/min — too much oxygen can blunt the COPD respiratory drive.", citationIDs: ["openrn_teaching"])
            ])
        ],
        citations: [openrnTeaching, nhlbiCOPD],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - General Discharge Teaching Framework

public enum DischargeTeachingFrameworkSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "discharge-teaching-framework",
        title: "Discharge teaching framework",
        subtitle: "Universal framework, teach-back, the AHRQ 'IDEAL' discharge",
        eyebrow: "REFERENCE · TEACHING",
        nclexTags: NCLEXTags(category: .healthPromotion),
        sections: [
            .prose(title: "Why structure matters", AttributedProse("Patients remember 40–80% of medical information they receive at discharge — and half of what they remember is wrong. A structured framework, teach-back, and written materials shift these numbers. AHRQ's IDEAL discharge planning is the most-studied approach.", citationIDs: ["openrn_teaching"])),
            .keyValueTable(title: "AHRQ IDEAL Discharge", [
                KeyValueRow(key: "I — Include", value: "Patient AND family/caregiver in discharge planning from admission"),
                KeyValueRow(key: "D — Discuss", value: "5 areas: condition, what to expect, medications, daily routines, warning signs"),
                KeyValueRow(key: "E — Educate", value: "In plain language, with written materials at appropriate reading level"),
                KeyValueRow(key: "A — Assess", value: "Understanding using teach-back ('In your own words, what is your medication for?')"),
                KeyValueRow(key: "L — Listen", value: "Honor patient's goals, concerns, preferences — they shape what teaching sticks")
            ]),
            .bullets(title: "Teach-back — the most important tool", [
                AttributedBullet("Use it for every key teaching point. Not 'Do you understand?' but 'In your own words, tell me how you'll take this medication when you get home.'", citationIDs: ["openrn_teaching"]),
                AttributedBullet("If they get it wrong: don't say 'no,' just say 'Let me explain it differently' and re-teach.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Document teach-back results — not just that teaching was done.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Repeat teach-back at next opportunity if anything was unclear.", citationIDs: ["openrn_teaching"])
            ]),
            .bullets(title: "Universal teaching elements (every patient, every diagnosis)", [
                AttributedBullet("Diagnosis in plain language — what the condition is, in 2 sentences.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Medications — name, purpose, dose, route, schedule, top side effects, what to do if missed.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Activity restrictions — driving, lifting, sex, return to work — with timeframes.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Diet — restrictions or recommendations specific to condition.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Wound/incision care if surgical — when to remove dressing, when to shower, signs of infection.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Follow-up appointments — date, time, location, what to bring, who is going.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("When to call the clinic — specific symptoms with thresholds.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("When to call 911 — specific emergent symptoms.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Equipment / DME — how to use it, who to call for replacement.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Home services arranged — VNA, PT/OT, hospice — names and phone numbers.", citationIDs: ["openrn_teaching"])
            ]),
            .bullets(title: "Health literacy considerations", [
                AttributedBullet("Use plain language: 'high blood pressure' not 'hypertension'; 'kidney problem' not 'renal insufficiency'.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Avoid medical jargon. If you must use a term, define it: 'edema — that's swelling.'", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Use 'show me' for procedures (insulin injection, inhaler use, dressing change). Verbal alone isn't enough.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Provide written materials at 6th-grade reading level or below; pictures help.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Confirm preferred language; use medical interpreter (not family) for any teaching when needed.", citationIDs: ["openrn_teaching"])
            ]),
            .bullets(title: "Common discharge teaching gaps to actively address", [
                AttributedBullet("Patient doesn't know name of new medication or its purpose.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("No follow-up appointment scheduled or location/time unclear.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("Patient doesn't know what to do if symptoms return.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("No emergency contact for questions before next appointment.", citationIDs: ["openrn_teaching"]),
                AttributedBullet("No coordination with home services patient was supposed to receive.", citationIDs: ["openrn_teaching"])
            ])
        ],
        citations: [openrnTeaching],
        lastSourceFidelityReview: "2026-05-04"
    )
}
