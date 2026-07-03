import Foundation

// ECMO basics reference — ELSO guideline concepts and CESAR trial cited as
// concept citations; general critical-care monitoring claims from Open RN
// (CC BY 4.0). Tier-A RN review pending pre-launch.

private let elsoGuidelines = CitationSource(
    id: "ecmo_elso_guidelines",
    shortName: "ELSO General Guidelines for ECLS (concept citation)",
    detail: "Extracorporeal Life Support Organization guidelines for adult respiratory and cardiac ECMO",
    publisher: "Extracorporeal Life Support Organization",
    license: .factCitationOnly,
    url: "https://www.elso.org/ecmo-resources/elso-ecmo-guidelines.aspx",
    lastRetrieved: "2026-07-02"
)

private let cesarPeek = CitationSource(
    id: "ecmo_cesar_2009",
    shortName: "CESAR — Peek et al, Lancet 2009 (concept citation)",
    detail: "Efficacy of transfer to an ECMO center in severe adult respiratory failure — landmark RCT",
    publisher: "The Lancet",
    license: .factCitationOnly,
    url: "https://pubmed.ncbi.nlm.nih.gov/19762075/",
    lastRetrieved: "2026-07-02"
)

private let openrnCritCareECMO = CitationSource(
    id: "ecmo_openrn_critcare",
    shortName: "Open RN — Health Alterations: Critical Care chapters",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-07-02"
)

// MARK: - ECMO Basics

