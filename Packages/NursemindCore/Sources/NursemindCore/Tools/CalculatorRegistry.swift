import Foundation

public enum CalculatorRegistry {
    public static let all: [CalculatorEntry] = [
        // Cardiovascular
        CalculatorEntry(id: "map",            title: "MAP",            subtitle: "Mean arterial pressure",     category: .cardiovascular),
        CalculatorEntry(id: "cardiac-index",  title: "Cardiac Index",  subtitle: "Cardiac output indexed to BSA", category: .cardiovascular),
        CalculatorEntry(id: "shock-index",    title: "Shock Index",    subtitle: "HR ÷ SBP — early shock screen", category: .cardiovascular),
        CalculatorEntry(id: "qtc",            title: "QTc",            subtitle: "Bazett & Fridericia corrections", category: .cardiovascular),
        CalculatorEntry(id: "nyha",           title: "NYHA Class",     subtitle: "Heart failure functional class", category: .cardiovascular),
        CalculatorEntry(id: "cha2ds2-vasc",   title: "CHA₂DS₂-VASc",   subtitle: "Stroke risk in non-valvular AFib", category: .cardiovascular),
        CalculatorEntry(id: "has-bled",       title: "HAS-BLED",       subtitle: "Bleeding risk on anticoagulation", category: .cardiovascular),
        CalculatorEntry(id: "heart",          title: "HEART Score",    subtitle: "Chest pain risk in the ED",  category: .cardiovascular),
        CalculatorEntry(id: "timi",           title: "TIMI",           subtitle: "UA / NSTEMI risk score",     category: .cardiovascular),
        CalculatorEntry(id: "killip",         title: "Killip Class",   subtitle: "Acute MI clinical class",    category: .cardiovascular),
        CalculatorEntry(id: "pulse-pressure", title: "Pulse Pressure", subtitle: "SBP − DBP",                  category: .cardiovascular),
        CalculatorEntry(id: "abi",            title: "ABI",            subtitle: "Ankle-Brachial Index — PAD",  category: .cardiovascular),
        CalculatorEntry(id: "rcri",           title: "RCRI",           subtitle: "Revised Cardiac Risk Index — pre-op", category: .cardiovascular),
        CalculatorEntry(id: "fick-co",        title: "Fick CO",        subtitle: "Cardiac output by Fick principle", category: .cardiovascular),
        CalculatorEntry(id: "grace",          title: "GRACE",          subtitle: "ACS in-hospital + 6-month mortality", category: .cardiovascular),
        CalculatorEntry(id: "sgarbossa",      title: "Sgarbossa",      subtitle: "Acute MI in LBBB · ECG criteria", category: .cardiovascular),
        CalculatorEntry(id: "timi-stemi",     title: "TIMI for STEMI", subtitle: "30-day mortality after STEMI",  category: .cardiovascular),

        // Respiratory
        CalculatorEntry(id: "pf-ratio",       title: "P/F Ratio",      subtitle: "PaO₂ / FiO₂ — ARDS severity", category: .respiratory),
        CalculatorEntry(id: "oxygenation-index", title: "Oxygenation Index", subtitle: "FiO₂ × MAP airway × 100 / PaO₂", category: .respiratory),
        CalculatorEntry(id: "aa-gradient",    title: "A–a Gradient",   subtitle: "Alveolar-arterial oxygen gradient", category: .respiratory),
        CalculatorEntry(id: "perc",           title: "PERC Rule",      subtitle: "PE rule-out criteria",       category: .respiratory),
        CalculatorEntry(id: "pack-years",     title: "Pack-Years",     subtitle: "Lifetime smoking exposure",  category: .respiratory),
        CalculatorEntry(id: "curb-65",        title: "CURB-65",        subtitle: "Pneumonia severity",         category: .respiratory),
        CalculatorEntry(id: "wells-pe",       title: "Wells PE",       subtitle: "Pulmonary embolism pretest probability", category: .respiratory),
        CalculatorEntry(id: "minute-vent",    title: "Minute Ventilation", subtitle: "RR × tidal volume",      category: .respiratory),
        CalculatorEntry(id: "rsbi",           title: "RSBI",           subtitle: "Rapid Shallow Breathing Index — vent weaning", category: .respiratory),
        CalculatorEntry(id: "bode",           title: "BODE Index",     subtitle: "COPD 4-year mortality",      category: .respiratory),
        CalculatorEntry(id: "psi",            title: "PSI / PORT",     subtitle: "Pneumonia Severity Index",   category: .respiratory),
        CalculatorEntry(id: "borg",           title: "Modified Borg",  subtitle: "Self-rated dyspnea · 0–10",  category: .respiratory),
        CalculatorEntry(id: "mmrc",           title: "mMRC",           subtitle: "Modified MRC dyspnea grade", category: .respiratory),
        CalculatorEntry(id: "pesi",           title: "PESI",           subtitle: "PE Severity Index · 30-day mortality", category: .respiratory),
        CalculatorEntry(id: "spesi",          title: "sPESI",          subtitle: "Simplified PE Severity Index", category: .respiratory),
        CalculatorEntry(id: "geneva-pe",      title: "Geneva PE",      subtitle: "PE pretest probability · revised", category: .respiratory),
        CalculatorEntry(id: "light",          title: "Light's Criteria", subtitle: "Pleural effusion · transudate vs exudate", category: .respiratory),

        // Renal · Metabolic
        CalculatorEntry(id: "gfr",            title: "GFR",            subtitle: "CKD-EPI 2021 (race-free)",   category: .renalMetabolic),
        CalculatorEntry(id: "crcl",           title: "Creatinine Clearance", subtitle: "Cockcroft-Gault — drug dosing reference", category: .renalMetabolic),
        CalculatorEntry(id: "anion-gap",      title: "Anion Gap",      subtitle: "Na − (Cl + HCO₃)",           category: .renalMetabolic),
        CalculatorEntry(id: "corrected-na",   title: "Corrected Na",   subtitle: "Sodium correction for hyperglycemia", category: .renalMetabolic),
        CalculatorEntry(id: "corrected-ca",   title: "Corrected Ca",   subtitle: "Calcium correction for albumin", category: .renalMetabolic),
        CalculatorEntry(id: "fena",           title: "FENa",           subtitle: "Fractional excretion of sodium", category: .renalMetabolic),
        CalculatorEntry(id: "fwd",            title: "Free Water Deficit", subtitle: "Replacement target in hypernatremia", category: .renalMetabolic),
        CalculatorEntry(id: "osmolality",     title: "Plasma Osmolality", subtitle: "2(Na) + glucose/18 + BUN/2.8", category: .renalMetabolic),
        CalculatorEntry(id: "na-correction-rate", title: "Na Correction Rate", subtitle: "Adrogue-Madias — ΔNa per L of fluid", category: .renalMetabolic),
        CalculatorEntry(id: "osmolar-gap",    title: "Osmolar Gap",    subtitle: "Measured − calculated osmolality", category: .renalMetabolic),
        CalculatorEntry(id: "delta-gap",      title: "Delta-Gap",      subtitle: "ΔAG ÷ ΔHCO₃ — mixed acid-base", category: .renalMetabolic),
        CalculatorEntry(id: "winters",        title: "Winters' Formula", subtitle: "Expected pCO₂ in metabolic acidosis", category: .renalMetabolic),
        CalculatorEntry(id: "a1c-eag",        title: "HbA1c → eAG",    subtitle: "Estimated average glucose",   category: .renalMetabolic),
        CalculatorEntry(id: "kdigo-aki",      title: "KDIGO AKI",      subtitle: "AKI severity staging",        category: .renalMetabolic),

        // Hepatic
        CalculatorEntry(id: "meld",           title: "MELD",           subtitle: "Cirrhosis severity (classic)", category: .hepatic),
        CalculatorEntry(id: "meld-na",        title: "MELD-Na",        subtitle: "Cirrhosis severity · transplant priority", category: .hepatic),
        CalculatorEntry(id: "blatchford",     title: "Glasgow-Blatchford", subtitle: "Upper GI bleed risk",    category: .hepatic),
        CalculatorEntry(id: "maddrey",        title: "Maddrey DF",     subtitle: "Alcoholic hepatitis severity", category: .hepatic),
        CalculatorEntry(id: "lille",          title: "Lille Score",    subtitle: "Steroid response in alcoholic hepatitis", category: .hepatic),
        CalculatorEntry(id: "rockall",        title: "Rockall Score",  subtitle: "Post-endoscopy UGI mortality", category: .hepatic),
        CalculatorEntry(id: "child-pugh",     title: "Child-Pugh",     subtitle: "Cirrhosis severity · 1-year survival", category: .hepatic),
        CalculatorEntry(id: "fib4",           title: "FIB-4",          subtitle: "Non-invasive hepatic fibrosis", category: .hepatic),
        CalculatorEntry(id: "apri",           title: "APRI",           subtitle: "AST-to-Platelet Ratio Index", category: .hepatic),
        CalculatorEntry(id: "aims-65",        title: "AIMS-65",        subtitle: "UGI bleed in-hospital mortality", category: .hepatic),
        CalculatorEntry(id: "bisap",          title: "BISAP",          subtitle: "Acute pancreatitis severity",  category: .hepatic),
        CalculatorEntry(id: "meld-3",         title: "MELD 3.0",       subtitle: "OPTN allocation · 2023 update", category: .hepatic),
        CalculatorEntry(id: "ranson",         title: "Ranson",         subtitle: "Acute pancreatitis · 48-h mortality", category: .hepatic),
        CalculatorEntry(id: "kings",          title: "King's College", subtitle: "Acute liver failure · transplant",   category: .hepatic),

        // Hematology
        CalculatorEntry(id: "anc",            title: "ANC",            subtitle: "Absolute neutrophil count", category: .hematology),
        CalculatorEntry(id: "hit-4ts",        title: "HIT 4Ts",        subtitle: "Heparin-induced thrombocytopenia", category: .hematology),
        CalculatorEntry(id: "mascc",          title: "MASCC",          subtitle: "Febrile neutropenia risk index", category: .hematology),
        CalculatorEntry(id: "corrected-retic", title: "Corrected Retic", subtitle: "Reticulocyte % adjusted for anemia", category: .hematology),
        CalculatorEntry(id: "dic-isth",       title: "DIC ISTH",       subtitle: "Overt DIC scoring",          category: .hematology),
        CalculatorEntry(id: "plasmic",        title: "PLASMIC",        subtitle: "TTP probability · ADAMTS13", category: .hematology),
        CalculatorEntry(id: "khorana",        title: "Khorana",        subtitle: "Chemotherapy-associated VTE risk", category: .hematology),

        // Burns
        CalculatorEntry(id: "rule-of-nines",  title: "Rule of Nines",  subtitle: "Adult TBSA — burn surface area", category: .burns),
        CalculatorEntry(id: "lund-browder",   title: "Lund-Browder",   subtitle: "Age-adjusted TBSA — pediatrics", category: .burns),

        // Risk Scores
        CalculatorEntry(id: "mews",           title: "MEWS",           subtitle: "Modified Early Warning Score", category: .riskScores),
        CalculatorEntry(id: "news2",          title: "NEWS2",          subtitle: "National Early Warning Score 2", category: .riskScores),
        CalculatorEntry(id: "qsofa",          title: "qSOFA",          subtitle: "Quick sepsis screen",        category: .riskScores),
        CalculatorEntry(id: "sofa",           title: "SOFA",           subtitle: "Sepsis-related organ failure", category: .riskScores),
        CalculatorEntry(id: "gcs",            title: "Glasgow Coma Scale", subtitle: "Eye · Verbal · Motor",   category: .riskScores),
        CalculatorEntry(id: "rass",           title: "RASS",           subtitle: "Richmond Agitation-Sedation Scale", category: .riskScores),
        CalculatorEntry(id: "cam",            title: "CAM",            subtitle: "Confusion Assessment Method · delirium", category: .riskScores),
        CalculatorEntry(id: "apgar",          title: "Apgar",          subtitle: "Newborn assessment",         category: .riskScores),
        CalculatorEntry(id: "flacc",          title: "FLACC",          subtitle: "Pain · non-verbal patient",  category: .riskScores),
        CalculatorEntry(id: "ciwa-ar",        title: "CIWA-Ar",        subtitle: "Alcohol withdrawal severity", category: .riskScores),
        CalculatorEntry(id: "caprini",        title: "Caprini Score",  subtitle: "VTE risk · surgical patients", category: .riskScores),
        CalculatorEntry(id: "morse",          title: "Morse Fall Scale", subtitle: "Inpatient fall risk",      category: .riskScores),
        CalculatorEntry(id: "braden",         title: "Braden Scale",   subtitle: "Pressure injury risk",       category: .riskScores),
        CalculatorEntry(id: "wells-dvt",      title: "Wells DVT",      subtitle: "Deep vein thrombosis pretest", category: .riskScores),
        CalculatorEntry(id: "padua",          title: "Padua Score",    subtitle: "VTE risk · medical patients", category: .riskScores),
        CalculatorEntry(id: "cows",           title: "COWS",           subtitle: "Clinical Opiate Withdrawal", category: .riskScores),
        CalculatorEntry(id: "phq9",           title: "PHQ-9",          subtitle: "Depression severity",        category: .riskScores),
        CalculatorEntry(id: "gad7",           title: "GAD-7",          subtitle: "Generalized anxiety severity", category: .riskScores),
        CalculatorEntry(id: "mini-cog",       title: "Mini-Cog",       subtitle: "Cognitive impairment screen", category: .riskScores),
        CalculatorEntry(id: "centor",         title: "Centor / McIsaac", subtitle: "Strep pharyngitis pretest", category: .riskScores),
        CalculatorEntry(id: "cam-icu",        title: "CAM-ICU",        subtitle: "ICU delirium · non-verbal patients", category: .riskScores),
        CalculatorEntry(id: "stop-bang",      title: "STOP-BANG",      subtitle: "Obstructive sleep apnea screen", category: .riskScores),
        CalculatorEntry(id: "cfs",            title: "Clinical Frailty Scale", subtitle: "Rockwood 9-level frailty", category: .riskScores),
        CalculatorEntry(id: "abcd2",          title: "ABCD²",          subtitle: "Stroke risk after TIA · 2-day", category: .riskScores),
        CalculatorEntry(id: "audit-c",        title: "AUDIT-C",        subtitle: "3-item alcohol use screen",  category: .riskScores),
        CalculatorEntry(id: "aldrete",        title: "Aldrete",        subtitle: "Post-anesthesia recovery readiness", category: .riskScores),
        CalculatorEntry(id: "karnofsky",      title: "Karnofsky",      subtitle: "Performance status · 0–100%", category: .riskScores),
        CalculatorEntry(id: "ecog",           title: "ECOG",           subtitle: "Performance status · 0–5",   category: .riskScores),
        CalculatorEntry(id: "gcs-pupils",     title: "GCS-Pupils",     subtitle: "GCS adjusted for pupil reactivity", category: .riskScores),
        CalculatorEntry(id: "nihss",          title: "NIHSS",          subtitle: "NIH Stroke Scale · 15 items", category: .riskScores),
        CalculatorEntry(id: "charlson",       title: "Charlson",       subtitle: "Comorbidity index · 10-yr survival", category: .riskScores),
        CalculatorEntry(id: "peds-gcs",       title: "Peds GCS",       subtitle: "Pediatric Glasgow Coma Scale", category: .riskScores),
        CalculatorEntry(id: "lace",           title: "LACE",           subtitle: "30-day readmission / death risk", category: .riskScores),
        CalculatorEntry(id: "pps",            title: "Palliative Performance", subtitle: "PPS · hospice framework", category: .riskScores),
        CalculatorEntry(id: "apache-2",       title: "APACHE II",      subtitle: "ICU mortality · 12 physiology + age + chronic", category: .riskScores),
        CalculatorEntry(id: "cssrs",          title: "C-SSRS",         subtitle: "Columbia Suicide Severity · screen", category: .riskScores),
        CalculatorEntry(id: "mrs",            title: "Modified Rankin", subtitle: "Stroke functional outcome · 0–6", category: .riskScores),
        CalculatorEntry(id: "hunt-hess",      title: "Hunt and Hess",  subtitle: "SAH clinical grading",        category: .riskScores),
        CalculatorEntry(id: "ich",            title: "ICH Score",      subtitle: "Intracerebral hemorrhage · 30-day mortality", category: .riskScores),
        CalculatorEntry(id: "asa-ps",         title: "ASA Status",     subtitle: "Pre-anesthetic classification", category: .riskScores),
        CalculatorEntry(id: "mallampati",     title: "Mallampati",     subtitle: "Pre-op airway visualization",  category: .riskScores),
        CalculatorEntry(id: "sirs",           title: "SIRS",           subtitle: "Systemic inflammatory response", category: .riskScores),
        CalculatorEntry(id: "westley",        title: "Westley Croup",  subtitle: "Pediatric croup severity",    category: .riskScores),
        CalculatorEntry(id: "barthel",        title: "Barthel Index",  subtitle: "ADL · functional independence", category: .riskScores),
        CalculatorEntry(id: "bishop",         title: "Bishop Score",   subtitle: "Cervical readiness for induction", category: .riskScores),
        CalculatorEntry(id: "epworth",        title: "Epworth",        subtitle: "Daytime sleepiness · 0–24",   category: .riskScores),
        CalculatorEntry(id: "audit-full",     title: "AUDIT (full)",   subtitle: "Alcohol Use Disorders · WHO 10-item", category: .riskScores),
        CalculatorEntry(id: "apfel",          title: "Apfel",          subtitle: "Post-op nausea & vomiting risk", category: .riskScores),
        CalculatorEntry(id: "lawton",         title: "Lawton IADL",    subtitle: "Instrumental ADLs · 0–8",     category: .riskScores),
        CalculatorEntry(id: "tug",            title: "TUG",            subtitle: "Timed Up and Go · falls",     category: .riskScores),
        CalculatorEntry(id: "pews",           title: "PEWS",           subtitle: "Pediatric Early Warning · Brighton", category: .riskScores),
        CalculatorEntry(id: "wfns",           title: "WFNS SAH",       subtitle: "GCS-based SAH grading",       category: .riskScores),
        CalculatorEntry(id: "dn4",            title: "DN4",            subtitle: "Neuropathic pain screen",     category: .riskScores),
        CalculatorEntry(id: "mdq",            title: "MDQ",            subtitle: "Mood Disorder · bipolar screen", category: .riskScores),
        CalculatorEntry(id: "poss",           title: "POSS",           subtitle: "Pasero opioid sedation",      category: .riskScores),
        CalculatorEntry(id: "bristol",        title: "Bristol Stool",  subtitle: "Stool form scale",            category: .riskScores),
        CalculatorEntry(id: "naegele",        title: "Naegele's Rule", subtitle: "Estimated due date · OB",    category: .riskScores),
        CalculatorEntry(id: "ballard",        title: "New Ballard",    subtitle: "Newborn gestational age",     category: .riskScores),
        CalculatorEntry(id: "bhutani",        title: "Bhutani",        subtitle: "Newborn hyperbilirubinemia risk", category: .riskScores),
        CalculatorEntry(id: "push",           title: "PUSH Tool",      subtitle: "Pressure injury healing",     category: .riskScores),
        CalculatorEntry(id: "esas",           title: "ESAS-r",         subtitle: "Edmonton Symptom Assessment · palliative", category: .riskScores),
        CalculatorEntry(id: "tinetti",        title: "Tinetti POMA",   subtitle: "Balance + gait · falls",      category: .riskScores),

        // Anthropometry
        CalculatorEntry(id: "bmi",            title: "BMI",            subtitle: "Body mass index",            category: .anthropometry),
        CalculatorEntry(id: "bsa",            title: "BSA",            subtitle: "Body surface area · Mosteller", category: .anthropometry),
        CalculatorEntry(id: "ibw",            title: "IBW",            subtitle: "Ideal body weight · Devine", category: .anthropometry),
        CalculatorEntry(id: "adjbw",          title: "Adjusted Body Weight", subtitle: "Drug-dosing weight in obesity", category: .anthropometry),
        CalculatorEntry(id: "mifflin",        title: "Mifflin-St Jeor", subtitle: "Resting metabolic rate",     category: .anthropometry),
        CalculatorEntry(id: "whr",            title: "Waist-Hip Ratio", subtitle: "Central adiposity · WHO cutoffs", category: .anthropometry),
        CalculatorEntry(id: "whtr",           title: "Waist-Height Ratio", subtitle: "Central adiposity · sex-neutral", category: .anthropometry),
        CalculatorEntry(id: "pct-wt",         title: "% Weight Change", subtitle: "Nutrition / palliative tracking", category: .anthropometry),

        // Conversions
        CalculatorEntry(id: "conv-temp",      title: "Temperature",    subtitle: "°C ↔ °F",                     category: .conversions),
        CalculatorEntry(id: "conv-weight",    title: "Weight",         subtitle: "kg ↔ lb",                     category: .conversions),
        CalculatorEntry(id: "conv-length",    title: "Length",         subtitle: "cm ↔ in / ft",                category: .conversions),
        CalculatorEntry(id: "conv-volume",    title: "Volume",         subtitle: "mL ↔ fl oz",                  category: .conversions),
        CalculatorEntry(id: "conv-glucose",   title: "Glucose units",  subtitle: "mg/dL ↔ mmol/L",              category: .conversions),
        CalculatorEntry(id: "conv-creatinine", title: "Creatinine units", subtitle: "mg/dL ↔ µmol/L",           category: .conversions),
        CalculatorEntry(id: "conv-bilirubin", title: "Bilirubin units", subtitle: "mg/dL ↔ µmol/L",             category: .conversions),
        CalculatorEntry(id: "conv-bun-urea",  title: "BUN ↔ Urea",     subtitle: "BUN mg/dL ↔ Urea mmol/L",    category: .conversions)
    ]

