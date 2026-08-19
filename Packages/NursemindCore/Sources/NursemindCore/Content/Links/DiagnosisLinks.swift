import Foundation

extension EntryLinkRegistry {
    /// Second batch: high-traffic diagnosis hubs — workup labs/procedures
    /// (assessedBy), first-line medications (usedFor, authored drug → diagnosis
    /// so the diagnosis page derives COMMON MEDICATIONS), and the procedures
    /// performed for them (performedFor).
    static func diagnosisLinks() -> [EntryLink] {
        [
            // ===== Sepsis =====
            EntryLink(from: "diagnosis:sepsis", to: "lab:lactate", relation: .assessedBy),
            EntryLink(from: "diagnosis:sepsis", to: "lab:blood-culture", relation: .assessedBy),
            EntryLink(from: "diagnosis:sepsis", to: "lab:procalcitonin", relation: .assessedBy),
            EntryLink(from: "diagnosis:sepsis", to: "procedure:blood-culture-collection", relation: .assessedBy),
            EntryLink(from: "drug:norepinephrine", to: "diagnosis:sepsis", relation: .usedFor),
            EntryLink(from: "drip:norepinephrine-drip", to: "diagnosis:sepsis", relation: .usedFor),
            EntryLink(from: "drug:vancomycin", to: "diagnosis:sepsis", relation: .usedFor),
            EntryLink(from: "drug:piperacillin-tazobactam", to: "diagnosis:sepsis", relation: .usedFor),
            EntryLink(from: "drug:cefepime", to: "diagnosis:sepsis", relation: .usedFor),

            // ===== Myocardial infarction =====
            EntryLink(from: "diagnosis:myocardial-infarction", to: "lab:troponin", relation: .assessedBy),
            EntryLink(from: "diagnosis:myocardial-infarction", to: "lab:ck-mb", relation: .assessedBy),
            EntryLink(from: "diagnosis:myocardial-infarction", to: "procedure:twelve-lead-ecg", relation: .assessedBy),
            EntryLink(from: "drug:aspirin", to: "diagnosis:myocardial-infarction", relation: .usedFor),
            EntryLink(from: "drug:nitroglycerin", to: "diagnosis:myocardial-infarction", relation: .usedFor),
            EntryLink(from: "drug:metoprolol", to: "diagnosis:myocardial-infarction", relation: .usedFor),
            EntryLink(from: "drug:heparin", to: "diagnosis:myocardial-infarction", relation: .usedFor),

            // ===== Stroke =====
            EntryLink(from: "diagnosis:stroke", to: "lab:glucose", relation: .assessedBy),
            EntryLink(from: "diagnosis:stroke", to: "lab:inr", relation: .assessedBy),
            EntryLink(from: "procedure:tpa-stroke-admin", to: "diagnosis:stroke", relation: .performedFor),
            EntryLink(from: "procedure:mechanical-thrombectomy-care", to: "diagnosis:stroke", relation: .performedFor),
            EntryLink(from: "drug:alteplase", to: "diagnosis:stroke", relation: .usedFor),

            // ===== Heart failure =====
            EntryLink(from: "diagnosis:heart-failure", to: "lab:bnp", relation: .assessedBy),
            EntryLink(from: "diagnosis:heart-failure", to: "lab:nt-probnp", relation: .assessedBy),
            EntryLink(from: "drug:furosemide", to: "diagnosis:heart-failure", relation: .usedFor),
            EntryLink(from: "drug:sacubitril-valsartan", to: "diagnosis:heart-failure", relation: .usedFor),
            EntryLink(from: "drug:spironolactone", to: "diagnosis:heart-failure", relation: .usedFor),
            EntryLink(from: "drug:carvedilol", to: "diagnosis:heart-failure", relation: .usedFor),
            EntryLink(from: "drug:dapagliflozin", to: "diagnosis:heart-failure", relation: .usedFor),
            EntryLink(from: "drip:furosemide-drip", to: "diagnosis:acute-decompensated-heart-failure", relation: .usedFor),
            EntryLink(from: "drip:milrinone-drip", to: "diagnosis:acute-decompensated-heart-failure", relation: .usedFor),
            EntryLink(from: "drip:dobutamine-drip", to: "diagnosis:acute-decompensated-heart-failure", relation: .usedFor),

            // ===== Atrial fibrillation =====
            EntryLink(from: "diagnosis:atrial-fibrillation", to: "lab:tsh", relation: .assessedBy),
            EntryLink(from: "diagnosis:atrial-fibrillation", to: "procedure:twelve-lead-ecg", relation: .assessedBy),
            EntryLink(from: "procedure:synchronized-cardioversion", to: "diagnosis:atrial-fibrillation", relation: .performedFor),
            EntryLink(from: "drip:diltiazem-drip", to: "diagnosis:atrial-fibrillation", relation: .usedFor),
            EntryLink(from: "drug:amiodarone", to: "diagnosis:atrial-fibrillation", relation: .usedFor),
            EntryLink(from: "drug:apixaban", to: "diagnosis:atrial-fibrillation", relation: .usedFor),
            EntryLink(from: "drug:warfarin", to: "diagnosis:atrial-fibrillation", relation: .usedFor),

            // ===== DKA =====
            EntryLink(from: "diagnosis:dka", to: "lab:glucose", relation: .assessedBy),
            EntryLink(from: "diagnosis:dka", to: "lab:beta-hydroxybutyrate", relation: .assessedBy),
            EntryLink(from: "diagnosis:dka", to: "lab:anion-gap", relation: .assessedBy),
            EntryLink(from: "diagnosis:dka", to: "lab:arterial-blood-gas", relation: .assessedBy),
            EntryLink(from: "diagnosis:dka", to: "lab:potassium", relation: .assessedBy),
            EntryLink(from: "drip:insulin-drip", to: "diagnosis:dka", relation: .usedFor),

            // ===== Pneumonia =====
            EntryLink(from: "diagnosis:pneumonia", to: "lab:sputum-culture", relation: .assessedBy),
            EntryLink(from: "diagnosis:pneumonia", to: "lab:blood-culture", relation: .assessedBy),
            EntryLink(from: "drug:ceftriaxone", to: "diagnosis:pneumonia", relation: .usedFor),
            EntryLink(from: "drug:azithromycin", to: "diagnosis:pneumonia", relation: .usedFor),

            // ===== Pulmonary embolism =====
            EntryLink(from: "diagnosis:pulmonary-embolism", to: "lab:d-dimer", relation: .assessedBy),
            EntryLink(from: "drip:heparin-drip", to: "diagnosis:pulmonary-embolism", relation: .usedFor),
            EntryLink(from: "drug:enoxaparin", to: "diagnosis:pulmonary-embolism", relation: .usedFor),
            EntryLink(from: "drug:apixaban", to: "diagnosis:pulmonary-embolism", relation: .usedFor),
            EntryLink(from: "drug:alteplase", to: "diagnosis:pulmonary-embolism", relation: .usedFor),

            // ===== Renal =====
            EntryLink(from: "diagnosis:aki", to: "lab:creatinine", relation: .assessedBy),
            EntryLink(from: "diagnosis:aki", to: "lab:bun", relation: .assessedBy),
            EntryLink(from: "diagnosis:aki", to: "lab:urinalysis", relation: .assessedBy),
            EntryLink(from: "diagnosis:ckd", to: "lab:creatinine", relation: .assessedBy),
            EntryLink(from: "diagnosis:ckd", to: "lab:urine-protein-creatinine", relation: .assessedBy),

            // ===== Hyperkalemia =====
            EntryLink(from: "diagnosis:hyperkalemia", to: "lab:potassium", relation: .assessedBy),
            EntryLink(from: "diagnosis:hyperkalemia", to: "procedure:twelve-lead-ecg", relation: .assessedBy),
            EntryLink(from: "drug:calcium-gluconate", to: "diagnosis:hyperkalemia", relation: .usedFor),
            EntryLink(from: "drug:insulin-regular", to: "diagnosis:hyperkalemia", relation: .usedFor),
            EntryLink(from: "drug:sodium-polystyrene-sulfonate", to: "diagnosis:hyperkalemia", relation: .usedFor),
            EntryLink(from: "drug:patiromer", to: "diagnosis:hyperkalemia", relation: .usedFor),

            // ===== Hypoglycemia =====
            EntryLink(from: "diagnosis:hypoglycemia", to: "lab:glucose", relation: .assessedBy),
            EntryLink(from: "diagnosis:hypoglycemia", to: "procedure:capillary-blood-glucose", relation: .assessedBy),
            EntryLink(from: "drug:glucagon", to: "diagnosis:hypoglycemia", relation: .usedFor),

            // ===== Upper GI bleed =====
            EntryLink(from: "diagnosis:upper-gi-bleed", to: "lab:hemoglobin", relation: .assessedBy),
            EntryLink(from: "diagnosis:upper-gi-bleed", to: "lab:inr", relation: .assessedBy),
            EntryLink(from: "procedure:blood-transfusion", to: "diagnosis:upper-gi-bleed", relation: .performedFor),
            EntryLink(from: "drug:pantoprazole", to: "diagnosis:upper-gi-bleed", relation: .usedFor),
            EntryLink(from: "drip:octreotide-drip", to: "diagnosis:upper-gi-bleed", relation: .usedFor),

            // ===== Cirrhosis =====
            EntryLink(from: "diagnosis:cirrhosis", to: "lab:ast-alt", relation: .assessedBy),
            EntryLink(from: "diagnosis:cirrhosis", to: "lab:bilirubin", relation: .assessedBy),
            EntryLink(from: "diagnosis:cirrhosis", to: "lab:albumin", relation: .assessedBy),
            EntryLink(from: "diagnosis:cirrhosis", to: "lab:ammonia", relation: .assessedBy),
            EntryLink(from: "procedure:paracentesis", to: "diagnosis:cirrhosis", relation: .performedFor),
            EntryLink(from: "drug:lactulose", to: "diagnosis:cirrhosis", relation: .usedFor),
            EntryLink(from: "drug:rifaximin", to: "diagnosis:cirrhosis", relation: .usedFor),
            EntryLink(from: "drug:spironolactone", to: "diagnosis:cirrhosis", relation: .usedFor),

            // ===== Meningitis =====
            EntryLink(from: "diagnosis:meningitis", to: "lab:csf-analysis", relation: .assessedBy),
            EntryLink(from: "diagnosis:meningitis", to: "lab:blood-culture", relation: .assessedBy),
            EntryLink(from: "procedure:lumbar-puncture-assist", to: "diagnosis:meningitis", relation: .performedFor),
            EntryLink(from: "drug:ceftriaxone", to: "diagnosis:meningitis", relation: .usedFor),
            EntryLink(from: "drug:vancomycin", to: "diagnosis:meningitis", relation: .usedFor),
            EntryLink(from: "drug:dexamethasone", to: "diagnosis:meningitis", relation: .usedFor),
            EntryLink(from: "drug:acyclovir", to: "diagnosis:meningitis", relation: .usedFor),

            // ===== Preeclampsia =====
            EntryLink(from: "diagnosis:preeclampsia", to: "lab:urine-protein-creatinine", relation: .assessedBy),
            EntryLink(from: "diagnosis:preeclampsia", to: "lab:platelets", relation: .assessedBy),
            EntryLink(from: "diagnosis:preeclampsia", to: "lab:ast-alt", relation: .assessedBy),
            EntryLink(from: "procedure:non-stress-test", to: "diagnosis:preeclampsia", relation: .performedFor),
            EntryLink(from: "drug:magnesium-sulfate", to: "diagnosis:preeclampsia", relation: .usedFor),
            EntryLink(from: "drug:labetalol", to: "diagnosis:preeclampsia", relation: .usedFor),
            EntryLink(from: "drug:hydralazine", to: "diagnosis:preeclampsia", relation: .usedFor),
            EntryLink(from: "drug:nifedipine", to: "diagnosis:preeclampsia", relation: .usedFor),

            // ===== Status epilepticus =====
            EntryLink(from: "diagnosis:status-epilepticus", to: "lab:eeg-interpretation", relation: .assessedBy),
            EntryLink(from: "drug:lorazepam", to: "diagnosis:status-epilepticus", relation: .usedFor),
            EntryLink(from: "drug:midazolam", to: "diagnosis:status-epilepticus", relation: .usedFor),
            EntryLink(from: "drug:levetiracetam", to: "diagnosis:status-epilepticus", relation: .usedFor),
            EntryLink(from: "drug:fosphenytoin", to: "diagnosis:status-epilepticus", relation: .usedFor),

            // ===== Anaphylaxis =====
            EntryLink(from: "drug:epinephrine", to: "diagnosis:anaphylaxis", relation: .usedFor),
            EntryLink(from: "drug:diphenhydramine", to: "diagnosis:anaphylaxis", relation: .usedFor),
            EntryLink(from: "drug:famotidine", to: "diagnosis:anaphylaxis", relation: .usedFor),
            EntryLink(from: "drug:methylprednisolone", to: "diagnosis:anaphylaxis", relation: .usedFor),

            // ===== Alcohol withdrawal =====
            EntryLink(from: "drug:lorazepam", to: "diagnosis:alcohol-withdrawal", relation: .usedFor),
            EntryLink(from: "drug:diazepam", to: "diagnosis:alcohol-withdrawal", relation: .usedFor),
            EntryLink(from: "drug:phenobarbital", to: "diagnosis:alcohol-withdrawal", relation: .usedFor),

            // ===== Hypertensive emergency =====
            EntryLink(from: "drip:nicardipine-drip", to: "diagnosis:hypertensive-emergency", relation: .usedFor),
            EntryLink(from: "drug:labetalol", to: "diagnosis:hypertensive-emergency", relation: .usedFor),
            EntryLink(from: "drug:clevidipine", to: "diagnosis:hypertensive-emergency", relation: .usedFor),
            EntryLink(from: "drip:nitroprusside-drip", to: "diagnosis:hypertensive-emergency", relation: .usedFor),
            EntryLink(from: "drip:esmolol-drip", to: "diagnosis:hypertensive-emergency", relation: .usedFor),

            // ===== Asthma / COPD =====
            EntryLink(from: "diagnosis:asthma", to: "procedure:pulmonary-function-tests", relation: .assessedBy),
            EntryLink(from: "diagnosis:copd", to: "lab:arterial-blood-gas", relation: .assessedBy),
            EntryLink(from: "diagnosis:copd", to: "procedure:pulmonary-function-tests", relation: .assessedBy),
            EntryLink(from: "procedure:bipap-setup", to: "diagnosis:copd", relation: .performedFor),
            EntryLink(from: "drug:albuterol", to: "diagnosis:asthma", relation: .usedFor),
            EntryLink(from: "drug:albuterol", to: "diagnosis:copd", relation: .usedFor),
            EntryLink(from: "drug:ipratropium", to: "diagnosis:copd", relation: .usedFor),
            EntryLink(from: "drug:prednisone", to: "diagnosis:asthma", relation: .usedFor),

            // ===== Hyponatremia =====
            EntryLink(from: "diagnosis:hyponatremia", to: "lab:sodium", relation: .assessedBy),
            EntryLink(from: "diagnosis:hyponatremia", to: "lab:serum-osmolality", relation: .assessedBy),
            EntryLink(from: "drug:hypertonic-saline-3-percent", to: "diagnosis:hyponatremia", relation: .usedFor),
        ]
    }

