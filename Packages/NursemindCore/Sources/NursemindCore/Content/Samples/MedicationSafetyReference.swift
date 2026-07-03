import Foundation

// Medication-safety reference — the daily nurse safety lookups that physician-
// oriented references skip. Curator model: well-established safety facts are
// presented with attribution to the public safety lists (ISMP, FDA Name
// Differentiation Project, The Joint Commission); the lists' proprietary text
// is not reproduced. Non-directive throughout — describes what the lists say
// and what nurses verify, never a patient-specific instruction.

private let ismpHighAlert = CitationSource(
    id: "ismp_high_alert",
    shortName: "ISMP List of High-Alert Medications in Acute Care Settings (concept citation)",
    detail: "Institute for Safe Medication Practices — heightened-harm medication list",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-07-03"
)

private let ismpConfusedNames = CitationSource(
    id: "ismp_confused_names",
    shortName: "ISMP List of Confused Drug Names (concept citation)",
    detail: "Look-alike / sound-alike (LASA) drug name pairs",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/confused-drug-names-list",
    lastRetrieved: "2026-07-03"
)

private let fdaTallMan = CitationSource(
    id: "fda_tall_man",
    shortName: "FDA Name Differentiation Project — Tall Man Lettering",
    detail: "FDA-recommended mixed-case lettering to distinguish look-alike names",
    publisher: "FDA",
    license: .publicDomain,
    url: "https://www.fda.gov/drugs/medication-errors-related-cder-regulated-drug-products/name-differentiation-project",
    lastRetrieved: "2026-07-03"
)

private let ismpDoNotCrush = CitationSource(
    id: "ismp_do_not_crush",
    shortName: "ISMP Oral Dosage Forms That Should Not Be Crushed (concept citation)",
    detail: "Institute for Safe Medication Practices — 'Do Not Crush' list",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/do-not-crush",
    lastRetrieved: "2026-07-03"
)

private let ismpErrorProne = CitationSource(
    id: "ismp_error_prone",
    shortName: "ISMP List of Error-Prone Abbreviations, Symbols, and Dose Designations (concept citation)",
    detail: "Institute for Safe Medication Practices",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/error-prone-abbreviations-list",
    lastRetrieved: "2026-07-03"
)

private let tjcDoNotUse = CitationSource(
    id: "tjc_do_not_use",
    shortName: "The Joint Commission — Official 'Do Not Use' List (concept citation)",
    detail: "Abbreviations prohibited on orders and medication-related documentation",
    publisher: "The Joint Commission",
    license: .factCitationOnly,
    url: "https://www.jointcommission.org/resources/patient-safety-topics/the-official-do-not-use-list/",
    lastRetrieved: "2026-07-03"
)

private let openrnMedSafety = CitationSource(
    id: "openrn_med_safety",
    shortName: "Open RN Nursing Pharmacology — Medication Safety",
    detail: "Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/",
    lastRetrieved: "2026-07-03"
)

// MARK: - High-Alert Medications