public enum ECMOBasicsSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "ecmo-basics",
        title: "ECMO basics",
        subtitle: "VV vs VA, circuit anatomy, nursing priorities",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .prose(title: "What ECMO is and when it's considered", AttributedProse("Extracorporeal membrane oxygenation drains venous blood, pumps it across a membrane oxygenator that adds oxygen and removes CO₂, and returns it to the patient — taking over gas exchange, and in some configurations circulation, while the lungs or heart recover. ELSO guidelines describe it as a rescue for severe, potentially reversible respiratory or cardiac failure refractory to conventional support; the CESAR trial showed a survival benefit from referral to an ECMO-capable center in severe adult respiratory failure. It is a bridge — to recovery, to transplant, or to a durable device — not a treatment in itself.", citationIDs: ["ecmo_elso_guidelines", "ecmo_cesar_2009"])),
            .keyValueTable(title: "VV vs VA — what each configuration does", [
                KeyValueRow(key: "VV (venovenous)", value: "Drains and returns blood on the venous side. Supports gas exchange only — the patient's own heart drives circulation. Used for severe respiratory failure (e.g., ARDS) with preserved cardiac function."),
                KeyValueRow(key: "VA (venoarterial)", value: "Drains venous blood, returns it to the arterial system. Supports both gas exchange and circulation. Used for cardiogenic shock, cardiac arrest (ECPR), and failure to wean from cardiopulmonary bypass."),
                KeyValueRow(key: "Cannulation", value: "VV commonly femoral–internal jugular or a single dual-lumen jugular cannula. Peripheral VA commonly femoral vein to femoral artery; central VA cannulates the great vessels directly."),
                KeyValueRow(key: "Pulsatility", value: "VV: arterial waveform reflects native cardiac function. VA: high pump flows can narrow pulse pressure; the native heart and the circuit share the workload."),
                KeyValueRow(key: "Distinct VA concern", value: "Differential hypoxemia (\"north–south syndrome\") in peripheral VA — poorly oxygenated blood from failing lungs perfuses the upper body while circuit blood perfuses the lower body. Right-hand or right-ear oximetry helps detect it."),
                KeyValueRow(key: "Distinct VV concern", value: "Recirculation — returned oxygenated blood is drawn straight back into the drainage cannula instead of reaching the patient, lowering effective support.")
            ]),
            .keyValueTable(title: "Circuit components the bedside nurse watches", [
                KeyValueRow(key: "Drainage cannula", value: "Pulls venous blood into the circuit. \"Chatter\" or line shaking suggests hypovolemia or cannula position issues limiting drainage."),
                KeyValueRow(key: "Pump (centrifugal)", value: "Drives flow. Console displays RPM and resulting flow (L/min) — a rising RPM requirement for the same flow is a change worth reporting."),
                KeyValueRow(key: "Membrane oxygenator", value: "Adds O₂, removes CO₂. Watch pre- and post-oxygenator pressures; a rising gradient suggests clot burden in the oxygenator."),
                KeyValueRow(key: "Sweep gas", value: "Gas flow across the oxygenator; governs CO₂ removal. Blender FiO₂ governs oxygenation of circuit blood."),
                KeyValueRow(key: "Return cannula", value: "Delivers blood back to the patient. Both cannula sites are secured, splinted where needed, and checked for bleeding and migration."),
                KeyValueRow(key: "Circuit tubing", value: "Inspected along its full length for kinks, clots (dark or fibrin strands), and any air.")
            ]),
            .bullets(title: "Hourly nursing monitoring priorities", [
                AttributedBullet("Cannula sites every hour: bleeding, oozing, hematoma, insertion depth against the documented mark, dressing integrity.", citationIDs: ["ecmo_elso_guidelines", "ecmo_openrn_critcare"]),
                AttributedBullet("Limb perfusion distal to femoral cannulas — pulses (palpation or Doppler), color, temperature, capillary refill. Critical in peripheral VA, where a distal perfusion catheter is often placed to protect the leg.", citationIDs: ["ecmo_elso_guidelines", "ecmo_openrn_critcare"]),
                AttributedBullet("Circuit flows, RPM, and line chatter — chatter with falling flows often signals hypovolemia; trends are reported to the ECMO specialist or perfusionist.", citationIDs: ["ecmo_elso_guidelines"]),
                AttributedBullet("Anticoagulation labs per protocol — anti-Xa, aPTT, or ACT, plus platelet count and fibrinogen trends; the circuit consumes platelets and clotting factors.", citationIDs: ["ecmo_elso_guidelines", "ecmo_openrn_critcare"]),
                AttributedBullet("Sedation and neuro checks — pupils and any lateralizing signs matter because intracranial hemorrhage is a feared complication of systemic anticoagulation; sedation is titrated to the ordered goal with daily reassessment where feasible.", citationIDs: ["ecmo_openrn_critcare"]),
                AttributedBullet("Right-sided (right hand / right ear) SpO₂ monitoring in peripheral VA to catch differential hypoxemia early.", citationIDs: ["ecmo_elso_guidelines"]),
                AttributedBullet("Pressure injury prevention and micro-positioning — repositioning is a coordinated, multi-person event because cannula migration can be catastrophic.", citationIDs: ["ecmo_openrn_critcare"])
            ]),
            .bullets(title: "Complications to watch for", [
                AttributedBullet("Bleeding — the most common complication: cannula sites, airway, GI tract, and intracranial. Driven by anticoagulation, platelet consumption, and acquired coagulopathy.", citationIDs: ["ecmo_elso_guidelines"]),
                AttributedBullet("Hemolysis — pump shear destroys red cells. Clues: rising plasma-free hemoglobin or LDH, falling haptoglobin, tea- or cola-colored urine.", citationIDs: ["ecmo_elso_guidelines"]),
                AttributedBullet("Limb ischemia — mottled, cool, pulseless leg distal to a femoral arterial cannula is an emergency; escalate immediately.", citationIDs: ["ecmo_elso_guidelines", "ecmo_openrn_critcare"]),
                AttributedBullet("Air in the circuit — can airlock the pump or embolize; any visible air is an emergency handled per unit protocol with the ECMO specialist.", citationIDs: ["ecmo_elso_guidelines"]),
                AttributedBullet("Recirculation (VV) — falling patient SpO₂ despite unchanged circuit flows and a highly saturated drainage line suggests returned blood is being recaptured before it circulates.", citationIDs: ["ecmo_elso_guidelines"]),
                AttributedBullet("Oxygenator failure — rising pressure gradient across the membrane, worsening post-oxygenator gases, visible clot; the team prepares for a circuit change.", citationIDs: ["ecmo_elso_guidelines"]),
                AttributedBullet("Infection — cannulas are large, long-dwelling vascular devices; strict sterile technique and daily site assessment apply.", citationIDs: ["ecmo_openrn_critcare"])
            ])
        ],
        citations: [elsoGuidelines, cesarPeek, openrnCritCareECMO],
        lastSourceFidelityReview: "2026-07-02"
    )
}
