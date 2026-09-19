import Foundation

// Tier A drafts are excluded from Release until independent clinical review.
enum ICUEvidenceDrafts {
    static let entries: [LibraryEntry] = {
#if DEBUG && ICU_EVIDENCE_REVIEW
        return [
            .reference(entry0),
            .reference(entry1),
            .reference(entry2),
            .reference(entry3),
            .reference(entry4),
            .reference(entry5),
            .reference(entry6),
            .reference(entry7),
            .reference(entry8),
            .reference(entry9),
            .diagnosis(entry10),
            .drug(entry11),
            .drug(entry12),
            .drug(entry13),
            .diagnosis(entry14),
            .reference(entry15)
        ]
#else
        return []
#endif
    }()

#if DEBUG && ICU_EVIDENCE_REVIEW
    private static let entry0 = ReferenceEntry(
        id: "icu-preoxygenation-evidence",
        title: "Preoxygenation & peri-intubation oxygenation",
        subtitle: "PREOXI and PreVent · different phases of the airway sequence",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Before induction: PREOXI", [
            .init("PREOXI randomized 1,301 critically ill adults in emergency departments and ICUs to noninvasive ventilation or an oxygen mask for preoxygenation. Its primary endpoint was oxygen saturation below 85% between induction and two minutes after intubation. This endpoint describes peri-intubation hypoxemia, rather than later ventilator outcomes.", citationIDs: ["icu_evidence_preoxi"]),
            .init("Hypoxemia occurred in 9.1% with noninvasive ventilation versus 18.5% with an oxygen mask; the absolute difference was −9.4 percentage points (95% CI −13.2 to −5.6). The trial supports better oxygenation for eligible patients under the studied preparation strategy.", citationIDs: ["icu_evidence_preoxi"]),
            .init("Patients needing immediate intubation or with vomiting, hematemesis or other reasons making noninvasive ventilation inappropriate were excluded. Reported aspiration was uncommon; the trial cannot establish safety in populations deliberately excluded. The result does not make a mask interface suitable for every threatened airway.", citationIDs: ["icu_evidence_preoxi"])
        ]),
            .bullets(title: "Between induction and laryngoscopy: PreVent", [
            .init("PreVent randomized 401 ICU adults to bag-mask ventilation or no ventilation between induction and laryngoscopy. Median lowest oxygen saturation was 96% versus 93%. Severe hypoxemia, defined as saturation below 80%, occurred in 10.9% versus 22.8%; it was a secondary outcome.", citationIDs: ["icu_evidence_prevent"]),
            .init("Operator-reported aspiration occurred in 2.5% versus 4.0%, without a statistically significant difference. An uncommon complication and a modest sample limit conclusions about aspiration safety. These findings do not prove that ventilation is harmless for a patient with a high aspiration risk.", citationIDs: ["icu_evidence_prevent"]),
            .init("PreVent studied oxygenation during an ICU intubation sequence; it did not establish a mortality benefit or compare bag-mask ventilation directly with noninvasive ventilation. Its oxygen-saturation threshold also differed from PREOXI, so event percentages should not be treated as a head-to-head comparison of devices.", citationIDs: ["icu_evidence_prevent"])
        ])
        ],
        citations: [ICUEvidenceSources.preoxi, ICUEvidenceSources.prevent],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry1 = ReferenceEntry(
        id: "icu-intubation-first-pass-evidence",
        title: "First-attempt intubation evidence",
        subtitle: "Video laryngoscopy, bougie and stylet · DEVICE and BOUGIE",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Laryngoscope choice: DEVICE", [
            .init("DEVICE randomized 1,417 critically ill adults undergoing emergency intubation to video or direct laryngoscopy. Successful intubation on the first attempt occurred in 85.1% with video laryngoscopy and 70.8% with direct laryngoscopy, an absolute difference of 14.3 percentage points.", citationIDs: ["icu_evidence_device"]),
            .init("The endpoint was successful tube placement during the first attempt. A better first-attempt rate is not itself proof of improved survival or freedom from every intubation complication. Severe complications did not differ significantly between groups.", citationIDs: ["icu_evidence_device"]),
            .init("Most intubations were performed by emergency-medicine residents or critical-care fellows. Applicability depends on operator experience, training and equipment. The trial addresses the laryngoscope used for an emergency attempt; it does not replace a difficult-airway assessment or establish one device as appropriate for every anatomical problem.", citationIDs: ["icu_evidence_device"])
        ]),
            .bullets(title: "Tube delivery: BOUGIE", [
            .init("BOUGIE compared a bougie with an endotracheal tube and stylet in 1,102 critically ill adults at multiple emergency departments and ICUs. First-attempt success was 80.4% with a bougie versus 83.0% with a stylet. The difference was not statistically significant.", citationIDs: ["icu_evidence_bougie"]),
            .init("The absolute difference was −2.6 percentage points, with a 95% confidence interval from −7.3 to 2.2. This does not establish equivalence or show that a bougie is ineffective in every selected difficult airway. It tests routine initial use in the enrolled population.", citationIDs: ["icu_evidence_bougie"]),
            .init("Laryngoscope choice and tube-delivery choice are different decisions. BOUGIE did not randomize video versus direct laryngoscopy, and its result should not be used to contradict DEVICE. Familiarity with the assigned introducer and the clinical setting matter when translating a trial average into a local airway plan.", citationIDs: ["icu_evidence_bougie"])
        ])
        ],
        citations: [ICUEvidenceSources.device, ICUEvidenceSources.bougie],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry2 = ReferenceEntry(
        id: "high-risk-extubation-support",
        title: "High-risk extubation & preventive support",
        subtitle: "HIGH-WEAN and AARC · readiness, prevention and reintubation",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "What HIGH-WEAN tested", [
            .init("HIGH-WEAN studied adults at increased risk of extubation failure because they were older than 65 years or had underlying cardiac or respiratory disease. It compared high-flow nasal oxygen alternating with noninvasive ventilation immediately after extubation against high-flow nasal oxygen alone.", citationIDs: ["icu_evidence_highwean"]),
            .init("Among 641 patients completing the trial, reintubation by day 7 occurred in 11.8% with combined support versus 18.2% with high-flow oxygen alone. The absolute difference was −6.4 percentage points (95% CI −12.0 to −0.9). ICU mortality did not differ significantly.", citationIDs: ["icu_evidence_highwean"]),
            .init("This was preventive support after planned extubation in selected high-risk adults. It was not a trial of postponing necessary reintubation during established respiratory failure. The prevention result should not be generalized to all low-risk patients or used to reinterpret progressive deterioration as successful liberation.", citationIDs: ["icu_evidence_highwean"])
        ]),
            .bullets(title: "Readiness is broader than one number", [
            .init("The 2024 AARC guideline conditionally supports spontaneous breathing trials with or without pressure support. It does not require the rapid shallow breathing index to determine readiness for a trial. A standardized daily approach can organize assessment, while the individual response remains central.", citationIDs: ["icu_evidence_aarc_sbt"]),
            .init("Liberation from ventilatory assistance and removal of the endotracheal tube are related but different decisions. Passing a breathing trial does not establish adequate airway protection, cough or secretion clearance. These additional considerations help explain why a patient can pass a trial yet remain at risk after extubation.", citationIDs: ["icu_evidence_aarc_sbt"]),
            .init("AARC suggests that inspired oxygen should not be increased during a spontaneous breathing trial. Increasing support can obscure intolerance. Trial technique, baseline oxygen requirement and the observed response therefore belong together when the multidisciplinary team interprets the result.", citationIDs: ["icu_evidence_aarc_sbt"])
        ])
        ],
        citations: [ICUEvidenceSources.highwean, ICUEvidenceSources.aarc_sbt],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry3 = ReferenceEntry(
        id: "ards-treatment-evidence",
        title: "ARDS treatment evidence",
        subtitle: "ATS 2024 and ROSE · ventilation, paralysis and uncertainty",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Guideline recommendations are not equally certain", [
            .init("The ATS update retains lung-protective ventilation with tidal volumes based on predicted body weight and limitation of inspiratory pressure, alongside prolonged prone positioning for severe ARDS. These established measures remain the background against which additional therapies are evaluated.", citationIDs: ["icu_evidence_ats_ards"]),
            .init("The 2024 panel conditionally supports corticosteroids, selected use of venovenous ECMO, neuromuscular blockers in early severe ARDS, and higher PEEP without recruitment maneuvers in moderate-to-severe ARDS. Evidence certainty and patient selection differ across these recommendations; they are not a single universal bundle.", citationIDs: ["icu_evidence_ats_ards"]),
            .init("ATS strongly recommends against prolonged lung recruitment maneuvers in moderate-to-severe ARDS. Its conditional steroid recommendation does not identify one regimen appropriate for all causes, severities or phases of disease. Conditional recommendations require attention to the clinical context and the balance of benefits and harms.", citationIDs: ["icu_evidence_ats_ards"])
        ]),
            .bullets(title: "What ROSE adds about neuromuscular blockade", [
            .init("ROSE compared early continuous cisatracurium with deep sedation against usual care with lighter sedation targets in moderate-to-severe ARDS. Both groups received a strategy using higher PEEP. The trial therefore compared treatment strategies, not an isolated paralytic exposure with otherwise identical sedation.", citationIDs: ["icu_evidence_rose"]),
            .init("In-hospital mortality by day 90 was 42.5% in the intervention group and 42.8% in usual care, without a significant difference. The trial was stopped for futility. These findings do not support assuming that routine early paralysis confers a survival advantage in this population.", citationIDs: ["icu_evidence_rose"]),
            .init("The intervention group had more cardiovascular adverse events and less physical activity. The null mortality result does not answer every question about short-term rescue use in selected patients, nor prove equivalence between all sedation and paralysis strategies. Routine treatment and selected rescue use are separate evidence questions.", citationIDs: ["icu_evidence_rose"])
        ])
        ],
        citations: [ICUEvidenceSources.ats_ards, ICUEvidenceSources.rose],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry4 = ReferenceEntry(
        id: "sepsis-fluid-strategy-evidence",
        title: "Sepsis fluid strategy evidence",
        subtitle: "CLOVERS, CLASSIC and SSC 2026 · initial versus subsequent fluids",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Early hypotension: CLOVERS", [
            .init("CLOVERS enrolled adults with sepsis-induced hypotension after initial treatment with 1–3 liters of intravenous fluid. For the next 24 hours it compared a restrictive strategy prioritizing earlier vasopressors with a liberal strategy prioritizing more fluid before vasopressors.", citationIDs: ["icu_evidence_clovers"]),
            .init("Death before discharge home by day 90 occurred in 14.0% versus 14.9%, without a significant difference. This was not simply all-cause mortality at a fixed follow-up visit. The trial did not test withholding initial resuscitation or compare a single fixed fluid dose for every patient.", citationIDs: ["icu_evidence_clovers"]),
            .init("Enrollment restrictions, including fluid overload and severe volume depletion from causes other than sepsis, limit extrapolation. The finding describes two monitored strategies in a selected population; it does not establish that later fluid or vasopressor decisions are interchangeable in an individual patient.", citationIDs: ["icu_evidence_clovers"])
        ]),
            .bullets(title: "Established ICU shock: CLASSIC", [
            .init("CLASSIC studied adults with septic shock in the ICU who had already received initial fluid. Restrictive and standard-fluid strategies produced different fluid exposure, but 90-day mortality was 42.3% versus 42.1%, without a significant difference.", citationIDs: ["icu_evidence_classic"]),
            .init("Serious adverse events and days alive without life support were also similar. CLASSIC addresses fluid after initial treatment in established ICU shock, whereas CLOVERS addresses an earlier hypotension phase. Comparing their raw mortality rates does not compare the quality or effectiveness of the two trials.", citationIDs: ["icu_evidence_classic"])
        ]),
            .bullets(title: "Current guideline context", [
            .init("SSC 2026 emphasizes frequent reassessment during initial crystalloid resuscitation. After initial resuscitation, it conditionally allows either a liberal or restrictive strategy according to patient and health-system factors. It also favors dynamic assessment over examination or static measures alone; these recommendations have low-certainty evidence.", citationIDs: ["icu_evidence_ssc2026"]),
            .init("The 2026 guidance recognizes that unstable septic shock may warrant concurrent fluids and vasopressors. A trial showing no average mortality difference between fluid strategies does not remove the need to recognize ongoing hypoperfusion, fluid intolerance or a rapidly changing clinical state.", citationIDs: ["icu_evidence_ssc2026"])
        ])
        ],
        citations: [ICUEvidenceSources.clovers, ICUEvidenceSources.classic, ICUEvidenceSources.ssc2026],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry5 = ReferenceEntry(
        id: "septic-shock-corticosteroid-evidence",
        title: "Corticosteroids in septic shock",
        subtitle: "ADRENAL, APROCCHSS and guideline context",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .perfusion),
        sections: [
            .bullets(title: "Hydrocortisone alone: ADRENAL", [
            .init("ADRENAL evaluated continuous hydrocortisone against placebo in mechanically ventilated adults with septic shock. Mortality at 90 days was 27.9% with hydrocortisone and 28.8% with placebo; the difference was not statistically significant.", citationIDs: ["icu_evidence_adrenal"]),
            .init("Shock resolved more quickly with hydrocortisone, with a median duration of 3 versus 4 days. Faster shock reversal and improved survival are different endpoints. A neutral mortality result does not erase the hemodynamic finding, and the hemodynamic finding does not establish a mortality benefit.", citationIDs: ["icu_evidence_adrenal"])
        ]),
            .bullets(title: "Combination therapy: APROCCHSS", [
            .init("APROCCHSS studied hydrocortisone plus fludrocortisone against placebo in adults with persistent septic shock and organ dysfunction. Among 1,241 randomized patients, 90-day mortality was 43.0% with the combination versus 49.1% with placebo, a statistically significant difference.", citationIDs: ["icu_evidence_aprocchss"]),
            .init("The trial tested the combination against placebo, not against hydrocortisone alone. It cannot isolate the contribution of fludrocortisone. Differences in eligibility, illness severity and treatment design also prevent a direct head-to-head conclusion by comparing APROCCHSS with ADRENAL.", citationIDs: ["icu_evidence_aprocchss"])
        ]),
            .bullets(title: "How the guidance frames these results", [
            .init("The SCCM 2024 focused update conditionally supports corticosteroids in adult septic shock. It recommends against high-dose, short-duration corticosteroid treatment. The recommendation concerns septic shock; recommendations for ARDS and severe community-acquired pneumonia address different populations and should not be merged into one indication.", citationIDs: ["icu_evidence_steroids"]),
            .init("SCCM describes the septic-shock recommendation as conditional, reflecting uncertainty and tradeoffs across outcomes. The studies inform a clinician-directed regimen and monitoring plan; they do not provide a patient-specific order or demonstrate that all steroid preparations, routes and durations have the same effects.", citationIDs: ["icu_evidence_steroids"]),
            .init("SSC 2026 also conditionally suggests intravenous corticosteroids for adult septic shock, with low certainty of evidence. Guideline support should be read alongside the differing trial outcomes, rather than presented as proof of a universal survival benefit.", citationIDs: ["icu_evidence_ssc2026"])
        ])
        ],
        citations: [ICUEvidenceSources.adrenal, ICUEvidenceSources.aprocchss, ICUEvidenceSources.steroids, ICUEvidenceSources.ssc2026],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry6 = ReferenceEntry(
        id: "aki-kidney-support-timing",
        title: "AKI & timing of kidney support",
        subtitle: "STARRT-AKI and IDEAL-ICU · monitored deferral and urgent indications",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes),
        sections: [
            .bullets(title: "Accelerated initiation: STARRT-AKI", [
            .init("STARRT-AKI compared accelerated kidney replacement therapy within 12 hours of eligibility with a standard strategy that discouraged initiation until conventional indications developed or AKI persisted beyond 72 hours. It enrolled critically ill adults for whom immediate treatment was not already clearly necessary.", citationIDs: ["icu_evidence_starrt"]),
            .init("In the modified intention-to-treat population of 2,927 patients, 90-day mortality was 43.9% with accelerated treatment and 43.7% with the standard strategy. The trial did not show a survival benefit from routinely accelerating treatment in this setting.", citationIDs: ["icu_evidence_starrt"]),
            .init("Among survivors at 90 days, ongoing dialysis dependence was 10.4% versus 6.0%. This secondary endpoint uses survivors as its denominator and must not be described as the proportion of all randomized patients. Accelerated treatment also exposed more patients to kidney replacement therapy.", citationIDs: ["icu_evidence_starrt"]),
            .init("The trial excluded patients already judged to need emergency treatment. Its timing thresholds are study design features, not mandatory waiting periods for a patient developing life-threatening complications.", citationIDs: ["icu_evidence_starrt"])
        ]),
            .bullets(title: "Septic shock: IDEAL-ICU", [
            .init("IDEAL-ICU studied adults with septic shock and severe AKI without an immediate life-threatening indication for dialysis. It compared early initiation with a delayed strategy allowing time for recovery; emergency criteria could trigger treatment before the planned delay ended.", citationIDs: ["icu_evidence_ideal"]),
            .init("The trial stopped early for futility and found no significant difference in 90-day mortality. Some patients assigned to delayed treatment recovered without dialysis. These findings support studying monitored deferral, rather than assuming severe AKI always requires immediate extracorporeal treatment.", citationIDs: ["icu_evidence_ideal"]),
            .init("Early termination limits precision. The comparison also cannot establish the best dialysis modality, ultrafiltration goal or anticoagulation strategy. Those are separate questions from when to begin treatment, and changes in electrolyte, acid-base, fluid or overall clinical status can alter urgency.", citationIDs: ["icu_evidence_ideal"])
        ]),
            .bullets(title: "Current sepsis guidance", [
            .init("SSC 2026 suggests against kidney replacement therapy for adults with sepsis-associated AKI who lack definitive indications. This is conditional guidance, not permission to defer treatment when urgent indications emerge.", citationIDs: ["icu_evidence_ssc2026"])
        ])
        ],
        citations: [ICUEvidenceSources.starrt, ICUEvidenceSources.ideal, ICUEvidenceSources.ssc2026],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry7 = ReferenceEntry(
        id: "icu-stress-ulcer-prophylaxis",
        title: "Stress ulcer prophylaxis in the ICU",
        subtitle: "REVISE and SCCM / ASHP · bleeding risk and discontinuation",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .safety),
        sections: [
            .bullets(title: "What REVISE demonstrated", [
            .init("REVISE randomized 4,821 critically ill adults undergoing invasive ventilation to intravenous pantoprazole or placebo. Clinically important upper gastrointestinal bleeding occurred in 1.0% versus 3.5%; the hazard ratio was 0.30 (95% CI 0.19–0.47).", citationIDs: ["icu_evidence_revise"]),
            .init("Mortality at 90 days was 29.1% versus 30.9%, without a statistically significant difference. The reduction in clinically important bleeding should not be rewritten as a proven survival benefit. The trial addressed prevention during critical illness, not treatment of an existing gastrointestinal hemorrhage.", citationIDs: ["icu_evidence_revise"]),
            .init("The study evaluated a particular proton-pump inhibitor against placebo in invasively ventilated adults. It did not compare every acid-suppressive drug or establish an indication for indefinite treatment after ICU recovery. Ventilator-associated pneumonia and Clostridioides difficile infection were also assessed as secondary outcomes.", citationIDs: ["icu_evidence_revise"])
        ]),
            .bullets(title: "Risk-based use and a stopping point", [
            .init("The 2024 SCCM / ASHP guideline identifies coagulopathy, shock and chronic liver disease as factors likely to increase stress-related clinically important bleeding risk. It found no firm evidence that mechanical ventilation alone is an independent risk factor. A trial enrollment characteristic and a validated risk factor are different concepts.", citationIDs: ["icu_evidence_sup"]),
            .init("For critically ill adults with risk factors, the guideline supports low-dose proton-pump inhibitor or histamine-2 receptor antagonist prophylaxis. Enteral nutrition probably lowers bleeding risk, but feeding alone does not necessarily remove an indication in someone who remains at high risk.", citationIDs: ["icu_evidence_sup"]),
            .init("The guideline calls for stopping prophylaxis when critical illness or the relevant risk factors resolve and before ICU transfer unless another indication remains. Medication reconciliation should distinguish an ICU prevention indication from an established gastrointestinal condition requiring continuing treatment.", citationIDs: ["icu_evidence_sup"])
        ])
        ],
        citations: [ICUEvidenceSources.revise, ICUEvidenceSources.sup],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry8 = ReferenceEntry(
        id: "icu-sedation-drug-evidence",
        title: "Dexmedetomidine & propofol evidence",
        subtitle: "MENDS2 and PADIS 2025 · goals, population and outcomes",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .neurologicalRegulation),
        sections: [
            .bullets(title: "What MENDS2 compared", [
            .init("MENDS2 compared dexmedetomidine with propofol in mechanically ventilated adults with sepsis. Of 432 randomized patients, 422 received a trial drug and were analyzed. Bedside clinicians used sedation goals within the study care approach; the trial was not a comparison with no sedation.", citationIDs: ["icu_evidence_mends"]),
            .init("The primary outcome, days alive without delirium or coma during the first 14 days, did not differ significantly. Ventilator-free days, 90-day mortality and later cognition also showed no significant between-group differences. The trial therefore did not establish a sepsis survival advantage for dexmedetomidine over propofol.", citationIDs: ["icu_evidence_mends"]),
            .init("A result in ventilated adults with sepsis should not automatically be extended to every procedural, neurologic or postoperative sedation setting. The trial compares particular strategies and patient-centered outcomes; it does not establish that the drugs have identical pharmacology or are interchangeable for every sedation depth.", citationIDs: ["icu_evidence_mends"])
        ]),
            .bullets(title: "How PADIS 2025 qualifies its recommendation", [
            .init("The 2025 PADIS focused update conditionally suggests dexmedetomidine over propofol for mechanically ventilated adults when achieving light sedation or reducing delirium is among the highest priorities. The panel rates the evidence as moderate certainty. The qualifying treatment goals are part of the recommendation.", citationIDs: ["icu_evidence_padis"]),
            .init("The recommendation should not be shortened to a rule that dexmedetomidine is always the preferred ICU sedative. It addresses a defined decision and weighs a broader evidence base than a single sepsis trial. The guideline and MENDS2 therefore answer related questions with different scope.", citationIDs: ["icu_evidence_padis"]),
            .init("A useful evidence discussion states the intended sedation goal, the population studied and the outcome sought. A conditional recommendation aimed at light sedation does not establish superiority for deep sedation, prolonged paralysis or all forms of acute brain injury. Those uses require their own clinical assessment and supporting evidence.", citationIDs: ["icu_evidence_padis"])
        ])
        ],
        citations: [ICUEvidenceSources.mends, ICUEvidenceSources.padis],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry9 = ReferenceEntry(
        id: "remimazolam-procedural-sedation-evidence",
        title: "Remimazolam procedural sedation evidence",
        subtitle: "Bronchoscopy trial · efficacy, rescue treatment and monitoring",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .safety),
        sections: [
            .bullets(title: "The phase 3 bronchoscopy study", [
            .init("The multicenter bronchoscopy trial compared remimazolam with placebo and an open-label midazolam arm. Procedural success was a composite: completion, no rescue sedative and no excess study-drug dosing beyond the protocol. This endpoint is more specific than simply whether bronchoscopy was eventually completed.", citationIDs: ["icu_evidence_remi_trial"]),
            .init("Success occurred in 80.6% with remimazolam, 4.8% with placebo and 32.9% with midazolam. The protocol allowed rescue sedation, so the placebo result does not describe bronchoscopy without access to sedation. Recovery to full alertness was faster with remimazolam under the tested conditions.", citationIDs: ["icu_evidence_remi_trial"]),
            .init("The midazolam arm was open-label and followed a specified dosing protocol. These design features limit broad claims of superiority over all usual-care benzodiazepine regimens. The study did not compare prolonged ICU infusions, establish a mortality advantage or demonstrate superiority over propofol.", citationIDs: ["icu_evidence_remi_trial"])
        ]),
            .bullets(title: "The labeled setting and its safeguards", [
            .init("The United States label covers induction and maintenance of procedural sedation in adults for procedures lasting 30 minutes or less. That indication is not approval for continuous sedation of mechanically ventilated ICU patients. The setting, duration and intended sedation depth matter when interpreting the bronchoscopy evidence.", citationIDs: ["icu_evidence_remi_label"]),
            .init("The boxed warning requires personnel trained in procedural sedation and rescue who are not conducting the procedure. Continuous monitoring extends through recovery. Capnography, pulse oximetry and clinical assessment address ventilation and oxygenation, while immediate rescue capability remains necessary even with a short-acting drug.", citationIDs: ["icu_evidence_remi_label"]),
            .init("Opioids and other central nervous system depressants can intensify sedation and respiratory depression. A favorable average recovery time in a trial does not eliminate these interactions or justify reduced observation during recovery.", citationIDs: ["icu_evidence_remi_label"]),
            .init("ISMP includes intravenous moderate-sedation agents in its acute-care high-alert medication classes. This classification concerns the potential consequences of medication error; it is not a statement that one sedative has a higher observed adverse-event rate than another.", citationIDs: ["icu_evidence_ismp"])
        ])
        ],
        citations: [ICUEvidenceSources.remi_trial, ICUEvidenceSources.remi_label, ICUEvidenceSources.ismp],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry10 = DiagnosisEntry(
        id: "hepatorenal-syndrome-aki",
        title: "Hepatorenal syndrome–AKI",
        subtitle: "HRS-AKI · cirrhosis, diagnostic change and treatment evidence",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .fluidElectrolytes),
        definition: .init("HRS-AKI is a form of acute kidney injury in advanced cirrhosis with ascites. The 2024 ADQI / ICA consensus recognizes that it can coexist with tubular injury, proteinuria or pre-existing chronic kidney disease.", citationIDs: ["icu_evidence_adqi"]),
        pathophysiology: .init("Circulatory dysfunction in advanced cirrhosis can impair kidney perfusion; more than one mechanism of AKI may be present. The HRS label should not stop evaluation for infection, volume depletion, nephrotoxic exposure or an alternative primary kidney process.", citationIDs: ["icu_evidence_adqi"]),
        presentation: [
            .init("A rising creatinine or falling urine output in a patient with cirrhosis and ascites prompts an AKI assessment; these findings alone do not establish HRS-AKI.", citationIDs: ["icu_evidence_adqi"])
        ],
        diagnosticCriteria: [
            .init("The consensus AKI threshold is a creatinine increase of at least 0.3 mg/dL in 48 hours or at least 50% within 7 days, and/or urine output at or below 0.5 mL/kg/h for at least 6 hours.", citationIDs: ["icu_evidence_adqi"]),
            .init("HRS-AKI assessment includes failure to improve within 24 hours after adequate volume resuscitation when indicated, and no strong evidence that another process primarily explains the AKI. Routine albumin administration for 48 hours is no longer a required diagnostic prerequisite.", citationIDs: ["icu_evidence_adqi"])
        ],
        priorityAssessments: [
            .init("The terlipressin label emphasizes baseline oxygenation and volume status. Hypoxia, worsening respiratory symptoms and ongoing coronary, peripheral or mesenteric ischemia are contraindications. Volume overload and severe acute-on-chronic liver failure increase respiratory risk.", citationIDs: ["icu_evidence_terli_label"])
        ],
        commonInterventions: [
            .init("CONFIRM randomized 300 adults with the older HRS-1 phenotype to terlipressin or placebo alongside albumin. Verified HRS reversal occurred in 32% versus 17% in the published primary analysis. Kidney-function improvement was accompanied by important respiratory harms; reversal should not be equated with improved survival.", citationIDs: ["icu_evidence_confirm"]),
            .init("CONFIRM used an older HRS definition and selected eligibility criteria. Its albumin challenge and enrollment creatinine threshold are trial features, not a replacement for updated HRS-AKI diagnostic assessment. It does not establish efficacy for every AKI occurring in cirrhosis.", citationIDs: ["icu_evidence_confirm"])
        ],
        watchFor: [
            .init("The label warns that respiratory failure or ischemia during terlipressin treatment may jeopardize transplant eligibility. An improving creatinine does not by itself establish an acceptable overall treatment response when respiratory or ischemic complications develop.", citationIDs: ["icu_evidence_terli_label"])
        ],
        citations: [ICUEvidenceSources.adqi, ICUEvidenceSources.terli_label, ICUEvidenceSources.confirm],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry11 = DrugEntry(
        id: "terlipressin",
        title: "Terlipressin",
        subtitle: "Terlivaz · adult hepatorenal syndrome",
        category: "Vasopressin analogue",
        isHighAlert: false,
        isHighRisk: true,
        quickReference: [],
        indications: .init("TERLIVAZ is indicated to improve kidney function in adults with hepatorenal syndrome with rapid reduction in kidney function.\n\nPatients with a serum creatinine > 5 mg/dL are unlikely to experience benefit.", citationIDs: ["icu_evidence_terli_label"]),
        mechanism: .init("Terlipressin is a synthetic vasopressin analogue with twice the selectivity for vasopressin V1 receptors versus V2 receptors. Terlipressin acts as both a prodrug for lysine-vasopressin, as well as having pharmacologic activity on its own. Terlipressin is thought to increase renal blood flow in patients with hepatorenal syndrome by reducing portal hypertension and blood circulation in portal vessels and increasing effective arterial volume and mean arterial pressure (MAP).", citationIDs: ["icu_evidence_terli_label"]),
        dosing: [],
        contraindications: .init("TERLIVAZ is contraindicated in patients experiencing hypoxia or worsening respiratory symptoms.\n\nTERLIVAZ is contraindicated in patients with ongoing coronary, peripheral, or mesenteric ischemia.", citationIDs: ["icu_evidence_terli_label"]),
        warnings: [
            .init("WARNING: SERIOUS OR FATAL RESPIRATORY FAILURE\n\nTERLIVAZ may cause serious or fatal respiratory failure. Patients with volume overload or with acute-on-chronic liver failure (ACLF) Grade 3 are at increased risk.\n\nAssess oxygenation saturation (e.g., SpO2) before initiating TERLIVAZ. Do not initiate TERLIVAZ in patients experiencing hypoxia (e.g., SpO2 <90%) until oxygenation levels improve. Monitor patients for hypoxia using continuous pulse oximetry during treatment and discontinue TERLIVAZ if SpO2 decreases below 90%.", citationIDs: ["icu_evidence_terli_label"]),
            .init("In the primary clinical trial, serious or fatal respiratory failure occurred in 14% of patients treated with TERLIVAZ compared to 5% of patients on placebo.", citationIDs: ["icu_evidence_terli_label"]),
            .init("Patients with fluid overload may be at increased risk of respiratory failure. Manage intravascular volume overload by reducing or discontinuing the administration of albumin and/or other fluids and judicious use of diuretics. Temporarily interrupt, reduce, or discontinue TERLIVAZ treatment until patient volume status improves.", citationIDs: ["icu_evidence_terli_label"]),
            .init("Avoid use in patients with ACLF Grade 3 because they are at significant risk for respiratory failure.", citationIDs: ["icu_evidence_terli_label"]),
            .init("TERLIVAZ-related adverse reactions (respiratory failure, ischemia) may make a patient ineligible for liver transplantation, if listed. For patients with high prioritization for liver transplantation (e.g., MELD ≥ 35), the benefits of TERLIVAZ may not outweigh its risks.", citationIDs: ["icu_evidence_terli_label"]),
            .init("TERLIVAZ may cause cardiac, cerebrovascular, peripheral, or mesenteric ischemia. Avoid use of TERLIVAZ in patients with a history of severe cardiovascular conditions, cerebrovascular and ischemic disease. Discontinue TERLIVAZ in patients who experience signs or symptoms suggestive of ischemic adverse reactions.", citationIDs: ["icu_evidence_terli_label"]),
            .init("TERLIVAZ may cause fetal harm when administered to a pregnant woman based on the mechanism of action and data from published literature. Terlipressin induces uterine contractions and endometrial ischemia in both humans and animals.", citationIDs: ["icu_evidence_terli_label"])
        ],
        adverseReactions: .init("The most commonly observed adverse reactions in TERLIVAZ-treated patients (≥10%) were abdominal pain, nausea, respiratory failure, diarrhea, and dyspnea.", citationIDs: ["icu_evidence_terli_label"]),
        drugInteractions: [
            .init("In vitro studies in human liver microsomes demonstrated that there was little or no evidence that terlipressin was a direct-, time-, or metabolism-dependent inhibitor and inducer of any of the CYP enzymes evaluated. In addition, there was little or no evidence that terlipressin is an inhibitor and substrate of human ABC and SLC transporters. No significant drug-drug interactions are anticipated with TERLIVAZ.", citationIDs: ["icu_evidence_terli_label"])
        ],
        citations: [ICUEvidenceSources.terli_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry12 = DrugEntry(
        id: "remimazolam",
        title: "Remimazolam",
        subtitle: "Byfavo · adult procedural sedation",
        category: "Benzodiazepine sedative",
        isHighAlert: true,
        isHighRisk: false,
        quickReference: [],
        indications: .init("BYFAVO is indicated for the induction and maintenance of procedural sedation in adults undergoing procedures lasting 30 minutes or less.", citationIDs: ["icu_evidence_remi_label"]),
        mechanism: .init("BYFAVO is a benzodiazepine. BYFAVO binds to brain benzodiazepine sites (gamma amino butyric acid type A [GABAA] receptors), while its carboxylic acid metabolite (CNS7054) has a 300 times lower affinity for the receptor. BYFAVO, like other benzodiazepines, did not show clear selectivity between subtypes of the GABAA receptor.", citationIDs: ["icu_evidence_remi_label"]),
        dosing: [],
        contraindications: .init("BYFAVO is contraindicated in patients with a history of severe hypersensitivity reaction to dextran 40 or products containing dextran 40.", citationIDs: ["icu_evidence_remi_label"]),
        warnings: [
            .init("WARNING: PERSONNEL AND EQUIPMENT FOR MONITORING AND RESUSCITATION AND RISKS FROM CONCOMITANT USE WITH OPIOID ANALGESICS\n\nOnly personnel trained in the administration of procedural sedation, and not involved in the conduct of the diagnostic or therapeutic procedure, should administer BYFAVO. Administering personnel must be trained in the detection and management of airway obstruction, hypoventilation, and apnea, including the maintenance of a patent airway, supportive ventilation, and cardiovascular resuscitation.\n\nBYFAVO has been associated with hypoxia, bradycardia, and hypotension. Continuously monitor vital signs during sedation and during the recovery period. Resuscitative drugs, and age- and size-appropriate equipment for bag/valve/mask assisted ventilation must be immediately available during administration of BYFAVO.\n\nConcomitant use of benzodiazepines, including BYFAVO, and opioid analgesics may result in profound sedation, respiratory depression, coma, and death. The sedative effect of intravenous BYFAVO can be accentuated by concomitantly administered CNS depressant medications, including other benzodiazepines and propofol. Continuously monitor patients for respiratory depression and depth of sedation.", citationIDs: ["icu_evidence_remi_label"]),
            .init("BYFAVO can depress respiration. Continuously monitor patients for early signs of hypoventilation, airway obstruction, and apnea using capnography, pulse oximetry, and clinical assessment.", citationIDs: ["icu_evidence_remi_label"]),
            .init("Supplemental oxygen, resuscitative drugs, and age- and size-appropriate equipment for bag/valve/mask assisted ventilation must be immediately available during administration of BYFAVO. A benzodiazepine reversal agent should be immediately available.", citationIDs: ["icu_evidence_remi_label"]),
            .init("BYFAVO contains dextran 40, which can cause hypersensitivity reactions, including rash, urticaria, pruritus, and anaphylaxis.", citationIDs: ["icu_evidence_remi_label"]),
            .init("Intravenous moderate-sedation agents are an ISMP high-alert medication class.", citationIDs: ["icu_evidence_ismp"])
        ],
        adverseReactions: .init("BYFAVO has been associated with hypoxia, bradycardia, and hypotension.", citationIDs: ["icu_evidence_remi_label"]),
        drugInteractions: [
            .init("The sedative effect of intravenous BYFAVO can be accentuated by concomitantly administered CNS depressant medications, including opioid analgesics, other benzodiazepines, and propofol. Continuously monitor vital signs during sedation and through the recovery period. Titrate the dose of BYFAVO when administered with opioid analgesics and sedative-hypnotics to the desired clinical response.", citationIDs: ["icu_evidence_remi_label"])
        ],
        citations: [ICUEvidenceSources.remi_label, ICUEvidenceSources.ismp],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry13 = DrugEntry(
        id: "sulbactam-durlobactam",
        title: "Sulbactam–durlobactam",
        subtitle: "Xacduro · susceptible Acinetobacter pneumonia",
        category: "Beta-lactam antibacterial / beta-lactamase inhibitor",
        isHighAlert: false,
        isHighRisk: false,
        quickReference: [],
        indications: .init("XACDURO is indicated in patients 18 years of age and older for the treatment of hospital-acquired bacterial pneumonia and ventilator-associated bacterial pneumonia (HABP/VABP), caused by susceptible isolates of Acinetobacter baumannii-calcoaceticus complex.\n\nXACDURO is not indicated for the treatment of HABP/VABP caused by pathogens other than susceptible isolates of Acinetobacter baumannii-calcoaceticus complex.", citationIDs: ["icu_evidence_xacduro_label"]),
        mechanism: .init("XACDURO is a co-packaged product containing sulbactam and durlobactam. Sulbactam is a beta-lactam antibacterial and Ambler Class A serine beta-lactamase inhibitor that has bactericidal activity due to its inhibition of Acinetobacter baumannii-calcoaceticus complex (ABC) penicillin-binding proteins PBP1 and PBP3, which are essential enzymes required for bacterial cell wall synthesis.\n\nDurlobactam is a diazabicyclooctane non-beta-lactam, beta-lactamase inhibitor, that protects sulbactam from degradation by certain serine-beta-lactamases. Durlobactam alone does not have antibacterial activity against ABC isolates.", citationIDs: ["icu_evidence_xacduro_label"]),
        dosing: [],
        contraindications: .init("XACDURO is contraindicated in patients with a history of known severe hypersensitivity to the components of XACDURO (sulbactam and durlobactam), or other beta-lactam antibacterial drugs.", citationIDs: ["icu_evidence_xacduro_label"]),
        warnings: [
            .init("Serious and occasionally fatal hypersensitivity (anaphylactic) reactions and serious skin reactions have been reported in patients receiving beta-lactam antibacterial drugs. These reactions are more likely to occur in individuals with a history of beta-lactam hypersensitivity and/or a history of sensitivity to multiple allergens. Hypersensitivity was observed in patients treated with XACDURO in clinical trials.", citationIDs: ["icu_evidence_xacduro_label"]),
            .init("Before initiating therapy with XACDURO, careful inquiry should be made concerning previous hypersensitivity reactions to carbapenems, penicillins, cephalosporins, other beta lactams, and other allergens. Discontinue XACDURO if an allergic reaction occurs.", citationIDs: ["icu_evidence_xacduro_label"]),
            .init("Clostridioides difficile-associated diarrhea (CDAD) has been reported with use of nearly all antibacterial agents, including XACDURO, and may range in severity from mild diarrhea to fatal colitis. Treatment with antibacterial agents alters the normal flora of the colon leading to overgrowth of C. difficile.", citationIDs: ["icu_evidence_xacduro_label"]),
            .init("CDAD must be considered in all patients who present with diarrhea following antibacterial drug use. Careful medical history is necessary since CDAD has been reported to occur over two months after the administration of antibacterial agents.", citationIDs: ["icu_evidence_xacduro_label"]),
            .init("Prescribing XACDURO in the absence of a proven or strongly suspected bacterial infection or a prophylactic indication is unlikely to provide benefit to the patient and increases the risk of the development of drug-resistant bacteria.", citationIDs: ["icu_evidence_xacduro_label"]),
            .init("XACDURO is not active against ABC isolates that produce Ambler Class B metallo-beta-lactamases or have modification of active target site of sulbactam (i.e., PBPs).", citationIDs: ["icu_evidence_xacduro_label"])
        ],
        adverseReactions: .init("The most common adverse reactions reported in >10% of patients treated with XACDURO were liver test abnormalities, diarrhea, anemia, and hypokalemia.", citationIDs: ["icu_evidence_xacduro_label"]),
        drugInteractions: [
            .init("Concomitant administration with OAT1 inhibitors may increase plasma concentrations of sulbactam. Concomitant administration of OAT1 inhibitors (e.g., probenecid) with XACDURO is not recommended.", citationIDs: ["icu_evidence_xacduro_label"])
        ],
        citations: [ICUEvidenceSources.xacduro_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry14 = DiagnosisEntry(
        id: "carbapenem-resistant-acinetobacter-infection",
        title: "Carbapenem-resistant Acinetobacter infection",
        subtitle: "CRAB · infection versus colonization in critical illness",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        definition: .init("CRAB refers to carbapenem-resistant Acinetobacter baumannii complex. The 2026 IDSA treatment guidance addresses invasive infection; a resistant isolate in a respiratory or wound specimen does not by itself prove invasive disease.", citationIDs: ["icu_evidence_idsa2026"]),
        pathophysiology: .init("Acinetobacter can spread through contaminated equipment, surfaces and hands. It can also be carried without infection. The presence of the organism and the presence of a clinical infection therefore require separate interpretation.", citationIDs: ["icu_evidence_cdc_crab"]),
        presentation: [
            .init("Recognized infection sites include the lungs, bloodstream, urinary tract and wounds. ICU patients, people receiving mechanical ventilation, patients with catheters or open surgical wounds, and those with prolonged hospitalization are at increased risk.", citationIDs: ["icu_evidence_cdc_crab"])
        ],
        diagnosticCriteria: [
            .init("IDSA emphasizes distinguishing colonization from infection, especially with respiratory or wound cultures in ventilated patients and people with extensive burns. Underlying illness can also contribute substantially to poor outcomes; culture positivity alone should not be treated as a complete explanation for deterioration.", citationIDs: ["icu_evidence_idsa2026"]),
            .init("Culture and antimicrobial susceptibility testing identify which drugs have activity against the recovered organism. CDC describes treatment selection as depending on test results and patient factors, including adverse effects and drug interactions. A resistance label is not a substitute for the specific susceptibility report.", citationIDs: ["icu_evidence_cdc_crab"])
        ],
        priorityAssessments: [
            .init("CDC prevention priorities include hand hygiene and core infection-control practices, including environmental cleaning. Equipment contact, device care and wound care are relevant transmission opportunities; infection prevention remains important while the clinical team clarifies whether an isolate represents infection or carriage.", citationIDs: ["icu_evidence_cdc_crab"])
        ],
        commonInterventions: [
            .init("IDSA 2026 identifies sulbactam-durlobactam with imipenem or meropenem as the preferred treatment approach for invasive CRAB infection. The recommendation is a clinician-directed treatment strategy, not an indication to treat colonization.", citationIDs: ["icu_evidence_idsa2026"]),
            .init("The FDA label specifically covers adult hospital-acquired and ventilator-associated bacterial pneumonia caused by susceptible Acinetobacter baumannii-calcoaceticus complex. Other pathogens are outside this labeled pneumonia indication. The linked ATTACK guide distinguishes the trial population from broader guideline use.", citationIDs: ["icu_evidence_xacduro_label"])
        ],
        watchFor: [
            .init("Severe beta-lactam hypersensitivity is a labeled contraindication to sulbactam-durlobactam. Its warnings also include C. difficile-associated diarrhea and the risk of selecting resistant bacteria when antibacterial treatment is used without a supported indication.", citationIDs: ["icu_evidence_xacduro_label"])
        ],
        citations: [ICUEvidenceSources.idsa2026, ICUEvidenceSources.cdc_crab, ICUEvidenceSources.xacduro_label],
        lastSourceFidelityReview: "2026-09-19"
    )

    private static let entry15 = ReferenceEntry(
        id: "attack-trial-crab-treatment",
        title: "CRAB treatment evidence: ATTACK",
        subtitle: "Sulbactam–durlobactam · noninferiority, renal safety and scope",
        eyebrow: "REFERENCE · ICU EVIDENCE",
        nclexTags: .init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .infection),
        sections: [
            .bullets(title: "What the study actually compared", [
            .init("ATTACK randomized adults with serious Acinetobacter baumannii-calcoaceticus complex infections to sulbactam-durlobactam or colistin. Both groups received imipenem-cilastatin. Most patients had pneumonia; only five randomized patients had bloodstream infection. This was not a comparison of either study drug used alone.", citationIDs: ["icu_evidence_attack"]),
            .init("The primary efficacy population comprised 125 patients with laboratory-confirmed carbapenem-resistant isolates. Day-28 mortality was 19% versus 32%; the difference was −13.2 percentage points (95% CI −30.0 to 3.5). The study met its prespecified noninferiority criterion.", citationIDs: ["icu_evidence_attack"]),
            .init("The mortality confidence interval included no difference, so the numerical reduction must not be presented as proven superiority. Noninferiority means the result met the trial's chosen margin; it does not demonstrate that treatments are identical.", citationIDs: ["icu_evidence_attack"]),
            .init("Nephrotoxicity was lower with sulbactam-durlobactam: 13% versus 38% in the safety analysis. This is a different endpoint and analysis population from the primary mortality comparison. Small numbers outside pneumonia limit conclusions for other infection sites.", citationIDs: ["icu_evidence_attack"])
        ]),
            .bullets(title: "Applying the evidence to a defined indication", [
            .init("The current label restricts the approved indication to adult hospital-acquired or ventilator-associated pneumonia due to susceptible Acinetobacter baumannii-calcoaceticus complex. It does not provide general coverage of pneumonia from all Gram-negative organisms. Organism identity and susceptibility remain essential to interpretation.", citationIDs: ["icu_evidence_xacduro_label"]),
            .init("IDSA 2026 recommends the sulbactam-durlobactam plus carbapenem approach for invasive CRAB infections. It also notes that metallo-beta-lactamases or demonstrated sulbactam-durlobactam resistance change the treatment considerations. The favorable trial average should not override a resistant isolate.", citationIDs: ["icu_evidence_idsa2026"]),
            .init("The label warns about beta-lactam hypersensitivity and antibiotic-associated diarrhea. Lower nephrotoxicity than a colistin comparator does not mean absence of important drug risks. The linked drug entry preserves the primary-label contraindications and warnings.", citationIDs: ["icu_evidence_xacduro_label"])
        ])
        ],
        citations: [ICUEvidenceSources.attack, ICUEvidenceSources.xacduro_label, ICUEvidenceSources.idsa2026],
        lastSourceFidelityReview: "2026-09-19"
    )

#endif
}
