import Foundation

// Curated ED reference entries — Open RN (CC BY 4.0), CDC public-domain, AHRQ
// public-domain, original-concept citations for legacy clinical scoring tools.
// Tier-A RN review pending pre-launch.

private let openrnED = CitationSource(
    id: "openrn_ed",
    shortName: "Open RN — Health Alterations: Emergency & Neuro chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=stroke+sepsis+emergency",
    lastRetrieved: "2026-05-04"
)

private let nihNINDS = CitationSource(
    id: "ninds_nihss",
    shortName: "NIH/NINDS — NIH Stroke Scale (NIHSS) Tool & Training",
    publisher: "National Institute of Neurological Disorders and Stroke",
    license: .publicDomain,
    url: "https://www.ninds.nih.gov/health-information/public-education/know-stroke/health-professionals/nih-stroke-scale",
    lastRetrieved: "2026-05-04"
)

private let ciwa1989 = CitationSource(
    id: "ciwa_ar_1989",
    shortName: "CIWA-Ar — Sullivan et al, Br J Addict 1989 (concept citation)",
    detail: "Universally adopted alcohol withdrawal assessment tool",
    publisher: "British Journal of Addiction",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/2597811/",
    lastRetrieved: "2026-05-04"
)

private let ahrqESI = CitationSource(
    id: "ahrq_esi",
    shortName: "AHRQ — Emergency Severity Index (ESI) Handbook v4",
    publisher: "Agency for Healthcare Research and Quality",
    license: .publicDomain,
    url: "https://www.ahrq.gov/patient-safety/settings/emergency-dept/esi.html",
    lastRetrieved: "2026-05-04"
)

private let cdcOpioid = CitationSource(
    id: "cdc_opioid_overdose",
    shortName: "CDC — Opioid Overdose Reversal with Naloxone",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/overdose-prevention/hcp/clinical-care/lifesaving-naloxone.html",
    lastRetrieved: "2026-05-04"
)

// MARK: - NIHSS

public enum NIHSSReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "nihss",
        title: "NIH Stroke Scale (NIHSS)",
        subtitle: "15-item neurologic exam — time-critical for stroke",
        eyebrow: "REFERENCE · ED",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .perfusion),
        sections: [
            .prose(title: "Why NIHSS matters", AttributedProse("NIHSS standardizes stroke severity assessment so the same patient gets the same score across providers and time points. It guides decisions on tPA, thrombectomy, ICU transfer, and predicts outcome. Total range 0–42; higher = worse. Time-critical: tPA window is ≤4.5 hr from last known well; thrombectomy window can extend to 24 hr in select patients. Document time done.", citationIDs: ["ninds_nihss"])),
            .keyValueTable(title: "15 items, scored 0 (normal) → higher (worse)", [
                KeyValueRow(key: "1a — Level of consciousness", value: "0–3 (alert → coma)"),
                KeyValueRow(key: "1b — LOC questions", value: "0–2 (month, age — both right / one right / neither)"),
                KeyValueRow(key: "1c — LOC commands", value: "0–2 (open/close eyes, grip/release — both / one / neither)"),
                KeyValueRow(key: "2 — Best gaze", value: "0–2 (normal / partial palsy / forced deviation)"),
                KeyValueRow(key: "3 — Visual fields", value: "0–3 (no loss → bilateral hemianopia)"),
                KeyValueRow(key: "4 — Facial palsy", value: "0–3 (normal → complete)"),
                KeyValueRow(key: "5a/5b — Motor arm L/R", value: "0–4 each (no drift → no movement)"),
                KeyValueRow(key: "6a/6b — Motor leg L/R", value: "0–4 each"),
                KeyValueRow(key: "7 — Limb ataxia", value: "0–2"),
                KeyValueRow(key: "8 — Sensory", value: "0–2"),
                KeyValueRow(key: "9 — Best language", value: "0–3 (none → mute/global aphasia)"),
                KeyValueRow(key: "10 — Dysarthria", value: "0–2"),
                KeyValueRow(key: "11 — Extinction / inattention", value: "0–2")
            ]),
            .keyValueTable(title: "Score severity bands", [
                KeyValueRow(key: "0", value: "No stroke symptoms"),
                KeyValueRow(key: "1–4", value: "Minor stroke"),
                KeyValueRow(key: "5–15", value: "Moderate"),
                KeyValueRow(key: "16–20", value: "Moderate-severe"),
                KeyValueRow(key: "21–42", value: "Severe")
            ]),
            .bullets(title: "Nursing tips for accurate scoring", [
                AttributedBullet("Train on the official NIH/NINDS video and certify before scoring stroke patients independently.", citationIDs: ["ninds_nihss"]),
                AttributedBullet("Score what you observe in real time. Don't \"score what they were\" — re-examine for each NIHSS.", citationIDs: ["ninds_nihss"]),
                AttributedBullet("Document the score AND the time it was performed. Serial NIHSS at standard intervals (e.g., on arrival, q15min × 2 hr post-tPA, q1h × 6 hr).", citationIDs: ["openrn_ed"]),
                AttributedBullet("If a finding is too unclear to score (intubated, severe aphasia, intoxicated), use the documented untestable scoring and note the reason.", citationIDs: ["ninds_nihss"]),
                AttributedBullet("Sudden NIHSS increase ≥4 = neurologic deterioration → notify provider immediately. Repeat imaging may be ordered.", citationIDs: ["openrn_ed"])
            ]),
            .prose(title: "Time goals — \"time is brain\"", AttributedProse("Door to provider <10 min. Door to CT <25 min, CT read <45 min. Door to needle (tPA) <60 min. Door to puncture (thrombectomy) per facility (often <90 min). The clock starts at last known well, NOT symptom recognition.", citationIDs: ["openrn_ed"]))
        ],
        citations: [nihNINDS, openrnED],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - CIWA-Ar

