import Foundation

// Curator-model lab entries.
// Sources: Open RN Nursing Fundamentals — Reference Ranges Appendix (CC BY 4.0),
// Open RN Health Alterations (CC BY 4.0), OpenStax Clinical Nursing Skills appendix
// (CC BY 4.0 with display restriction), CDC laboratory guidance (public domain),
// professional society concept citations (ADA, AACE, IDSA — fact-citation only).

private let openrnLabs = CitationSource(
    id: "openrn_labs_appendix",
    shortName: "Open RN Nursing Fundamentals — Reference Ranges Appendix",
    detail: "Open Resources for Nursing — Chippewa Valley Technical College",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/nursingfundamentals/?s=lab+reference+range",
    lastRetrieved: "2026-05-04"
)

private let openstaxLabs = CitationSource(
    id: "openstax_labs_appendix",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)

private let openrnMedSurgLabs = CitationSource(
    id: "openrn_medsurg_labs",
    shortName: "Open RN Health Alterations / Med-Surg",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/healthalterations/?s=lab+abnormal+interpretation",
    lastRetrieved: "2026-05-04"
)

private let adaDiabetes = CitationSource(
    id: "ada_diabetes_standards",
    shortName: "American Diabetes Association — Standards of Care (concept citation)",
    detail: "HbA1c diagnostic thresholds: ≥6.5% diabetes; 5.7–6.4% prediabetes",
    publisher: "American Diabetes Association",
    license: .factCitationOnly,
    url: "https://diabetesjournals.org/care/issue",
    lastRetrieved: "2026-05-04"
)

private let ataLabs = CitationSource(
    id: "ata_thyroid_ranges",
    shortName: "American Thyroid Association — TSH reference (concept citation)",
    publisher: "American Thyroid Association",
    license: .factCitationOnly,
    url: "https://www.thyroid.org/professionals/ata-professional-guidelines/",
    lastRetrieved: "2026-05-04"
)

// MARK: - aPTT