public enum HighAlertMedicationsSample {
    public static let entry = ReferenceEntry(
        id: "high-alert-medications",
        title: "High-alert medications (ISMP)",
        subtitle: "Classes and drugs that carry heightened harm risk if used in error",
        eyebrow: "REFERENCE · MEDICATION SAFETY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .prose(title: "What \"high-alert\" means", AttributedProse("ISMP defines high-alert medications as drugs that bear a heightened risk of causing significant patient harm when they are used in error. Errors with these drugs are not necessarily more common — the consequences when they do occur are more devastating. The published safeguards are systems-level: standardized concentrations, smart-pump dose limits, independent double-checks, auxiliary warning labels, and removing concentrated electrolytes from patient-care unit stock. Which safeguards apply, and when, is governed by institutional policy.", citationIDs: ["ismp_high_alert", "openrn_med_safety"])),
            .keyValueTable(title: "High-alert classes (acute care)", [
                KeyValueRow(key: "Anticoagulants", value: "Heparin (unfractionated + LMWH), warfarin, direct oral anticoagulants, argatroban, bivalirudin."),
                KeyValueRow(key: "Insulin", value: "All insulins, subcutaneous and IV; U-500 concentration is a distinct high-alert product."),
                KeyValueRow(key: "Opioids", value: "IV, transdermal, and all extended-release oral opioids."),
                KeyValueRow(key: "Neuromuscular blockers", value: "Rocuronium, vecuronium, cisatracurium, succinylcholine — paralysis without ventilation is fatal."),
                KeyValueRow(key: "Concentrated electrolytes", value: "KCl for injection, potassium phosphate, hypertonic saline (\u{2265}3%), magnesium sulfate injection."),
                KeyValueRow(key: "Chemotherapy / antineoplastics", value: "Parenteral and oral; narrow therapeutic index, complex protocols."),
                KeyValueRow(key: "IV adrenergic agonists", value: "Epinephrine, norepinephrine, phenylephrine, dopamine, dobutamine."),
                KeyValueRow(key: "IV adrenergic antagonists", value: "Metoprolol, labetalol, esmolol."),
                KeyValueRow(key: "Sedation / anesthetic agents", value: "Propofol, ketamine, dexmedetomidine, midazolam (moderate-sedation and IV forms)."),
                KeyValueRow(key: "Epidural / intrathecal", value: "Any medication given by the neuraxial route."),
                KeyValueRow(key: "Parenteral nutrition", value: "Complex, multi-additive admixtures."),
                KeyValueRow(key: "Inotropes (IV)", value: "Digoxin, milrinone.")
            ]),
            .keyValueTable(title: "Specific high-alert medications", [
                KeyValueRow(key: "Heparin (unfractionated)", value: "Concentration confusion (units/mL) is a classic fatal error."),
                KeyValueRow(key: "Warfarin", value: "Narrow index, diet/drug interactions, delayed effect."),
                KeyValueRow(key: "Insulin U-500", value: "Five times the usual concentration; dosing and device confusion."),
                KeyValueRow(key: "Methotrexate (oral, non-oncologic)", value: "Dosed weekly for immune conditions — daily dosing has caused fatal toxicity."),
                KeyValueRow(key: "Oxytocin (IV)", value: "Titrated uterine stimulant; hyperstimulation risk."),
                KeyValueRow(key: "Nitroprusside sodium", value: "Potent vasodilator; cyanide accumulation with prolonged/high dosing."),
                KeyValueRow(key: "Magnesium sulfate (injection)", value: "Respiratory depression and cardiac effects at high levels."),
                KeyValueRow(key: "Promethazine (IV)", value: "Severe tissue injury / gangrene on extravasation."),
                KeyValueRow(key: "Potassium chloride (injection, concentrate)", value: "Never IV push; must be diluted.")
            ]),
            .bullets(title: "What nurses verify", [
                AttributedBullet("Independent double-check by a second nurse before administration, where institutional policy requires it (commonly insulin, heparin, chemo, PCA, epidural, concentrated electrolytes).", citationIDs: ["ismp_high_alert"]),
                AttributedBullet("Standardized concentrations and smart-pump dose-error-reduction limits are used rather than free-flow or custom mixes.", citationIDs: ["ismp_high_alert"]),
                AttributedBullet("Concentrated electrolytes are not stocked in patient-care units per policy; they arrive premixed from pharmacy.", citationIDs: ["ismp_high_alert"]),
                AttributedBullet("Auxiliary \"HIGH ALERT\" labeling and barcode scanning at the bedside confirm the right product and strength.", citationIDs: ["ismp_high_alert", "openrn_med_safety"]),
                AttributedBullet("Verbal and phone orders are read back and confirmed; these routes are avoided for high-alert drugs where possible.", citationIDs: ["ismp_high_alert"]),
                AttributedBullet("Individual high-alert drugs are flagged throughout this library; the Drugs list can be filtered to high-alert entries.", citationIDs: ["ismp_high_alert"])
            ])
        ],
        citations: [ismpHighAlert, openrnMedSafety],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Look-Alike / Sound-Alike + Tall Man Lettering