public enum CIWAArReferenceSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ciwa-ar",
        title: "CIWA-Ar — Alcohol Withdrawal Assessment",
        subtitle: "10-item score, treatment thresholds, monitoring frequency",
        eyebrow: "REFERENCE · ED",
        nclexTags: NCLEXTags(category: .psychosocialIntegrity, priorityConcept: .cognition),
        sections: [
            .prose(title: "Purpose", AttributedProse("Standardizes alcohol withdrawal severity so dosing benzodiazepines is symptom-triggered (\"give X mg if CIWA ≥Y\") rather than time-based, which reduces total benzo exposure and length of stay. Should not be the only assessment in unstable withdrawal — clinical judgment overrides the number.", citationIDs: ["ciwa_ar_1989", "openrn_ed"])),
            .keyValueTable(title: "10 components — total 0–67", [
                KeyValueRow(key: "1. Nausea/vomiting", value: "0 (none) → 7 (constant)"),
                KeyValueRow(key: "2. Tremor", value: "0–7"),
                KeyValueRow(key: "3. Paroxysmal sweats", value: "0–7"),
                KeyValueRow(key: "4. Anxiety", value: "0–7"),
                KeyValueRow(key: "5. Agitation", value: "0–7"),
                KeyValueRow(key: "6. Tactile disturbances", value: "0–7 (itching → severe hallucinations)"),
                KeyValueRow(key: "7. Auditory disturbances", value: "0–7"),
                KeyValueRow(key: "8. Visual disturbances", value: "0–7"),
                KeyValueRow(key: "9. Headache / fullness in head", value: "0–7"),
                KeyValueRow(key: "10. Orientation/clouded sensorium", value: "0–4")
            ]),
            .keyValueTable(title: "Score interpretation", [
                KeyValueRow(key: "<10", value: "Mild — usually no medication needed; supportive care, frequent reassessment"),
                KeyValueRow(key: "10–18", value: "Moderate — symptom-triggered benzodiazepines per protocol"),
                KeyValueRow(key: "19–25", value: "Severe — usually scheduled benzodiazepines; risk of seizure, DTs"),
                KeyValueRow(key: "≥26", value: "Severe — high risk of complications; consider ICU monitoring")
            ]),
            .bullets(title: "Reassessment frequency", [
                AttributedBullet("CIWA <10: every 4–8 hr (per protocol).", citationIDs: ["openrn_ed"]),
                AttributedBullet("CIWA 10–18: every 1–2 hr after dosing until <10 sustained.", citationIDs: ["openrn_ed"]),
                AttributedBullet("CIWA ≥19: every 30–60 min until score declining.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Severe withdrawal / DTs: continuous monitoring, ICU consideration.", citationIDs: ["openrn_ed"])
            ]),
            .bullets(title: "Treatment principles", [
                AttributedBullet("First-line: long-acting benzodiazepine (lorazepam, diazepam, chlordiazepoxide). Lorazepam preferred in liver disease (no active metabolites).", citationIDs: ["openrn_ed"]),
                AttributedBullet("Adjuncts for severe agitation: IV haloperidol (caution: lowers seizure threshold), dexmedetomidine.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Thiamine 100 mg IV/IM BEFORE glucose to prevent Wernicke's encephalopathy.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Folate, multivitamin replacement.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Aggressive electrolyte correction — magnesium, potassium, phosphate often depleted.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Hydration — many are dehydrated; balanced crystalloid.", citationIDs: ["openrn_ed"])
            ]),
            .bullets(title: "Watch-fors — when CIWA isn't enough", [
                AttributedBullet("Withdrawal seizure (typically 6–48 hr after last drink) — single tonic-clonic; multiple seizures concerning for status.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Alcoholic hallucinosis (12–48 hr) — visual/auditory hallucinations with intact orientation.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Delirium tremens (DTs) — 48–96 hr after last drink — confusion, hallucinations, severe autonomic instability. ICU-level care.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Concurrent benzodiazepine or opioid withdrawal complicates the picture.", citationIDs: ["openrn_ed"])
            ])
        ],
        citations: [ciwa1989, openrnED],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - ESI Triage