public enum aPTTSample {
    public static let entry: LabEntry = LabEntry(
        id: "aptt",
        title: "aPTT",
        subtitle: "Activated partial thromboplastin time",
        specimen: "Citrated plasma (blue-top tube; fill to line)",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .clottingHemostasis
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "25–35 seconds", label: "Normal (typical)", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "1.5–2.5× control", label: "Therapeutic on heparin", citationIDs: ["openrn_medsurg_labs"]),
            ReferenceRangeRow(value: "> 100 seconds", label: "Critical (high bleed risk)", citationIDs: ["openrn_medsurg_labs"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic on heparin",
                summary: "If on heparin, indicates inadequate anticoagulation — risk of clot extension or new thromboembolism. If not on heparin, low or normal aPTT is the expected baseline.",
                nursingActions: [
                    "Verify heparin infusion is running at the ordered rate; check pump",
                    "Check for line interruption, infiltration, or compatibility issues",
                    "Notify provider; anticipate dose increase per protocol"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic on heparin",
                summary: "Increased risk of bleeding. Per most heparin protocols, hold the infusion for a defined period and reduce the rate.",
                nursingActions: [
                    "Hold heparin infusion per protocol",
                    "Assess for active bleeding — gums, nose, urine, stool, IV sites, mental status changes",
                    "Notify provider; recheck aPTT per protocol",
                    "Have protamine sulfate available as antidote for severe bleeding"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Critical (>100 seconds or active bleeding)",
                summary: "High risk of significant bleeding; possible heparin overdose.",
                nursingActions: [
                    "Stop heparin infusion immediately",
                    "Notify provider urgently; assess for bleeding head-to-toe",
                    "Anticipate protamine sulfate (1 mg per 100 units of heparin given in last 2–3 hours, max 50 mg)",
                    "Type and crossmatch; prepare for transfusion if needed"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of prolonged aPTT",
                causes: [
                    "Heparin therapy (intended)",
                    "Liver disease (impaired clotting factor synthesis)",
                    "Vitamin K deficiency",
                    "DIC (disseminated intravascular coagulation)",
                    "Hemophilia A or B",
                    "Lupus anticoagulant"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("Draw from a separate venipuncture, NOT from the heparin line — falsely high result.", citationIDs: ["openrn_labs_appendix"]),
            AttributedBullet("Fill the citrate tube to the marked line; under-fill alters the citrate ratio and the result.", citationIDs: ["openrn_labs_appendix"]),
            AttributedBullet("Trend the result against the heparin protocol's target range.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Heparin-induced thrombocytopenia (HIT) — falling platelets after 5–14 days of heparin; HIT antibody and switch to argatroban or bivalirudin per protocol.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Bleeding signs — frank or occult; check stools, urine, IV sites, gums, neuro status.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - D-dimer

public enum DDimerSample {
    public static let entry: LabEntry = LabEntry(
        id: "d-dimer",
        title: "D-dimer",
        subtitle: "Fibrin degradation product",
        specimen: "Plasma (citrated, blue-top)",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .clottingHemostasis
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "< 500 ng/mL FEU (or < 0.5 mcg/mL FEU)", label: "Normal — DVT/PE less likely in low-pretest-probability patients", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "≥ 500 ng/mL FEU", label: "Elevated — non-specific; further workup needed", citationIDs: ["openrn_medsurg_labs"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .normal,
                label: "Negative D-dimer",
                summary: "In a patient with low or moderate clinical probability of DVT or PE, a negative D-dimer essentially rules out venous thromboembolism. In high-probability patients, D-dimer is not a useful exclusion test — proceed directly to imaging.",
                nursingActions: [
                    "Reassure but continue clinical assessment",
                    "Consider alternative diagnoses for the presenting symptoms"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Elevated D-dimer",
                summary: "Indicates clot formation and breakdown but is non-specific. Many causes other than VTE can elevate it: infection, surgery, malignancy, pregnancy, advanced age, sickle cell crisis, severe inflammation.",
                nursingActions: [
                    "Notify provider; anticipate further imaging (CT-PA for PE, ultrasound for DVT)",
                    "Place patient on appropriate precautions while workup is in progress",
                    "Trend serial D-dimers if clinically appropriate"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated D-dimer",
                causes: [
                    "Deep vein thrombosis (DVT)",
                    "Pulmonary embolism (PE)",
                    "Disseminated intravascular coagulation (DIC)",
                    "Recent surgery or trauma",
                    "Pregnancy and postpartum period",
                    "Malignancy",
                    "Severe infection or sepsis",
                    "Advanced age (use age-adjusted cutoff in some protocols)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("D-dimer is most useful in low/moderate pretest-probability patients to RULE OUT VTE; in high-probability patients, go straight to imaging.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Combine with Wells score / Geneva score for clinical decision-making.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Sudden dyspnea, pleuritic chest pain, hypoxia — clinical PE; do not wait for D-dimer to act.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Asymmetric leg swelling and pain — clinical DVT.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - TSH

public enum TSHSample {
    public static let entry: LabEntry = LabEntry(
        id: "tsh",
        title: "TSH",
        subtitle: "Thyroid-stimulating hormone",
        specimen: "Serum",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .cellularRegulation
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "0.4–4.0 mIU/L (typical adult)", label: "Normal", citationIDs: ["openrn_labs_appendix", "ata_thyroid_ranges"]),
            ReferenceRangeRow(value: "> 4.0 mIU/L", label: "Suggests primary hypothyroidism", citationIDs: ["ata_thyroid_ranges"]),
            ReferenceRangeRow(value: "< 0.4 mIU/L", label: "Suggests hyperthyroidism (or central hypothyroidism — confirm with free T4)", citationIDs: ["ata_thyroid_ranges"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated TSH (hypothyroidism)",
                summary: "Primary hypothyroidism: thyroid is failing; pituitary increases TSH to compensate. Confirm with free T4 (low) or T4 (normal in subclinical).",
                nursingActions: [
                    "Anticipate free T4 and possibly anti-TPO antibodies",
                    "Symptom assessment — fatigue, cold intolerance, weight gain, constipation, bradycardia",
                    "Treatment with levothyroxine; counsel on administration timing (empty stomach, separated from calcium/iron/PPIs)"
                ],
                citationIDs: ["ata_thyroid_ranges", "openrn_medsurg_labs"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Suppressed TSH (hyperthyroidism)",
                summary: "Suggests hyperthyroidism; confirm with free T4 and T3. Less commonly, central (pituitary) hypothyroidism with low free T4.",
                nursingActions: [
                    "Anticipate free T4, T3, thyroid receptor antibodies",
                    "Symptom assessment — heat intolerance, weight loss, palpitations, anxiety, tremor",
                    "Continuous cardiac monitoring if atrial fibrillation present"
                ],
                citationIDs: ["ata_thyroid_ranges", "openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated TSH",
                causes: [
                    "Hashimoto thyroiditis (most common)",
                    "Post-radioiodine ablation",
                    "Post-thyroidectomy",
                    "Iodine deficiency",
                    "Drug-induced (lithium, amiodarone, interferon)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            CauseGroup(
                title: "Causes of suppressed TSH",
                causes: [
                    "Graves disease",
                    "Toxic multinodular goiter / toxic adenoma",
                    "Thyroiditis (transient)",
                    "Exogenous thyroid hormone (over-replacement or factitious)",
                    "Pituitary insufficiency (rare)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("Trend TSH 6–8 weeks after any dose change in thyroid hormone replacement.", citationIDs: ["ata_thyroid_ranges"]),
            AttributedBullet("Pregnancy alters TSH — different reference ranges apply by trimester.", citationIDs: ["ata_thyroid_ranges"])
        ],
        watchFor: [
            AttributedBullet("Myxedema coma — profound hypothermia, bradycardia, hypotension, altered mental status. ICU-level emergency.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Thyroid storm — fever, tachycardia, agitation; mortality 10–30%.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, ataLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - HbA1c

public enum HbA1cSample {
    public static let entry: LabEntry = LabEntry(
        id: "hba1c",
        title: "HbA1c",
        subtitle: "Glycated hemoglobin · 3-month glycemic average",
        specimen: "Whole blood (EDTA, lavender-top)",
        nclexTags: NCLEXTags(
            category: .healthPromotion,
            subcategory: .healthPromotion,
            priorityConcept: .glucoseRegulation
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "< 5.7%", label: "Normal", citationIDs: ["ada_diabetes_standards"]),
            ReferenceRangeRow(value: "5.7 – 6.4%", label: "Prediabetes", citationIDs: ["ada_diabetes_standards"]),
            ReferenceRangeRow(value: "≥ 6.5%", label: "Diabetes (diagnostic threshold)", citationIDs: ["ada_diabetes_standards"]),
            ReferenceRangeRow(value: "< 7.0% (typical adult target)", label: "Treatment goal — individualized", citationIDs: ["ada_diabetes_standards"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated HbA1c",
                summary: "Reflects average blood glucose over the past 2–3 months. Each 1% increase corresponds to approximately a 28 mg/dL increase in average glucose. Treatment intensification typically considered when above individualized goal.",
                nursingActions: [
                    "Review patient's glycemic control, medication adherence, diet, activity",
                    "Educate on lifestyle modifications and medication adherence",
                    "Anticipate intensification of therapy per provider — adjust orals, add basal insulin, add GLP-1 RA per ADA guidance"
                ],
                citationIDs: ["ada_diabetes_standards", "openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of falsely elevated HbA1c",
                causes: [
                    "Iron deficiency anemia",
                    "B12 or folate deficiency",
                    "Splenectomy (longer RBC lifespan)",
                    "Chronic kidney disease (carbamylated Hgb)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            CauseGroup(
                title: "Causes of falsely low HbA1c",
                causes: [
                    "Hemolysis or any condition shortening RBC lifespan",
                    "Recent blood transfusion",
                    "Pregnancy (especially second/third trimester)",
                    "Sickle cell disease and other hemoglobinopathies (some assay-dependent)",
                    "Recent acute blood loss"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("HbA1c does NOT replace daily glucose monitoring — it provides the long-term average context.", citationIDs: ["ada_diabetes_standards"]),
            AttributedBullet("In conditions affecting RBC lifespan, alternative measures (fructosamine) may be more accurate.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Patient teaching: connection between HbA1c, daily glucose, and long-term complications (retinopathy, nephropathy, neuropathy, cardiovascular disease).", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("HbA1c targets are individualized — frail elderly may have higher targets (7.5–8%) to avoid hypoglycemia; pregnant patients have stricter targets.", citationIDs: ["ada_diabetes_standards"]),
            AttributedBullet("Sudden drop in HbA1c with intensification of therapy — risk of hypoglycemia, especially in elderly.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, adaDiabetes, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Bilirubin

public enum BilirubinSample {
    public static let entry: LabEntry = LabEntry(
        id: "bilirubin",
        title: "Bilirubin (total / direct)",
        subtitle: "Hepatic and hemolytic marker",
        specimen: "Serum",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .cellularRegulation
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "Total: 0.1–1.2 mg/dL", label: "Normal (adult)", citationIDs: ["openrn_labs_appendix", "openstax_labs_appendix"]),
            ReferenceRangeRow(value: "Direct (conjugated): 0.0–0.3 mg/dL", label: "Normal (adult)", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "Indirect (unconjugated) = total − direct", label: "Calculated", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "Total > 2–3 mg/dL", label: "Jaundice typically clinically apparent", citationIDs: ["openrn_medsurg_labs"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Predominantly indirect (unconjugated) elevation",
                summary: "Suggests increased production (hemolysis) or impaired hepatic uptake/conjugation (Gilbert syndrome, neonatal jaundice).",
                nursingActions: [
                    "Anticipate CBC, reticulocyte count, LDH, haptoglobin (hemolysis workup)",
                    "Review medications — many drugs cause hemolysis or interfere with conjugation",
                    "Assess for jaundice, anemia symptoms"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Predominantly direct (conjugated) elevation",
                summary: "Suggests hepatic dysfunction or biliary obstruction. Consider hepatitis, cirrhosis, drug-induced liver injury, choledocholithiasis, malignancy.",
                nursingActions: [
                    "Anticipate AST, ALT, alkaline phosphatase, GGT, INR, albumin",
                    "Anticipate imaging — RUQ ultrasound for biliary obstruction",
                    "Assess for jaundice, pruritus, dark urine, pale stools",
                    "Review medications — discontinue any potentially hepatotoxic drugs per provider order"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of hyperbilirubinemia",
                causes: [
                    "Pre-hepatic (indirect): hemolysis, transfusion reaction, internal hemorrhage resorption",
                    "Hepatic (mixed): viral hepatitis, alcoholic hepatitis, cirrhosis, drug-induced liver injury",
                    "Post-hepatic (direct): choledocholithiasis, pancreatic cancer, primary sclerosing cholangitis"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("Inspect skin and sclera in natural light — yellowing is most apparent in the sclera and under the tongue.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Pruritus from bile salt deposition — provide skin care, antihistamine or cholestyramine per provider.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Acute liver failure — encephalopathy + INR > 1.5 + jaundice in a patient without prior liver disease. Transplant emergency.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Cholangitis — fever + jaundice + RUQ pain (Charcot triad). Surgical emergency.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Neonatal kernicterus — bilirubin > 25 mg/dL in neonate can cause irreversible brain damage; phototherapy and exchange transfusion thresholds.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Phosphorus

public enum PhosphorusSample {
    public static let entry: LabEntry = LabEntry(
        id: "phosphorus",
        title: "Phosphorus (PO₄)",
        subtitle: "Serum electrolyte · inverse to calcium",
        specimen: "Serum",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .fluidElectrolytes
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "2.5–4.5 mg/dL", label: "Normal (adult)", citationIDs: ["openrn_labs_appendix", "openstax_labs_appendix"]),
            ReferenceRangeRow(value: "< 2.5 mg/dL", label: "Hypophosphatemia", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "< 1.0 mg/dL", label: "Critical low — risk of respiratory failure, rhabdo, hemolysis", citationIDs: ["openrn_medsurg_labs"]),
            ReferenceRangeRow(value: "> 4.5 mg/dL", label: "Hyperphosphatemia", citationIDs: ["openrn_labs_appendix"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Hypophosphatemia (< 2.5)",
                summary: "Severe deficiency impairs ATP production, causing muscle weakness (including respiratory and diaphragmatic), rhabdomyolysis, hemolysis, cardiac dysfunction, and altered mental status. Refeeding syndrome is a classic cause.",
                nursingActions: [
                    "Assess respiratory effort, muscle strength, mental status",
                    "Anticipate IV potassium phosphate or sodium phosphate replacement (slow infusion)",
                    "Monitor calcium concurrently — IV phosphate can precipitate hypocalcemia",
                    "Monitor for refeeding syndrome in malnourished patients starting nutrition"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hyperphosphatemia (> 4.5)",
                summary: "Most often due to renal failure. Causes secondary hyperparathyroidism, soft-tissue calcification, hypocalcemia (precipitates with calcium).",
                nursingActions: [
                    "Anticipate phosphate binders WITH MEALS (calcium acetate, sevelamer, lanthanum)",
                    "Dietary phosphate restriction",
                    "Treat underlying cause — dialysis for severe renal failure",
                    "Monitor calcium — risk of symptomatic hypocalcemia"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of hypophosphatemia",
                causes: [
                    "Refeeding syndrome (malnourished patient resumed on nutrition)",
                    "Alcohol use disorder",
                    "DKA treatment with insulin (intracellular shift)",
                    "Respiratory alkalosis",
                    "Phosphate-binding antacids",
                    "Hyperparathyroidism"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            CauseGroup(
                title: "Causes of hyperphosphatemia",
                causes: [
                    "Acute or chronic kidney disease (most common)",
                    "Tumor lysis syndrome",
                    "Rhabdomyolysis",
                    "Hypoparathyroidism",
                    "Excessive dietary intake (rare with normal renal function)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("Phosphorus and calcium have an inverse relationship — when one rises, the other typically falls.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("IV phosphate replacement is slow — typically 0.08–0.16 mmol/kg over 6 hours.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Refeeding syndrome — hypophosphatemia, hypokalemia, hypomagnesemia, thiamine deficiency in malnourished patients restarted on nutrition. Slow re-feeding and electrolyte supplementation prevent it.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Cardiac dysfunction with severe hypophosphatemia — heart failure, arrhythmias.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Chloride

public enum ChlorideSample {
    public static let entry: LabEntry = LabEntry(
        id: "chloride",
        title: "Chloride (Cl⁻)",
        subtitle: "Serum anion · acid-base context",
        specimen: "Serum",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .fluidElectrolytes
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "96–106 mEq/L", label: "Normal (adult)", citationIDs: ["openrn_labs_appendix", "openstax_labs_appendix"]),
            ReferenceRangeRow(value: "< 96 mEq/L", label: "Hypochloremia", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "> 106 mEq/L", label: "Hyperchloremia", citationIDs: ["openrn_labs_appendix"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .low,
                label: "Hypochloremia",
                summary: "Often parallels sodium losses. Frequently associated with metabolic alkalosis (loss of HCl from vomiting, NG suction, diuretics).",
                nursingActions: [
                    "Assess fluid status, recent GI losses",
                    "Review diuretic use",
                    "Anticipate ABG and basic metabolic panel",
                    "Treatment depends on underlying cause"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            InterpretationTier(
                severity: .high,
                label: "Hyperchloremia",
                summary: "Often associated with non-anion-gap metabolic acidosis (saline infusion, diarrhea, renal tubular acidosis). Hyperchloremia from large-volume normal saline resuscitation has been associated with worse outcomes — balanced crystalloids preferred in many situations.",
                nursingActions: [
                    "Review IV fluid choice and volume — consider switching to balanced crystalloid (LR, Plasma-Lyte) if appropriate",
                    "Assess hydration, diarrhea, renal function",
                    "Anticipate ABG to evaluate acid-base status"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of hypochloremia",
                causes: [
                    "Vomiting / NG suction",
                    "Diuretics (loop, thiazide)",
                    "Excessive sweating",
                    "SIADH",
                    "Cystic fibrosis (sweat losses)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            ),
            CauseGroup(
                title: "Causes of hyperchloremia",
                causes: [
                    "Normal saline resuscitation (excess Cl)",
                    "Diarrhea (loss of bicarb, retention of Cl)",
                    "Renal tubular acidosis",
                    "Diabetes insipidus with dehydration",
                    "Hyperparathyroidism"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("Interpret chloride alongside sodium, bicarbonate, and the anion gap.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Review IV fluids — large-volume normal saline causes hyperchloremic acidosis.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Severe acid-base disturbances — pair with ABG interpretation.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Ammonia

public enum AmmoniaSample {
    public static let entry: LabEntry = LabEntry(
        id: "ammonia",
        title: "Ammonia (NH₃)",
        subtitle: "Marker for hepatic encephalopathy",
        specimen: "Plasma (collect on ice; transport immediately)",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .physiologicalAdaptation,
            priorityConcept: .neurologicalRegulation
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "15–45 mcg/dL (typical adult, varies by lab)", label: "Normal", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "> 45 mcg/dL", label: "Elevated — clinical correlation required", citationIDs: ["openrn_medsurg_labs"]),
            ReferenceRangeRow(value: "> 100 mcg/dL", label: "Strongly associated with hepatic encephalopathy in cirrhosis", citationIDs: ["openrn_medsurg_labs"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated ammonia",
                summary: "In a patient with cirrhosis or acute liver failure, suggests hepatic encephalopathy. Ammonia level does not always correlate with severity of encephalopathy — clinical assessment is more important than the absolute number.",
                nursingActions: [
                    "Assess mental status and neurologic exam — orientation, asterixis, level of consciousness",
                    "Review for precipitants — GI bleed, infection (especially SBP), constipation, sedatives, electrolyte imbalance, dietary protein excess",
                    "Anticipate lactulose titrated to 2–3 soft stools per day; rifaximin as adjunct",
                    "Aspiration precautions and airway protection if obtunded"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated ammonia",
                causes: [
                    "Hepatic encephalopathy in cirrhosis or acute liver failure (most common)",
                    "GI bleeding (intestinal protein digestion)",
                    "Constipation",
                    "Infection (especially SBP)",
                    "Urea cycle disorders (rare; suspect in encephalopathy without liver disease)",
                    "Valproate toxicity",
                    "Tumor lysis syndrome"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("Specimen handling matters — collect on ice, transport immediately; delay falsely elevates ammonia.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Avoid tourniquet for prolonged time; muscle activity (fist clenching) elevates ammonia.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Cerebral edema in fulminant hepatic failure — ammonia >150 strongly associated; ICP monitoring may be required.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Hypoglycemia — common in hepatic failure and presents similarly to encephalopathy; check fingerstick.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - C-Reactive Protein

public enum CRPSample {
    public static let entry: LabEntry = LabEntry(
        id: "crp",
        title: "C-Reactive Protein",
        subtitle: "CRP · acute phase reactant",
        specimen: "Serum",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .infection
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "< 10 mg/L (or < 1.0 mg/dL)", label: "Normal", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "> 10 mg/L", label: "Elevated — non-specific inflammation", citationIDs: ["openrn_medsurg_labs"]),
            ReferenceRangeRow(value: "> 100 mg/L", label: "Marked elevation — bacterial infection commonly", citationIDs: ["openrn_medsurg_labs"]),
            ReferenceRangeRow(value: "hsCRP (cardiovascular risk)", label: "<1 low, 1–3 average, >3 high CV risk", citationIDs: ["openrn_medsurg_labs"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated CRP",
                summary: "Non-specific marker of inflammation. Useful for trending response to therapy in established inflammatory conditions. Cannot distinguish infection from non-infectious inflammation.",
                nursingActions: [
                    "Interpret in clinical context — fever, white count, source of inflammation",
                    "Trend serial CRPs to assess response to treatment",
                    "Combine with procalcitonin if differentiating bacterial infection from other inflammation"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated CRP",
                causes: [
                    "Bacterial infection (especially severe / systemic)",
                    "Tissue injury (trauma, surgery, burns)",
                    "Inflammatory diseases (rheumatoid arthritis, lupus, IBD, vasculitis)",
                    "Malignancy",
                    "Acute MI",
                    "Pregnancy (mild elevation)",
                    "Obesity (chronic low-grade elevation)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("CRP is non-specific — do not use in isolation to diagnose or rule out infection.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Trending: CRP rises within 6–8 hours of inflammation, peaks at 36–50 hours, falls quickly with resolution. Useful for serial monitoring.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Marked elevation (>100 mg/L) is more suggestive of bacterial infection than viral or non-infectious causes.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Persistent elevation despite antibiotics — consider treatment failure, abscess, alternative diagnosis.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - LDH

public enum LDHSample {
    public static let entry: LabEntry = LabEntry(
        id: "ldh",
        title: "Lactate Dehydrogenase",
        subtitle: "LDH · cell injury / hemolysis marker",
        specimen: "Serum (avoid hemolysis — falsely elevates result)",
        nclexTags: NCLEXTags(
            category: .physiologicalIntegrity,
            subcategory: .reductionOfRiskPotential,
            priorityConcept: .cellularRegulation
        ),
        referenceRanges: [
            ReferenceRangeRow(value: "140–280 U/L (typical adult)", label: "Normal", citationIDs: ["openrn_labs_appendix", "openstax_labs_appendix"]),
            ReferenceRangeRow(value: "Mild elevation", label: "Many causes — liver, muscle, blood", citationIDs: ["openrn_labs_appendix"]),
            ReferenceRangeRow(value: "Marked elevation (>1000 U/L)", label: "Often hemolysis, rhabdo, tumor lysis, or significant tissue infarction", citationIDs: ["openrn_medsurg_labs"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Elevated LDH",
                summary: "LDH is found in nearly all body cells; release indicates cell damage but is non-specific. Most useful for: hemolysis workup (with haptoglobin, indirect bilirubin, reticulocytes), tumor lysis syndrome, large tissue infarction, hematologic malignancy monitoring.",
                nursingActions: [
                    "Interpret in clinical context",
                    "Hemolysis workup if anemia and elevated indirect bilirubin: haptoglobin (low), reticulocytes (high), peripheral smear",
                    "Tumor lysis: monitor potassium, phosphorus, uric acid, creatinine"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of elevated LDH",
                causes: [
                    "Hemolysis (in vitro or in vivo)",
                    "Megaloblastic anemia (B12 / folate deficiency)",
                    "Liver disease (hepatitis, cirrhosis)",
                    "Rhabdomyolysis or muscle injury",
                    "Tumor lysis syndrome",
                    "Lymphoma, leukemia (prognostic marker)",
                    "Pulmonary embolism (modest elevation)",
                    "Massive tissue infarction (MI, stroke, mesenteric ischemia)"
                ],
                citationIDs: ["openrn_medsurg_labs"]
            )
        ],
        nursingActions: [
            AttributedBullet("Hemolyzed sample falsely elevates LDH; redraw with care if result is unexpected.", citationIDs: ["openrn_labs_appendix"]),
            AttributedBullet("LDH isoenzymes (LDH-1 through LDH-5) localize the source — rarely ordered now that more specific markers exist.", citationIDs: ["openrn_medsurg_labs"])
        ],
        watchFor: [
            AttributedBullet("Tumor lysis syndrome — rapid cell death with chemotherapy; check K+, phos, uric acid, creatinine. Allopurinol or rasburicase prophylaxis.", citationIDs: ["openrn_medsurg_labs"]),
            AttributedBullet("Hemolytic anemia — combine LDH (high), haptoglobin (low), indirect bilirubin (high), reticulocytes (high) for the classic pattern.", citationIDs: ["openrn_medsurg_labs"])
        ],
        citations: [openrnLabs, openrnMedSurgLabs, openstaxLabs],
        lastSourceFidelityReview: "2026-05-04"
    )
}
