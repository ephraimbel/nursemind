import Foundation

/// One side of a cross-link. Carries enough display info to render a row
/// without re-querying the registry.
public enum CrossLinkDestination: Hashable, Sendable {
    case libraryEntry(id: String, displayCategory: String)
    case calculator(id: String)
}

/// Curated bidirectional clinical map between Library entries and calculators.
/// Every link below has been hand-verified against the actual registries — no
/// dead links.
///
/// Editing rules:
///   1. Both sides of a link must exist in their registry.
///   2. Links must be clinically meaningful — a nurse looking at Sepsis
///      should see qSOFA / MAP / SOFA, not BMI.
///   3. Cap each entry at ~4 outbound links to avoid noise.
public enum CrossReferenceRegistry {

    // MARK: - Library entry → Tools

    /// What calculators should this Library entry link to? Returns [] if the
    /// entry has no curated links (no Related Tools section will render in
    /// that case).
    public static func toolsFor(entryID: String) -> [CrossLinkDestination] {
        switch entryID {

        // ========== Diagnoses ==========
        case "sepsis":
            return [
                .calculator(id: "qsofa"),
                .calculator(id: "sofa"),
                .calculator(id: "sirs"),
                .calculator(id: "apache-2"),
                .calculator(id: "mews"),
                .calculator(id: "map")
            ]
        case "myocardial-infarction":
            return [
                .calculator(id: "heart"),
                .calculator(id: "timi"),
                .calculator(id: "timi-stemi"),
                .calculator(id: "grace"),
                .calculator(id: "sgarbossa"),
                .calculator(id: "killip"),
                .calculator(id: "qtc")
            ]
        case "stroke":
            return [
                .calculator(id: "nihss"),
                .calculator(id: "mrs"),
                .calculator(id: "gcs"),
                .calculator(id: "gcs-pupils"),
                .calculator(id: "qtc")
            ]
        case "heart-failure":
            return [
                .calculator(id: "nyha"),
                .calculator(id: "map")
            ]
        case "atrial-fibrillation":
            return [
                .calculator(id: "cha2ds2-vasc"),
                .calculator(id: "has-bled"),
                .calculator(id: "qtc")
            ]
        case "copd":
            return [
                .calculator(id: "pf-ratio"),
                .calculator(id: "bode"),
                .calculator(id: "mmrc"),
                .calculator(id: "aa-gradient"),
                .calculator(id: "pack-years")
            ]
        case "asthma":
            return [
                .calculator(id: "pf-ratio"),
                .calculator(id: "minute-vent"),
                .calculator(id: "rsbi")
            ]
        case "pneumonia":
            return [
                .calculator(id: "curb-65"),
                .calculator(id: "psi"),
                .calculator(id: "pf-ratio")
            ]
        case "ards":
            return [
                .calculator(id: "pf-ratio"),
                .calculator(id: "oxygenation-index"),
                .calculator(id: "rsbi")
            ]
        case "pulmonary-embolism":
            return [
                .calculator(id: "wells-pe"),
                .calculator(id: "perc"),
                .calculator(id: "geneva-pe"),
                .calculator(id: "pesi"),
                .calculator(id: "spesi"),
                .calculator(id: "pf-ratio")
            ]
        case "dvt":
            return [
                .calculator(id: "wells-dvt"),
                .calculator(id: "caprini"),
                .calculator(id: "padua")
            ]
        case "aki":
            return [
                .calculator(id: "kdigo-aki"),
                .calculator(id: "gfr"),
                .calculator(id: "crcl"),
                .calculator(id: "fena"),
                .calculator(id: "anion-gap")
            ]
        case "ckd":
            return [
                .calculator(id: "gfr"),
                .calculator(id: "crcl"),
                .calculator(id: "anion-gap")
            ]
        case "cirrhosis", "hepatic-encephalopathy":
            return [
                .calculator(id: "child-pugh"),
                .calculator(id: "meld-3"),
                .calculator(id: "meld-na"),
                .calculator(id: "fib4"),
                .calculator(id: "apri")
            ]
        case "upper-gi-bleed":
            return [
                .calculator(id: "blatchford"),
                .calculator(id: "rockall"),
                .calculator(id: "aims-65")
            ]
        case "anaphylaxis":
            return [
                .calculator(id: "map"),
                .calculator(id: "shock-index")
            ]
        case "hyponatremia":
            return [
                .calculator(id: "osmolality"),
                .calculator(id: "na-correction-rate"),
                .calculator(id: "corrected-na")
            ]
        case "hypernatremia":
            return [
                .calculator(id: "fwd"),
                .calculator(id: "osmolality"),
                .calculator(id: "na-correction-rate")
            ]
        case "hypertensive-emergency":
            return [
                .calculator(id: "map"),
                .calculator(id: "pulse-pressure")
            ]
        case "dka", "hhs":
            return [
                .calculator(id: "anion-gap"),
                .calculator(id: "winters"),
                .calculator(id: "corrected-na"),
                .calculator(id: "osmolality")
            ]
        case "pressure-injury":
            return [
                .calculator(id: "braden"),
                .calculator(id: "push")
            ]
        case "alcohol-withdrawal":
            return [
                .calculator(id: "ciwa-ar"),
                .calculator(id: "audit-c"),
                .calculator(id: "audit-full")
            ]
        case "delirium":
            return [
                .calculator(id: "cam"),
                .calculator(id: "cam-icu"),
                .calculator(id: "rass"),
                .calculator(id: "mini-cog")
            ]
        case "burns":
            return [
                .calculator(id: "rule-of-nines"),
                .calculator(id: "lund-browder")
            ]
        case "status-epilepticus":
            return [
                .calculator(id: "gcs")
            ]
        case "increased-icp":
            return [
                .calculator(id: "gcs"),
                .calculator(id: "map")
            ]

        // ========== Drugs (most-trafficked) ==========
        case "norepinephrine", "norepinephrine-drip":
            return [
                .calculator(id: "map"),
                .calculator(id: "mews"),
                .calculator(id: "shock-index")
            ]
        case "heparin", "heparin-drip", "enoxaparin":
            return [
                .calculator(id: "hit-4ts"),
                .calculator(id: "caprini"),
                .calculator(id: "padua"),
                .calculator(id: "wells-dvt")
            ]
        case "warfarin":
            return [
                .calculator(id: "has-bled"),
                .calculator(id: "cha2ds2-vasc")
            ]
        case "apixaban", "rivaroxaban":
            return [
                .calculator(id: "cha2ds2-vasc"),
                .calculator(id: "has-bled"),
                .calculator(id: "crcl")
            ]
        case "aspirin", "clopidogrel":
            return [
                .calculator(id: "heart"),
                .calculator(id: "timi"),
                .calculator(id: "has-bled")
            ]
        case "vancomycin", "vancomycin-trough":
            return [
                .calculator(id: "crcl"),
                .calculator(id: "gfr")
            ]
        case "metformin", "lisinopril", "ketorolac", "gabapentin",
             "piperacillin-tazobactam", "ciprofloxacin", "phenytoin":
            return [
                .calculator(id: "crcl"),
                .calculator(id: "gfr")
            ]
        case "furosemide":
            return [
                .calculator(id: "gfr"),
                .calculator(id: "crcl"),
                .calculator(id: "fena")
            ]
        case "amiodarone", "amiodarone-drip", "metoprolol",
             "ondansetron", "magnesium-sulfate", "adenosine":
            return [
                .calculator(id: "qtc")
            ]
        case "nitroglycerin", "nitroglycerin-drip":
            return [
                .calculator(id: "heart"),
                .calculator(id: "pulse-pressure"),
                .calculator(id: "qtc")
            ]
        case "morphine", "fentanyl", "fentanyl-drip", "hydromorphone",
             "tramadol", "oxycodone":
            return [
                .calculator(id: "poss"),
                .calculator(id: "cows"),
                .calculator(id: "rass")
            ]
        case "midazolam", "lorazepam":
            return [
                .calculator(id: "rass"),
                .calculator(id: "ciwa-ar")
            ]
        case "dexmedetomidine", "propofol-drip", "ketamine-drip":
            return [
                .calculator(id: "rass"),
                .calculator(id: "rsbi")
            ]
        case "rocuronium", "succinylcholine", "cisatracurium-drip":
            return [
                .calculator(id: "rass"),
                .calculator(id: "rsbi")
            ]
        case "atropine":
            return [
                .calculator(id: "mews"),
                .calculator(id: "map")
            ]
        case "calcium-gluconate":
            return [
                .calculator(id: "qtc"),
                .libraryEntry(id: "hyperkalemia", displayCategory: "Diagnosis")
            ]
        case "albuterol", "ipratropium":
            return [
                .calculator(id: "pf-ratio"),
                .calculator(id: "minute-vent")
            ]
        case "naloxone":
            return [
                .calculator(id: "cows"),
                .calculator(id: "rass")
            ]
        case "insulin-regular", "insulin-glargine", "insulin-lispro",
             "insulin-drip":
            return [
                .libraryEntry(id: "dka", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hypoglycemia", displayCategory: "Diagnosis")
            ]
        case "dextrose-50", "glucagon":
            return [
                .libraryEntry(id: "hypoglycemia", displayCategory: "Diagnosis")
            ]
        case "vitamin-k", "protamine-sulfate":
            return [
                .libraryEntry(id: "warfarin", displayCategory: "Drug"),
                .calculator(id: "has-bled")
            ]
        case "n-acetylcysteine":
            return [
                .libraryEntry(id: "acetaminophen", displayCategory: "Drug"),
                .calculator(id: "maddrey")
            ]
        case "alteplase":
            return [
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "myocardial-infarction", displayCategory: "Diagnosis")
            ]
        case "mannitol":
            return [
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .calculator(id: "gcs"),
                .calculator(id: "osmolality")
            ]
        case "lactulose":
            return [
                .libraryEntry(id: "hepatic-encephalopathy", displayCategory: "Diagnosis"),
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis"),
                .calculator(id: "meld-na")
            ]
        case "haloperidol", "quetiapine":
            return [
                .calculator(id: "cam"),
                .calculator(id: "rass"),
                .libraryEntry(id: "delirium", displayCategory: "Diagnosis")
            ]

        // ========== Procedures ==========
        case "neuro-check":
            return [
                .calculator(id: "gcs")
            ]
        case "twelve-lead-ecg":
            return [
                .calculator(id: "qtc"),
                .calculator(id: "heart")
            ]
        case "tracheal-suctioning", "oral-suctioning":
            return [
                .calculator(id: "pf-ratio"),
                .calculator(id: "rsbi")
            ]
        case "scd-application":
            return [
                .calculator(id: "caprini"),
                .calculator(id: "padua"),
                .calculator(id: "wells-dvt")
            ]
        case "chest-tube-care":
            return [
                .calculator(id: "pf-ratio"),
                .libraryEntry(id: "pneumothorax", displayCategory: "Diagnosis")
            ]
        case "capillary-blood-glucose":
            return [
                .libraryEntry(id: "hypoglycemia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "dka", displayCategory: "Diagnosis")
            ]
        case "blood-transfusion":
            return [
                .libraryEntry(id: "transfusion-reaction", displayCategory: "Diagnosis")
            ]

        // ========== Reference / Communication ==========
        case "vital-signs-age":
            return [
                .calculator(id: "mews"),
                .calculator(id: "news2")
            ]
        case "code-blue-roles":
            return [
                .calculator(id: "gcs"),
                .calculator(id: "mews")
            ]
        case "pain-scales":
            return [
                .calculator(id: "flacc")
            ]
        case "sbar", "sbarq":
            return [
                .calculator(id: "mews"),
                .calculator(id: "news2")
            ]
        case "cus-assertive":
            return [
                .calculator(id: "mews"),
                .calculator(id: "news2")
            ]

        // ========== Scenarios ==========
        case "sepsis-recognition-scenario":
            return [
                .calculator(id: "qsofa"),
                .calculator(id: "sofa"),
                .calculator(id: "map")
            ]
        case "failure-to-rescue-scenario", "rapid-response-scenario":
            return [
                .calculator(id: "mews"),
                .calculator(id: "news2"),
                .calculator(id: "gcs")
            ]
        case "ciwa-monitoring-scenario":
            return [
                .calculator(id: "ciwa-ar")
            ]
        case "pressure-injury-prevention-scenario":
            return [
                .calculator(id: "braden")
            ]
        case "recognizing-delirium-scenario":
            return [
                .calculator(id: "cam"),
                .calculator(id: "rass")
            ]

        // ========== Maternity diagnoses ==========
        case "preeclampsia", "eclampsia":
            return [
                .libraryEntry(id: "magnesium-sulfate", displayCategory: "Drug"),
                .libraryEntry(id: "hellp-syndrome", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hydralazine", displayCategory: "Drug"),
                .calculator(id: "map")
            ]
        case "hellp-syndrome":
            return [
                .libraryEntry(id: "preeclampsia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "magnesium-sulfate", displayCategory: "Drug"),
                .libraryEntry(id: "platelets", displayCategory: "Lab")
            ]
        case "postpartum-hemorrhage":
            return [
                .libraryEntry(id: "hellp-syndrome", displayCategory: "Diagnosis"),
                .libraryEntry(id: "magnesium-sulfate", displayCategory: "Drug"),
                .calculator(id: "shock-index")
            ]
        case "placenta-previa", "placental-abruption":
            return [
                .libraryEntry(id: "postpartum-hemorrhage", displayCategory: "Diagnosis"),
                .libraryEntry(id: "blood-transfusion", displayCategory: "Procedure"),
                .calculator(id: "shock-index")
            ]
        case "gestational-diabetes":
            return [
                .libraryEntry(id: "insulin-glargine", displayCategory: "Drug"),
                .libraryEntry(id: "insulin-lispro", displayCategory: "Drug"),
                .libraryEntry(id: "hba1c", displayCategory: "Lab"),
                .libraryEntry(id: "glucose", displayCategory: "Lab")
            ]
        case "preterm-labor":
            return [
                .libraryEntry(id: "magnesium-sulfate", displayCategory: "Drug"),
                .libraryEntry(id: "methylprednisolone", displayCategory: "Drug"),
                .libraryEntry(id: "prom-pprom", displayCategory: "Diagnosis")
            ]
        case "hyperemesis-gravidarum":
            return [
                .libraryEntry(id: "ondansetron", displayCategory: "Drug"),
                .libraryEntry(id: "promethazine", displayCategory: "Drug")
            ]
        case "prom-pprom":
            return [
                .libraryEntry(id: "chorioamnionitis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "preterm-labor", displayCategory: "Diagnosis"),
                .libraryEntry(id: "azithromycin", displayCategory: "Drug")
            ]
        case "chorioamnionitis":
            return [
                .libraryEntry(id: "ceftriaxone", displayCategory: "Drug"),
                .libraryEntry(id: "metronidazole", displayCategory: "Drug"),
                .calculator(id: "qsofa")
            ]
        case "postpartum-depression":
            return [
                .libraryEntry(id: "sertraline", displayCategory: "Drug"),
                .libraryEntry(id: "escitalopram", displayCategory: "Drug"),
                .libraryEntry(id: "suicide-risk", displayCategory: "Diagnosis"),
                .calculator(id: "phq9")
            ]
        case "ectopic-pregnancy", "spontaneous-abortion":
            return [
                .libraryEntry(id: "methotrexate", displayCategory: "Drug"),
                .libraryEntry(id: "beta-hcg", displayCategory: "Lab")
            ]
        case "group-b-strep":
            return [
                .libraryEntry(id: "ceftriaxone", displayCategory: "Drug"),
                .libraryEntry(id: "preterm-labor", displayCategory: "Diagnosis"),
                .libraryEntry(id: "prom-pprom", displayCategory: "Diagnosis")
            ]

        // ========== Mental health diagnoses ==========
        case "major-depression":
            return [
                .libraryEntry(id: "sertraline", displayCategory: "Drug"),
                .libraryEntry(id: "escitalopram", displayCategory: "Drug"),
                .libraryEntry(id: "venlafaxine", displayCategory: "Drug"),
                .calculator(id: "phq9")
            ]
        case "bipolar-disorder":
            return [
                .calculator(id: "mdq"),
                .libraryEntry(id: "lithium", displayCategory: "Drug"),
                .libraryEntry(id: "quetiapine", displayCategory: "Drug"),
                .libraryEntry(id: "suicide-risk", displayCategory: "Diagnosis")
            ]
        case "schizophrenia":
            return [
                .libraryEntry(id: "haloperidol", displayCategory: "Drug"),
                .libraryEntry(id: "quetiapine", displayCategory: "Drug")
            ]
        case "generalized-anxiety-disorder", "panic-disorder":
            return [
                .libraryEntry(id: "escitalopram", displayCategory: "Drug"),
                .libraryEntry(id: "sertraline", displayCategory: "Drug"),
                .libraryEntry(id: "venlafaxine", displayCategory: "Drug"),
                .calculator(id: "gad7")
            ]
        case "ptsd":
            return [
                .libraryEntry(id: "sertraline", displayCategory: "Drug"),
                .libraryEntry(id: "venlafaxine", displayCategory: "Drug")
            ]
        case "ocd":
            return [
                .libraryEntry(id: "escitalopram", displayCategory: "Drug"),
                .libraryEntry(id: "sertraline", displayCategory: "Drug")
            ]
        case "anorexia-nervosa", "bulimia-nervosa":
            return [
                .libraryEntry(id: "phosphorus", displayCategory: "Lab"),
                .libraryEntry(id: "potassium", displayCategory: "Lab")
            ]
        case "substance-use-disorder", "opioid-use-disorder":
            return [
                .libraryEntry(id: "naloxone", displayCategory: "Drug"),
                .libraryEntry(id: "alcohol-withdrawal", displayCategory: "Diagnosis"),
                .calculator(id: "cows"),
                .calculator(id: "ciwa-ar")
            ]
        case "suicide-risk":
            return [
                .libraryEntry(id: "major-depression", displayCategory: "Diagnosis"),
                .libraryEntry(id: "bipolar-disorder", displayCategory: "Diagnosis"),
                .libraryEntry(id: "lithium", displayCategory: "Drug"),
                .calculator(id: "cssrs"),
                .calculator(id: "phq9")
            ]

        // ========== Pediatric diagnoses ==========
        case "bronchiolitis", "croup", "epiglottitis":
            return [
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference"),
                .calculator(id: "pf-ratio")
            ]
        case "kawasaki-disease":
            return [
                .libraryEntry(id: "aspirin", displayCategory: "Drug"),
                .libraryEntry(id: "pediatric-fever-workup", displayCategory: "Diagnosis")
            ]
        case "reye-syndrome":
            return [
                .libraryEntry(id: "acetaminophen", displayCategory: "Drug"),
                .libraryEntry(id: "ammonia", displayCategory: "Lab")
            ]
        case "pediatric-dehydration":
            return [
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference"),
                .calculator(id: "shock-index")
            ]
        case "cystic-fibrosis":
            return [
                .libraryEntry(id: "albuterol", displayCategory: "Drug"),
                .libraryEntry(id: "ipratropium", displayCategory: "Drug"),
                .libraryEntry(id: "piperacillin-tazobactam", displayCategory: "Drug")
            ]
        case "pediatric-fever-workup":
            return [
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference"),
                .libraryEntry(id: "blood-culture", displayCategory: "Lab"),
                .libraryEntry(id: "ceftriaxone", displayCategory: "Drug"),
                .calculator(id: "qsofa")
            ]
        case "failure-to-thrive":
            return [
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference")
            ]

        // ========== Cardiac diagnoses (Option A) ==========
        case "cardiac-tamponade":
            return [
                .libraryEntry(id: "pericarditis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "cardiogenic-shock", displayCategory: "Diagnosis"),
                .calculator(id: "shock-index")
            ]
        case "pericarditis":
            return [
                .libraryEntry(id: "cardiac-tamponade", displayCategory: "Diagnosis"),
                .libraryEntry(id: "aspirin", displayCategory: "Drug"),
                .libraryEntry(id: "ketorolac", displayCategory: "Drug")
            ]
        case "endocarditis":
            return [
                .libraryEntry(id: "vancomycin", displayCategory: "Drug"),
                .libraryEntry(id: "ceftriaxone", displayCategory: "Drug"),
                .libraryEntry(id: "blood-culture", displayCategory: "Lab"),
                .libraryEntry(id: "opioid-use-disorder", displayCategory: "Diagnosis")
            ]
        case "aortic-dissection":
            return [
                .libraryEntry(id: "esmolol-drip", displayCategory: "Drip"),
                .libraryEntry(id: "labetalol-drip", displayCategory: "Drip"),
                .libraryEntry(id: "nicardipine-drip", displayCategory: "Drip"),
                .calculator(id: "map")
            ]
        case "cardiogenic-shock":
            return [
                .libraryEntry(id: "norepinephrine-drip", displayCategory: "Drip"),
                .libraryEntry(id: "dobutamine-drip", displayCategory: "Drip"),
                .libraryEntry(id: "myocardial-infarction", displayCategory: "Diagnosis"),
                .calculator(id: "shock-index"),
                .calculator(id: "fick-co")
            ]
        case "aortic-stenosis", "mitral-regurgitation":
            return [
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis"),
                .calculator(id: "nyha"),
                .calculator(id: "map")
            ]

        // ========== Neuro diagnoses (Option A) ==========
        case "tia":
            return [
                .calculator(id: "abcd2"),
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "aspirin", displayCategory: "Drug"),
                .libraryEntry(id: "clopidogrel", displayCategory: "Drug"),
                .libraryEntry(id: "atrial-fibrillation", displayCategory: "Diagnosis")
            ]
        case "subarachnoid-hemorrhage":
            return [
                .calculator(id: "hunt-hess"),
                .calculator(id: "wfns"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .libraryEntry(id: "nicardipine-drip", displayCategory: "Drip"),
                .calculator(id: "gcs")
            ]
        case "subdural-hematoma":
            return [
                .calculator(id: "ich"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .libraryEntry(id: "vitamin-k", displayCategory: "Drug"),
                .libraryEntry(id: "protamine-sulfate", displayCategory: "Drug"),
                .calculator(id: "gcs")
            ]
        case "guillain-barre", "myasthenia-gravis":
            return [
                .calculator(id: "rsbi"),
                .calculator(id: "minute-vent")
            ]
        case "multiple-sclerosis":
            return [
                .libraryEntry(id: "methylprednisolone", displayCategory: "Drug")
            ]
        case "parkinson-disease":
            return [
                .calculator(id: "morse")
            ]
        case "alzheimer-dementia":
            return [
                .libraryEntry(id: "delirium", displayCategory: "Diagnosis"),
                .calculator(id: "cam"),
                .calculator(id: "mini-cog"),
                .calculator(id: "morse")
            ]

        // ========== High-volume drugs (Option A) ==========
        case "semaglutide":
            return [
                .libraryEntry(id: "metformin", displayCategory: "Drug"),
                .libraryEntry(id: "empagliflozin", displayCategory: "Drug"),
                .libraryEntry(id: "hba1c", displayCategory: "Lab")
            ]
        case "empagliflozin":
            return [
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis"),
                .libraryEntry(id: "ckd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hba1c", displayCategory: "Lab"),
                .libraryEntry(id: "dka", displayCategory: "Diagnosis")
            ]
        case "sacubitril-valsartan":
            return [
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis"),
                .libraryEntry(id: "spironolactone", displayCategory: "Drug"),
                .libraryEntry(id: "carvedilol", displayCategory: "Drug"),
                .calculator(id: "nyha")
            ]
        case "escitalopram", "venlafaxine", "mirtazapine":
            return [
                .libraryEntry(id: "major-depression", displayCategory: "Diagnosis"),
                .libraryEntry(id: "generalized-anxiety-disorder", displayCategory: "Diagnosis"),
                .libraryEntry(id: "suicide-risk", displayCategory: "Diagnosis"),
                .calculator(id: "phq9")
            ]
        case "hydroxychloroquine":
            return [
                .libraryEntry(id: "methotrexate", displayCategory: "Drug")
            ]
        case "methotrexate":
            return [
                .libraryEntry(id: "ectopic-pregnancy", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hydroxychloroquine", displayCategory: "Drug")
            ]
        case "prednisone":
            return [
                .libraryEntry(id: "asthma", displayCategory: "Diagnosis"),
                .libraryEntry(id: "copd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "adrenal-crisis", displayCategory: "Diagnosis")
            ]
        case "oseltamivir":
            return [
                .libraryEntry(id: "pneumonia", displayCategory: "Diagnosis")
            ]

        // ========== ECG references ==========
        case "afib-reference":
            return [
                .libraryEntry(id: "atrial-fibrillation", displayCategory: "Diagnosis"),
                .libraryEntry(id: "diltiazem-drip", displayCategory: "Drip"),
                .libraryEntry(id: "metoprolol", displayCategory: "Drug"),
                .calculator(id: "cha2ds2-vasc")
            ]
        case "aflutter-reference":
            return [
                .libraryEntry(id: "atrial-fibrillation", displayCategory: "Diagnosis"),
                .libraryEntry(id: "diltiazem-drip", displayCategory: "Drip")
            ]
        case "svt-reference":
            return [
                .libraryEntry(id: "adenosine", displayCategory: "Drug"),
                .libraryEntry(id: "diltiazem-drip", displayCategory: "Drip")
            ]
        case "vt-reference", "vf-reference":
            return [
                .libraryEntry(id: "amiodarone", displayCategory: "Drug"),
                .libraryEntry(id: "magnesium-sulfate", displayCategory: "Drug"),
                .libraryEntry(id: "code-blue-roles", displayCategory: "Reference")
            ]
        case "av-blocks-reference":
            return [
                .libraryEntry(id: "atropine", displayCategory: "Drug")
            ]
        case "ecg-12-lead-basics", "sinus-rhythm-reference":
            return [
                .libraryEntry(id: "twelve-lead-ecg", displayCategory: "Procedure")
            ]

        // ========== Scales references ==========
        case "gcs-detail":
            return [
                .libraryEntry(id: "neuro-check", displayCategory: "Procedure"),
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .calculator(id: "gcs")
            ]
        case "nihss-reference":
            return [
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "tia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "alteplase", displayCategory: "Drug")
            ]
        case "pain-scales-detail":
            return [
                .libraryEntry(id: "pain-scales", displayCategory: "Reference"),
                .libraryEntry(id: "morphine", displayCategory: "Drug"),
                .calculator(id: "flacc")
            ]
        case "braden-scale":
            return [
                .libraryEntry(id: "pressure-injury", displayCategory: "Diagnosis"),
                .calculator(id: "braden")
            ]
        case "ciwa-ar-reference":
            return [
                .libraryEntry(id: "alcohol-withdrawal", displayCategory: "Diagnosis"),
                .libraryEntry(id: "lorazepam", displayCategory: "Drug"),
                .calculator(id: "ciwa-ar")
            ]
        case "cows-reference":
            return [
                .libraryEntry(id: "opioid-use-disorder", displayCategory: "Diagnosis"),
                .libraryEntry(id: "naloxone", displayCategory: "Drug"),
                .calculator(id: "cows")
            ]
        case "morse-falls":
            return [
                .libraryEntry(id: "alzheimer-dementia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "delirium", displayCategory: "Diagnosis"),
                .calculator(id: "morse")
            ]
        case "nyha-classification":
            return [
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis"),
                .libraryEntry(id: "sacubitril-valsartan", displayCategory: "Drug"),
                .libraryEntry(id: "carvedilol", displayCategory: "Drug"),
                .calculator(id: "nyha")
            ]
        case "ckd-staging":
            return [
                .libraryEntry(id: "ckd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "empagliflozin", displayCategory: "Drug"),
                .calculator(id: "gfr"),
                .calculator(id: "crcl")
            ]
        case "dka-vs-hhs":
            return [
                .libraryEntry(id: "dka", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hhs", displayCategory: "Diagnosis"),
                .libraryEntry(id: "insulin-regular", displayCategory: "Drug")
            ]

        // ========== Library-to-library bridges (existing entries; previously had only tools) ==========
        case "hyperkalemia":
            return [
                .libraryEntry(id: "calcium-gluconate", displayCategory: "Drug"),
                .libraryEntry(id: "insulin-regular", displayCategory: "Drug"),
                .libraryEntry(id: "potassium", displayCategory: "Lab"),
                .calculator(id: "qtc")
            ]
        case "hypoglycemia":
            return [
                .libraryEntry(id: "dextrose-50", displayCategory: "Drug"),
                .libraryEntry(id: "glucagon", displayCategory: "Drug"),
                .libraryEntry(id: "insulin-regular", displayCategory: "Drug"),
                .libraryEntry(id: "glucose", displayCategory: "Lab")
            ]
        case "hypothyroidism":
            return [
                .libraryEntry(id: "levothyroxine", displayCategory: "Drug"),
                .libraryEntry(id: "tsh", displayCategory: "Lab"),
                .libraryEntry(id: "free-t4", displayCategory: "Lab")
            ]
        case "hyperthyroidism":
            return [
                .libraryEntry(id: "tsh", displayCategory: "Lab"),
                .libraryEntry(id: "free-t4", displayCategory: "Lab"),
                .libraryEntry(id: "metoprolol", displayCategory: "Drug")
            ]
        case "transfusion-reaction":
            return [
                .libraryEntry(id: "blood-transfusion", displayCategory: "Procedure"),
                .libraryEntry(id: "diphenhydramine", displayCategory: "Drug")
            ]
        case "siadh":
            return [
                .libraryEntry(id: "hyponatremia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "sodium", displayCategory: "Lab"),
                .calculator(id: "osmolality")
            ]
        case "diabetes-insipidus":
            return [
                .libraryEntry(id: "hypernatremia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "sodium", displayCategory: "Lab")
            ]
        case "adrenal-crisis":
            return [
                .libraryEntry(id: "hydrocortisone", displayCategory: "Drug"),
                .libraryEntry(id: "prednisone", displayCategory: "Drug")
            ]

        default:
            return []
        }
    }

    // MARK: - Tools → Library entries

    /// What Library entries should this calculator link to?
    public static func libraryEntriesFor(calculatorID: String) -> [CrossLinkDestination] {
        switch calculatorID {
        case "qsofa", "sofa", "mews":
            return [
                .libraryEntry(id: "sepsis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "norepinephrine", displayCategory: "Drug")
            ]
        case "map":
            return [
                .libraryEntry(id: "sepsis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hypertensive-emergency", displayCategory: "Diagnosis"),
                .libraryEntry(id: "norepinephrine", displayCategory: "Drug")
            ]
        case "heart", "timi":
            return [
                .libraryEntry(id: "myocardial-infarction", displayCategory: "Diagnosis"),
                .libraryEntry(id: "nitroglycerin", displayCategory: "Drug"),
                .libraryEntry(id: "aspirin", displayCategory: "Drug")
            ]
        case "killip":
            return [
                .libraryEntry(id: "myocardial-infarction", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis")
            ]
        case "cha2ds2-vasc", "has-bled":
            return [
                .libraryEntry(id: "atrial-fibrillation", displayCategory: "Diagnosis"),
                .libraryEntry(id: "warfarin", displayCategory: "Drug"),
                .libraryEntry(id: "apixaban", displayCategory: "Drug")
            ]
        case "qtc":
            return [
                .libraryEntry(id: "amiodarone", displayCategory: "Drug"),
                .libraryEntry(id: "ondansetron", displayCategory: "Drug"),
                .libraryEntry(id: "magnesium-sulfate", displayCategory: "Drug")
            ]
        case "nyha":
            return [
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis"),
                .libraryEntry(id: "furosemide", displayCategory: "Drug")
            ]
        case "wells-pe", "perc":
            return [
                .libraryEntry(id: "pulmonary-embolism", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heparin", displayCategory: "Drug")
            ]
        case "wells-dvt":
            return [
                .libraryEntry(id: "dvt", displayCategory: "Diagnosis"),
                .libraryEntry(id: "enoxaparin", displayCategory: "Drug")
            ]
        case "caprini", "padua":
            return [
                .libraryEntry(id: "dvt", displayCategory: "Diagnosis"),
                .libraryEntry(id: "enoxaparin", displayCategory: "Drug")
            ]
        case "curb-65", "psi":
            return [
                .libraryEntry(id: "pneumonia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "ceftriaxone", displayCategory: "Drug"),
                .libraryEntry(id: "azithromycin", displayCategory: "Drug")
            ]
        case "bode":
            return [
                .libraryEntry(id: "copd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "albuterol", displayCategory: "Drug")
            ]
        case "pf-ratio", "oxygenation-index":
            return [
                .libraryEntry(id: "ards", displayCategory: "Diagnosis"),
                .libraryEntry(id: "pneumonia", displayCategory: "Diagnosis")
            ]
        case "rsbi", "minute-vent":
            return [
                .libraryEntry(id: "tracheal-suctioning", displayCategory: "Procedure"),
                .libraryEntry(id: "ards", displayCategory: "Diagnosis")
            ]
        case "gfr", "crcl":
            return [
                .libraryEntry(id: "ckd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "aki", displayCategory: "Diagnosis"),
                .libraryEntry(id: "vancomycin", displayCategory: "Drug")
            ]
        case "fena":
            return [
                .libraryEntry(id: "aki", displayCategory: "Diagnosis"),
                .libraryEntry(id: "ckd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "furosemide", displayCategory: "Drug")
            ]
        case "anion-gap", "delta-gap":
            return [
                .libraryEntry(id: "dka", displayCategory: "Diagnosis"),
                .libraryEntry(id: "aki", displayCategory: "Diagnosis")
            ]
        case "corrected-na", "osmolality", "na-correction-rate", "fwd":
            return [
                .libraryEntry(id: "hyponatremia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hypernatremia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "siadh", displayCategory: "Diagnosis")
            ]
        case "meld", "meld-na", "maddrey", "lille":
            return [
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hepatic-encephalopathy", displayCategory: "Diagnosis"),
                .libraryEntry(id: "lactulose", displayCategory: "Drug")
            ]
        case "child-pugh":
            return [
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hepatic-encephalopathy", displayCategory: "Diagnosis")
            ]
        case "fib4", "apri":
            return [
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis")
            ]
        case "hit-4ts":
            return [
                .libraryEntry(id: "heparin", displayCategory: "Drug"),
                .libraryEntry(id: "heparin-drip", displayCategory: "Drip"),
                .libraryEntry(id: "enoxaparin", displayCategory: "Drug")
            ]
        case "mascc":
            return [
                .libraryEntry(id: "vancomycin", displayCategory: "Drug"),
                .libraryEntry(id: "ceftriaxone", displayCategory: "Drug"),
                .libraryEntry(id: "piperacillin-tazobactam", displayCategory: "Drug")
            ]
        case "cam-icu":
            return [
                .libraryEntry(id: "delirium", displayCategory: "Diagnosis"),
                .libraryEntry(id: "dexmedetomidine", displayCategory: "Drug"),
                .libraryEntry(id: "haloperidol", displayCategory: "Drug")
            ]
        case "winters":
            return [
                .libraryEntry(id: "dka", displayCategory: "Diagnosis"),
                .libraryEntry(id: "aki", displayCategory: "Diagnosis")
            ]
        case "rcri":
            return []
        case "stop-bang", "cfs", "corrected-retic", "a1c-eag":
            return []
        case "abcd2":
            return [
                .libraryEntry(id: "tia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "aspirin", displayCategory: "Drug"),
                .libraryEntry(id: "clopidogrel", displayCategory: "Drug")
            ]
        case "audit-c":
            return [
                .libraryEntry(id: "alcohol-withdrawal", displayCategory: "Diagnosis"),
                .libraryEntry(id: "substance-use-disorder", displayCategory: "Diagnosis")
            ]
        case "aims-65":
            return [
                .libraryEntry(id: "upper-gi-bleed", displayCategory: "Diagnosis"),
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "pantoprazole", displayCategory: "Drug")
            ]
        case "gcs-pupils":
            return [
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .libraryEntry(id: "subarachnoid-hemorrhage", displayCategory: "Diagnosis"),
                .libraryEntry(id: "subdural-hematoma", displayCategory: "Diagnosis")
            ]
        case "lund-browder":
            return [
                .libraryEntry(id: "burns", displayCategory: "Diagnosis"),
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference")
            ]
        case "borg":
            return [
                .libraryEntry(id: "copd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "asthma", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis")
            ]
        case "aldrete", "karnofsky", "ecog", "conv-glucose", "conv-creatinine":
            return []
        case "fick-co":
            return [
                .libraryEntry(id: "cardiogenic-shock", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis"),
                .libraryEntry(id: "norepinephrine-drip", displayCategory: "Drip"),
                .libraryEntry(id: "dobutamine-drip", displayCategory: "Drip")
            ]
        case "nihss":
            return [
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "tia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "alteplase", displayCategory: "Drug")
            ]
        case "kdigo-aki":
            return [
                .libraryEntry(id: "aki", displayCategory: "Diagnosis"),
                .libraryEntry(id: "ckd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "furosemide", displayCategory: "Drug")
            ]
        case "peds-gcs":
            return [
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis")
            ]
        case "charlson", "whr", "whtr", "pct-wt", "conv-bilirubin", "conv-bun-urea":
            return []
        case "pesi", "spesi":
            return [
                .libraryEntry(id: "pulmonary-embolism", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heparin", displayCategory: "Drug"),
                .libraryEntry(id: "enoxaparin", displayCategory: "Drug"),
                .libraryEntry(id: "alteplase", displayCategory: "Drug")
            ]
        case "mmrc":
            return [
                .libraryEntry(id: "copd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "asthma", displayCategory: "Diagnosis"),
                .libraryEntry(id: "albuterol", displayCategory: "Drug")
            ]
        case "bisap":
            return [
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis")
            ]
        case "meld-3":
            return [
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "hepatic-encephalopathy", displayCategory: "Diagnosis"),
                .libraryEntry(id: "lactulose", displayCategory: "Drug")
            ]
        case "dic-isth":
            return [
                .libraryEntry(id: "sepsis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "postpartum-hemorrhage", displayCategory: "Diagnosis"),
                .libraryEntry(id: "platelets", displayCategory: "Lab")
            ]
        case "plasmic":
            return [
                .libraryEntry(id: "platelets", displayCategory: "Lab")
            ]
        case "lace", "pps":
            return []
        case "grace":
            return [
                .libraryEntry(id: "myocardial-infarction", displayCategory: "Diagnosis"),
                .libraryEntry(id: "nitroglycerin", displayCategory: "Drug"),
                .libraryEntry(id: "aspirin", displayCategory: "Drug")
            ]
        case "geneva-pe":
            return [
                .libraryEntry(id: "pulmonary-embolism", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heparin", displayCategory: "Drug"),
                .libraryEntry(id: "enoxaparin", displayCategory: "Drug")
            ]
        case "ranson":
            return [
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis")
            ]
        case "apache-2":
            return [
                .libraryEntry(id: "sepsis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "ards", displayCategory: "Diagnosis")
            ]
        case "cssrs":
            return [
                .libraryEntry(id: "major-depression", displayCategory: "Diagnosis"),
                .libraryEntry(id: "suicide-risk", displayCategory: "Diagnosis"),
                .libraryEntry(id: "bipolar-disorder", displayCategory: "Diagnosis")
            ]
        case "mrs":
            return [
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "tia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "alteplase", displayCategory: "Drug")
            ]
        case "hunt-hess":
            return [
                .libraryEntry(id: "subarachnoid-hemorrhage", displayCategory: "Diagnosis"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .libraryEntry(id: "nicardipine-drip", displayCategory: "Drip")
            ]
        case "ich":
            return [
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "subdural-hematoma", displayCategory: "Diagnosis"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .libraryEntry(id: "vitamin-k", displayCategory: "Drug")
            ]
        case "light":
            return [
                .libraryEntry(id: "pneumonia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis"),
                .libraryEntry(id: "chest-tube-care", displayCategory: "Procedure")
            ]
        case "khorana":
            return [
                .libraryEntry(id: "enoxaparin", displayCategory: "Drug"),
                .libraryEntry(id: "apixaban", displayCategory: "Drug"),
                .libraryEntry(id: "rivaroxaban", displayCategory: "Drug")
            ]
        case "kings":
            return [
                .libraryEntry(id: "acetaminophen", displayCategory: "Drug"),
                .libraryEntry(id: "n-acetylcysteine", displayCategory: "Drug"),
                .libraryEntry(id: "cirrhosis", displayCategory: "Diagnosis")
            ]
        case "sirs":
            return [
                .libraryEntry(id: "sepsis", displayCategory: "Diagnosis")
            ]
        case "asa-ps", "mallampati":
            return []
        case "westley":
            return [
                .libraryEntry(id: "croup", displayCategory: "Diagnosis"),
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference")
            ]
        case "barthel":
            return []
        case "bishop":
            return [
                .libraryEntry(id: "preterm-labor", displayCategory: "Diagnosis"),
                .libraryEntry(id: "magnesium-sulfate", displayCategory: "Drug")
            ]
        case "epworth":
            return [
                .libraryEntry(id: "copd", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis")
            ]
        case "audit-full":
            return [
                .libraryEntry(id: "alcohol-withdrawal", displayCategory: "Diagnosis"),
                .libraryEntry(id: "substance-use-disorder", displayCategory: "Diagnosis")
            ]
        case "apfel", "lawton", "tug", "dn4":
            return []
        case "pews":
            return [
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference")
            ]
        case "wfns":
            return [
                .libraryEntry(id: "subarachnoid-hemorrhage", displayCategory: "Diagnosis"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .libraryEntry(id: "nicardipine-drip", displayCategory: "Drip")
            ]
        case "mdq":
            return [
                .libraryEntry(id: "bipolar-disorder", displayCategory: "Diagnosis"),
                .libraryEntry(id: "major-depression", displayCategory: "Diagnosis"),
                .libraryEntry(id: "lithium", displayCategory: "Drug")
            ]
        case "sgarbossa", "timi-stemi":
            return [
                .libraryEntry(id: "myocardial-infarction", displayCategory: "Diagnosis"),
                .libraryEntry(id: "nitroglycerin", displayCategory: "Drug"),
                .libraryEntry(id: "aspirin", displayCategory: "Drug")
            ]
        case "poss":
            return [
                .libraryEntry(id: "morphine", displayCategory: "Drug"),
                .libraryEntry(id: "fentanyl", displayCategory: "Drug"),
                .libraryEntry(id: "hydromorphone", displayCategory: "Drug"),
                .libraryEntry(id: "naloxone", displayCategory: "Drug")
            ]
        case "push":
            return [
                .libraryEntry(id: "pressure-injury", displayCategory: "Diagnosis")
            ]
        case "naegele":
            return [
                .libraryEntry(id: "preterm-labor", displayCategory: "Diagnosis"),
                .libraryEntry(id: "postpartum-hemorrhage", displayCategory: "Diagnosis")
            ]
        case "ballard", "bhutani":
            return [
                .libraryEntry(id: "pediatric-vitals", displayCategory: "Reference")
            ]
        case "esas":
            return []
        case "tinetti", "bristol":
            return []
        case "blatchford", "rockall":
            return [
                .libraryEntry(id: "upper-gi-bleed", displayCategory: "Diagnosis"),
                .libraryEntry(id: "pantoprazole", displayCategory: "Drug")
            ]
        case "ciwa-ar":
            return [
                .libraryEntry(id: "alcohol-withdrawal", displayCategory: "Diagnosis"),
                .libraryEntry(id: "lorazepam", displayCategory: "Drug")
            ]
        case "cows":
            return [
                .libraryEntry(id: "morphine", displayCategory: "Drug"),
                .libraryEntry(id: "naloxone", displayCategory: "Drug")
            ]
        case "cam", "rass", "mini-cog":
            return [
                .libraryEntry(id: "delirium", displayCategory: "Diagnosis"),
                .libraryEntry(id: "haloperidol", displayCategory: "Drug")
            ]
        case "braden":
            return [
                .libraryEntry(id: "pressure-injury", displayCategory: "Diagnosis")
            ]
        case "rule-of-nines":
            return [
                .libraryEntry(id: "burns", displayCategory: "Diagnosis")
            ]
        case "anc":
            return [
                .libraryEntry(id: "vancomycin", displayCategory: "Drug"),
                .libraryEntry(id: "piperacillin-tazobactam", displayCategory: "Drug")
            ]
        case "gcs":
            return [
                .libraryEntry(id: "stroke", displayCategory: "Diagnosis"),
                .libraryEntry(id: "increased-icp", displayCategory: "Diagnosis"),
                .libraryEntry(id: "neuro-check", displayCategory: "Procedure")
            ]
        case "shock-index":
            return [
                .libraryEntry(id: "sepsis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "anaphylaxis", displayCategory: "Diagnosis"),
                .libraryEntry(id: "upper-gi-bleed", displayCategory: "Diagnosis")
            ]
        case "pulse-pressure":
            return [
                .libraryEntry(id: "hypertensive-emergency", displayCategory: "Diagnosis"),
                .libraryEntry(id: "heart-failure", displayCategory: "Diagnosis")
            ]
        case "abi":
            return [
                .libraryEntry(id: "dvt", displayCategory: "Diagnosis")
            ]
        case "phq9":
            return [
                .libraryEntry(id: "major-depression", displayCategory: "Diagnosis"),
                .libraryEntry(id: "suicide-risk", displayCategory: "Diagnosis"),
                .libraryEntry(id: "postpartum-depression", displayCategory: "Diagnosis")
            ]
        case "gad7":
            return [
                .libraryEntry(id: "generalized-anxiety-disorder", displayCategory: "Diagnosis"),
                .libraryEntry(id: "panic-disorder", displayCategory: "Diagnosis")
            ]
        case "centor":
            return []   // strep-pharyngitis Library entry not yet present
        case "flacc":
            return [
                .libraryEntry(id: "pain-scales", displayCategory: "Reference"),
                .libraryEntry(id: "pain-scales-detail", displayCategory: "Reference")
            ]
        case "apgar":
            return []
        case "morse":
            return [
                .libraryEntry(id: "alzheimer-dementia", displayCategory: "Diagnosis"),
                .libraryEntry(id: "delirium", displayCategory: "Diagnosis"),
                .libraryEntry(id: "parkinson-disease", displayCategory: "Diagnosis")
            ]
        case "bmi", "bsa", "ibw", "adjbw", "mifflin",
             "conv-temp", "conv-weight", "conv-length", "conv-volume",
             "aa-gradient", "pack-years", "cardiac-index", "osmolar-gap":
            return []   // anthropometry / generic / conversions don't link to specific clinical entries
        default:
            return []
        }
    }

}
