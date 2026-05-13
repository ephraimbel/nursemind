import Foundation

// Curator-model lab entries (round 5 expansion — drug-level monitoring labs).
// Sources: Open RN Pharmacology + Health Alterations (CC BY 4.0), OpenStax
// Clinical Nursing Skills (CC BY 4.0 with AI restriction), ISMP / IDSA concept citations.

private let openrnLabsR5 = CitationSource(
    id: "openrn_labs_round5",
    shortName: "Open RN Nursing Pharmacology — therapeutic drug monitoring",
    publisher: "Open Resources for Nursing",
    license: .ccBy4,
    url: "https://wtcs.pressbooks.pub/pharmacology/?s=therapeutic+drug+monitoring+trough+peak",
    lastRetrieved: "2026-05-04"
)
private let openstaxLabsR5 = CitationSource(
    id: "openstax_labs_round5",
    shortName: "OpenStax Clinical Nursing Skills — Adult Lab Values appendix",
    publisher: "OpenStax · Rice University",
    license: .ccBy4WithAIRestriction,
    url: "https://openstax.org/books/clinical-nursing-skills/pages/a-adult-lab-values",
    lastRetrieved: "2026-05-04"
)
private let ismpLabsR5 = CitationSource(
    id: "ismp_labs_round5",
    shortName: "ISMP narrow-therapeutic-index drug guidance (concept citation)",
    publisher: "Institute for Safe Medication Practices",
    license: .factCitationOnly,
    url: "https://www.ismp.org/recommendations/high-alert-medications-acute-list",
    lastRetrieved: "2026-05-04"
)
private let idsaLabsR5 = CitationSource(
    id: "idsa_labs_round5",
    shortName: "IDSA / ASHP vancomycin therapeutic monitoring guidelines (concept citation)",
    publisher: "Infectious Diseases Society of America",
    license: .factCitationOnly,
    url: "https://www.idsociety.org/practice-guideline/vancomycin/",
    lastRetrieved: "2026-05-04"
)

private let pharmLabsR5 = NCLEXTags(category: .physiologicalIntegrity, subcategory: .pharmacologicalAndParenteralTherapies, priorityConcept: .safety)

// MARK: - Lithium Level

