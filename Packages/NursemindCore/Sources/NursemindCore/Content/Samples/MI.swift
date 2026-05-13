import Foundation

public enum MISample {
    public static let entry: DiagnosisEntry = {
        let universalDef = CitationSource(
            id: "fourth_universal_mi_pmc",
            shortName: "Fourth Universal Definition of Myocardial Infarction (PMC OA)",
            detail: "Thygesen K, et al. 2018",
            publisher: "ESC/ACC/AHA/WHF",
            license: .ccBy4,
            url: "https://pmc.ncbi.nlm.nih.gov/articles/PMC6188187/",
            lastRetrieved: "2026-05-03"
        )
        let openrn = CitationSource(
            id: "openrn_medsurg_acs",
            shortName: "Open RN Health Alterations — Acute Coronary Syndrome chapter",
            detail: "Chippewa Valley Technical College",
            publisher: "Open Resources for Nursing",
            license: .ccBy4,
            url: "https://www.ncbi.nlm.nih.gov/books/NBK613071/",
            lastRetrieved: "2026-05-03"
        )
        let aha = CitationSource(
            id: "aha_acs_paraphrased",
            shortName: "AHA ACS Guidelines (paraphrased + cited)",
            detail: "Door-to-balloon time goal ≤90 minutes for STEMI; door-to-needle ≤30 min if PCI not available",
            publisher: "American Heart Association",
            license: .factCitationOnly,
            url: "https://professional.heart.org/en/guidelines-and-statements",
            lastRetrieved: "2026-05-03"
        )

        return DiagnosisEntry(
            id: "myocardial-infarction",
            title: "Myocardial infarction",
            subtitle: "Acute coronary syndrome — STEMI / NSTEMI",
            nclexTags: NCLEXTags(
                category: .physiologicalIntegrity,
                subcategory: .physiologicalAdaptation,
                priorityConcept: .perfusion
            ),
            definition: AttributedProse(
                "Myocardial infarction (MI) is myocardial cell death due to prolonged ischemia. The Fourth Universal Definition requires detection of a rise and/or fall of cardiac troponin (with at least one value above the 99th percentile upper reference limit) AND at least one of: ischemic symptoms, new ischemic EKG changes, development of pathologic Q waves, imaging evidence of new loss of viable myocardium, or identification of a coronary thrombus by angiography or autopsy.",
                citationIDs: ["fourth_universal_mi_pmc"]
            ),
            pathophysiology: AttributedProse(
                "Most acute MIs result from atherosclerotic plaque rupture or erosion with overlying thrombus formation, partially or completely occluding a coronary artery. STEMI = full-thickness ischemia with ST elevation. NSTEMI = subendocardial ischemia with troponin rise but without ST elevation.",
                citationIDs: ["openrn_medsurg_acs"]
            ),
            presentation: [
                AttributedBullet("Chest pain — pressure, tightness, squeezing, often substernal, may radiate to jaw, left arm, back.", citationIDs: ["openrn_medsurg_acs", "fourth_universal_mi_pmc"]),
                AttributedBullet("Diaphoresis, dyspnea, nausea, vomiting.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Anxiety, sense of impending doom.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Atypical presentations more common in women, older adults, diabetics — fatigue, dyspnea without chest pain, epigastric discomfort, syncope.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Skin: cool, clammy, pale.", citationIDs: ["openrn_medsurg_acs"])
            ],
            diagnosticCriteria: [
                AttributedBullet("Troponin rise/fall pattern (high-sensitivity assay).", citationIDs: ["fourth_universal_mi_pmc"]),
                AttributedBullet("12-lead EKG: STEMI = ST elevation in 2 contiguous leads (≥1 mm in limb leads, ≥2 mm in V2-V3). NSTEMI = ST depression, T-wave inversion, or no acute changes despite troponin rise.", citationIDs: ["fourth_universal_mi_pmc", "openrn_medsurg_acs"]),
                AttributedBullet("New Q waves on EKG indicate completed transmural infarct.", citationIDs: ["fourth_universal_mi_pmc"]),
                AttributedBullet("Imaging: echocardiogram showing new wall motion abnormality.", citationIDs: ["openrn_medsurg_acs"])
            ],
            priorityAssessments: [
                AttributedBullet("Continuous cardiac monitoring; serial 12-lead EKGs.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Pain assessment (PQRST) — onset, quality, radiation, timing.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Vital signs every 15 minutes initially; SpO2 continuously.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Heart and lung sounds — new murmur (papillary muscle rupture), rales (heart failure), S3 gallop.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Peripheral pulses, capillary refill, mental status.", citationIDs: ["openrn_medsurg_acs"])
            ],
            commonInterventions: [
                AttributedBullet("MONA (mnemonic, NOT a fixed order — clinical judgment per current AHA guidance): Morphine, Oxygen (only if SpO2 <90%), Nitroglycerin, Aspirin 162–325 mg chewed.", citationIDs: ["aha_acs_paraphrased", "openrn_medsurg_acs"]),
                AttributedBullet("STEMI: emergent reperfusion — door-to-balloon ≤90 minutes for primary PCI; door-to-needle ≤30 minutes if fibrinolytic therapy.", citationIDs: ["aha_acs_paraphrased"]),
                AttributedBullet("Anticoagulation (heparin, enoxaparin) and dual antiplatelet therapy (aspirin + P2Y12 inhibitor) per provider.", citationIDs: ["aha_acs_paraphrased", "openrn_medsurg_acs"]),
                AttributedBullet("Beta-blocker within 24 hours if no contraindication.", citationIDs: ["aha_acs_paraphrased"]),
                AttributedBullet("Statin therapy initiation.", citationIDs: ["aha_acs_paraphrased"]),
                AttributedBullet("Bed rest with HOB 30°; minimize myocardial oxygen demand.", citationIDs: ["openrn_medsurg_acs"])
            ],
            watchFor: [
                AttributedBullet("Cardiogenic shock — hypotension, oliguria, altered mental status, cool extremities.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Lethal arrhythmias — V-fib and V-tach are most common in the first hours.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Heart failure — pulmonary edema, S3, JVD, peripheral edema.", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Mechanical complications — papillary muscle rupture (severe MR), VSD, free-wall rupture (typically days 3–7).", citationIDs: ["openrn_medsurg_acs"]),
                AttributedBullet("Right-sided MI: nitrates contraindicated (preload-dependent); patient may need fluids.", citationIDs: ["openrn_medsurg_acs"])
            ],
            citations: [universalDef, openrn, aha],
            lastSourceFidelityReview: "2026-05-03"
        )
    }()
}
