import Foundation

// Curator-model clinical scales reference cards (v1.5 expansion).
// Sources: Open RN (CC BY 4.0), CDC (public domain), various validated tools (concept
// citations only — NIH Stroke Scale, Glasgow Coma Scale, Wong-Baker FACES, FLACC,
// Braden, CIWA-Ar, COWS, Morse Falls, NYHA, KDIGO, ADA).

private let openrnScales = CitationSource(
    id: "openrn_scales",
    shortName: "Open RN — Nursing Fundamentals / Health Alterations",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/?s=assessment+scale+score",
    lastRetrieved: "2026-05-04"
)
private let cdcScales = CitationSource(
    id: "cdc_scales",
    shortName: "CDC clinical assessment guidance",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/",
    lastRetrieved: "2026-05-04"
)
private let nihStrokeScale = CitationSource(
    id: "nihss_concept",
    shortName: "NIH Stroke Scale (NIHSS) — concept citation",
    publisher: "National Institutes of Health",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/health-information/stroke/nih-stroke-scale",
    lastRetrieved: "2026-05-04"
)
private let gcsConcept = CitationSource(
    id: "gcs_concept",
    shortName: "Glasgow Coma Scale (concept citation)",
    publisher: "Glasgow Coma Scale Education / University of Glasgow",
    license: .factCitationOnly,
    url: "https://www.glasgowcomascale.org/",
    lastRetrieved: "2026-05-04"
)
private let painScalesConcept = CitationSource(
    id: "pain_scales_concept",
    shortName: "Wong-Baker FACES, FLACC, numeric rating scale (concept citation)",
    publisher: "Wong-Baker FACES Foundation; FLACC original publication",
    license: .factCitationOnly,
    url: "https://wongbakerfaces.org/",
    lastRetrieved: "2026-05-04"
)
private let bradenConcept = CitationSource(
    id: "braden_concept",
    shortName: "Braden Scale for Predicting Pressure Sore Risk (concept citation)",
    publisher: "Braden / Bergstrom",
    license: .factCitationOnly,
    url: "https://www.bradenscale.com/",
    lastRetrieved: "2026-05-04"
)
private let nyhaConcept = CitationSource(
    id: "nyha_concept",
    shortName: "NYHA Functional Classification of Heart Failure (concept citation)",
    publisher: "American Heart Association",
    license: .factCitationOnly,
    url: "https://www.heart.org/",
    lastRetrieved: "2026-05-04"
)
private let kdigoConcept = CitationSource(
    id: "kdigo_concept",
    shortName: "KDIGO CKD staging (concept citation)",
    publisher: "Kidney Disease Improving Global Outcomes",
    license: .factCitationOnly,
    url: "https://kdigo.org/guidelines/",
    lastRetrieved: "2026-05-04"
)
private let adaScalesConcept = CitationSource(
    id: "ada_scales_concept",
    shortName: "ADA Standards of Care (DKA / HHS criteria — concept citation)",
    publisher: "American Diabetes Association",
    license: .factCitationOnly,
    url: "https://diabetesjournals.org/care",
    lastRetrieved: "2026-05-04"
)

private let safetyScalesTags = NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety)
private let neuroScaleTags = NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .neurologicalRegulation)

// MARK: - Glasgow Coma Scale