public enum ESITriageSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "esi-triage",
        title: "ESI Triage — Levels 1–5",
        subtitle: "Emergency Severity Index for ED triage decisions",
        eyebrow: "REFERENCE · ED",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .managementOfCare),
        sections: [
            .prose(title: "Purpose", AttributedProse("ESI is a 5-level triage algorithm built on two questions: (1) Is the patient dying? (2) How many resources will they need? Used by ~80% of US EDs. The triage nurse decision drives bed placement, immediate care, and resource allocation.", citationIDs: ["ahrq_esi"])),
            .keyValueTable(title: "Levels 1–5", [
                KeyValueRow(key: "Level 1 — Resuscitation", value: "Immediate. Dying / requires lifesaving intervention. Examples: cardiac arrest, severe respiratory distress with imminent failure, unresponsive."),
                KeyValueRow(key: "Level 2 — Emergent", value: "High risk; should be seen within 10 min. High-risk situations or pain ≥7/10 in concerning patterns. Examples: chest pain in 60-yo with SOB, suspected stroke within window, suicidal patient with plan, severe abdominal pain."),
                KeyValueRow(key: "Level 3 — Urgent", value: "Many resources. Stable, but will need ≥2 of: lab, imaging, IV fluids, IV/IM/neb meds, specialty consult, simple procedure. Vital signs in normal range."),
                KeyValueRow(key: "Level 4 — Less urgent", value: "One resource. Stable patient, simple workup (X-ray only OR labs only OR a single procedure). Examples: ankle sprain (X-ray), simple laceration (single suture)."),
                KeyValueRow(key: "Level 5 — Non-urgent", value: "No resources beyond exam. Stable; will not need imaging, labs, IV meds, or procedures. Examples: med refill request, suture removal.")
            ]),
            .bullets(title: "How to think about \"resources\"", [
                AttributedBullet("Resources include: labs (CBC, BMP, etc.), imaging (X-ray, CT, MRI, US), IV fluids, IV/IM/neb meds, specialty consults, simple procedures (lac repair, splinting), complex procedures (conscious sedation).", citationIDs: ["ahrq_esi"]),
                AttributedBullet("NOT resources: oral meds, prescription, simple wound care, point-of-care testing (urine dip, glucose), tetanus shot.", citationIDs: ["ahrq_esi"]),
                AttributedBullet("Multiple labs count as ONE resource (one blood draw). Multiple imaging studies of different types count as multiple resources (CT abdomen + chest X-ray = 2).", citationIDs: ["ahrq_esi"])
            ]),
            .bullets(title: "Vital signs danger zones for triage upgrade", [
                AttributedBullet("Adult: HR >100, RR >20, SpO2 <92% — consider upgrade.", citationIDs: ["ahrq_esi"]),
                AttributedBullet("Peds: any vital outside age-specific normal — consider upgrade.", citationIDs: ["ahrq_esi"]),
                AttributedBullet("Fever in <3 month infant — automatic Level 2 even if appears well.", citationIDs: ["ahrq_esi"]),
                AttributedBullet("Severe pain (≥7/10) in concerning pattern — Level 2.", citationIDs: ["ahrq_esi"])
            ]),
            .bullets(title: "Common triage errors to avoid", [
                AttributedBullet("Under-triaging the elderly — they decompensate without classic vital sign changes.", citationIDs: ["ahrq_esi"]),
                AttributedBullet("Under-triaging immunocompromised — fever or any infection sign warrants higher level.", citationIDs: ["ahrq_esi"]),
                AttributedBullet("Over-relying on chief complaint vs presentation — \"chest pain\" with concerning patterns is Level 2; a young patient with reproducible chest wall pain may be Level 4.", citationIDs: ["ahrq_esi"]),
                AttributedBullet("Skipping vital signs at triage for \"obvious\" Level 4 patients — vitals are the safety net.", citationIDs: ["ahrq_esi"])
            ])
        ],
        citations: [ahrqESI],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Opioid Overdose Reversal

public enum OpioidOverdoseReversalSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "opioid-overdose-reversal",
        title: "Opioid overdose reversal",
        subtitle: "Recognition, naloxone, post-reversal care",
        eyebrow: "REFERENCE · ED",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .cognition),
        sections: [
            .prose(title: "Recognition — the classic triad", AttributedProse("Opioid overdose presents with three findings together: depressed level of consciousness, respiratory depression (RR <10 or shallow), and miotic (pinpoint) pupils. Any opioid-naive patient with this triad gets naloxone first, workup second.", citationIDs: ["cdc_opioid_overdose", "openrn_ed"])),
            .bullets(title: "Initial assessment (60 seconds)", [
                AttributedBullet("Airway/breathing — open airway, jaw thrust if needed, BVM with 100% O2 to maintain SpO2.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Pulse, BP, rhythm — arrest is rare with isolated opioid OD; if arrested, follow ACLS first.", citationIDs: ["openrn_ed"]),
                AttributedBullet("LOC — AVPU or GCS; pupil size; signs of polysubstance (alcohol breath, track marks, transdermal patches).", citationIDs: ["openrn_ed"]),
                AttributedBullet("Glucose — rule out hypoglycemia as a confounder.", citationIDs: ["openrn_ed"])
            ]),
            .keyValueTable(title: "Naloxone dosing", [
                KeyValueRow(key: "Adult — IV/IO", value: "0.04–0.4 mg every 2–3 min titrated to respiratory effort. Start LOW in chronic users to avoid acute withdrawal."),
                KeyValueRow(key: "Adult — IM", value: "0.4 mg if no IV access; can repeat every 2–3 min."),
                KeyValueRow(key: "Adult — intranasal", value: "4 mg in one nostril (preferred for prehospital); may repeat every 2–3 min, alternate nostrils."),
                KeyValueRow(key: "Pediatric", value: "0.1 mg/kg IV/IO/IM, max 2 mg per dose."),
                KeyValueRow(key: "Endpoint", value: "Adequate respiratory effort (RR ≥10–12, SpO2 ≥94%) — NOT full alertness. Over-titration causes acute withdrawal.")
            ]),
            .bullets(title: "Post-reversal — observation matters", [
                AttributedBullet("Naloxone half-life is ~30–90 min; many opioids (methadone, fentanyl analogs, sustained-release) outlast it. Re-narcotization is real.", citationIDs: ["cdc_opioid_overdose"]),
                AttributedBullet("Observe minimum 2 hours after last naloxone dose; longer for long-acting opioids (4–6 hr) or fentanyl analogs.", citationIDs: ["cdc_opioid_overdose"]),
                AttributedBullet("Continuous SpO2 and capnography; cardiac monitoring.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Consider naloxone infusion (typically 2/3 of effective bolus dose per hour) for confirmed long-acting opioid OD.", citationIDs: ["openrn_ed"])
            ]),
            .bullets(title: "Acute withdrawal from naloxone — manage but don't avoid", [
                AttributedBullet("Symptoms: anxiety, agitation, tachycardia, hypertension, sweating, piloerection, nausea/vomiting, abdominal cramping, diarrhea.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Not life-threatening in adults (unlike alcohol or benzo withdrawal) but distressing.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Manage with antiemetics, clonidine, fluids — DO NOT give opioids back to \"calm them down.\"", citationIDs: ["openrn_ed"]),
                AttributedBullet("Reframe: keeping the patient breathing > avoiding withdrawal symptoms.", citationIDs: ["openrn_ed"])
            ]),
            .bullets(title: "Discharge / follow-up considerations", [
                AttributedBullet("Naloxone take-home kit; train family/friend on use.", citationIDs: ["cdc_opioid_overdose"]),
                AttributedBullet("Buprenorphine induction in the ED for opioid use disorder — bridges to outpatient MAT.", citationIDs: ["openrn_ed"]),
                AttributedBullet("Connect to peer recovery / MAT clinic; warm handoff if possible.", citationIDs: ["cdc_opioid_overdose"]),
                AttributedBullet("Document overdose for state reporting per facility policy (Good Samaritan laws vary by state).", citationIDs: ["cdc_opioid_overdose"])
            ])
        ],
        citations: [cdcOpioid, openrnED],
        lastSourceFidelityReview: "2026-05-04"
    )
}