public enum LithiumLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "lithium-level",
        title: "Lithium Level",
        subtitle: "Serum trough · bipolar maintenance · narrow therapeutic index",
        specimen: "Serum (gold- or red-top); trough drawn 12 hr after last dose",
        nclexTags: pharmLabsR5,
        referenceRanges: [
            ReferenceRangeRow(value: "Therapeutic acute mania: 0.8–1.2 mEq/L", label: "Therapeutic — acute (per primary source)", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: "Therapeutic maintenance: 0.6–1.0 mEq/L", label: "Therapeutic — maintenance", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: "Mild toxicity: 1.5–2.0 mEq/L", label: "Mild toxicity", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: "Severe toxicity: >2.0 mEq/L (life-threatening >2.5)", label: "Severe / life-threatening", citationIDs: ["openrn_labs_round5"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Mild lithium toxicity (1.5–2.0)",
                summary: "GI symptoms (nausea, diarrhea), tremor (worsened from baseline fine tremor), drowsiness, weakness, ataxia. Common precipitants: dehydration, low sodium intake, NSAID/ACEI/ARB/diuretic addition, infection, AKI.",
                nursingActions: [
                    "Hold lithium; notify provider",
                    "IV isotonic saline per provider — restores volume and natriuresis",
                    "Trend lithium level, BMP, creatinine; correct precipitant"
                ],
                citationIDs: ["openrn_labs_round5"]
            ),
            InterpretationTier(
                severity: .critical,
                label: "Severe lithium toxicity (>2.0)",
                summary: "Coarse tremor, hyperreflexia, fasciculations, confusion, seizures, cardiac arrhythmia, coma, renal failure. Hemodialysis indicated for severe levels (often >4 acute, >2.5 chronic with symptoms) per primary source.",
                nursingActions: [
                    "Activate rapid response / nephrology / poison control per facility",
                    "Stop all lithium; aggressive isotonic IV fluids; electrolyte correction",
                    "Telemetry; seizure precautions; airway",
                    "Hemodialysis per nephrology"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH lithium level",
                causes: [
                    "Dehydration / decreased sodium intake (lithium reabsorbed with sodium)",
                    "AKI / CKD",
                    "NSAIDs, ACEI / ARB, thiazide diuretics — raise lithium levels",
                    "Excess intake (intentional overdose, dosing error)",
                    "Drug-drug interactions"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always draw lithium 12 hours after the last dose (\"12-hour trough\") per primary source — earlier draws are uninterpretable.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Reinforce CONSISTENT salt and fluid intake; counsel against new NSAIDs / OTC diuretics without checking with provider.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("In pregnancy: lithium clearance changes; closer monitoring; counsel on Ebstein's anomaly risk per primary source.", citationIDs: ["openrn_labs_round5"])
        ],
        watchFor: [
            AttributedBullet("Lithium toxicity is a medical emergency — symptoms can persist for days even after lithium discontinued; brain damage and death possible.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Long-term effects — nephrogenic diabetes insipidus (polyuria), hypothyroidism, hyperparathyroidism; trend renal function, TSH, calcium per primary source.", citationIDs: ["openrn_labs_round5"])
        ],
        citations: [openrnLabsR5, openstaxLabsR5, ismpLabsR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Valproic Acid Level

public enum ValproicAcidLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "valproic-acid-level",
        title: "Valproic Acid Level",
        subtitle: "Serum trough · seizure / bipolar · narrow therapeutic index",
        specimen: "Serum (red- or gold-top); trough drawn just before next dose",
        nclexTags: pharmLabsR5,
        referenceRanges: [
            ReferenceRangeRow(value: "50–100 mcg/mL — therapeutic for seizures", label: "Therapeutic — seizures", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: "50–125 mcg/mL — typical bipolar range (varies by guideline)", label: "Therapeutic — bipolar", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: ">125 mcg/mL — toxicity risk increases", label: "Toxic", citationIDs: ["openrn_labs_round5"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic VPA",
                summary: "GI upset, sedation, ataxia, tremor, hyperammonemia (encephalopathy possible without elevated LFTs), thrombocytopenia, pancreatitis, hepatotoxicity.",
                nursingActions: [
                    "Hold or reduce dose per provider",
                    "Trend ammonia level if AMS even with normal LFTs",
                    "Trend CBC (platelets), LFTs, lipase if abdominal pain",
                    "Review interacting medications (aspirin displaces VPA from protein → raises free fraction)"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH VPA level",
                causes: [
                    "Dose change without re-titration",
                    "Aspirin (high dose) — displaces from protein binding",
                    "Hepatic dysfunction reduces clearance",
                    "Drug interactions — felbamate raises VPA"
                ],
                citationIDs: ["openrn_labs_round5"]
            ),
            CauseGroup(
                title: "Causes of LOW VPA level",
                causes: [
                    "Missed doses",
                    "Strong inducers (carbamazepine, phenytoin, rifampin, phenobarbital)",
                    "Pregnancy (clearance increases)"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always draw TROUGH; document last dose time and any aspirin / NSAID use.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("If AMS is present with hyperammonemia + normal LFTs, consider VPA-induced hyperammonemic encephalopathy (carnitine may be considered per primary source).", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Pregnancy: VPA is teratogenic — avoid for migraine prophylaxis; risk-benefit for seizure / bipolar control per primary source.", citationIDs: ["openrn_labs_round5"])
        ],
        watchFor: [
            AttributedBullet("Hyperammonemic encephalopathy — confusion in a stable patient on VPA; check ammonia.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Pancreatitis — abdominal pain, vomiting; check lipase.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Severe hepatotoxicity — most common <2 yr, polypharmacy; check LFTs.", citationIDs: ["openrn_labs_round5"])
        ],
        citations: [openrnLabsR5, openstaxLabsR5, ismpLabsR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Carbamazepine Level

public enum CarbamazepineLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "carbamazepine-level",
        title: "Carbamazepine Level",
        subtitle: "Serum trough · seizures / bipolar / trigeminal neuralgia",
        specimen: "Serum (red- or gold-top); trough drawn just before next dose",
        nclexTags: pharmLabsR5,
        referenceRanges: [
            ReferenceRangeRow(value: "4–12 mcg/mL — therapeutic", label: "Therapeutic", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: ">12 mcg/mL — toxicity risk", label: "Toxic", citationIDs: ["openrn_labs_round5"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic carbamazepine",
                summary: "Drowsiness, dizziness, ataxia, diplopia, nystagmus, nausea, vomiting; severe — seizures, coma, cardiac conduction disturbance, hyponatremia (SIADH).",
                nursingActions: [
                    "Hold dose per provider",
                    "Telemetry if level very high (cardiac conduction effects)",
                    "Trend Na (SIADH risk), CBC, LFTs",
                    "Review for new CYP3A4 inhibitor (azoles, macrolides, grapefruit, diltiazem) per primary source"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of HIGH carbamazepine level",
                causes: [
                    "CYP3A4 inhibitors — azoles, macrolides (clarithromycin), grapefruit, diltiazem, verapamil, cimetidine",
                    "Hepatic dysfunction",
                    "Dose change without re-equilibration"
                ],
                citationIDs: ["openrn_labs_round5"]
            ),
            CauseGroup(
                title: "Causes of LOW carbamazepine level",
                causes: [
                    "Auto-induction (CBZ self-induces metabolism over 4–8 weeks → levels fall on stable dose)",
                    "Other inducers (phenytoin, phenobarbital, rifampin, St. John's wort)",
                    "Missed doses"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        nursingActions: [
            AttributedBullet("Counsel on auto-induction — initial therapeutic level may fall over weeks; redrawn levels and dose adjustments are routine.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Monitor sodium (SIADH common, dose-related), CBC (aplastic anemia risk), LFTs.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Patients of Asian ancestry: HLA-B*1502 testing before initiation per primary source — SJS/TEN risk.", citationIDs: ["openrn_labs_round5"])
        ],
        watchFor: [
            AttributedBullet("New rash → STOP and notify; SJS/TEN risk especially in HLA-B*1502 carriers.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Aplastic anemia / agranulocytosis — fever, sore throat, easy bruising; check CBC.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Hyponatremia → confusion in elderly; check sodium when AMS develops.", citationIDs: ["openrn_labs_round5"])
        ],
        citations: [openrnLabsR5, openstaxLabsR5, ismpLabsR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

// MARK: - Phenytoin Level

public enum PhenytoinLevelSample {
    public static let entry: LabEntry = LabEntry(
        id: "phenytoin-level",
        title: "Phenytoin Level",
        subtitle: "Total + free serum levels · seizure prophylaxis · saturable kinetics",
        specimen: "Serum (red- or gold-top); trough drawn just before next dose",
        nclexTags: pharmLabsR5,
        referenceRanges: [
            ReferenceRangeRow(value: "Total: 10–20 mcg/mL", label: "Therapeutic — total", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: "Free: 1–2 mcg/mL", label: "Therapeutic — free (unbound)", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: ">20 mcg/mL — toxicity risk", label: "Toxic", citationIDs: ["openrn_labs_round5"]),
            ReferenceRangeRow(value: "Albumin correction: corrected = measured / [(0.2 × albumin) + 0.1]", label: "Correction in low albumin", citationIDs: ["openrn_labs_round5"])
        ],
        interpretationTiers: [
            InterpretationTier(
                severity: .high,
                label: "Supratherapeutic phenytoin",
                summary: "Saturable (zero-order) kinetics → small dose changes → large level changes. Toxicity progresses with level: 20–30 nystagmus, 30–40 ataxia, >40 lethargy/coma, dysrhythmia. Paradoxic seizures at very high levels.",
                nursingActions: [
                    "Hold dose per provider",
                    "Telemetry — bradycardia, hypotension; if IV phenytoin given too rapidly: cardiotoxicity",
                    "Check albumin and free phenytoin if total appears low/normal but symptoms suggest toxicity",
                    "Trend levels q12–24 h until therapeutic"
                ],
                citationIDs: ["openrn_labs_round5"]
            ),
            InterpretationTier(
                severity: .low,
                label: "Subtherapeutic phenytoin",
                summary: "Risk of breakthrough seizures. Common causes: missed doses, malabsorption, drug interactions (rifampin, carbamazepine, sucralfate, antacids, tube-feeding adsorption), pregnancy.",
                nursingActions: [
                    "Verify dose, timing, missed doses",
                    "Hold tube feeds 1–2 hours before/after PO phenytoin per primary source — significant binding",
                    "Review interacting drugs"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        commonCauses: [
            CauseGroup(
                title: "Causes of altered phenytoin levels",
                causes: [
                    "Saturable kinetics — small dose change → big level change at higher levels",
                    "Hypoalbuminemia → low total but normal/high free (corrected)",
                    "Tube feeds reduce absorption → falsely low",
                    "CYP inducers and inhibitors — many"
                ],
                citationIDs: ["openrn_labs_round5"]
            )
        ],
        nursingActions: [
            AttributedBullet("Always confirm specimen is TROUGH; document last dose time and albumin.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("IV phenytoin: do NOT exceed 50 mg/min infusion rate (adult) per primary source — purple-glove syndrome and cardiotoxicity; fosphenytoin preferred when faster loading needed.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Hold enteral feeds 1–2 hours pre- and post-PO phenytoin to avoid binding losses.", citationIDs: ["openrn_labs_round5"])
        ],
        watchFor: [
            AttributedBullet("Severe hypersensitivity (DRESS, SJS/TEN) — fever, rash, eosinophilia, hepatitis; STOP and escalate.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Gingival hyperplasia, hirsutism, coarse facial features — long-term toxicity.", citationIDs: ["openrn_labs_round5"]),
            AttributedBullet("Cerebellar findings (nystagmus, ataxia) → indicator of supratherapeutic level.", citationIDs: ["openrn_labs_round5"])
        ],
        citations: [openrnLabsR5, openstaxLabsR5, ismpLabsR5],
        lastSourceFidelityReview: "2026-05-04"
    )
}

