import Foundation

/// Infers nursing specialty tags from a library entry's title + category + body
/// keywords. Used until content is explicitly tagged. Conservative by design —
/// when in doubt, return an empty set (entry applies to all settings, no boost).
///
/// Rules are anchored to unambiguous clinical signals:
///   - "Apgar" → OB + Peds
///   - "norepinephrine" / "vasopressor" → ICU + ED
///   - "central line" / "intubation" → ICU
///   - "fetal" / "preeclampsia" → OB
///   - "pediatric" / "neonatal" / "FLACC" → Peds
///
/// Avoids tagging by category alone (e.g., not every drug is ICU). Title and
/// searchText anchor decisions.
enum SpecialtyHeuristic {

    static func infer(title: String, searchText: String, category: EntryCategory) -> [NursingSpecialty] {
        let lower = (title + " " + searchText).lowercased()
        var tags: Set<NursingSpecialty> = []

        for rule in rules {
            if rule.matches(lower) {
                for specialty in rule.specialties { tags.insert(specialty) }
            }
        }

        return Array(tags).sorted { $0.rawValue < $1.rawValue }
    }

    private struct Rule {
        let keywords: [String]
        let specialties: [NursingSpecialty]

        func matches(_ text: String) -> Bool {
            keywords.contains { text.contains($0) }
        }
    }

    private static let rules: [Rule] = [
        // ICU — vasopressors, sedation, ventilator, hemodynamics, advanced lines
        Rule(keywords: ["norepinephrine", "vasopressor", "epinephrine drip", "phenylephrine drip",
                        "vasopressin drip", "dobutamine", "milrinone", "dopamine drip",
                        "propofol", "midazolam drip", "dexmedetomidine", "precedex", "fentanyl drip",
                        "ketamine drip", "rocuronium", "succinylcholine", "vecuronium",
                        "amiodarone drip", "lidocaine drip", "nitroglycerin drip", "nitroprusside",
                        "central line", "art line", "arterial line", "swan-ganz", "cvp",
                        "intubation", "extubation", "ventilator", "vent", "peep", "ards",
                        "septic shock", "cardiogenic shock", "vasopressor titration",
                        "icp", "intracranial pressure", "rsi", "rapid sequence",
                        "abg", "arterial blood gas", "lactate", "lactic acid"],
             specialties: [.icu]),

        // ED — trauma, triage, stroke, STEMI, OD, naloxone
        Rule(keywords: ["nihss", "stroke scale", "tpa", "alteplase", "tnk", "tenecteplase",
                        "stemi", "nstemi", "troponin", "ekg interpretation",
                        "naloxone", "narcan", "flumazenil",
                        "trauma assessment", "primary survey", "secondary survey", "triage",
                        "anaphylaxis", "epinephrine im", "epipen",
                        "ciwa", "alcohol withdrawal", "cows", "opioid withdrawal",
                        "acls", "code blue", "rapid response"],
             specialties: [.ed]),

        // ED + ICU — cross-cutting acute critical
        Rule(keywords: ["lactate", "septic", "sepsis bundle", "fluid resuscitation",
                        "rapid sequence", "amiodarone", "adenosine"],
             specialties: [.ed, .icu]),

        // OB — pregnancy, labor, postpartum
        Rule(keywords: ["fetal", "fetal monitoring", "fhr", "preeclampsia", "eclampsia",
                        "magnesium sulfate", "mag sulfate", "tocolysis", "tocolytic",
                        "oxytocin", "pitocin", "methergine", "hemabate", "carboprost",
                        "postpartum hemorrhage", "pph", "uterine atony",
                        "labor", "delivery", "epidural", "cesarean", "c-section",
                        "lochia", "fundal", "engorgement", "perineal",
                        "rhogam", "rh-negative", "group b strep", "gbs",
                        "gestational"],
             specialties: [.ob]),

        // OB + NICU — peripartum + neonate (delivery-room and immediate-postpartum)
        Rule(keywords: ["apgar", "newborn"],
             specialties: [.ob, .nicu]),

        // NICU — neonatal-specific (≤28 days, premature, gestational-age dosing)
        Rule(keywords: ["nicu", "neonatal resuscitation", "nrp", "surfactant",
                        "premature", "preemie", "preterm",
                        "exchange transfusion", "phototherapy", "kernicterus",
                        "neonatal sepsis", "early-onset sepsis", "late-onset sepsis",
                        "patent ductus", "pda closure", "indomethacin neonate",
                        "respiratory distress syndrome", "rds neonate", "tta",
                        "bilirubin chart", "neonatal jaundice",
                        "gestational age", "post-menstrual age",
                        "kangaroo care", "developmental care",
                        "umbilical line", "umbilical catheter",
                        "neonate", "neonatal"],
             specialties: [.nicu]),

        // Peds — pediatric-specific (older infants, children, adolescents)
        Rule(keywords: ["pediatric", "peds ", "child ", "infant", "toddler", "school-age",
                        "flacc", "wong-baker", "broselow",
                        "croup", "bronchiolitis", "rsv", "kawasaki", "epiglottitis",
                        "weight-based", "mg/kg/dose", "kg/min in peds",
                        "vital signs by age", "pediatric vital", "pediatric airway"],
             specialties: [.peds]),

        // Med-Surg — post-op, wound, drains, transfusion
        Rule(keywords: ["post-op", "postop", "post operative", "post-operative",
                        "wound care", "wound dehiscence", "wound vac", "negative pressure wound",
                        "ostomy", "colostomy", "ileostomy", "j-tube", "peg tube",
                        "ng tube", "nasogastric", "jp drain", "jackson-pratt", "hemovac",
                        "foley", "indwelling catheter", "straight cath",
                        "anticoagulation teaching", "warfarin teaching", "lovenox teaching",
                        "blood transfusion", "transfusion reaction", "prbc", "platelets transfusion",
                        "deep vein thrombosis", "dvt prophylaxis", "scd"],
             specialties: [.medSurg])
    ]
}