public enum GCSDetailSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "gcs-detail",
        title: "Glasgow Coma Scale (GCS)",
        subtitle: "Eye + Verbal + Motor · range 3–15 · standardized neuro assessment",
        eyebrow: "REFERENCE · NEURO ASSESSMENT",
        nclexTags: neuroScaleTags,
        sections: [
            .keyValueTable(title: "Eye opening (E) — 4 points", [
                KeyValueRow(key: "4", value: "Spontaneously"),
                KeyValueRow(key: "3", value: "To verbal command"),
                KeyValueRow(key: "2", value: "To pain"),
                KeyValueRow(key: "1", value: "No response"),
                KeyValueRow(key: "NT", value: "Not testable (e.g., periorbital edema)")
            ]),
            .keyValueTable(title: "Verbal response (V) — 5 points", [
                KeyValueRow(key: "5", value: "Oriented (person, place, time, situation)"),
                KeyValueRow(key: "4", value: "Confused conversation"),
                KeyValueRow(key: "3", value: "Inappropriate words"),
                KeyValueRow(key: "2", value: "Incomprehensible sounds (moans, groans)"),
                KeyValueRow(key: "1", value: "No verbal response"),
                KeyValueRow(key: "T", value: "Intubated (mark T or NT — assign 1 in calculations or use modified GCS)")
            ]),
            .keyValueTable(title: "Motor response (M) — 6 points", [
                KeyValueRow(key: "6", value: "Obeys commands"),
                KeyValueRow(key: "5", value: "Localizes pain (purposeful)"),
                KeyValueRow(key: "4", value: "Withdraws from pain"),
                KeyValueRow(key: "3", value: "Abnormal flexion (DECORTICATE — flexor posturing toward core)"),
                KeyValueRow(key: "2", value: "Abnormal extension (DECEREBRATE — extensor posturing, worse prognosis)"),
                KeyValueRow(key: "1", value: "No motor response")
            ]),
            .keyValueTable(title: "Total score interpretation", [
                KeyValueRow(key: "13–15", value: "MILD brain injury"),
                KeyValueRow(key: "9–12", value: "MODERATE brain injury"),
                KeyValueRow(key: "≤8", value: "SEVERE brain injury — consider intubation for airway protection")
            ]),
            .bullets(title: "Documentation pearls", [
                AttributedBullet("Always report each component (e.g., E3 V4 M5 = 12) — total alone loses information.", citationIDs: ["gcs_concept"]),
                AttributedBullet("Apply painful stimulus correctly: trapezius squeeze or supraorbital pressure (NOT sternal rub which can cause bruising and is less reproducible).", citationIDs: ["gcs_concept"]),
                AttributedBullet("Best response counts (not worst).", citationIDs: ["gcs_concept"]),
                AttributedBullet("In intubated patients, document V as 'T' (or use a verbal proxy); some institutions use the GCS-P that includes pupil reactivity.", citationIDs: ["gcs_concept"]),
                AttributedBullet("Trend GCS over time — declining score is more important than any single value.", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales, gcsConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NIHSS

public enum NIHSSScalesReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "nihss-reference",
        title: "NIH Stroke Scale (NIHSS)",
        subtitle: "11 items · score 0–42 · stroke severity & treatment selection",
        eyebrow: "REFERENCE · STROKE",
        nclexTags: neuroScaleTags,
        sections: [
            .prose(title: "Purpose", AttributedProse(
                "Standardized 11-item neurologic exam used in acute stroke to quantify deficit severity, guide treatment decisions (especially tPA and thrombectomy eligibility), track changes, and communicate across providers. Range 0 (no deficit) to 42 (most severe). Clinicians performing must complete free NIHSS certification.",
                citationIDs: ["nihss_concept", "openrn_scales"]
            )),
            .keyValueTable(title: "11 items (each scored 0 = normal; higher = worse)", [
                KeyValueRow(key: "1a. Level of consciousness", value: "0 alert · 1 drowsy · 2 stuporous · 3 unresponsive"),
                KeyValueRow(key: "1b. LOC questions (month, age)", value: "0 both correct · 1 one correct · 2 neither"),
                KeyValueRow(key: "1c. LOC commands (open/close eyes; grip)", value: "0 both correct · 1 one · 2 neither"),
                KeyValueRow(key: "2. Best gaze", value: "0 normal · 1 partial gaze palsy · 2 forced deviation"),
                KeyValueRow(key: "3. Visual fields", value: "0 normal · 1 partial hemianopia · 2 complete · 3 bilateral"),
                KeyValueRow(key: "4. Facial palsy", value: "0 normal · 1 minor · 2 partial · 3 complete"),
                KeyValueRow(key: "5/6. Motor arm/leg (each side)", value: "0 no drift · 1 drift · 2 some effort against gravity · 3 no effort against gravity · 4 no movement"),
                KeyValueRow(key: "7. Limb ataxia", value: "0 absent · 1 one limb · 2 two limbs"),
                KeyValueRow(key: "8. Sensory", value: "0 normal · 1 mild loss · 2 severe/total"),
                KeyValueRow(key: "9. Best language", value: "0 normal · 1 mild aphasia · 2 severe · 3 mute/global"),
                KeyValueRow(key: "10. Dysarthria", value: "0 normal · 1 mild · 2 severe"),
                KeyValueRow(key: "11. Extinction/inattention", value: "0 normal · 1 partial · 2 complete")
            ]),
            .keyValueTable(title: "Severity by total score", [
                KeyValueRow(key: "0", value: "No stroke symptoms"),
                KeyValueRow(key: "1–4", value: "Minor stroke"),
                KeyValueRow(key: "5–15", value: "Moderate stroke"),
                KeyValueRow(key: "16–20", value: "Moderate to severe"),
                KeyValueRow(key: "21–42", value: "Severe stroke")
            ]),
            .bullets(title: "Clinical use", [
                AttributedBullet("Baseline NIHSS at stroke presentation; serial assessments at standard intervals during/after intervention.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Higher NIHSS predicts worse outcome but does not exclude tPA — even mild strokes can have devastating impact (aphasia, ataxia).", citationIDs: ["nihss_concept"]),
                AttributedBullet("Thrombectomy eligibility requires NIHSS ≥6 and large-vessel occlusion in most protocols.", citationIDs: ["nihss_concept"]),
                AttributedBullet("Increase in NIHSS by ≥4 = clinical worsening; warrants urgent re-imaging.", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales, nihStrokeScale],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Pain Scales

public enum PainScalesDetailSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "pain-scales-detail",
        title: "Pain assessment scales",
        subtitle: "Numeric, FACES, FLACC, CPOT, BPS — choose by population",
        eyebrow: "REFERENCE · PAIN",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .painComfort),
        sections: [
            .keyValueTable(title: "Numeric Rating Scale (NRS) 0–10", [
                KeyValueRow(key: "Population", value: "Adults and older children able to self-report"),
                KeyValueRow(key: "0", value: "No pain"),
                KeyValueRow(key: "1–3", value: "Mild"),
                KeyValueRow(key: "4–6", value: "Moderate"),
                KeyValueRow(key: "7–10", value: "Severe (10 = worst imaginable)")
            ]),
            .keyValueTable(title: "Wong-Baker FACES Pain Rating Scale", [
                KeyValueRow(key: "Population", value: "Children ≥3 years and adults with cognitive or language barriers"),
                KeyValueRow(key: "Format", value: "6 cartoon faces from 'no hurt' (smiling) to 'hurts worst' (crying); rated 0, 2, 4, 6, 8, 10"),
                KeyValueRow(key: "Use", value: "Have patient point to face that best matches how they feel; do NOT focus only on facial expression observed")
            ]),
            .keyValueTable(title: "FLACC Scale (Face · Legs · Activity · Cry · Consolability)", [
                KeyValueRow(key: "Population", value: "Non-verbal children (typically 2 mo – 7 yr); also for adults unable to communicate"),
                KeyValueRow(key: "Each category 0–2", value: "Total 0–10. Face (0 no expression / 2 frequent grimace), Legs (0 normal / 2 kicking), Activity (0 lying quietly / 2 arched/rigid), Cry (0 none / 2 crying steadily), Consolability (0 content / 2 difficult to console)"),
                KeyValueRow(key: "Interpretation", value: "0 relaxed · 1–3 mild discomfort · 4–6 moderate · 7–10 severe pain or distress")
            ]),
            .keyValueTable(title: "CPOT (Critical-Care Pain Observation Tool)", [
                KeyValueRow(key: "Population", value: "ICU adults unable to self-report (intubated, sedated)"),
                KeyValueRow(key: "Items", value: "Facial expression, body movements, muscle tension, ventilator compliance (intubated) or vocalization (extubated)"),
                KeyValueRow(key: "Score", value: "0–8; ≥3 indicates significant pain")
            ]),
            .keyValueTable(title: "BPS (Behavioral Pain Scale)", [
                KeyValueRow(key: "Population", value: "ICU adults unable to self-report"),
                KeyValueRow(key: "Items", value: "Facial expression, upper limbs, ventilator compliance (each 1–4)"),
                KeyValueRow(key: "Score", value: "3–12; ≥6 indicates pain requiring intervention")
            ]),
            .bullets(title: "Pearls", [
                AttributedBullet("Patient self-report is the GOLD STANDARD when feasible — pain is what the patient says it is.", citationIDs: ["pain_scales_concept"]),
                AttributedBullet("Reassess after intervention within an evidence-based interval — 30–60 min for oral analgesic, 15 min for IV.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Document FUNCTIONAL effect of pain (deep breathing, sleep, ambulation, ADLs) — not just numeric score.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Use the same scale consistently for trending; document which scale used.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Implicit bias affects pain assessment and treatment — particularly in Black and minority patients; treat reported pain.", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales, painScalesConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Braden Scale

public enum BradenScaleSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "braden-scale",
        title: "Braden Scale for pressure injury risk",
        subtitle: "6 subscales · 6–23 · ≤18 = at risk · drives prevention bundle",
        eyebrow: "REFERENCE · SKIN INTEGRITY",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .basicCareAndComfort, priorityConcept: .mobility),
        sections: [
            .keyValueTable(title: "Six subscales (each 1–4 except friction/shear 1–3)", [
                KeyValueRow(key: "Sensory perception", value: "1 completely limited · 2 very limited · 3 slightly limited · 4 no impairment"),
                KeyValueRow(key: "Moisture", value: "1 constantly moist · 2 very moist · 3 occasionally moist · 4 rarely moist"),
                KeyValueRow(key: "Activity", value: "1 bedfast · 2 chairfast · 3 walks occasionally · 4 walks frequently"),
                KeyValueRow(key: "Mobility", value: "1 completely immobile · 2 very limited · 3 slightly limited · 4 no limitation"),
                KeyValueRow(key: "Nutrition", value: "1 very poor · 2 probably inadequate · 3 adequate · 4 excellent"),
                KeyValueRow(key: "Friction & shear", value: "1 problem · 2 potential problem · 3 no apparent problem")
            ]),
            .keyValueTable(title: "Total score interpretation (range 6–23)", [
                KeyValueRow(key: "≥19", value: "No risk"),
                KeyValueRow(key: "15–18", value: "Mild risk"),
                KeyValueRow(key: "13–14", value: "Moderate risk"),
                KeyValueRow(key: "10–12", value: "High risk"),
                KeyValueRow(key: "≤9", value: "Very high risk")
            ]),
            .bullets(title: "Prevention bundle (intensity matched to risk)", [
                AttributedBullet("Reposition every 2 hours (more often for very high risk); 30° lateral tilt to avoid trochanter pressure.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Pressure redistribution surface (mattress overlay, low-air-loss, alternating pressure) for moderate–high risk.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Heel offloading — heel boots or pillow under calves so heels FLOAT.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Skin assessment every shift; document all bony prominences (sacrum, heels, occiput, ears, elbows, hips).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Moisture management — barrier creams, prompt cleansing after incontinence, breathable underpads.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Nutrition — adequate protein (1.2–2 g/kg/day for at-risk), calories, hydration; dietitian for malnutrition.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Reduce friction/shear — HOB ≤30° when possible, lift sheets (don't drag), heel cradles.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Reassess Braden every shift in acute care; daily in long-term care; with any change in condition.", citationIDs: ["braden_concept"])
            ]),
            .prose(title: "Limitations", AttributedProse(
                "Braden was developed in adults; pediatric (Braden Q) is the modified version. Braden may underestimate risk in patients with darker skin tones (early erythema harder to assess); use temperature, induration, pain on palpation as adjuncts. The score guides prevention intensity but does not replace clinical judgment.",
                citationIDs: ["braden_concept", "openrn_scales"]
            ))
        ],
        citations: [openrnScales, bradenConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CIWA-Ar

public enum CIWAReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ciwa-ar-reference",
        title: "CIWA-Ar (Clinical Institute Withdrawal Assessment for Alcohol — revised)",
        subtitle: "10 items · 0–67 · drives symptom-triggered benzodiazepine dosing",
        eyebrow: "REFERENCE · WITHDRAWAL",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
        sections: [
            .keyValueTable(title: "10 items (most scored 0–7; orientation 0–4)", [
                KeyValueRow(key: "Nausea / vomiting", value: "0 none · 1 mild · 4 intermittent with dry heaves · 7 constant nausea, vomiting, retching"),
                KeyValueRow(key: "Tremor (arms extended, fingers spread)", value: "0 no tremor · 1 not visible but felt · 4 moderate with arms extended · 7 severe even with arms not extended"),
                KeyValueRow(key: "Paroxysmal sweats", value: "0 no sweat · 1 barely perceptible · 4 beads on forehead · 7 drenching sweats"),
                KeyValueRow(key: "Anxiety", value: "0 no anxiety, at ease · 1 mildly anxious · 4 moderately anxious or guarded · 7 acute panic"),
                KeyValueRow(key: "Agitation", value: "0 normal activity · 1 somewhat more than normal · 4 moderately fidgety/restless · 7 paces back and forth, thrashes"),
                KeyValueRow(key: "Tactile disturbances", value: "0 none · 1 very mild itching · 4 moderately severe hallucinations · 7 continuous hallucinations"),
                KeyValueRow(key: "Auditory disturbances", value: "0 not present · 1 very mild harshness · 4 moderately severe hallucinations · 7 continuous hallucinations"),
                KeyValueRow(key: "Visual disturbances", value: "0 not present · 1 very mild sensitivity · 4 moderately severe hallucinations · 7 continuous hallucinations"),
                KeyValueRow(key: "Headache", value: "0 not present · 1 very mild · 4 moderate · 7 extremely severe"),
                KeyValueRow(key: "Orientation/clouding (0–4)", value: "0 oriented, can do serial additions · 4 disoriented for place/person")
            ]),
            .keyValueTable(title: "Score interpretation", [
                KeyValueRow(key: "<8", value: "Mild — generally no medication; reassess every 4 hr"),
                KeyValueRow(key: "8–15", value: "Moderate — likely benzodiazepine intervention; reassess every 1–2 hr"),
                KeyValueRow(key: "≥16", value: "Severe — high risk of seizure/DTs; aggressive treatment; ICU consideration; q1h reassessment"),
                KeyValueRow(key: "Total max", value: "67")
            ]),
            .bullets(title: "Use principles", [
                AttributedBullet("Symptom-triggered dosing per protocol — typically lorazepam, diazepam, or chlordiazepoxide; dose based on score.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Protocol example: CIWA 8–14 → lorazepam 1 mg PO; 15–20 → 2 mg; >20 → 3 mg or call provider; recheck in 1 hr.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Front-load dosing for severe withdrawal; transition to PRN once stable.", citationIDs: ["openrn_scales"]),
                AttributedBullet("ALWAYS pair with: thiamine 100 mg IV/IM BEFORE dextrose, folate, multivitamin, K/Mg/phos replacement.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Lorazepam preferred in liver disease (no active metabolite, glucuronidation).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Use clinical judgment alongside score — patient appearance, history of complicated withdrawal, comorbidities all matter.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Discharge planning: addiction counseling, MAT (naltrexone, acamprosate, disulfiram), AA, social work.", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - COWS

public enum COWSReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "cows-reference",
        title: "COWS (Clinical Opiate Withdrawal Scale)",
        subtitle: "11 items · 0–48 · severity-graded buprenorphine and comfort meds",
        eyebrow: "REFERENCE · WITHDRAWAL",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, subcategory: .psychosocialIntegrity, priorityConcept: .safety),
        sections: [
            .keyValueTable(title: "11 items", [
                KeyValueRow(key: "Resting pulse rate", value: "0 (≤80) · 1 (81–100) · 2 (101–120) · 4 (>120)"),
                KeyValueRow(key: "Sweating", value: "0 (no chills/flushing) · 1 (subjective chills/flushing) · 2 (flushed/observable moisture) · 3 (beads of sweat) · 4 (sweat streaming)"),
                KeyValueRow(key: "Restlessness", value: "0 (sits still) · 1 (occasional shifting) · 3 (frequent shifting) · 5 (unable to sit still)"),
                KeyValueRow(key: "Pupil size", value: "0 (normal/pinned) · 1 (slightly larger) · 2 (moderately dilated) · 5 (so dilated only rim of iris visible)"),
                KeyValueRow(key: "Bone or joint aches", value: "0 (none) · 1 (mild discomfort) · 2 (severe diffuse) · 4 (rubbing joints, unable to sit)"),
                KeyValueRow(key: "Runny nose / tearing", value: "0 (none) · 1 (nasal stuffiness) · 2 (nose running or tearing) · 4 (constantly running)"),
                KeyValueRow(key: "GI upset (last 30 min)", value: "0 (none) · 1 (cramps) · 2 (nausea/loose stool) · 3 (vomiting/diarrhea) · 5 (multiple episodes)"),
                KeyValueRow(key: "Tremor (hands outstretched)", value: "0 (no tremor) · 1 (felt) · 2 (slight visible) · 4 (gross tremor)"),
                KeyValueRow(key: "Yawning", value: "0 (none) · 1 (1–2× during assessment) · 2 (≥3) · 4 (several times a minute)"),
                KeyValueRow(key: "Anxiety/irritability", value: "0 (none) · 1 (mild) · 2 (obvious) · 4 (so irritable assessment difficult)"),
                KeyValueRow(key: "Gooseflesh skin", value: "0 (smooth) · 3 (piloerection felt or hairs standing) · 5 (prominent piloerection)")
            ]),
            .keyValueTable(title: "Score interpretation", [
                KeyValueRow(key: "5–12", value: "Mild withdrawal"),
                KeyValueRow(key: "13–24", value: "Moderate"),
                KeyValueRow(key: "25–36", value: "Moderately severe"),
                KeyValueRow(key: ">36", value: "Severe")
            ]),
            .bullets(title: "Use principles", [
                AttributedBullet("BUPRENORPHINE INDUCTION typically requires COWS ≥8 (moderate) — starting too early causes precipitated withdrawal.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Comfort meds: clonidine (autonomic), ondansetron (nausea), loperamide (diarrhea), hydroxyzine (anxiety/sleep), NSAIDs/acetaminophen (pain), dicyclomine (cramps).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Methadone induction in OTP setting (cannot start in ED in most jurisdictions).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Naltrexone requires complete opioid abstinence ≥7–10 days before initiation.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Provide naloxone and education to all OUD patients regardless of treatment plan.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Opioid withdrawal is uncomfortable but rarely fatal in adults (vs alcohol withdrawal); fatal in neonates (NAS) and dehydrated patients.", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Morse Falls Scale

public enum MorseFallsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "morse-falls",
        title: "Morse Fall Scale",
        subtitle: "6 items · 0–125 · drives fall-prevention intensity",
        eyebrow: "REFERENCE · SAFETY",
        nclexTags: safetyScalesTags,
        sections: [
            .keyValueTable(title: "Six items (each scored)", [
                KeyValueRow(key: "1. History of falling (within 3 months)", value: "0 No · 25 Yes"),
                KeyValueRow(key: "2. Secondary diagnosis (>1 medical diagnosis)", value: "0 No · 15 Yes"),
                KeyValueRow(key: "3. Ambulatory aid", value: "0 None / bed rest / nurse assist · 15 Crutches / cane / walker · 30 Furniture (touches walls/furniture for support)"),
                KeyValueRow(key: "4. IV / heparin lock", value: "0 No · 20 Yes"),
                KeyValueRow(key: "5. Gait / transferring", value: "0 Normal / bed rest / immobile · 10 Weak · 20 Impaired"),
                KeyValueRow(key: "6. Mental status", value: "0 Oriented to own ability · 15 Forgets limitations / overestimates ability")
            ]),
            .keyValueTable(title: "Score interpretation", [
                KeyValueRow(key: "0–24", value: "No risk — standard precautions"),
                KeyValueRow(key: "25–44", value: "Low risk — standard fall precautions"),
                KeyValueRow(key: "≥45", value: "High risk — implement high-risk fall prevention bundle")
            ]),
            .bullets(title: "Standard fall precautions (all patients)", [
                AttributedBullet("Bed in low position, brakes locked, side rails up × 2 (top half).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Call light within reach.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Personal items within reach.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Non-skid socks, well-fitting shoes for ambulation.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Adequate lighting; clear pathways.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Orient patient to environment.", citationIDs: ["openrn_scales"])
            ]),
            .bullets(title: "High-risk additions", [
                AttributedBullet("Visible identification (yellow band, signage, color-coded chart).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Bed alarm / chair alarm; immediate response.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Hourly rounding using 4 P's — Pain, Potty, Position, Possessions.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Scheduled toileting (every 2 hours during the day).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Sitter or move closer to nursing station for very high risk.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Medication review — minimize sedatives, anticholinergics, antihypertensives causing orthostasis (Beers criteria).", citationIDs: ["openrn_scales"]),
                AttributedBullet("PT consult for assistive device assessment and safe transfers.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Educate patient and family on call-before-getting-up rule.", citationIDs: ["openrn_scales"])
            ]),
            .prose(title: "Pearls", AttributedProse(
                "Reassess every shift and after any change in condition (new medication, post-op, sedation). Many falls occur during transfers (bed-to-bathroom most common); proactive toileting is one of the highest-yield interventions. Trust patient self-report of weakness — many falls happen the moment after the patient says 'I felt dizzy.'",
                citationIDs: ["openrn_scales"]
            ))
        ],
        citations: [openrnScales],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - NYHA Heart Failure Classification

public enum NYHAReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "nyha-classification",
        title: "NYHA Functional Classification of Heart Failure",
        subtitle: "Class I–IV by symptom limitation · drives medical and device decisions",
        eyebrow: "REFERENCE · HEART FAILURE",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .keyValueTable(title: "NYHA classes (functional)", [
                KeyValueRow(key: "Class I", value: "No limitation of physical activity. Ordinary activity does not cause symptoms."),
                KeyValueRow(key: "Class II", value: "Slight limitation. Comfortable at rest; ordinary activity causes symptoms (fatigue, dyspnea, palpitations, angina)."),
                KeyValueRow(key: "Class III", value: "Marked limitation. Comfortable at rest; LESS than ordinary activity causes symptoms."),
                KeyValueRow(key: "Class IV", value: "Inability to carry on any physical activity without symptoms. Symptoms at REST.")
            ]),
            .keyValueTable(title: "ACC/AHA stages (structural — overlays NYHA)", [
                KeyValueRow(key: "Stage A", value: "AT RISK — risk factors (HTN, DM, CAD, family history) but no structural disease or symptoms"),
                KeyValueRow(key: "Stage B", value: "PRE-HF — structural changes (LVH, low EF, prior MI, valve disease) but no symptoms"),
                KeyValueRow(key: "Stage C", value: "Symptomatic HF — current or prior symptoms with structural disease"),
                KeyValueRow(key: "Stage D", value: "ADVANCED HF — refractory; transplant, LVAD, palliative consideration")
            ]),
            .keyValueTable(title: "GDMT (Guideline-Directed Medical Therapy) for HFrEF Stage C/NYHA II–IV — 'four pillars'", [
                KeyValueRow(key: "1. ARNI / ACEi / ARB", value: "Sacubitril-valsartan (Entresto) preferred when feasible; ACEi/ARB if not"),
                KeyValueRow(key: "2. Beta-blocker", value: "Carvedilol, metoprolol succinate, or bisoprolol"),
                KeyValueRow(key: "3. MRA (mineralocorticoid receptor antagonist)", value: "Spironolactone or eplerenone"),
                KeyValueRow(key: "4. SGLT2 inhibitor", value: "Dapagliflozin or empagliflozin (regardless of diabetes)")
            ]),
            .bullets(title: "Additional HF therapies", [
                AttributedBullet("Loop diuretics for congestion (symptom relief; no mortality benefit).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Hydralazine + isosorbide for select Black patients with HFrEF.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Ivabradine for symptomatic HF on max BB with SR HR ≥70.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Vericiguat for worsening HF.", citationIDs: ["openrn_scales"]),
                AttributedBullet("ICD for primary prevention of sudden death (EF ≤35% on GDMT for ≥3 months).", citationIDs: ["openrn_scales"]),
                AttributedBullet("CRT (biventricular pacing) for QRS ≥150 ms with LBBB.", citationIDs: ["openrn_scales"]),
                AttributedBullet("LVAD or transplant for advanced HF.", citationIDs: ["openrn_scales"])
            ]),
            .bullets(title: "Patient education", [
                AttributedBullet("Daily weights — call provider if gain >2 lb/day or 5 lb/week.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Sodium restriction (typically <2 g/day); fluid restriction in advanced HF.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Medication adherence; do NOT stop GDMT abruptly.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Symptom warning signs — dyspnea, orthopnea, swelling, decreased exercise tolerance.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Cardiac rehab and physical activity within tolerance.", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales, nyhaConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CKD Staging

public enum CKDStagingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ckd-staging",
        title: "CKD staging (KDIGO)",
        subtitle: "GFR + albuminuria · drives nephrology referral, dosing, planning",
        eyebrow: "REFERENCE · RENAL",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .fluidElectrolytes),
        sections: [
            .keyValueTable(title: "GFR categories (mL/min/1.73 m²)", [
                KeyValueRow(key: "G1", value: "≥90 — normal or high"),
                KeyValueRow(key: "G2", value: "60–89 — mildly decreased"),
                KeyValueRow(key: "G3a", value: "45–59 — mildly to moderately decreased"),
                KeyValueRow(key: "G3b", value: "30–44 — moderately to severely decreased"),
                KeyValueRow(key: "G4", value: "15–29 — severely decreased"),
                KeyValueRow(key: "G5", value: "<15 — kidney failure (often requires renal replacement therapy)")
            ]),
            .keyValueTable(title: "Albuminuria categories (urine albumin-to-creatinine ratio, mg/g)", [
                KeyValueRow(key: "A1", value: "<30 — normal to mildly increased"),
                KeyValueRow(key: "A2", value: "30–300 — moderately increased (microalbuminuria)"),
                KeyValueRow(key: "A3", value: ">300 — severely increased (macroalbuminuria)")
            ]),
            .prose(title: "Definition of CKD", AttributedProse(
                "Abnormalities of kidney structure or function present for >3 months, with implications for health. Includes GFR <60 OR markers of kidney damage (albuminuria, abnormal sediment, electrolyte/structural abnormalities, biopsy findings, transplant). Stage by both GFR (G) and albuminuria (A) categories — example: 'CKD G3a A2.'",
                citationIDs: ["kdigo_concept"]
            )),
            .bullets(title: "Common causes", [
                AttributedBullet("Diabetes mellitus (leading cause).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Hypertension.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Glomerulonephritis.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Polycystic kidney disease.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Obstructive uropathy.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Recurrent AKI; nephrotoxin exposure (NSAIDs, contrast, aminoglycosides).", citationIDs: ["openrn_scales"])
            ]),
            .bullets(title: "Management priorities by stage", [
                AttributedBullet("All stages: address etiology, BP control (<130/80), glycemic control (DM), avoid nephrotoxins, ACEi/ARB if albuminuria, cardiovascular risk reduction (statin, smoking cessation), SGLT2 inhibitor.", citationIDs: ["openrn_scales"]),
                AttributedBullet("G3+: monitor electrolytes (K, phos, bicarb), Hgb (anemia), Ca, vitamin D, PTH; nephrology referral.", citationIDs: ["openrn_scales"]),
                AttributedBullet("G4: arteriovenous fistula planning, dialysis modality discussion, transplant referral when appropriate.", citationIDs: ["openrn_scales"]),
                AttributedBullet("G5: initiate renal replacement therapy when symptomatic (uremia, fluid overload, refractory hyperkalemia/acidosis).", citationIDs: ["openrn_scales"])
            ]),
            .bullets(title: "Medication adjustments", [
                AttributedBullet("Many drugs require renal dose adjustment — gabapentin, vancomycin, enoxaparin, DOACs, opioids, antimicrobials, contrast.", citationIDs: ["openrn_scales"]),
                AttributedBullet("AVOID: NSAIDs, IV contrast (when avoidable), aminoglycosides; preserve veins (no PICC in non-dominant arm) for future fistula.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Caution with metformin (eGFR <30 contraindicated; <45 reduce dose).", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales, kdigoConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - DKA vs HHS Comparison

public enum DKAvsHHSSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "dka-vs-hhs",
        title: "DKA vs HHS — comparison",
        subtitle: "Distinguishing features · key labs · treatment principles",
        eyebrow: "REFERENCE · ENDOCRINE EMERGENCIES",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .glucoseRegulation),
        sections: [
            .keyValueTable(title: "Patient population & onset", [
                KeyValueRow(key: "DKA", value: "Typically T1DM (any age); hours to 1–2 days; precipitated by missed insulin, infection, MI/stroke"),
                KeyValueRow(key: "HHS", value: "Typically T2DM in older adults; days to weeks; precipitated by infection, MI/stroke, missed medication, dehydration")
            ]),
            .keyValueTable(title: "Key laboratory findings", [
                KeyValueRow(key: "Glucose", value: "DKA: typically 250–800 · HHS: usually >600 (often >1000)"),
                KeyValueRow(key: "pH", value: "DKA: <7.30 · HHS: >7.30"),
                KeyValueRow(key: "Bicarbonate", value: "DKA: <18 · HHS: >18"),
                KeyValueRow(key: "Anion gap", value: "DKA: ELEVATED (>12) · HHS: variable (typically normal or mild)"),
                KeyValueRow(key: "Ketones (serum, urine)", value: "DKA: STRONGLY POSITIVE · HHS: small/absent"),
                KeyValueRow(key: "Serum osmolality", value: "DKA: variable, often <320 · HHS: >320 mOsm/kg"),
                KeyValueRow(key: "Mental status", value: "DKA: typically alert (unless severe) · HHS: AMS prominent (correlates with osmolality)")
            ]),
            .keyValueTable(title: "Volume deficit (typical)", [
                KeyValueRow(key: "DKA", value: "~6 L"),
                KeyValueRow(key: "HHS", value: "~9 L (much greater)")
            ]),
            .bullets(title: "Treatment principles (both)", [
                AttributedBullet("AGGRESSIVE IV FLUIDS first — 1 L NS in first hour, then titrate; HHS may need slower in elderly with cardiac/renal disease.", citationIDs: ["ada_scales_concept"]),
                AttributedBullet("INSULIN DRIP after initial fluid; lower rates in HHS than DKA.", citationIDs: ["ada_scales_concept"]),
                AttributedBullet("CHECK POTASSIUM BEFORE INSULIN — hold insulin if K <3.3 (replete first); insulin shifts K intracellularly.", citationIDs: ["ada_scales_concept"]),
                AttributedBullet("Replace K (often add to IV fluids if K <5.3); replace phos and Mg as indicated.", citationIDs: ["ada_scales_concept"]),
                AttributedBullet("Add D5 to IV fluids when glucose <250 (DKA) or <300 (HHS) to allow ongoing insulin until anion gap closes (DKA) or osmolality normalizes (HHS).", citationIDs: ["ada_scales_concept"]),
                AttributedBullet("Treat precipitating cause — infection (cultures + antibiotics), MI, stroke.", citationIDs: ["ada_scales_concept"]),
                AttributedBullet("Transition to subcutaneous insulin once: anion gap closed (DKA) OR osmolality normal + alert + eating (HHS); OVERLAP drip and SC by 1–2 hours.", citationIDs: ["ada_scales_concept"]),
                AttributedBullet("Bicarbonate generally NOT recommended (only for severe acidemia pH <6.9).", citationIDs: ["ada_scales_concept"])
            ]),
            .bullets(title: "Mortality and pearls", [
                AttributedBullet("DKA mortality ~1–5%; HHS mortality 10–20% (older, sicker patients).", citationIDs: ["openrn_scales"]),
                AttributedBullet("Cerebral edema in pediatric DKA — uncommon but devastating; do NOT correct sodium too rapidly.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Some patients have features of both — 'overlap' DKA-HHS.", citationIDs: ["openrn_scales"]),
                AttributedBullet("In T1DM, DKA may be the FIRST presentation of diabetes; in T2DM, HHS may be the first presentation.", citationIDs: ["openrn_scales"]),
                AttributedBullet("Education on sick-day rules (continue basal insulin, monitor ketones, hydrate, call team).", citationIDs: ["openrn_scales"])
            ])
        ],
        citations: [openrnScales, adaScalesConcept],
        lastSourceFidelityReview: "2026-05-04"
    )
}