    public static func entries(in category: CalculatorCategory) -> [CalculatorEntry] {
        all.filter { $0.category == category }
    }

    public static func entry(byID id: String) -> CalculatorEntry? {
        all.first { $0.id == id }
    }

    public static func count(in category: CalculatorCategory) -> Int {
        all.lazy.filter { $0.category == category }.count
    }

    /// Token-weighted search across title, subtitle, and category display name.
    /// Mirrors ContentRegistry.search semantics so the Tools tab feels identical
    /// to Library search.
    public static func search(_ query: String, limit: Int = 30) -> [CalculatorEntry] {
        let q = query.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return [] }

        let stripped = q.unicodeScalars
            .filter { CharacterSet.alphanumerics.contains($0) || $0 == " " || $0 == "-" }
            .map(Character.init)
        let cleaned = String(stripped)
        let rawTokens = cleaned.split(separator: " ").map(String.init)
        let keywordTokens = rawTokens.filter { $0.count >= 2 && !stopWords.contains($0) }

        var scored: [(entry: CalculatorEntry, score: Int)] = []
        for entry in all {
            let title = entry.title.lowercased()
            let subtitle = entry.subtitle.lowercased()
            let category = entry.category.displayName.lowercased()
            let haystack = "\(title) \(subtitle) \(category)"

            var score = 0
            if title == q                 { score += 5000 }
            if title.hasPrefix(q)         { score += 2000 }
            if haystack.hasPrefix(q)      { score += 1000 }

            for token in keywordTokens {
                let weight = max(token.count, 2)
                if title == token             { score += weight * 50 }
                else if title.contains(token) { score += weight * 20 }
                else if subtitle.contains(token) { score += weight * 8 }
                else if category.contains(token) { score += weight * 4 }
            }

            if score == 0 && haystack.contains(q) { score += 30 }
            if score > 0 { scored.append((entry, score)) }
        }
        return scored.sorted { $0.score > $1.score }.prefix(limit).map(\.entry)
    }

    private static let stopWords: Set<String> = [
        "the", "and", "for", "with", "what", "how", "when", "why", "calculator",
        "calc", "score", "tool", "of", "to", "in", "on"
    ]
}