    /// Symmetric lab pairs a nurse reads together — each edge renders
    /// INTERPRET WITH on both entries.
    static func labPairLinks() -> [EntryLink] {
        [
            EntryLink(from: "lab:calcium", to: "lab:albumin", relation: .interpretWith),
            EntryLink(from: "lab:calcium", to: "lab:ionized-calcium", relation: .interpretWith),
            EntryLink(from: "lab:calcium", to: "lab:parathyroid-hormone", relation: .interpretWith),
            EntryLink(from: "lab:sodium", to: "lab:serum-osmolality", relation: .interpretWith),
            EntryLink(from: "lab:anion-gap", to: "lab:bicarbonate", relation: .interpretWith),
            EntryLink(from: "lab:bun", to: "lab:creatinine", relation: .interpretWith),
            EntryLink(from: "lab:pt", to: "lab:inr", relation: .interpretWith),
            EntryLink(from: "lab:tsh", to: "lab:free-t4", relation: .interpretWith),
            EntryLink(from: "lab:ferritin", to: "lab:iron-studies", relation: .interpretWith),
            EntryLink(from: "lab:troponin", to: "lab:ck-mb", relation: .interpretWith),
            EntryLink(from: "lab:bnp", to: "lab:nt-probnp", relation: .interpretWith),
            EntryLink(from: "lab:hemoglobin", to: "lab:hematocrit", relation: .interpretWith),
            EntryLink(from: "lab:vitamin-b12", to: "lab:methylmalonic-acid", relation: .interpretWith),
            EntryLink(from: "lab:potassium", to: "lab:magnesium", relation: .interpretWith),
            EntryLink(from: "lab:glucose", to: "lab:hba1c", relation: .interpretWith),
        ]
    }
}
