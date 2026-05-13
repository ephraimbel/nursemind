import Foundation

// Curated Med-Surg reference entries — Open RN (CC BY 4.0), CDC public-domain,
// AHRQ public-domain. Tier-A RN review pending pre-launch for transfusion
// administration and anticoagulation teaching.

private let openrnMedSurg = CitationSource(
    id: "openrn_medsurg",
    shortName: "Open RN — Health Alterations: Surgical & Wound chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=postoperative+wound+transfusion",
    lastRetrieved: "2026-05-04"
)

private let cdcInfectionControl = CitationSource(
    id: "cdc_infection_control",
    shortName: "CDC — Surgical Site Infection Prevention Guidelines",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/infection-control/hcp/surgical-site-infection/index.html",
    lastRetrieved: "2026-05-04"
)

private let aabbTransfusion = CitationSource(
    id: "aabb_transfusion_general",
    shortName: "Transfusion administration — standard nursing practice (concept citation)",
    detail: "Reflects AABB Standards principles paraphrased into nursing workflow",
    publisher: "Nursing Practice Standards",
    license: .factCitationOnly,
    url: "https://www.aabb.org/",
    lastRetrieved: "2026-05-04"
)

// MARK: - Post-op Assessment

public enum PostOpAssessmentSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "post-op-assessment",
        title: "Post-op assessment",
        subtitle: "PACU Aldrete and ward post-op timeline",
        eyebrow: "REFERENCE · MED-SURG",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential),
        sections: [
            .prose(title: "Why post-op assessment is structured", AttributedProse("Most post-op complications happen in predictable windows. The first 24 hours are highest-risk for airway, hemorrhage, and atelectasis. Days 3–5 are highest-risk for wound infection, DVT, and ileus. A structured assessment at known intervals catches deterioration early — when small interventions still work.", citationIDs: ["openrn_medsurg"])),
            .keyValueTable(title: "Aldrete Score — PACU discharge readiness (target ≥9/10)", [
                KeyValueRow(key: "Activity", value: "0 = no movement · 1 = 2 limbs · 2 = all 4 limbs"),
                KeyValueRow(key: "Respiration", value: "0 = apneic · 1 = labored/dyspnea · 2 = breathes deeply, can cough"),
                KeyValueRow(key: "Circulation (BP)", value: "0 = >50 mmHg from baseline · 1 = 20–50 from baseline · 2 = <20 from baseline"),
                KeyValueRow(key: "Consciousness", value: "0 = no response · 1 = arousable · 2 = fully awake"),
                KeyValueRow(key: "O2 saturation", value: "0 = <90% with O2 · 1 = ≥90% with O2 · 2 = ≥92% on room air")
            ]),
            .keyValueTable(title: "Post-op timeline (typical)", [
                KeyValueRow(key: "First hour (PACU)", value: "Airway, level of consciousness, pain, hemorrhage. Vital signs every 15 min."),
                KeyValueRow(key: "0–24 hr (ward)", value: "Vital signs every 4 hr (or per orders). Pain control. Atelectasis prevention (IS, ambulate). First void within 6–8 hr after Foley removal."),
                KeyValueRow(key: "Day 1–3", value: "Wound check every shift. Pain control (transition oral). Mobility, bowel function."),
                KeyValueRow(key: "Day 3–5", value: "Highest risk: wound infection, DVT, ileus. Look for: fever, calf pain, no flatus/BM, distention.")
            ]),
            .bullets(title: "Head-to-toe post-op assessment", [
                AttributedBullet("Neuro: LOC, orientation, pupils, motor strength bilateral. Anesthesia residue can persist 4+ hr.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Respiratory: rate, depth, breath sounds, SpO2, ability to cough/deep-breathe. Atelectasis is most common pulmonary complication.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Cardiovascular: HR, BP, rhythm, peripheral pulses, edema. Hypotension early — concerning for hemorrhage.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Surgical site: dressing intact? Drainage type/amount? Bleeding? Mark drainage line on dressing with time.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Drains: empty per protocol, document amount + character (serous, sero-sang, sang). Notify provider for sudden volume change.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("GI: bowel sounds, distention, nausea/vomiting, NG tube output. First flatus typically 24–48 hr post-op (later with bowel surgery).", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("GU: urine output ≥30 mL/hr or 0.5 mL/kg/hr. First void within 6–8 hr if no Foley.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Pain: scale + location + character. Reassess after intervention.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("DVT prevention: SCDs, early ambulation, prophylactic anticoagulation per orders. Check calves daily.", citationIDs: ["openrn_medsurg"])
            ]),
            .bullets(title: "Red flags — call provider", [
                AttributedBullet("Hypotension despite fluid resuscitation, tachycardia, pallor — hemorrhage.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Sudden chest pain or shortness of breath — PE.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Saturating drain output (>100 mL/hr fresh blood) or dressing.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Fever >38.5°C / 101.3°F, especially day 3+ — wound infection, atelectasis, UTI.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Unable to void within 8 hr post-Foley removal — urinary retention.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Wound dehiscence (palpable separation, evisceration) — emergent.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Unilateral calf pain or swelling — DVT.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Increasing abdominal distention without flatus — ileus or obstruction.", citationIDs: ["openrn_medsurg"])
            ])
        ],
        citations: [openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Wound Care

public enum WoundCareSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "wound-care-fundamentals",
        title: "Wound assessment and care",
        subtitle: "Classification, dressing principles, drains, signs of infection",
        eyebrow: "REFERENCE · MED-SURG",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .reductionOfRiskPotential, priorityConcept: .infection),
        sections: [
            .prose(title: "Approach", AttributedProse("Document wounds in a consistent, measurable way every shift. Three things drive the decision: type of wound, status of the tissue, and risk of infection. Pick a dressing that supports moist healing, manages drainage, and protects the wound bed.", citationIDs: ["openrn_medsurg"])),
            .keyValueTable(title: "Wound classification", [
                KeyValueRow(key: "Surgical (clean)", value: "Closed by primary intention. Heals fastest. Examples: typical surgical incision."),
                KeyValueRow(key: "Surgical (clean-contaminated)", value: "GI/respiratory/urinary tract entered, no infection. Higher infection risk."),
                KeyValueRow(key: "Pressure injury", value: "Stage 1 (intact skin, non-blanching erythema) → Stage 4 (full-thickness, exposed bone/tendon)."),
                KeyValueRow(key: "Diabetic / vascular ulcer", value: "Often slow-healing, infection-prone. Watch for cellulitis, osteomyelitis."),
                KeyValueRow(key: "Burn", value: "Classified by depth (superficial → full-thickness) and TBSA percent."),
                KeyValueRow(key: "Skin tear", value: "Common in elderly. Replace skin flap, secure with steri-strips, non-adherent dressing.")
            ]),
            .bullets(title: "Wound assessment — every shift", [
                AttributedBullet("Location: anatomic, with measurements (length × width × depth in cm).", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Wound bed: percent of granulation (red), slough (yellow/tan), eschar (black). 100% granulation is healing; >50% slough or eschar is concerning.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Edges: approximated, undermining, tunneling. Document depth of any tunnel + clock-position.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Drainage (exudate): amount (none/scant/moderate/large) and character (serous, serosanguineous, sanguineous, purulent).", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Periwound skin: intact, macerated (white, soft from too much moisture), erythematous, indurated.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Pain at wound — character and triggering events (dressing change, position).", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Odor: foul odor often suggests infection or anaerobic colonization.", citationIDs: ["openrn_medsurg"])
            ]),
            .keyValueTable(title: "REEDA — surgical incision assessment", [
                KeyValueRow(key: "R — Redness", value: "Mild erythema near edges normal in first 48 hr; >1 cm or spreading is concerning"),
                KeyValueRow(key: "E — Edema", value: "Some swelling normal; firm induration is concerning"),
                KeyValueRow(key: "E — Ecchymosis", value: "Minor bruising normal; expanding hematoma is concerning"),
                KeyValueRow(key: "D — Drainage", value: "Type and amount; purulent drainage is infection until proven otherwise"),
                KeyValueRow(key: "A — Approximation", value: "Edges should be approximated; gap, dehiscence, or evisceration is emergent")
            ]),
            .keyValueTable(title: "Common dressing types", [
                KeyValueRow(key: "Gauze (dry/wet)", value: "Wet-to-dry mechanical debridement falling out of favor — too painful, damages new tissue"),
                KeyValueRow(key: "Hydrocolloid (DuoDERM)", value: "Self-adhesive, occlusive. For partial-thickness wounds with light to moderate exudate. Stays on 3–7 days."),
                KeyValueRow(key: "Hydrogel", value: "Donates moisture to dry wounds. Soothes painful wounds. For dry or minimally exudative wounds."),
                KeyValueRow(key: "Alginate (calcium alginate)", value: "Highly absorbent. For heavily exudative wounds. Forms a gel as it absorbs."),
                KeyValueRow(key: "Foam", value: "Absorbent + protective. For moderate to heavy exudate. Pressure injury prevention."),
                KeyValueRow(key: "Negative-pressure (wound vac)", value: "Promotes granulation, manages exudate, draws wound edges together. Requires patent seal.")
            ]),
            .bullets(title: "Drain management", [
                AttributedBullet("JP (Jackson-Pratt) and Hemovac: empty when half-full, recompress, document amount and character. Sudden drop in output may mean clogging, not healing.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Penrose: passive drain, secure with pin to prevent migration into wound. Document amount on dressing.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Insertion site: assess for infection, dislodgement, kinking. Maintain occlusive dressing.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Document I&O for drains separate from urine/stool.", citationIDs: ["openrn_medsurg"])
            ]),
            .bullets(title: "Signs of wound infection", [
                AttributedBullet("Localized: redness >1 cm beyond edges, warmth, swelling, increased pain, purulent drainage, foul odor.", citationIDs: ["cdc_infection_control"]),
                AttributedBullet("Systemic: fever, chills, leukocytosis, malaise.", citationIDs: ["cdc_infection_control"]),
                AttributedBullet("Wound deterioration: previously healing wound becomes larger, more painful, or develops slough.", citationIDs: ["cdc_infection_control"]),
                AttributedBullet("Always notify provider; obtain wound culture before starting antibiotics if possible.", citationIDs: ["cdc_infection_control"])
            ])
        ],
        citations: [openrnMedSurg, cdcInfectionControl],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Blood Transfusion

public enum BloodTransfusionAdminSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "blood-transfusion-administration",
        title: "Blood transfusion administration",
        subtitle: "Verification, monitoring schedule, reaction recognition and response",
        eyebrow: "REFERENCE · MED-SURG",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies),
        sections: [
            .prose(title: "Why this is high-alert", AttributedProse("Transfusion errors — wrong patient, wrong product, missed reaction — are among the most consequential errors in nursing. The verification ritual exists for a reason. Skipping any step has been linked to fatal hemolytic reactions. Two RNs at bedside is the standard for a reason.", citationIDs: ["aabb_transfusion_general", "openrn_medsurg"])),
            .numberedSteps(title: "Pre-transfusion (in this order)", [
                "Verify provider order (product, dose/units, rate, indication, special requirements like irradiated/leukoreduced).",
                "Confirm consent on chart (separate transfusion consent form, valid for one episode).",
                "Type & screen on chart, valid (typically 72 hr).",
                "Establish patent IV — large-bore (≥18 gauge) preferred.",
                "Obtain baseline vitals: T, HR, BP, RR, SpO2 — within 30 min of start.",
                "Pick up product from blood bank — must transfuse within 30 min of leaving blood bank.",
                "TWO-RN bedside verification: patient name + DOB + medical record number + ABO/Rh on patient armband AND on blood product label AND on transfusion record. ALL THREE MUST MATCH.",
                "Confirm product expiration date and visual inspection (no clots, abnormal color, leaking).",
                "Connect to blood-administration tubing primed with 0.9% NS (ONLY 0.9% NS — never lactated Ringer's, dextrose, or meds in same line).",
                "Begin transfusion slowly (e.g., 50 mL/hr) for first 15 minutes. STAY AT BEDSIDE."
            ], citationIDs: ["aabb_transfusion_general", "openrn_medsurg"]),
            .keyValueTable(title: "Vital signs schedule", [
                KeyValueRow(key: "Pre-transfusion", value: "Within 30 min before start — baseline"),
                KeyValueRow(key: "15 min into transfusion", value: "Critical assessment — most acute reactions occur in first 15 min"),
                KeyValueRow(key: "Every hour during", value: "Or per facility protocol"),
                KeyValueRow(key: "End of transfusion", value: "Document final volume, time, vitals"),
                KeyValueRow(key: "Total time per unit PRBC", value: "Maximum 4 hours from leaving blood bank — discard at 4 hr regardless")
            ]),
            .keyValueTable(title: "Transfusion reactions — recognize and act", [
                KeyValueRow(key: "Acute hemolytic", value: "Fever, chills, back/flank pain, hypotension, hemoglobinuria. ABO incompatibility — STOP. Disconnect product. Save blood + tubing for return to blood bank."),
                KeyValueRow(key: "Febrile non-hemolytic (most common)", value: "Temperature rise ≥1°C (1.8°F), chills, headache. STOP transfusion to assess; rule out hemolytic before resuming. Often premedicate with acetaminophen for next."),
                KeyValueRow(key: "Allergic (mild)", value: "Urticaria, itching only. Stop temporarily, give antihistamine; may resume slowly per provider order."),
                KeyValueRow(key: "Anaphylaxis (severe allergic)", value: "Hypotension, dyspnea, wheezing, angioedema. STOP. Epinephrine, supportive care."),
                KeyValueRow(key: "TRALI (Transfusion-Related Acute Lung Injury)", value: "Sudden hypoxia, bilateral pulmonary edema within 6 hr of transfusion. STOP. Supportive care, often ICU."),
                KeyValueRow(key: "TACO (Transfusion-Associated Circulatory Overload)", value: "Dyspnea, hypertension, JVD, crackles. Slow or stop transfusion. Diuresis. Differentiate from TRALI by hypertension and BNP rise."),
                KeyValueRow(key: "Bacterial contamination (rare)", value: "High fever (>2°C above baseline), rigors, hypotension within minutes. STOP. Sepsis workup, broad-spectrum abx, return product for culture.")
            ]),
            .numberedSteps(title: "ANY suspected reaction — immediate steps", [
                "STOP the transfusion immediately. Do NOT just slow the rate.",
                "Disconnect the blood product from the patient (clamp at the spike — do NOT flush remaining product into patient).",
                "Maintain IV access with 0.9% NS through new tubing.",
                "Notify provider AND blood bank.",
                "Reassess vitals every 15 min until stable.",
                "Collect post-reaction labs per protocol (CBC, BMP, LDH, haptoglobin, urinalysis for hemoglobinuria, blood and urine cultures if febrile).",
                "Send the partially-used blood product, tubing, and a fresh blood sample to blood bank for re-typing and crossmatch.",
                "Complete transfusion-reaction report.",
                "Document everything: time started, time stopped, signs/symptoms, interventions, vitals."
            ], citationIDs: ["aabb_transfusion_general", "openrn_medsurg"])
        ],
        citations: [aabbTransfusion, openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Anticoagulation Teaching

public enum AnticoagulationTeachingSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "anticoagulation-teaching",
        title: "Anticoagulation patient teaching",
        subtitle: "Warfarin, DOACs, lovenox — what every patient must understand at discharge",
        eyebrow: "REFERENCE · MED-SURG",
        nclexTags: NCLEXTags(category: .healthPromotion, priorityConcept: .clottingHemostasis),
        sections: [
            .prose(title: "Discharge teaching is the safety net", AttributedProse("Most anticoagulant adverse events happen at home. The patient who understands when to call, what foods change INR, and what bleeding signs are emergencies has dramatically lower readmission risk. Confirm understanding with teach-back, not yes/no questions.", citationIDs: ["openrn_medsurg"])),
            .keyValueTable(title: "Anticoagulant class quick reference", [
                KeyValueRow(key: "Warfarin (Coumadin)", value: "Vitamin K antagonist. Slow onset (~3–5 days), monitor INR. Antidote: vitamin K (oral or IV)."),
                KeyValueRow(key: "Apixaban (Eliquis), Rivaroxaban (Xarelto)", value: "Direct factor Xa inhibitors. No routine INR. Antidote: andexanet alfa, 4F-PCC."),
                KeyValueRow(key: "Dabigatran (Pradaxa)", value: "Direct thrombin inhibitor. No routine INR. Antidote: idarucizumab."),
                KeyValueRow(key: "Enoxaparin (Lovenox)", value: "LMWH, SubQ. Weight-based. No routine monitoring. Reversed partially by protamine."),
                KeyValueRow(key: "Heparin (UFH)", value: "IV infusion. Monitor aPTT or anti-Xa. Antidote: protamine sulfate.")
            ]),
            .bullets(title: "What every anticoagulant patient must know", [
                AttributedBullet("Take medication exactly as prescribed. Do NOT double up if a dose is missed — call the clinic.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Bleeding precautions: soft toothbrush, electric razor, no contact sports, careful with knives/scissors.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Tell every provider (including dentist, pharmacist, surgeon) that you are on anticoagulation BEFORE any procedure or new prescription.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Wear medical-alert ID.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Avoid NSAIDs (ibuprofen, naproxen, aspirin) unless prescribed — they increase bleeding risk.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Limit alcohol — it interacts with most anticoagulants.", citationIDs: ["openrn_medsurg"])
            ]),
            .bullets(title: "Warfarin-specific teaching", [
                AttributedBullet("INR monitoring: weekly until stable, then monthly. Goal INR depends on indication (typically 2–3).", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Vitamin K diet consistency: don't avoid leafy greens — keep intake CONSISTENT week to week. Sudden change in greens (more or less) shifts INR.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Drug interactions are extensive — antibiotics, amiodarone, fluconazole increase INR; rifampin, carbamazepine decrease INR. Check with pharmacist on every new med.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Cranberry juice and grapefruit can affect INR — consume cautiously.", citationIDs: ["openrn_medsurg"])
            ]),
            .bullets(title: "DOAC-specific teaching (apixaban, rivaroxaban, dabigatran)", [
                AttributedBullet("Take exactly as scheduled — short half-life means missed doses leave the patient unprotected within hours.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Rivaroxaban: take with food (improves absorption); apixaban: with or without food.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Renal impairment matters — dose adjusted for creatinine clearance; report any kidney issues.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("No routine lab monitoring — but periodic CBC and renal function still indicated.", citationIDs: ["openrn_medsurg"])
            ]),
            .bullets(title: "Lovenox (enoxaparin) teaching", [
                AttributedBullet("SubQ injection in abdomen 2 inches from umbilicus, alternate sides. Do NOT expel air bubble (it's part of the dose).", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Don't massage site — increases bruising. Apply gentle pressure.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Store at room temperature; do not refrigerate.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Document each injection (date, time, site).", citationIDs: ["openrn_medsurg"])
            ]),
            .bullets(title: "Call provider / 911 — bleeding signs", [
                AttributedBullet("Call provider: nosebleed >10 min, gum bleeding with brushing, easy bruising, blood in urine or stool, prolonged bleeding from cuts.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Call 911: severe headache (intracranial bleed), vomiting blood, large amounts of bright red rectal blood, severe abdominal pain, weakness/slurred speech, fall with head strike.", citationIDs: ["openrn_medsurg"]),
                AttributedBullet("Bring medication list (or actual bottles) to ER — antidote choice depends on which agent.", citationIDs: ["openrn_medsurg"])
            ])
        ],
        citations: [openrnMedSurg],
        lastSourceFidelityReview: "2026-05-04"
    )
}
