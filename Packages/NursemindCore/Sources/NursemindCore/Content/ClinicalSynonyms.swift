import Foundation

/// Clinical-language synonym + abbreviation expander used to widen search recall
/// before keyword matching. Nurses type "K+" but the library has "potassium";
/// they search "MI" but the diagnosis is "myocardial infarction"; they type
/// "Lasix" but the drug entry is titled "furosemide". Without expansion, those
/// queries return zero results. With expansion, the query string gets the
/// equivalent terms appended before tokenization.
///
/// Maintained as static groups; bidirectional within each group. Add new groups
/// freely — duplicates across groups are tolerated.
public enum ClinicalSynonyms {

    /// Each inner array is an equivalence class. If ANY term in the group matches
    /// the query (as a whole word), ALL OTHER terms in the group are appended.
    private static let groups: [[String]] = [
        // MARK: Cardiac
        ["mi", "myocardial infarction", "heart attack", "stemi", "nstemi"],
        ["chf", "heart failure", "congestive heart failure"],
        ["cad", "coronary artery disease"],
        ["cva", "stroke", "cerebrovascular accident"],
        ["tia", "transient ischemic attack"],
        ["afib", "atrial fibrillation", "a-fib", "af"],
        ["vfib", "ventricular fibrillation", "v-fib"],
        ["vtach", "ventricular tachycardia", "v-tach", "vt"],
        ["svt", "supraventricular tachycardia"],
        ["pad", "peripheral arterial disease"],
        ["dvt", "deep vein thrombosis", "deep venous thrombosis"],
        ["pe", "pulmonary embolism"],
        ["cabg", "coronary artery bypass"],
        ["aaa", "abdominal aortic aneurysm"],
        ["htn", "hypertension", "high blood pressure"],
        ["hr", "heart rate", "pulse"],
        ["bp", "blood pressure"],
        ["map", "mean arterial pressure"],
        ["cvp", "central venous pressure"],
        ["jvd", "jugular venous distention"],
        ["ekg", "ecg", "electrocardiogram"],

        // MARK: Respiratory
        ["copd", "chronic obstructive pulmonary disease", "emphysema"],
        ["sob", "shortness of breath", "dyspnea"],
        ["ards", "acute respiratory distress syndrome"],
        ["uri", "upper respiratory infection", "urti"],
        ["rsv", "respiratory syncytial virus", "bronchiolitis"],
        ["rr", "respiratory rate"],
        ["tb", "tuberculosis"],
        ["spo2", "oxygen saturation", "pulse oximetry", "o2 sat"],
        ["abg", "arterial blood gas"],
        ["cpap", "continuous positive airway pressure"],
        ["bipap", "bilevel positive airway pressure"],
        ["hfnc", "high flow nasal cannula"],
        ["ett", "endotracheal tube"],
        ["ngt", "nasogastric tube", "ng tube"],

        // MARK: Endocrine / metabolic
        ["dka", "diabetic ketoacidosis"],
        ["hhs", "hyperosmolar hyperglycemic state", "hhns"],
        ["dm", "diabetes mellitus", "diabetes"],
        ["t1dm", "type 1 diabetes", "iddm"],
        ["t2dm", "type 2 diabetes", "niddm"],
        ["bg", "blood glucose", "blood sugar", "bs"],
        ["a1c", "hba1c", "hemoglobin a1c"],

        // MARK: Renal / fluid
        ["aki", "acute kidney injury", "acute renal failure"],
        ["ckd", "chronic kidney disease", "chronic renal failure"],
        ["uti", "urinary tract infection", "bladder infection"],
        ["esrd", "end-stage renal disease"],
        ["bun", "blood urea nitrogen"],
        ["cr", "creatinine"],
        ["gfr", "glomerular filtration rate"],
        ["fena", "fractional excretion of sodium"],

        // MARK: Electrolytes — these need careful matching since "k" is short
        ["k+", "potassium", "k plus"],
        ["na+", "sodium", "na plus"],
        ["ca++", "calcium", "ca plus", "ca2+"],
        ["mg++", "magnesium"],
        ["cl-", "chloride"],
        ["hco3", "bicarbonate", "bicarb"],
        ["po4", "phosphate", "phosphorus"],

        // MARK: Hematology
        ["cbc", "complete blood count"],
        ["bmp", "basic metabolic panel"],
        ["cmp", "comprehensive metabolic panel"],
        ["wbc", "white blood cell", "leukocyte", "white count"],
        ["rbc", "red blood cell", "erythrocyte"],
        ["hgb", "hemoglobin", "hb", "h&h"],
        ["hct", "hematocrit"],
        ["plt", "platelet", "platelets"],
        ["pt", "prothrombin time"],
        ["ptt", "partial thromboplastin time", "aptt"],
        ["inr", "international normalized ratio"],
        ["dic", "disseminated intravascular coagulation"],
        ["lmwh", "low molecular weight heparin"],
        ["ufh", "unfractionated heparin"],

        // MARK: GI / hepatic
        ["gerd", "gastroesophageal reflux", "reflux"],
        ["pud", "peptic ulcer disease"],
        ["ibs", "irritable bowel syndrome"],
        ["ibd", "inflammatory bowel disease"],
        ["uc", "ulcerative colitis"],
        ["sbo", "small bowel obstruction"],
        ["lgib", "lower gi bleed"],
        ["ugib", "upper gi bleed"],
        ["lft", "liver function test"],
        ["ast", "aspartate aminotransferase", "sgot"],
        ["alt", "alanine aminotransferase", "sgpt"],
        ["c. diff", "clostridioides difficile", "c diff", "cdiff"],

        // MARK: Neuro
        ["ich", "intracranial hemorrhage", "intracerebral hemorrhage"],
        ["icp", "intracranial pressure"],
        ["sah", "subarachnoid hemorrhage"],
        ["sdh", "subdural hematoma"],
        ["tbi", "traumatic brain injury"],
        ["sz", "seizure"],
        ["ams", "altered mental status"],
        ["loc", "level of consciousness"],
        ["gcs", "glasgow coma scale"],
        ["nihss", "nih stroke scale"],

        // MARK: Imaging / procedures
        ["cxr", "chest x-ray", "chest xray"],
        ["ct", "computed tomography", "ct scan"],
        ["mri", "magnetic resonance imaging"],
        ["us", "ultrasound", "sonography"],
        ["lp", "lumbar puncture", "spinal tap"],
        ["foley", "indwelling catheter", "urinary catheter"],
        ["picc", "peripherally inserted central catheter"],
        ["cvc", "central venous catheter", "central line"],

        // MARK: Routes
        ["iv", "intravenous"],
        ["po", "oral", "by mouth"],
        ["sq", "subcutaneous", "subcut", "subq"],
        ["im", "intramuscular"],
        ["pr", "rectal", "per rectum"],
        ["tld", "transdermal"],

        // MARK: Sepsis / critical care
        ["sirs", "systemic inflammatory response"],
        ["mods", "multi-organ dysfunction", "multiple organ failure"],
        ["ssi", "surgical site infection"],

        // MARK: OB
        ["pph", "postpartum hemorrhage"],
        ["fhr", "fetal heart rate"],
        ["ga", "gestational age"],
        ["edd", "estimated date of delivery"],
        ["c-section", "cesarean", "csection", "c/s"],
        ["nsvd", "vaginal delivery"],
        ["prom", "premature rupture of membranes"],
        ["pprom", "preterm premature rupture of membranes"],
        ["gbs", "group b strep"],
        ["pih", "pregnancy-induced hypertension"],
        ["hellp", "hellp syndrome"],

        // MARK: Peds / NICU
        ["nrp", "neonatal resuscitation"],
        ["pals", "pediatric advanced life support"],
        ["rds", "respiratory distress syndrome"],
        ["nec", "necrotizing enterocolitis"],
        ["pda", "patent ductus arteriosus"],
        ["bpd", "bronchopulmonary dysplasia"],

        // MARK: Drug brand ↔ generic (most-asked)
        ["pitocin", "oxytocin"],
        ["coumadin", "warfarin"],
        ["lasix", "furosemide"],
        ["lovenox", "enoxaparin"],
        ["narcan", "naloxone"],
        ["valium", "diazepam"],
        ["ativan", "lorazepam"],
        ["versed", "midazolam"],
        ["zofran", "ondansetron"],
        ["tylenol", "acetaminophen", "paracetamol"],
        ["motrin", "ibuprofen", "advil"],
        ["epi", "epinephrine", "adrenaline"],
        ["norepi", "norepinephrine", "levophed"],
        ["amio", "amiodarone", "cordarone"],
        ["levothyroxine", "synthroid"],
        ["metformin", "glucophage"],
        ["lisinopril", "prinivil", "zestril"],
        ["metoprolol", "lopressor", "toprol"],
        ["amlodipine", "norvasc"],
        ["atorvastatin", "lipitor"],
        ["aspirin", "asa"],
        ["clopidogrel", "plavix"],
        ["pantoprazole", "protonix"],
        ["omeprazole", "prilosec"],
        ["albuterol", "ventolin", "proventil"],
        ["methylprednisolone", "solumedrol"],
        ["dexamethasone", "decadron"],
        ["hydrocortisone", "solu-cortef"],
        ["d50", "dextrose 50", "dextrose 50%"],
        ["tpa", "alteplase", "activase"],
        ["benadryl", "diphenhydramine"],
        ["protonix", "pantoprazole"],
        ["dilaudid", "hydromorphone"],
        ["morphine", "ms"],
        ["fentanyl", "sublimaze"],
        ["precedex", "dexmedetomidine"],
        ["heparin", "ufh"],
        ["kayexalate", "sodium polystyrene", "sps"],
        ["mag", "magnesium sulfate"],

        // MARK: Symptoms / patterns
        ["fever", "pyrexia"],
        ["nausea", "n/v", "n&v"],
        ["vomiting", "emesis"],
        ["diarrhea", "loose stools"],
        ["constipation", "no bowel movement"],

        // MARK: Settings
        ["icu", "intensive care unit", "critical care"],
        ["ed", "er", "emergency department", "emergency room"],
        ["or", "operating room"],
        ["pacu", "post-anesthesia care unit"],
        ["nicu", "neonatal intensive care"],
        ["picu", "pediatric intensive care"],
        ["snf", "skilled nursing facility"],

        // MARK: Cardiac (additional)
        ["ie", "infective endocarditis", "endocarditis"],
        ["mr", "mitral regurgitation", "mitral insufficiency"],
        ["ms", "mitral stenosis"],
        ["as", "aortic stenosis"],
        ["ar", "aortic regurgitation", "aortic insufficiency"],
        ["ai", "aortic insufficiency"],
        ["pad", "peripheral artery disease", "peripheral arterial disease"],
        ["arni", "angiotensin receptor neprilysin inhibitor"],
        ["sglt2", "sglt-2", "sodium-glucose cotransporter"],
        ["glp-1", "glp1", "glucagon-like peptide"],

        // MARK: Pulmonary (additional)
        ["ptx", "pneumothorax"],
        ["htx", "hemothorax"],
        ["cap", "community-acquired pneumonia"],
        ["hap", "hospital-acquired pneumonia"],
        ["vap", "ventilator-associated pneumonia"],

        // MARK: Endocrine (additional)
        ["siadh", "syndrome of inappropriate antidiuretic hormone"],
        ["di", "diabetes insipidus"],
        ["addisonian", "adrenal crisis", "addisons", "addison's"],
        ["cushings", "cushing's syndrome", "cushing syndrome"],
        ["gdm", "gestational diabetes"],

        // MARK: Mental health
        ["mdd", "major depressive disorder", "major depression", "depression"],
        ["bd", "bipolar disorder", "bipolar"],
        ["scz", "schizophrenia"],
        ["gad", "generalized anxiety disorder"],
        ["pd-anxiety", "panic disorder"],
        ["ptsd", "post-traumatic stress disorder", "post traumatic stress"],
        ["ocd", "obsessive-compulsive disorder", "obsessive compulsive"],
        ["sud", "substance use disorder"],
        ["oud", "opioid use disorder"],
        ["aud", "alcohol use disorder"],
        ["an", "anorexia nervosa"],
        ["bn", "bulimia nervosa"],
        ["bpd-mh", "borderline personality disorder", "borderline"],
        ["adhd", "attention-deficit hyperactivity disorder"],
        ["asd", "autism spectrum disorder", "autism"],
        ["ssri", "selective serotonin reuptake inhibitor"],
        ["snri", "serotonin-norepinephrine reuptake inhibitor"],
        ["maoi", "monoamine oxidase inhibitor"],
        ["tca", "tricyclic antidepressant"],
        ["ect", "electroconvulsive therapy"],
        ["mat", "medication-assisted treatment", "medications for opioid use disorder", "moud"],
        ["cssrs", "columbia suicide severity rating"],
        ["ciwa", "ciwa-ar", "alcohol withdrawal"],
        ["cows", "opioid withdrawal scale", "clinical opiate withdrawal"],

        // MARK: Neuro (additional)
        ["mg", "myasthenia gravis"],
        ["ms-neuro", "multiple sclerosis"],
        ["pd-neuro", "parkinson", "parkinson's", "parkinson disease"],
        ["ad-dementia", "alzheimer", "alzheimer's", "alzheimer disease", "dementia"],
        ["gbs-neuro", "guillain-barré", "guillain barre", "aidp"],
        ["dbs", "deep brain stimulation"],

        // MARK: Pediatrics
        ["kd", "kawasaki disease", "kawasaki"],
        ["ftt", "failure to thrive"],
        ["sids", "sudden infant death", "sudden infant death syndrome"],
        ["cf", "cystic fibrosis"],
        ["pec", "preeclampsia"],
        ["aap", "american academy of pediatrics"],

        // MARK: GI (additional)
        ["he", "hepatic encephalopathy"],
        ["sbp", "spontaneous bacterial peritonitis"],
        ["nash", "nonalcoholic steatohepatitis"],
        ["nafld", "nonalcoholic fatty liver"],
        ["pud-gi", "peptic ulcer disease"],

        // MARK: OB (additional)
        ["ppd-ob", "postpartum depression"],
        ["hellp-syndrome", "hellp syndrome"],
        ["nas", "neonatal abstinence syndrome"],

        // MARK: Drug brand ↔ generic (Option A drugs)
        ["semaglutide", "ozempic", "wegovy", "rybelsus"],
        ["empagliflozin", "jardiance"],
        ["sacubitril valsartan", "sacubitril-valsartan", "entresto", "arni"],
        ["escitalopram", "lexapro"],
        ["venlafaxine", "effexor"],
        ["mirtazapine", "remeron"],
        ["hydroxychloroquine", "plaquenil", "hcq"],
        ["methotrexate", "mtx"],
        ["prednisone", "deltasone"],
        ["oseltamivir", "tamiflu"],
        ["digoxin", "lanoxin"],
        ["losartan", "cozaar"],
        ["hydrochlorothiazide", "hctz", "microzide"],
        ["carvedilol", "coreg"],
        ["spironolactone", "aldactone"],
        ["metronidazole", "flagyl"],
        ["azithromycin", "zithromax", "z-pak", "zpak"],
        ["cefazolin", "ancef", "kefzol"],
        ["sulfamethoxazole-trimethoprim", "bactrim", "septra", "tmp-smx"],
        ["acyclovir", "zovirax"],
        ["fluconazole", "diflucan"],
        ["insulin glargine", "lantus", "basaglar", "toujeo"],
        ["insulin lispro", "humalog", "admelog"],
        ["glucagon", "baqsimi", "gvoke", "glucagen"],
        ["apixaban", "eliquis"],
        ["rivaroxaban", "xarelto"],
        ["alteplase", "activase", "tpa", "tnk"],
        ["sertraline", "zoloft"],
        ["quetiapine", "seroquel"],
        ["haloperidol", "haldol"],
        ["lithium", "eskalith", "lithobid"],
        ["tramadol", "ultram", "conzip"],
        ["oxycodone", "roxicodone", "oxycontin"],
        ["promethazine", "phenergan"],
        ["lactulose", "enulose", "kristalose"],
        ["polyethylene glycol", "miralax", "golytely", "peg"],
        ["vitamin k", "phytonadione", "mephyton"],
        ["acetylcysteine", "n-acetylcysteine", "nac", "mucomyst", "acetadote"],
        ["ipratropium", "atrovent"],
        ["fluticasone-salmeterol", "advair", "wixela"],
        ["docusate", "colace"],

        // MARK: Common scales / clinical tools
        ["braden", "braden scale"],
        ["morse", "morse fall scale"],
        ["nyha", "new york heart association"],
        ["cam", "confusion assessment method"],
        ["camicu", "cam-icu", "confusion assessment method icu"],
        ["rass", "richmond agitation sedation"],
        ["cpot", "critical-care pain observation"],
        ["bps", "behavioral pain scale"],
        ["esi", "emergency severity index"],
        ["medi-cog", "mini-cog"],

        // MARK: Specific tests / panels
        ["uds", "urine drug screen"],
        ["ua", "urinalysis"],
        ["beta-hcg", "bhcg", "hcg", "human chorionic gonadotropin"],
        ["tsh", "thyroid stimulating hormone"],
        ["t4", "thyroxine"],
        ["t3", "triiodothyronine"],
        ["bnp", "b-type natriuretic peptide", "brain natriuretic peptide"],
        ["nt-probnp", "nt probnp"],
        ["esr", "erythrocyte sedimentation rate", "sed rate"],
        ["crp", "c-reactive protein"],
        ["ck-mb", "ckmb", "creatine kinase mb"],
        ["ldh", "lactate dehydrogenase"],
        ["lipase", "serum lipase"],
        ["procalcitonin", "pct"]
    ]

