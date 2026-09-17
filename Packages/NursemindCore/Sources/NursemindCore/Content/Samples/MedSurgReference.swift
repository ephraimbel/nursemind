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
