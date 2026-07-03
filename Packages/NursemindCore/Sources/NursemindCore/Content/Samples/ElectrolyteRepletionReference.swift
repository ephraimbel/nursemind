import Foundation

// Electrolyte repletion principles — monitoring and safety concepts only, not
// a dosing protocol. Label-derived claims cite openFDA SPL for potassium
// chloride and magnesium sulfate; nursing-monitoring claims cite Open RN
// (CC BY 4.0). Tier-A RN review pending pre-launch.

private let openfdaKCl = CitationSource(
    id: "lyte_openfda_kcl",
    shortName: "openFDA SPL — Potassium Chloride injection labeling",
    detail: "Premixed potassium chloride in dextrose/saline injection labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-07-02"
)

private let openfdaMagSulfate = CitationSource(
    id: "lyte_openfda_mag_sulfate",
    shortName: "openFDA SPL — Magnesium Sulfate injection labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-07-02"
)

private let openfdaCalcium = CitationSource(
    id: "lyte_openfda_calcium",
    shortName: "openFDA SPL — Calcium Gluconate and Calcium Chloride injection labeling",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://open.fda.gov/apis/drug/label/",
    lastRetrieved: "2026-07-02"
)

private let openrnElectrolytes = CitationSource(
    id: "lyte_openrn_electrolytes",
    shortName: "Open RN Health Alterations — Fluids & Electrolytes chapter",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/",
    lastRetrieved: "2026-07-02"
)

// MARK: - Electrolyte Repletion Principles