    /// Expand a query string by appending all synonyms / equivalents of any term
    /// found in the input. Uses whole-word boundary matching to avoid expanding
    /// substring coincidences ("ms" inside "myasthenia" wouldn't match the
    /// stand-alone "ms" → "morphine" group).
    public static func expand(query: String) -> String {
        let lower = " " + query.lowercased() + " "
        var expanded = lower
        var addedTerms = Set<String>()

        for group in groups {
            // Does any group member appear in the query as a whole token?
            var matched = false
            for term in group where wholeWordContains(lower, term: term) {
                matched = true
                break
            }
            guard matched else { continue }

            // Append every other term in the group that isn't already present.
            for term in group where !wholeWordContains(expanded, term: term) && !addedTerms.contains(term) {
                expanded += " " + term
                addedTerms.insert(term)
            }
        }
        return expanded.trimmingCharacters(in: .whitespaces)
    }

    /// True iff `term` appears in `haystack` with non-alphanumeric boundaries on
    /// both sides. The leading/trailing space added by the caller makes the
    /// edges count as boundaries, so single-word terms at start/end are caught.
    private static func wholeWordContains(_ haystack: String, term: String) -> Bool {
        guard let range = haystack.range(of: term) else { return false }
        let before = range.lowerBound > haystack.startIndex
            ? haystack[haystack.index(before: range.lowerBound)]
            : " "
        let after = range.upperBound < haystack.endIndex
            ? haystack[range.upperBound]
            : " "
        return !before.isLetter && !before.isNumber && !after.isLetter && !after.isNumber
    }
}