public enum ConfusedDrugNamesSample {
    public static let entry = ReferenceEntry(
        id: "confused-drug-names",
        title: "Look-alike / sound-alike drug names",
        subtitle: "LASA pairs and tall man lettering that prevent mix-ups",
        eyebrow: "REFERENCE · MEDICATION SAFETY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .prose(title: "Why names get confused", AttributedProse("Look-alike / sound-alike (LASA) errors come from similar spelling or pronunciation, similar packaging and label design, illegible handwriting, verbal orders, and incomplete knowledge of one of the drugs. The main published mitigation is tall man lettering — mixed-case emphasis of the letters that differ between two names (for example hydrOXYzine versus hydrALAZINE) — recommended by the FDA Name Differentiation Project and ISMP and applied on labels, shelves, and screens.", citationIDs: ["ismp_confused_names", "fda_tall_man"])),
            .keyValueTable(title: "Common tall man pairs", [
                KeyValueRow(key: "hydrALAZINE / hydrOXYzine", value: "Antihypertensive vs antihistamine / anxiolytic."),
                KeyValueRow(key: "DOPamine / DOBUTamine", value: "Vasopressor vs inotrope — different hemodynamic effects."),
                KeyValueRow(key: "predniSONE / prednisoLONE", value: "Related corticosteroids, not interchangeable doses."),
                KeyValueRow(key: "vinBLAStine / vinCRIStine", value: "Chemotherapy — dosing errors are frequently fatal."),
                KeyValueRow(key: "DAUNOrubicin / DOXOrubicin", value: "Anthracycline chemotherapy agents."),
                KeyValueRow(key: "EPINEPHrine / ePHEDrine", value: "Emergency vasopressor vs milder pressor."),
                KeyValueRow(key: "fentaNYL / SUFentanil", value: "Opioids of very different potency."),
                KeyValueRow(key: "HYDROmorphone / morphine", value: "Hydromorphone is substantially more potent per mg."),
                KeyValueRow(key: "oxyCODONE / oxyMORphone", value: "Different potencies; also confused with brand OxyCONTIN."),
                KeyValueRow(key: "glipiZIDE / glyBURIDE", value: "Sulfonylureas with different durations."),
                KeyValueRow(key: "niCARdipine / NIFEdipine", value: "Calcium channel blockers, different uses."),
                KeyValueRow(key: "traMADol / traZODone", value: "Analgesic vs antidepressant / sleep aid."),
                KeyValueRow(key: "buPROPion / busPIRone", value: "Antidepressant / cessation aid vs anxiolytic."),
                KeyValueRow(key: "ceFAZolin / cefTRIAXone", value: "Cephalosporins with different spectra and dosing."),
                KeyValueRow(key: "metFORMIN / metroNIDAZOLE", value: "Antidiabetic vs antibiotic.")
            ]),
            .bullets(title: "How nurses reduce LASA errors", [
                AttributedBullet("Confirm the indication matches the drug — a drug that does not fit the patient's condition is a flag to stop and verify.", citationIDs: ["ismp_confused_names", "openrn_med_safety"]),
                AttributedBullet("Use both brand and generic names, and confirm strength and route, when a name could be confused.", citationIDs: ["ismp_confused_names"]),
                AttributedBullet("Barcode-scan at the bedside; the scan catches a wrong-product pull the eye may miss.", citationIDs: ["ismp_confused_names"]),
                AttributedBullet("Read back verbal and telephone orders, spelling the drug name where confusion is possible.", citationIDs: ["ismp_confused_names"]),
                AttributedBullet("Look-alike products are stored apart with tall man labels; report near-misses so pairs get separated.", citationIDs: ["ismp_confused_names"])
            ])
        ],
        citations: [ismpConfusedNames, fdaTallMan, openrnMedSafety],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Do Not Crush

public enum DoNotCrushSample {
    public static let entry = ReferenceEntry(
        id: "do-not-crush",
        title: "Do not crush — oral medications",
        subtitle: "Formulations that lose safety or efficacy when altered",
        eyebrow: "REFERENCE · MEDICATION SAFETY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety),
        sections: [
            .prose(title: "Why some tablets can't be crushed", AttributedProse("Altering certain oral forms defeats the design of the product. Crushing a modified-release tablet destroys the rate-controlling mechanism and can deliver the whole dose at once (\"dose dumping\"). Enteric coatings protect an acid-labile drug from the stomach — or the stomach from an irritant drug — so breaking them changes absorption and tolerability. Sublingual and buccal forms depend on mucosal absorption. Hazardous and cytotoxic drugs can aerosolize when crushed, exposing the person preparing them. When a form should not be crushed, the safe path is an alternative product or route confirmed with pharmacy — never a crushed dose \"to get it down.\"", citationIDs: ["ismp_do_not_crush"])),
            .keyValueTable(title: "Formulation types not to crush", [
                KeyValueRow(key: "Extended-release", value: "ER, XR, XL, SR, CR, LA, CD, Contin — rate-controlled; crushing risks dose dumping."),
                KeyValueRow(key: "Enteric-coated / delayed-release", value: "EC, DR — coating protects the drug or the stomach; crushing removes that protection."),
                KeyValueRow(key: "Sublingual / buccal", value: "Designed for mucosal absorption; crushing and swallowing changes the effect."),
                KeyValueRow(key: "Orally disintegrating (ODT)", value: "Meant to dissolve on the tongue; do not crush."),
                KeyValueRow(key: "Effervescent", value: "Must be dissolved as intended, not crushed and swallowed dry."),
                KeyValueRow(key: "Modified-release capsules", value: "Contain coated beads/pellets; crushing the beads defeats the release control."),
                KeyValueRow(key: "Hazardous / cytotoxic", value: "Chemotherapy and select agents (e.g., finasteride, dutasteride) aerosolize; also a teratogen-exposure risk.")
            ]),
            .keyValueTable(title: "Notable examples", [
                KeyValueRow(key: "Metoprolol succinate (ER)", value: "Do not crush. The tartrate (immediate-release) salt is a different product that generally can be."),
                KeyValueRow(key: "Oxycodone ER / morphine ER", value: "Crushing removes abuse-deterrent and rate control; dangerous dose dumping."),
                KeyValueRow(key: "Nifedipine ER, diltiazem CD", value: "Extended-release cardiovascular agents."),
                KeyValueRow(key: "Bupropion SR / XL", value: "Crushing raises seizure risk."),
                KeyValueRow(key: "Pantoprazole, aspirin (EC)", value: "Enteric-coated; crushing alters absorption and gastric tolerance."),
                KeyValueRow(key: "Potassium chloride ER", value: "Wax/matrix release; crushing is a GI-irritation and dumping risk."),
                KeyValueRow(key: "Tamsulosin", value: "Modified-release; do not crush.")
            ]),
            .bullets(title: "Nursing alternatives (confirm with pharmacy)", [
                AttributedBullet("Check for an immediate-release equivalent, an oral liquid, or a different route before altering any dose.", citationIDs: ["ismp_do_not_crush", "openrn_med_safety"]),
                AttributedBullet("For a patient who cannot swallow or has an enteral tube, pharmacy identifies a compatible formulation — do not assume.", citationIDs: ["ismp_do_not_crush", "openrn_med_safety"]),
                AttributedBullet("Some extended-release capsules may be opened and the beads given without crushing them — this is product-specific and verified against the label, not generalized.", citationIDs: ["ismp_do_not_crush"]),
                AttributedBullet("Wear appropriate protection and avoid crushing hazardous drugs in shared spaces.", citationIDs: ["ismp_do_not_crush"])
            ])
        ],
        citations: [ismpDoNotCrush, openrnMedSafety],
        lastSourceFidelityReview: "2026-07-03"
    )
}

// MARK: - Error-Prone Abbreviations

public enum ErrorProneAbbreviationsSample {
    public static let entry = ReferenceEntry(
        id: "error-prone-abbreviations",
        title: "Error-prone abbreviations",
        subtitle: "\"Do Not Use\" abbreviations, symbols, and dose expressions",
        eyebrow: "REFERENCE · MEDICATION SAFETY",
        nclexTags: NCLEXTags(category: .safeAndEffectiveCare, subcategory: .safetyAndInfectionControl, priorityConcept: .safety),
        sections: [
            .prose(title: "Why abbreviations cause errors", AttributedProse("Ambiguous abbreviations, symbols, and dose expressions are a well-documented source of medication errors — a shorthand that is obvious to the writer is misread by the next person as a different drug, dose, or frequency. The Joint Commission maintains a minimum \"Do Not Use\" list that applies to orders and all medication-related documentation, and ISMP publishes a broader list of error-prone entries. The safe practice is to spell terms out and to clarify anything ambiguous before acting on it.", citationIDs: ["tjc_do_not_use", "ismp_error_prone"])),
            .keyValueTable(title: "The Joint Commission \"Do Not Use\"", [
                KeyValueRow(key: "U, u (unit)", value: "Mistaken for 0, 4, or cc. Write \"unit.\""),
                KeyValueRow(key: "IU (international unit)", value: "Mistaken for IV or 10. Write \"international unit.\""),
                KeyValueRow(key: "Q.D., QD, q.d. (daily)", value: "Confused with QOD. Write \"daily.\""),
                KeyValueRow(key: "Q.O.D., QOD (every other day)", value: "Confused with QD. Write \"every other day.\""),
                KeyValueRow(key: "Trailing zero (1.0 mg)", value: "Decimal missed \u{2192} tenfold overdose. Write \"1 mg.\""),
                KeyValueRow(key: "No leading zero (.5 mg)", value: "Decimal missed \u{2192} tenfold overdose. Write \"0.5 mg.\""),
                KeyValueRow(key: "MS, MSO4, MgSO4", value: "Morphine vs magnesium confusion. Spell out both.")
            ]),
            .keyValueTable(title: "ISMP additional high-risk entries", [
                KeyValueRow(key: "\u{03BC}g (microgram)", value: "Mistaken for mg (1000-fold). Write \"mcg.\""),
                KeyValueRow(key: "cc", value: "Mistaken for U or the number. Write \"mL.\""),
                KeyValueRow(key: "@", value: "Mistaken for 2. Write \"at.\""),
                KeyValueRow(key: "D/C", value: "\"Discharge\" vs \"discontinue.\" Spell out."),
                KeyValueRow(key: "HS / hs", value: "\"Bedtime\" vs \"half-strength.\" Spell out."),
                KeyValueRow(key: "SC, SQ, sub q", value: "Mistaken for SL or other. Write \"subcut\" or \"subcutaneously.\""),
                KeyValueRow(key: "AD / AS / AU, OD / OS / OU", value: "Ear vs eye laterality confusion. Spell out \"right/left/both ear/eye.\""),
                KeyValueRow(key: "Drug name abbreviations", value: "MTX, HCTZ, PCA, ZnSO4, etc. \u{2192} spell out the full name.")
            ]),
            .bullets(title: "Nursing practice", [
                AttributedBullet("Spell terms out in your own documentation; the list is not only for prescribers.", citationIDs: ["tjc_do_not_use", "ismp_error_prone"]),
                AttributedBullet("Clarify any ambiguous order with the prescriber before administering — do not interpret.", citationIDs: ["ismp_error_prone", "openrn_med_safety"]),
                AttributedBullet("Read back verbal and telephone orders and confirm the spelling of ambiguous terms.", citationIDs: ["tjc_do_not_use"]),
                AttributedBullet("Avoid error-prone abbreviations on labels, patient instructions, and handoff notes.", citationIDs: ["ismp_error_prone"])
            ])
        ],
        citations: [tjcDoNotUse, ismpErrorProne, openrnMedSafety],
        lastSourceFidelityReview: "2026-07-03"
    )
}