public enum ElectrolyteRepletionSample {
    public static let entry: ReferenceEntry = ReferenceEntry(
        id: "electrolyte-repletion-principles",
        title: "Electrolyte repletion principles",
        subtitle: "K, Mg, Phos, Ca — monitoring and safety concepts",
        eyebrow: "REFERENCE · ICU",
        nclexTags: NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .fluidElectrolytes),
        sections: [
            .prose(title: "Why repletion is protocolized", AttributedProse("This is not a dosing protocol. Institutional repletion protocols govern doses, rates, concentrations, and recheck intervals — because the same electrolyte given the same way behaves differently depending on renal function, access type, concurrent losses, and how the level is trending. What follows are the monitoring and safety concepts behind those protocols, drawn from FDA product labeling and nursing references, so the numbers on your unit's protocol make sense. Your institution's protocol and the provider's order always control.", citationIDs: ["lyte_openrn_electrolytes"])),
            .keyValueTable(title: "Potassium — safety concepts", [
                KeyValueRow(key: "Never IV push", value: "Potassium chloride is always administered as a diluted infusion — labeling requires dilution and warns that rapid administration can cause fatal arrhythmias."),
                KeyValueRow(key: "Peripheral concentration limits", value: "Labeling for premixed KCl describes lower concentrations (commonly on the order of 10 mEq per 100 mL) for peripheral lines; higher concentrations irritate and injure peripheral veins and are reserved for central access per institutional policy."),
                KeyValueRow(key: "Rate and cardiac monitoring", value: "Labeling describes conservative infusion rates (commonly around 10 mEq/hr) without continuous ECG monitoring, and continuous cardiac monitoring when faster correction is ordered for severe hypokalemia."),
                KeyValueRow(key: "Renal function", value: "Potassium is renally cleared — labeling warns that impaired renal function or oliguria raises hyperkalemia risk; a recent creatinine and urine output matter before every dose."),
                KeyValueRow(key: "Magnesium first", value: "Hypomagnesemia causes renal potassium wasting — a low potassium that will not correct often has a low magnesium underneath it."),
                KeyValueRow(key: "Site assessment", value: "KCl is a vesicant-like irritant peripherally — burning at the site, and any sign of infiltration, warrants stopping the infusion and assessing.")
            ]),
            .keyValueTable(title: "Magnesium — safety concepts", [
                KeyValueRow(key: "Renal function first", value: "Magnesium is renally excreted — labeling warns that renal impairment predisposes to magnesium toxicity, so renal function is reviewed before repletion."),
                KeyValueRow(key: "Deep tendon reflexes", value: "With higher doses or infusions (as in obstetric use), labeling describes monitoring patellar (knee-jerk) reflexes — loss of the reflex is an early sign of hypermagnesemia."),
                KeyValueRow(key: "Toxicity progression", value: "Flushing, hypotension, and diminished reflexes progress to respiratory depression and cardiac conduction changes as levels climb — the reason rate limits and monitoring exist."),
                KeyValueRow(key: "Rate matters", value: "Rapid IV magnesium causes flushing, hypotension, and bradyarrhythmias; infusions run at protocol-specified rates, not wide open."),
                KeyValueRow(key: "Antidote awareness", value: "Labeling identifies IV calcium as the antagonist for magnesium toxicity — know where it lives on your unit when magnesium is infusing.")
            ]),
            .keyValueTable(title: "Phosphorus — safety concepts", [
                KeyValueRow(key: "K salt vs Na salt", value: "IV phosphate comes as potassium phosphate or sodium phosphate — the choice considers the patient's potassium and sodium. Repleting phosphate with the potassium salt in a patient with borderline-high potassium adds risk the protocol accounts for."),
                KeyValueRow(key: "Infusion rate", value: "IV phosphate is infused slowly per protocol — rapid administration risks hypocalcemia, hypotension, and calcium-phosphate precipitation."),
                KeyValueRow(key: "Companion labs", value: "Calcium is tracked alongside phosphate repletion — phosphate binds calcium, and a falling ionized calcium during repletion is the complication being watched for."),
                KeyValueRow(key: "Renal function", value: "Phosphate and its accompanying cation are renally cleared; impaired renal function changes the risk calculus and is flagged to the provider.")
            ]),
            .keyValueTable(title: "Calcium — safety concepts", [
                KeyValueRow(key: "Gluconate vs chloride", value: "Calcium chloride carries roughly three times the elemental calcium of the same volume of calcium gluconate and is substantially more caustic — extravasation can cause tissue necrosis. Gluconate is generally preferred for peripheral administration; chloride is typically reserved for central lines or arrest situations per protocol."),
                KeyValueRow(key: "Extravasation vigilance", value: "Labeling warns against extravasation for both salts — a patent, monitored line and site checks during administration are part of the safety envelope."),
                KeyValueRow(key: "Correct for albumin / check ionized", value: "Total calcium reads falsely low when albumin is low. Ionized calcium — or an albumin-corrected value — is the number that reflects physiology; repleting a \"low\" total calcium with a normal ionized level treats a lab artifact."),
                KeyValueRow(key: "Rate and monitoring", value: "Rapid IV calcium causes vasodilation, hypotension, and bradyarrhythmias — labeling describes slow administration, with cardiac monitoring in the settings protocols specify."),
                KeyValueRow(key: "Digoxin caution", value: "Labeling warns that IV calcium can potentiate digoxin toxicity — a digoxin-treated patient receiving IV calcium is flagged to the provider.")
            ]),
            .bullets(title: "Before you replete", [
                AttributedBullet("Verify the level is recent and plausible — a hemolyzed potassium sample reads falsely high, and a level drawn above an infusing line reads falsely for whatever is infusing. When the number doesn't fit the patient, redraw before treating.", citationIDs: ["lyte_openrn_electrolytes"]),
                AttributedBullet("Check renal function and urine output — impaired clearance changes the safety picture for potassium, magnesium, and phosphate alike.", citationIDs: ["lyte_openfda_kcl", "lyte_openfda_mag_sulfate"]),
                AttributedBullet("Look for concurrent losses — ongoing diarrhea, NG suction, high-dose diuretics, or CRRT mean the level you just treated is already falling; the pattern belongs in the provider conversation.", citationIDs: ["lyte_openrn_electrolytes"]),
                AttributedBullet("Confirm access matches the order — concentration and rate limits differ between peripheral and central lines, and the vesicant-adjacent agents (KCl, calcium chloride) demand a verified, patent line.", citationIDs: ["lyte_openfda_kcl", "lyte_openfda_calcium"]),
                AttributedBullet("Know the recheck timing per unit protocol — repletion is a loop, not a single dose: level, replete, recheck, reassess.", citationIDs: ["lyte_openrn_electrolytes"])
            ])
        ],
        citations: [openfdaKCl, openfdaMagSulfate, openfdaCalcium, openrnElectrolytes],
        lastSourceFidelityReview: "2026-07-02"
    )
}
